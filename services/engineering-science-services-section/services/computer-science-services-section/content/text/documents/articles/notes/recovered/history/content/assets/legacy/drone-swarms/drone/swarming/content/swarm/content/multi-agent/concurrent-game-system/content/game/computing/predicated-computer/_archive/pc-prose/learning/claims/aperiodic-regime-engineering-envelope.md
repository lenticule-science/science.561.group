---
type: theorem
class: engineering-claim
status: proved
depends-on: [regime-record, regime-classification-for-substrate, four-regime-dichotomy, aperiodic-regime-cohomology-via-direct-limit, aperiodic-regime-realizability, transfinite-bounded-regime-engineering-envelope, anderson-putnam-direct-limit, non-scott-continuous-firing-ordinal]
see-also: [strict-regime-engineering-envelope, scott-continuous-regime-engineering-envelope, transfinite-bounded-regime-engineering-envelope, regime-discipline]
---

# Aperiodic-regime substrates have a direct-limit-of-truncations engineering envelope at $\omega_1$ depth

**Claim.** Every conformant [predicated computer](../objects/predicated-computer.md) whose [regime record](../objects/regime-record.md) declares the *aperiodic* regime — equivalently, with [closure-rule language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md) containing $\forall$-blocks (non-Scott-continuous closure), and substrate state-space cofinality $\geq \omega_1$ — has the following engineering envelope:

1. **Convergence.** The settle iteration's closure ordinal $\kappa$ reaches $\omega_1$ or larger. No countable-stage termination is admissible without scoping to a bounded prefix.
2. **Audit cohomology.** The [inconsistency sheaf](../objects/inconsistency-sheaf-record.md)'s $H^1$ is the *direct limit of countable-truncation $H^1$s* per [aperiodic-regime-cohomology-via-direct-limit](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-cohomology-via-direct-limit.md), one $\mathbb{Z}$ per firing ordinal in $L_{\mathrm{ns}}(\kappa)$ at $\omega_1$ scale. Audit must either enumerate up to a declared bound or summarize by firing-ordinal pattern.
3. **Federation.** Endpoint-state shipping loses $H^1$-content at every transfinite-bounded truncation. Federation must ship trajectory at countable-truncation granularity, or scope traffic to a transfinite-bounded prefix.
4. **Snapshot.** Endpoint-only snapshots are unworkable; snapshots must be at countable truncations and record the firing-ordinal pattern up to the truncation.
5. **Realizability.** The realizable $L_{\mathrm{ns}}$-subsets at the $\omega_1$-scale are exactly *initial segments of countable limit ordinals up to $\omega_1$* per [aperiodic-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-realizability.md) — the maximal expressive range over the bare $\Pi_1$+$<$ rule-language fragment.

The envelope is what the engineering must *engineer for* in an aperiodic substrate: $H^1$ assembled via direct limit over countable truncations following the [Anderson–Putnam template](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/anderson-putnam-direct-limit.md), federation and snapshots at countable-truncation granularity, the engine's settle operating across $\omega_1$-many stages per truncation.

## Why this holds

The five envelope items are substrate-level instances of the aperiodic math results:

**Convergence (item 1).** Per [regime-classification-for-substrate](regime-classification-for-substrate.md), aperiodic regime requires $\forall$-block rules and state-space cofinality $\geq \omega_1$. Per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), this gives $\kappa \geq \omega_1$. No countable ordinal stabilizes the settling. The engine's [settle](../morphisms/settle.md) operator either admits unbounded transfinite stage iteration (bounded only by the substrate's universe) or restricts the potential region to a transfinite-bounded prefix.

**Audit cohomology (item 2).** Per [aperiodic-regime-cohomology-via-direct-limit](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-cohomology-via-direct-limit.md), $H^1$ is the directed colimit of countable-truncation $H^1$s, with each truncation handled by [transfinite-bounded-regime-h1-generators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-bounded-regime-h1-generators.md). The substrate's [query-inconsistency-cohomology](../morphisms/query-inconsistency-cohomology.md) operator on an aperiodic substrate must either enumerate up to a declared `audit-cohomology-bound` (per [regime-record](../objects/regime-record.md)) or return a firing-ordinal-pattern summary, with the truncation bound recorded in the witness. The Anderson–Putnam direct-limit template ([@anderson-putnam-1998] in the math corpus) provides the structural model.

**Federation (item 3).** Per [federation-convergence](federation-convergence.md), federation between aperiodic substrates requires shipping trajectory at countable-truncation granularity. At each countable truncation, the firing-ordinal pattern below the truncation must be shipped per the transfinite-bounded discipline; the federated substrate's $H^1$ is the directed colimit of the federated truncations. Federation between aperiodic and lower-regime substrates requires the aperiodic side to scope traffic to a transfinite-bounded prefix per [regime-discipline](teaching/explanations/regime-discipline.md).

