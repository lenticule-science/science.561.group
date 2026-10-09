---
name: predicate-category-naturality
kind: concept
description: "The condition that a per-predicate datum (valuation, sheaf section, etc.) respects the predicate-category's reindexing structure. For a datum d_p indexed by predicates, naturality means: for every C-morphism f: q → p, f*(d_p) = d_q. Equivalently, d_p assembles into a natural transformation of the predication-fiber-functor with itself."
condition: "for every f: q → p in C, f*(d_p) = d_q"
realized-by:
  - C-natural valuations (used in increment-sequence)
  - C-natural cohomology classes
  - C-closed predication-fibrations
minted-from: theorem-context — referenced as a naturality condition by predication-hyperdoctrine, predication-fiber-functor, predication-fibration, increment-sequence, settling-coalgebra-structure, and many theorems (settling-cohomology, transfinite-bounded-regime-realizability, scott-continuous-regime-realizability) with no own archive scrap. Reconstructed from those references.
---

# Predicate-category naturality

The condition that a **per-predicate datum** (a valuation, sheaf section, cell-content, etc., indexed by predicates `p ∈ C`) **respects the predicate-category's reindexing structure**.

A per-predicate datum `d = (d_p)_{p ∈ C}` is **`C`-natural** if for every morphism `f: q → p` in `C`,

$$f^*(d_p) \;=\; d_q.$$

The reindexing `f*` (the predication-fiber-functor's action on `f`) sends `p`'s datum to `q`'s datum; naturality says this is consistent with what the substrate sees at `q` directly.

## Equivalent formulation as a natural transformation

A `C`-natural datum `d` is equivalently a **natural transformation** of the predication-fiber-functor with itself (or with a constant functor, depending on context). Specifically, viewing `d` as a system of values indexed by predicates:

$$d : \mathbf{1} \;\Rightarrow\; F, \qquad d_p \in F(p) = A_p,$$

where `1` is the terminal functor on `C^op` and `F: C^op → DBiLat(L)` is the predication-fiber-functor. Naturality of `d` as a transformation IS the `f*(d_p) = d_q` condition.

## Why naturality matters

`C`-naturality is the **structural compatibility** condition that links predicate-category content to predication-fiber-algebra content. Without it, a per-predicate datum is just a disjoint collection; with it, the datum assembles into a coherent object that the predicate-category's morphism structure organizes.

Substrate uses of `C`-naturality:

| Datum | What `C`-naturality means there |
|---|---|
| Predication-valuation `v` (single moment) | Generally NOT `C`-natural — predicating injects evidence freely. `C`-natural valuations are a sub-collection. |
| Increment-sequence `(u_τ)` | REQUIRED to be `C`-natural — each `u_τ` is `C`-natural by definition (in the increment-sequence $thing's frontmatter). |
| Cohomology class `[α] ∈ H^n` | `C`-natural classes are those preserved by predicate-category reindexings; they are the ones with downstream interpretation. |
| Closure-2-monad's action | `C`-naturality is a hypothesis on the underlying closure-operator family; without it, the 2-monad doesn't commute with reindexings. |
| Sheaf-section data | `C`-natural sections assemble into the sheaf's value at the predicate-axis index; non-`C`-natural sections don't form valid sheaf data. |

## In the closure-rule-system context

A closure-rule-system `S` produces a `C`-natural closure-operator family `cl^S = (cl^S_p)_p` when its rules respect predicate-category structure. Specifically, a rule whose antecedent mentions `(q, ...)` and consequent mentions `(p, ...)` must use `f*` for `f: q → p` to fire coherently — the rule's firing is the `f*`-image of an antecedent-cell-update.

When all rules in `S` are `C`-natural, the generated closure operator `cl^S` is also `C`-natural: it commutes with `f*` for every predicate-category morphism `f`. This is part of why the substrate's standard closure-rule-language enforces `C`-naturality on its closure-operator outputs.

## In the increment-sequence context

The increment-sequence `(u_τ)_{τ<λ}` is required `C`-natural by the substrate's foundational definitions:

$$f^*(u_\tau(p)) \;=\; u_\tau(q) \qquad \text{for every } f: q \to p \text{ in } C, \text{ every } \tau.$$

Without this, the orbit `v_{τ+1}(p) = cl_p(v_τ(p) ∨_k u_{τ+1}(p))` would have inconsistent behavior across predicates — `cl_p` is `C`-natural by construction, but `u_τ` being non-`C`-natural would break the orbit's predicate-category-coherence.

## Position

`transfinite-predication-category/hacking/library/predicate-category/library/predicate-category-naturality/`. Predicating tier — `C`-naturality is a property of per-predicate data, and the data lives at predicating tier. Placed inside `predicate-category/library/` (the category whose morphisms are the reindexings naturality concerns) as a sub-property of predicate-category structure.

## Derivation source

**Minted from theorem context.** Referenced by predication-hyperdoctrine (in its frontmatter realize-list), predication-fiber-functor, predication-fibration, increment-sequence, settling-coalgebra-structure, settling-cohomology, transfinite-bounded-regime-realizability, scott-continuous-regime-realizability, and many other places, with no own archive scrap. Reconstructed from how those things use the property.
