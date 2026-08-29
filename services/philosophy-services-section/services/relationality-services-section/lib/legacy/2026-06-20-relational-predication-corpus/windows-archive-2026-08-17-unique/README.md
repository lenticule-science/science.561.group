# Windows archive reconciliation (2026-08-17)

This directory holds the 139 payloads from the Windows triage dump that were not byte-identical to the existing predication-categories corpus. Their source-relative paths are retained below this directory.

The companion reconciliation ledger (../windows-archive-2026-08-17-reconciliation.ndjson) records one line per source file, including SHA-256, size, and either its exact existing target path(s) or its relocated canonical path. The 2782 exact-equivalent source entries are not duplicated here.

The semantic second pass is recorded on every relocated ledger row. Three
payloads that were byte-identical to active canonical pages were removed from
this landing after hash verification; recoverable copies are in
`/tmp/yp-second-pass-duplicates-2026-08-18`. The remaining 136 unique payloads
stay here so that their exact bytes and historical paths remain available.

This is retained inside the existing dated 2026-06-20-relational-predication-corpus; the Windows backup date is provenance, not a new archive date.
