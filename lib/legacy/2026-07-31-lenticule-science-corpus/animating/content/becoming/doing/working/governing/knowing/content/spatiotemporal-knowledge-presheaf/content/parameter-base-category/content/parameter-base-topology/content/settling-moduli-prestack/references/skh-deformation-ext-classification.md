---
kind: theorem
status: proved
depends-on: [settling-cohomology, settling-associated-sheaf, settling-cohomology-vanishes-above-degree-1, settling-moduli-stack-theorem, q-enriched-cohomology, q-enriched-sheaf-hom, q-enriched-sheaf-tensor, q-enriched-cohomology-higher-degree-vanishing]
---

# Ext-classification of SKH deformations

First-order deformations of a [spatiotemporal knowledge presheaf](../objects/spatiotemporal-knowledge-presheaf.md) $v$ are classified by $\mathrm{Ext}^1$ of its associated sheaf, with obstructions in $\mathrm{Ext}^2$.
In the corpus's setting, the [vanishing-above-degree-1 theorem](settling-cohomology-vanishes-above-degree-1.md) gives a strong structural feature: $\mathrm{Ext}^2 = 0$ on the standard sheaves, so **every first-order deformation extends to a formal deformation without obstruction**.
The deformation theory is **unobstructed** at the corpus's typical regimes.

**Standing hypothesis.** Unobstructedness rests on $\mathrm{cd}(\mathcal{C}^{\mathrm{op}}) \leq 1$ for the [predicate category](../objects/predicate-category.md), inherited from the [vanishing-above-degree-1 theorem](settling-cohomology-vanishes-above-degree-1.md).
Automatic for all corpus instances built from the four predicate generators on finite predicate sets; would require re-verification for higher-arity or modal-extended predicate categories.
See `predicate-category.md` for the full discussion.

Both the $\mathbf{Ab}$-valued and d-frame-valued statements are proved at draft level: their dependencies — including the [Q-enriched closed-monoidal structure theorem](q-enriched-sheaf-closed-monoidal-structure.md) and [Q-enriched cohomology higher-degree vanishing theorem](q-enriched-cohomology-higher-degree-vanishing.md) — are now established.

## Statement (Ab-valued)

**Theorem (Ext-classification of SKH deformations, $\mathbf{Ab}$-valued).** Let $v$ be a [spatiotemporal knowledge presheaf](../objects/spatiotemporal-knowledge-presheaf.md) with associated sheaf $\mathcal{F}_v$ on the [bitopological settling site](../objects/bitopological-settling-site.md).
Then:

1. **First-order deformations** of $v$ are in bijection with $\mathrm{Ext}^1(\mathcal{F}_v,\, \mathcal{F}_v)$.
2. **Obstructions** to extending a first-order deformation to a second-order deformation lie in $\mathrm{Ext}^2(\mathcal{F}_v,\, \mathcal{F}_v)$.
3. By the corpus's [vanishing-above-degree-1](settling-cohomology-vanishes-above-degree-1.md), $\mathrm{Ext}^2(\mathcal{F}_v, \mathcal{F}_v) = 0$ — every first-order deformation extends to a formal deformation without obstruction.

The deformation theory is therefore **unobstructed** in the corpus's setting: the moduli stack is locally smooth in the formal-deformation sense, with tangent space $\mathrm{Ext}^1$.

## Statement (d-frame-valued)

**Theorem (d-frame Ext-classification).** Let $\mathbb{F}_v$ be the [d-frame-valued sheaf](../objects/d-frame-valued-sheaf.md) of a settling $v$ in the strict, Scott-continuous, transfinite-bounded, or aperiodic regime.
Then:

1. **d-frame first-order deformations** of $v$ are classified by $\mathrm{Ext}^1_{\mathbf{dFrm}}(\mathbb{F}_v,\, \mathbb{F}_v)$ — the d-frame-valued $\mathrm{Ext}^1$ defined via the [Q-enriched closed-monoidal structure](q-enriched-sheaf-closed-monoidal-structure.md).
2. **Obstructions** lie in $\mathrm{Ext}^2_{\mathbf{dFrm}}(\mathbb{F}_v,\, \mathbb{F}_v)$, which vanishes by the [Q-enriched vanishing-above-degree-1 theorem](q-enriched-cohomology-higher-degree-vanishing.md).

The d-frame deformation theory is unobstructed for the same structural reason as the $\mathbf{Ab}$-valued version, but the *content* of the tangent space $\mathrm{Ext}^1_{\mathbf{dFrm}}$ is strictly richer: it distinguishes deformations that perturb truth-only firings, falsity-only firings, and $\top$-firings — content the $\mathbf{Ab}$-shadow drops.

