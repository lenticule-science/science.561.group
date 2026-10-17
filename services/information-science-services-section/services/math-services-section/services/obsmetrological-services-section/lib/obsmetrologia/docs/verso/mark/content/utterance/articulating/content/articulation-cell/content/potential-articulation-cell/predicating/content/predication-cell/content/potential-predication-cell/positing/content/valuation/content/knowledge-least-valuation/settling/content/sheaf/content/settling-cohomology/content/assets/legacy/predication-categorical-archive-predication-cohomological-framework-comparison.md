---
type: morphism
class: 1-cell
status: draft
depends-on: [cohomological-framework-2category, cohomological-framework]
see-also: [d-frame-cohomology-comparison, three-cohomological-frameworks]
---

# Cohomological framework comparison

A **framework comparison** is a 1-cell of the [2-category $\mathbf{CohFr}$](../objects/cohomological-framework-2category.md). It is the typed unit of cross-framework relation: a commitment to translate one framework's geometric input to another's, to translate one framework's value category to another's, and to compare what the source framework computes (post-translated) with what the target framework computes (post-input-translation).

## Data

A framework comparison $\mathbb F \to \mathbb F'$ is a quadruple

$$(\mathcal D^\circ_{\mathbb F},\; \Phi_{\mathcal D},\; \Phi_{\mathcal V},\; \alpha)$$

where:

- $\mathcal D^\circ_{\mathbb F} \subseteq \mathcal D_{\mathbb F}$ is the **subdomain** — the subcategory of the source framework's geometric inputs on which the comparison is defined. Most cross-framework comparisons in predication categories are not defined on every settling: F1↔F2 exists only on substitution settlings; the strict-regime comparisons exist only on settlings whose bilattice fibers are finite distributive; and so on. The subdomain is part of the comparison's data.
- $\Phi_{\mathcal D} : \mathcal D^\circ_{\mathbb F} \to \mathcal D_{\mathbb F'}$ is the **input-translation functor**: it interprets a source-framework input as a target-framework input.
- $\Phi_{\mathcal V} : \mathcal V_{\mathbb F} \to \mathcal V_{\mathbb F'}$ is the **value-translation functor**: it carries source values into target values. Examples already in the corpus: the [shadow $\mathbb S : \mathbf{dFrm} \to \mathbf{Ab} \times \mathbf{Ab}$](../../../../../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/paired-priestley-space/content/d-frame/references/d-frame-cohomology-comparison.md) is a value translation $\mathbb F_2 \to \mathbb F_1$ at the value-category level; the d-frame inclusion $\mathbf{dFrm} \hookrightarrow \mathbf{QCat}_{\mathrm{cwl}}$ is a value translation $\mathbb F_2 \to \mathbb F_3$ (or $\mathbb F_4$).
- $\alpha : \Phi_{\mathcal V} \circ H^\bullet_{\mathbb F}\big|_{\mathcal D^\circ_{\mathbb F}} \;\Rightarrow\; H^\bullet_{\mathbb F'} \circ \Phi_{\mathcal D}$ is the **comparison transformation** — a graded natural transformation comparing "compute then translate" to "translate then compute," restricted to the subdomain.

## Subdomain discipline

The subdomain $\mathcal D^\circ_{\mathbb F}$ matters substantively. A theorem that says "comparison $C : \mathbb F \to \mathbb F'$ is an agreement 1-cell" means $\alpha_C$ is a natural isomorphism *over $\mathcal D^\circ_C$* — and downstream theorems may invoke $C$ only on inputs in $\mathcal D^\circ_C$. A naked "F2 and F3 agree" claim that elides the subdomain is at best a slogan; the typed version forces the question *on what.*

Composition of comparisons composes their subdomains by intersection-under-$\Phi_{\mathcal D}$: $(D, \Psi, \Psi', \beta) \circ (C, \Phi, \Phi', \alpha)$ is defined on $C^{-1}(D) \cap \mathcal D^\circ_C$.

## Agreement comparisons

A comparison is an **agreement comparison** when its $\alpha$ component is a natural isomorphism on its declared subdomain. Naming this is the point of the formalism: the corpus has historically used "the frameworks agree" to mean exactly this, without typing the comparison or fixing the subdomain. (The 2-cell condition that lifts an agreement comparison to a 2-isomorphism between $(\Phi, \Phi', \alpha)$ and the comparison reading "id then translate" is a consequence of $\alpha$'s invertibility, not a separate criterion; the substantive content is in $\alpha$.)

When $\alpha$ is *not* a natural iso, the comparison is still a well-defined 1-cell of $\mathbf{CohFr}$ — it just isn't an agreement comparison. The structural reason that $\alpha_{34}$ fails to be a natural iso — that the F3 parallel-pair equality kernel and the F4 weighted-meet-equals-unit kernel are inequivalent categorical conditions on the same cochain $\mathsf Q$-categories — is established in Lemma D1 of [framework-3-4-disagreement](../theorems/framework-3-4-disagreement.md) (`status: sketch`). Earlier corpus drafts referenced a "verify-zero-dim-curry tool" as the empirical source of this claim; that tool was never implemented as named — the actual computation in `computations/examples/per_fiber_d_frame_curry_on_belnap_fiber.py` is the rank-2 F2 ↔ F3 Belnap-fiber Curry verification, not an F3 ↔ F4 discriminator. The disagreement claim is now carried by the structural calculation of Lemma D1.

## What a comparison does not include

A comparison does not include any commitment about *invertibility* of $\alpha$ — that is the content of the agreement claim, recorded in a separate theorem file. Nor does it commit to a *direction* canonically: $\mathbb F \to \mathbb F'$ and $\mathbb F' \to \mathbb F$ are different 1-cells with different comparison transformations, and one being an agreement does not in general imply the other is. This matters for the F4↔F2/F3 case, where the F4-to-F3 vanishing transfer (an agreement-on-$H^{\geq 2}$ claim, draft) does not require the converse F3-to-F4 comparison to be an agreement.
