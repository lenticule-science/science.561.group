import Obsmetrologia.Language.Positing.Morphism

/-!
# Positing.Batch — finite batches of posits, order-independently

`Morphism.lean` proved that two posits commute (`posit_comm`, unconditional)
and that two posits at the *same* cell merge by joining their charges
(`posit_posit_same`), but left open — by its own docstring — "the finite-batch
induction itself". This module carries that induction out: `positList` folds a
finite list of `(PredicationCell, Charge)` posit-instructions into a valuation, and the
whole apparatus of finite-batch algebra Morphism.lean promised follows:
**order-independence** (a `List.Perm` invariance theorem, proved by structural
induction on the permutation witness), a closed form as a single knowledge-join
against a summed delta, and the inflationary/monotone/idempotent lifts of the
single-posit laws.

Everything here is stated **pointwise** (`∀ ψ, … ψ = … ψ`), exactly as
`Morphism.lean` was: no `funext`, no `Quot.sound`. Where a helper needs to carry
a "valuations agree everywhere" hypothesis (the permutation-invariance swap
case), that hypothesis is itself stated pointwise (`∀ χ, v χ = w χ`), never as
a `Valuation` equality — so no funext is smuggled in through a lemma's premise
either.

## What is derived

* `positList` — batch positing: `List.foldl (fun acc w => posit w.1 w.2 acc) v
  ws`, one posit-instruction per list entry, applied left to right.
* `positList_nil` / `positList_cons` — the two computation rules (both hold
  definitionally; stated as named pointwise lemmas for `rw`-ability).
* `positList_perm` — **order-independence**: if `ws` and `ws'` are
  permutations of each other, they posit to the same result. Proved by
  induction on the `List.Perm` witness: `nil` trivial, `cons` a congruence
  (`positList_congr`), `swap` exactly `posit_comm` pushed through the tail via
  `positList_congr`, `trans` composed. This is the CRDT-style merge property —
  a batch of posits is a *set* of instructions, not a sequence, as far as its
  outcome is concerned.
* `positList_append` — batches concatenate: positing `as ++ bs` is positing
  `as` then folding `bs` into the result, from `List.foldl_append`.
* `deltaSum` — the knowledge-join of the point-mass deltas of every
  instruction in `ws`, evaluated at one claim point.
* `deltaSum_cons` — the computation rule for `deltaSum`, via the generic
  fold-shift lemma `foldl_joinK_shift`.
* `positList_eq_joinK_deltaSum` — **the batch as a single join**:
  `positList ws v ψ = v ψ ∨ₖ deltaSum ws ψ`. This is the closed form
  underneath order-independence: a batch is, semantically, just one big join,
  and joins do not care about the order their arguments were listed in.
* `positList_inflationary` — a batch never retracts knowledge, read straight
  off `positList_eq_joinK_deltaSum` and `Charge.leK_joinK_left`.
* `positList_monotone` — batching is monotone in the starting valuation,
  by induction using `posit_monotone` at each step.
* `positList_idem` — **batch idempotence**: applying the same batch twice is
  the same as applying it once — `deltaSum ws ψ ∨ₖ deltaSum ws ψ` collapses by
  `Charge.joinK_idem`, regardless of whether `ws` repeats a cell internally.

## Design compromises

`positList_congr` is a private structural-congruence lemma (if two valuations
agree at every claim point, folding the same batch into each gives results
agreeing at every claim point) needed to push `posit_comm` — a *single*-cell
pointwise fact — through an arbitrary tail of further posits in the `swap`
case of `positList_perm`. It is not a general `Valuation` extensionality
principle: its hypothesis and conclusion are both bare `∀ χ, _ = _` statements,
never packaged as `Eq` of functions, so it needs no `funext`.

`foldl_joinK_shift` is a private, list/charge-generic helper (accumulator-shift
for a `joinK`-accumulating `foldl`) abstracted out of `deltaSum_cons`'s proof;
it is not part of the public batch API, just the associativity bookkeeping
`deltaSum`'s cons-computation rule needs.
-/