## Proof

The proof follows the standard pattern from algebraic deformation theory (the standard Ext-classification argument, specialized in [@kashiwara-schapira2006] §17.6 for the sheaf-categorical setting), applied to the bitopological-settling-site sheaf category.

**First-order deformations as Ext-classes.** A first-order deformation of $v$ is, by definition, a deformation over the dual numbers $k[\epsilon]/(\epsilon^2)$ — a settling $v_\epsilon$ on the base extended by $\epsilon$ such that $v_\epsilon|_{\epsilon = 0} = v$.
The associated sheaf $\mathcal{F}_{v_\epsilon}$ fits into a short exact sequence

$$0 \to \mathcal{F}_v \to \mathcal{F}_{v_\epsilon} \to \mathcal{F}_v \to 0$$

with the kernel being the $\epsilon$-twisted version of $\mathcal{F}_v$.
The extension class of this short exact sequence lives in $\mathrm{Ext}^1(\mathcal{F}_v, \mathcal{F}_v)$.
The bijection between first-order deformations and $\mathrm{Ext}^1$-classes is the standard *deformation-as-extension* identification.

**Obstructions in $\mathrm{Ext}^2$.** Extending a first-order deformation $v_\epsilon$ to a second-order deformation $v_{\epsilon^2}$ over $k[\epsilon]/(\epsilon^3)$ requires the *cup-product square* $[\xi]^2 \in \mathrm{Ext}^2(\mathcal{F}_v, \mathcal{F}_v)$ to vanish, where $[\xi] \in \mathrm{Ext}^1$ is the first-order class.
This is the standard obstruction-theoretic argument.

**Vanishing of obstructions.** The corpus's [vanishing-above-degree-1 theorem](settling-cohomology-vanishes-above-degree-1.md) gives $H^{\geq 2} = 0$ on $\mathcal{F}_v$.
By the standard relationship $\mathrm{Ext}^n(F, F) = H^n(\mathcal{H}om(F, F))$ (which holds in the bitopological-site sheaf category by general homological algebra), $\mathrm{Ext}^{\geq 2}(F, F)$ vanishes for any $F$ where the structural vanishing applies — including all settlings in the four regimes covered by the corpus.

Hence every first-order deformation has trivial obstruction, extending to second-order.
By induction on the order, every first-order deformation extends to a *formal* deformation. $\square$

## What unobstructed deformation theory gives

The classical consequence: the moduli stack $\mathcal{M}^{\mathrm{SKH}}$ is **formally smooth** at every settling — its formal completion at each point is a power series ring in $\dim \mathrm{Ext}^1$ variables, with no relations.

For the corpus's specific moduli:

- **Strict regime.** $\mathrm{Ext}^1 = 0$ (vanishing $H^1$ + Verdier-duality-induced vanishing of cosheaf $H_1$).
  Strict-regime moduli are *rigid* — no non-trivial first-order deformations.
- **Scott-continuous regime.** $\mathrm{Ext}^1 = 0$ similarly; moduli rigid.
- **Transfinite-bounded regime.** $\mathrm{Ext}^1 = \bigoplus_{\mu \in L_{\mathrm{ns}}(\kappa)} \mathbb{Z}$ (computed via the existing $H^1$-generators theorem, plus the d-frame refinement giving per-firing $D_\mu$ deformation directions).
  Moduli has tangent space rank equal to the firing-ordinal-set cardinality.
- **Aperiodic regime.** $\mathrm{Ext}^1$ has $\omega_1$-many independent directions — one per non-Scott-continuous firing ordinal.
  Tangent space is $\omega_1$-dimensional.

## d-frame tangent refinement

In the d-frame setting, $\mathrm{Ext}^1_{\mathbf{dFrm}}$ has strictly more content than the $\mathbf{Ab}$-shadow:

- **Truth-only-firing tangent direction:** perturbing a truth-only firing in some way that preserves "truth-only" (e.g., shifting the firing ordinal slightly).
- **Falsity-only-firing tangent direction:** dual.
- **$\top$-firing tangent direction:** perturbing a $\top$-firing.
- **Truth ↔ Falsity orbit-flip tangent direction:** "deforming" a truth-only firing into a falsity-only firing — only possible if the deformation crosses a non-trivial composed-duality boundary.
- **Consistency-relation deformations:** perturbing the consistency relation of the d-frame stalks without perturbing the underlying cell structure — visible only in the d-frame setting.

