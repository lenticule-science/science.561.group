# Literal faithfulness — the root dictionary

## What this is

A companion to [moving-toward-faithfulness](2026-06-22-moving-toward-faithfulness.md).
That note is about one faithfulness axis: **claim vs proof** — a grand name over a trivial proof.
This note is about the orthogonal axis: **literal vs derived object** — a bare `0`, `1`, `2`, `3`, `Nat`, or `Bool` standing in for something the descent has already generated and named.

It is the same disease wearing different clothes.
`#print axioms` catches free data smuggled as `axiom`/`opaque`/`sorry`; it is blind to a numeral that *computes correctly* but is semantically free — a literal occupying a slot that a derived object was meant to fill.
A literal asserts nothing about the role it plays.
So of every literal the pass asks one question:

> **What upstream object is this the degenerate projection of?**

If there is a real answer, the bare literal is an unfaithful encoding: the prose names a charge / bound / seed / identity, while the Lean has demoted it to arithmetic that happens to work out.
If there is *no* upstream object — the literal is genuinely the first place this quantity is generated — then it is honest, and that fact is itself worth recording.

## The method: descend, don't audit

The question is definitionally **derivation-ordered**: a literal is free exactly when nothing earlier in the spine has claimed its slot.
So you cannot rule on a literal in `Cohomology/` until the root has actually produced the objects it might be projecting.
A flat upfront census of all ~516 literals would assign verdicts it cannot justify.

Instead: walk `RelMath.lean`'s import spine top-to-bottom.
The first ten modules **are** the vocabulary root — they generate the canonical 0/1/⊥/⊤/seed/identity objects.
Going outward, each downstream literal is checked against this dictionary; the unresolved ones are the **residue**, which is the frontier (either honest-ℕ, or an obstruction naming an upstream object that does not exist yet).
The enumerated list is the *output* of the sweep, never its input.

## The root dictionary (the canonical objects a literal could be projecting)

Every entry below is a *named, derived* object from the first ten imports.
A downstream literal that plays one of these roles should cite the name, not the numeral.

| Role a literal might play | The real derived object | Home |
|---|---|---|
| the only primitive datum | `Mark` (atomic surface) | `Mark.lean` |
| a two-sided position / token-vs-claim | `Kind` = {`token`, `claim`} | `Mark.lean` |
| **any finite count / step / stage / degree** | **our ℕ** = the finite fragment of `Ord` (`Ord.ofNat`, the `isFinite` successor-towers) — *not* Lean core `Nat`. Number is a **settling-stage** object ("order is reached only by settling"), so our ℕ is generated at settling, not the root. | `Closure/Ordinal.lean` (settling-stage; must precede `ClosureOrdinal`) |
| a transfinite / limit stage index | `Ord` (`limit` of a fundamental sequence); `omega` = ω | `Closure/Ordinal.lean` |
| **the `0` stage** (no applications yet) | `Ord.zero` / the `utter` floor / the **seed** | `Ordinal.lean`, `Articulating.lean`, `Settling.lean` |
| a successor `n+1` | `Ord.succ` | `Ordinal.lean` |
| the value/charge carrier | `Charge` ≔ `Corner` = {⊥ₖ, t, f, ⊤ₖ} | `Positing.lean` |
| **knowledge-bottom ⊥ₖ** (the seed positing deposits, identity of ∨ₖ, ≤ₖ-least) | `Charge.kBot` | `Positing.lean` |
| **knowledge-top ⊤ₖ** (identity of ∧ₖ, ≤ₖ-greatest, held contradiction) | `Charge.kTop` | `Positing.lean` |
| **truth-top t** (identity of ∧ₜ, ≤ₜ-greatest) | `Charge.tTop` | `Positing.lean` / `TruthOrder.lean` |
| **truth-bottom f** (identity of ∨ₜ, ≤ₜ-least) | `Charge.tBot` | `Positing.lean` / `TruthOrder.lean` |
| a per-cell ⊥ₖ assignment / the seed valuation | `Valuation.knowledgeLeast` | `Positing.lean` |
| a `Bool` evidence slot (for/against) | `Charge.pos` / `Charge.neg` over `Bool` | `Positing.lean` |
| the seed→fixpoint dynamic | `Charge.settle c seed` (= `c.op seed`) | `Settling.lean` |
| a "row 0 vs row 1" designation (truth-sheaf vs inconsistency-sheaf) | a two-element subtype of `Charge`, **`{tTop, kTop}`** — *not* `Nat` | (downstream; should reference `Positing`) |
| a `ℤ/2` gauge / sign flip | the K₄ generators `negate` (~), `conflate` (−) | `Four.lean` |
| the finite-regime settling bound `3` | the **height of the FOUR lattice** (`kchain_height`: no 4-distinct ≤ₖ-chain) | `ClosureOrdinal.lean` |

## Our ℕ is ordinal (the deepest cut)

There is no free pass for "it's just a count."
The corpus generates its **own** number, and it is **ordinal**: `Ord` = `zero | succ | limit(fundamentalSequence)` (Brouwer / tree ordinal, `Closure/Ordinal.lean`), reached *under settling* because order — and the well-orders that are ordinals — is what settling produces.
Its **finite fragment** (the `isFinite` successor-towers, `Ord.ofNat n`) **is our ℕ**.
Lean core `Nat` is therefore a received-math projection like any other: a finite count is faithful only as a finite `Ord`, not as a `Nat` borrowed from the metatheory.

Two seams bound the "when we can":

