# The bilattice and the four states

Why the value object is a *bilattice* — two orders on four states — and not a single truth-value.

## Predication tracks two things, not one

When you predicate a claim of an object, two independent questions arise: is there reason *for* it,
and is there reason *against* it? A single signed scalar (true/false, or a confidence in `[0,1]`)
collapses these: "no reason for" becomes indistinguishable from "reason against." Keep them apart and
the value is a **pair** `⟨a₊, a₋⟩` — one coordinate per side. That pair is the
[charge's value](../references/the-charge.md).

```
math:  the value lives in L × L (a twist product), not in a single lattice L
code:  charge.value = [a_pos, a_neg]   — two booleans for the L = 2 case
```

For two booleans there are four pairs — the [four states](../references/the-four-states.md):

```
   absurd ⟨0,0⟩   no side          potential ⟨1,0⟩   for, not against
   active ⟨0,1⟩   against, not for active    ⟨1,1⟩   both at once
```

## Two orders, because two things move two ways

The pair carries two orders at once — that is what makes it a *bilattice* (Ginsberg):

- **knowledge** `≤ₖ`: both coordinates rise. More of *either* side is more information. Bottom
  **absurd** (nothing), top **stable** (both).
- **truth** `≤_t`: the positive coordinate rises, the negative *falls*. More for and less against is
  "more true." Bottom **potential**, top **potential**.

```
code:  joinK [a∨c, b∨d]  (both up)        joinT [a∨c, b∧d]  (pos up, neg down)
       meetK [a∧c, b∧d]                   meetT [a∧c, b∨d]
```

That single transposition — `∨/∧` vs `∧/∨` on the negative coordinate — *is* the difference between
the two orders. Everything else (the modal pairs, the cones) is built on these four ops.

## Why "both at once" must be a value

The state **stable** = ⟨1,1⟩ — reason for *and* against, held together without exploding into "anything
follows" — is the whole reason for the bilattice. Classical logic can't represent it; here it is a
first-class state (the paraconsistent ⊤). The kernel keeps it reachable by never discarding evidence
(see [evidence — the carrier](evidence-the-carrier.md)), so two conflicting tellings can coexist as
stable rather than annihilating.

## This is forced, not chosen

Avron's representation theorem: every bounded interlaced bilattice *is* a twist product `L × L`. So
once you commit to two ordered sides that aggregate independently, the coordinate split isn't one
modeling option among many — it's the shape the algebra must take. The kernel's `{value, evidence}`
charge is that twist product made concrete (with `L` the two-bit presence for the value, and witness
sets for the thick evidence).

## See also

- reference: [the four states](../references/the-four-states.md) · [the charge](../references/the-charge.md)
- explanation: [evidence — the carrier](evidence-the-carrier.md) · [knowledge and truth are σ-dual](knowledge-and-truth-are-sigma-dual.md)
