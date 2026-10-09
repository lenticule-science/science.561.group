---
kind: theorem
status: proved
depends-on: [transfinite-induction-settling, aperiodic-classifying-invariant, aperiodic-regime-classification, settling-cohomology, settling-associated-sheaf]
---

# Classifying invariant of the transfinite-induction settling

For the [transfinite-induction settling](../examples/transfinite-induction-settling.md) $v$ on $E = \omega_1$:

$$H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U) \;\cong\; \bigoplus_{\mu < \omega_1, \, \mu \text{ countable limit}} \mathbb{Z},$$

a free abelian group of rank $\aleph_1$ with a canonical $\mathbb{Z}$-basis indexed by countable limit ordinals below $\omega_1$.
The [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) of $v$ is the all-ones element

$$\mathrm{cl}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu < \omega_1, \, \mu \text{ countable limit}} 1_\mu \;\in\; H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U).$$

## Proof

By Step 2 of the [aperiodic-regime classification](../../../references/aperiodic-regime-classification.md) proof, for each $\tau < \omega_1$,

$$H^1(\mathbf{T}^*_{\leq \tau}, \mathcal{F}_U) \;\cong\; \mathbb{Z}^{|L(\tau)|}$$

where $L(\tau)$ is the set of countable limit ordinals $\leq \tau$ at which the settling fires non-Scott-continuously.
For the transfinite-induction settling, *every* countable limit ordinal $\mu \leq \tau$ is such a firing — the closure rule fires non-Scott-continuously at every $\mu$ where the antecedent $\forall \alpha < \mu.\ v(P)(\alpha, \alpha) = \mathbf{t}$ first becomes satisfiable but where no finite sub-conjunction of antecedents would have triggered firing.

The directed-system transitions are inclusions of $\mathbb{Z}$-modules with one new generator per new countable limit ordinal.
The direct limit over $\tau < \omega_1$ is the free abelian group on countable limit ordinals below $\omega_1$.

The class $\mathrm{cl}\text{-}\mathrm{inv}(v) = [\mathbf{1}_{\mathcal{F}_U}]$ is the image under the direct-limit map of the identity class — which contributes $+1$ to the $\mu$-th basis coordinate at each countable limit ordinal $\mu$.
Summing across all such $\mu$ gives the all-ones element. $\square$

## Invariance under settling-shift

A shifted settling $v^{(\alpha_0)}$ starting from $v^{(\alpha_0)}_0(P)(\alpha_0, \alpha_0) = \mathbf{t}$ for some $\alpha_0 > 0$ yields the same class: the shift moves each limit-ordinal firing to a parallel position, and the direct-limit equivalence relation identifies the shifted copy with the original.
By [aperiodic-regime classification](../../../references/aperiodic-regime-classification.md), $v \sim_{\mathrm{MLD}} v^{(\alpha_0)}$.

## A structurally distinct settling

Consider the *every-second-limit* variant: same rule but firing only at even-indexed countable limit ordinals (under any fixed bijection $\omega_1 \to \{$ countable limits $\}$).
This $v'$ has $\mathrm{cl}\text{-}\mathrm{inv}(v')$ supported on only half the basis coordinates — a structurally distinct class from $\mathrm{cl}\text{-}\mathrm{inv}(v)$.
By [aperiodic-regime classification](../../../references/aperiodic-regime-classification.md), $v \not\sim_{\mathrm{MLD}} v'$.