1. **`Ord` is imported at line 145, after the settling-stage modules that need it** (`ClosureOrdinal`, line 57).
  Both are settling-stage, so this is an intra-settling ordering defect: our ℕ (`Ord`/`Natural`) must simply precede `ClosureOrdinal`, not be lifted to the root — number is *not* a root object.
  Separately, `Articulating.depth` speaks `Nat` at the **articulating stage, before number is generated at settling**: a count existing before counting is derived.
  That is not import-order — it is a genuine anomaly (depth is either a non-numeric structural position, or a forward-reference projection of settling's ℕ).
  Flag it; do not quietly let it pass as "our ℕ".
2. **`Ord` itself rests on `Nat`** at the limit-index (`limit : (Nat → Ord) → Ord`, `ofNat : Nat → Ord`).
  This is the genuine frontier: the standing place where Lean `Nat` survives.
  "Use our ℕ when we can" = our ℕ for every *finite* count; `Nat` only as the not-yet-internalized fundamental-sequence index, named as a red node.

## Verdict vocabulary (what each literal gets tagged)

- **our-ℕ** — a finite count that should be (or already is) a finite `Ord` / derived `Natural`.
  If it is currently Lean `Nat`, that is a *demotion target*, not a pass: route it through our ℕ where our ℕ is in scope.
- **demoted-object** — a charge / bound / seed / identity / designation written as a numeral.
  Replace with the named object from the dictionary.
- **derived-constant** — a literal forced by an upstream quantity but written as a magic number (canonical case: `3` = FOUR's lattice height).
  Surface the upstream quantity and instantiate the literal as its value (e.g. `Ord.ofNat (Corner.all.length - 1)`).
- **frontier** — a literal whose upstream object *should* exist but does not yet (canonical case: the limit-stage `Nat` index inside `Ord` itself).
  Becomes a blueprint red node, not a silent numeral.

## Where the sweep starts

The root six (`Mark → Articulating → Predicating → Positing → Settling → TruthOrder → Four`) are clean of charge-literals: they work over `kBot`/`kTop`/`tTop`/`tBot`, not raw numerals.
But they are **not** clean of the ℕ projection: `Articulating.depth : Articulating → Nat` already speaks Lean `Nat` where it should speak our ℕ (finite `Ord`) — the root count is the first demotion target, blocked only by `Ord` being imported downstream of it.

`Predicating`, `Hyperdoctrine`, `Quantifying` carry only `.
1`/`.
2` projections (not value literals).
The first module with a value literal in import order is **`Closure/ClosureOrdinal.lean`**: its `iter` index and `0`/`n+1` are **our-ℕ** demotion targets (Lean `Nat` standing in for finite `Ord`: `0 = Ord.zero`, `n+1 = Ord.succ`), and its settling bound `3`/`4` is a **derived-constant** that should read `Ord.ofNat (Corner.all.length - 1)` — FOUR's lattice height as a finite ordinal, which `kchain_height` already proves.
The calibration is settled at **maximal**: surface the law and type the literal to its source.

## The structural prerequisite the first module exposes

The fixes need our ℕ in scope *at the settling stage* (not the root — number is a settling object).
`Ord` already lives at settling; it is merely imported (line 145) after the settling-stage modules that consume counts (`ClosureOrdinal`, line 57).
So the genuine first task is to **order `Ord`/`Natural` before `ClosureOrdinal`** and value `iter` / κ in it — an intra-settling reorder, not a root lift.
`Articulating.depth`'s pre-settling `Nat` is a *separate* frontier flag (a count before counting is generated), not part of this reorder.
The limit-stage `Nat` index inside `Ord` is the remaining `Nat` — see below.

## We already have the transfinite — the corpus states it; the Lean proved only its projection

This is not a hypothesis once you read the node.
The corpus's `closure-ordinal.md` states the bound at **full transfinite strength**:

> κ ≤ |**PrFib**|⁺ — the successor cardinal of the 2-category's object class; and if no such ordinal exists in the ambient universe, κ = ∞.

The Lean `ClosureOrdinal` proved only the **finite projection** κ ≤ 3, because over FOUR the object class is finite (4 charges → height 3).
The transfinite ordinal bound is not missing from the project — it is written in the source, and the Lean simply never rose to it.
So the faithful `settles_by_three` is the κ ≤ |object-class|⁺ law *instantiated at the finite class*; the bare `3` was the finite case of a transfinite theorem we already hold.
Surfacing it (state κ ≤ successor-cardinal-of-object-class; FOUR's `3` as the instantiation) is the maximal-bar fix, and it *is* the act of proving a transfinite number we already had.

The "standing frontier" (the limit-index `Nat`) is the same story one level down, and likely **already closed** — we simply have never been forced to prove it.
`Ord` already carries the transfinite in full: `omega`, `omegaShift`, arbitrary `limit`, and `limit_isLUB` (the limit genuinely *is* the supremum of its fundamental sequence).
The only residue of Lean `Nat` is the index type of that fundamental sequence, `limit : (Nat → Ord) → Ord`.

The faithfulness pass turns that residue into a question it can answer: once our ℕ is `Natural := {o : Ord // isFinite o}` (the finite fragment), can `Ord` index its own limits by `Natural` rather than by Lean `Nat`?
If yes — and the sequences already in the library (`ofNat`, `omega`'s) are finite-ordinal in substance, so they should re-type without loss — then `Ord` is **self-indexing**, Lean `Nat` is redundant throughout, and the transfinite number system was complete from the start.
We would not be *building* transfinite numbers; we would be *proving* the ones we already wrote suffice.
That is the shape to watch for: where a `Nat` resists demotion to a finite `Ord`, it is not a missing number — it is a transfinite one we already possess and had not yet had occasion to name.

This is a **red blueprint node**, not a claim: `Ord` self-indexing (`limit` reindexed by `Natural`), with Lean `Nat` recovered as `Ord.ofNat`'s image.
Filling it is how the pass would discharge its own deepest frontier.
