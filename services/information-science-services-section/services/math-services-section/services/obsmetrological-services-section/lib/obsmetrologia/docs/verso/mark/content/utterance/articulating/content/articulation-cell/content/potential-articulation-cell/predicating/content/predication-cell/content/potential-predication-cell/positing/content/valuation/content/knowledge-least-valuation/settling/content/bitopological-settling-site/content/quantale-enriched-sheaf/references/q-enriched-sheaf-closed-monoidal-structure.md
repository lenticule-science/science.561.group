---
kind: theorem
status: sketch
depends-on: [q-enriched-sheaf-tensor, q-enriched-sheaf-hom, quantale-enriched-sheaf, bitopological-settling-site]
---

# Closed monoidal structure on Q-enriched sheaves

The Q-enriched sheaf category $\mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ on a Grothendieck site is a **closed symmetric monoidal category** with monoidal product the [Q-enriched sheaf tensor](../content/q-enriched-sheaf-tensor/q-enriched-sheaf-tensor.md) $F \otimes G$ and internal hom the [Q-enriched sheaf internal Hom](../content/q-enriched-sheaf-tensor/content/q-enriched-sheaf-hom/q-enriched-sheaf-hom.md) $\mathcal{H}om(F, G)$.
The two are related by the closed-monoidal adjunction.

This is the **monoidal piece** of the [six-functor formalism for settling cohomology](../questions/six-functor-formalism-for-settling-cohomology.md): two of the six functors ($\otimes$ and $\mathcal{H}om$) and their adjunction, established at draft level.
Combined with the existing Verdier duality $\mathbb{D}$, the corpus now has three of the six functors.

## Statement

**Theorem (closed monoidal structure).** Let $(\mathbf{T}, J)$ be a Grothendieck site and $\mathsf{Q}$ a commutative unital quantale.
Then the category of $\mathsf{Q}$-enriched sheaves $\mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ is symmetric monoidal closed:

1. **Symmetric monoidal structure.** The tensor $\otimes$ is associative, symmetric, and unital, with unit $\mathbf{1}_J$ — the Q-enriched sheaf with stalk $\mathbf{1}_{\mathsf{Q}}$ (the monoidal unit of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$) at every cell.
2. **Closed structure.** For each Q-enriched sheaf $G$, the functor $-\otimes G$ has a right adjoint $\mathcal{H}om(G, -)$:

$$\mathrm{Hom}_{\mathrm{Sh}}(F \otimes G,\, H) \;\cong\; \mathrm{Hom}_{\mathrm{Sh}}(F,\, \mathcal{H}om(G, H))$$

natural in $F$ and $H$.

## Proof

The proof has three pieces: monoidal structure on presheaves, sheafification preservation, and adjunction transport.

**Step 1: Monoidal structure on presheaves.** The category of Q-enriched presheaves $\mathrm{PSh}(\mathbf{T}; \mathsf{Q})$ is symmetric monoidal closed by pointwise operations.
Tensor is pointwise tensor in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$; internal Hom is pointwise Hom.
The adjunction $- \otimes_{\mathrm{p}} G \dashv \mathcal{H}om_{\mathrm{p}}(G, -)$ holds pointwise because each fiber category $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ has the closed-monoidal structure (Stubbe 2005).

**Step 2: Sheafification preserves the adjunction in the appropriate direction.** Sheafification is left adjoint to inclusion $\mathrm{Sh} \hookrightarrow \mathrm{PSh}$, so it preserves colimits and tensor with sheaves.
Concretely:

