# NEXT: the author names the addon, then stage 1 (repo setup from the baseline templates)

from intelligent-darwin-5smmqv · 2026-11-23 06:40 UTC · status waiting (the author's answers) · temp root [temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv)

## Prompt
```
Set up wow-lfg-mesh stage 1 per docs/baseline/08_PROJECT_LIFECYCLE.md: copy docs/baseline/templates/
(TOCs, tools/, .github/workflows/) under the addon folder the author named, write docs/mesh/01_HANDOVER.md,
update docs/mesh/06_STATUS_AND_NEXT.md. Read docs/baseline/02_RULES.md and docs/mesh/02_RULES.md in full first.
```

## State
| Item | Value |
| --- | --- |
| Addon branch / PR | claude/intelligent-darwin-5smmqv, no PR |
| Build | None |
| Scratch | this commit |

## Done
- [setup report](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/setup/README.md): CLAUDE.md, .claude/, docs/baseline/, docs/mesh/ on the addon repo; criteria and handoff on scratch

## Next
1. The author answers the open questions below; then stage 1 as in the prompt.

## Open
| Key | What | Blocks | Recommended |
| --- | --- | --- | --- |
| - | addon name, folder, purpose, clients | stage 1 | folder `LFGMesh`, prefix `LFGM_` |
| - | key registry of its own | keyed docs | cite PSS keys until the first design |

## Pitfalls
- `test_ledger_m1.py` fails until `.claude/README.md` is committed (index from git ls-files).

## Parallel
- None
