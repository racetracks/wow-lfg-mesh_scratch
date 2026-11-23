# NEXT: stage 1, LFGMesh repo setup from the baseline templates

from intelligent-darwin-5smmqv · 2026-11-23 06:45 UTC · status waiting (merge of PR 1) · temp root [temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv)

## Prompt
```
Set up wow-lfg-mesh stage 1 per docs/baseline/08_PROJECT_LIFECYCLE.md: copy docs/baseline/templates/
(TOCs, tools/, .github/workflows/) under LFGMesh/ (ask the TOC Title, Notes, clients), write docs/mesh/01_HANDOVER.md,
update docs/mesh/06_STATUS_AND_NEXT.md; allocate the addon CMP and build its
scratch documents/addons/<folder>/ root set (documents/reference-framework/08_Operations.md). Read docs/baseline/02_RULES.md and docs/mesh/02_RULES.md in full first.
```

## State
| Item | Value |
| --- | --- |
| Addon branch / PR | claude/intelligent-darwin-5smmqv, [PR 1](https://github.com/racetracks/wow-lfg-mesh/pull/1) (open, no CI) |
| Build | None |
| Scratch | this commit |

## Done
- [status summary](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/summary/wow-lfg-mesh-2026-11-23-06-45.md): PR 1 handed over, LFGMesh named
- [framework report](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/framework/README.md): fresh registry, rules home [`DEC-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00001) to [`DEC-00053`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/00_Decisions.md#dec-00053), tools, documents tree
- [setup report](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/setup/README.md): CLAUDE.md, .claude/, docs/baseline/, docs/mesh/ on the addon repo; criteria and handoff on scratch

## Next
1. After the merge of PR 1: stage 1 as in the prompt (read docs/mesh/06_STATUS_AND_NEXT.md first).

## Open
| Key | What | Blocks | Recommended |
| --- | --- | --- | --- |
| - | TOC Title, Notes, clients | stage 1 | ask at stage start |

## Pitfalls
- `test_ledger_m1.py` fails until `.claude/README.md` is committed (index from git ls-files).

## Parallel
- None
