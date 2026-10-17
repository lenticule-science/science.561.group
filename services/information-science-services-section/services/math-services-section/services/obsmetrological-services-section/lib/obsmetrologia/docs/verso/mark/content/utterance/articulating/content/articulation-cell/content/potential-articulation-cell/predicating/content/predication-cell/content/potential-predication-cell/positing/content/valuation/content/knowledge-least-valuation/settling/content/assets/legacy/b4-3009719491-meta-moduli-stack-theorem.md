---
type: theorem
status: proved
depends-on: [meta-moduli-prestack, settling-moduli-stack-theorem, parameter-base-topology, priestley-cover-topology-subcanonical, predication-fiber-algebra, twist-product, closure-rule-system, closure-rule-language, closure-operator]
---

# Meta-moduli stack theorem

The [meta-moduli prestack](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-prestack.md) $\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}$ is a 1-stack on $(\mathbf{B}, J_\mathbf{B})$. Stackification is trivial: $\mathscr{M}^{\mathrm{meta}} := \mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}$ already satisfies effective descent.

Equivalently: $\mathscr{M}^{\mathrm{meta}}$ is a category fibered in 1-groupoids on the [parameter base category](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/documents/articles/notes/undated/parameter-base-category.md), satisfying the effective descent condition for the [parameter base topology](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/terms/parameter-base-topology.md).

This is predication categories' analog one level up of the [settling moduli stack theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md): where that theorem establishes a stack of *settlings* up to MLD-equivalence, this one establishes a stack of *closure-rule systems* up to closure-equivalence — the meta-level apex of the [CHL apex tower](../narratives/chl-apex-recursion.md).

## The structural idea

The proof reduces to a single observation:

