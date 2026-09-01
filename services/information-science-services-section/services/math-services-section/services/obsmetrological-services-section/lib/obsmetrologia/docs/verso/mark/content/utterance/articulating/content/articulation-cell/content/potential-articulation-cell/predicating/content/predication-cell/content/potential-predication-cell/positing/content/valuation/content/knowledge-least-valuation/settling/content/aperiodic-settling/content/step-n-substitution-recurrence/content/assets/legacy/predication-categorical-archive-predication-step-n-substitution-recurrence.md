---
type: concept
class: structural-parameter
depends-on: [closure-rule-system, closure-rule-language, four-bilattice, aperiodic-classifying-invariant]
---

# Step-n substitution recurrence

A structural parameter $n \geq 2$ that appears throughout predication categories' framework when looking at substitution-dynamics-flavored content. The same $n$ controls multiple seemingly-independent structural quantities, which all increment together — the corpus has an internal *step-n hierarchy* that recurs across structural levels.

## The co-incrementing observation

For a substitution closure rule of "step depth" $n$:

| Level | Quantity at step-$n$ |
|---|---|
| Substitution recurrence | $n$-term recurrence ($a_k = a_{k-1} + \cdots$ with $n$ prior-term dependencies) |
| Substitution alphabet | $n$ letters in the substitution alphabet |
| Cohomological rank (post-quotient) | rank-$n$ Anderson-Putnam invariant |
| Minimal polynomial degree of growth rate | degree-$n$ algebraic number (Pisot-type) |
| Rule-language fragment | $\Pi_{n-1}$ or similar (look-back-$n$ structure expressible at depth $n-1$) |
| Bilattice-structure correspondence | $n$ aligns with bilattice's $n$-element internal structure (axes / non-bottom values / full values) |

Each quantity at step-$n$ is exactly $n$ — they all increment together as $n$ varies. **A "+1" shift in any one of these structural levels propagates to a "+1" in all the others.** The corpus's framework parameterizes substitution-flavored content by this single $n$.

## Concrete instances

- **$n = 2$** (Fibonacci substitution $a \mapsto ab, b \mapsto a$): 2-term recurrence ($F_k = F_{k-1} + F_{k-2}$), 2-letter alphabet, $\check{H}^1 \cong \mathbb{Z}^2$, growth rate $\phi$ (degree-2 algebraic), bilattice-axis correspondence ($\{a, b\}$ ↔ $\{$knowledge-order, truth-order$\}$).
- **$n = 3$** (Padovan substitution $a \mapsto b, b \mapsto c, c \mapsto ab$): 3-term recurrence ($P_k = P_{k-2} + P_{k-3}$), 3-letter alphabet, $\check{H}^1 \cong \mathbb{Z}^3$, growth rate $\rho$ (the plastic number, degree-3 algebraic), bilattice-non-bottom-value correspondence ($\{a, b, c\}$ ↔ $\{\mathbf{t}, \mathbf{f}, \top\}$).
- **$n = 4$** (Tetranacci-style substitution): 4-term recurrence, 4-letter alphabet, $\check{H}^1 \cong \mathbb{Z}^4$, degree-4 algebraic growth rate, full-bilattice-value correspondence ($\{a, b, c, d\}$ ↔ $\{\bot, \mathbf{t}, \mathbf{f}, \top\}$).

The pattern extends to any $n \geq 2$, giving an infinite parameterized family of substitution-flavored closure-rule systems.

## What the parameter measures

The step-$n$ parameter is *not* an arbitrary cardinality — it's a *structural depth* that emerges from how predication categories' bilattice, closure-rule, and substitution-dynamics machinery interact. Specifically:

1. **Recurrence-depth:** how far back in the settling history the closure rule's antecedent depends on. Step-$n$ rules have antecedent depending on prior $n$ stages.

2. **Cohomological-rank:** the post-shift-quotient classifying invariant of a step-$n$ substitution settling has rank exactly $n$, by the [step-n cohomological rank theorem](../theorems/step-n-cohomological-rank-theorem.md) (forthcoming).

3. **Algebraic-number-degree:** the substitution's growth rate is a degree-$n$ algebraic number (typically a Pisot number satisfying a specific minimal polynomial).

4. **Bilattice-correspondence:** at $n = 2, 3, 4$, the substitution alphabet aligns with the bilattice's intrinsic structure at increasing levels of completeness — axes, non-bottom values, full values respectively.

## Why "+1" propagates

The "+1" propagation isn't a coincidence. The substitution alphabet's cardinality determines:
- The recurrence depth (one term in the recurrence per alphabet letter).
- The matrix size of the substitution matrix (one row/column per letter), hence the cohomology rank.
- The minimal polynomial degree of the growth rate (the characteristic polynomial of the substitution matrix is degree-$n$).

These are *inherent* to substitution-matrix theory (Perron-Frobenius for primitive substitutions). What's distinctive to predication categories' framework is the *additional* "+1" propagation to:
- The bilattice-structure alignment (corpus's bilattice flavor makes this visible).
- The closure-monad coherence depth (speculative — possibly an $n$-cell coherence at step-$n$, not yet verified).
- The rule-language fragment depth (step-$n$ rules natural in $\Pi_{n-1}$ or similar fragment).

## Position in predication categories

The step-$n$ parameter is predication categories' first internal *renormalization-style* structural parameter — a single scaling parameter that controls multiple structural quantities at once, with morphisms relating different scales. The [step-shift morphism](../morphisms/step-shift-morphism.md) (forthcoming) acts as the RG flow on the parameterized family, and the [step-shift functoriality theorem](../theorems/step-shift-functoriality-theorem.md) (forthcoming) establishes the family's natural ascending-chain structure.

Used by:
- [step-n-substitution-rule](../objects/step-n-substitution-rule.md) — the formal closure-rule object parameterized by $n$.
- [step-n-classifying-invariant](../objects/step-n-classifying-invariant.md) — the rank-$n$ classifying invariant.
- [step-n-moduli-substack](../objects/step-n-moduli-substack.md) — the meta-moduli sub-stack of step-$n$ rules.
- [step-n correspondence narrative](prose/teaching/explanations/step-n-correspondence.md) — the integrating articulation of the multi-level pattern.
- [Pisot-substitutions-and-the-corpus narrative](prose/teaching/explanations/pisot-substitutions-and-the-corpus.md) — connection to algebraic number theory and substitution dynamical systems literature.

The concept is a *structural unifier* — articulating that many of predication categories' substitution-flavored content (Fibonacci, Padovan, Tribonacci, Tetranacci, Penrose) share a common parameterization, with each specific substitution being one instance of a broader family.
