# Readme: structure-builder (08_Operations of the reference framework, `CMP-00001`)

Purpose: the scripts that build and maintain the documentation structure ([`DEC-00018`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00018), [`DEC-00034`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00034)) · owner reference framework · status live · related `../../08_Operations.md#runbooks`

All POSIX `sh` (one Python); run from the scratch root.

| Script | Does |
| --- | --- |
| [build_root_set.sh](build_root_set.sh) | writes the whole root set ([`DEC-00012`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00012)) with placeholders and a `claude.local.md` in every folder excluding them; never overwrites; `TEMP_WS` adds Session context ([`DEC-00027`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00027)) |
| [build_documents_tree.sh](build_documents_tree.sh) | creates `documents/` with `addons/`, `features/`, `sub-features/`; capability placeholders from env `ADDONS`, `FEATURES`, `SUB_FEATURES` |
| [placeholder_folders.sh](placeholder_folders.sh) | placeholder capability folders (`Readme.md`, `claude.local.md`, `00_Changelog.md`) |
| [write_claude_local.sh](write_claude_local.sh) | a `claude.local.md` with rules 1 to 6 (7 and a Promotion watch with `--draft`) ([`DEC-00016`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00016), [`DEC-00021`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00021)) |
| [write_changelog.sh](write_changelog.sh) | a folder changelog with its first row ([`DEC-00020`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00020)) |
| [before_link.sh](before_link.sh) | a document's changelog before link ([`DEC-00026`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00026)) |
| [alloc_keys.sh](alloc_keys.sh) | allocates a list of keys (`TYPE|file|title` lines), then checks |
| [start_revision_draft.sh](start_revision_draft.sh) | copies a live folder into a draft, registry left out, changelogs emptied, rule 7 added |
| [promote_draft.sh](promote_draft.sh) | promotes a draft, moves old live and draft to `history/` with stubs, repoints live links ([`DEC-00030`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00030)) |
| [leave_pointers.sh](leave_pointers.sh) | pointer stubs at a moved folder's old path |
| [move_files.py](move_files.py) | moves single documents with stubs and repoints links |
| [registry_locations.sh](registry_locations.sh) | prints every live line naming the registry's location |
| [registry_snapshot.sh](registry_snapshot.sh) | copies the live registry into a draft with a "not live" banner |

Ported from PSS 2026-11-23 (PSS `move_framework.sh`, a one-off migration, not ported).
