---
kind: question
status: open-with-layer-audit
explores:
  - relconlang
  - repair
  - discourse
  - bilattice
  - contradiction
  - repair-resolution
---
# What constitutes repair in RelConLang?

"Repair" currently denotes several non-equivalent structures:

- `ren`, a lexical agency verb;
- `ri`, an information-structure replacement marker;
- discourse-state diagnostic obligations;
- current SignCraft contradiction/denial settlement, which can derive contradictory cells but exposes no current affirm/retract/acknowledge repair API;
- **legacy theoretical** repair-resolution/adjudication work distinguishing affirm, retract, and acknowledge.

The experiment must determine which of these relations should be linguistically grammaticalized and which should remain metalinguistic diagnostics.

The archival repair-resolution theory distinguishes affirm, retract, and acknowledge, but those modes are not currently implemented as RelConLang or SignStuff repair operations. They remain useful candidate outcome classes, not current executable semantics.

Generic reduction of graph cycle rank is not an adequate success criterion. A valid repair may add discourse edges.

A satisfactory account should define a typed before/act/after relation over dialogue state and specify what evidence justifies saying that an earlier obligation or contradiction was resolved, transformed, or merely acknowledged.

## Current candidate separation

Use a **repair report** as the linguistic object.

`ren`, `ri`, or a dialogue-level repair reading can identify a target and a proposed replacement/clarification. That report has `evidenceEffect: none-by-language-alone`.

Any subsequent evidence transition is separate and requires an explicit warrant. This mirrors the stance-report and denial-report discipline: language can describe or propose a change without silently rewriting the evidentiary substrate.

The current `communicating.discourse-state` field named `repairs` is also narrower than the ordinary word suggests. Its kinds are unresolved/ambiguous reference, presupposition accommodation, parse obstruction, and grammar obstruction: these are **repair diagnostics**, not successful speaker repairs.

See `content/data/relconlang/repair-layer-audit-v0.1.json`, `repair-report-v0.1.schema.json`, and `repair-report-assay-v0.1.json`.
