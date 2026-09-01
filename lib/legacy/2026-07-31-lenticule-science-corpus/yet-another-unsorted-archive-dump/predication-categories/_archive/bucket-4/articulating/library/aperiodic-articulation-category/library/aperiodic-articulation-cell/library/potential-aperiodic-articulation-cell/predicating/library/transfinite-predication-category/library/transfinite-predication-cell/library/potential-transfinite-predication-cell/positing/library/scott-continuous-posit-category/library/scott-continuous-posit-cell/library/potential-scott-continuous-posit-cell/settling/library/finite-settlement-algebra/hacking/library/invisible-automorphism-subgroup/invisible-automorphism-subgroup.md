---
name: invisible-automorphism-subgroup
description: "The kernel N(v) of the action of the settlement-morphism automorphism group Aut^≃(v) on the settling-associated-sheaf F_U. Automorphisms φ ∈ N(v) act trivially on every cohomological invariant H^n(T*, F_U) — they are 'invisible' to cohomology. Concretely: cellwise reindexings that permute only among permanently-⊥ cells."
symbol: "N(v)"
depends-on: [settlement, settlement-morphism, settling-associated-sheaf, internal-z2-gauge, aperiodic-classifying-invariant]
derives-from: docs/dev/scraps/invisible-automorphism-subgroup.md
---

# Invisible automorphism subgroup

For a settlement `v` with automorphism group `Aut^≃(v)` (the group of invertible settlement-morphisms `φ: v → v`), the **invisible automorphism subgroup** is the kernel of the action on the settling-associated-sheaf:

$$N(v) \;:=\; \{\, \phi \in \mathrm{Aut}^\simeq(v) \,:\, \phi_* = \mathrm{id}_{\mathcal{F}_U} \,\} \;\trianglelefteq\; \mathrm{Aut}^\simeq(v).$$

Concretely (under the naturality restriction): `φ ∈ N(v)` iff the cellwise reindexing `g: E × E → E × E` induced by `φ` fixes every cell that is designated at some settling stage. Equivalently, `g` permutes only among cells that remain `⊥` throughout the settling.

## Why "invisible"

These automorphisms are **invisible to cohomology**: they act trivially on the settling-associated-sheaf `F_U` and hence trivially on every cohomological invariant `H^n(T*, F_U)`.

In particular, the **aperiodic-classifying-invariant** (an `H^1`-class) is fixed by `N(v)`. So `N(v)` is the "noise" symmetry group of the settlement — large subgroups of `Aut^≃(v)` that don't change ANY cohomological data.

## When `N(v)` is large

For sparsely-designated settlements — typical of the aperiodic regime — `N(v)` can be very large. Examples:

- A settlement whose designated cells form the `ω₁`-diagonal of `E × E` (the transfinite-induction settlement). Then `N(v)` has cardinality up to `|Sym(permanently-⊥ region)|` — the symmetric group on the uncountable off-diagonal region. Enormous group.

- A settlement whose closure-rules only fire on `n`-element finite subsets of `E`. The "permanently-⊥" region is `E ∖ designated`, possibly cofinitely large; `Sym(E ∖ designated)` is the invisible group.

The entire **natural-automorphism structure** of such settlements sits in `N(v)`. The cohomologically-visible quotient `Aut^≃(v) / N(v)` is what carries the classifying invariants.

## Why this lives at articulating tier

The invisible automorphism subgroup is most operationally relevant in the **aperiodic regime** — where settlements have large permanently-`⊥` regions and `N(v)` becomes large. In lower regimes (strict-finite, Scott-continuous), most cells get designated quickly and `N(v)` is small or trivial.

So while the definition makes sense at any regime, the structural significance is at the aperiodic tier — the articulating-tier regime where cohomological invariants become the operational classification (because the orbit doesn't quiesce within countable ordinals, so fixed-point arguments don't extract invariants — only sheaf cohomology does).

The placement `aperiodic-articulation-category/hacking/library/invisible-automorphism-subgroup/` records this: `N(v)` is at the articulating-tier regime as the noise-symmetry that cohomological-classification has to quotient out.

## The classifying-quotient structure

The map

$$\mathrm{Aut}^\simeq(v) \to \mathrm{Aut}(\mathcal{F}_U)$$

(action on the associated sheaf) has kernel `N(v)`. The image is the **cohomologically-visible** automorphism group — what actually permutes cohomology classes.

The aperiodic-classifying-invariant separates MLD-classes of aperiodic settlements iff the visible automorphism group acts faithfully on classes (which is the content of the classification theorem).

## Worked example: the trivial invisible group

For a settlement `v` where every cell of `E × E` is designated at some stage, `Aut^≃(v)` acts faithfully on the sheaf (no automorphism permutes only `⊥`-cells because there are no permanent-`⊥` cells). So `N(v) = {id}` — trivial.

This is the dense-settlement case: cohomological-visibility is total. Such settlements exist in strict-finite regimes for small `E`. They are atypical of the aperiodic regime.

## Worked example: enormous invisible group

For the transfinite-induction settlement (designated cells = `ω₁`-diagonal), the permanently-`⊥` region is `(E × E) ∖ Δ_{ω₁}` — uncountably large. `Sym(permanently-⊥)` is a proper class of automorphisms; restricted to the settlement's automorphism group `Aut^≃(v)`, it gives an enormous `N(v)`.

The visible automorphism group `Aut^≃(v) / N(v)` is the much smaller group acting on the diagonal-cells' sheaf data. The classifying invariant lives in this quotient.

## Position

`aperiodic-articulation-category/hacking/library/invisible-automorphism-subgroup/`. Articulating tier — the aperiodic regime is where the invisible-group concept is operationally significant.

## Derivation source

Adapted from `predication-categories/concepts/invisible-automorphism-subgroup.md`, preserved at `docs/dev/scraps/`.
