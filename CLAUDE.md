# CLAUDE.md: scratch repo criteria

This repo is the **scratch repo** of `racetracks/wow-lfg-mesh`: the private file host for that addon's Claude work (test builds, documentation and handover packs, SavedVariables, summaries, next-session handoffs). It is not an addon/source repo. Carried over from `racetracks/Pour-Social-Score_Scratch` `CLAUDE.md` (the author, 2026-11-23); keys such as `DEC-00070` are the PSS registry's and name where a rule came from.

- **Scratch repo:** `racetracks/wow-lfg-mesh_scratch`, branch `main`
- **Addon repo:** `racetracks/wow-lfg-mesh` (its `CLAUDE.md` holds the operating core, the agent budgets and the addon rules)
- Whenever any project, pack or instruction of wow-lfg-mesh says "scratch", it means this repo.
- **This repo is the project files:** saves, plans, docs, test zips and summaries all live here; there is no other copy.
- **SavedVariables location:** `SavedVariables/<version>/` in this repo.

## Requirements for every interaction with the AI (from PSS `DEC-00070`)
The requirements (`DEC-00067` every output recorded in the session temp root, `DEC-00068` everything referenced has a link) are worded once, in the addon repo `CLAUDE.md` section of the same name (`racetracks/wow-lfg-mesh`, branch `main`), and apply here as written there.

## Documentation rules
- As in the addon repo `CLAUDE.md` section "Documentation rules": the PSS Mandatory Documentation Requirements apply to every document except `temp/`, without the key registry steps until this project has its own registry (`documents/registry/`).
- **This session's temp root (`DEC-00061`, `DEC-00259`):** `temp/<YYYY>/<MM>/<DD>/<hh-mm-ss>-<Ddd>-<name>/`, the UTC date and time of the session's first prompt, `<name>` the session's development branch without `claude/`; every output is recorded there (`DEC-00067`).

## Links (always reply with links, never only a path)
| Purpose | Form |
| --- | --- |
| Download a file | `https://github.com/racetracks/wow-lfg-mesh_scratch/raw/main/<path>` |
| Read a file in the browser | `https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/<path>` |
| Browse a folder | `https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/<path>` |

The repo is private; links work for the author while signed in to GitHub.

## Mandatory top-level folders
Each must exist and carry a README.md describing it (read it "when confused").

```
readme.md                      the index: one line per folder, newest file named
CLAUDE.md                      these criteria
SavedVariables/<version>/      the author's real WTF saves, by the version that wrote them (*.lua)
releases/                      every pre-release test/dev/bugfix zip, versioned and dated
latest/                        the single newest test zip (copy of the newest in releases/)
docs/                          project documentation, handover packs, plans, issue notes
  <name>-<date>-vN.zip         every docs release, zipped, kept in docs/ root (history)
  <project-or-feature>/        history folder per project/feature release
  latest/<project-or-feature>/ the newest markdown, unzipped, readable in the browser
summary/                       short status summaries of projects/sessions
documents/                     approved documentation (registry/ waits for the author)
drafts/                        drafts for the author to review
history/<addon|feature|project>/YYYY-MM-DD-<folder>/   retired documentation and promoted drafts
temp/<YYYY>/<MM>/<DD>/<hh-mm-ss>-<Ddd>-<workspace>/   workspace memory; root README.md never deleted
  .next/NEXT.md                that session's latest next-session handoff (DEC-00398)
.next/NEXT.md                  the newest handoff of any session; read first at session start (format: .next/README.md)
```

## Rules (set by the author, carried over from PSS)
1. **Use scratch for hosting** test zips, handover packs, documentation and SavedVariables.
2. **Human-readable folders:** plain words; dates as `YYYY-MM-DD-hh-mm`; versions in file names.
3. **Version everything hosted:** builds by version, packs by `<date>-vN`, saves by the version that wrote them.
4. **`SavedVariables/`, `releases/`, `docs/`, `summary/` and `latest/`** must exist.
5. **Test zips go in `releases/`:** the newest zip goes in `latest/`, and at the same time a versioned, dated copy goes in the root of `releases/` (`<Name>-<version>-<YYYY-MM-DD-hh-mm>.zip`).
6. **Docs go in `docs/`:** the newest markdown lives in `docs/latest/<project-or-feature>/`; a project or feature release also gets a child folder in the root of `docs/` for its history; every docs release is zipped and stored in the root of `docs/`.
7. **A description README** in every top folder the author may come back to.
8. **Bugfix builds are hosted** like any build: the next build number (`X.Y.Z.B`), zipped, on scratch, with a link.
9. **Real saves live here, never in the addon repo**, under `SavedVariables/<version>/`.
10. **Always reply with links**, never only a path.
11. **No pull requests on this repo:** commit and push straight to `main`, even when a session is given a working branch for it. If a PR is requested for scratch work, it is opened in `racetracks/wow-lfg-mesh` instead.
12. **Next-session handoff (`DEC-00398`):** at every delivery that commits, the session overwrites its temp root's `.next/NEXT.md` and copies it over `.next/NEXT.md`, in the delivery's commit; format and caps in `.next/README.md`. The addon repo's SessionStart hook prints it; a session that only answers writes nothing.

## Working practice
- **At the start of every session pull fresh** (`DEC-00053`); pull once per session; other threads push here, so a push that is refused is pulled and retried.
- One commit per delivery, message naming the thing and its version; push to `main`. If the checkout is on another branch, `git checkout main` first.
- Before every docs commit run `python3 .claude/scripts/check_context.py` in the addon checkout (it checks the handoff here); it must print nothing.
- Build zips in a fresh, uniquely named directory; don't `rm -rf` globs.
- Update `readme.md` (the index) whenever a folder is added or the newest file in it changes.
- Never delete or rename a file someone was given a link to; add the new one beside it.
- Never host secrets/credentials, source that belongs in the addon repo, or files over 100 MB.
