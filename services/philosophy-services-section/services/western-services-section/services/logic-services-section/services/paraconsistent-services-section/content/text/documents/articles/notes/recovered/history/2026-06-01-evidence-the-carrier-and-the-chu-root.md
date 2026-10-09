# 2026-06-01 — evidence is the carrier, and the Chu root

A consolidation note, written after studying the bilattice lineage to answer one
question: what is the **evidence** order, on top of truth and knowledge? The answer
reorganizes the bigraded work and names the real prize. Where I quote a file I say
so; where I synthesize I mark it.

## The correction: evidence is not a third order — it is the carrier

I had been building the bigraded diamond as "two orders" and treating the charge
`[positive, negative]` as bare presence. The actual voidmath lineage names it
otherwise. The four-bilattice journal
(`lab/archive/voidmath/.../four-bilattice/docs/dev/journal/2026-05-24.md`) states it
plainly: every value of **FOUR** "is identified with an **evidence pair** (pos, neg)
∈ {0,1}²" — pos = positive evidence (for), neg = negative evidence (against). And
then:

> The two bilattice orders, **both defined componentwise on evidence pairs**:
> knowledge order (both components up), truth order (positive up, negative reversed).

So the structure is: **evidence is the stuff; truth and knowledge are two orders on
the stuff.** "Truth, knowledge, and evidence" is *two orders + the carrier they
order*, not three orders. The bigraded diamond (`voidmath-kernel-next`) is correctly
"two orders on evidence" — ◇_k/□_k and ◇_t/□_t are the knowledge and truth orders of
the *same* evidence pair. Evidence isn't a diamond to bolt on beside them; it's what
both diamonds are diamonds *of*.

## Thin evidence vs thick evidence — core only uses the thin

There are two levels, and voidmath-core lives at the thin one.

- **Thin (bilattice level).** Evidence = presence bits (pos, neg) ∈ {0,1}². This is
  what `predicate`/`posit` order; it is what core's charge actually is. The mark in a
  slot is always the trivial `{const:"m"}` — pure presence, no witness.

- **Thick (witnessed level).** `from-philosophy/evidence.md` defines evidence as a
  triple (e, p, R) and, proof-theoretically, **"evidence for p is a term t : p"**
  (Curry–Howard) — the actual *witness*, with an explicitly open **aggregation join
  ⋁eᵢ** ("whether the join gives the combined evidential support"). voidmath's seat
  for this is already in the schema: `charge.schema.json` says each slot is "empty []
  or singleton [mark]; **the mark is a token**," and `_projecting` already uses the
  mark to record **which act asserted the charge** (`charge: [[act], []]`,
  `act = {$ref: morphism}`). So the witness has a home — core just throws it away by
  always writing `{const:"m"}`. (Synthesis:) the *thick evidence order* is the order
  on *which witness*, and the metacircle's `fold` — which knowledge-joins charges per
  `(e, a)`, "the directed supremum of evidence" — is already a prototype of the
  aggregation join, run on trivial marks.

## The Chu root — why three fields are shadows

The same journal line carries the deepest fact: **"Under Jakl 2025, FOUR ≅ Chu(2,0),
making bilattice-valued predication a model of multiplicative linear logic."** This is
the archive confirming the "predicating forms a Chu space" intuition, and it is the
mechanism behind "category theory, HTT, and algebra as shadows of one structure":
Chu(2) is the universal `*`-autonomous category into which **Top, Pos, Vect, and more
embed fully and faithfully**. (Synthesis, grounded in the citation:) if predication
is a Chu space, then topology, order theory, and linear algebra are not analogies to
it — they are *subcategories* of it, and the MLD-class computed three ways
(cohomology / hyperdoctrine / eigenvalue) is one invariant read off one Chu matrix.
**Evidence is that matrix** — the points×states relation — and truth and knowledge are
two orders read off it. The thin presence-bilattice is `Chu(2,0)`; the thick witnessed
evidence is the general `Chu` structure where the matrix entries are real terms.

## What this does to the library plan

All of this lives in **one** package, `voidmath-kernel-next` (renamed from
`voidmath-bigraded`) — the staging ground for what folds into the kernel. Thick
evidence is *not* a separate `voidmath-evidence` package; it is part of kernel-next,
the same column of kernel-bound work.

- The truth order on evidence is correct and stays: **two orders on evidence** (◇_k/□_k
  from core, ◇_t/□_t new), both ordering the same evidence-pair carrier.
- The unbuilt prize, also in kernel-next, is the **thick-evidence strand**:
  1. **The witnessed mark.** Let the slot carry a real witness term, not `{const:"m"}` —
     the Curry–Howard `t : p`. The schema already permits it (the mark is a token).
  2. **The aggregation join ⋁eᵢ.** Promote `fold`'s per-`(e,a)` knowledge-join into a
     first-class evidence-combination morphism, defined on witnessed charges — the
     thing `evidence.md` lists as open.
  3. **The Chu view.** Present a predication fiber as `Chu(2,0)` explicitly, so the
     embeddings (Top/Pos/Vect) become available as the "shadows" — the on-ramp to
     `voidmath-mld`, where the three computations of the MLD-class are forced equal.

The ordering matters: bigraded gives the two orders, evidence gives the carrier its
real content, and only then does the Chu/MLD unification have something to compute on.
Evidence was the missing word because it is the thing underneath both diamonds — and
underneath the whole "shadows" claim.
