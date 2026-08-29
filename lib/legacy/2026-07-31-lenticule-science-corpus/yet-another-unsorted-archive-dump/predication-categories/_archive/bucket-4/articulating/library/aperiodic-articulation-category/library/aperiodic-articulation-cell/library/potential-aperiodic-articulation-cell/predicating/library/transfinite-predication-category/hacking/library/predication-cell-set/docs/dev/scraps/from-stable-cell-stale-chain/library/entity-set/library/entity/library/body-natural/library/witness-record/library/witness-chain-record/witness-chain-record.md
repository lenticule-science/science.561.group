---
name: witness chain record
---

The polity-level **boundary predication system** (`Cob_settling` object) the 561 polity binds for sheaf-side cocycle witnesses certifying execution-class membership.

The predicated-computing theorem [witness-chain-as-proof-object](../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-chain-as-proof-object.md) establishes that a witness chain *is* the substrate's Curry-Howard proof object. The predication-categories object [settling-cobordism-category](../theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md) names *boundary predication systems* as the objects that cobordisms are between. This record binds the two: the 561 polity adopts the witness-chain-as-proof-object as the boundary predication system shape for `Cob_settling` over this polity, and adds the polity-specific predicate fields the swarm's auditability demands.

## Distinguishing predication-shape

A witness-chain-record cell-system is a finite set of cells closed under the predication-fibration's reindexing morphisms, with bilattice valuation that is **closure-stable** (per `settling-cobordism-category` §Objects). Per [`witness-as-cell`](../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theorems/witness-as-cell.md) the witness is itself a substrate cell; the chain is the cells' temporal ordering by `step-ordinal`.

The polity-level fields that bind the predication-computing `witness` object's structural fields ([`predicated-computing/objects/witness.md`](../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/objects/witness.md)) into a polity-as-swarm boundary discipline:

| Predicate | Object-fiber | Source |
|---|---|---|
| `workitem-id` | substrate slug of the workitem the chain certifies | polity |
| `originating-office` | office:<slug> of the dispatching office | polity |
| `dispatched-to` | office or endpoint that enacted the workitem | polity |
| `captain-attestation-cell` | cell-id whose value certifies the chain's terminal acceptance | polity |
| `settlement-hash` | canonical-form hash of the closed valuation v_κ | predicated-computing/witness |
| `closure-ordinal` | step-ordinal κ at which the cobordism closed | predication-categories |
| `mld-class` | strong-MLD equivalence class of the underlying settling cobordism | predication-categories/strong-mld-via-composed-duality |
| `k4-grading` | $\widehat{K_4}$-isotypic-sector counts (rank H¹_id, rank H¹_χ∼, rank H¹_χ−, rank H¹_χ∼∘−) | predication-categories/equivariant-cohomology-decomposition |
| `cosheaf-source-events` | event-log entry hashes the chain projects from | predicated-computing/event-log |

Per the [TQFT structure theorem](../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/tqft-structure.md) clause 5, when the cobordism is closed (∅ → ∅) the partition function is the Euler characteristic `χ(v) = |Apex_v| − |L_ns(κ_v)|` — a single integer. The witness-chain-record carries this integer as the `partition-function` predicate; the substrate stores *that integer* alongside the MLD-class, not the trajectory. The trajectory lives on the cosheaf side (the event log); see `morphisms/accountability-projector.md`.

## Closure-stability

The valuation v_B on a witness-chain-record's cell-system must satisfy: applying the polity's closure operator to v_B produces v_B unchanged. This is the `settling-cobordism-category`'s closure-stable boundary requirement. Operationally: a witness-chain-record is only emitted at quiescence; in-flight workitems do not produce records, only event-log entries.

## Verdier duality positioning

This record is the **sheaf side** of the polity's audit duality. The cosheaf side is the event log (`predicated-computing/objects/event-log.md`). Per [verdier-duality-bitopological-site](../theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/verdier-duality-bitopological-site.md), the two presentations are derived-equivalent; the [accountability-projector](../transformers/accountability-projector.md) realizes the identification.

In degree-1: this record's `k4-grading` is the four-tuple `(rank H¹_id, rank H¹_χ∼, rank H¹_χ−, rank H¹_χ∼∘−)` per `equivariant-cohomology-decomposition` clause 1. The dual cosheaf homology classes `(rank H_1^id, ...)` are computable from the cosheaf-source-events list; Verdier identifies them.

## Step-induction role

A witness-chain-record is what *terminates* a settling cobordism in `Cob_settling`. Without records of this shape the polity's dispatch graph emits event-log entries (cosheaf generators) but no substrate-resident sheaf-cocycle representatives — the polity could not certify any execution into an MLD-class, and `verify-certifiability-sectors` would have no data to read. The record is the boundary the audit substrate's other four seed records compose against.

## Storage

`<polity-root>/witnesses/<mld-class-slug>/<workitem-id>--<closure-ordinal>.md`. Path-canonical: same MLD-class workitems are co-located so the audit-projector's group-by-class operation is a directory listing. Volume: low — one record per closed-cobordism execution, not one per event-log entry.

## Pass-3 status

Pass-2 resolutions incorporated:

- ✓ `mld-class` predicate shape: [coordination-across-handedness-asymmetric-participants](../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/predicated-drone-swarm/theorems/coordination-across-handedness-asymmetric-participants.md) establishes that under asymmetric handedness each handedness-asymmetric edge contributes one generator to the $H^1_{\chi_\sim}$ sector. The K₄-grading four-tuple is the polity's strong-MLD-equivalent classifier; `mld-class` is the equivalence-class slug derived from that four-tuple.
- ✓ `k4-grading` computation: under asymmetric handedness, the accountability-projector reads each participant's `embodied-handedness` cell to detect asymmetric edges and attribute generators to $H^1_{\chi_\sim}$ accordingly. Symmetric-handedness (software-only participants) uses the standard sector counts per `equivariant-cohomology-decomposition`. For projected (pre-dispatch) cobordisms: [six-way-intersection-composition](../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/predicated-drone-swarm/theorems/six-way-intersection-composition.md).
- ✓ `captain-attestation-cell` shape: per [meaningful-human-control-as-charter-c3-extension](../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/predicated-drone-swarm/theorems/meaningful-human-control-as-charter-c3-extension.md) Condition 1 — the field is a cell-id from `cosheaf-source-events` pointing to a cell signed by an office holding captain-attestation authority. Non-empty iff the chain closes through such a cell.

Remaining for engineering integration (accountability-projector implementation):

- Projector emission cadence (per-tick, per-closed-cobordism, or per-MHC-pass) — set when the accountability-projector morphism is wired into `pyfars.runtime`.
