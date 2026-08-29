---
type: theorem
status: sketch
depends-on: [meta-moduli-stack-theorem, meta-stratification-by-regime, meta-realizability-map, skh-deformation-ext-classification, settling-cohomology-vanishes-above-degree-1, q-enriched-cohomology-higher-degree-vanishing, closure-rule-system, closure-rule-language]
---

# Meta-deformation theory: Ext at the meta level

First-order deformations of a closure-rule system $\mathcal{S} \in \mathscr{M}^{\mathrm{meta}}$ are classified by a meta-level $\mathrm{Ext}^1$, with obstructions in meta-level $\mathrm{Ext}^2$. The substantive structural question — analog of the [settling-level vanishing-above-degree-1 theorem](settling-cohomology-vanishes-above-degree-1.md) — is whether the meta-level $\mathrm{Ext}^2$ vanishes, giving an **unobstructed meta-deformation theory** parallel to the settling level.

This theorem develops the meta-deformation framework at sketch level, with the unobstructedness conjecture stated explicitly. Together with the [CHL recursion stabilization check](chl-recursion-stabilization-check.md) (forthcoming), it gives the structural picture of how the meta-moduli interacts with deformation.

## What a meta-deformation is

A *first-order meta-deformation* of $\mathcal{S}$ over $B$ is a closure-rule system $\mathcal{S}_\epsilon$ over $B \otimes k[\epsilon]/(\epsilon^2)$ such that:

- $\mathcal{S}_\epsilon|_{\epsilon = 0} \cong_{\mathrm{cl}} \mathcal{S}$ (specializes to $\mathcal{S}$ at the trivial point).
- $\mathcal{S}_\epsilon$ is itself a coherent closure-rule system over the deformed base.

Concretely, $\mathcal{S}_\epsilon$ is $\mathcal{S}$ with each rule perturbed by an $\epsilon$-correction: if $r \in \mathcal{S}$ has antecedent $\phi$ and consequent $\psi$, then $r_\epsilon \in \mathcal{S}_\epsilon$ has antecedent $\phi + \epsilon \cdot \delta\phi$ and consequent $\psi + \epsilon \cdot \delta\psi$ for some perturbations $\delta\phi, \delta\psi$ in the closure-rule language.

The space of all such perturbations modulo trivial deformations (re-parametrizations of $\mathcal{S}$) is the **meta-tangent space** $T_{[\mathcal{S}]} \mathscr{M}^{\mathrm{meta}}$.

## Statement

**Theorem (meta-deformation Ext-classification, sketch).** Let $\mathcal{S}$ be a closure-rule system over a base $B$. Then:

1. **First-order meta-deformations** of $\mathcal{S}$ are classified by $\mathrm{Ext}^1_{\mathrm{meta}}(\mathcal{S}, \mathcal{S})$ — the first $\mathrm{Ext}$ in the meta-moduli's ambient category.

2. **Obstructions** to extending a first-order meta-deformation to second-order lie in $\mathrm{Ext}^2_{\mathrm{meta}}(\mathcal{S}, \mathcal{S})$.

3. **Conjecture (meta-unobstructedness):** $\mathrm{Ext}^2_{\mathrm{meta}}(\mathcal{S}, \mathcal{S}) = 0$ for every $\mathcal{S}$ in predication categories' typical setting (closure-rule language fragments up to $\Pi_2$, finite-rule-system case). Equivalently, **every first-order meta-deformation extends to a formal meta-deformation without obstruction** — the meta-deformation theory is unobstructed, paralleling the settling-level result.

The conjecture is supported by predication categories' structural pieces but not yet established at draft level.

## Why the conjecture is plausible

Three structural arguments for the meta-unobstructedness conjecture:

**1. Rule-language fragments stabilize at $\Pi_2$.** The corpus's [closure-rule language](teaching/explanations/closure-rule-language.md) hierarchy reaches its richest level at $\Pi_2$ (alternating quantifiers). Beyond this level, additional language complexity doesn't add expressive power *in predication categories' setting* — the bilattice + closure dynamics don't naturally reach $\Pi_3$ or higher because the closure operator's lax-idempotence collapses higher-arity quantifier alternations. Hence rule perturbations live in a "bounded" rule-language space, and $\mathrm{Ext}^2_{\mathrm{meta}}$ has no room to be non-zero structurally.

**2. The meta-moduli inherits the settling-level vanishing.** Per the [settling-level vanishing-above-degree-1 theorem](settling-cohomology-vanishes-above-degree-1.md), $H^{\geq 2} = 0$ for the settling-associated sheaves. Under the [meta-realizability map](meta-realizability-map.md) $\pi^{\mathrm{real}} : \mathscr{M}^{\mathrm{SKH}} \to \mathscr{M}^{\mathrm{meta}}$, the meta-moduli inherits a vanishing structure: the pullback of $\mathrm{Ext}^2_{\mathscr{M}^{\mathrm{SKH}}}$ along $\pi^{\mathrm{real}}$ vanishes, so the corresponding meta-level $\mathrm{Ext}^2$ should vanish too — at least for points $[\mathcal{S}]$ in the image of $\pi^{\mathrm{real}}$.

