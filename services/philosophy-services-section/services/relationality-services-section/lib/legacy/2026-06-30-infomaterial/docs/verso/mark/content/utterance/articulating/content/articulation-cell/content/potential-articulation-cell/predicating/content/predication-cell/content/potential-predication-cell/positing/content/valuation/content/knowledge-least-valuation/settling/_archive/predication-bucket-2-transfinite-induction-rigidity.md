---
type: theorem
status: proved
depends-on: [transfinite-induction-settling, visible-automorphism-quotient, invisible-automorphism-subgroup, visible-automorphism-sources, predicate-generator-exhaustiveness, rigid-moduli-point]
---

# The transfinite-induction settling is a rigid moduli point

For the [transfinite-induction settling](../examples/transfinite-induction-settling.md) $v$ on $E = \omega_1$ with single predicate $P$, the natural visible-automorphism quotient is trivial:

$$\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) \;=\; \{1\}.$$

Equivalently, the entire natural settling-automorphism group $\mathrm{Aut}^\simeq_{\mathrm{nat}}(v)$ sits inside the [invisible automorphism subgroup](../concepts/invisible-automorphism-subgroup.md) $N(v)$.

## Proof

A natural automorphism $\phi$ acts cellwise as $\phi(x)(s, o) = x(g(s, o))$ for some bijection $g : E \times E \to E \times E$ ([predicate generator exhaustiveness](/predication-categories/library/predication-cell-complex-site/content/explanations/exhaustiveness-of-four-predication-cell-complex-site-generators.md)). State-compatibility $\phi(v_\tau) = v_\tau$ at each diagonal cell $(\alpha, \alpha)$ requires $v_\tau(g(\alpha, \alpha)) = v_\tau(\alpha, \alpha)$ for all $\tau$:

- At $\tau = \alpha$, the right side is $\mathbf{t}$, forcing $g(\alpha, \alpha) = (\beta, \beta)$ with $\beta \leq \alpha$.
- At $\tau = \alpha - 1$ (or any $\tau < \alpha$), the right side is $\bot$, forcing $g(\alpha, \alpha) \neq (\beta, \beta)$ for any $\beta < \alpha$.

Hence $g$ fixes the diagonal pointwise: $g(\alpha, \alpha) = (\alpha, \alpha)$ for every $\alpha < \omega_1$. Off-diagonal, $g$ may be an arbitrary bijection — the settling imposes no constraint on $\bot$-cells.

The [settling-associated sheaf](../objects/settling-associated-sheaf.md) $\mathcal{F}_U$ is the free abelian group on *newly-designated* cells, which for this settling are exactly the diagonal cells $\{(\alpha, \alpha) : \alpha < \omega_1\}$. Every natural auto fixes the diagonal pointwise, hence fixes every generator of $\mathcal{F}_U$, hence acts as the identity on $\mathcal{F}_U$. So $\mathrm{Aut}^\simeq_{\mathrm{nat}}(v) = N_{\mathrm{nat}}(v)$, and $\mathrm{Aut}^{\mathrm{vis}}_{\mathrm{nat}}(v) = \mathrm{Aut}^\simeq_{\mathrm{nat}}(v) / N_{\mathrm{nat}}(v) = \{1\}$. $\square$

## The four sources evaluated

By [visible automorphism sources](visible-automorphism-sources.md), check each candidate:

- **Gauge.** The negation $\sim$ would map the $\mathbf{t}$-valued settling to an $\mathbf{f}$-valued settling — a different settling, not an auto of $v$. Gauge does not stabilize $v$.
- **Fiber-swap** $(s, o) \mapsto (o, s)$ fixes the diagonal pointwise — acts trivially on $\mathcal{F}_U$. Invisible.
- **$\mathrm{Sym}(\omega_1)$-stabilizer** is trivial: each ordinal is distinguished by its settling-stage of designation.
- **Predicate-automorphism stabilizer** is trivial: $\mathcal{C}$ is one-object.

All four sources contribute only to $N(v)$.

## What is invisible here

The natural invisible-auto group $N_{\mathrm{nat}}(v)$ is large — it contains every bijection of the off-diagonal cells $\{(s, o) \in \omega_1 \times \omega_1 : s \neq o\}$, a group of cardinality $2^{\aleph_1}$. The entire natural automorphism structure of the transfinite-induction settling is invisible to the cohomology.

## A rigid moduli point

The transfinite-induction settling is a [rigid moduli point](../concepts/rigid-moduli-point.md): a point of the [coarse settling moduli](../objects/coarse-settling-moduli.md) whose visible automorphism group is trivial. Rigidity is typical of "diagonal-only" or otherwise pointwise-distinguishing settlings, where every auto fixes the newly-designated-cell set pointwise.
