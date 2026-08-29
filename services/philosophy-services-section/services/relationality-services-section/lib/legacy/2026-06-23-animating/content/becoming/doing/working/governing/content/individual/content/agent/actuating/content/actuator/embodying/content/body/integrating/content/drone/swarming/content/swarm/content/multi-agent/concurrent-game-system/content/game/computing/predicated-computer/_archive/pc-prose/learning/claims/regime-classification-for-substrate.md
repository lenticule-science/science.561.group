---
type: theorem
class: engineering-claim
status: proved
depends-on: [closure-rule-system, regime-record, predication-fiber-algebra, four-regime-dichotomy, scott-continuous-closure, closure-rule-language, settling-convergence, transfinite-settling-convergence]
see-also: [regime-record, rule-language-realizability-determines-regime, strict-regime-engineering-envelope, scott-continuous-regime-engineering-envelope, transfinite-bounded-regime-engineering-envelope, aperiodic-regime-engineering-envelope, regime-discipline, federation-convergence, wavefront-termination, scott-continuity-as-checkpointability, regime-meet-semilattice, multi-regime-session-discipline-is-meet]
---

# Every conformant predicated computer falls into exactly one of four regimes

**Claim.** Every conformant [predicated computer](../objects/predicated-computer.md) falls into exactly one of four regimes, classified by the closure ordinal $\kappa$ of its [closure-driven](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) settling. The regime is determined by two substrate parameters and is a property the substrate's engineering must surface explicitly:

- The **rule-language fragment** of the substrate's [closure-rule system](../objects/closure-rule-system.md): *quantifier-free* (Scott-continuous closure) or *with $\forall$-blocks over infinite domains* (potentially non-Scott-continuous).
- The **base finiteness** of the substrate's value-domain $\mathbf{L}^\bowtie$, [entity set](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/entity-set.md) $E$, and [predicate category](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predicate-category.md) $\mathcal{C}$.

| Regime | Rule-language | Base | $\kappa$ | Engineering disposition |
|---|---|---|---|---|
| **Strict** | quantifier-free | finite | $< \omega$ | $\omega$-bounded engine, finite event log per cascade |
| **Scott-continuous** | quantifier-free | at least one infinite | $= \omega$ | $\omega$-bounded prefix engine, finitely-billable per finite prefix |
| **Transfinite-bounded** | with $\forall$-blocks | countable cofinality | $\omega < \kappa < \omega_1$ | engine must support transfinite stage admission |
| **Aperiodic** | with $\forall$-blocks | cofinality $\geq \omega_1$ | $\geq \omega_1$ | engine must support uncountable transfinite, or scope to a bounded prefix |

The classification is *exclusive* (no substrate falls into two regimes) and *exhaustive* (every conformant substrate falls into one). The substrate's runtime, federation discipline, and audit obligations are regime-determined.

## Why this holds

The substrate's settling is a [closure-driven](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-drivenness.md) [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md), so the [four-regime dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) applies directly. The engineering claim is the substrate-level instance: what the math classifies as "the closure ordinal lands in $\{<\omega, =\omega, (\omega, \omega_1), [\omega_1, \cdot)\}$" the engineering classifies as "the substrate's runtime obligations land in one of four regime-determined disciplines."

**Why finiteness of base + quantifier-free rules ⇒ strict regime.** When $\mathbf{L}, E, \mathcal{C}$ are all finite, each [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie\, E\times E}$ is finite. By [settling-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/settling-convergence.md), the closure-driven settling stabilizes in finitely many layers — equivalently, $\kappa < \omega$. The substrate's engine inherits a finite-bound discipline.

**Why infinite base + quantifier-free rules ⇒ Scott-continuous regime.** Quantifier-free antecedents make the closure operator [Scott-continuous](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/scott-continuous-closure.md) (commutes with directed colimits). By the four-regime dichotomy, this gives $\kappa = \omega$. The substrate's engine handles each finite prefix at finite cost; the global limit is the colimit and is well-defined.

**Why $\forall$-blocks ⇒ non-Scott-continuous regimes.** A closure-rule with $\forall x \in E$ over infinite $E$ cannot in general fire from any single finite sub-stage of a directed family — it only fires once the full $\leq_k$-join is available. Such rules produce [non-Scott-continuous firing ordinals](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/non-scott-continuous-firing-ordinal.md). Whether the resulting closure ordinal stays countable (transfinite-bounded) or reaches $\omega_1$ (aperiodic) depends on the cofinality of the substrate's state space — finite or countably infinite gives transfinite-bounded; cofinality $\geq \omega_1$ gives aperiodic.

