# 08_Operations: reference framework (`CMP-00001`)

Purpose: the runbooks: create, allocate, update, promote, retire · owner reference framework ([`CMP-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/documents/reference-framework)) · last updated session intelligent-darwin-5smmqv, prompt 02 · status live · related `08_Operations/registry-tool/Readme.md`, `08_Operations/structure-builder/Readme.md`

## Contents
- [Runbooks](#runbooks)
- [Changelog](#changelog)

## Runbooks
| Job | Steps |
| --- | --- |
| New capability folder | allocate its `CMP` and document keys in one batch (`alloc_keys.sh`), push the registry, then `TEMP_WS=<temp root> sh build_root_set.sh documents/<group>/<name> "<label> (`CMP-n`)"` ([`DEC-00013`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00013), [`DEC-00034`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00034)) |
| Placeholder folders | `ADDONS="..." FEATURES="..." sh build_documents_tree.sh . "<context>"` |
| Any docs change | the ten steps of [`DEC-00032`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00032); `link_keys.py` then `refkey.py check` (0 problems) |
| Revision draft | `TEMP_WS=... sh start_revision_draft.sh <live> drafts/<group>/<name>-<date>-draftN "<label>"` |
| Promote | on the author's OK, on a full copy first: `sh promote_draft.sh <draft> <live> <history> "<context>"` |
| Retire a key | [`DEC-00039`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00039) |
| Registry locations | `sh registry_locations.sh <scratch> <addon>` into `16_Registries/16_02_Registry_Locations.md` |

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created | the author: fresh start with the PSS rules | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md); before: new |
