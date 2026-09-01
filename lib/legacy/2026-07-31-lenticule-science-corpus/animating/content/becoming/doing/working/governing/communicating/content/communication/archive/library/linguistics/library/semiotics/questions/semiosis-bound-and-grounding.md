---
type: question
status: open
explores:
  - teaching/explanations/interpretant.md
  - teaching/explanations/code.md
  - ../theorems/unlimited-semiosis-as-fixpoint.md
see-also:
  - references/peirce-cp.md
  - references/eco1976.md
  - references/eco1984.md
---

# Does unlimited semiosis admit a structural bound, and how is the bound grounded?

The discipline carries two structurally incompatible commitments on the [interpretant](teaching/explanations/interpretant.md) chain. Peirce (per [Peirce CP](references/peirce-cp.md)) holds the chain open: each interpretant generates further interpretants without a structural cap, and the chain converges only in the *indefinite prolongation of inquiry*. Eco (per [Eco 1976](references/eco1976.md), elaborated in [Eco 1984](references/eco1984.md)) holds the chain *bounded* by an *encyclopedia* — a culturally-constituted body of admissible interpretants — and treats unbounded semiosis as a structural defect (semiotic *drift* leading to interpretation that is no longer disciplined by what the sign-act licenses).

The open question:

> What *substrate-level structural fact* distinguishes Peircean openness from Eco-style boundedness, and what *grounds* the bound when it exists?

## Statement

Let $\mathcal{S}$ be a [semiotic system](../objects/semiotic-system.md) and $r_0$ a starting sign-relation. Per the [unlimited-semiosis-as-fixpoint](../theorems/unlimited-semiosis-as-fixpoint.md) theorem-sketch, the unlimited-semiosis chain converges to the bilattice-$\leq_k$-least fixpoint of the system's closure operator $T_R$ on the fiber of $r_0$. The chain's *regime* (Scott-continuous → bound at $\omega$; transfinite-bounded → bound at $\kappa < \omega_1$; aperiodic → no bound) is determined by $R$.

The question has two parts:

1. **Existence.** Under what conditions on $\mathcal{S}$ does the chain admit a bound (any countable ordinal at which $T_R^\kappa(v_0)$ stabilises)?
2. **Grounding.** When the bound exists, what *grounds* it — what *structural fact about $\mathcal{S}$* makes $\kappa$ what it is rather than something else?

## Decomposition

### Sub-question A — Eco's encyclopedia as Scott-continuity claim

Eco's encyclopedia bound is, on its face, a cultural-historical *constraint*: working communities operate codes that admit only a finite (or finitely-presentable) body of interpretants. The substrate-level reading translates this into a *regime* claim: encyclopedia-bounded codes are Scott-continuous, with the closure operator converging at $\omega$.

The sub-question: is the translation faithful? Does *every* working semiotic system whose interpretant chain is encyclopedia-bounded operate a Scott-continuous closure? Are there working systems that are encyclopedia-bounded *but* whose closure is genuinely transfinite (the bound coming from something other than continuity of the operator)?

### Sub-question B — Peircean openness as transfinite regime claim

Peirce's open chain is, on its face, a metaphysical commitment: meaning is the totality of practical bearings, derivable only in the indefinite prolongation of inquiry. The substrate-level reading translates this into the transfinite-bounded regime: closure converges at some countable ordinal $\kappa$, with the prolongation indexed by ordinals.

The sub-question: is the translation faithful? Does Peirce's commitment require the chain to be *transfinite-but-bounded*, or *aperiodic* (no countable bound at all)? The aperiodic regime would mean no convergent reading exists, which appears to clash with Peirce's claim that the final interpretant exists in the indefinite prolongation.

### Sub-question C — Grounding of the bound, when one exists

When a bound $\kappa$ exists, what *grounds* it? Three candidates:

- **Cardinality of the encyclopedia.** $\kappa$ is bounded by the cardinality of the admissible-interpretant set. This is the simplest reading of Eco's bound.
- **Closure-rule arity bound.** $\kappa$ is bounded by the maximum arity of the closure rules: rules of bounded arity converge at $\omega$; rules of arbitrary finite arity converge at $\omega^\omega$; rules of countable arity converge transfinitely below $\omega_1$.
- **Semiosphere-memory bound.** Per [Lotman 1990](references/lotman1990.md), the semiosphere's accumulated memory bounds what can be drawn into any new interpretation; $\kappa$ is bounded by the memory's complexity.

The three candidates can hold simultaneously (the bound is the *minimum* of the three) or one can dominate; the discipline does not yet know which.

### Sub-question D — Interaction with the four-regime classification

The substrate's [four-regime dichotomy](../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/four-regime-dichotomy.md) classifies closure-rule systems into strict, Scott-continuous, transfinite-bounded, and aperiodic regimes. The sub-question: does the semiotic-system regime classification (Peircean vs. Saussurean vs. Hjelmslevian vs. Lotmanian) land cleanly in the four-regime classification, or do semiotic systems exhibit regime-mixing the substrate's classification does not yet name?

## What is established

- The bound, if it exists, *is* the closure operator's convergence ordinal — this follows directly from the [unlimited-semiosis-as-fixpoint](../theorems/unlimited-semiosis-as-fixpoint.md) theorem-sketch.
- The bound is *not* a cap externally imposed on the chain; it is a property of the closure operator itself, derivable from $R$.
- Encyclopedia-bounded codes whose interpretant-operations are bounded-arity *do* admit a Scott-continuous closure and converge at $\omega$ — this is the substrate-level reading of Eco's regime claim.

## What remains open

- Whether *every* encyclopedia-bounded system is Scott-continuous (sub-question A).
- Whether Peirce's open chain is transfinite-bounded or aperiodic (sub-question B).
- Which of the three candidate groundings dominates when a bound exists (sub-question C).
- Whether the historical semiotic systems land cleanly in the four-regime classification (sub-question D).

## Why it matters

Resolving this question would settle three downstream questions the discipline depends on:

1. **Whether semiotic systems can be classified by their regime alone**, or whether further structural data is needed.
2. **Whether translation across two systems' regimes is structurally constrained** (e.g., translating a transfinite system into a Scott-continuous one would require explicit collapse of the transfinite chain into a finite encyclopedia).
3. **Whether the substrate-level [composability narrative](teaching/explanations/composability-with-predicated-knowledge-systems.md)'s identification of semiotic systems with predicated knowledge systems is faithful** in the strong sense: every semiotic system is a substrate-instance, with the regime-class transparent across the bridge.

A tractable next step is to characterise the regime of each of the four worked examples ([peircean](../examples/peircean-system.md), [saussurean](../examples/saussurean-system.md), [hjelmslevian](../examples/hjelmslevian-system.md), [lotmanian](../examples/lotmanian-system.md)) explicitly, with the closure-rule structure of each made operational; the partial classifications already in those notes would become candidate theorems.
