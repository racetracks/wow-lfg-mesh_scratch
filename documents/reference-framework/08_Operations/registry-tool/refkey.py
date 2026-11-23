#!/usr/bin/env python3
"""Reference keys (DEC-00037): allocate and check against REGISTRY.md.

  python3 refkey.py next TYPE              print the next key of TYPE
  python3 refkey.py alloc TYPE CMP FILE TITLE   register the next key, bump the counter
  python3 refkey.py retire OLD NEW CMP REFS REASON
                                           retire OLD (NEW = its replacement or -): allocate a RET key,
                                           mark OLD's ledger row, append the mapping (DEC-00039)
  python3 refkey.py check [ROOT]           fail on duplicates, counter drift, unregistered keys,
                                           a RET without its mapping or 00_References.md row
"""
import datetime, os, re, sys

HERE = os.path.dirname(os.path.abspath(__file__))


def _registry():
	# beside this script (docs/reference-framework/), or in 16_Registries/ once the script lives in
	# documents/reference-framework/08_Operations/registry-tool/ (DEC-00019, DEC-00018)
	for p in (os.path.join(HERE, "REGISTRY.md"), os.path.join(HERE, "..", "..", "16_Registries", "REGISTRY.md")):
		if os.path.isfile(p):
			return os.path.normpath(p)
	return os.path.join(HERE, "REGISTRY.md")


def _root():
	# the scratch checkout: the nearest folder above this script that holds .git
	d = HERE
	while os.path.dirname(d) != d:
		if os.path.exists(os.path.join(d, ".git")):
			return d
		d = os.path.dirname(d)
	return os.path.join(HERE, "..", "..")


REG = _registry()
KEY = re.compile(r"(?<!r-)\b([A-Z]{3})-(\d{5})\b")  # r-TYPE-NNNNN are proposal-only keys (temp/), never framework keys
COUNTER = re.compile(r"^\| `([A-Z]{3})` \| [^|]+ \| (\d{5}) \|$")
LEDGER = re.compile(r"^\| `([A-Z]{3})-(\d{5})` \| `(CMP-\d{5}|-)` \|")
RETIRE = re.compile(r"^\| `(RET-\d{5})` \| `([^`]+)` \| `([^`]+)` \| `(CMP-\d{5})` \| `([^`]+)` \|")


def load():
	with open(REG) as f:
		lines = f.read().split("\n")
	counters, ledger, retired = {}, [], []
	for i, line in enumerate(lines):
		m = RETIRE.match(line)
		if m:
			retired.append(m.groups())
			continue
		m = COUNTER.match(line)
		if m:
			counters[m.group(1)] = (int(m.group(2)), i)
		m = LEDGER.match(line)
		if m:
			ledger.append((m.group(1), int(m.group(2)), i))
	return lines, counters, ledger, retired


def fmt(t, n):
	return "%s-%05d" % (t, n)


