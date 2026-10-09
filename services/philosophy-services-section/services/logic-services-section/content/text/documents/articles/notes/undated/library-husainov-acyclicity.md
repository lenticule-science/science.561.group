---
name: husainov-acyclicity
kind: property
description: "A poset-acyclicity condition (Husainov 2026) on the Dedekind-MacNeille completion of a poset P. When the substrate's base poset (C^op × {τ}, ≤) satisfies this, poset-Čech cohomology agrees with poset-derived-functor cohomology, so Čech computations on the bitopological-settling-site are valid derived cohomology computations."
holds-on: "the base poset (C^op × {τ}, ≤) of the bitopological-settling-site at each ordinal level τ"
controls: "agreement between Čech cohomology and derived-functor cohomology on (T*, J)"
sufficient-conditions: "C finite; or F predicate-locally-constant; or transfinite continuity along ω_1-chains in the predicate-of-interest case"
referenced-source: "@husainov2026 (Dedekind-MacNeille completion acyclicity)"
minted-from: theorem-context — invoked by cech-derived-comparison-on-bitopological-site and referenced as a hypothesis in subsequent cohomology computation theorems with no own archive scrap. Reconstructed from the cech-derived theorem's use.
title: husainov-acyclicity
---

# Husainov acyclicity

A **poset-acyclicity condition** [@husainov2026] on the Dedekind–MacNeille completion of a poset. When satisfied by the substrate's base poset, it makes **Čech cohomology agree with derived-functor cohomology** on the bitopological-settling-site.

## Statement

Let `P = (P, ≤)` be a poset and `DM(P)` its Dedekind–MacNeille completion (the smallest complete lattice into which `P` order-embeds). Then `P` satisfies the **Husainov acyclicity condition** if the inclusion `P ↪ DM(P)` is **cohomologically acyclic**: for every Abelian-group-valued presheaf `F` on `P` (equivalently every sheaf in the Alexandrov topology of `P`),

$$\check{H}^n(P, F) \;\cong\; H^n(P, F) \qquad \text{for all } n \geq 0.$$

Equivalently: the higher-derived-functors of the inclusion vanish on every sheaf, so the Čech complex computes the derived-functor cohomology directly.

## Substrate setting where it's invoked

The bitopological-settling-site `(T*, J)` carries a base poset structure `(C^op × λ, ≤)` where `C` is the predicate-category, `λ` is the settling-bound, and `(C^op × {τ}, ≤)` is the level-τ slice.

The condition is invoked level-by-level:

> *If for every `τ ≤ σ` the poset `(C^op × {τ}, ≤)` — equipped with the restriction of the input sheaf `F` to stage τ — satisfies Husainov acyclicity, then `Č^n(T*_{≤σ}, F) ≅ H^n(T*_{≤σ}, F)` for all `n ≥ 0`.* (cech-derived-comparison-on-bitopological-site)

This is the central technical fact that **makes Čech cohomology on the substrate's site valid derived cohomology**. Without it, the substrate's combinatorial cohomology computations are merely Čech-approximations, not the genuine derived cohomology that classifies aperiodic settlings.

## Sufficient conditions

Husainov acyclicity holds in three cases the substrate uses:

**1. `C` finite.** When the predicate-category is finite, `C^op × {τ}` is a finite poset, `DM` is trivially well-behaved, and the inclusion is acyclic by classical finite-poset cohomology arguments ([@bredon1997] Ch. III).

**2. `F` predicate-locally-constant.** When the sheaf `F` is constant along predicate-axis morphisms (predicate-locally-constant per `settling-local-constancy`), the poset cohomology reduces to topological cohomology on the discrete predicate level, which is Husainov-acyclic on any base.

**3. Transfinite continuity along ω_1-chains.** For the canonical-aperiodic-example case with one predicate `P` and base poset `(C^op × ω_1, ≤) = ({P} × ω_1, ≤) = ω_1`, the Dedekind–MacNeille completion is `ω_1 + 1`, and acyclicity reduces to **transfinite continuity** of the settling-associated sheaf along ω_1-chains (each ω_1-limit chain is a colimit). This is part of the aperiodic-classifying-invariant construction.

## How the fiber side and cross-ordinal side combine

The proof of cech-derived-comparison splits along the bitopological-site's fiber/cross-ordinal decomposition:

- **Fiber part** (pairwise-Stone covers at fixed `(q, τ)`): Boolean-algebra Čech vanishing in positive degree gives `Č^n(U, A) = A` for `n=0` and `0` for `n≥1` (Bredon Ch. III §2).
- **Cross-ordinal/cross-predicate part** (encoded in morphisms, not covers): Husainov acyclicity is what handles this side. The Alexandrov-topology equivalence between finite posets and finite topological spaces extends to bounded-ordinal cases; the Dedekind–MacNeille condition is exactly what makes poset-Čech agree with poset-derived-functor cohomology on the base.

So Husainov acyclicity is the technical condition that supplies the cross-ordinal/cross-predicate half of the Čech-derived comparison.

## Why this matters: practical computation

Husainov acyclicity is the difference between **provably correct** combinatorial cohomology computations on the substrate and **only-approximate** ones. With it, the substrate can:

- Compute `H^n` of finite-strict-regime settlings by direct Čech complexes on pairwise-Stone covers.
- Verify the `aperiodic-classifying-invariant` is a genuine `H^1` class (not just a Čech-shadow) for the canonical aperiodic example.
- Use Čech-style spectral sequences (e.g., the `void-cone-via-filtration-ss`) as bona fide derived-cohomology spectral sequences.

Without Husainov acyclicity, these computations would only deliver Čech approximations of the substrate's invariants, undermining the classification theorems.

## Position

`settling-cohomology/library/husainov-acyclicity/`. Settling tier — directly inside the cohomology object whose Čech-vs-derived comparison this condition controls. Direct `library/` placement (not `hacking/library/`) because Husainov acyclicity is a **derived term of settling-cohomology**: a property the cohomology framework defines on its input sheaves, not an admitted reference.

## Derivation source

**Minted from theorem context.** Invoked by `cech-derived-comparison-on-bitopological-site` (the only archive scrap that names it), referenced in the cohomology framework's discussions of when Čech computations are valid. No own archive scrap. Reconstructed from how the cech-derived theorem invokes it, plus the cited [@husainov2026] reference on Dedekind–MacNeille acyclicity, plus the substrate's three known sufficient-condition cases.
