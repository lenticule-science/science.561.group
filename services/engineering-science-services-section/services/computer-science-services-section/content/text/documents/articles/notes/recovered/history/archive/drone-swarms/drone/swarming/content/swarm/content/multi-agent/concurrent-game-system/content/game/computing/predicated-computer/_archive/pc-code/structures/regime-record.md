---
type: definition
class: substrate-aggregate
realizes: [four-regime-dichotomy, closure-ordinal]
depends-on: [closure-rule-system, predicated-computer, four-regime-dichotomy, closure-ordinal, scott-continuous-closure]
see-also: [regime-classification-for-substrate, regime-discipline, fuel-bound, federation-convergence, snapshot-replay-fidelity]
---

# Regime record

A **regime record** is the substrate-entity formal definition of a [predicated computer](predicated-computer.md)'s [regime](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md): the predication-graph entity declaring which of the four regimes — *strict*, *Scott-continuous*, *transfinite-bounded*, *aperiodic* — the substrate operates in, together with the substrate parameters that justify the declaration and the engine disciplines that follow from it.

Per [regime-classification-for-substrate](../theorems/regime-classification-for-substrate.md), every conformant predicated computer falls into exactly one of four regimes; the regime is *not* a runtime discovery, it is a substrate parameter. The regime record is where that parameter lives. Without it, the regime is implicit (encoded in fuel policies, federation discipline, snapshot policy); with it, the regime is queryable substrate content, auditable, and the engine disciplines downstream of it can cite the record by hash.

## Structural fields

A regime record carries:

