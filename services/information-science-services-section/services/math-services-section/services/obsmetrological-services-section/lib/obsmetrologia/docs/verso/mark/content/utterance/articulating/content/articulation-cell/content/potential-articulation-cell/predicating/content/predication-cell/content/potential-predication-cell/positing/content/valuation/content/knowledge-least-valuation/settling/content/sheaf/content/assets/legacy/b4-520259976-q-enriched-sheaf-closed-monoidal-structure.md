---
type: theorem
status: proved
depends-on: [q-enriched-sheaf-tensor, q-enriched-sheaf-hom, quantale-enriched-sheaf, bitopological-settling-site, kelly1982, maclane-moerdijk1992]
---

# Closed monoidal structure on Q-enriched sheaves

The Q-enriched sheaf category $\mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ on a Grothendieck site is a **closed symmetric monoidal category** with monoidal product the [Q-enriched sheaf tensor](../objects/q-enriched-sheaf-tensor.md) $F \otimes G$ and internal hom the [Q-enriched sheaf internal Hom](../objects/q-enriched-sheaf-hom.md) $\mathcal{H}om(F, G)$. The two are related by the closed-monoidal adjunction.

This is the **monoidal piece** of the [six-functor formalism for settling cohomology](../questions/six-functor-formalism-for-settling-cohomology.md): two of the six functors ($\otimes$ and $\mathcal{H}om$) and their adjunction, established at draft level. Combined with the existing Verdier duality $\mathbb{D}$, the corpus now has three of the six functors.

## Statement

**Theorem (closed monoidal structure).** Let $(\mathbf{T}, J)$ be a Grothendieck site and $\mathsf{Q}$ a commutative unital quantale. Then the category of $\mathsf{Q}$-enriched sheaves $\mathrm{Sh}(\mathbf{T}, J; \mathsf{Q})$ is symmetric monoidal closed:

1. **Symmetric monoidal structure.** The tensor $\otimes$ is associative, symmetric, and unital, with unit $\mathbf{1}_J$ — the Q-enriched sheaf with stalk $\mathbf{1}_{\mathsf{Q}}$ (the monoidal unit of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$) at every cell.
2. **Closed structure.** For each Q-enriched sheaf $G$, the functor $-\otimes G$ has a right adjoint $\mathcal{H}om(G, -)$:

$$\mathrm{Hom}_{\mathrm{Sh}}(F \otimes G,\, H) \;\cong\; \mathrm{Hom}_{\mathrm{Sh}}(F,\, \mathcal{H}om(G, H))$$

natural in $F$ and $H$.

## Proof

The proof has three pieces: monoidal structure on presheaves, sheafification preservation, and adjunction transport.

**Step 1: Monoidal structure on presheaves.** The category of Q-enriched presheaves $\mathrm{PSh}(\mathbf{T}; \mathsf{Q})$ is symmetric monoidal closed by pointwise operations. Tensor is pointwise tensor in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$; internal Hom is pointwise Hom. The adjunction $- \otimes_{\mathrm{p}} G \dashv \mathcal{H}om_{\mathrm{p}}(G, -)$ holds pointwise because each fiber category $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ has the closed-monoidal structure (Stubbe 2005).

**Step 2: Sheafification preserves the adjunction in the appropriate direction.** Sheafification is left adjoint to inclusion $\mathrm{Sh} \hookrightarrow \mathrm{PSh}$, so it preserves colimits and tensor with sheaves. Concretely:

- $\mathrm{sheafify}(F \otimes_{\mathrm{p}} G) = F \otimes G$ when $F, G$ are sheaves (predication categories' tensor is defined as sheafified pointwise tensor).
- For sheaves $F, G$: the pointwise Hom $\mathcal{H}om_{\mathrm{p}}(F, G)$ is *automatically* a sheaf.

The second bullet — pointwise Hom sheafhood — is the standard topos-theoretic fact that internal Hom of sheaves is a sheaf, transferred to the $\mathsf Q$-enriched setting. Concretely: for a cover $\{U_i \to U\}$ in $J$, the sheaf condition requires $\mathcal H om_{\mathrm p}(F, G)(U)$ to be the equalizer over the cover diagram. Computing,

$$\mathcal H om_{\mathrm p}(F, G)(U) \;=\; \mathrm{Hom}_{\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}}(F(U), G(U)).$$

By [@kelly1982] §3.2 (right adjoints preserve all limits that exist), $\mathrm{Hom}(F(U), -)$ commutes with the equalizer in $G$. Since $G$ is a sheaf, $G(U) = \mathrm{Eq}(\prod_i G(U_i) \rightrightarrows \prod_{ij} G(U_i \times_U U_j))$. Hence

$$\mathrm{Hom}(F(U), G(U)) \;=\; \mathrm{Eq}\bigl(\mathrm{Hom}(F(U), \prod_i G(U_i)) \rightrightarrows \mathrm{Hom}(F(U), \prod_{ij} G(U_i \times_U U_j))\bigr).$$

The right side is the value of the equalizer-on-stalks of the cover diagram applied to $F(U)$ — which equals the equalizer of the values of $\mathcal H om_{\mathrm p}(F, G)$ on the cover (using that $F$ is a sheaf to identify $F(U)$ with the corresponding equalizer on $F$ side, then applying the standard $\mathrm{Hom}(\mathrm{lim} A, B) = \mathrm{lim}\,\mathrm{Hom}(A, B)$ identity). The full check is the $\mathsf Q$-enriched analog of [@maclane-moerdijk1992] Theorem II.7.5 (internal Hom of sheaves is a sheaf in any topos), with $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ replacing $\mathbf{Set}$.

