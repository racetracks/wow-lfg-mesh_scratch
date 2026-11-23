# 05_Detailed_Design: reference framework (`DDS-00001`)

Purpose: registry format, tool commands and the files the scripts write · owner reference framework ([`CMP-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/documents/reference-framework)) · last updated session intelligent-darwin-5smmqv, prompt 02 · status live · related `12_User_Guides/12_02_Documentation_Rules.md`

## Contents
- [Registry format](#registry-format)
- [Commands](#commands)
- [Scripts](#scripts)
- [Changelog](#changelog)

## Registry format
`16_Registries/REGISTRY.md`: `## Counters` (`| `TYPE` | meaning | next |`), `## Ledger` (`| `KEY` | `CMP` | `file` | title | date |`, appended in order), `## Retirements (`RET`, [`DEC-00039`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00039))` (`| `RET` | `old` | `new` | `CMP` | `references file` | reason | date |`). `refkey.py` parses these exact shapes; never reorder them.

## Commands
| Command | Does |
| --- | --- |
| `refkey.py next TYPE` | prints the next key |
| `refkey.py alloc TYPE CMP FILE TITLE` | registers the next key (a `CMP` owns itself) |
| `refkey.py retire OLD NEW CMP REFS REASON` | allocates a `RET`, marks the old row, adds the mapping |
| `refkey.py check [ROOT]` | duplicates, gaps, counter drift, unregistered keys in any `.md`, a `RET` without its row |
| `link_keys.py [--check] <path>` | links every quoted key ([`DEC-00023`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00023)) |
| `link_keys.py --startup <file>` / `--render <src> <out> [--addon <dir>]` | startup files bare, linked copy ([`DEC-00008`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00008)) |

## Scripts
Every script of `08_Operations/structure-builder/` is listed with what it writes in `08_Operations/structure-builder/Readme.md`.

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created | the author: fresh start with the PSS rules | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md); before: new |
