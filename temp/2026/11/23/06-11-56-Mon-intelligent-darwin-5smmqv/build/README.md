# Build: the build and release pipeline, first build 1.0.0.1

Purpose: what prompt 04 delivered · owner this session · status delivered · related [prompt 04](../prompts/04.md), [05_RELEASE.md](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/docs/mesh/05_RELEASE.md)

## Contents
- [Done](#done)
- [Tests run](#tests-run)
- [Decisions for you](#decisions-for-you)
- [Decisions made (this session's context)](#decisions-made-this-sessions-context)
- [Recent prompts](#recent-prompts)
- [References](#references)

## Done
| What | Where |
| --- | --- |
| One zip builder for release and test zips: committed `LFGMesh/`, `LFGMesh_*/` only, plus readme and history; every entry checked, anything else refused | [tools/build_zip.sh](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/tools/build_zip.sh) |
| Release on push to main, after the rules check: pre-release or latest from `versions.json`, no mirror | [release.yml](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/.github/workflows/release.yml) |
| Version bumps (build, release, line, pr), versions file, rules check with rule 8 (the zip), test-zip hosting | [tools/](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/tools) |
| Empty addon that loads, TOC set, history, readme, `versions.json` (1.0.0.1, PR 1) | [LFGMesh/](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/LFGMesh) |
| Template bug fixed: two `grep`s in the rules check read stdin when there are no `.xml` files | [check_rules.sh](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/tools/check_rules.sh) |
| Test zip 1.0.0.1 | [LFGMesh-1.0.0.1-2026-11-23-06-47.zip](https://github.com/racetracks/wow-lfg-mesh_scratch/raw/main/releases/LFGMesh-1.0.0.1-2026-11-23-06-47.zip) |

## Tests run
| Test | Result |
| --- | --- |
| `check_rules.sh`, local and CI mode (`CI=1 PR_NUMBER=1`) | All rule checks passed |
| zip contents | 6 files, all under `LFGMesh/` |
| an untracked file in `LFGMesh/` | not in the zip |
| a committed `LFGMesh/notes.md` and `LFGMesh/.hidden/a.lua` | refused, exit 1, no zip left |
| `bump_version.sh build`, then `release` (on a clone) | 1.0.0.2 pre-release, 1.0.0.3 release and latest; placeholder bullet caught |

GitHub Actions has not run yet (the workflows arrive with PR 1).

## Decisions for you
| Key | Question | Options | Recommended | Built on meanwhile |
| --- | --- | --- | --- | --- |
| - | TOC Title and Notes | your wording | your wording | `LFGMesh`, "Looking-for-group mesh: finds LFG listings across LFG shards." |
| - | Clients | Retail, Camelot, others | the template's Retail 120007 and Camelot 16001 | those two |

Also waiting on you (not decisions): merge [PR 1](https://github.com/racetracks/wow-lfg-mesh/pull/1), which publishes 1.0.0.1 as a pre-release.

## Decisions made (this session's context)
| Key | Decision | Date | Source |
| --- | --- | --- | --- |
| - | no mirror repo; release waits on the rules check | 2026-11-23 | [prompt 04](../prompts/04.md) |

## Recent prompts
| # | Prompt | Answer | Output |
| --- | --- | --- | --- |
| [03][p3] | yes; recommendations; purpose | scratch on main, PR 1, LFGMesh folder | [summary][o3] |
| [04][p4] | port the build logic | pipeline and 1.0.0.1 on PR 1, test zip hosted | [build][o4] |

## References
| Reference | Title | Link |
| --- | --- | --- |
| PR 1 | setup and 1.0.0.1 | [https://github.com/racetracks/wow-lfg-mesh/pull/1](https://github.com/racetracks/wow-lfg-mesh/pull/1) |
| 05_RELEASE.md | the pipeline | [05_RELEASE.md](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/docs/mesh/05_RELEASE.md) |
| test zip | 1.0.0.1 | [LFGMesh-1.0.0.1-2026-11-23-06-47.zip](https://github.com/racetracks/wow-lfg-mesh_scratch/raw/main/releases/LFGMesh-1.0.0.1-2026-11-23-06-47.zip) |

[p3]: ../prompts/03.md
[p4]: ../prompts/04.md
[o3]: ../../../../../../summary/wow-lfg-mesh-2026-11-23-06-45.md
[o4]: README.md
