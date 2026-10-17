# Evidence — the carrier

The two orders don't float free; they order a *carrier*. That carrier is **evidence** — and the
kernel keeps it **lossless**.

## Evidence is the stuff; the orders order it

"Knowledge" and "truth" are not two substances — they are two *orders* on one thing. The one thing is
the evidence pair `⟨a₊, a₋⟩`: positive evidence and negative evidence, tracked separately. Knowledge
and truth are two ways of reading that pair. Evidence is the carrier; the orders are readings.

The role of evidence has three demands, and the carrier must meet all three:

- **independence** — the two sides are separately representable ("no evidence for" ≠ "evidence
  against"). *Code:* the value is a pair, never a single bit.
- **compatibility** — both can hold at once, licensing **stable**/⊤ as a *state* rather than an
  explosion. *Code:* `[true, true]` is a legal value.
- **transverse aggregation** — receiving more positive evidence raises the positive side and leaves
  the negative untouched, and vice versa. *Code:* every op unions the two sides **separately**.

## Lossless: the carrier only grows

The thin reading (presence: is a side asserted?) lives in `value`. The thick content — *which*
witnesses — lives in `evidence`, and it is **never discarded**:

```
math:  the carrier is a join-semilattice — combining evidence is union, which only adds
code:  every value-op calls _union(a, b) on each side: concat, dedup. Nothing is ever removed.
```

This is forced, not stylistic. A meet/join must be commutative; the old "keep one witness" join
(`present(a) ? a : b`) is *not* commutative on distinct witnesses, so it was only ever definable on the
presence quotient. To carry witnesses *and* stay a lattice op, combining must be symmetric — i.e.
accumulate. And **stable**/⊤ ("told both") is only reachable if a positive and a negative witness can
be held at once; any discarding op can't get there. So losslessness is what makes the fourth state
real. *(`join-knowledge.mjs`, `_union.mjs`; the law tests check accumulation.)*

## Value can outrun evidence — but only as a presumption

Usually `value` agrees with evidence-presence (a side is asserted iff witnessed). The one sanctioned
exception is a **presumption**: `conflate` and the GFP cones (`brim`, `presume`) may set a value bit
`true` with *empty* evidence — the lattice top reached without a telling. That's how a cone raises a
free bit (the cell *could* be stable, on no evidence yet). The split into two fields (`value` /
`evidence`) exists precisely so a presumption needn't fabricate a witness.

## Why "evidence" and not "truth value"

A truth value answers "is it true?"; evidence answers "what have we been told, for and against?" The
verdict (truth) and the determinacy (knowledge) are *derived* by reading the evidence two ways — they
are not stored. Calling the carrier "evidence" keeps that straight: the carrier is the data, the
orders are its adjudications.

## See also

- reference: [the charge](../references/the-charge.md) · [the laws](../references/the-laws.md)
- explanation: [the bilattice and the four states](the-bilattice-and-four-states.md) · [the two cones and the void](the-two-cones-and-the-void.md)
