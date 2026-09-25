---
kind: theorem
status: proved
depends-on: [settling-moduli-stack-theorem, combined-cohomology-classifying-morphism, combined-classifying-mld-invariance, parameter-base-topology, sheaf-functoriality-on-bitopological-site]
---

# The classifying morphism is a morphism of stacks

The [combined cohomology classifying morphism](../morphisms/combined-cohomology-classifying-morphism.md) is a morphism of 1-stacks on $(\mathbf{B}, J_\mathbf{B})$:

$$\mathrm{cl}\text{-}\mathrm{inv}^{(0, 1)} \,:\, \mathscr{M}^{\mathrm{vis}} \;\to\; \underline{H}^{(0, 1)},$$

where $\mathscr{M}^{\mathrm{vis}}$ is the visible [settling moduli stack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md) and $\underline{H}^{(0, 1)}$ is the *cohomology-class target stack* whose fiber at $B \in \mathbf{B}$ is

$$\underline{H}^{(0, 1)}(B) \;=\; H^0(\mathbf{T}^*(B), \mathcal{F}_U) \,\oplus\, H^1(\mathbf{T}^*(B), \mathcal{F}_U).$$

## The target stack

$\underline{H}^{(0, 1)}$ is constructed as the stack of $(H^0 \oplus H^1)$-cohomology classes for [settling-associated sheaves](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) on the [bitopological settling site](../../../../bitopological-settling-site/bitopological-settling-site.md).
Descent for cohomology classes follows from Vistoli-descent applied to sheaves of abelian groups — a standard special case where the sheaf condition on $\mathbf{Ab}$-valued sheaves transports to a stack condition on cohomology classes.

## Proof

The classifying morphism is defined fiberwise (over fixed base $B$) by [combined classifying MLD-invariance](combined-classifying-mld-invariance.md): well-defined on MLD-classes; injective on each regime stratum (regime-by-regime by [aperiodic-regime moduli classification](../../../references/aperiodic-regime-moduli-classification.md), [transfinite-bounded-regime moduli classification](../../../../../references/transfinite-bounded-regime-moduli-classification.md), and [combinatorial classification across regimes](combinatorial-classification-across-regimes.md)).

That the fiberwise morphism glues into a stack morphism follows from the base-change statement implicit in the [sheaf functoriality on the bitopological site](../../../../bitopological-settling-site/references/sheaf-functoriality-on-bitopological-site.md): a base-change $(\ell, e, \pi, \phi_\lambda) : B \to B'$ in $\mathbf{B}$ induces a morphism of bitopological settling sites, and hence functorial maps on cohomology.
This is a corollary of the six-step descent of the [settling moduli stack theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md) combined with standard cohomological functoriality. $\square$

## Reading

This is the moduli-stack-level statement of the [aperiodic-regime classification theorem](../../../references/aperiodic-regime-classification.md) and its analogues — globalizing the fixed-base injection into a stack morphism that tracks how moduli points map to cohomology classes as the base parameters vary.

The morphism is *injective on each fiber* (regime-by-regime per the classification theorems) but its global *image* is the open [realizability of cohomology classes](../questions/realizability-of-cohomology-classes.md) question: which cohomology classes are realized by some settling over some base?

This is the moduli's fundamental classifying datum — the most structurally informative invariant the program supplies, packaged as a stack morphism rather than just a fiberwise function.
