---
type: example
status: draft
depends-on: [step-n-substitution-rule, step-n-substitution-recurrence, fibonacci-substitution-settling, aperiodic-settling, aperiodic-settling-sketch]
instantiates: [step-n-substitution-rule, aperiodic-settling]
lineage: 5
---

# Padovan substitution settling

Anchor of **sub-lineage 5d** — the Padovan substitution $\sigma : a \mapsto b, b \mapsto c, c \mapsto ab$ encoded as a [step-3 substitution rule](../objects/step-n-substitution-rule.md). The first non-Fibonacci substantive aperiodic example in the corpus and the **canonical step-$n$ instance at $n = 3$**.

## The Padovan recurrence

The Padovan sequence is defined by $P_n = P_{n-2} + P_{n-3}$ with $P_0 = P_1 = P_2 = 1$. So $1, 1, 1, 2, 2, 3, 4, 5, 7, 9, 12, 16, 21, 28, \ldots$ — slower-growing than Fibonacci.

The associated substitution acts on the alphabet $\{a, b, c\}$:

- $\sigma(a) = b$
- $\sigma(b) = c$
- $\sigma(c) = ab$

Substitution matrix:

$$M_{\text{Padovan}} \;=\; \begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 1 & 1 & 0 \end{pmatrix}.$$

Characteristic polynomial: $\det(xI - M) = x^3 - x - 1$. Dominant eigenvalue: $\rho \approx 1.3247$ — the **plastic number**, smallest Pisot number.

## Setup

- $\mathbf{L} = \mathbf{2}$.
- [Entity set](../objects/entity-set.md) $E = \omega_1$.
- [Predicate set](../objects/predicate-set.md) $\Pi = \{P_a, P_b, P_c\}$ — three predicates, one per substitution letter.
- $\mathcal{C}$: discrete three-object category.
- [Settling bound](../objects/settling-bound.md) $\lambda = \omega_1 + 1$.

## Closure rule

The Padovan substitution as a step-3 closure rule:

$$\sigma_{\text{Padovan}} : (P_a(\alpha)) \implies P_b(2\alpha) \;\wedge\; (P_b(\alpha)) \implies P_c(2\alpha) \;\wedge\; (P_c(\alpha)) \implies P_a(2\alpha) \wedge P_b(2\alpha + 1)$$

(modulo precise ordinal-arithmetic encoding for transfinite settlings). Starting with a single $a$-tile at $\alpha = 0$, the substitution iteration produces successive Padovan-sequence-like tile patterns.

## Closure ordinal and regime

$\kappa = \omega_1$. **Aperiodic regime**, same as Fibonacci.

## Position in Lineage 5d

The L5d anchor — Padovan as the canonical step-3 instance. Subsequent L5d examples compute concrete invariants:

- [padovan-classifying-invariant](padovan-classifying-invariant.md) — rank-3 by step-n rank theorem.
- [padovan-anderson-putnam-comparison](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/padovan-anderson-putnam-comparison.md) — comparison with literature Padovan tiling cohomology.
- [padovan-strong-mld-orbit](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/padovan-strong-mld-orbit.md), [padovan-verdier-dual](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/padovan-verdier-dual.md), [padovan-meta-classification](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/padovan-meta-classification.md), [padovan-deformation-tangent](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/padovan-deformation-tangent.md) — full chapter walk parallel to Fibonacci's L5a.

## Position in the step-$n$ family

Padovan is the canonical step-3 substitution. Its growth rate $\rho$ (the plastic number) is the smallest Pisot number — Padovan sits at the *minimum* of the Pisot accumulation hierarchy. As such, it's predication categories' natural "first non-trivial" instance after Fibonacci's $\phi$.
