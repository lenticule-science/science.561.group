import Obsmetrologia.Closure.Monad
import Obsmetrologia.Closure.Modal

/-!
# Closure-operator fiber — settling's 1-categorical operational engine

`ClosureMonad` derived the *2-categorical reduction of the closure-2-monad (KZ /
lax-idempotence). This module derives the **fiberwise closure-operator family** the
closure-2-monad iterates — its **1-categorical operational engine** — and the
four structural laws the corpus's `closure-2-monad` node names for it:

> A `C`-natural closure-operator family `cl = (cl_q)_{q∈C}`, monotone (2-functoriality),
> inflationary (unit `η`), idempotent/lax-idempotent (`μ ⊣ η_Cl`), and `C`-natural
> (`Cl` commutes with reindexing along predicate-category morphisms).

We lift `Settling.Closure` (a closure on `Charge`) **pointwise** to a closure on
`Valuation = Claim → Charge` — the fiberwise family `(cl_q)` with one and
the same charge-closure in every fiber (the *pointwise-charge* closure, where the
fully-general per-fiber proofs are heavy). On that family we prove, faithful to the
corpus:

1. **`no_periodic_orbits`** (`closure-2-monad`'s *no non-trivial periodic orbits*) —
   lifted to the valuation level from `Charge.no_periodic_orbits`: `iter cl k v = v`
   with `k ≥ 1` forces `cl v = v`. Only period 1 (the orbit ascends, cannot cycle).
2. **`c_natural`** (`closure-2-monad` axiom 4, *`C`-natural*) — the closure commutes
   with reindexing along a base map: `cl (reindex f w) = reindex f (cl w)`. We state
   the **C-natural square** as `CNaturalFamily` (a closure family + the commuting
   square as a field) and prove it holds for the pointwise-charge closure, where the
   square commutes definitionally (reindex is precomposition, the fiber closure is
   the same map in every fiber).
3. **`closure_merge`** (`closure-2-monad`'s settling-step *saturate-then-merge =
   merge-then-saturate-under-closure*) — `cl (joinK (cl X) Y) = cl (joinK X Y)`,
   proven for the pointwise idempotent closure (at the charge level first, then
   lifted). This is the identity that lets the settling step `F_U = Cl ∨ₖ u`
   re-saturate without redoing earlier merges.
4. **`lfp_is_settled`** (the `cosettling` / Knaster–Tarski tie) — the least fixed
   point of `cl` above a seed **is** the settled valuation: `cl seed` is a fixed
   point and the least fixed point above the seed, identifying `Valuation.settle`
   with `ModalFrame.settle` and `Charge.settle`. The `ClosureOrdinal` bound `κ ≤ 3`
   then makes the lfp reachable by finite iteration.
-/

namespace Obsmetrologia
namespace Valuation

open Charge

/-! ## The pointwise lift of a charge-closure to a valuation-closure

The fiberwise closure-operator family `(cl_q)` carrying one charge-closure in every
fiber. This is the *pointwise-charge* closure: `cl v = fun φ => c.op (v φ)`. -/

/-- Apply a charge-map to a valuation fiberwise — the pointwise closure-operator
family `(cl_q)_{q}` with the *same* charge map `c.op` in every fiber `q`. -/
def liftOp (op : Charge → Charge) (v : Valuation) : Valuation := fun φ => op (v φ)

@[simp] theorem liftOp_apply (op : Charge → Charge) (v : Valuation) (φ : PredicationCell) :
    liftOp op v φ = op (v φ) := rfl

/-- The pointwise lift is **inflationary** when the charge map is — the 2-monad unit
`η` (inclusion-into-closure) at the valuation level. -/
theorem liftOp_infl (c : Charge.Closure) (v : Valuation) : leK v (liftOp c.op v) :=
  fun φ => c.infl (v φ)

/-- The pointwise lift is **monotone** when the charge map is — 2-functoriality of
`Cl`. -/
theorem liftOp_mono (c : Charge.Closure) {v w : Valuation} (h : leK v w) :
    leK (liftOp c.op v) (liftOp c.op w) :=
  fun φ => c.mono _ _ (h φ)

/-- The pointwise lift is **idempotent** when the charge map is — the strict
multiplication `μ` (nested-closure collapse) at the valuation level. -/
theorem liftOp_idem (c : Charge.Closure) (v : Valuation) :
    liftOp c.op (liftOp c.op v) = liftOp c.op v := by
  funext φ; exact c.idem (v φ)

/-! ## (1) No non-trivial periodic orbits — lifted to valuations

`closure-2-monad`'s *no_non_trivial_periodic_orbits*. We lift the iteration to
valuations and reuse `Charge.no_periodic_orbits` fiberwise. -/

/-- Iterate a valuation-endomap — the settling orbit `Cl^n` at the valuation level. -/
def iterV (f : Valuation → Valuation) : Nat → Valuation → Valuation
  | 0, v => v
  | n + 1, v => f (iterV f n v)

/-- The pointwise iterate is the fiberwise charge iterate: `(liftOp op)^n v φ =
op^n (v φ)`. The fiberwise family iterates independently in each fiber. -/
theorem iterV_liftOp (op : Charge → Charge) (n : Nat) (v : Valuation) (φ : PredicationCell) :
    iterV (liftOp op) n v φ = Charge.iter op n (v φ) := by
  induction n with
  | zero => rfl
  | succ k ih => show op (iterV (liftOp op) k v φ) = op (Charge.iter op k (v φ)); rw [ih]

/-- **No non-trivial periodic orbits, at the valuation level.** For the pointwise
closure-operator family of a charge-closure `c`, if iterating `k ≥ 1` times returns
to the start valuation, then the start was already a fixed point of `cl`. Only
period 1 (fixed points). Lifts `Charge.no_periodic_orbits` fiberwise. -/
theorem no_periodic_orbits (c : Charge.Closure) (v : Valuation) {k : Nat} (hk : 1 ≤ k)
    (h : iterV (liftOp c.op) k v = v) : liftOp c.op v = v := by
  funext φ
  have hφ : Charge.iter c.op k (v φ) = v φ := by
    rw [← iterV_liftOp c.op k v φ, h]
  exact Charge.no_periodic_orbits c (v φ) hk hφ

/-! ## (2) C-naturality — the closure commutes with reindexing

`closure-2-monad` axiom 4: *`C`-natural — `Cl` commutes with reindexing along
predicate-category morphisms*. The **C-natural square** at base map `f`:

  `cl (reindex f w) = reindex f (cl w)`

i.e. saturating after pulling back equals pulling back after saturating. We package
the closure-operator family together with this square (so a general fiber proof can
supply it as a field), and prove the square for the pointwise-charge closure. -/

/-- A **C-natural closure-operator family**: a closure `cl` on `Valuation` together
with the C-natural square — `cl` commutes with reindexing along every base map `f`.
The square is the structure field, so a fully-general per-fiber closure can supply
it as a hypothesis; the pointwise-charge closure proves it (see `pointwiseFamily`). -/
structure CNaturalFamily where
  /-- The fiberwise closure operator `cl = (cl_q)`. -/
  cl : Valuation → Valuation
  /-- Inflationary — the 2-monad unit `η`. -/
  infl : ∀ v, leK v (cl v)
  /-- Monotone — 2-functoriality of `Cl`. -/
  mono : ∀ {v w}, leK v w → leK (cl v) (cl w)
  /-- Idempotent — the strict multiplication `μ`. -/
  idem : ∀ v, cl (cl v) = cl v
  /-- **The C-natural square.** `cl` commutes with reindexing along any base map. -/
  c_natural : ∀ (f : PredicationCell → PredicationCell) (w : Valuation),
    cl (reindex f w) = reindex f (cl w)

/-- **The pointwise-charge closure is C-natural.** Reindexing is precomposition
`reindex f w = w ∘ f`, and the fiber closure `c.op` is the same map in every fiber,
so `cl (reindex f w) φ = c.op (w (f φ)) = reindex f (cl w) φ` holds definitionally.
This proves the C-natural square for the pointwise family. -/
theorem liftOp_c_natural (c : Charge.Closure)
    (f : PredicationCell → PredicationCell) (w : Valuation) :
    liftOp c.op (reindex f w) = reindex f (liftOp c.op w) := rfl

/-- The pointwise-charge closure assembled as a `CNaturalFamily` — the fiberwise
family `(cl_q)` with the C-natural square discharged. -/
def pointwiseFamily (c : Charge.Closure) : CNaturalFamily where
  cl := liftOp c.op
  infl := liftOp_infl c
  mono := fun h => liftOp_mono c h
  idem := liftOp_idem c
  c_natural := liftOp_c_natural c

/-! ## (3) Closure-merge commutation — the settling-step identity

`closure-2-monad`'s settling step: saturate-then-merge = merge-then-saturate-under-
closure, `cl (joinK (cl X) Y) = cl (joinK X Y)`. We prove it at the charge level for
any `Charge.Closure`, then lift it to the pointwise valuation closure. -/

/-- **Closure-merge at the charge level.** `cl (joinK (cl x) y) = cl (joinK x y)`.
Saturating, merging `y`, then re-saturating is the same as merging then saturating:
the first saturation is redundant under the outer closure. Proven by antisymmetry
from inflation + monotonicity + idempotence. -/
theorem Charge_closure_merge (c : Charge.Closure) (x y : Charge) :
    c.op (Charge.joinK (c.op x) y) = c.op (Charge.joinK x y) := by
  apply Charge.kle_antisymm
  · -- `joinK (cl x) y ≤ cl (joinK x y)`, then mono + idem.
    have hx : KLE (c.op x) (c.op (Charge.joinK x y)) := c.mono _ _ (le_joinK_left x y)
    have hy : KLE y (c.op (Charge.joinK x y)) :=
      kle_trans _ _ _ (le_joinK_right x y) (c.infl (Charge.joinK x y))
    have hjoin : KLE (Charge.joinK (c.op x) y) (c.op (Charge.joinK x y)) := joinK_le _ _ _ hx hy
    have := c.mono _ _ hjoin
    rw [c.idem (Charge.joinK x y)] at this; exact this
  · -- `joinK x y ≤ joinK (cl x) y` since `x ≤ cl x`, then mono.
    have hx : KLE x (c.op x) := c.infl x
    have hjoin : KLE (Charge.joinK x y) (Charge.joinK (c.op x) y) :=
      joinK_le _ _ _ (kle_trans _ _ _ hx (le_joinK_left (c.op x) y)) (le_joinK_right (c.op x) y)
    exact c.mono _ _ hjoin

/-- **Closure-merge for the pointwise valuation closure.** The valuation-level
settling-step identity `cl (joinK (cl X) Y) = cl (joinK X Y)`, lifted fiberwise from
`Charge_closure_merge`. (`Valuation.joinK` is the pointwise charge join.) -/
theorem closure_merge (c : Charge.Closure) (X Y : Valuation) :
    liftOp c.op (joinK (liftOp c.op X) Y) = liftOp c.op (joinK X Y) := by
  funext φ
  show c.op (Charge.joinK (c.op (X φ)) (Y φ)) = c.op (Charge.joinK (X φ) (Y φ))
  exact Charge_closure_merge c (X φ) (Y φ)

/-! ## (4) The least fixed point IS the settled valuation

The Knaster–Tarski / `cosettling` tie. For the pointwise closure (and for any
`CNaturalFamily`), `cl seed` is a fixed point and the least fixed point above the
seed — that is exactly the settled valuation `Valuation.settle`. The `ClosureOrdinal`
bound `κ ≤ 3` makes it reachable by finite iteration. -/

/-- The settled valuation under the pointwise closure: its fixed point from a seed. -/
def settleLift (c : Charge.Closure) (v : Valuation) : Valuation := liftOp c.op v

/-- **The settled valuation is a fixed point** (Knaster–Tarski, closure form). -/
theorem settleLift_fixed (c : Charge.Closure) (v : Valuation) :
    liftOp c.op (settleLift c v) = settleLift c v := liftOp_idem c v

/-- **The settled valuation is the least fixed point above the seed.** Any fixed
point `x ≥ₖ seed` of `cl` lies above `settleLift c seed`. This is the
least-upper-bound character of the settled valuation — the `cosettling` *Maximum* /
Knaster–Tarski statement, lifted to valuations. -/
theorem settleLift_least (c : Charge.Closure) (seed x : Valuation)
    (hsx : leK seed x) (hfx : liftOp c.op x = x) : leK (settleLift c seed) x := by
  have h := liftOp_mono c hsx
  rw [hfx] at h; exact h

/-- **The lfp is the settled valuation, packaged.** `settleLift c seed` is the least
fixed point of the pointwise closure above `seed`: it is a fixed point, and it is
below every fixed point above `seed`. So the least fixed point *is* the settled
valuation. -/
theorem lfp_is_settled (c : Charge.Closure) (seed : Valuation) :
    liftOp c.op (settleLift c seed) = settleLift c seed ∧
    (∀ x, leK seed x → liftOp c.op x = x → leK (settleLift c seed) x) :=
  ⟨settleLift_fixed c seed, fun x => settleLift_least c seed x⟩

/-- **Finite reachability of the lfp, at `kHeight`.** Each fiber settles by step
`kHeight` (`= Articulating.Corner.all.length - 1`, FOUR's lattice height, not asserted
as a bare numeral): `iter c.op kHeight (v φ) = iter c.op (kHeight+1) (v φ)`, so the
pointwise orbit reaches its fixed point — the settled valuation — in `≤ kHeight` steps,
fiberwise. -/
theorem lfp_reached_by_kHeight (c : Charge.Closure) (v : Valuation) (φ : PredicationCell) :
    iterV (liftOp c.op) Charge.kHeight v φ
      = iterV (liftOp c.op) (Charge.kHeight + 1) v φ := by
  rw [iterV_liftOp c.op Charge.kHeight v φ, iterV_liftOp c.op (Charge.kHeight + 1) v φ]
  exact Charge.settles_by_kHeight c.op c.infl (v φ)

/-- **Finite reachability of the lfp, at the literal `3`/`4`.** `lfp_reached_by_kHeight`
read at `kHeight`'s computed value — kept for existing callers stating the bound
directly; the derived form is the honest statement. -/
theorem lfp_reached_by_three (c : Charge.Closure) (v : Valuation) (φ : PredicationCell) :
    iterV (liftOp c.op) 3 v φ = iterV (liftOp c.op) 4 v φ := by
  have h := lfp_reached_by_kHeight c v φ
  rwa [Charge.kHeight_eq_three] at h

/-! ## The modal closure `cl = ◇∘□` as a pointwise-charge family is not pointwise

The corpus's settling closure is `cl = ◇∘□` (`ModalPairAdjunction.closureOp`), which
mixes fibers along the accessibility relation — it is **not** a pointwise-charge
closure. The pointwise family above is the heavy-proof-free *fiber-diagonal* slice
of the general C-natural family. We record the connection: the modal closure is a
closure operator (extensive/monotone/idempotent) on `Valuation` in exactly the
`CNaturalFamily` sense **minus** the C-natural square (which the modal closure
satisfies only for base maps respecting the frame). The four laws above are the
laws the pointwise diagonal makes unconditional. -/

/-- The modal closure `◇∘□` satisfies the closure laws of a `CNaturalFamily` (the
`closure-2-monad`'s monotone/inflationary/idempotent axioms 1-3); only the C-natural
square (axiom 4) needs the base map to respect the frame, so it is not assembled as a
pointwise `CNaturalFamily`. -/
theorem modal_closure_laws (M : ModalFrame) :
    (∀ v, leK v (M.closureOp v)) ∧
    (∀ {v w}, leK v w → leK (M.closureOp v) (M.closureOp w)) ∧
    (∀ v, M.closureOp (M.closureOp v) = M.closureOp v) :=
  ⟨M.closureOp_infl, fun h => M.closureOp_mono h, M.closureOp_idem⟩

end Valuation
end Obsmetrologia
