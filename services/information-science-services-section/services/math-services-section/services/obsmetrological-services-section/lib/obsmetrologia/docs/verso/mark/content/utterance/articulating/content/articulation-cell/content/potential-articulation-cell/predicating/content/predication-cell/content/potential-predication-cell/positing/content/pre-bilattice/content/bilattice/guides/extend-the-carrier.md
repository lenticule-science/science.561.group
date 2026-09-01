# Guide: extend the carrier

The kernel ships the **two-bit** case: each side of a charge is present or absent, witnessed or not.
The bilattice generalizes to richer evidence-grades, and the kernel is shaped so the generalization is
a change of *what a side holds*, not of the algebra. Here's how to think about extending it, and what
stays fixed.

## The generalization

A charge's value is `⟨a₊, a₋⟩ ∈ L × L` (a twist product). The kernel uses `L = 2` (a boolean per side)
for the `value`, and a *set of witnesses* per side for the `evidence`. To extend:

- **richer `L`** — let a side carry a degree from any bounded distributive lattice (e.g. `[0,1]` for
  fuzzy evidence, or a lattice of sources). The four states become the corners of `L × L`; the value
  ops become the lattice ops of `L` applied componentwise.
- the orders are unchanged in *form*: knowledge raises both `L`-coordinates, truth raises the positive
  and lowers the negative.

```
two-bit (shipped):   value side ∈ {false, true}      ;  op = ∨ / ∧
graded (extension):  value side ∈ L (a lattice)       ;  op = ⊔_L / ⊓_L  componentwise
```

## What stays invariant

By Avron's theorem, **any** bounded interlaced bilattice is a twist product `L × L`, so the structure
you'd be extending into is the *same* structure with a bigger `L`. That means:

- the two orders, the σ-duality, the Klein gauge — **unchanged** (they're properties of the twist
  product, not of `L = 2`);
- the lossless carrier — **unchanged** (accumulation is `L`-join; `_union` becomes the `L`-join);
- "measured, not seeded" and the cones — **unchanged** in shape (the free/given distinction is still
  read off evidence).

## What a concrete extension touches

If you implement a graded `L`:

1. the value ops (`join-knowledge`, …) compute `L`'s `⊔/⊓` componentwise instead of `∨/∧`;
2. `_union` (evidence accumulation) becomes the `L`-join;
3. `present`/`is-top`/the gauge read `L`-extremes instead of booleans;
4. the [laws](../references/the-laws.md) are *the same laws* (now over `L`), so the test suite's
   property checks port directly — only `rand()` changes (sample from `L`).

## Caveat

This is a *design* note: the shipped kernel is the two-bit case, and the graded extension is not
implemented. The point is that the kernel's seams (one carrier, value-ops componentwise, lossless
accumulation) are placed so the extension is local, not a rewrite.

## See also

- explanation: [the bilattice and the four states](../explanations/the-bilattice-and-four-states.md) · [evidence — the carrier](../explanations/evidence-the-carrier.md)
- reference: [the charge](../references/the-charge.md)
