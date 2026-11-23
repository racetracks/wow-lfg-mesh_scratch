# 15_Tests: reference framework (`CMP-00001`)

Purpose: the framework's tests and their last results; no in-game checks · owner reference framework ([`CMP-00001`](https://github.com/racetracks/wow-lfg-mesh_scratch/tree/main/documents/reference-framework)) · last updated session intelligent-darwin-5smmqv, prompt 02 · status live · related `12_User_Guides/12_02_Documentation_Rules.md`

## Contents
- [Tests](#tests)
- [In-game checks](#in-game-checks)
- [Changelog](#changelog)

## Tests
Run on a full copy (`cp -a`, `pwd` checked) of this repo, never the checkout ([`DEC-00032`](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/documents/reference-framework/12_User_Guides/12_02_Documentation_Rules.md#dec-00032) step 4). Last run 2026-11-23, session intelligent-darwin-5smmqv.

| Key | Test | How | Last result |
| --- | --- | --- | --- |
| <a id="tst-00001"></a>`TST-00001` | refkey check: no duplicate, gap or counter drift | `refkey.py check` | pass |
| <a id="tst-00002"></a>`TST-00002` | refkey check: every key in scratch markdown is registered | `refkey.py check` | pass (0 problems after the key port) |
| <a id="tst-00003"></a>`TST-00003` | refkey alloc on a copy bumps the counter and appends one row | `alloc STP ...` on the copy; the STP counter moves from 00001 to 00002, one row | pass |
| <a id="tst-00004"></a>`TST-00004` | refkey retire on a copy: RET key, mapping row, old row marked, check passes | `retire` the first test step for the second, on the copy | pass |
| <a id="tst-00005"></a>`TST-00005` | refkey check fails a RET missing from its 00_References.md | drop the row, `check` | pass (the check prints `FAIL ... missing from ...00_References.md`) |
| <a id="tst-00006"></a>`TST-00006` | link_keys.py --check reports 0 unresolved | `link_keys.py --check documents` | pass |

## In-game checks
None (the framework has no addon code).

## Changelog
| Date | Reference | Change | Reason | Context |
| --- | --- | --- | --- | --- |
| 2026-11-23 | this file | created | the author: fresh start with the PSS rules | [prompt 02](https://github.com/racetracks/wow-lfg-mesh_scratch/blob/main/temp/2026/11/23/06-11-56-Mon-intelligent-darwin-5smmqv/prompts/02.md); before: new |
