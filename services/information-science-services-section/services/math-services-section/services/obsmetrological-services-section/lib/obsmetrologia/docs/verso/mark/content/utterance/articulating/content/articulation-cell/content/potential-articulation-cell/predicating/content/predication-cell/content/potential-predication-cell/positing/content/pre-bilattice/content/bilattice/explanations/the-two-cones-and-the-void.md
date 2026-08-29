# The two cones and the void

Each order brackets a measured cell between two fixed points — a **unit** cone (least) and a **counit**
cone (greatest) — and the slack between them *is* the void cone. This is where the kernel's
"lifting" structure lives.

## An adjunction has two fixed points

Each order carries an adjoint pair of modalities, possibility ⊣ necessity (`◇ ⊣ □`). A monotone
closure built from them has, by Knaster–Tarski, a **least** fixed point (reached from below) and a
**greatest** (reached from above). Those are the two cones:

| | knowledge order | truth order |
|---|---|---|
| **unit** — least fixed point (LFP) | `settle` → the sheaf | `adjudicate` → the verdict |
| **counit** — greatest fixed point (GFP) | `brim` → the cone | `presume` → the presumption |

```
math:  settle = lfp(◇ₖ∘□ₖ) from the measured carrier ;  brim = the gfp, raising the free bits
code:  settle.mjs iterates possibilize∘necessitate to a fixed point ;  brim.mjs re-seats the free bits to the top, then iterates
```

## The cones bracket the *free* bits

A measured cell has some bits **given** (witnessed) and some **free** (no witness). The token-given
knowledge bit is fixed; the claim's activity is free. The two cones differ only on the free bits:

- `settle` (LFP) leaves the free bits **low** → a bare cell stays **potential** `[T,F]`.
- `brim` (GFP) raises the free bits **high** → the same cell brims to **stable** `[T,T]`.

So a bare cell is bracketed `potential ↑ stable`: the token is settled, the claim's activity is open.
That openness is the slack.

```
code:  settle(cat) → potential ;  brim(cat) → stable ;  and always  settle ≤ₖ brim  (a checked law)
```

This is why the cones are **evidence**-driven, not gauge-driven: knowing which bits are free is
*evidence* information (which sides have witnesses), and the value-level Klein gauge can't see it.
`conflate(potential) = potential`, so a "conflate-dual" cone would collapse — the cones must read the
witnesses. (See [knowledge and truth are σ-dual](knowledge-and-truth-are-sigma-dual.md) for where the
gauge *does* act.)

## The void is the slack

`gap` reads two cone-sections against each other and keeps the cells where they **disagree** — the
cells the closure pins from neither side. `vanish = gap(settle, brim)` is the knowledge void cone:

```
math:  void = { cells : LFP(cell) ≠ GFP(cell) }   — under-determination, the bracket's width
code:  gap.mjs compares value cellwise, carrying the full [least, greatest] evidence interval ;  vanish = gap(settle, brim)
```

A bare descent is entirely void on the activity bit (every cell is `potential↑stable`). A cell pinned
both ways — say a reconciled conflict that settles **and** brims to absurd — is **not** void: the cones
agree, so there is no slack. That distinction is the point of using two cones instead of reading the
LFP alone.

## Two voids, bridged by the gauge

There is a *second* void: the **over**-determined cells — `stable`/⊤, "told both", the inconsistency
locus that [`compare`](../references/morphisms.md) splits off as the paraconsistent part. `conflate`
swaps absurd↔stable, so it is exactly the bridge between the under-determined void (`vanish`) and the
over-determined one (`compare`'s `F^(⊤)`). That bridge is where the cohomology attaches and is the kernel's
next open thread (see `TODO.md`).

## See also

- reference: [morphisms](../references/morphisms.md) (`settle`, `brim`, `adjudicate`, `presume`, `gap`, `vanish`, `compare`)
- explanation: [measured, not seeded](measured-not-seeded.md) · [one adjunction, three faces](one-adjunction-three-faces.md)
- tutorial: [the two cones by hand](../tutorials/the-two-cones-by-hand.md)
