# 00_Decisions: reference framework (`CMP-00001`)

Purpose: what waits on the author, open decisions and decisions made ([`DEC-00024`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00024)) · owner reference framework ([`CMP-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/documents/reference-framework)) · last updated session intelligent-darwin-5smmqv, prompt 02 · status live · related `16_Registries/REGISTRY.md`, `12_User_Guides/12_02_Documentation_Rules.md`

## Contents
- [1. Waiting on the author](#1-waiting-on-the-author)
- [2. Open decisions](#2-open-decisions)
- [3. Decisions made](#3-decisions-made)
- [Changelog](#changelog)

## 1. Waiting on the author
| Key | What we need | Where it is explained | Blocks |
| --- | --- | --- | --- |
| - | the addon's name, folder and purpose (proposed folder `LFGMesh`) | addon repo `docs/mesh/06_STATUS_AND_NEXT.md` | `documents/addons/<folder>/`, the first `CMP` after [`CMP-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/documents/reference-framework) |
| - | OK to push this scratch repo to `main` (the session may only push its branch) | `CLAUDE.md` rule 11 | every `blob/main` link |

## 2. Open decisions
| Key | Question | Options | Recommended | Built on meanwhile | Context |
| --- | --- | --- | --- | --- | --- |
| - | Port the PSS code map (`documents/code-map/`, its generator) now or at the first code? | now; at the first code | at the first code (nothing to map) | not ported | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) |

## 3. Decisions made
| Key | Decision | Answer | Date | Source | Context |
| --- | --- | --- | --- | --- | --- |
| <a id="dec-00048"></a>`DEC-00048` | **Fresh start:** this project keeps its own registry from `00001` for every type; no key of another project is registered or quoted in key form (PSS keys appear only as links in `00_References.md`, written "PSS DEC 00067"); PSS legacy series and the old `docs/components/` layout are not carried over | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | ported rules keep their meaning under new keys |
| <a id="dec-00049"></a>`DEC-00049` | **engineer-m1 on Haiku** for `WL` work (by script); a BUDGET or failed acceptance is re-run once on `engineer` (Sonnet); BLOCKED goes to its consultant (the addon repo agent pack, `.claude/`) | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | ported from [PSS DEC 00389](https://github.com/racetracks/Pour-Social-Score_Scratch/blob/main/documents/reference-framework/00_Decisions.md) |
| <a id="dec-00050"></a>`DEC-00050` | **Stage close** is T1: the coordinator runs `tools/stage_close.sh <scratch checkout>` once a stage's streams are DONE (real-save run, hosted zip, rendered README) (the addon repo agent pack, `.claude/`) | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | ported from [PSS DEC 00390](https://github.com/racetracks/Pour-Social-Score_Scratch/blob/main/documents/reference-framework/00_Decisions.md) |
| <a id="dec-00051"></a>`DEC-00051` | **Token measurement:** `ledger.py render` records each agent's tokens and estimated cost from transcripts (`## Tokens`); cost cuts are judged on measured numbers (the addon repo agent pack, `.claude/`) | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | ported from [PSS DEC 00391](https://github.com/racetracks/Pour-Social-Score_Scratch/blob/main/documents/reference-framework/00_Decisions.md) |
| <a id="dec-00052"></a>`DEC-00052` | **M1 lane:** peel a mechanical tail out of an M2 task into its own `WL` row only at about 6 or more calls; one M1 spawn per stream (the addon repo agent pack, `.claude/`) | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | ported from [PSS DEC 00392](https://github.com/racetracks/Pour-Social-Score_Scratch/blob/main/documents/reference-framework/00_Decisions.md) |
| <a id="dec-00053"></a>`DEC-00053` | **Execution packs:** consultant plan mode writes the pack; `ledger.py init --pack` refuses a stale plan; `ledger.py spawn` checks each brief by class (the addon repo agent pack, `.claude/`) | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | ported from [PSS DEC 00394](https://github.com/racetracks/Pour-Social-Score_Scratch/blob/main/documents/reference-framework/00_Decisions.md) |
| [`DEC-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00001) to [`DEC-00047`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00047) | the PSS documentation, interaction and naming rules, ported as defined in `12_User_Guides/12_02_Documentation_Rules.md` | yes | 2026-11-23 | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md) | mapping: `00_References.md` |

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created | the author: fresh start with the PSS rules | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md); before: new |