> **Closure operators descend along covers in $J_\mathbf{B}$, because they are equationally specified in the fiber algebras, which themselves form a sheaf of equational algebras** ([sheaf-of-equational-algebras observation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md#the-structural-idea)).

A closure-rule system $\mathcal{S}$ is determined up to closure-equivalence by its generated closure operator $\mathrm{cl}^\mathcal{S}$. So descent of closure-rule systems reduces to descent of closure operators, which reduces to descent of equational data in the fiber algebra.

This is structurally the same descent argument that drives the settling moduli stack theorem (D1–D7 there), now applied at the meta level — the descent of the closure operator (D5 in the settling theorem) is *all that's needed* for the meta-moduli, since the meta-moduli's content is exactly the closure operator (up to closure-equivalence).

## Proof

By Vistoli Definition 4.6, $\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}$ is a stack iff (i) it is a prestack and (ii) it satisfies effective descent for objects.

**(i) Prestack property.** Established in the [meta-moduli prestack definition](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-moduli-prestack.md): the Hom-presheaf is a sheaf because rule-derivation maps are determined by formulas in the fiber algebra, which descend by the fiber-algebra's sheaf-of-equational-algebras structure.

**(ii) Effective descent.** Given a cover $\{B_i \to B\}_{i \in I}$ in $J_\mathbf{B}$, and rule systems $\mathcal{S}_i$ on each $B_i$ that are closure-equivalent on overlaps $B_i \times_B B_j$ (i.e., $\mathrm{cl}^{\mathcal{S}_i}|_{B_i \times_B B_j} = \mathrm{cl}^{\mathcal{S}_j}|_{B_i \times_B B_j}$), we want a unique-up-to-iso rule system $\mathcal{S}$ on $B$ pulling back to $\mathcal{S}_i$ (up to closure-equivalence) on each $B_i$.

The argument runs in three steps:

**Step 1 — closure operator descent.** Each closure operator $\mathrm{cl}^{\mathcal{S}_i}$ is a [closure operator](../morphisms/closure-operator.md) on the predication fiber algebra at $B_i$ — monotonic, inflationary, idempotent, $\mathcal{C}$-natural. Each of these conditions is equationally / cellwise specified in the fiber algebra. By D5 of the [settling moduli stack theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-moduli-stack-theorem.md) (closure-operator descent), the family $(\mathrm{cl}^{\mathcal{S}_i})_{i \in I}$ — compatible on overlaps by hypothesis — descends to a unique closure operator $\mathrm{cl}^\ast$ on $B$.

**Step 2 — generator existence.** The closure operator $\mathrm{cl}^\ast$ on $B$ has *some* generating rule system: the family of rules of the form "$\mathrm{cl}^\ast(v)$ refines $v$ at $\geq_k$-position $\xi$" for each $\xi$ in the codomain, expressed in the [closure-rule language](../concepts/closure-rule-language.md), generates $\mathrm{cl}^\ast$. Concretely, take the rule system

$$\mathcal{S}^\ast := \{r_\xi : \xi \in \text{cells of } \mathrm{cl}^\ast\}$$

where $r_\xi$ is the rule "if $v(\xi)$ has the antecedent value then $\mathrm{cl}^\ast(v)(\xi)$ has the consequent value." This is a (canonically choosable) generator.

**Step 3 — uniqueness up to closure-equivalence.** Any two generators of $\mathrm{cl}^\ast$ are closure-equivalent by definition (both generate the same closure operator). Hence the descent object $[\mathcal{S}^\ast]$ is unique in $\mathrm{Sys}^{\sim}(B)$ up to canonical iso (closure-equivalence).

The pullback $(\ell_i, e_i, \pi_i, \phi_{\lambda, i})^*[\mathcal{S}^\ast]$ on each $B_i$ is closure-equivalent to $\mathcal{S}_i$ by Step 1's descent: both have closure operator $\mathrm{cl}^{\mathcal{S}_i}$. Hence $[\mathcal{S}^\ast]$ is the unique descent object.

This completes effective descent. $\square$

## What property-likeness does — and does not — supply

The [closure 2-monad](../morphisms/closure-2-monad.md)'s lax-idempotence theorem ([closure 2-monad lax-idempotence](closure-2-monad-lax-idempotence.md)) provides *post-hoc rigidity*: given that the descent succeeds in producing a glued closure operator, the lax-idempotent theorem guarantees the resulting closure-2-monad structure is unique up to canonical 2-cell. This matches the property-likeness role in the settling moduli theorem: descent runs on equational sheaf-theoretic content; property-likeness merely ensures the result is well-defined.

The substantive content is the descent argument itself — the equational sheaf-theoretic descent of closure operators on the fiber algebra. The lax-idempotent theorem is a uniqueness check, not a descent driver.

## 1-stack, not 2-stack

For the meta-moduli, the analog of [settling-automorphism 1-truncation](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/settling-automorphism-1-truncation.md) is: closure-equivalence is a *bare* equivalence relation (closure operators agree pointwise), with no non-trivial 2-cells in the corresponding rule-derivation groupoid. Two closure-equivalent rule systems $\mathcal{S}_1 \cong \mathcal{S}_2$ have a *unique* canonical isomorphism between them — the closure-equivalence pair of rule-derivation maps. Hence the fiber groupoid is 1-truncated, and the meta-moduli is a 1-stack.

The lax-idempotent KZ apparatus of the closure 2-monad does not introduce non-trivial 2-cells at the meta level: the 2-cells live in the closure 2-monad's algebra structure, which is *internal* to a fixed closure-rule system, not between distinct systems.

## Consequences

- **The meta-moduli is a genuine stack**, not a discrete groupoid, because the [Priestley-dual cover topology](../../../../../../../pre-bilattice/content/bilattice/content/predication-fiber-algebra/content/priestley-space/content/priestley-dual-cover-topology/priestley-dual-cover-topology.md) has substantive non-trivial covers, and closure-rule systems can be glued non-trivially across these covers.

- **The meta-moduli admits a stratification by regime** ([meta-stratification by regime theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/meta-stratification-by-regime.md), forthcoming) — closure-rule systems split by the [four regimes](../../../references/four-regime-dichotomy.md) their settlings inhabit.

- **The meta-moduli has a realizability map to the settling moduli** ([meta-realizability map theorem](../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/logic-services-section/content/text/glossary/concepts/meta-realizability-map.md), forthcoming) — sending each closure-rule system to its associated settling moduli stack.
