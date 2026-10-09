---
type: narrative
discusses: [aperiodic-regime-classification, crdt-convergence-via-mayer-vietoris, settling-cohomology, bitopological-settling-site]
kind: narrative
---

# Disjoint cohomological parts: classification vs CRDT convergence

The cohomology of the [bitopological settling site](../../../../bitopological-settling-site/bitopological-settling-site.md) does two seemingly opposite things at the same degree:

- The [aperiodic-regime classification theorem](../../../../aperiodic-settling/references/aperiodic-regime-classification.md) says $H^1$ is *richly populated* — non-zero classes distinguish [aperiodic settlings](../../../../aperiodic-settling/aperiodic-settling.md) up to [mutually-locally-derivable](../concepts/mutually-locally-derivable.md) equivalence, with the [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) as the witness.
- The [CRDT convergence via Mayer–Vietoris](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/crdt-convergence-via-mayer-vietoris.md) theorem says $H^1$ is *trivially zero* — every Mayer–Vietoris connecting homomorphism for replica covers vanishes, recovering coordination-freeness cohomologically.

These are not in conflict. The two computations use *different sheaves on different sub-sites*, and the [bitopological site design](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/why-fiber-covers-only.md) was chosen to keep them separated.

## The cross-ordinal vs fiber decomposition

The site's morphisms encode two independent kinds of structure:

- **Cross-ordinal settling morphisms.** Temporal advancement along $\lambda^{\mathrm{op}}$ — the settling endofunctor's action lifted to the site.
- **Fiber-level pairwise-Stone refinements.** Within a single $(q, \tau)$, refinements of pairwise-Stone clopens.

Covers — and therefore Čech / Mayer–Vietoris machinery — live at the fiber level only. Morphisms across ordinal strata are not covers; cohomological cross-ordinal content is extracted as direct limits over bounded sub-sites $\mathbf{T}^*_{\leq \tau}$ as $\tau \to \kappa$.

The two main theorems use disjoint parts of this structure:

- **aperiodic-regime classification: $H^1(\mathbf{T}^*_{\leq \omega_1}, \mathcal{F}_U)$** with the full $\omega_1$-indexed sub-site. The non-trivial $H^1$-content lives in the *cross-ordinal* part — direct-limit transitions across settling stages, picking up new generators at every non-Scott-continuous firing ordinal.

- **CRDT convergence: $H^1(U, \mathcal{F}_U)$** for $U$ a fixed pairwise-Stone clopen at a single $(q, \tau)$, with the *fiber* sub-site only. The Mayer–Vietoris δ⁰ measured here lives in the fiber-level part — gluing obstructions across pairwise-Stone covers within a single ordinal stratum.

The aperiodic invariant lives in the cross-ordinal part (morphism-based structure); CRDT convergence lives in the fiber-level part (cover-based structure). One has non-trivial content, the other is identically zero, on the *same* cohomological sheaf $\mathcal{F}_U$.

## Why the design works

The [decision to exclude temporal covers](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/why-fiber-covers-only.md) is what makes this cleanly separated. Had the topology included temporal covers, the cross-ordinal structure would have appeared in $H^1(U, \mathcal{F}_U)$ for fixed clopens $U$ — and the CRDT-convergence vanishing would have been a non-trivial cohomological statement rather than a sheaf-construction fact. Conversely, had the topology omitted fiber covers, no Mayer–Vietoris machinery would have been available at all.

The bitopological settling site threads exactly the right needle: rich enough to support the aperiodic-regime classification through cross-ordinal direct limits, simple enough that fiber-level Mayer–Vietoris vanishes for the settling-associated sheaf and recovers CRDT convergence transparently.
