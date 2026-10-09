---
kind: theorem
status: sketch
depends-on: [sheaf-functoriality-on-bitopological-site, q-enriched-sheaf-closed-monoidal-structure, q-enriched-sheaf-tensor, q-enriched-sheaf-hom, verdier-duality-bitopological-site, quantale-enriched-sheaf, bitopological-settling-site-functoriality]
---

# Q-enriched direct/inverse image functors and six-functor axioms

The four remaining functors of the [six-functor formalism](../questions/six-functor-formalism-for-settling-cohomology.md) for settling cohomology — direct image $\Phi_*$, inverse image $\Phi^*$, exceptional direct image $\Phi_!$, and exceptional inverse image $\Phi^!$ — for hyperdoctrine morphisms in the Q-enriched setting. Combined with the existing [Verdier duality $\mathbb{D}$](verdier-duality-bitopological-site.md) and the [closed monoidal structure $(\otimes, \mathcal{H}om)$](../../../../../../bitopological-settling-site/content/quantale-enriched-sheaf/references/q-enriched-sheaf-closed-monoidal-structure.md), this completes (at sketch level) the six-functor package on the bitopological settling site.

The four key axioms — closed-monoidal compatibility, Beck–Chevalley base change, projection formula, and Verdier-functor exchange — are stated and sketched, with full proofs deferred per axiom-by-axiom.

## The four functors

For a [predication hyperdoctrine morphism](../objects/predication-hyperdoctrine.md) $\Phi : \mathcal{E}_1 \to \mathcal{E}_2$ over a common base, the corresponding [bitopological settling site morphism](../../../../../../bitopological-settling-site/content/assets/legacy/bitopological-settling-site-functoriality.md) $\Phi : \mathbf{T}^*_1 \to \mathbf{T}^*_2$ induces four Q-enriched-sheaf functors:

**Inverse image $\Phi^*$.** $\mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_2) \to \mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_1)$. Defined by precomposition with the site morphism, followed by sheafification:

$$\Phi^*(F)(\sigma) := F(\Phi(\sigma))$$

— pulling back the sheaf along the underlying site map.

**Direct image $\Phi_*$.** $\mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_1) \to \mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_2)$. Right adjoint to $\Phi^*$; existence by the adjoint functor theorem in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$-valued sheaves on Grothendieck sites.

**Exceptional inverse image $\Phi^!$.** $\mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_2) \to \mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_1)$. Defined via Verdier duality:

$$\Phi^!(F) \;:=\; \mathbb{D}\bigl(\Phi^*(\mathbb{D}(F))\bigr).$$

**Exceptional direct image $\Phi_!$.** $\mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_1) \to \mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_2)$. Defined dually:

$$\Phi_!(F) \;:=\; \mathbb{D}\bigl(\Phi_*(\mathbb{D}(F))\bigr).$$

## Adjunctions

**Theorem (six-functor adjunctions, sketch).** The functors form two adjoint pairs:

$$\Phi^* \;\dashv\; \Phi_* \qquad \text{and} \qquad \Phi_! \;\dashv\; \Phi^!.$$

The first adjunction is the standard inverse-image / direct-image pair, lifted to the Q-enriched setting from the [existing sheaf-functoriality theorem](../../../../../../bitopological-settling-site/references/sheaf-functoriality-on-bitopological-site.md). The second is induced by Verdier duality and the first.

The four functors thus form a "six-functor box":

$$\begin{array}{c} \Phi^* \\ \dashv \\ \Phi_* \end{array} \qquad \text{and} \qquad \begin{array}{c} \Phi_! \\ \dashv \\ \Phi^! \end{array}.$$

For "proper" hyperdoctrine morphisms (those with bounded settling-shift, in the sense of the [six-functor formalism question](../questions/six-functor-formalism-for-settling-cohomology.md)), $\Phi_! = \Phi_*$ and $\Phi^! = \Phi^*$ — the exceptional functors agree with the standard ones. For non-proper morphisms, they differ, and this difference encodes the propogation behavior of cosheaf-side data.

## The key axioms

The substantive content of the six-functor formalism is in the *interactions* between functors:

