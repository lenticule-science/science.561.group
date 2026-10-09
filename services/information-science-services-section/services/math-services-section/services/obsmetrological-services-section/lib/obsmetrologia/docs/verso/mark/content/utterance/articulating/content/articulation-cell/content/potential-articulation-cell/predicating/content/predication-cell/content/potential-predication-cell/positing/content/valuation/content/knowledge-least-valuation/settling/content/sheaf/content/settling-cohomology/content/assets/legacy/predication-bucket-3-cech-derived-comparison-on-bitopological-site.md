---
kind: theorem
status: proved
depends-on: [settling-cohomology, bitopological-settling-site, husainov-acyclicity, kz-coherent-sheaf]
---

# Čech computes derived cohomology under Husainov acyclicity

Let $F \in \mathrm{Sh}^{\mathrm{KZ}}(\mathbf{T}^*, J)$ and $\sigma < \infty$. If for every $\tau \leq \sigma$ the poset $(\mathcal{C}^{\mathrm{op}} \times \{\tau\}, \leq)$ — equipped with the restriction of $F$ to stage $\tau$ — satisfies the [[@husainov2026] acyclicity condition](../concepts/husainov-acyclicity.md), then

$$\check{H}^n(\mathbf{T}^*_{\leq \sigma}, F) \;\cong\; H^n(\mathbf{T}^*_{\leq \sigma}, F) \qquad \text{for all } n \geq 0.$$

Sufficient: $\mathcal{C}$ is finite, or $F$ is [predicate-locally-constant](../../../../../../settling-local-constancy/settling-local-constancy.md).

## Proof

The topology $J$ on the [bitopological settling site](../../../../../../bitopological-settling-site/bitopological-settling-site.md) decomposes into a fiber part (pairwise-Stone covers at fixed $(q, \tau)$) and a cross-ordinal/cross-predicate part (encoded entirely in morphisms, not in covers — see [why fiber covers only](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/why-fiber-covers-only.md)).

**Fiber part.** The pairwise-Stone clopens of a paired Priestley space form a Boolean algebra. For any constant sheaf $\underline{A}$ and any pairwise-Stone cover, $\check{H}^n(\mathcal{U}, \underline{A}) = A$ for $n = 0$ and $0$ for $n \geq 1$ — the standard Stone-space Čech vanishing in positive degree ([@bredon1997] Ch. III §2). Fiber Čech agrees with fiber derived-functor cohomology in this setting.

**Cross-ordinal / cross-predicate part.** Across the ordinal-predicate base, the sheafification acts as a *poset-sheafification* (the Alexandrov-topology equivalence between finite posets and finite topological spaces extends to bounded-ordinal cases). The [@husainov2026] Dedekind–MacNeille acyclicity condition is exactly what makes poset-Čech agree with poset-derived-functor cohomology on the base.

Combining: under the hypothesis, the fiber and cross-ordinal Čech cohomologies separately compute the corresponding derived-functor cohomologies, and the full $\check{H}^n = H^n$ comparison holds. $\square$

## Practical computation

For finite [strict regime](../../../../../../../references/four-regime-dichotomy.md) settlings the proposition applies directly: Čech on finite pairwise-Stone covers computes $H^n$. For the [transfinite-induction settling](../examples/transfinite-induction-settling.md), the base poset $(\mathcal{C}^{\mathrm{op}} \times \omega_1, \leq)$ is countable-in-predicate (one predicate $P$) and the Dedekind–MacNeille completion is $\omega_1 + 1$, where acyclicity reduces to transfinite continuity of the [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) along $\omega_1$-chains — verified as part of the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) construction.
