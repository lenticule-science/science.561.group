---
type: theorem
class: engineering-claim
status: proved
depends-on: [regime-record, regime-classification-for-substrate, four-regime-dichotomy, scott-continuous-regime-realizability, scott-continuous-regime-cohomology-vanishing, scott-continuous-regime-mld-polynomial, scott-continuous-closure, transfinite-settling-convergence]
see-also: [strict-regime-engineering-envelope, transfinite-bounded-regime-engineering-envelope, aperiodic-regime-engineering-envelope, regime-discipline]
---

# Scott-continuous-regime substrates have an $\omega$-prefix-bounded, $H^1$-trivial, polynomial-MLD engineering envelope

**Claim.** Every conformant [predicated computer](../objects/predicated-computer.md) whose [regime record](../objects/regime-record.md) declares the *Scott-continuous* regime — equivalently, with quantifier-free [closure-rule language](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/closure-rule-language.md), at least one of $\mathbf{L}, E, \mathcal{C}$ infinite, and the closure operator [Scott-continuous](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/scott-continuous-closure.md) — has the following engineering envelope:

1. **Convergence.** Every settle invocation on a *finite prefix* of the substrate's content reaches quiescence in finitely many layers; the global limit at $\omega$ is the Scott-directed colimit and is well-defined per [transfinite-settling-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-settling-convergence.md). Closure ordinal $\kappa = \omega$.
2. **Audit cohomology.** The [inconsistency sheaf](../objects/inconsistency-sheaf-record.md)'s $H^1$ is identically zero (per [Scott-continuous-regime-cohomology-vanishing](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-cohomology-vanishing.md)); audit reduces to $H^0$-counts at the $\omega$-direct-limit.
3. **Federation.** Endpoint-state shipping is admissible *between Scott-continuous substrates whose finite prefixes have been settled*; trajectory shipping is over-engineered. Two Scott-continuous substrates federating produce a Scott-continuous substrate.
4. **Snapshot.** Endpoint-only snapshots at any finite prefix reproduce historical results byte-for-byte; the $\omega$-limit snapshot is the directed colimit.
5. **MLD-classification.** Two Scott-continuous settlings are MLD-equivalent iff their $H^0$-cell-sets agree up to settling-shift, decidable in time polynomial in settling length per [Scott-continuous-regime-mld-polynomial](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-mld-polynomial.md).

The envelope is what the engineering can *assume* about a Scott-continuous-regime substrate: each finite prefix is strict-like, and the global $\omega$-limit is the well-defined directed colimit of the prefixes — no firing-ordinal patterns, no $H^1$-classes.

## Why this holds

The five envelope items lift the strict-regime envelope from finite to $\omega$-prefix-bounded by applying Scott-continuity:

**Convergence (item 1).** Per [regime-classification-for-substrate](regime-classification-for-substrate.md), Scott-continuous regime requires quantifier-free rules and Scott-continuous closure. Per [four-regime-dichotomy](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md), this gives $\kappa = \omega$ — each finite prefix stabilizes in finitely many layers, and the $\omega$-limit is the directed colimit of the prefixes per [transfinite-settling-convergence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/transfinite-settling-convergence.md). Per [scott-continuous-regime-realizability](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-realizability.md), the realizable $L_{\mathrm{ns}}$-family on a Scott-continuous substrate is the $\omega$-prefix-bounded family — every realizable $L_{\mathrm{ns}}$-subset is the directed colimit of finite-prefix realizations, with no firing ordinals required. The engine handles each finite prefix at finite cost.

**Audit cohomology (item 2).** Per [Scott-continuous-regime-cohomology-vanishing](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-cohomology-vanishing.md), $H^n(\mathbf{T}^*, \mathcal{F}_U^{(\bullet)}) = 0$ for $n \geq 1$ via the Grothendieck AB5 colimit-commutation argument: each finite-stage cohomology vanishes (by the strict-regime result), and the filtered colimit of zero abelian groups is zero. This applies to the inconsistency-side component too. The substrate's [query-inconsistency-cohomology](../morphisms/query-inconsistency-cohomology.md) operator returns $H^0 = $ direct-limit count, $H^1 = 0$.

