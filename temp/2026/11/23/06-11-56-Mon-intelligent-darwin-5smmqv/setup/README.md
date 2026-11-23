# Setup: PSS operating rules applied to wow-lfg-mesh

Purpose: what was carried over from PSS and where it lives · owner this session · status delivered · related [prompt 01](../prompts/01.md)

## Addon repo (branch `claude/intelligent-darwin-5smmqv`)
| Item | From PSS | Where |
| --- | --- | --- |
| Operating core, token rules, roles, budgets, session layout | `CLAUDE.md` lines 1 to 78, unchanged | [CLAUDE.md](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/CLAUDE.md) |
| Project section (requirements, layers, read-before-acting, docs rules, every session) | `CLAUDE.md` lines 79 to 117, adapted | [CLAUDE.md](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/CLAUDE.md) |
| Agent pack: agents, roles, ledger, checks, hooks, tests | `.claude/`, `TASK.template.md`; paths moved to `docs/mesh/`, scratch `wow-lfg-mesh_scratch`, env `MESH_*`, code globs `LFGMesh*` | [.claude/](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/.claude), [TASK.template.md](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/TASK.template.md) |
| WoW addon baseline v9 | `docs/baseline/`, unchanged | [docs/baseline/](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/docs/baseline) |
| Addon pack | `docs/pss/` 02, 06, 11, 15, 17, PSS-only content dropped | [docs/mesh/](https://github.com/racetracks/wow-lfg-mesh/blob/claude/intelligent-darwin-5smmqv/docs/mesh) |

## Scratch repo
| Item | Where |
| --- | --- |
| Scratch criteria | [CLAUDE.md](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/CLAUDE.md) |
| Handoff format | [.next/README.md](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/.next/README.md) |
| Handoff | [.next/NEXT.md](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/.next/NEXT.md) |
| Index and folder READMEs | [readme.md](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/readme.md) |

## Checks run
- Pack tests: `test_ledger_index` 6, `test_ledger_pack` 22, `test_ledger_plan` 24, `test_ledger_reentry` 14, `test_next_handoff`, `test_ledger_m1` all OK (m1 needs the files committed).
- `check_context.py` (sizes: startup 20 KB of 30) and `sync-token-rules.py --check` clean.
