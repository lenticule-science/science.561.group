---
kind: theorem
status: proved
depends-on: [stabilizing-regimes-combinatorial-classification, moduli-classifying-function, four-regime-dichotomy, predicate-category-naturality, increment-sequence, closure-rule, settling-cohomology-vanishes-above-degree-1]
---

# Strict-regime realizability

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$ with finite $\mathbf{L}$, finite $\mathcal{C}$, finite $E$, and $\lambda < \omega$, the [moduli classifying function](../morphisms/moduli-classifying-function.md) $\mathcal{I}_B$ restricted to the strict regime stratum is *surjective onto its codomain*. Combined with [stabilizing-regimes combinatorial classification](stabilizing-regimes-combinatorial-classification.md)'s injectivity, $\mathcal{I}_B$ is a bijection on the strict stratum.

Concretely: every $\mathcal{C}$-natural eventually-designated-cell configuration $\Sigma$ on a finite base — i.e., any family $(\Sigma_p)_{p \in \mathcal{C}}$ with $\Sigma_p \subseteq \mathrm{dom}(p) \subseteq E \times E$ such that $f^*(\Sigma_p) = \Sigma_q$ for every $\mathcal{C}$-morphism $f : q \to p$ — is realized as the eventually-designated-cell pattern of some MLD-class of strict-regime knowledge presheaves over $B$.

## Proof

For each $\mathcal{C}$-natural configuration $\Sigma$, construct an increment sequence $U^\Sigma$ supplying the cells of $\Sigma$ at stage 0:

$$u_0(p)(s, o) := \begin{cases} \mathbf{t} & (s, o) \in \Sigma_p, \\ \bot & \text{otherwise,} \end{cases} \qquad u_\tau = \bot \text{ for } \tau > 0.$$

By $\mathcal{C}$-naturality of $\Sigma$, $u_0$ is a $\mathcal{C}$-natural [predication valuation](../objects/predication-valuation.md), so $U^\Sigma$ is an admissible [increment sequence](../objects/increment-sequence.md).

Take the empty closure-rule system. The closure operator generated is the identity. The settling is constant: $v_\tau = u_0$ for all $\tau$. The eventually-designated-cell configuration of $v$ is exactly $\Sigma$.

By [settling cohomology vanishes above degree 1](settling-cohomology-vanishes-above-degree-1.md) plus strict-regime $H^1$-vanishing, the sheaf-iso class of $\mathcal{F}_U$ is determined by $\Sigma$ alone. Distinct $\mathcal{C}$-natural configurations $\Sigma \neq \Sigma'$ produce distinct sheaf-iso classes (by strict-regime classification). The image of $\mathcal{I}_B$ on the strict stratum therefore contains every $\mathcal{C}$-natural configuration, and contains them with distinct sheaf-iso classes — establishing surjectivity onto the codomain. $\square$

## Reading

The strict regime's realizability is *trivially full*: any $\mathcal{C}$-natural cell configuration can be realized by setting it directly via the increment sequence. The triviality reflects the regime's structural simplicity — finite settling, no transfinite firing, $H^1 = 0$ — and the absence of any cohomological obstruction.

The only realizability constraint is $\mathcal{C}$-naturality of the configuration; no rule-language constraint, no firing-ordinal constraint, no bigraded constraint applies beyond what $\mathcal{C}$-naturality already imposes.

## Where the substance lives

The substance of strict-regime realizability is in the *combinatorial enumeration*: how many $\mathcal{C}$-natural configurations exist on a given finite base. This is a finite-$\mathcal{C}$-combinatorics problem, not a cohomological one. For one-object $\mathcal{C}$ on a finite $E$, the number is $2^{|E|^2}$ (configurations of a single subset of $E \times E$); for richer $\mathcal{C}$, it is the number of $\mathcal{C}$-natural families, bounded above by the same. The [single-entity moduli](../examples/single-entity-moduli.md) and [two-entity moduli](../examples/two-entity-moduli.md) examples exhaust the moduli over the smallest non-trivial bases via this enumeration.

## Position in the realizability program

Together with [Scott-continuous-regime realizability](scott-continuous-regime-realizability.md), establishes the $H^1 = 0$ branch of the program: realizability is unconstrained beyond $\mathcal{C}$-naturality. The substantive cohomological realizability questions arise only in the [transfinite-bounded](transfinite-bounded-regime-realizability.md) and [aperiodic](aperiodic-regime-realizability.md) regimes.