**Federation (item 3).** Per [federation-convergence](federation-convergence.md), federation between Scott-continuous substrates requires that each side's federation traffic is at a settled prefix (a finite prefix on which settle has reached quiescence). At settled prefixes, endpoint-state shipping is admissible because the prefix's $H^1 = 0$ — the cohomological content of the prefix is zero. Federation between finite prefixes composes into the federated substrate's $\omega$-limit at the standard directed-colimit cost.

**Snapshot (item 4).** Per [snapshot-replay-fidelity](snapshot-replay-fidelity.md), endpoint-only snapshots at finite prefixes are sufficient because each prefix is strict-like — the prefix's endpoint state contains the structural content. The $\omega$-limit snapshot is the directed colimit of finite-prefix snapshots; replaying from any prefix reproduces subsequent prefixes byte-for-byte.

**MLD-classification (item 5).** Per [Scott-continuous-regime-mld-polynomial](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/scott-continuous-regime-mld-polynomial.md), MLD-equivalence reduces to $H^0$-matching at sufficiently long finite truncations — polynomial in settling length on the truncation, with the comparison stabilizing at a finite truncation determined by the settlings' structure.

## Engineering consequence

A Scott-continuous-regime substrate is the *infinite-content but finitary-inference* case — the engineering envelope is bounded by finite prefixes, with the global $\omega$-limit a well-behaved directed colimit. Concretely:

- **The engine is finite-prefix-bounded.** Fuel policies declare per-prefix fuel; settle on each finite prefix consumes finite fuel. The global engine handles each prefix in turn; the $\omega$-limit is the union of prefix-settled results.
- **Audit is polynomial in prefix size.** Audit queries on each finite prefix run in polynomial time per the strict-regime envelope; the global audit is the colimit of prefix-audits, with the cost dominated by the largest queried prefix.
- **Federation is prefix-shipped.** Federation between Scott-continuous substrates exchanges settled-prefix endpoints, not trajectory. Federation handshakes are finite-prefix sized. The federated substrate's $\omega$-limit is the directed colimit of the federated prefixes.
- **Snapshots are prefix-anchored.** Snapshot storage scales with the prefix's settled state. Replay from any prefix snapshot reproduces subsequent prefixes byte-for-byte.
- **Equivalence is decidable in polynomial-prefix time.** "Are these two regions structurally equivalent?" is a polynomial-time MLD-comparison on a sufficient finite prefix.

Description logics over infinite domains with finitary inference, logic programming over infinite Herbrand bases, knowledge bases with countable entity spaces and finitary closure rules — all live in the Scott-continuous regime.

## What the theorem rules out

- **Scott-continuous substrates with transfinite-aware engine machinery.** Over-engineering at the prefix level. The substrate functions correctly on each prefix but consumes implementation effort on machinery the prefix cannot exercise.
- **Scott-continuous substrates whose audit machinery enumerates $H^1$-classes.** Always empty; the implementation is dead code per the regime.
- **Scott-continuous substrates shipping trajectory across federation.** The shipped trajectory contains no $H^1$-content; the federation handshake is over-sized.
- **Mistaking Scott-continuous regime for strict.** A substrate that bounds its content to a fixed finite prefix and forgets it could grow has under-declared its regime; if the prefix can grow at runtime, the substrate is Scott-continuous, not strict.

## What the theorem requires

- The substrate's [regime record](../objects/regime-record.md) declares `regime: scott-continuous`, with `rule-language-fragment: quantifier-free` and `base-finiteness` declaring at least one of $\mathbf{L}, E, \mathcal{C}$ infinite.
- The substrate's [closure-rule system](../objects/closure-rule-system.md) contains only quantifier-free rules per [rule-language-realizability-determines-regime](rule-language-realizability-determines-regime.md).
- Federation peers are also Scott-continuous (or stricter), or the federation traffic is scoped to a Scott-continuous-prefix per [federation-convergence](federation-convergence.md).

## Position

Second of the four regime-engineering-envelope theorems. The strict and Scott-continuous regimes share the same engineering character — finite or finite-prefix bounded, $H^1$-trivial, $H^0$-classified — distinguished only by whether the substrate's base is finite or has infinite components with finitary inference. The transfinite-bounded and aperiodic envelopes diverge sharply: $H^1$ becomes non-trivial, federation requires trajectory shipping, snapshots must record firing-ordinal patterns.
