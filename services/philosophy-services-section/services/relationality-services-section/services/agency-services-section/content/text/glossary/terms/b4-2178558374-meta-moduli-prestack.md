---
type: definition
class: prestack
symbol: "\\mathscr{M}^{\\mathrm{meta}}_{\\mathrm{pre}}"
depends-on: [parameter-base-category, closure-rule-system, closure-rule, closure-rule-language, closure-operator, settling-moduli-prestack]
title: Meta-moduli prestack of closure-rule systems
description: "The pseudo-functor $\\mathbf{B}^{\\mathrm{op}} \\to \\mathbf{Gpd}$ sending each base $(\\mathbf{L}, \\mathcal{C}, E, \\lambda) \\in \\mathbf{B}$ to the groupoid of closure-rule systems over that base, modulo closure-equivalence:"
---

# Meta-moduli prestack of closure-rule systems

The pseudo-functor $\mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}$ sending each base $(\mathbf{L}, \mathcal{C}, E, \lambda) \in \mathbf{B}$ to the **groupoid of [closure-rule systems](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/parameter-base-category/content/parameter-base-topology/content/settling-moduli-prestack/content/meta-moduli-prestack/concepts/closure-rule-system.md) over that base, modulo closure-equivalence**:

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}} \,:\, \mathbf{B}^{\mathrm{op}} \to \mathbf{Gpd}, \qquad (\mathbf{L}, \mathcal{C}, E, \lambda) \mapsto \mathrm{Sys}^{\sim}(\mathbf{L}, \mathcal{C}, E, \lambda),$$

where $\mathrm{Sys}^{\sim}(B)$ is the groupoid defined below. This is predication categories' analog one level up: where $\mathscr{M}^{\mathrm{pre}}$ classifies *settlings* up to MLD-equivalence, $\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}$ classifies *closure-rule systems* up to closure-equivalence — the Lindenbaum-Tarski move from "models" to "theories" at the moduli level.

The full meta-moduli stack is the stackification ([meta-moduli stack theorem](../../documents/articles/notes/undated/meta-moduli-stack-theorem.md), forthcoming); the prestack here is the pseudo-functor, whose stack property is the substantive forthcoming theorem.

## The fiber groupoid $\mathrm{Sys}^{\sim}(B)$

For a base $B = (\mathbf{L}, \mathcal{C}, E, \lambda)$:

**Objects.** Closure-rule systems $\mathcal{S}$ over $B$ — finite or countable sets of [closure rules](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/parameter-base-category/content/parameter-base-topology/content/settling-moduli-prestack/content/meta-moduli-prestack/concepts/closure-rule.md) expressed in the [closure-rule language](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/parameter-base-category/content/parameter-base-topology/content/settling-moduli-prestack/content/meta-moduli-prestack/concepts/closure-rule-language.md) over $\mathcal{C}$ with $\mathbf{L}$-valued formulas, valid on $E \times E$ within the settling bound $\lambda$.

**Morphisms** $\mathcal{S}_1 \to \mathcal{S}_2$ are *rule-derivation maps* — assignments sending each rule $r \in \mathcal{S}_1$ to a derivation of $r$ from $\mathcal{S}_2$ (i.e., a witness that $r$'s consequent holds in any model of $\mathcal{S}_2$ where $r$'s antecedent holds). Composition is concatenation of derivations.

**Isomorphisms** are *closure-equivalences* — pairs of rule-derivation maps $\mathcal{S}_1 \rightleftarrows \mathcal{S}_2$ exhibiting that the generated closure operators agree:

$$\mathcal{S}_1 \;\cong\; \mathcal{S}_2 \quad\iff\quad \mathrm{cl}^{\mathcal{S}_1} = \mathrm{cl}^{\mathcal{S}_2}.$$

This is a genuine groupoid — closure-equivalences are reflexive (identity derivations), symmetric (by definition of pair), and transitive (concatenation of derivations).

## Why this is a groupoid (not just a category)

A rule-derivation map $\mathcal{S}_1 \to \mathcal{S}_2$ records "$\mathcal{S}_1$ is contained in the closure of $\mathcal{S}_2$." This is generally a *one-way* containment, giving a category rather than a groupoid. The groupoid structure comes from restricting to *isomorphisms* — pairs of derivation maps in both directions.

Formally: $\mathrm{Sys}^{\sim}(B)$ is the *core* of the rule-derivation category — the maximal subgroupoid, with objects = rule systems and morphisms = closure-equivalences. The MLD-style structural equivalence (settlings up to settling-shift) is finer than closure-equivalence; for the meta-moduli, closure-equivalence is the natural fiber-groupoid relation, mirroring how the visible settling fiber groupoid uses MLD-style equivalence at the settling level.

## Functoriality on morphisms in $\mathbf{B}$

A base-change $(\ell, e, \pi, \phi_\lambda) : B \to B'$ in $\mathbf{B}$ induces a base-change functor

