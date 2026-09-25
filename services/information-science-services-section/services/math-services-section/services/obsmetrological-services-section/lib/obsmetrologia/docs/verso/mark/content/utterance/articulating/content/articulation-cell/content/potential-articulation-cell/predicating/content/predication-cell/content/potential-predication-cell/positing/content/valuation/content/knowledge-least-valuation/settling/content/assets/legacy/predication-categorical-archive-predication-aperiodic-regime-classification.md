---
type: theorem
status: proved
depends-on: [aperiodic-classifying-invariant, mutually-locally-derivable, settling-morphism, settling-cohomology, settling-associated-sheaf, anderson-putnam-direct-limit, four-regime-dichotomy, aperiodic-classification-via-firing-ordinal-bijection]
---

# Aperiodic-regime classification (common-base scope)

Let $v, v'$ be [aperiodic-regime](../../../references/four-regime-dichotomy.md) [predication settlings](../objects/predication-settling.md) over a *common base* $(\mathbf L, \mathcal C, E, \lambda)$ with $|E| \geq \omega_1$ and closure ordinals $\kappa, \kappa' \leq \omega_1$. Then

$$v \sim_{\mathrm{MLD}} v' \;\iff\; \mathrm{cl}\text{-}\mathrm{inv}(v) \,=\, \mathrm{cl}\text{-}\mathrm{inv}(v') \;\text{ in } H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal F_U^{\mathrm{univ}}),$$

where $\mathcal F_U^{\mathrm{univ}} := \mathcal F_U \oplus \mathcal F_{U'}$ is the universal [settling-associated sheaf](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/agent-computer-system-engineering-services-section/apps/agentic-relation-engine/lib/relating/docs/settling-associated-sheaf.md) on $\mathbf{T}^*_{\leq \omega_1}$ taken as ambient for the joint comparison, and $\sim_{\mathrm{MLD}}$ is [mutually-locally-derivable](teaching/explanations/mutually-locally-derivable.md) equivalence.

## Proof (delegated)

The common-base case is established by the [aperiodic classification via combinatorial firing-ordinal bijection theorem](../../aperiodic-settling/references/aperiodic-classification-via-firing-ordinal-bijection.md) (`status: proved`). That proof constructs the MLD-equivalence directly via a combinatorial bijection on firing ordinals, using the structural fact that settlings over a common base share the same closure operator $T$ (rules are part of the base, not the settling) — so matching firing-ordinal sets implies a rule-respecting cell-level bijection that extends to a settling-morphism.

The companion theorem's proof has two directions:

- *MLD ⇒ matching firing sets*: a settling-morphism with delay $\delta$ takes firings at $\mu$ to firings at $\mu + \delta$, hence $L_{\mathrm{ns}}(\kappa, v) + \delta = L_{\mathrm{ns}}(\kappa', v')$.
- *Matching firing sets ⇒ MLD*: construct entity- and predicate-bijections from firing-by-firing matching, extend to total bijections, verify rule-respecting via shared $T$.

The cohomological criterion is equivalent to the combinatorial one by the [combinatorial restatement](../../aperiodic-settling/references/aperiodic-regime-cohomology-via-direct-limit.md): $\mathrm{cl}\text{-}\mathrm{inv}(v) = \mathrm{cl}\text{-}\mathrm{inv}(v')$ iff $L_{\mathrm{ns}}(\kappa, v) \cong L_{\mathrm{ns}}(\kappa', v')$ as settling-shift-classes. $\square$

## Scope: common-base only

This theorem's scope is **settlings over a common base**: same predicate category $\mathcal C$, same entity set $E$, same residuated lattice $\mathbf L$, same bound $\lambda$. Settlings differ only in initial-state / increment-sequence data; the closure operator $T$ is shared.

The base-changing analog — MLD-equivalence between aperiodic settlings over *different* bases, related by a base morphism $(\mathbf L, \mathcal C, E, \lambda) \to (\mathbf L', \mathcal C', E', \lambda')$ — is **not** addressed here. That extension requires more substantial machinery (fibered coinduction in the Hermida–Jacobs sense, or its corpus analog) and is the subject of a separate theorem.

See [aperiodic-regime classification: base-changing extensions](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/aperiodic-classification-base-changing-extensions.md) (`status: sketch`) for that direction.

## Cardinality scope

The hypothesis $|E| \geq \omega_1$ ensures that a settling reaching closure ordinal $\omega_1$ has $\omega_1$-many distinct cells to add. For $|E| < \omega_1$ with $\kappa = \omega_1$, the settling re-enters previously-populated cells via non-trivial morphisms; the classification still applies but with a refined MLD-equivalence allowing settling-shifted coincidence — not pursued here.

## Corollary — distinguishing power

Two aperiodic settlings $v, v'$ over a common base with the same closure ordinal $\kappa$ but structurally different closure rules — so that no invertible settling-morphism exists — have distinct classes $\mathrm{cl}\text{-}\mathrm{inv}(v) \neq \mathrm{cl}\text{-}\mathrm{inv}(v')$.

(This corollary is in the common-base scope of this theorem because "different closure rules" requires the closure rules to be *part of the settling data being compared* — i.e., the bases differ in their rule systems. Strictly within the common-base scope where rules are shared, this corollary is vacuous.)

## Co-classification via cosheaf homology

With [Verdier duality on the bitopological settling site](verdier-duality-bitopological-site.md) established (at sketch level, uniformly across all four regimes via the cellular extension plan), the classifying invariant admits a *dual* presentation as a cosheaf homology class — the [aperiodic co-classifying invariant](../objects/aperiodic-co-classifying-invariant.md). The corresponding [aperiodic co-classification theorem](aperiodic-co-classification.md) gives the same MLD-classification via cosheaf homology $H_1$ rather than sheaf cohomology $H^1$.

The two presentations encode the same firing-ordinal data, related by Verdier duality. The corpus thus has *two* parallel classifying invariants for aperiodic settlings — paired by the Verdier equivalence.
