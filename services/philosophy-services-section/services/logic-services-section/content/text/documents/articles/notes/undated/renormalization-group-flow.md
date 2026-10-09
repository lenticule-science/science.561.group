---
type: narrative
status: current
discusses: [step-n-substitution-recurrence, step-n-moduli-substack, step-shift-morphism, step-shift-functoriality-theorem, step-n-fixed-point, critical-exponents-at-step-n-fixed-point, four-bilattice]
title: Renormalization-group flow on the step-n moduli family
description: The corpus's first internal renormalization-group structure, surfaced by the step-$n$ substitution-recurrence family.
---

# Renormalization-group flow on the step-n moduli family

The corpus's first internal **renormalization-group structure**, surfaced by the [step-$n$ substitution-recurrence](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/concepts/step-n-substitution-recurrence.md) family. The [step-shift morphism](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/morphisms/step-shift-morphism.md) acts as RG flow on the parameterized moduli family $\{\mathscr{M}^{(n)}\}_{n \geq 2}$; fixed points of the flow are step-shift-invariant rules; critical exponents at the fixed points are predication categories' algebraic-number invariants (limiting growth rates → Pisot numbers).

This is a structurally distinctive direction: predication categories' framework, when applied to the substitution-flavored content, naturally produces an RG-style flow with specific characteristic features.

## What renormalization is, structurally

A renormalization-group flow consists of:

1. **A parameterized family** of objects indexed by some "scale" parameter.
2. **A flow morphism** $\rho$ taking each scale to the next.
3. **Fixed points** of the flow — scales invariant under $\rho$.
4. **Critical exponents** — characteristic invariants at the fixed points.
5. **Universality** — different parameterized families that flow to the same fixed point share structural features near it.

In physics, the parameter is often "energy scale" or "lattice spacing"; the flow acts by "coarse-graining" the system; fixed points correspond to scale-invariant phases; critical exponents characterize phase transitions.

In predication categories' setting, all five pieces are present:

1. **Family**: $\{\mathscr{M}^{(n)}\}_{n \geq 2}$ — step-$n$ moduli sub-stacks.
2. **Flow**: $\sigma_n^{n+1}$ — the step-shift morphism.
3. **Fixed points**: rules invariant under $\sigma$ (or the colimit $\mathscr{M}^{(\infty)}$).
4. **Critical exponents**: limiting Pisot growth rates as $n \to \infty$.
5. **Universality**: different substitution rules with the same step-$n$ flow trajectory share asymptotic structural features.

## The flow's specific features

The corpus's RG flow has features distinctive to its bilattice / closure-rule setting:

**1. Discrete scale parameter.** The step parameter $n$ is discrete (integer $\geq 2$), not continuous. The flow acts in discrete jumps. This is a discrete RG flow, analogous to *iterated maps* in dynamical systems rather than continuous flows.

**2. Bilattice-aligned fixed levels.** Per the [step-n / bilattice correspondence theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/step-n-and-bilattice-correspondence.md), the steps $n = 2, 3, 4$ are *naturally distinguished* by the bilattice's intrinsic structure. The flow has no canonical "natural levels" beyond $n = 4$ — the flow continues into $n \geq 5$ but loses bilattice-alignment. This is structurally meaningful: predication categories' RG flow has a "bilattice-natural" sub-flow (steps 2 → 3 → 4) and an "asymptotic" sub-flow (steps 5, 6, ... → $\infty$).

**3. Pisot-number trajectories.** The growth rates of the substitutions at successive steps are Pisot numbers, with limiting behavior governed by the Pisot-number theory in algebraic number theory. The plastic number $\rho \approx 1.3247$ is the smallest Pisot number; the flow's "infrared" limit may approach the smallest Pisot accumulation point.

**4. Cohomological rank growth.** The flow takes $\mathbb{Z}^n \to \mathbb{Z}^{n+1}$ at each step — adding one rank per RG step. This is unusual: physical RG flows typically don't change the *rank* of cohomological invariants, just their numerical values. The corpus's flow is *rank-changing*, which makes it structurally distinctive.

## RG fixed points

A fixed point of the RG flow is a step-$n$ moduli point whose step-shifted image is itself (modulo closure-equivalence). The simplest candidate: rules where the step-shift extends the matrix in a way that produces a closure-equivalent rule.

For predication categories' framework, the most interesting fixed point is **the colimit $\mathscr{M}^{(\infty)} := \mathrm{colim}_n \mathscr{M}^{(n)}$** — the universal infinite-step substitution moduli. By the [step-shift functoriality theorem](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/theorems/step-shift-functoriality-theorem.md), this colimit exists in the 2-category of stacks. Its structural content is predication categories' [step-n fixed-point object](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/content/step-n-moduli-substack/content/step-n-fixed-point/step-n-fixed-point.md).

Concrete questions:

- **Is the colimit a non-trivial classifier?** Or is it degenerate (e.g., a single point)?
- **What's its dimension / rank?** Possibly $\aleph_0$ or $2^{\aleph_0}$ depending on the colimit construction.
- **Does it carry geometric structure?** A natural "infinite-step" substitution moduli might inherit topological structure from the ascending chain.

These are open. The [critical exponents theorem](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/aperiodic-settling/content/step-n-substitution-recurrence/content/step-n-substitution-rule/references/critical-exponents-at-step-n-fixed-point.md) (forthcoming) addresses the algebraic-number-side at the fixed point.

## Connection to physics RG

The corpus's RG flow has structural cousins in:

- **Block-spin renormalization** in lattice statistical mechanics: discrete RG flows on lattice models, with critical exponents at fixed points.
- **Wilson's RG** in quantum field theory: continuous flows on coupling-constant space.
- **Renormalization in dynamical systems** (Feigenbaum, etc.): discrete RG flows on iterated maps, with universal fixed points and exponents.

The corpus's flow has the **discrete** character of block-spin and the **rank-changing** character of dynamical systems renormalization. It's a hybrid type that arises specifically from the substitution-classification structure.

## What this opens up

Three downstream directions:

**1. Concrete RG-flow trajectory analysis.** Explicit study of the flow trajectory for specific starting points. E.g., does Fibonacci ($n = 2$) flow to Padovan ($n = 3$) under $\sigma$? Or to a different rank-3 point? How does the trajectory behave as $n$ grows?

**2. Universality classes.** Different starting substitutions might flow to the same fixed point (or asymptotic behavior). Identifying universality classes within the substitution family would parallel physics RG's universality.

**3. Connection to (∞, 1)-categorical structure.** The RG flow is naturally an ∞-categorical object (an infinite tower with coherent connecting morphisms). The corpus's [(∞, 1)-direction narrative](higher-categorical-direction.md) becomes more concrete here — RG flow gives a specific (∞, 1)-categorical structure to develop.

## Position in predication categories

This narrative is the *integrating articulation* of the RG-style content surfaced by the step-$n$ family. With the step-$n$ foundational machinery (concept, objects, morphisms, theorems) in place, the RG flow becomes a coherent corpus-internal structure with its own questions, downstream directions, and connections to physics / dynamical systems.

The narrative complements the [step-n correspondence narrative](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-2/narratives/step-n-correspondence.md) (forthcoming) which focuses on the *multi-level* parameter co-incrementing observation. This narrative focuses on the *flow* and *fixed-point* structure that the parameter family carries.