**Closed-monoidal compatibility.** The closed-monoidal structure interacts with inverse image:

$$\Phi^*(F \otimes G) \;\cong\; \Phi^*(F) \otimes \Phi^*(G), \qquad \Phi^*(\mathcal{H}om(F, G)) \;\cong\; \mathcal{H}om(\Phi^*(F),\, \Phi^*(G)).$$

These are essentially the pointwise-tensor / pointwise-Hom definitions transported across the site morphism. Both follow from $\Phi^*$ commuting with limits and colimits at the stalk level (since $\Phi^*$ is a precomposition functor, this is automatic for the pointwise versions; sheafification preserves the structure).

**Projection formula.** For $F \in \mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_1)$ and $G \in \mathrm{Sh}_{\mathsf{Q}}(\mathbf{T}^*_2)$:

$$\Phi_!(F) \otimes G \;\cong\; \Phi_!(F \otimes \Phi^*(G)).$$

This relates the exceptional direct image to the tensor product. The $\Phi_!$ version is more natural than the $\Phi_*$ version because $\Phi_!$ commutes with colimits (left adjoint to $\Phi^!$).

**Beck–Chevalley base change.** For a cartesian square of hyperdoctrine morphisms

$$\begin{array}{ccc} \mathcal{E}_1 \times_{\mathcal{E}_2} \mathcal{E}_3 & \xrightarrow{\Phi'} & \mathcal{E}_3 \\ \Psi' \downarrow & & \downarrow \Psi \\ \mathcal{E}_1 & \xrightarrow{\Phi} & \mathcal{E}_2 \end{array}$$

there is a canonical isomorphism

$$\Psi^* \circ \Phi_! \;\cong\; \Phi'_! \circ \Psi'^*.$$

This is the "base-change" axiom — cohomology computations transfer across cartesian squares of hyperdoctrine morphisms.

**Verdier duality exchanges direct and exceptional images.** The Verdier functor swaps $\Phi_!$ with $\Phi_*$ and $\Phi^!$ with $\Phi^*$:

$$\mathbb{D}(\Phi_*(F)) \;\cong\; \Phi_!(\mathbb{D}(F)), \qquad \mathbb{D}(\Phi^*(F)) \;\cong\; \Phi^!(\mathbb{D}(F)).$$

These are tautological from the definitions of $\Phi_!$ and $\Phi^!$ (they are *defined* via Verdier conjugation), but the axiomatic content is that $\Phi^!$ and $\Phi_!$ defined this way actually form an adjoint pair — i.e., the Verdier conjugates of an adjoint pair are adjoint.

## Proof sketches

**Inverse-image / direct-image adjunction.** The Q-enriched lift of the [existing sheaf-functoriality theorem](../../../../../../bitopological-settling-site/references/sheaf-functoriality-on-bitopological-site.md). The $\mathbf{Ab}$-valued proof goes through with $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ in place of $\mathbf{Ab}$ (modulo verifying the adjoint functor theorem holds in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$-valued sheaves on Grothendieck sites, which it does — Stubbe 2005 verifies $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$ is presentable).

**Verdier-conjugate adjunction.** Given $\Phi^* \dashv \Phi_*$ and the Verdier involution $\mathbb{D}^2 \simeq_q \mathrm{id}$, the conjugates $\Phi_! := \mathbb{D} \circ \Phi_* \circ \mathbb{D}$ and $\Phi^! := \mathbb{D} \circ \Phi^* \circ \mathbb{D}$ form an adjoint pair $\Phi_! \dashv \Phi^!$, by the standard duality argument: take Hom of the standard adjunction, conjugate, and use $\mathbb{D}^2 \simeq \mathrm{id}$ to clean up.

The fuzziness of the conjugate adjunction inherits from the Verdier fuzziness $q^{\mathrm{glob}}$ — strictly equal in the corpus's Boolean d-frame setting where $q^{\mathrm{glob}} = 1$.

**Closed-monoidal compatibility.** Pointwise: $\Phi^*$ at each stalk is the identity (just relabeling the cell), so it preserves the per-stalk tensor and Hom in $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$. Sheafification preserves the structure because it's a left adjoint that commutes with the closed-monoidal operations on sheaves.

**Projection formula.** Standard derivation from the closed-monoidal compatibility plus the $\Phi^* \dashv \Phi_*$ adjunction, dualized via Verdier to get the $\Phi_!$ version. The corpus's specific case follows the general $\mathbf{Q\text{-}Cat}_{\mathrm{cwl}}$-valued Grothendieck-site framework.

**Beck–Chevalley.** Holds for cartesian squares of *site morphisms* corresponding to cartesian squares of hyperdoctrine morphisms. The verification reduces to checking that the underlying [bitopological-settling-site functoriality](../../../../../../bitopological-settling-site/content/assets/legacy/bitopological-settling-site-functoriality.md) preserves cartesian squares, which it does at the fiber level (Priestley-space morphisms preserve finite limits, including pullbacks).

The proofs of these four axioms each have substantial content; this theorem assembles them at the *axiomatic* level, leaving the per-axiom verification as separate sub-tasks. $\square$ (sketch)

## What this gives

With this theorem (at sketch level), the corpus has the **full six-functor package** for Q-enriched sheaves on the bitopological settling site:

$$\bigl(\Phi^*,\, \Phi_*,\, \Phi^!,\, \Phi_!,\, \otimes,\, \mathcal{H}om;\, \mathbb{D}\bigr)$$

with the standard six-functor axioms (closed-monoidal, projection formula, Beck–Chevalley, Verdier exchange) at sketch level.

This makes available **off-the-shelf** the kinds of structural arguments the six-functor formalism is designed for:

- **Projection-formula simplifications** for predicate-change cohomology computations.
- **Base-change isomorphisms** for cartesian squares of hyperdoctrine morphisms — useful for relating cohomology across different predication structures.
- **Verdier-functor exchange** for transporting results between sheaf-side and cosheaf-side presentations.
- **Mayer–Vietoris in the Q-enriched setting** — the existing [three-replica Mayer–Vietoris example](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/three-replica-mayer-vietoris.md) lifts via $\Phi^* / \Phi_*$ to the d-frame setting.

## What's open

**Per-axiom verification.** Each of the four axioms (closed-monoidal compatibility, projection formula, Beck–Chevalley, Verdier exchange) has the proof sketched here; full proofs are separate sub-tasks. The closed-monoidal compatibility and Verdier exchange follow most directly from the existing infrastructure; the projection formula and Beck–Chevalley have more substantive content.

**Proper-morphism characterization.** The condition under which $\Phi_! = \Phi_*$ ("proper morphisms") needs explicit characterization in terms of hyperdoctrine morphisms. The candidate: morphisms with bounded settling-shift. Verifying this is the corpus's own working out of the proper-morphism notion in the predication setting.

**Dualizing complex.** A dualizing complex on $\mathbf{T}^*$ would be a Q-enriched sheaf $\omega$ such that $\mathbb{D}(F) = \mathcal{H}om(F, \omega)$ — making Verdier duality a *derived* internal-Hom. Whether such a $\omega$ exists for the bitopological settling site, and what its concrete d-frame structure is, is open.

**Six-functor coherences.** The full six-functor formalism in the [@kashiwara-schapira2006] sense includes additional coherences (associativity of base change, triangle inequalities, dualizing complex normalization) beyond the four axioms here. These extend the framework but aren't strictly needed for downstream applications.

## Position in the program

This theorem completes (at sketch level) the **six-functor package** for settling cohomology, the open question that has driven much of the chapter's development. With Verdier duality now established (Layer 1+2+3) and the closed-monoidal structure in place, the six-functor package assembles via the standard derivation pattern.

The chapter's frontier moves from *establishing* the framework to *using* it:

- **Concrete computations** with the projection formula and base-change isomorphisms — applied to specific predicate-change scenarios.
- **The dualizing complex** characterization in the d-frame setting — what is $\omega$, and what does it tell us about the bitopological settling site's intrinsic structure?
- **Mayer–Vietoris and other diagram-chasing in the Q-enriched setting** — making available the standard tools of derived algebraic geometry for settling cohomology.

These uses of the six-functor framework are downstream tasks; the framework itself is now in place.