namespace Obsmetrologia
namespace Valuation

/-! ## Batch positing -/

/-- **Batch positing**: fold a list of `(claim, charge)` posit-instructions
into a valuation, left to right. -/
def positList (ws : List (PredicationCell × Charge)) (v : Valuation) : Valuation :=
  ws.foldl (fun acc w => posit w.1 w.2 acc) v

/-- Positing the empty batch is the identity. -/
theorem positList_nil (v : Valuation) (ψ : PredicationCell) : positList [] v ψ = v ψ := rfl

/-- Positing `w :: ws` posits `w` first, then folds the rest into the result. -/
theorem positList_cons (w : PredicationCell × Charge) (ws : List (PredicationCell × Charge)) (v : Valuation)
    (ψ : PredicationCell) : positList (w :: ws) v ψ = positList ws (posit w.1 w.2 v) ψ := rfl

/-- If two valuations agree at **every** claim point, folding the same batch
into each gives results agreeing at every claim point. The hypothesis and
conclusion are both bare pointwise statements — no `Valuation` equality, no
`funext`. A private structural-congruence helper for `positList_perm`. -/
private theorem positList_congr (ws : List (PredicationCell × Charge)) {v w : Valuation}
    (h : ∀ χ, v χ = w χ) (ψ : PredicationCell) : positList ws v ψ = positList ws w ψ := by
  induction ws generalizing v w with
  | nil => exact h ψ
  | cons a t ih =>
    rw [positList_cons, positList_cons]
    exact ih (fun χ => by unfold posit; rw [h χ])

/-! ## Order-independence — the CRDT-style merge property -/

/-- **Order-independence**: permuted batches posit to the same result, at
every claim point. Structural induction on the `List.Perm` witness: `nil` is
trivial, `cons` is `positList_congr`-congruence over the recursive
permutation, `swap` is `posit_comm` pushed through the shared tail, `trans`
composes. This is the algebraic fact a CRDT-style merge relies on — a batch of
posits behaves as a *set* of instructions. -/
theorem positList_perm {ws ws' : List (PredicationCell × Charge)} (h : List.Perm ws ws')
    (v : Valuation) (ψ : PredicationCell) : positList ws v ψ = positList ws' v ψ := by
  induction h generalizing v with
  | nil => rfl
  | cons a _ ih =>
    rw [positList_cons, positList_cons]
    exact ih (posit a.1 a.2 v)
  | swap x y l =>
    rw [positList_cons, positList_cons, positList_cons, positList_cons]
    exact positList_congr l (fun χ => posit_comm y.1 x.1 y.2 x.2 v χ) ψ
  | trans _ _ ih1 ih2 => exact (ih1 v).trans (ih2 v)

/-- Batches concatenate: positing `as ++ bs` is positing `as`, then folding
`bs` into the result — from `List.foldl_append`. -/
theorem positList_append (as bs : List (PredicationCell × Charge)) (v : Valuation) (ψ : PredicationCell) :
    positList (as ++ bs) v ψ = positList bs (positList as v) ψ := by
  unfold positList
  rw [List.foldl_append]

/-! ## The batch as a single join -/

/-- The knowledge-join of the point-mass deltas of every instruction in `ws`,
evaluated at one claim point. -/
def deltaSum (ws : List (PredicationCell × Charge)) (ψ : PredicationCell) : Charge :=
  ws.foldl (fun acc w => Charge.joinK acc (Valuation.delta w.1 w.2 ψ)) Charge.kBot

