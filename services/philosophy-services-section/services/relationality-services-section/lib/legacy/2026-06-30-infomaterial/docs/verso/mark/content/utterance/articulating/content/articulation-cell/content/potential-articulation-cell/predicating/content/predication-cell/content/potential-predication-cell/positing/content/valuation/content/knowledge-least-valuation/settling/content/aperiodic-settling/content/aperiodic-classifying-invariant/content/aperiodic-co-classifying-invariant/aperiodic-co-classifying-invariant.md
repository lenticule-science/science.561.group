---
kind: definition
realizes: [cohomological-equivalence]
type: cosheaf-homology-class
symbol: "\\check{\\mathrm{cl}}\\text{-}\\mathrm{inv}(v)"
depends-on: [aperiodic-classifying-invariant, settling-cohomology, settling-associated-sheaf, aperiodic-settling, closure-ordinal, quantale-enriched-cosheaf, verdier-duality-bitopological-site]
---

# Aperiodic co-classifying invariant

The cosheaf-homology dual of the [aperiodic classifying invariant](aperiodic-classifying-invariant.md).
Where $\mathrm{cl}\text{-}\mathrm{inv}(v) \in H^1$ records the aperiodic settling's MLD-class as a sheaf cohomology class — built from cocycles on the bitopological settling site — the **co-classifying invariant** $\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \in H_1$ records the same MLD-class as a cosheaf *homology* class — built from cycles on the cosheaf side.

The two presentations encode the same data, related by [Verdier duality on the bitopological settling site](../theorems/verdier-duality-bitopological-site.md).
The co-classifying invariant exists exactly because the spatial Verdier duality, established at draft level via the cellular extension plan, identifies $H^1(\mathcal{F}_v) \simeq H_1(\check{\mathcal{F}}_v)$ in q-fuzzy form (and strictly in the corpus's Boolean d-frame setting).

## Definition

Let $v$ be an aperiodic-regime [knowledge presheaf](spatiotemporal-knowledge-presheaf.md) with closure ordinal $\kappa \geq \omega_1$, and let $\check{\mathcal{F}}_v$ be the cosheaf associated to its [settling-associated sheaf](settling-associated-sheaf.md) via the Verdier duality on the bitopological settling site.

The **aperiodic co-classifying invariant of $v$** is the image of the [aperiodic classifying invariant](aperiodic-classifying-invariant.md) under the spatial Verdier duality:

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \;:=\; \mathbb{D}_{\mathrm{sp}}\bigl(\mathrm{cl}\text{-}\mathrm{inv}(v)\bigr) \;\in\; H_1(\mathbf{T}^*_{\leq \omega_1},\, \check{\mathcal{F}}_v).$$

Equivalently, by the existing [aperiodic-regime cohomology via direct limit](../theorems/aperiodic-regime-cohomology-via-direct-limit.md) and the cosheaf-side analog established under Verdier duality:

$$\check{\mathrm{cl}}\text{-}\mathrm{inv}(v) \;=\; \sum_{\mu \in L_{\mathrm{ns}}(\kappa)} \check{e}_\mu \;\in\; \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z},$$

where each $\check{e}_\mu$ is the cosheaf-homology generator at the non-Scott-continuous firing ordinal $\mu$, dual to the sheaf-cohomology generator $e_\mu$.

## Concrete content

For each non-Scott-continuous firing ordinal $\mu \in L_{\mathrm{ns}}(\kappa)$:

- **Sheaf side ($e_\mu \in H^1$):** the cell newly added at $\mu$ produces a 1-cocycle that is not a coboundary — global agreement is impossible across the firing event without retroactively modifying earlier-stage data.
- **Cosheaf side ($\check{e}_\mu \in H_1$):** dually, the cell newly added at $\mu$ produces a cosheaf 1-cycle that is not a boundary — local-to-global aggregation produces a cycle the cosheaf cannot collapse via boundary maps without erasing the firing event.

Both perspectives encode the same firing structure.
The sheaf side asks "what global agreements are blocked?"; the cosheaf side asks "what local cycles cannot aggregate?".
By Verdier duality, the answers are identified.

## Computational properties

The two presentations differ in how they expose computational structure:

- **Sheaf cohomology** ($e_\mu \in H^1$): natural for *checking* whether two aperiodic settlings have the same firing pattern — agreement of cocycles on a finite truncation extends, by direct-limit compatibility, to agreement on the full $\omega_1$.
- **Cosheaf homology** ($\check{e}_\mu \in H_1$): natural for *constructing* representatives of an MLD-class — homology classes admit explicit cycle representatives, which can be specified locally and aggregated.

These are different "directions" through the same data: the sheaf side aggregates globally, the cosheaf side aggregates locally.
Each is more natural for different operations on the MLD-class.

## Relation to Anderson–Putnam direct/inverse limit duality

The corpus's existing [Anderson–Putnam direct-limit](anderson-putnam-direct-limit.md) construction takes inverse-limit *spaces* (transfinite tilings, settling-stage limits) and gives direct-limit *cohomologies*.
The Verdier duality flips this:

- *Inverse-limit space* $\mathbf{T}^*_{\leq \omega_1}$ gives *direct-limit sheaf cohomology* $H^1$ — captured by $\mathrm{cl}\text{-}\mathrm{inv}$.
- *Direct-limit cosheaf-side stalks* on $\check{\mathcal{F}}_v$ give *direct-limit cosheaf homology* $H_1$ — captured by $\check{\mathrm{cl}}\text{-}\mathrm{inv}$.

The Verdier duality $H^1 \simeq H_1$ identifies the two.
This is the predicted-but-not-previously-established structural pairing for aperiodic settlings — the corpus's analog of the Anderson–Putnam framework's tiling/dual-tiling duality.

## Position in the program

This invariant is the cosheaf-side companion to the [aperiodic classifying invariant](aperiodic-classifying-invariant.md).
The substantive theorem stating that it classifies aperiodic settlings up to MLD is the [aperiodic co-classification](../theorems/aperiodic-co-classification.md) theorem.
Together with the existing classification, the two give *paired classifying invariants* via Verdier duality — the dual cohomological perspectives on the same MLD-class structure.

The invariant feeds into:

- The [strong-MLD classification refinement](../theorems/strong-mld-classification.md) (in development): the composed-duality $\mathbb{D} = \mathbb{D}_{\mathrm{sp}} \circ \mathbb{D}_{\mathrm{val}}$ acts on the co-invariant, partitioning aperiodic settlings into self-dual ($\top$-firing-only) and exchange-paired (truth-only ↔ falsity-only) orbits.
- The [d-frame Verdier composition theorem](../theorems/d-frame-verdier-composition.md), where the value-category negation gauge acts on $\check{\mathrm{cl}}\text{-}\mathrm{inv}$ to give the orbit-type information.
- Future [six-functor formalism](../questions/six-functor-formalism-for-settling-cohomology.md) work, where the $\mathbb{D}$-functor of the package operates on classifying invariants in this co-presented form.