def check(root):
	lines, counters, ledger, retired = load()
	bad, seen = [], set()
	for t, n, _ in ledger:
		if t not in counters:
			bad.append("unknown type " + fmt(t, n))
		if (t, n) in seen:
			bad.append("duplicate " + fmt(t, n))
		seen.add((t, n))
	for t, (nxt, _) in counters.items():
		got = sorted(n for tt, n, _ in ledger if tt == t)
		if got != list(range(1, len(got) + 1)):
			bad.append("gap or order in %s: %s" % (t, got))
		if nxt != len(got) + 1:
			bad.append("counter %s says %05d, ledger needs %05d" % (t, nxt, len(got) + 1))
	keys = dict((fmt(t, n), i) for t, n, i in ledger)
	rets = set(r[0] for r in retired)
	for t, n, _ in ledger:
		if t == "RET" and fmt(t, n) not in rets:
			bad.append("no mapping row for " + fmt(t, n))
	for ret, old, new, cmp_key, refs in retired:
		if ret not in keys:
			bad.append("mapping row for unregistered " + ret)
		for k in (old, new):
			if KEY.fullmatch(k) and k.split("-")[0] in counters and k not in keys:
				bad.append("%s maps unregistered %s" % (ret, k))
		if KEY.fullmatch(old) and old in keys and "(retired, %s)" % ret not in lines[keys[old]]:
			bad.append("%s: ledger row of %s not marked retired" % (ret, old))
		p = os.path.join(root, refs)
		if not os.path.isfile(p) or ret not in open(p, errors="replace").read():
			bad.append("%s missing from %s" % (ret, refs))
	for dp, dn, fn in os.walk(root):
		dn[:] = [d for d in dn if d not in (".git", "reference")]
		for name in fn:
			if not name.endswith(".md"):
				continue
			p = os.path.join(dp, name)
			with open(p, errors="replace") as f:
				for k, (t, n) in enumerate(KEY.findall(f.read())):
					if t in counters and (t, int(n)) not in seen:
						bad.append("unregistered %s in %s" % (fmt(t, int(n)), os.path.relpath(p, root)))
	for b in bad:
		print("FAIL", b)
	print("refkey check: %d types, %d keys, %d problems" % (len(counters), len(ledger), len(bad)))
	return 1 if bad else 0


def alloc(t, cmp_key, path, title):
	lines, counters, ledger, _ = load()
	if t not in counters:
		sys.exit("unknown type " + t)
	nxt, ci = counters[t]
	key = fmt(t, nxt)
	if t == "CMP":
		cmp_key = key
	row = "| `%s` | `%s` | `%s` | %s | %s |" % (key, cmp_key, path, title, datetime.date.today().isoformat())
	last = max([i for _, _, i in ledger] or [len(lines) - 1])
	lines.insert(last + 1, row)
	lines[ci] = re.sub(r"\| \d{5} \|$", "| %05d |" % (nxt + 1), lines[ci])
	with open(REG, "w") as f:
		f.write("\n".join(lines))
	return key


def retire(old, new, cmp_key, refs, reason):
	lines, counters, ledger, retired = load()
	keys = dict((fmt(t, n), i) for t, n, i in ledger)
	if old in [r[1] for r in retired]:
		sys.exit(old + " is already retired")
	if KEY.fullmatch(old) and old.split("-")[0] in counters and old not in keys:
		sys.exit("unregistered " + old)
	if new != "-" and KEY.fullmatch(new) and new not in keys:
		sys.exit("allocate the replacement first: " + new)
	key = alloc("RET", cmp_key, refs, "%s -> %s: %s" % (old, new, reason))
	lines = load()[0]
	if old in keys:
		i = keys[old]
		lines[i] = re.sub(r" \| (\d{4}-\d{2}-\d{2}) \|$", r" (retired, %s) | \1 |" % key, lines[i])
	row = "| `%s` | `%s` | `%s` | `%s` | `%s` | %s | %s |" % (key, old, new, cmp_key, refs, reason, datetime.date.today().isoformat())
	at = [i for i, l in enumerate(lines) if RETIRE.match(l)]
	if at:
		lines.insert(at[-1] + 1, row)
	else:
		h = lines.index("## Retirements (`RET`, `DEC-00039`)")
		h = lines.index("| --- | --- | --- | --- | --- | --- | --- |", h)
		lines.insert(h + 1, row)
	with open(REG, "w") as f:
		f.write("\n".join(lines))
	return key


if __name__ == "__main__":
	a = sys.argv[1:]
	if a[:1] == ["next"] and len(a) == 2:
		print(fmt(a[1], load()[1][a[1]][0]))
	elif a[:1] == ["alloc"] and len(a) == 5:
		print(alloc(*a[1:]))
	elif a[:1] == ["retire"] and len(a) == 6:
		print(retire(*a[1:]))
	elif a[:1] == ["check"]:
		sys.exit(check(a[1] if len(a) > 1 else _root()))
	else:
		sys.exit(__doc__)
