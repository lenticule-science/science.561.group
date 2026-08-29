# Retained-corpus date evidence

The date on a retained legacy root is the best supported date for the source
corpus, not the date this cleanup happened. I checked the available evidence
at corpus level:

- The Windows export itself is identified as the **2026-08-17** snapshot.
- Every retained payload currently has the same filesystem mtime,
  **2026-06-20**. That uniform date is bulk-checkout metadata, not evidence
  that all files were active on that day, so it is not promoted to the root
  date.
- The retained paths have no attributable git history in this checkout, and
  scattered embedded dates do not establish a single last-active date for a
  cohesive application/source corpus.

Accordingly, every retained corpus below uses `2026-08-17`: it is the honest
source-provenance date when no stronger corpus-level activity evidence exists.
Branches with zero retained files were fully integrated and have no retained
date to assign.

| Routed branch | Retained files | Date used | Evidence |
| --- | ---: | --- | --- |
| applied-sciences/agriculture | 70 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| applied-sciences/medicine | 204 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| applied-sciences/technology | 262 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| applied-sciences/domesticity | 0 | — | Fully integrated |
| arts/arts-theory | 47 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| arts/ludics | 413 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| arts/music | 1 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| philosophy/philosophy-general | 0 | — | Fully integrated |
| philosophy/relationality | 39 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| science/mathematics | 0 | — | Fully integrated |
| social-sciences/anthropology | 0 | — | Fully integrated |
| social-sciences/education | 1 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| social-sciences/governing | 1 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| social-sciences/sociology | 0 | — | Fully integrated |
| social-sciences/working | 1 | 2026-08-17 | Windows export snapshot; uniform 2026-06-20 mtime rejected as checkout metadata |
| social-sciences/_archive | 0 | — | Fully integrated |

The same evidence is repeated in the `retained-legacy` rows of the complete
ledger, so a future archivist can audit an individual payload without relying
on this summary.
