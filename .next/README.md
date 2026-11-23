# .next: the next-session handoff

Purpose: where every session leaves the prompt and state for the next one, and the format of `NEXT.md` · owner the scratch criteria (`CLAUDE.md`) · status live · related [`DEC-00006`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00006) (PSS), addon [CLAUDE.md](https://github.com/racetracks/wow-lfg-mesh/blob/main/CLAUDE.md)

## Contents
- [Where](#where)
- [When](#when)
- [Format](#format)
- [Caps](#caps)
- [Changelog](#changelog)

## Where
| Path | Holds | Written |
| --- | --- | --- |
| [`.next/NEXT.md`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/.next/NEXT.md) | the newest `NEXT.md` of any session | copied from the session's own at every delivery |
| `temp/<YYYY>/<MM>/<DD>/<hh-mm-ss>-<Ddd>-<name>/.next/NEXT.md` | that session's latest iteration | overwritten at every delivery (git keeps the iterations) |

Every session temp root has a `.next/` folder holding `NEXT.md` only.

## When
1. **Session start:** the addon repo's SessionStart hook ([next_handoff.py](https://github.com/racetracks/wow-lfg-mesh/blob/main/.claude/scripts/next_handoff.py)) prints [`.next/NEXT.md`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/.next/NEXT.md) and the other sessions' handoffs of the last 24 h; no read needed. Pull scratch ([`DEC-00005`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00005)) before acting on it; the author's prompt wins where they differ.
2. **Every delivery** (each prompt that commits): rewrite the session's `.next/NEXT.md`, copy it over the root `.next/NEXT.md`, both in the delivery's commit.
3. A session that only answers (no commit) writes nothing.
4. **Checked:** `check_context.py` (in the rules check, outside CI) runs `next_handoff.py check` on the root copy and this session's own; a missing file, a wrong line 1 or 3, sections out of order or over the cap fails.
5. **Parallel sessions:** the root copy is the last writer's; the others stay in their temp roots and are listed in `## Parallel` (from the hook's list), so none is lost.

## Format
Fixed `##` anchors, in this order; a reader takes one section. Pointers, never payloads: `path:line`, `path#anchor`, PR and commit URLs; no copied code, diffs or rule text.

````
# NEXT: <one-line step name>

from <session name> · <YYYY-MM-DD hh:mm> UTC · status <ready|blocked|waiting> [(why)] · temp root <link>

## Prompt
```
<ready-to-paste prompt for the next session: the one step, its acceptance, the links it needs; <=10 lines>
```

## State
| Item | Value |
| --- | --- |
| Addon branch / PR | <branch>, <PR link> (<open|merged>, CI <green|red>) |
| Build | <X.Y.Z.B>, <zip link> |
| Scratch | <last commit link> |

## Done
- <=5 bullets, each with its link

## Next
1. <the one next step, with the pointers to read first>

## Open
| Key | What | Blocks | Recommended |
| --- | --- | --- | --- |

## Pitfalls
- <=5 bullets: what cost this session time, with its pointer; "None" if none

## Parallel
- <other sessions' handoffs from the start hook's list: time, session, step, link>; "None" if none
````

## Caps
- 60 lines at most; every section is self-contained; empty sections say "None".
- Current truth only: overwrite, never append; the temp `prompts/` log and git keep history.
- Keys are linked ([`DEC-00023`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00023)); every reference is a link ([`DEC-00002`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00002)).

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created from PSS scratch `.next/README.md` (format unchanged) | the author: apply the PSS handoff rules to wow-lfg-mesh | [prompt 01](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/01.md); before: new |
