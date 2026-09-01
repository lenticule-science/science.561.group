# Windows topical library migration

This is the provenance record for the mixed topical archive formerly at
`lib/emsenn/services/561-group/lib/legacy/2026-08-17-windows-561-group/sites/triage.dev.emsenn.net/content/_archive/library`.

The archive was routed by subject into the owning service's dated legacy
library. Textual material was subsequently promoted into the owning active
`content/text/triage`, glossary terms, concepts, and topics. The retained
archival files remain under their dated roots, and every promoted or
consolidated source path remains in the complete ledger.

The dated staging roots use **2026-08-17**, the Windows export snapshot date.
No newer authoritative last-active date was found in the source metadata or
filesystem evidence, so this migration does not claim activity on 2026-08-18.

The migration removed only exact-byte duplicate files within each routed
root. Each removed path and its retained canonical payload are recorded in
that root's `duplicate-provenance.tsv`; files with different bytes were
retained because they may carry distinct claims or history.

| Source branch | Routed service |
| --- | --- |
| `applied-sciences/agriculture` | biological / agricultural science |
| `applied-sciences/medicine` | biological / medical science |
| `applied-sciences/technology` | engineering science / technology |
| `applied-sciences/domesticity` | engineering / domestic services |
| `arts/arts-theory` | philosophy science |
| `arts/ludics` | game science / ludics |
| `arts/music` | information science / media / music |
| `philosophy/philosophy-general` | philosophy science |
| `philosophy/relationality` | philosophy / relationality |
| `science/mathematics` | mathematics |
| `social-sciences/anthropology` | social science / sociology archive |
| `social-sciences/education` | social science / education |
| `social-sciences/governing` | social science / sociology archive |
| `social-sciences/sociology` | social science / sociology |
| `social-sciences/working` | social science / work |
| `social-sciences/_archive` | social science archive |

The five topical root descriptions and the original `README.md` are kept in
`roots/` and at this migration root respectively. The source directory is
now empty and removed.

The complete source-to-destination/action ledger is
[`MIGRATION-LEDGER.tsv`](MIGRATION-LEDGER.tsv). It records 11,267 source
payloads, 739 exact duplicate consolidations, 9,483 textual integrations,
and 1,039 genuinely archival retained payload files plus 6 source-branch
descriptors. The ledger separately labels 9 generated duplicate-provenance
rows and 7 migration-metadata rows.

The semantic consolidation and date evidence are documented in
[`SEMANTIC-PASS.md`](SEMANTIC-PASS.md) and
[`RETENTION-DATE-EVIDENCE.md`](RETENTION-DATE-EVIDENCE.md).