- $\mathrm{sheafify}(F \otimes_{\mathrm{p}} G) = F \otimes G$ when $F, G$ are sheaves (the corpus's tensor is defined as sheafified pointwise tensor).
- For sheaves $F, G$: the pointwise Hom $\mathcal{H}om_{\mathrm{p}}(F, G)$ is *automatically* a sheaf — Hom commutes with limits in the second argument, and $G$ is a sheaf.
  So $\mathcal{H}om(F, G) = \mathcal{H}om_{\mathrm{p}}(F, G)$ without sheafification.

**Step 3: Adjunction transport.** From the pointwise adjunction in $\mathrm{PSh}$ and the sheafification compatibility:

$$\mathrm{Hom}_{\mathrm{Sh}}(F \otimes G, H) \stackrel{(*)}{=} \mathrm{Hom}_{\mathrm{Sh}}(\mathrm{sheafify}(F \otimes_{\mathrm{p}} G), H) \stackrel{(**)}{=} \mathrm{Hom}_{\mathrm{PSh}}(F \otimes_{\mathrm{p}} G, H) \stackrel{(***)}{=} \mathrm{Hom}_{\mathrm{PSh}}(F, \mathcal{H}om_{\mathrm{p}}(G, H))$$

where $(*)$ is the definition of sheaf tensor, $(**)$ is the sheafification adjunction (sheafify left adjoint to inclusion), and $(***)$ is the pointwise closed-monoidal adjunction.

The right side $\mathrm{Hom}_{\mathrm{PSh}}(F, \mathcal{H}om_{\mathrm{p}}(G, H)) = \mathrm{Hom}_{\mathrm{Sh}}(F, \mathcal{H}om(G, H))$ since $\mathcal{H}om_{\mathrm{p}}(G, H) = \mathcal{H}om(G, H)$ for $H$ a sheaf (Step 2's second bullet) and $F$ is a sheaf so the inclusion $\mathrm{Sh} \hookrightarrow \mathrm{PSh}$ is full.

This establishes the closed-monoidal adjunction.
The associativity, symmetry, and unitality of $\otimes$ inherit from the pointwise structure (which inherits from $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$). $\square$

## Specialization to the bitopological settling site

For the bitopological settling site with d-frame value category, the closed-monoidal structure specializes to a closed-monoidal structure on d-frame-valued sheaves.
The tensor unit is the d-frame-valued constant sheaf with stalk the unit d-frame $(\mathbf{1}, \mathbf{1}, \cdot, \cdot)$ — both components the trivial frame, consistency holding, totality holding.

**Concrete content.** For two d-frame-valued settling sheaves $\mathbb{F}_v$ and $\mathbb{F}_{v'}$ corresponding to settlings $v, v'$:

$$\mathbb{F}_v \otimes \mathbb{F}_{v'} \,(q, \tau, U) = \mathbb{F}_v(q, \tau, U) \otimes \mathbb{F}_{v'}(q, \tau, U)$$

— the per-stalk d-frame tensor.
This is the d-frame structure on the **simultaneous evidence pattern** of the two settlings: truth-positive cells of $v$ paired with truth-positive cells of $v'$, etc.

Internal Hom $\mathcal{H}om(\mathbb{F}_v, \mathbb{F}_{v'})$ records the d-frame morphisms from one settling's evidence to another's — a d-frame-valued analogue of "implication" between settlings.

## Verdier duality compatibility

The [Verdier duality theorem](verdier-duality-bitopological-site.md) interacts with the closed-monoidal structure via:

**Conjecture (Verdier-tensor compatibility).** For Q-enriched sheaves $F, G$ on the bitopological settling site:

$$\mathbb{D}(F \otimes G) \;\simeq_q\; \mathbb{D}(F) \otimes \mathbb{D}(G)$$

up to fuzziness $q$ inheriting from the Verdier fuzziness profile.
In the strict case ($q = 1$, Boolean d-frame data), this would be a strict isomorphism.

**Conjecture (Verdier-Hom compatibility).** For Q-enriched sheaves $F, G$:

$$\mathbb{D}(\mathcal{H}om(F, G)) \;\simeq_q\; \mathcal{H}om(\mathbb{D}(G), \mathbb{D}(F)).$$

The order swap on the right is characteristic — Verdier duality is contravariant in the inputs of internal Hom, matching the abelian-setting precedent.

These compatibilities are open work; they fit naturally with the [direct/inverse image piece](q-enriched-sheaf-direct-inverse-image.md) of the six-functor formalism (where the projection formula relates $\Phi_*$ with $\otimes$ and the base-change relates it with $\mathbb{D}$).

## What's open

**Internal to this theorem (Step 2 specifics):**

1. **Sheafification of pointwise Hom.** Step 2 claims that for sheaves $F, G$, the pointwise Hom is automatically a sheaf.
  This relies on Hom commuting with limits in the second argument — standard in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ but the explicit verification for the Grothendieck-site sheaf condition is part of what we owe.

2. **The unit object's sheafhood.** $\mathbf{1}_J$ — the constant Q-enriched sheaf with stalk the monoidal unit — needs verification of the sheaf condition.
  For the trivial unit, this is automatic; for non-trivial units in richer quantales, may require care.

**Beyond this theorem (six-functor package):**

3. **Direct/inverse image functors** ($\Phi^*, \Phi_*$ for site morphisms).
  Open via the existing [sheaf functoriality theorem](../../../references/sheaf-functoriality-on-bitopological-site.md) for the $\mathbf{Ab}$-valued case; the Q-enriched lift is the direction-of-development for [Task #148](../questions/six-functor-formalism-for-settling-cohomology.md).

4. **Exceptional functors** ($\Phi_!$, $\Phi^!$).
  Defined via Verdier duality applied to direct/inverse image: $\Phi_!
  (F) := \mathbb{D}(\Phi_*(\mathbb{D}(F)))$.
  The existence depends on having both the direct-image piece and Verdier duality — the latter is in place; the former is open.

## Position in the program

This theorem establishes the **monoidal piece** of the six-functor formalism on Q-enriched sheaves.
With the Verdier duality $\mathbb{D}$ now established (Layer 1+2+3 of the cellular extension plan) and the closed-monoidal structure here, the corpus has three of the six functors: $\otimes$, $\mathcal{H}om$, $\mathbb{D}$.

The remaining direct/inverse/exceptional image functors build on this monoidal-Verdier foundation.
With those four established, the full six-functor package becomes a concrete framework for settling cohomology, enabling base-change, projection-formula, and duality arguments off-the-shelf.

The chapter's frontier moves from "establish the framework" to "use the framework" — base-change theorems in the d-frame setting, projection-formula instances for predicate-changes, duality arguments for the strong-MLD classification, and so on.
