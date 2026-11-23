#!/usr/bin/env python3
"""Link every quoted key to its definition (DEC-00023).

usage: python3 link_keys.py [--check] <file or folder> ...   (run from the scratch root)

A quoted key is `TYPE-NNNNN`, `TYPE-pNN` or `KEY:section` in backticks. It becomes
[`KEY`](<url>), where <url> is, in this order:
  1. the anchor <a id="key"> that defines it (documents/, then drafts/, then the rest of scratch);
  2. the line that defines it in the file the registry names (blob/main/<file>?plain=1#L<n>);
  3. the registry's URL for it (an ISS key's GitHub issue), its folder (a CMP), or its registry line.
Never linked: the key's own definition line, headings, fenced code, a quote already in a link,
REGISTRY.md files. --check lists quotes it cannot resolve and changes nothing.

Startup files (DEC-00008): the files CLAUDE.md loads at session start cite keys and paths bare.
  --startup <file> ...                 fails an inline https link outside code (the file stays bare)
  --render <src> <out> [--addon <dir>] writes the linked copy for reading on GitHub: each quoted key
                                       linked as above, `scratch:<path>` to scratch, a quoted path that
                                       exists in the addon checkout <dir> to the addon repo, PR #n and
                                       #n to the addon repo's pull or issue
"""
import os, re, sys
BASE = "https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/"
REG = "documents/reference-framework/16_Registries/REGISTRY.md"
KEY = r"[A-Z]{3}-(?:\d{5}|p\d+)"
QUOTE = re.compile(r"(?<!\[)`(" + KEY + r")((?::[^`\s]*)?)`(?!\]\()")
def norm(a):
	return a[:3].upper() + a[3:]

ANCH = re.compile(r'<a id="([a-z]{3}-(?:\d{5}|p\d+))"></a>')

def md_files(root):
	for d, _, fs in os.walk(root):
		if "/.git" in d or "/reference" in d.replace("reference-framework", ""):
			continue
		for f in fs:
			if f.endswith(".md"):
				p = os.path.join(d, f)
				yield p[2:] if p.startswith("./") else p

def index():
	anchors = {}
	rank = lambda p: 0 if p.startswith("documents/") else 1 if p.startswith("drafts/") else 2
	for p in md_files("."):
		if p.startswith("history/") or p.endswith("REGISTRY.md"):
			continue
		try:
			s = open(p, encoding="utf-8").read()
		except UnicodeDecodeError:
			continue
		for m in ANCH.finditer(s):
			k = norm(m.group(1))
			if k not in anchors or rank(p) < rank(anchors[k][0]):
				anchors[k] = (p, m.group(1))
	reg = {}
	for line in open(REG, encoding="utf-8"):
		m = re.match(r"\| `(" + KEY + r")` \| `[^`]*` \| `([^`]*)` \|", line)
		if m:
			reg.setdefault(m.group(1), m.group(2))
	return anchors, reg

def target(k, anchors, reg):
	if k in anchors:
		p, a = anchors[k]
		return BASE + p + "#" + a
	f = reg.get(k)
	if not f:
		for n, line in enumerate(open(REG, encoding="utf-8"), 1):
			if "`" + k + "`" in line:
				return BASE + REG + "?plain=1#L" + str(n)
		return None
	if os.path.isdir(f):
		return BASE.replace("/blob/", "/tree/") + f.rstrip("/")
	if f.startswith("http"):
		return f
	if "#" in f:
		p, a = f.split("#", 1)
		return BASE + p + "#" + a if os.path.isfile(p) else None
	if os.path.isfile(f):
		pat = re.compile(r"^\s*(\|\s*)?(#+\s*)?(<a [^>]*></a>)?`?" + re.escape(k) + r"\b")
		for n, line in enumerate(open(f, encoding="utf-8"), 1):
			if pat.match(line):
				return BASE + f + "?plain=1#L" + str(n)
		return BASE + f
	return None

