# Destination-normalization audit

The lossless routing and first semantic pass are complete, but the active
destinations are **not yet accepted as a normalized corpus**. This audit exists
to prevent “source tree removed” from being mistaken for “canonical corpus
finished.”

## Audited destination set

- 9,483 source text payloads were routed to 7,613 active destination files.
- 148 byte-identical groups contained 298 files, or 150 redundant copies.
- 269 conservative normalized-text groups contained 1,307 files, or 1,038
  redundant copies.
- 152 whitespace-only groups contained 306 files, or 154 redundant copies.
- 763 files appeared effectively empty under the audit's first body heuristic.
  This number is deliberately not a deletion count: structured front matter may
  itself contain meaningful claims.
- Flattened-name analysis found 129 families containing 325 files, or 196 likely
  redundant variants.

Filename signals included 117 `from-*` files, 127 numbered-suffix files, 35
`old-*` files, and 26 `research-*` files. Examples include the MUD street
families, Teraum introduction/stack variants, medical Reiki and TCCC variants,
and repeated relationality voice documents.

## Safety finding

An experimental destination normalizer was drafted and dry-run reports were
produced in temporary workspace. It was rejected before acceptance because it
attempted to infer semantic merge authority from filename families and Jaccard
similarity, emitted a ledger incompatible with the guarded enactor, and lacked
adequate transactional, path-containment, and quarantine guarantees. It is not
part of the corpus-normalization service and its dry-run plan is not an approved
disposition ledger.

No third-pass report or quarantine was written into the repository before that
tool was halted. The trusted service now limits automation to evidence,
proposals, exact-copy drafting, guarded ledger enactment, and verification.

## Required next passes

1. Re-inventory the 7,613 destinations with the Fall 2026 normalization service.
2. Contract byte-identical copies within one owner from a reviewed ledger.
3. Review normalized-body families while preserving structured claims.
4. Consolidate same-owner flattened variants after semantic review.
5. Keep cross-owner collisions as explicit ownership questions rather than
   automatically deleting one service's representation.
6. Repair references, verify the disposition ledger, and repeat with a finer
   threshold.

The original mixed-library source is absent and its path-level routing remains
accounted for by `MIGRATION-LEDGER.tsv`; this audit records the outstanding
canonicalization debt in the destinations.
