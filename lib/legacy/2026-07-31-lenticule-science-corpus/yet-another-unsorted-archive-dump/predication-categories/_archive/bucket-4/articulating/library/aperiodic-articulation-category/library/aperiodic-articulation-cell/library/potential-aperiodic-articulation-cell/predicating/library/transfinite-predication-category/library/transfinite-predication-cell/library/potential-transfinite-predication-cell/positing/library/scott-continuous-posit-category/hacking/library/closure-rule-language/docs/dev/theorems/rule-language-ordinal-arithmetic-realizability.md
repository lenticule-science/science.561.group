---
type: theorem
status: sketch
depends-on: [rule-language-fragment-realizability-refinement, transfinite-bounded-regime-realizability, aperiodic-regime-realizability]
---

# Rule-language fragment realizability: ordinal-arithmetic primitives

**Conjecture (ordinal-arithmetic primitives).** *Adding atoms like "$\beta = \alpha_1 + \alpha_2$" or "$\beta = \alpha \cdot c$" to the bare $\Pi_1$+$<$ rule language allows rule ranges definable in ordinal arithmetic. The realizable family conjecturally extends to subsets definable in this fragment of ordinal arithmetic — typically arithmetically-definable subsets of countable limits (in the sense of Kleene's arithmetical hierarchy on $\omega_1$).*

## What's open

- **Lower bound.** Constructive encoding of arithmetic predicates as rule ranges. The named-ordinal level (proved in the [parent refinement theorem](rule-language-fragment-realizability-refinement.md)) gives finite modifications of initial segments; ordinal-arithmetic should give arithmetically-definable subsets via range partitioning with arithmetic-defined ranges.

- **Upper bound.** Syntactic complexity tracking. Each rule's range is an ordinal-arithmetic-definable subset; the system's $L_{\mathrm{ns}}$ is a finite union of such ranges, expressible in the same fragment of ordinal arithmetic.
