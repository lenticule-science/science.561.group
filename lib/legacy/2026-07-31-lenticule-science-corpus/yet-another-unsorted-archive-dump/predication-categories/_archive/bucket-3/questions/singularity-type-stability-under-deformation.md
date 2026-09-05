---
kind: question
status: open
explores: [skh-deformation-ext-classification, strong-mld-via-composed-duality, d-frame-verdier-composition, non-scott-continuous-firing-ordinal, transfinite-bounded-regime-h1-generators]
---

# Singularity-type stability under deformation

The [closure-flow singularity-formation question](closure-flow-singularity-formation.md) treats non-Scott-continuous firings as singularities of the closure flow, with the firing-type (truth-only / falsity-only / $\top$) classifying the singularity. The [SKH deformation theory](../theorems/skh-deformation-ext-classification.md) gives first-order deformations of a settling classified by $\mathrm{Ext}^1$. **Open: which firing-types are active under deformation?** A firing-type is *active* if every nearby first-order deformation of the settling produces firings of the same type at the same ordinal positions. An *unstable* firing-type can flip into a different type under arbitrarily small deformations.

## Why this matters

The strong-MLD classification distinguishes settlings by their firing-orbit-type function $\tau^{\mathbb{D}}$. If firing-types are unstable, then strong-MLD orbits are not preserved under deformation — small perturbations can change the orbit type, moving the settling from one strong-MLD class to another.

This has substantial structural consequences:

- **Strong-MLD as an open equivalence relation, not just an equivalence relation.** If unstable firing-types exist, the strong-MLD equivalence has *open* and *closed* parts in the deformation topology — some classes are open (perturbations stay in the class), others are flagpoles (perturbations leave).

- **Stratification of the moduli stack.** Unstable firing-types produce *non-trivial stratification* of the [settling moduli stack](../theorems/settling-moduli-stack-theorem.md) by orbit-type-stability. Stable orbits are open strata; unstable orbits are codimension-positive. This is structurally analogous to *jet bundle stratifications* in differential topology.

- **Deformation paths between strong-MLD orbits.** A path in the moduli that crosses an unstable-firing region transitions between strong-MLD orbits. Whether such paths exist, and what they look like, is the content of this question.

## Conjectured stability picture

A first guess at the stability:

- **$\top$-firings are active.** A $\top$-firing simultaneously instantiates truth-positive and falsity-positive content for a cell. Small deformations of the closure rule preserve both content directions; the firing remains $\top$.

- **Truth-only and falsity-only firings are unstable.** A truth-only firing at $\mu$ has cell value $\mathbf{t}$; a small deformation that adds a tiny falsity-positive component would flip the firing to $\top$. The truth-only firing is therefore on the boundary of the $\top$-firing region.

If this picture is correct, the strong-MLD orbits stratify as:

- **Pure $\top$-firing orbits**: open strata (stable).
- **Pure truth-only / pure falsity-only orbits**: codimension-positive (unstable, on the boundary of $\top$-firing strata).
- **Mixed orbits**: complex stratification depending on which firings are which.

But the conjecture might be wrong in subtle ways. Specifically: the strict-adjoint structure of Boolean d-frame data may make truth-only firings *technically* stable (no infinitesimal falsity-content can be added because the bilattice values are discrete). The instability would emerge only with non-Boolean enrichment.

## Sub-questions

1. **Define stability of a firing-type precisely.** A firing-type $\tau^{\mathbb{D}}(v)(\mu)$ is *stable at $v$* iff every settling $v'$ in some $\mathrm{Ext}^1$-neighborhood of $v$ has $\tau^{\mathbb{D}}(v')(\mu) = \tau^{\mathbb{D}}(v)(\mu)$. Make precise: which deformation topology, which neighborhood structure.

2. **Boolean vs non-Boolean d-frame setting.** In the corpus's typical Boolean d-frame setting, all firing-types are conjecturally stable (the bilattice values are discrete; small deformations don't flip a firing to a different type). In a continuous setting (Lawvere-quantale-enriched, MV-algebra-enriched), instability becomes possible. Establish the dichotomy explicitly.

3. **Stratification theorem.** State and (sketch) prove: in the non-Boolean setting, the moduli stack stratifies by firing-type stability. Stable strata are open; unstable strata are codimension-positive.

4. **Connection to strong-MLD orbit-equivariance.** Show: stable firing-types correspond to *trivially* $\mathbb{D}$-equivariant orbit elements (the orbit action is the identity in a neighborhood). Unstable firing-types correspond to *non-trivially* $\mathbb{D}$-equivariant elements (the orbit action is non-trivial nearby). This connects the deformation-stability picture to the composed-duality orbit structure.

## Geometric-flow analog

In Ricci flow with surgery, certain singularity types are stable under perturbation of the initial metric — Type-I singularities (like cylindrical or neckpinch) persist under small perturbations; degenerate singularity types are unstable. The Hamilton-Perelman program proves explicit stability theorems for the cylindrical and neckpinch models.

The corpus's analog: stability theorems for $\top$-firing singularities (conjecturally stable) and truth-only / falsity-only firings (conjecturally unstable in non-Boolean settings).

## Connection to existing structure

This question is the deformation-theoretic corner of the geometric-flow trio:

- [Closure-flow singularity formation](closure-flow-singularity-formation.md) — the local blowup analysis at a single firing.
- [Surgical continuation past firings](surgical-continuation-past-firings.md) — the global surgical structure.
- (this question) — how the singularities behave under deformation.

It also connects:

- [SKH deformation Ext-classification](../theorems/skh-deformation-ext-classification.md) — the deformation theory framework.
- [Strong-MLD via composed duality](../theorems/strong-mld-via-composed-duality.md) — the orbit-type tracking.
- [Failure-event moduli stack](failure-event-moduli-stack.md) — the moduli object whose stratification this question concerns.

## Position in the program

Third in the geometric-flow trio. This is the deformation-interaction piece — connecting the geometric-flow singularity-formation framing to the deformation-theory framework already in place.

Concrete entry point: the strict-regime ⊤-firing example ([strict-regime-top-firing-verdier-self-dual](../examples/strict-regime-top-firing-verdier-self-dual.md)). Compute its $\mathrm{Ext}^1$ explicitly (it's a 1-dim deformation space in the d-frame setting), and verify that no deformation in $\mathrm{Ext}^1$ flips the firing-type to truth-only or falsity-only. This would establish stability of $\top$-firings on a small case, and identify the precise mechanism by which Boolean d-frame data forces stability.
