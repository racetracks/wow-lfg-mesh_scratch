# claude.local.md: 16_Registries of reference framework (`CMP-00001`)

## Rules
1. Brief when empty: when updating documentation in this folder, keep a document with no information extremely brief, telling the reader that the appendix, summary and references say where to find what they want.
2. Do not read: when reading or reviewing documentation, do not open, read, crawl or index any file listed under "Excluded files"
3. Do not update: when updating documentation, do not update any file listed under "Excluded files".
4. Keep the list current: when updating documentation in this folder, add every document with no relevant content to "Excluded files", so it is neither read nor updated going forward. A file leaves the list only when content for it arrives: remove it and fill it in the same commit.
5. Changelog: when updating documentation in this folder, add a row to this folder's changelog (00_Changelog.md, or NN_00_Changelog.md in a numbered subfolder) for every change: date, document, reference, change (added, changed, retired), reason, context. A retirement row names the document, the retired reference, its replacement and the reason.
6. Cite context: when drafting or changing a reference, cite the temp workspace memory it came from (a temp/<YYYY>/<MM>/<DD>/<hh-mm-ss>-<Ddd>-<workspace>/prompts/ entry or output README.md) or its stakeholder input (STK) key, so the reason can be read later.

## Excluded files
- `16_00_Appendix.md` (placeholder)
- `16_00_References.md` (placeholder)
- `16_01_Summary.md` (placeholder)

## Never excluded
Readme.md, claude.local.md, every changelog, the root 00_Appendix.md, 00_References.md, 00_Decisions.md and 01_Summary.md, and everything in 13_Release_Notes and 14_Code_Reference.