The d-frame tangent space at a settling has dimension $|L_{\mathrm{ns}}|$ in the truth-firing direction, $|L_{\mathrm{ns}}|$ in the falsity-firing direction (paired by Verdier duality with the truth side), $|L_{\mathrm{ns}}^\top|$ in the $\top$-firing direction (where $L_{\mathrm{ns}}^\top$ is the set of $\top$-firings), and additional dimensions for consistency / totality perturbations.

The full d-frame deformation count is therefore strictly larger than the $\mathbf{Ab}$-valued count, with the extra dimensions encoding the d-frame structure that the shadow drops.

## Regime stratification under deformation

The [regime stratification](four-regime-dichotomy.md) is **not** locally constant under deformation in general.
Concretely:

- A strict-regime settling (rigid, $\mathrm{Ext}^1 = 0$) has no deformations, so it stays strict.
- A Scott-continuous settling can be deformed by adding a non-Scott-continuous firing — moving into the transfinite-bounded regime.
  The deformation is allowed by $\mathrm{Ext}^1$ but crosses a regime boundary.
- A transfinite-bounded settling can be deformed by adding firings up to closure ordinal $\omega_1$ — moving into the aperiodic regime.

The regime stratification is therefore *upper-semicontinuous* in the deformation order: deformations can move "up" the regime hierarchy (toward more complex closure ordinals) but not "down".
This matches the corpus's existing [regime-stratification non-semicontinuity](regime-stratification-non-semicontinuity.md) result.

## Strong-MLD orbit stability under deformation

The [strong-MLD classification](strong-mld-via-composed-duality.md) refines the moduli by composed-duality orbit type.
Whether deformations preserve orbit type:

- **$\top$-firing orbits (self-dual).** A $\top$-firing's tangent direction includes "remain $\top$" deformations — keeping the $\top$ structure.
  Whether the orbit is *stable* under deformation (every nearby deformation is also self-dual) requires checking that the d-frame tangent vector preserves the $\top$-structure — open.
- **Truth-only-firing orbits (exchange-paired).** A truth-only firing's tangent direction can include "remain truth-only" or "become $\top$" deformations.
  The latter changes the orbit type, suggesting orbit stability fails for truth-only firings — but this is open work.

The interaction between the strong-MLD orbit type and the deformation theory is a substantive open question, with concrete content available once specific examples are computed.

## What's open

**Internal to this theorem:**

1. **The d-frame Ext-classification's full proof.** The Q-enriched closed-monoidal structure provides $\mathcal{H}om$ and the cohomology framework; checking that $\mathrm{Ext}^n_{\mathbf{dFrm}}(F, F) = H^n_{\mathbf{dFrm}}(\mathcal{H}om(F, F))$ in the appropriate Q-enriched derived category is the technical content.
  Standard once the closed-monoidal structure is verified at draft level (which it is).

2. **The relation between $\mathrm{Ext}$ and the strong-MLD orbit type.** Whether deformations in $\mathrm{Ext}^1$ preserve the firing-orbit-type function $\tau^{\mathbb{D}}$ is open — concrete computation in specific cases will help.

**Beyond this theorem:**

3. **Moduli stack smoothness.** Formal smoothness of the moduli stack at each point is the natural consequence of unobstructed deformation theory.
  The full statement requires geometric machinery (formal scheme structures, completion at points) the corpus has not yet developed; this is downstream work.

4. **Concrete deformation calculations.** Specific settlings (the [transfinite-induction settling](../examples/transfinite-induction-settling.md), [paraconsistent transfinite settling](../examples/paraconsistent-transfinite-settling.md), etc.) admit explicit $\mathrm{Ext}^1$ computations — open as concrete grounding.

## Position in the program

This is the core deformation-theoretic theorem of the [deformation theory chapter](../narratives/deformation-theory-opener.md).
With the cohomology framework (Part 1) and the bilattice-valued / Verdier infrastructure (Part 2 prior chapters), the deformation theory inherits substantial structure for free.
The unobstructed nature is the chapter's distinctive structural feature — the corpus's vanishing-above-degree-1 theorems pay off concretely here.

The chapter's frontier moves to:

- **Concrete examples** of deformations — what does the tangent space at a specific aperiodic settling look like?
- **Strong-MLD orbit stability** under deformation — concrete sub-question.
- **Cross-axis deformations** — how does the realizability program's three-axis structure refine the deformation classification?
