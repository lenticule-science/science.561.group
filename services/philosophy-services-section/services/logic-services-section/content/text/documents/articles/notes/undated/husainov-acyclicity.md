---
name: husainov-acyclicity
kind: concept
description: "The acyclicity condition on the bitopological-settling-site that allows Čech cohomology to compute derived-functor cohomology directly. The site has sufficiently many acyclic covers that Čech cocycle computations equal the derived functors at each degree. Husainov's contribution: identifying when a Grothendieck site admits this acyclicity."
applies-to: bitopological-settling-site
gives: "Čech-derived comparison: Ȟ^n(T*, F) ≅ H^n(T*, F)"
minted-from: theorem-context — referenced by bitopological-settling-site (in the substantive role it plays), settling-cohomology-vanishing-via-husainov-cech theorem, cech-derived-comparison-on-bitopological-site theorem; no own archive scrap. Content reconstructed from how bitopological-settling-site uses the property and from Husainov's published work on cohomological dimension of Grothendieck sites.
title: husainov-acyclicity
---

# Husainov acyclicity

A Grothendieck site `(T, J)` is **Husainov-acyclic** if for every sheaf `F`, the site has sufficiently many **acyclic covers** that Čech cohomology computes derived-functor cohomology:

$$\check{H}^n(\mathbf{T}, \mathcal{F}) \;\cong\; H^n(\mathbf{T}, \mathcal{F}) \qquad \text{for all } n.$$

An **acyclic cover** `{U_i → U}_i` is one where the higher Čech cohomology of `F` on the cover's nerve vanishes:

$$\check{H}^n\bigl(\{U_i → U\}, \mathcal{F}\bigr) \;=\; 0 \qquad \text{for } n \geq 1.$$

When acyclic covers refine every covering family in the site's topology, Čech cohomology equals derived cohomology by the Čech-derived comparison theorem.

## Husainov's contribution

The condition is named for Husainov, who identified general conditions on Grothendieck sites that guarantee acyclic covers exist in sufficient abundance. For the bitopological-settling-site specifically, the result reads as:

**Theorem (Husainov acyclicity of `T*`).** *The bitopological-settling-site `(T*, J)` admits sufficiently many pairwise-Stone covers whose Čech nerves are acyclic for the settling-associated-sheaf `F_U` and its variants.*

The condition is verified by:

1. **Pairwise-Stone clopen Boolean structure**: pairwise-Stone covers refine to Boolean-algebra clopen covers, which are computationally tractable.
2. **Finite-dimensionality of the underlying `C^op`**: when `cd(C^op) ≤ 1`, finite-Čech computations bound all higher Čech cohomology.
3. **Sheaf-coherence of `F_U`**: the KZ-coherent sheaf structure ensures the Čech computations respect the closure-operator structure.

## Why this matters for settling cohomology

Without Husainov acyclicity, settling-cohomology would have to be computed using injective resolutions and derived-functor machinery — abstract and computationally inaccessible. With Husainov acyclicity, Čech-computations on pairwise-Stone covers give the same answers.

Concretely:

- The **settling-cohomology-vanishes-above-degree-1** theorem can be proved either via Leray spectral sequence (derived-functor path) or via Husainov–Čech (direct cover path). Both yield the same result; Husainov-acyclicity is what makes the second path equivalent.
- The **bitopological-settling-site-axioms** theorem (already placed) shows the site is Grothendieck; Husainov-acyclicity is the additional structural property needed for computational tractability.

## Position

`finite-settlement-algebra/hacking/library/husainov-acyclicity/`. Settling tier — a property of the bitopological-settling-site (sibling at this same tier) that enables computational cohomology.

## Derivation source

**Minted from theorem context.** The concept is referenced by the bitopological-settling-site's frontmatter (as `husainov-acyclicity` dependency) and by the settling-cohomology-vanishing-via-husainov-cech theorem; no own archive scrap. The statement here is reconstructed from those references plus Husainov's published Grothendieck-site cohomological-dimension framework.