def link(path, anchors, reg, check):
	s = open(path, encoding="utf-8").read().split("\n")
	out, fence, miss = [], False, set()
	for line in s:
		if line.startswith("```"):
			fence = not fence
		if fence or line.startswith("#"):
			out.append(line); continue
		own = {norm(m.group(1)) for m in ANCH.finditer(line)}
		def rep(m):
			k = m.group(1)
			if k in own:
				return m.group(0)
			u = target(k, anchors, reg)
			if not u:
				miss.add(k); return m.group(0)
			return "[" + m.group(0) + "](" + u + ")"
		out.append(QUOTE.sub(rep, line))
	new = "\n".join(out)
	if not check and new != "\n".join(s):
		open(path, "w", encoding="utf-8").write(new)
	return miss

ADDON = "https://github.com/racetracks/wow-lfg-mesh/"
SPAN = re.compile(r"`[^`\n]*`")

def startup(path):
	bad = 0
	fence = False
	for n, line in enumerate(open(path, encoding="utf-8"), 1):
		if line.startswith("```"):
			fence = not fence
		if fence:
			continue
		if re.search(r"\]\(https?://", SPAN.sub("", line)):
			print("STARTUP %s:%d an inline link (cite the key or path bare, DEC-00008)" % (path, n))
			bad += 1
	return bad

def render(src, out, addon, anchors, reg):
	s = open(src, encoding="utf-8").read().split("\n")
	res, fence = [], False
	def path_link(m):
		t = m.group(0)
		inner = t[1:-1]
		if inner.startswith("scratch:"):
			p = inner[8:]
			base = BASE.replace("/blob/", "/tree/") if p.split("#")[0].endswith("/") or os.path.isdir(p.split("#")[0]) else BASE
			return "[`" + p + "`](" + base + p.rstrip("/") + ")"
		if addon and re.match(r"^[\w./-]+$", inner) and "/" in inner and os.path.exists(os.path.join(addon, inner.rstrip("/"))):
			kind = "tree" if os.path.isdir(os.path.join(addon, inner)) else "blob"
			return "[" + t + "](" + ADDON + kind + "/main/" + inner.rstrip("/") + ")"
		return t
	for line in s:
		if line.startswith("```"):
			fence = not fence
		if fence or line.startswith("@"):
			res.append(line); continue
		def rep(m):
			k = m.group(1)
			u = target(k, anchors, reg)
			return "[" + m.group(0) + "](" + u + ")" if u else m.group(0)
		parts = re.split(r"(`[^`\n]*`)", line)
		for i, p in enumerate(parts):
			if p.startswith("`") and p.endswith("`") and len(p) > 1:
				q = QUOTE.sub(rep, p)
				parts[i] = q if q != p else path_link(re.match(r"`.*`", p))
			else:
				p = re.sub(r"\bPR #(\d+)", lambda m: "[PR #" + m.group(1) + "](" + ADDON + "pull/" + m.group(1) + ")", p)
				p = re.sub(r"(?<![\[\w])#(\d{2,4})\b", lambda m: "[#" + m.group(1) + "](" + ADDON + "issues/" + m.group(1) + ")", p)
				parts[i] = p
		res.append("".join(parts))
	head = "<!-- generated by link_keys.py --render from %s; edit the source, never this copy (DEC-00008) -->" % os.path.basename(src)
	open(out, "w", encoding="utf-8").write(head + "\n" + "\n".join(res))

def main(a):
	if a and a[0] == "--startup":
		bad = sum(startup(p) for p in a[1:])
		print("link_keys startup:", bad, "inline link(s)")
		sys.exit(1 if bad else 0)
	if a and a[0] == "--render":
		addon = a[a.index("--addon") + 1] if "--addon" in a else None
		anchors, reg = index()
		render(a[1], a[2], addon, anchors, reg)
		print("link_keys: rendered", a[2])
		return
	check = "--check" in a
	a = [x for x in a if x != "--check"]
	anchors, reg = index()
	miss = {}
	for r in a:
		for p in ([r] if os.path.isfile(r) else md_files(r)):
			if not p.endswith("REGISTRY.md"):
				for k in link(p, anchors, reg, check):
					miss.setdefault(k, []).append(p)
	for k in sorted(miss):
		print("UNRESOLVED", k, len(miss[k]), "file(s)")
	print("link_keys:", len(miss), "unresolved")

if __name__ == "__main__":
	main(sys.argv[1:])