**Step 3: Adjunction transport.** From the pointwise adjunction in $\mathrm{PSh}$ and the sheafification compatibility:

$$\mathrm{Hom}_{\mathrm{Sh}}(F \otimes G, H) \stackrel{(*)}{=} \mathrm{Hom}_{\mathrm{Sh}}(\mathrm{sheafify}(F \otimes_{\mathrm{p}} G), H) \stackrel{(**)}{=} \mathrm{Hom}_{\mathrm{PSh}}(F \otimes_{\mathrm{p}} G, H) \stackrel{(***)}{=} \mathrm{Hom}_{\mathrm{PSh}}(F, \mathcal{H}om_{\mathrm{p}}(G, H))$$

where $(*)$ is the definition of sheaf tensor, $(**)$ is the sheafification adjunction (sheafify left adjoint to inclusion), and $(***)$ is the pointwise closed-monoidal adjunction.

The right side $\mathrm{Hom}_{\mathrm{PSh}}(F, \mathcal{H}om_{\mathrm{p}}(G, H)) = \mathrm{Hom}_{\mathrm{Sh}}(F, \mathcal{H}om(G, H))$ since $\mathcal{H}om_{\mathrm{p}}(G, H) = \mathcal{H}om(G, H)$ for $H$ a sheaf (Step 2's second bullet) and $F$ is a sheaf so the inclusion $\mathrm{Sh} \hookrightarrow \mathrm{PSh}$ is full.

This establishes the closed-monoidal adjunction. The associativity, symmetry, and unitality of $\otimes$ inherit from the pointwise structure (which inherits from $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$). $\square$

## Specialization to the bitopological settling site

For the bitopological settling site with d-frame value category, the closed-monoidal structure specializes to a closed-monoidal structure on d-frame-valued sheaves. The tensor unit is the d-frame-valued constant sheaf with stalk the unit d-frame $(\mathbf{1}, \mathbf{1}, \cdot, \cdot)$ — both components the trivial frame, consistency holding, totality holding.

**Concrete content.** For two d-frame-valued settling sheaves $\mathbb{F}_v$ and $\mathbb{F}_{v'}$ corresponding to settlings $v, v'$:

$$\mathbb{F}_v \otimes \mathbb{F}_{v'} \,(q, \tau, U) = \mathbb{F}_v(q, \tau, U) \otimes \mathbb{F}_{v'}(q, \tau, U)$$

— the per-stalk d-frame tensor. This is the d-frame structure on the **simultaneous evidence pattern** of the two settlings: truth-positive cells of $v$ paired with truth-positive cells of $v'$, etc.

Internal Hom $\mathcal{H}om(\mathbb{F}_v, \mathbb{F}_{v'})$ records the d-frame morphisms from one settling's evidence to another's — a d-frame-valued analogue of "implication" between settlings.

## Verdier duality compatibility

The closed-monoidal structure interacts with [Verdier duality](verdier-duality-bitopological-site.md), but the two compatibility statements (Verdier-tensor exchange and Verdier-Hom contravariance) are **separate sketch theorems** rather than part of the closed-monoidal structure proved here:

- [Verdier–tensor compatibility](q-enriched-verdier-tensor-compatibility.md) (sketch): $\mathbb D(F \otimes G) \simeq_q \mathbb D(F) \otimes \mathbb D(G)$.
- [Verdier–Hom compatibility](q-enriched-verdier-hom-compatibility.md) (sketch): $\mathbb D(\mathcal H om(F, G)) \simeq_q \mathcal H om(\mathbb D(G), \mathbb D(F))$.

Each fits naturally with the [direct/inverse image piece](q-enriched-sheaf-direct-inverse-image.md) of the six-functor formalism. They do not extend the proved content of *this* theorem; they are downstream interactions deserving their own scope.

## Unit sheafhood

The unit $\mathbf 1_J$ is the constant $\mathsf Q$-enriched sheaf with stalk $\mathbf 1_{\mathsf Q}$ (the monoidal unit of $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$) at every cell. Sheafhood is the universal property of the constant sheaf as a left Kan extension of the constant presheaf along the inclusion of objects: any cover $\{U_i \to U\}$ has $\mathbf 1_J(U) = \mathbf 1_{\mathsf Q}$ and the cover diagram values are also all $\mathbf 1_{\mathsf Q}$, with restriction maps the identity. The equalizer is trivially $\mathbf 1_{\mathsf Q} = \mathbf 1_J(U)$, so the sheaf condition holds.

For non-trivial unit elements in richer quantales (e.g., when $\mathsf Q$ has a non-trivial unit beyond the trivial frame's $\top$), the same argument applies provided the unit's restriction-along-identity is the identity, which is part of the constant-sheaf data.

## What's open (downstream / six-functor package)

The remaining six-functor pieces are addressed in separate theorems:

1. **Direct/inverse image functors** ($\Phi^*, \Phi_*$ for site morphisms) and **exceptional functors** ($\Phi_!, \Phi^!$ via Verdier conjugation): see [Q-enriched sheaf direct/inverse image](q-enriched-sheaf-direct-inverse-image.md) for the assembled six-functor package on the bitopological settling site.

2. **Dualizing complex characterization.** A dualizing complex $\omega$ on $\mathbf T^*$ would make $\mathbb D(F) = \mathcal H om(F, \omega)$ — Verdier as derived internal Hom. Open structural question; not needed for the closed-monoidal structure here but relevant to downstream six-functor coherences.