/-- Generic accumulator-shift for a `joinK`-accumulating `foldl`: starting the
fold from `x` instead of `kBot` just joins `x` in at the end. Pure
associativity/commutativity/unit bookkeeping on `Charge`, abstracted out of
`deltaSum`'s cons-rule proof; not part of the public batch API. -/
private theorem foldl_joinK_shift {α : Type} (g : α → Charge) (l : List α) (x : Charge) :
    l.foldl (fun acc a => Charge.joinK acc (g a)) x
      = Charge.joinK x (l.foldl (fun acc a => Charge.joinK acc (g a)) Charge.kBot) := by
  induction l generalizing x with
  | nil => rw [List.foldl_nil, List.foldl_nil, Charge.joinK_comm, Charge.joinK_kBot]
  | cons a t ih =>
    simp only [List.foldl_cons, Charge.joinK_kBot]
    rw [ih (Charge.joinK x (g a)), ih (g a), Charge.joinK_assoc]

/-- `deltaSum`'s computation rule on `w :: ws`: the head's delta joins in with
the tail's sum. -/
theorem deltaSum_cons (w : PredicationCell × Charge) (ws : List (PredicationCell × Charge)) (ψ : PredicationCell) :
    deltaSum (w :: ws) ψ
      = Charge.joinK (Valuation.delta w.1 w.2 ψ) (deltaSum ws ψ) := by
  unfold deltaSum
  rw [List.foldl_cons, Charge.joinK_kBot]
  exact foldl_joinK_shift (fun w' => Valuation.delta w'.1 w'.2 ψ) ws (Valuation.delta w.1 w.2 ψ)

/-- **The batch as a single join**: positing a whole batch is the same as
joining, once, the starting charge with the knowledge-sum of every
instruction's delta. The closed form underneath order-independence — a batch
is semantically just one big join. -/
theorem positList_eq_joinK_deltaSum (ws : List (PredicationCell × Charge)) (v : Valuation) (ψ : PredicationCell) :
    positList ws v ψ = Charge.joinK (v ψ) (deltaSum ws ψ) := by
  induction ws generalizing v with
  | nil =>
    rw [positList_nil]
    show v ψ = Charge.joinK (v ψ) (deltaSum [] ψ)
    unfold deltaSum
    rw [List.foldl_nil, Charge.joinK_comm, Charge.joinK_kBot]
  | cons w t ih =>
    rw [positList_cons, ih (posit w.1 w.2 v), deltaSum_cons]
    show Charge.joinK (posit w.1 w.2 v ψ) (deltaSum t ψ)
        = Charge.joinK (v ψ) (Charge.joinK (Valuation.delta w.1 w.2 ψ) (deltaSum t ψ))
    unfold posit
    rw [Charge.joinK_assoc]

/-! ## Inflationary, monotone, idempotent lifts -/

/-- A batch never retracts knowledge already held. -/
theorem positList_inflationary (ws : List (PredicationCell × Charge)) (v : Valuation) (ψ : PredicationCell) :
    Charge.leK (v ψ) (positList ws v ψ) = true := by
  rw [positList_eq_joinK_deltaSum]
  exact Charge.leK_joinK_left (v ψ) (deltaSum ws ψ)

/-- Batching is monotone in the starting valuation. -/
theorem positList_monotone (ws : List (PredicationCell × Charge)) {v w : Valuation}
    (h : Valuation.leK v w) (ψ : PredicationCell) :
    Charge.leK (positList ws v ψ) (positList ws w ψ) = true := by
  induction ws generalizing v w with
  | nil =>
    rw [positList_nil, positList_nil]
    exact h ψ
  | cons a t ih =>
    rw [positList_cons, positList_cons]
    exact ih (fun χ => posit_monotone a.1 a.2 v w h χ)

/-- **Batch idempotence**: applying the same batch twice is the same as
applying it once — from `positList_eq_joinK_deltaSum` and `Charge.joinK_idem`,
regardless of whether `ws` repeats a cell internally. -/
theorem positList_idem (ws : List (PredicationCell × Charge)) (v : Valuation) (ψ : PredicationCell) :
    positList ws (positList ws v) ψ = positList ws v ψ := by
  rw [positList_eq_joinK_deltaSum, positList_eq_joinK_deltaSum, Charge.joinK_assoc,
    Charge.joinK_idem]

end Valuation
end Obsmetrologia
