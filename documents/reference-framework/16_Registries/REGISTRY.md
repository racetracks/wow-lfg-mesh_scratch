# REGISTRY: every reference type, its next integer, every key handed out

The one source of truth for reference keys of wow-lfg-mesh (`DEC-00037`). Never edit by hand except to fix a title: allocate with `python3 documents/reference-framework/08_Operations/registry-tool/refkey.py alloc <TYPE> <CMP-key> <file> "<title>"`, check with `refkey.py check`, and commit to scratch `main` before the key is used anywhere. Started fresh on 2026-11-23: no key of another project is registered here.

## Counters (the next integer of each type)
| Type | Meaning | Next |
| --- | --- | --- |
| `CMP` | Component (one documentation folder under `documents/`) | 00002 |
| `ARC` | Architecture document | 00002 |
| `HLD` | High level design document | 00002 |
| `DDS` | Detailed design document | 00002 |
| `IMP` | Implementation plan document | 00001 |
| `STP` | Implementation step (one row of a plan) | 00001 |
| `ISS` | Issue (GitHub number in the title) | 00001 |
| `APX` | Appendix document (a component's key index) | 00002 |
| `SAV` | SavedVariables decision (key, layout, migration, cap) | 00001 |
| `DEC` | Decision (a numbered fork and its answer, or a rule) | 00054 |
| `TST` | Test (harness check, phase or run) | 00007 |
| `CHK` | In-game check | 00001 |
| `BLD` | Build record (one build of the addon) | 00001 |
| `RET` | Retirement (an old key, its replacement or none, the reason) | 00001 |

## Ledger
| Key | Component | File | Title | Allocated |
| --- | --- | --- | --- | --- |

## Retirements (`RET`, `DEC-00039`)
| Key | Old | New | Component | References file | Reason | Retired |
| --- | --- | --- | --- | --- | --- | --- |

| `CMP-00001` | `CMP-00001` | `documents/reference-framework/` | Reference framework | 2026-11-23 |
| `APX-00001` | `CMP-00001` | `documents/reference-framework/00_Appendix.md` | Reference framework appendix | 2026-11-23 |
| `HLD-00001` | `CMP-00001` | `documents/reference-framework/04_High_Level_Design.md` | Reference framework high level design | 2026-11-23 |
| `DDS-00001` | `CMP-00001` | `documents/reference-framework/05_Detailed_Design.md` | Reference framework detailed design | 2026-11-23 |
| `ARC-00001` | `CMP-00001` | `documents/reference-framework/06_Architecture.md` | Reference framework architecture | 2026-11-23 |
| `DEC-00001` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Every session output recorded in the session temp root | 2026-11-23 |
| `DEC-00002` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Anything referenced always has a link | 2026-11-23 |
| `DEC-00003` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Interaction requirements apply to every prompt, reply and output | 2026-11-23 |
| `DEC-00004` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Session temp root temp/YYYY/MM/DD/hh-mm-ss-Ddd-name | 2026-11-23 |
| `DEC-00005` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Fetch fresh repos at session start, refkey check after pull | 2026-11-23 |
| `DEC-00006` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Next-session handoff .next/NEXT.md on scratch | 2026-11-23 |
| `DEC-00007` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Documentation rules have one home | 2026-11-23 |
| `DEC-00008` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Startup files cite keys bare; linked copy rendered | 2026-11-23 |
| `DEC-00009` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Agent-ready output | 2026-11-23 |
| `DEC-00010` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Context caps; every code change carries its documentation | 2026-11-23 |
| `DEC-00011` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | The one exception: temp/ | 2026-11-23 |
| `DEC-00012` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Root set for every major capability | 2026-11-23 |
| `DEC-00013` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Whole root set every time, keys allocated first | 2026-11-23 |
| `DEC-00014` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Documents are not databases; registries only in 16_Registries | 2026-11-23 |
| `DEC-00015` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Locations: documents/ approved, drafts/ in own folders | 2026-11-23 |
| `DEC-00016` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | claude.local.md in every folder, rules 1 to 4 | 2026-11-23 |
| `DEC-00017` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Layout documents/addons, features, sub-features | 2026-11-23 |
| `DEC-00018` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Scripts in 08_Operations/<purpose>/ | 2026-11-23 |
| `DEC-00019` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Reference framework lives in documents/reference-framework/ | 2026-11-23 |
| `DEC-00020` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Changelog in every document | 2026-11-23 |
| `DEC-00021` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | claude.local.md rules 5 to 7: changelog, cite context, promotion watch | 2026-11-23 |
| `DEC-00022` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Prompt log and stakeholder inputs | 2026-11-23 |
| `DEC-00023` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Linked keys (link_keys.py) | 2026-11-23 |
| `DEC-00024` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Decisions document 00_Decisions.md in every folder | 2026-11-23 |
| `DEC-00025` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Current temp READMEs with decisions | 2026-11-23 |
| `DEC-00026` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Changelog before link | 2026-11-23 |
| `DEC-00027` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Session context in references files | 2026-11-23 |
| `DEC-00028` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Header block on every document | 2026-11-23 |
| `DEC-00029` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Drafts, documents and history share one layout | 2026-11-23 |
| `DEC-00030` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Retire to history with pointers left | 2026-11-23 |
| `DEC-00031` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Key anchors | 2026-11-23 |
| `DEC-00032` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | How documentation work is run (ten steps) | 2026-11-23 |
| `DEC-00033` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Credit other developers | 2026-11-23 |
| `DEC-00034` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Build structure with the scripts | 2026-11-23 |
| `DEC-00035` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Every numbered item has a framework key; TYPE-pNN until approved | 2026-11-23 |
| `DEC-00036` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Key shape TYPE-NNNNN and the fourteen types | 2026-11-23 |
| `DEC-00037` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | The registry is the only source of the next integer | 2026-11-23 |
| `DEC-00038` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Every folder carries 00_Appendix.md and 00_References.md | 2026-11-23 |
| `DEC-00039` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Retire, never delete (RET) | 2026-11-23 |
| `DEC-00040` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | A summary is a document | 2026-11-23 |
| `DEC-00041` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Summaries end with a references table | 2026-11-23 |
| `DEC-00042` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Table of contents in every summary, report and document | 2026-11-23 |
| `DEC-00043` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Graphs in every summary and report | 2026-11-23 |
| `DEC-00044` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | A key is defined once; the addon repo never holds a registry | 2026-11-23 |
| `DEC-00045` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Each output its own subfolder; summaries end with a prompt table | 2026-11-23 |
| `DEC-00046` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | A project status summary for every PR | 2026-11-23 |
| `DEC-00047` | `CMP-00001` | `documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md` | Naming conventions | 2026-11-23 |
| `DEC-00048` | `CMP-00001` | `documents/reference-framework/00_Decisions.md` | Fresh start: own registry from 00001, other projects' keys never quoted as keys | 2026-11-23 |
| `TST-00001` | `CMP-00001` | `documents/reference-framework/15_Tests.md` | refkey check: no duplicate, gap or counter drift | 2026-11-23 |
| `TST-00002` | `CMP-00001` | `documents/reference-framework/15_Tests.md` | refkey check: every key in scratch markdown is registered | 2026-11-23 |
| `TST-00003` | `CMP-00001` | `documents/reference-framework/15_Tests.md` | refkey alloc on a copy bumps the counter and appends one row | 2026-11-23 |
| `TST-00004` | `CMP-00001` | `documents/reference-framework/15_Tests.md` | refkey retire on a copy: RET key, mapping row, old row marked, check passes | 2026-11-23 |
| `TST-00005` | `CMP-00001` | `documents/reference-framework/15_Tests.md` | refkey check fails a RET missing from its 00_References.md | 2026-11-23 |
| `TST-00006` | `CMP-00001` | `documents/reference-framework/15_Tests.md` | link_keys.py --check reports 0 unresolved | 2026-11-23 |
| `DEC-00049` | `CMP-00001` | `documents/reference-framework/00_Decisions.md` | engineer-m1 on Haiku for WL work, one Sonnet re-run | 2026-11-23 |
| `DEC-00050` | `CMP-00001` | `documents/reference-framework/00_Decisions.md` | Stage-close script run by the coordinator as T1 | 2026-11-23 |
| `DEC-00051` | `CMP-00001` | `documents/reference-framework/00_Decisions.md` | Token measurement from transcripts in ledger render | 2026-11-23 |
| `DEC-00052` | `CMP-00001` | `documents/reference-framework/00_Decisions.md` | Peel an M1 tail out of an M2 task only at about 6 or more calls | 2026-11-23 |
| `DEC-00053` | `CMP-00001` | `documents/reference-framework/00_Decisions.md` | Execution packs: plan mode, stale-plan check, by-class brief check | 2026-11-23 |