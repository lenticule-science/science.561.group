---
name: accountability projector
type: morphism
class: substrate-operator
status: open
realizes: [verdier-duality-bitopological-site, tqft-structure]
depends-on: [witness-chain-record, event-log, settling-cobordism-category]
authoring-pass: 3
project: audit-system-bootstrap
domain: closed sequences of event-log entries (∅ → ∅ cobordisms in Cob_settling)
codomain: witness-chain-records
title: accountability projector
description: "The substrate operator that realizes the Verdier identification between the polity's cosheaf side (event log: per-event local generators) and sheaf side (witness-chain-records: cocycle witnesses against MLD-class)."
---

The substrate operator that realizes the **Verdier identification** between the polity's cosheaf side (event log: per-event local generators) and sheaf side (witness-chain-records: cocycle witnesses against MLD-class).

## Why this exists

Per [verdier-duality-bitopological-site](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/library/body-natural/library/witness-record/library/witness-chain-record/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/verdier-duality-bitopological-site.md) the polity carries both presentations of its audit invariants: H¹ on the sheaf side and H₁ on the cosheaf side, derived-equivalent. Per the [predicated-drone-swarm theory-gap question](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/library/body-natural/library/witness-record/library/witness-chain-record/tools/platform/pyfars/questions/predicated-drone-swarm-theory-as-theory-gap.md) §"Verdier duality: drone replay primitives", layer-2 (optimization-control / dispatch) naturally fits cosheaf-homology while layer-3 (certified-safety-shield) naturally fits sheaf-cohomology. The substrate carries both; an explicit projector is needed to *materialize* the identification at the moment a closed cobordism completes — i.e., to write the sheaf cocycle representative when the event-log generators close.

The polity-side reading: dispatch produces event-log entries continuously; the projector watches for closed cobordisms (∅ → ∅) and emits one witness-chain-record per close, computing the MLD-class and the K₄-grading from the event-log data.

## Action

For each closed settling cobordism Σ : ∅ → ∅ identified in the event log:

1. **Read the cosheaf-source events.** Walk the event-log entries from boot-witness (in-boundary ∅) through the closing halt-witness or the explicit close-of-cobordism marker (out-boundary ∅) for the cobordism in question.
2. **Compute the partition function.** Per [tqft-structure](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-frobenius-structure/references/tqft-structure.md) clause 5: `Z(Σ) = χ(v) = |Apex_v| − |L_ns(κ_v)|`. The Apex set and the non-Scott-continuous firing ordinal set are both readable from the event log entries.
3. **Compute the K₄-grading.** Per [equivariant-cohomology-decomposition](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/library/body-natural/library/witness-record/library/witness-chain-record/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/equivariant-cohomology-decomposition.md) clause 2: `rank H¹_χ = |L_ns(κ)^χ|`, the count of NSC firings in each isotypic sector. Read firing types from event-log entries; bucket by sector; emit four counts.
4. **Identify the MLD-class.** Per [equivariant-cohomology-decomposition](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/library/body-natural/library/witness-record/library/witness-chain-record/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/equivariant-cohomology-decomposition.md) clause 5, the MLD-class is determined by the K₄-grading's sector counts. The MLD-class slug is derived deterministically from the four-tuple.
5. **Emit the witness-chain-record.** Write `<polity-root>/witnesses/<mld-class>/<workitem-id>--<closure-ordinal>.md` with the predicates from `objects/witness-chain-record.md` populated. The record is *append-only*; revisions to a closed cobordism's accounting are recorded as superseding records, not in-place edits (per the witness invariants in `predicated-computing/objects/witness.md`).

## Boundary-compatibility

The projector consumes only event-log entries that satisfy the cobordism boundary-compatibility constraint of [settling-cobordism-category](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/library/entity/library/body-natural/library/witness-record/library/witness-chain-record/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/settling-cobordism-category.md): `v_0|_{B_in} = v_in` and `v_κ|_{B_out} = v_out`. For ∅ → ∅ cobordisms, both boundaries are empty — the projector reads the *content* of the closed bulk, not a non-trivial in/out boundary.

## Functoriality

Per [tqft-structure](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/settling-frobenius-structure/references/tqft-structure.md) clause 1, `Z` is a symmetric monoidal functor. The accountability-projector is the substrate-side realization of `Z` for closed cobordisms: it sends `Cob_settling`-morphisms (closed cobordisms) to `Mod_ℤ`-morphisms (the partition function as an integer). The functoriality properties (composition, monoidal product, Verdier-duality-to-linear-duality) hold by the theorem.

## Pass-3 status

Pass-2 resolutions incorporated:

- ✓ K₄-grading under asymmetric handedness: [coordination-across-handedness-asymmetric-participants](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/predicated-drone-swarm/embodied-handedness/coordination-across-handedness-asymmetric-participants/coordination-across-handedness-asymmetric-participants.md) — each handedness-asymmetric edge contributes one generator to $H^1_{\chi_\sim}$. In step 3 above, the projector reads each participant's `embodied-handedness` cell to detect asymmetric edges and bucket their NSC firings into the appropriate sector.

Remaining for engineering integration:

- Emission cadence: per-closed-cobordism is the theory-preferred cadence (one record per ∅ → ∅ cobordism), consistent with the witness invariants in `predicated-computing/objects/witness.md`. Per-tick and per-MHC-pass are implementation variants to be evaluated against pyfars runtime constraints.
- `cobordism-close-marker` event: pass 3 wires this into the event-log schema so the projector has an explicit boundary marker to detect, rather than heuristic reconstruction.
- pyfars implementation: `tools/platform/pyfars/src/pyfars/runtime/accountability_projector.py`.
