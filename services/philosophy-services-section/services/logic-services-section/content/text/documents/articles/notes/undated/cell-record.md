---
name: cell-record
description: The pair (cell, value) carrying a transaction-id. A cell-record packages a predication-cell position with the bilattice-value some valuation assigned to that cell at a given moment. Cell and value are sibling fields, never merged into a value-bearing cell. cell-record is distinct from predication-cell — the cell is invariant position; the cell-record is a (position, value, time) snapshot under a chosen valuation.
packaging: predication-cell
recording-value: bilattice-value
having-transaction-id: cell-record
deriving-from: cell-id
deriving-via: predicating
title: cell-record
---

A **cell-record** is the triple $\langle \phi, w, t \rangle$ pairing a [predication cell](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/predication-cell/library/predication-cell/predication-cell.md) $\phi = (s, p, o)$ with the [bilattice-value](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/bilattice/bilattice-value.md) $w$ assigned to that cell under a chosen valuation, together with a transaction-id $t$. Optional provenance fields name the closure-rule that produced the record and the prior cell-ids it depends on.

## Cell-record is distinct from predication-cell

A predication cell is a pure position — three coordinates, no value, no time. The cell exists in the cell-set $\Phi$ whether anything has been said about it or not. A cell-record is the observation packaged: a (position, value, time) triple. Many cell-records may refer to the same cell, recording the values different valuations assigned at different transaction-ids; the cell is identical across all of them.

The two structures are kept categorically separate. The cell is a member of $\Phi = E \times \Pi \times E$. The cell-record is a member of $\Phi \times \mathbf{L}^\bowtie \times T$ where $T$ is the set of transaction-ids. The forgetful map cell-record → cell sends $\langle \phi, w, t \rangle \mapsto \phi$; the forgetful map cell-record → value sends $\langle \phi, w, t \rangle \mapsto w$. The two forgetful maps factor through sibling projections; there is no projection that returns a value-bearing cell.

## The fields

- **`cell`** — the predication-cell position.
- **`value`** — the bilattice-value at this cell under the recording valuation. Carries its own bilattice context.
- **`t`** — the transaction-id; together with `cell` and `value`, it makes the record content-addressable.
- **`stratum`** *(optional)* — the settling step the record was emitted at: `asserted` (stratum-0), `saturated` (stratum-1), `settled` (stratum-2).
- **`derived-from`** *(optional)* — the cell-ids of prior cell-records the closure-rule consumed to produce this one.
- **`derived-via`** *(optional)* — the morphism (named by gerund) that fired to produce the record.

## Implicit-register encoding

A predication cell asserted by a frontmatter declaration `<key>: <value>` on a record whose basename is `<subject>` desugars to a cell-record whose `cell` is $(\text{<subject>}, \text{<key>}, \text{<value>})$, whose `value` is the asserted-true element of FOUR under the default valuation, and whose `t` is the file's modification time. The frontmatter convention is one boundary at which positions enter the cell-record stream.
