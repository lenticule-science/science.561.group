---
type: narrative
status: current
introduces: [step-n-substitution-recurrence, step-n-substitution-rule, step-n-classifying-invariant, step-n-moduli-substack, step-shift-morphism, alphabet-extension-morphism, step-n-cohomological-rank-theorem, step-shift-functoriality-theorem, step-n-meta-stratification, step-n-and-bilattice-correspondence, step-n-fixed-point, critical-exponents-at-step-n-fixed-point, renormalization-group-flow]
discusses: [aperiodic-classifying-invariant, four-bilattice, anderson-putnam-direct-limit, meta-stratification-by-regime]
---

# The step-n correspondence: a multi-level structural pattern

A pattern in the corpus that surfaced from the [Fibonacci/Padovan observation](../../examples/fibonacci-substitution-settling.md): a **single parameter $n \geq 2$ appears throughout predication categories' substitution-flavored content**, controlling multiple structural quantities that increment together. The pattern recurs at multiple structural levels — recurrence depth, alphabet size, cohomological rank, minimal polynomial degree, possibly bilattice-structure correspondence, and possibly closure-monad coherence depth — making it predication categories' first **multi-level structural correspondence**.

This narrative is the *integrating articulation* — listing every level the +1 increment shows up at, framing the multi-level pattern as a unified phenomenon, and noting that further readings beyond those identified here may exist.

## The multi-level co-incrementing

Identified levels at which the +1 increment recurs:

| Level | Quantity at step-$n$ |
|---|---|
| Substitution recurrence | $n$-term recurrence ($a_k = $ function of prior $n$ terms) |
| Substitution alphabet | $n$ distinct letters in the substitution alphabet |
| Substitution matrix | $n \times n$ matrix |
| Cohomological rank (post-quotient) | rank-$n$ Anderson-Putnam invariant |
| Minimal polynomial degree | growth rate is degree-$n$ algebraic number |
| Pisot-number type | step-$n$ rules' growth rates are Pisot numbers in degree-$n$ classes |
| Possibly: rule-language fragment depth | $\Pi_{n-1}$ or analog |
| Possibly: bilattice-structure correspondence | $n$ aligns with bilattice's $n$-element internal substructure ($n = 2, 3, 4$) |
| Possibly: closure-monad coherence depth | $n$-cell coherence at step-$n$ |
| Possibly: deformation-rank exponent | rank-$n$ deformation tangent space (matching cohomology rank) |
| Possibly: orbit-type stratum count | $n$ orbit types in strong-MLD classification at step-$n$ |

The first six levels are *established* by the step-$n$ family's foundational theorems. The "Possibly" levels are conjectural — supported by structural arguments but not yet verified at draft level.

## What the pattern reveals

Three structural insights:

**1. The corpus has internal renormalization-group structure.** The step parameter $n$ is predication categories' first "scale parameter," with morphisms between scales (the [step-shift morphism](../../morphisms/step-shift-morphism.md)) and a candidate fixed point (the [colimit at infinite step depth](../../objects/step-n-fixed-point.md)). This is unusual for a topos-theoretic / categorical-logic framework — RG-flow structure is more typical of dynamical-systems / physics frameworks. The corpus's bilattice + substitution-rule combination produces the RG-flow naturally.

**2. The bilattice's internal structure aligns with the step-$n$ hierarchy at specific levels.** Per the [step-n / bilattice correspondence theorem](../../theorems/step-n-and-bilattice-correspondence.md) (sketch), the bilattice's 2-axis, 3-non-bottom-value, and 4-element structures align with $n = 2, 3, 4$ respectively. The corpus's bilattice flavor is not just a value-category choice; it's *structurally aligned* with the substitution hierarchy at three specific natural levels.

**3. The Anderson-Putnam framework is one *level* of a richer structure.** Anderson-Putnam's classification of substitution tilings gives the rank-$n$ post-quotient invariant. The corpus's framework refines this: pre-quotient classifying invariants carry uncountable rank; post-quotient (Anderson-Putnam) carries rank $n$; and the *family across $n$* carries an additional inter-level structure (the RG flow). The Anderson-Putnam result is the post-quotient view at fixed $n$; predication categories' view extends this to a parameterized family with morphisms.

## Open: further readings

The pattern's level-list above is not exhaustive. Several "Possibly" levels are conjectural; verifying or refuting them is open. And there may be levels not identified here at all — the pattern's openness is a feature, not a bug.

Specifically open:

- **Is $n$-step-coherent closure 2-monad a real structure?** The corpus's closure 2-monad is lax-idempotent (2-cell coherence); could there be an $n$-cell coherent variant for step-$n$ rules?
- **Does the strong-MLD orbit-type stratification refine to $n$ types at step-$n$?** Currently the strong-MLD has 3 orbit types (truth-only / falsity-only / $\top$) — not obviously matching arbitrary $n$.
- **Is there a Lindenbaum-Tarski-style "theory hierarchy" at each $n$?** The closure-rule-language fragment could be parameterized by $n$ in specific ways.
- **What's the connection to the [(∞, 1)-direction](higher-categorical-direction.md)?** RG flow is naturally an ∞-categorical object; the step-$n$ family might be predication categories' first concrete (∞, 1)-instance.

These are the open frontier of the step-$n$ correspondence direction.

## Position in predication categories

This narrative is the *integrating document* for the step-$n$ direction. It articulates the multi-level pattern as a unified phenomenon, with the foundational machinery ([concept](../../teaching/explanations/step-n-substitution-recurrence.md), [objects](../../objects/step-n-substitution-rule.md), [morphisms](../../morphisms/step-shift-morphism.md), [theorems](../../theorems/step-n-cohomological-rank-theorem.md), and [RG narrative](renormalization-group-flow.md)) as the structural foundations.

Companion narrative [Pisot numbers, substitutions, and the corpus](pisot-substitutions-and-the-corpus.md) (forthcoming) connects the family to established literature.
