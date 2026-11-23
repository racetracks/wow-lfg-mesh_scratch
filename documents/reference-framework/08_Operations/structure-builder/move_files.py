#!/usr/bin/env python3
"""Move single documents into a documentation folder and repoint every live link (DEC-00030).

usage: python3 move_files.py <new folder> "<context>" <file> ...   (run from the scratch root)
Each file is moved with git mv, a one-line pointer stub is left at its old path, and every live
markdown link to it is repointed. Never rewritten: history/, temp/, changelogs, commit-pinned
links (/blob/<sha>/..., DEC-00026). Test on a separate clone first (DEC-00032 step 4).
"""
import datetime, os, re, subprocess, sys
U = "https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/"

def repoint(pairs):
	files = subprocess.run(["git", "ls-files", "*.md"], capture_output=True, text=True).stdout.split("\n")
	old = {o for o, _ in pairs}
	for f in files:
		if not f or f.startswith(("history/", "temp/")) or f.endswith("Changelog.md") or f in old:
			continue
		s = open(f, encoding="utf-8").read(); t = s
		for o, n in pairs:
			t = re.sub(r"(?<![0-9a-f]{40}/)" + re.escape(o), n, t)
		if t != s:
			open(f, "w", encoding="utf-8").write(t)

def main(a):
	new, ctx, files = a[0].rstrip("/"), a[1], a[2:]
	os.makedirs(new, exist_ok=True)
	pairs = []
	for f in files:
		n = new + "/" + os.path.basename(f)
		subprocess.run(["git", "mv", f, n], check=True)
		open(f, "w").write("# Moved\n\nMoved on %s to [%s](%s%s) (DEC-00030; %s).\n" % (datetime.date.today(), n, U, n, ctx))
		pairs.append((f, n))
	subprocess.run(["git", "add", "-A"] + files, check=True)
	repoint(pairs)
	print("moved", len(pairs), "file(s) to", new)

if __name__ == "__main__":
	main(sys.argv[1:])