The argument is delicate: $\mathrm{Ext}^2$ on the meta-moduli is *not* the pullback of $\mathrm{Ext}^2$ on $\mathscr{M}^{\mathrm{SKH}}$; it's the Ext in the *target* category, which is structurally different. But the realizability map's compatibility with deformations should give a comparison map that controls the vanishing.

**3. Boolean d-frame data is structurally rigid.** For predication categories' typical setting (Boolean d-frame stalks, $\Pi_1$ rules), the closure-rule structure is essentially combinatorial — discrete data without continuous tangent directions. The meta-deformation space is therefore *small* (often zero-dimensional in concrete examples), and meta-obstructions are vacuous because there's nothing to obstruct.

In richer enrichments (Lawvere-quantale, MV-algebra), continuous tangent directions exist and the unobstructedness conjecture has more structural content — and may fail.

## What unobstructed meta-deformation gives

Three concrete consequences (assuming the conjecture):

**1. The meta-moduli is formally smooth.** The classical consequence of unobstructed deformation theory: $\mathscr{M}^{\mathrm{meta}}$ is locally a power-series ring in $\dim \mathrm{Ext}^1_{\mathrm{meta}}$ variables, with no relations. Meta-points have well-defined formal neighborhoods.

**2. The CHL recursion can be tested for stabilization.** With both the settling-level $\mathrm{Ext}^1$ ([SKH-deformation](skh-deformation-ext-classification.md)) and the meta-level $\mathrm{Ext}^1$ in hand, the [stabilization check](chl-recursion-stabilization-check.md) becomes a concrete comparison: do the two tangent spaces agree (stabilization) or differ (divergence)?

**3. Concrete deformation calculations become accessible.** The trivial-base meta-classification ([trivial-base-meta-classification](../examples/trivial-base-meta-classification.md)) has 4 meta-points, all in the meta-strict stratum. Computing their meta-tangent spaces explicitly would give a first concrete picture of meta-deformations — likely 0-dimensional in this trivial case, but the framework would be exercised.

## Interaction with the meta-stratification

The [meta-stratification by regime](meta-stratification-by-regime.md) interacts with the deformation theory:

**Conjecture (meta-stratification stability).** Meta-deformations *within* a stratum stay in the stratum. Specifically: a meta-deformation of an aperiodic-stratum $\mathcal{S}$ produces a nearby aperiodic-stratum $\mathcal{S}_\epsilon$, not one in a different stratum.

This is structurally analogous to the settling-level [regime stratification's non-semicontinuity](regime-stratification-non-semicontinuity.md). At the settling level, deformations can move "up" the regime hierarchy (toward more complex closure ordinals) but not "down." The meta-level conjecture: deformations preserve the meta-regime.

**Conjecture (meta-stratum dimension).** Each meta-stratum has its own tangent-space dimension, with:

- $\dim T \mathscr{M}^{\mathrm{meta}}_{\mathrm{strict}} = $ small (finite per-rule perturbations).
- $\dim T \mathscr{M}^{\mathrm{meta}}_{\mathrm{SC}} = $ moderate (countable).
- $\dim T \mathscr{M}^{\mathrm{meta}}_{\mathrm{TB}} = $ countable.
- $\dim T \mathscr{M}^{\mathrm{meta}}_{\mathrm{aper}} = $ uncountable (up to $2^{\aleph_0}$, matching the realizability cardinality bound).

These are conjectural; the precise dimensions require concrete computation.

## What's open

**Internal to this theorem:**

1. **Defining $\mathrm{Ext}^1_{\mathrm{meta}}, \mathrm{Ext}^2_{\mathrm{meta}}$ precisely.** The meta-moduli's ambient category needs to be identified — possibly the category of fibered groupoids on $\mathbf{B}$, with derived functors of internal Hom giving the Ext.

2. **The meta-unobstructedness conjecture's proof.** Three structural arguments support it, none constitute a proof. A draft-level proof would require: (a) precise meta-Ext definition, (b) explicit comparison with settling-Ext via $\pi^{\mathrm{real}}$, (c) verification on concrete examples.

3. **Concrete meta-deformation calculations.** Trivial-base, Scott-continuous, transfinite-bounded examples — what do their meta-tangent spaces actually look like?

**Beyond this theorem:**

4. **The CHL recursion stabilization question.** Whether the meta-deformation theory's tangent space at a representative point agrees with the settling-deformation theory's tangent space (stabilization) or produces strictly new content (divergence). [chl-recursion-stabilization-check](chl-recursion-stabilization-check.md) is the next theorem.