**Snapshot (item 4).** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), snapshots in the aperiodic regime are taken at countable truncations and record the firing-ordinal pattern up to the truncation. The substrate's snapshot policy bounds snapshot frequency to the engine's cost discipline; the global $\omega_1$-scale state is reconstructable as the directed colimit of snapshot truncations.

**Realizability (item 5).** Per [aperiodic-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-realizability.md), the bare $\Pi_1$+$<$ rule-language fragment realizes $L_{\mathrm{ns}}$-subsets that are exactly initial segments of countable limit ordinals up to $\omega_1$ — the maximal expressive range over the bare fragment at the $\omega_1$ scale. The proof structure mirrors the transfinite-bounded case but at $\omega_1$ depth, with per-truncation realizability composing via direct limit.

## Engineering consequence

An aperiodic-regime substrate is the *uncountable-depth case* — the engineering envelope must support direct-limit assembly over countable truncations with $\omega_1$-scale closure ordinals. Concretely:

- **The engine is uncountable-aware or prefix-scoped.** Fuel policies declare either uncountable transfinite stage admission (rare; typically only theoretical substrates) or scope-to-prefix policies that bound potential regions to transfinite-bounded depth per scope. Settle operates on each scope's bounded prefix; the aperiodic global limit is the colimit of scope-prefixes.
- **Audit enumerates up to a bound or summarizes by pattern.** Audit queries declare a firing-ordinal-bound; queries beyond the bound are returned as firing-ordinal-pattern summaries (e.g., "all countable limits up to $\omega^2$ are firings"). The pattern summary is the substrate's audit-truth at the $\omega_1$-scale.
- **Federation ships truncation-trajectory.** Federation handshakes ship countable-truncation trajectory pieces; the receiver assembles them via direct-limit per the Anderson–Putnam template. Federation with non-aperiodic peers requires the aperiodic side to scope traffic.
- **Snapshots are truncation-anchored.** Snapshot storage at countable truncations, with the firing-ordinal pattern up to the truncation. Replay assembles subsequent truncations via direct-limit per the Anderson–Putnam template.
- **Equivalence requires direct-limit comparison.** Per [aperiodic-regime-cohomology-via-direct-limit](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-cohomology-via-direct-limit.md)'s combinatorial restatement, two aperiodic settlings are MLD-equivalent iff their full firing-ordinal sets agree up to settling-shift. This is checkable per truncation; the global decision is the truncation-wise agreement composed via direct-limit.

Substrates with infinitary closures on uncountable-cofinality state spaces — the canonical example being [transfinite-induction settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/examples/transfinite-induction-settling.md) on $E = \omega_1$ — live in this regime. In practice, most engineering substrates restrict to transfinite-bounded prefixes; the aperiodic envelope is the structural envelope for the *limit case* the substrate could in principle reach.

## What the theorem rules out

- **Aperiodic substrates with countable-only fuel discipline.** Without scope-to-prefix policies, the engine cannot reach $\omega_1$. The substrate must either declare a bounded prefix at every scope or admit uncountable stage iteration.
- **Aperiodic substrates whose audit returns "settled" before $\omega_1$.** The substrate has misclassified — either it is actually transfinite-bounded (in which case re-classify) or the audit is reporting partial settlement (in which case the report must be flagged as such).
- **Aperiodic substrates federating endpoint state.** $H^1$-classes at every truncation are silently dropped; the federated substrate has incorrect cohomological signature at the $\omega_1$-scale.
- **Aperiodic substrates with endpoint-only snapshots.** Replay cannot reconstruct the firing-ordinal pattern; the snapshot is not replay-fidelity-correct.

## What the theorem requires

- The substrate's [regime record](../objects/regime-record.md) declares `regime: aperiodic`, with `rule-language-fragment: with-forall-blocks`, `base-finiteness` declaring at least one infinite component, and `state-space-cofinality: uncountable`.
- The substrate's [closure-rule system](../objects/closure-rule-system.md) contains $\forall$-block rules per [rule-language-realizability-determines-regime](rule-language-realizability-determines-regime.md).
- The fuel policy supports either uncountable-stage iteration or scope-to-bounded-prefix policies.
- The federation discipline ships truncation-trajectory or scopes to a transfinite-bounded prefix.
- The snapshot policy records firing-ordinal patterns at countable truncations.
- The regime record declares an `audit-cohomology-bound` or accepts firing-ordinal-pattern summaries.

## Position

Fourth and last of the four regime-engineering-envelope theorems. The aperiodic envelope is the substrate's *structural ceiling*: the maximal expressive range and the maximal engineering complexity. In practice, most engineering substrates declare transfinite-bounded or stricter regimes and scope to bounded prefixes when crossing into aperiodic territory; the aperiodic envelope is where the substrate's engineering meets the theory's deepest classification result, [aperiodic-regime classification](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/aperiodic-regime-classification.md), which classifies aperiodic settlings up to MLD-equivalence by their direct-limit $H^1$-class.
