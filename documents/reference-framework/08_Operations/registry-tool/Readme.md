# Readme: registry-tool (08_Operations of the reference framework, `CMP-00001`)

Purpose: the tools that allocate, check and link reference keys ([`DEC-00018`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00018), [`DEC-00037`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00037), [`DEC-00023`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00023)) · owner reference framework · status live · related `../../16_Registries/REGISTRY.md`, `../../05_Detailed_Design.md#commands`

| Script | Does |
| --- | --- |
| [refkey.py](refkey.py) | `next`, `alloc`, `retire`, `check` against `16_Registries/REGISTRY.md` |
| [link_keys.py](link_keys.py) | links every quoted key to its definition; `--check`, `--startup`, `--render` ([`DEC-00008`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00008)) |

Ported from PSS 2026-11-23 with the scratch and addon URLs of this project and the retirements heading [`DEC-00039`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00039).