**Why exclusive and exhaustive.** The closure ordinal $\kappa$ falls into exactly one of $\{<\omega, =\omega, (\omega, \omega_1), [\omega_1, \cdot)\}$, by partition of the ordinal line. Every conformant substrate has a well-defined closure ordinal (per the Knaster-Tarski bound, $\kappa$ exists and is bounded by $|\mathbf{PrFib}|^+$ in the ambient universe). So every substrate is in some regime, and only one.

## Engineering consequence

The regime is not a runtime discovery — it is a substrate parameter the engineering must declare. The closure-rule system's `rule-language-fragment` field (per the [closure-rule-system object](../objects/closure-rule-system.md)) and the substrate's base-finiteness declaration jointly determine the regime per [rule-language-realizability-determines-regime](rule-language-realizability-determines-regime.md); the substrate's engine, audit, and federation disciplines must be regime-compatible from the outset. Per the [regime-record](../objects/regime-record.md) object, the regime declaration lives as substrate content — one entity, citable by hash, queryable by external tools.

Each of the four regimes carries its own engineering envelope, established by a per-regime theorem:

- [strict-regime-engineering-envelope](strict-regime-engineering-envelope.md) — finite, polynomial, $H^1$-trivial.
- [scott-continuous-regime-engineering-envelope](scott-continuous-regime-engineering-envelope.md) — finite-prefix-bounded, $H^1$-trivial via AB5.
- [transfinite-bounded-regime-engineering-envelope](transfinite-bounded-regime-engineering-envelope.md) — countable-firing-ordinal-indexed $H^1$.
- [aperiodic-regime-engineering-envelope](aperiodic-regime-engineering-envelope.md) — direct-limit-of-truncations at $\omega_1$ depth.

The [regime-discipline](teaching/explanations/regime-discipline.md) narrative walks through the per-regime engineering content together with cross-regime federation and audit.

Several engineering obligations follow from regime:

- **Engine fuel discipline.** Strict and Scott-continuous regimes admit finite per-cascade fuel; transfinite-bounded and aperiodic regimes require transfinite-aware fuel (per [wavefront-termination](wavefront-termination.md)) or scope-to-prefix policies.
- **Federation discipline.** Strict and Scott-continuous regimes can ship endpoint state (per [federation-convergence](federation-convergence.md)); transfinite-bounded and aperiodic regimes must ship trajectory (the firing-ordinal record), or lose the cohomological invariant in $H^1$ across federation.
- **Snapshot vs. trajectory storage.** Strict and Scott-continuous regimes admit endpoint-only snapshots (per [snapshot-replay-fidelity](snapshot-replay-fidelity.md)); transfinite-bounded and aperiodic regimes need trajectory snapshots that record the firing-ordinal pattern.
- **Audit cost.** Strict-regime audit terminates in finite stages; non-Scott-continuous regime audit must traverse transfinite witnesses and may need to summarize firing-ordinal patterns rather than enumerate them.

## What the theorem rules out

A substrate that *attempts* to operate in a regime its rule-language and base do not match has misdeclared itself:

- A substrate with $\forall$-block rules but a fuel policy admitting only finite layers will abort at the first non-Scott-continuous firing ordinal, producing partial settlement. The substrate must either restrict its rules to the quantifier-free fragment (to honestly run in strict / Scott-continuous regime) or extend its fuel policy to admit transfinite stages.
- A substrate with finite-base content but a fuel policy permitting transfinite stages is over-engineered for its content but correct; the over-provisioning costs implementation effort but does not produce wrong results.
- A federation between two substrates in incompatible regimes (one strict, one transfinite-bounded) is admissible only if the transfinite-bounded substrate scopes its federation traffic to a Scott-continuous prefix, or if both sides agree to ship trajectory.

## What the theorem requires

- The substrate is a conformant [predicated computer](../objects/predicated-computer.md).
- The substrate's [closure-rule system](../objects/closure-rule-system.md) declares its rule-language fragment.
- The substrate's value-domain, entity set, and predicate category are well-defined as the parameters $(\mathbf{L}, E, \mathcal{C})$ of a [predication fibration](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fibration.md).
- The closure operator generated by the rule system satisfies the four [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) axioms (monotone in $\leq_k$, inflationary, idempotent, $\mathcal{C}$-natural).