$$(\ell, e, \pi, \phi_\lambda)^* \,:\, \mathrm{Sys}^{\sim}(B') \to \mathrm{Sys}^{\sim}(B)$$

by pullback. Concretely, for a rule system $\mathcal{S}'$ over $B'$:

- Each rule $r' \in \mathcal{S}'$ has antecedent $\phi'$ and consequent $\psi'$ expressed in $\mathbf{L}'$-valued formulas over $\mathcal{C}'$ with parameters in $E' \times E'$ at ordinal positions in $\lambda'$.
- The pulled-back rule $(\ell, e, \pi, \phi_\lambda)^* r'$ has antecedent $(\ell, e, \pi, \phi_\lambda)^* \phi'$ and consequent $(\ell, e, \pi, \phi_\lambda)^* \psi'$ — the formulas pulled back via the residuated-lattice morphism $\ell$, the predicate-functor $\pi$, the entity-set map $e$, and the ordinal-map $\phi_\lambda$.

Functoriality of pullback on rule-derivation maps follows because derivations are themselves expressed in the [closure-rule language](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/parameter-base-category/content/parameter-base-topology/content/settling-moduli-prestack/content/meta-moduli-prestack/concepts/closure-rule-language.md), which pulls back along $(\ell, e, \pi, \phi_\lambda)$.

## Why this is a prestack

A *prestack* is a pseudo-functor valued in groupoids satisfying the *local-Hom-condition* — that the Hom-presheaves are sheaves. For the meta-moduli prestack, the Hom-presheaf is

$$B \mapsto \mathrm{Hom}_{\mathrm{Sys}^{\sim}(B)}\bigl(\mathcal{S}_1|_B,\, \mathcal{S}_2|_B\bigr) = \{\text{rule-derivation maps } \mathcal{S}_1|_B \to \mathcal{S}_2|_B\}.$$

A rule-derivation map is determined by its action on individual rules of $\mathcal{S}_1|_B$, which is in turn determined by formulas in the fiber algebra. By the [predication fiber algebra](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/parameter-base-category/content/parameter-base-topology/content/settling-moduli-prestack/content/meta-moduli-prestack/_archive/predication-fiber-algebra.md)'s sheaf-of-equational-algebras structure on $(\mathbf{B}, J_\mathbf{B})$, formulas descend along covers. Hence rule-derivation maps descend, and the Hom-presheaf is a sheaf.

This is the precise meta-moduli analog of the [settling moduli prestack property](../../documents/articles/notes/undated/settling-moduli-prestack-property.md). The full stack property — effective descent for *objects* (rule systems), not just morphisms — is the content of the forthcoming [meta-moduli stack theorem](../../documents/articles/notes/undated/meta-moduli-stack-theorem.md).

## Closure-equivalence vs structural-equivalence

Two notions of equivalence on closure-rule systems are relevant:

**Closure-equivalence**: $\mathcal{S}_1 \cong_{\mathrm{cl}} \mathcal{S}_2 \iff \mathrm{cl}^{\mathcal{S}_1} = \mathrm{cl}^{\mathcal{S}_2}$. The generated closure operators agree pointwise.

**Structural-equivalence**: $\mathcal{S}_1 \cong_{\mathrm{str}} \mathcal{S}_2 \iff $ the settling moduli of $\mathcal{S}_1$ agrees with that of $\mathcal{S}_2$ (the moduli of settlings $v$ obtained by varying the increment sequence $U$).

Closure-equivalence implies structural-equivalence (same closure operator gives same settlings, hence same moduli); the converse may fail (different closure operators could in principle yield the same moduli after the visible quotient). The meta-moduli prestack defined here uses **closure-equivalence**, the strictly finer notion. A *visible meta-moduli* using structural-equivalence would be a coarser quotient — the meta-level analog of the existing visible-vs-fine distinction at the settling level.

For the rest of the chapter, we use closure-equivalence by default, with structural-equivalence noted where relevant.

## Role

The base of the [meta-moduli stack theorem](../../documents/articles/notes/undated/meta-moduli-stack-theorem.md) (forthcoming) and ultimately of the meta-classifier $\mathcal{M}^{\mathrm{meta}}$. Together with the existing [settling moduli prestack](../../documents/articles/notes/undated/settling-moduli-prestack.md), it gives the corpus a *paired tower of moduli*:

$$\mathscr{M}^{\mathrm{meta}}_{\mathrm{pre}}(B) \,=\, \text{rule systems} \;\xrightarrow{\text{realizability}}\; \mathscr{M}^{\mathrm{pre}}(B) \,=\, \text{settlings up to MLD}.$$

The realizability map sends each rule system $\mathcal{S}$ to its associated settling moduli stack [its settling fiber groupoid as $U$ varies]. This is the [meta-realizability map](../../../../../../../logic-services-section/content/text/glossary/concepts/meta-realizability-map.md) (forthcoming).

## What this prestack does not yet do

- It does not classify rule systems by *meta-cohomological* invariants (analog of the [combined cohomology classifying morphism](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/parameter-base-category/content/parameter-base-topology/content/settling-moduli-prestack/content/meta-moduli-prestack/morphisms/combined-cohomology-classifying-morphism.md)). The meta-cohomology layer is open.
- It does not yet establish descent of rule-system data from local pieces; that's the [meta-moduli stack theorem](../../documents/articles/notes/undated/meta-moduli-stack-theorem.md).
- It does not yet extract regime structure at the meta level; that's the [meta-stratification by regime theorem](../../documents/articles/notes/undated/meta-stratification-by-regime.md).

These build on the prestack as a foundation. With the meta-moduli prestack defined, the meta-classifier construction becomes a concrete categorical object whose properties can be verified by the same techniques (Vistoli-style descent, Kelly-Lack property-likeness) that established the existing settling moduli stack.