- **`id`** — kebab-case identifier (commonly `default`, the substrate's primary regime declaration).
- **`description`** — one-line summary.
- **`regime`** — one of `strict`, `scott-continuous`, `transfinite-bounded`, `aperiodic`. The four-position declaration the rest of the substrate is engineered against.
- **`closure-ordinal-bound`** — declared upper bound on the [closure ordinal](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/closure-ordinal.md) $\kappa$ of any settling under the substrate's [closure-rule system](closure-rule-system.md). For `strict`: a finite natural number; for `scott-continuous`: $\omega$; for `transfinite-bounded`: a specific countable ordinal $< \omega_1$ (typically named — $\omega+1$, $\omega \cdot 2$, $\omega^2$, etc.); for `aperiodic`: $\omega_1$ or larger.
- **`rule-language-fragment`** — references the [closure-rule-system](closure-rule-system.md)'s declared `rule-language-fragment` field (`quantifier-free` or `with-forall-blocks`). Per [rule-language-realizability-determines-regime](../theorems/rule-language-realizability-determines-regime.md), this fragment plus the base finiteness determines the regime; a regime record whose `regime` field disagrees with what the fragment + base support is malformed.
- **`base-finiteness`** — declarations of finiteness or infiniteness of the value-domain $\mathbf{L}$, the [entity-set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/entity-set.md) $E$, and the [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $\mathcal{C}$. At least one infinite component is required for any non-strict regime.
- **`state-space-cofinality`** — for transfinite-bounded and aperiodic regimes, the cofinality declaration distinguishing transfinite-bounded (countable cofinality) from aperiodic (cofinality $\geq \omega_1$).
- **`fuel-policy`** — references the active [fuel-bound](teaching/explanations/fuel-bound.md) discipline. Per [regime-discipline](teaching/explanations/regime-discipline.md), the fuel policy must be regime-compatible: finite per-cascade fuel for strict / Scott-continuous, transfinite-aware fuel (or scope-to-prefix policy) for transfinite-bounded / aperiodic.
- **`federation-discipline`** — declaration of how federation traffic is shipped across substrate boundaries. Per [federation-convergence](../theorems/federation-convergence.md), strict / Scott-continuous regimes admit endpoint-state shipping; transfinite-bounded and aperiodic regimes must ship trajectory (the firing-ordinal record) to preserve the cohomological invariant.
- **`snapshot-policy`** — declaration of snapshot storage convention. Per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md), strict / Scott-continuous regimes admit endpoint-only snapshots; non-Scott-continuous regimes need trajectory snapshots recording the firing-ordinal pattern.
- **`audit-cohomology-bound`** — for non-Scott-continuous regimes, a declared bound on the rank of the $H^1$-classes the substrate's audit machinery is engineered to enumerate, beyond which the substrate summarizes by firing-ordinal pattern rather than enumerate (per [audit-content-via-inconsistency-sheaf-cohomology](../theorems/audit-content-via-inconsistency-sheaf-cohomology.md)).
- **`version-hash`** — canonical-form hash of the record's content, citable in [witness](witness.md) records and federation handshakes.

## Invariants

- **Regime ↔ fragment + base coherence.** The declared `regime` must match what the `rule-language-fragment` and `base-finiteness` fields support per [regime-classification-for-substrate](../theorems/regime-classification-for-substrate.md). A record declaring `strict` regime with `with-forall-blocks` fragment is malformed.
- **Closure-ordinal bound respects regime.** The `closure-ordinal-bound` lies in the regime's range: $<\omega$ for strict, $=\omega$ for Scott-continuous, $(\omega, \omega_1)$ for transfinite-bounded, $\geq \omega_1$ for aperiodic.
- **Fuel policy regime-compatible.** A regime record declaring `aperiodic` with finite per-cascade fuel is malformed — the substrate's settle would abort at the first non-Scott-continuous firing.
- **Federation discipline regime-compatible.** Endpoint-state shipping is admissible only for strict and Scott-continuous regimes; transfinite-bounded and aperiodic regimes shipping endpoint state (silently dropping the firing-ordinal pattern) lose $H^1$-classes across federation per [federation-convergence](../theorems/federation-convergence.md).
- **Snapshot policy regime-compatible.** Endpoint-only snapshots are admissible only for strict and Scott-continuous regimes per [snapshot-replay-fidelity](../theorems/snapshot-replay-fidelity.md).
- **Coherent declaration with closure-rule system.** The regime record's `rule-language-fragment` matches the active [closure-rule system](closure-rule-system.md)'s declared fragment. A mismatch means one of the two records is stale.

## Operations

- *Activate.* The regime record is referenced by the [predicated-computer](predicated-computer.md)'s root configuration; the engine consults the active record on every settle invocation to determine fuel policy, on every federation handshake to determine ship-discipline, and on every snapshot to determine snapshot-policy.
- *Edit.* A regime change (e.g., scoping the substrate to a Scott-continuous prefix to ship endpoint state across a federation) produces a new version. The substrate's history records the regime change as an event in the [event log](event-log.md).
- *Federate.* When two substrates federate, the receiving substrate consults the sending substrate's regime record. Per [federation-convergence](../theorems/federation-convergence.md), federation between substrates in incompatible regimes is admissible only with explicit prefix-scoping or trajectory shipping.
- *Audit.* Auditors consult the regime record to know what audit operations the substrate supports: $H^0$-only counting in stabilizing regimes, $H^1$-class enumeration up to the declared bound in non-Scott-continuous regimes.

## Position in the substrate

The regime record is the substrate's *runtime-discipline declaration*: the engineering parameter that makes the substrate's fuel, federation, snapshot, and audit machinery regime-compatible from the outset. Without it, regime is implicit in scattered policy fields and the substrate has no single point of regime-truth; with it, regime is one substrate entity, citable by hash, editable as content.

The pattern composes with [closure-rule-system](closure-rule-system.md) (whose `rule-language-fragment` must match), with [witness](witness.md) (whose `step-ordinal` field's typing depends on the regime), with [federation-convergence](../theorems/federation-convergence.md) (whose discipline depends on regime), and with [regime-discipline](teaching/explanations/regime-discipline.md) (the narrative that walks through what each regime obliges).
