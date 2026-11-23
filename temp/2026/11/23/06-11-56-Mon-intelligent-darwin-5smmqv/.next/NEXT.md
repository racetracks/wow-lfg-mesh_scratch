# NEXT: finish stage 1 (harness, 01_HANDOVER) after PR 1 merges

from intelligent-darwin-5smmqv · 2026-11-23 06:50 UTC · status waiting (merge of PR 1) · temp root [temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv)

## Prompt
```
Finish wow-lfg-mesh stage 1 per docs/mesh/06_STATUS_AND_NEXT.md: the offline harness from
docs/baseline/examples/ (wow_stub.lua, run.lua) under tools/harness/, wired into check_rules.sh,
and docs/mesh/01_HANDOVER.md. Read docs/baseline/02_RULES.md, docs/mesh/02_RULES.md in full first.
Ask the TOC Title, Notes and clients first if still unanswered.
```

## State
| Item | Value |
| --- | --- |
| Addon branch / PR | claude/intelligent-darwin-5smmqv, [PR 1](https://github.com/racetracks/wow-lfg-mesh/pull/1) (open, no CI) |
| Build | 1.0.0.1, [test zip](https://github.com/racetracks/wow-lfg-mesh_scratch/raw/main/releases/LFGMesh-1.0.0.1-2026-11-23-06-47.zip) |
| Scratch | this commit |

## Done
- 1.0.0.1: build and release pipeline, zips hold the addon folders only ([build report](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/build/README.md))
- [status summary](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/summary/wow-lfg-mesh-2026-11-23-06-50.md): PR 1 handed over, LFGMesh named
- [framework report](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/framework/README.md): fresh registry, rules home [`DEC-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00001) to [`DEC-00053`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/00_Decisions.md#dec-00053), tools, documents tree
- [setup report](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/setup/README.md): CLAUDE.md, .claude/, docs/baseline/, docs/mesh/ on the addon repo; criteria and handoff on scratch

## Next
1. After the merge of PR 1 (check the Release run published v1.0.0.1 as a pre-release): the prompt above.

## Open
| Key | What | Blocks | Recommended |
| --- | --- | --- | --- |
| - | TOC Title, Notes, clients | stage 1 | ask at stage start |

## Pitfalls
- A grep with no file arguments reads stdin and hangs the rules check: give it /dev/null (tools/check_rules.sh:28).

## Parallel
- None
