---
description: "A bilattice is a set with two lattice orders over the same elements, a truth order and a knowledge order, so that a value can be read two ways at once without either reading collapsing into the other. Belnap and Dunn's four-valued FOUR is the paradigm: the evidence pair (told for, told against) read in both orders."
date-created: 2026-08-21
date-modified: 2026-09-27
---

A **bilattice** is a set carrying two lattice orders over the same elements,
related by an involution that reverses one order and preserves the other
(Ginsberg 1988; Fitting 1994). The paradigm is Belnap and Dunn's FOUR
(Dunn 1976; Belnap 1977): the four values a claim can hold when evidence for
it and evidence against it are recorded separately, as a pair of sides
(told for, told against).

## The four values and their names

Each value is one pattern of the two evidence sides. The house names read
the values in the knowledge order; Belnap's names read them in the truth
order. They are two readings of one structure, and neither replaces the
other.

| Evidence (for, against) | House name, knowledge order | Belnap name, truth order | Symbol |
|---|---|---|---|
| (no, no) | absurd: told neither | neither | $\bot$ |
| (yes, no) | potential: told for | true | $\mathbf{t}$ |
| (no, yes) | active: told against | false | $\mathbf{f}$ |
| (yes, yes) | stable: told both | both | $\top$ |

Obsmetrologia fixes the same assignment: `Reading.kBot` is absurd,
`Reading.tTop` potential, `Reading.tBot` active and `Reading.kTop` stable
([`Language/Positing/Reading.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Language/Positing/Reading.lean)).

## The two orders

The **knowledge order** $\le_k$ measures how much has been told:
$\bot \le_k \{\mathbf{t}, \mathbf{f}\} \le_k \top$, from nothing told at the
bottom to told both ways at the top. The **truth order** $\le_t$ measures
how far the telling leans true: $\mathbf{f} \le_t \{\bot, \top\} \le_t
\mathbf{t}$. Both are lattices, with $\wedge_k, \vee_k$ and $\wedge_t,
\vee_t$ their meets and joins. A value can be high in one order and low in
the other; that independence is what the structure exists to keep.

Two involutions relate the orders. **Negation** $\sim$ exchanges the evidence
sides, swapping $\mathbf{t}$ and $\mathbf{f}$ and fixing $\bot$ and $\top$: it
reverses $\le_t$ and preserves $\le_k$. **Conflation** $-$ swaps $\bot$ and
$\top$ and fixes $\mathbf{t}$ and $\mathbf{f}$: it reverses $\le_k$ and
preserves $\le_t$. They commute, and together they generate the Klein
four-group acting on FOUR (Fitting 1994). In Obsmetrologia negation is not
assumed: measuring a trace at a claim's contradictory is the negation of
measuring it at the claim (`measure_contradictory_negate`).

FOUR is the twist product of the two-element lattice with itself: its values
are pairs, ordered by the first side in the same direction and the second in
the opposite direction for truth, and by both sides in the same direction
for knowledge. Topologically, the four values are the clopen up-sets of a
pairwise Stone space, which is how Obsmetrologia's bitopological settling
site carries them
([`Cohomology/PairwiseStoneClopen.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Cohomology/PairwiseStoneClopen.lean)).

## Beyond bivalence

Classical bivalent logic admits only $\mathbf{t}$ and $\mathbf{f}$. Kleene's
strong three-valued logic adds $\bot$, the value of a claim nothing has
settled. FOUR also admits $\top$. A database told "p" by one informant and
"not p" by another can hold that state as a value, high in the knowledge
order, rather than collapsing it to one classical value or refusing the
input (Belnap 1977). None of the four is a defective version of another.
Each is an extremal position of one joint structure, and the
[settlement](settlement.md) settling reaches can be any of them.

## References

- Belnap, N. D. (1977). A useful four-valued logic. In J. M. Dunn and
  G. Epstein (eds.), *Modern Uses of Multiple-Valued Logic*, 5–37. Reidel.
- Dunn, J. M. (1976). Intuitive semantics for first-degree entailments and
  "coupled trees". *Philosophical Studies* 29, 149–168.
- Fitting, M. (1994). Kleene's three valued logics and their children.
  *Fundamenta Informaticae* 20, 113–131.
- Ginsberg, M. L. (1988). Multivalued logics: a uniform approach to
  reasoning in artificial intelligence. *Computational Intelligence* 4,
  265–316.
