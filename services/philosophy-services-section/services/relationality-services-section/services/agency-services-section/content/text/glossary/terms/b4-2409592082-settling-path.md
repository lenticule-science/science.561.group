---
type: definition
class: family
symbol: "(v_t)_{t \\in I}"
depends-on: [predication-settling, settling-morphism, skh-deformation-ext-classification, settling-moduli-stack-theorem]
name: Settling path
description: A settling path is a continuous family of settlings parameterized by an interval $I \subseteq \mathbb{R}$ (or more generally, a connected topological space).
---


A **settling path** is a continuous family of settlings parameterized by an interval $I \subseteq \mathbb{R}$ (or more generally, a connected topological space). Formally:

$$(v_t)_{t \in I} : I \to \mathrm{Settlings}_B$$

where $\mathrm{Settlings}_B$ is the category of settlings on a fixed base $B$, with continuity meaning that for each $t \in I$, the settlings $v_t$ and $v_{t + \epsilon}$ are related by a first-order deformation in the [SKH-deformation-Ext sense](../../documents/articles/notes/undated/skh-deformation-ext-classification.md) for sufficiently small $\epsilon$.

## Concretely

A settling path is:

- **Pointwise a settling**: each $v_t$ is closure-stable under a fixed (or smoothly-varying) closure-rule system $\mathcal{S}_t$.
- **Locally a deformation chain**: for each $t$, there's a neighborhood $(t - \epsilon, t + \epsilon) \subset I$ in which $v_{t'}$ is a first-order deformation of $v_t$ for $t'$ close to $t$. Concretely, the difference $v_{t'} - v_t$ corresponds to an element of $\mathrm{Ext}^1(\mathcal{F}_{v_t}, \mathcal{F}_{v_t})$, the first-order tangent direction.
- **Globally a path**: gluing the local deformation chains via the chain-rule of deformation composition gives a coherent global path.

For *formal* deformations (predication categories' setting per [SKH-deformation-Ext-classification](../../documents/articles/notes/undated/skh-deformation-ext-classification.md)), every first-order deformation extends to a formal deformation by $\mathrm{Ext}^2 = 0$. So settling paths in the formal sense are well-defined and freely extendable.

## Cohomological invariant along a path

For each $t \in I$, the path produces a classifying invariant $\mathrm{cl}\text{-}\mathrm{inv}(v_t) \in H^1(\mathbf{T}^*, \mathcal{F}_{v_t})$. The natural question: **how does this invariant vary along the path?**

The answer (proved separately, see the [no-tunneling theorem](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-path/theorems/cl-inv-locally-constant-on-paths.md)): $\mathrm{cl}\text{-}\mathrm{inv}(v_t)$ is *locally constant* in $t$ for any settling path. Formal deformations preserve the cohomological invariant.

This means: **a settling path stays within a single MLD-equivalence class.** No smooth path crosses between MLD-classes.

## Path types

Settling paths come in several structural classes:

- **Trivial path**: $v_t = v_0$ for all $t$. Constant.
- **Within-MLD path**: $v_t$ varies but $\mathrm{cl}\text{-}\mathrm{inv}(v_t)$ is constant. The path stays in one MLD-class.
- **Regime-changing path**: $v_t$ has different closure ordinals at different $t$. Per [regime-stratification non-semicontinuity](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-path/theorems/regime-stratification-non-semicontinuity.md), regime can shift "upward" along deformations (strict → SC → TB → aperiodic) but not downward.
- **Discontinuous path**: a "path" that has a jump at some $t = t_0$, where $v_{t_0^-}$ and $v_{t_0^+}$ are not related by a small deformation. Not a path in the formal sense — but useful for modeling sudden transitions.

## What this object enables

The settling-path object is predication categories' first parameterized-time-dynamics primitive. With it in place:

- **Agential dynamics**: an agent's behavior over time = a settling path through its accessible-information moduli. The path's structural type (within-MLD, regime-changing, discontinuous) classifies the kind of agential behavior.
- **Bifurcation analysis**: a settling-path-family $\{(v_t^\theta)_t : \theta \in \Theta\}$ parameterized by both time $t$ and a structural parameter $\theta$ admits standard bifurcation analysis — when does the path's structural type change as $\theta$ varies?
- **Cohomological tunneling**: the question "can cl-inv tunnel between classes" becomes precise — answered negatively for formal paths by the no-tunneling theorem.

## Position in predication categories

Foundational primitive for predication categories' path-level deformation theory. Pairs forward with:

- The [no-tunneling theorem](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/spatiotemporal-knowledge-presheaf/content/settling-path/theorems/cl-inv-locally-constant-on-paths.md) — proves cl-inv is locally constant on paths.
- The [SKH-deformation-Ext-classification](../../documents/articles/notes/undated/skh-deformation-ext-classification.md) — the local (first-order) version of path-deformation.
- The [tunneling-and-agential-dynamics narrative](../../../../../../../logic-services-section/content/text/documents/articles/notes/undated/tunneling-and-agential-dynamics.md) — agential interpretation.

Open downstream:

- *Path of paths* (homotopy of settling paths). Two paths $(v_t)$ and $(w_t)$ from the same start to the same end — are they homotopic? Homotopy classes of paths.
- *Discontinuous-path classification*: the "non-smooth" jumps that DO cross MLD-classes. What's the structure of these jumps? Currently they're *outside* the formal-deformation framework; a separate theory of "non-formal transitions" is needed.
