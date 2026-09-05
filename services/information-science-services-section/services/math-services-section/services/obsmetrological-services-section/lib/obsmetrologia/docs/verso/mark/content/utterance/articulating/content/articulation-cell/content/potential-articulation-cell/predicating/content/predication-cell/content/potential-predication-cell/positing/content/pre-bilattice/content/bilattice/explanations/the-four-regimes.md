# The four regimes

The descent has four stages — `articulate → predicate → posit → settle` — and they are not arbitrary
steps. Each is a distinct **regime**, doing a distinct kind of work, and getting them confused is the
classic mistake the archive's older notes make.

## The four verbs, disambiguated

| verb | regime | what it does | measures |
|---|---|---|---|
| **articulate** | aperiodic | witness an utterance into a `{potential}` cell — no semantics | *that a cell exists* |
| **predicate** | transfinite | read object/concept; build the relational cell-set `Φ = E×Π×E` and the value-free fiber; `cohere` closes the specialization | *the relational sites* |
| **posit** | scott | **measure** each cell in the bilattice from its givens (token given → potential) | *the cells' state* |
| **settle** | finite | iterate the modal closure to a fixed point | *the determinacy reached* |

The crucial distinctions:

- **posit is measurement, settle is iteration.** `posit` reads a single value off the givens; `settle`
  runs a closure to convergence. Older files say "settle" for both — but stamping a value (posit) and
  reaching a fixed point (settle) are different acts. ([Measured, not seeded](measured-not-seeded.md).)
- **predicate builds the sites, posit values them.** The cell-set exists before any charge; `predicate`
  makes `Φ`, `posit` is the first morphism to put a charge on it.

```
math:   utterance ─articulate→ cell ─predicate/cohere→ Φ + fiber ─posit→ measured valuation ─settle→ fixed point
code:   settle(posit(predicate(articulate([token, claim]))))
```

## Why "regimes" and not just "steps"

The name is from the **ordinal classification of the closure**: how many iterations the settling takes
to converge measures *how* 2-dimensional the underlying KZ-monad is. The classification has four cases
— strict (finite), scott-continuous (`ω`), transfinite-bounded, aperiodic — and they line up with the
four verbs: the finite `settle` terminates; the aperiodic `articulate`/monad re-seats and *unfolds*
(it can keep going). The two cones at the bottom are dual under this: `settle` is the **initial
algebra** (inductive, terminates), the void cone is the **terminal coalgebra** (coinductive, unfolds —
which is why `precipitate` re-articulates it one fold deeper).

```
code:   settle.mjs — a do/while to a fixed point (terminates) ;  precipitate.mjs — one unfold step of the monad over the void cone
```

## The fold

The bottom of the descent is not the end. The cells the settling leaves open are the void cone, and
that cone is a graph the predication monad re-articulates — `articulate` again, deeper. So the four
regimes form a spiral, not a line: settle, then the residue re-enters at articulate one fold down.
The kernel carries the pieces (the void cone, `precipitate`, `articulate`'s `{apex}` re-entry); the
full fold-tower is downstream.

## See also

- reference: [morphisms](../references/morphisms.md) (the four stages, `precipitate`)
- explanation: [measured, not seeded](measured-not-seeded.md) · [the two cones and the void](the-two-cones-and-the-void.md)
- tutorial: [your first descent](../tutorials/your-first-descent.md)
