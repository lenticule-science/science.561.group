import Infomaterial.Language.Predicating.Quantifying
import Infomaterial.Language.Positing.TruthOrder

/-!
# Equality, derived — the second adjoint system and the two equalities

The predication hyperdoctrine carries **two parallel adjoint systems**:
`∃^k ⊣ f* ⊣ ∀^k` in the knowledge order (built in `Quantifying`) and
`∃^t ⊣ f* ⊣ ∀^t` in the truth order (built here). `∃` in each order is the
fiber-**join** of that order, so the off-fiber (empty-preimage) value is the order's
bottom — `⊥` for knowledge, `f` for truth.

From these, **equality is derived, not postulated** — Lawvere's diagonal-Σ
construction applied in each order:

* **Classical equality** `=_E := ∃^t_g(1^t)` — the truth-order image of the diagonal
  `t`-terminal. Off the diagonal `∃^t` extends by `f`. So `=_E(s,o) = t` if `s=o`,
  `f` otherwise — *classical two-valued equality*.
* **Paraconsistent equality** `Δ^k_E := ∃^k_g(1^k)` — the knowledge-order image of the
  diagonal `⊤`-terminal. Off the diagonal `∃^k` extends by `⊥`. So
  `Δ^k_E(s,o) = ⊤` if `s=o`, `⊥` otherwise.

The bilattice first-order logics in the literature (BD∆, Kamide–Zohar,
Běhounek–Daňková–Dvořák) *postulate* classical equality as a primitive; here it
falls out of the dual adjoint triple. No free data.
-/

namespace Infomaterial

/-! ## Truth-order finite joins/meets -/

namespace Charge

/-- Truth-order join of a list (`f` on the empty list — the truth bottom). -/
def joinTList (l : List Charge) : Charge := l.foldr joinT tBot
/-- Truth-order meet of a list (`t` on the empty list — the truth top). -/
def meetTList (l : List Charge) : Charge := l.foldr meetT tTop

@[simp] theorem joinTList_nil : joinTList [] = tBot := rfl
@[simp] theorem joinTList_single (a : Charge) : joinTList [a] = a := by
  show joinT a tBot = a; exact joinT_tBot a
@[simp] theorem meetTList_nil : meetTList [] = tTop := rfl
@[simp] theorem meetTList_single (a : Charge) : meetTList [a] = a := by
  show meetT a tTop = a; exact meetT_tTop a

/-- Every member sits below the truth-join. -/
theorem le_joinTList (a : Charge) : ∀ l : List Charge, a ∈ l → TLE a (joinTList l)
  | b :: l, h => by
      rcases List.mem_cons.1 h with rfl | h'
      · exact le_joinT_left a (joinTList l)
      · exact tle_trans _ _ _ (le_joinTList a l h') (le_joinT_right b (joinTList l))

/-- The truth-join is the least upper bound. -/
theorem joinTList_le (c : Charge) : ∀ l : List Charge, (∀ a ∈ l, TLE a c) → TLE (joinTList l) c
  | [], _ => tBot_le c
  | b :: l, h =>
      joinT_le b (joinTList l) c
        (h b (List.mem_cons.2 (Or.inl rfl)))
        (joinTList_le c l (fun a ha => h a (List.mem_cons.2 (Or.inr ha))))

/-- The truth-meet sits below every member. -/
theorem meetTList_le (a : Charge) : ∀ l : List Charge, a ∈ l → TLE (meetTList l) a
  | b :: l, h => by
      rcases List.mem_cons.1 h with rfl | h'
      · exact meetT_le_left a (meetTList l)
      · exact tle_trans _ _ _ (meetT_le_right b (meetTList l)) (meetTList_le a l h')

/-- The truth-meet is the greatest lower bound. -/
theorem le_meetTList (c : Charge) : ∀ l : List Charge, (∀ a ∈ l, TLE c a) → TLE c (meetTList l)
  | [], _ => le_tTop c
  | b :: l, h =>
      le_meetT b (meetTList l) c
        (h b (List.mem_cons.2 (Or.inl rfl)))
        (le_meetTList c l (fun a ha => h a (List.mem_cons.2 (Or.inr ha))))

end Charge

/-! ## The truth-order adjoint system `∃^t ⊣ f* ⊣ ∀^t` -/

namespace Valuation

/-- Truth-order knowledge order on valuations (pointwise `≤ₜ`). -/
def leT (v w : Valuation) : Prop := ∀ φ, Charge.leT (v φ) (w φ) = true

/-- Truth-order existential: fiber truth-join. -/
def existsT (F : FiniteFibration) (v : Valuation) : Valuation :=
  fun φ => Charge.joinTList ((F.fiber φ).map v)

/-- Truth-order universal: fiber truth-meet. -/
def forallT (F : FiniteFibration) (v : Valuation) : Valuation :=
  fun φ => Charge.meetTList ((F.fiber φ).map v)

/-- **`∃^t ⊣ f*`** — the truth-order existential is left adjoint to reindexing. -/
theorem existsT_adjunction (F : FiniteFibration) (v w : Valuation) :
    leT (existsT F v) w ↔ leT v (reindex F.base w) := by
  constructor
  · intro H ψ
    have hmem : ψ ∈ F.fiber (F.base ψ) := (F.mem_fiber ψ (F.base ψ)).2 rfl
    have h1 : Charge.TLE (v ψ) (existsT F v (F.base ψ)) :=
      Charge.le_joinTList (v ψ) _ (List.mem_map.2 ⟨ψ, hmem, rfl⟩)
    exact Charge.tle_trans _ _ _ h1 (H (F.base ψ))
  · intro H φ
    refine Charge.joinTList_le (w φ) _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    have hbase : F.base ψ = φ := (F.mem_fiber ψ φ).1 hψ
    rw [← hbase]; exact H ψ

/-- **`f* ⊣ ∀^t`** — reindexing is left adjoint to the truth-order universal. -/
theorem forallT_adjunction (F : FiniteFibration) (v w : Valuation) :
    leT (reindex F.base v) w ↔ leT v (forallT F w) := by
  constructor
  · intro H φ
    refine Charge.le_meetTList (v φ) _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    have hbase : F.base ψ = φ := (F.mem_fiber ψ φ).1 hψ
    rw [← hbase]; exact H ψ
  · intro H ψ
    have hmem : ψ ∈ F.fiber (F.base ψ) := (F.mem_fiber ψ (F.base ψ)).2 rfl
    have h1 : Charge.TLE (forallT F w (F.base ψ)) (w ψ) :=
      Charge.meetTList_le (w ψ) _ (List.mem_map.2 ⟨ψ, hmem, rfl⟩)
    exact Charge.tle_trans _ _ _ (H (F.base ψ)) h1

end Valuation

/-! ## The two equalities, derived from the diagonal terminals -/

/-- The diagonal fiber over `(s, o)`: a single point when `s = o`, empty otherwise —
the preimage of the diagonal sub-support under `e ↦ (e, e)`. -/
def diagFiber (s o : Entity) : List Unit := if s = o then [()] else []

/-- **Classical equality**, `=_E := ∃^t_g(1^t)`: the truth-order existential image of
the diagonal `t`-terminal. -/
def classicalEq (s o : Entity) : Charge :=
  Charge.joinTList ((diagFiber s o).map (fun _ => Charge.tTop))

/-- **Paraconsistent equality**, `Δ^k_E := ∃^k_g(1^k)`: the knowledge-order existential
image of the diagonal `⊤`-terminal. -/
def paraconsistentEq (s o : Entity) : Charge :=
  Charge.joinList ((diagFiber s o).map (fun _ => Charge.kTop))

/-- **Classical equality is two-valued** `t`/`f` — derived, not postulated. The
truth-order `∃` extends the diagonal `t`-terminal by `f` off the diagonal. -/
theorem classicalEq_eq (s o : Entity) :
    classicalEq s o = if s = o then Charge.tTop else Charge.tBot := by
  unfold classicalEq diagFiber
  by_cases h : s = o <;> simp [h]

/-- **Paraconsistent equality is `⊤`/`⊥`** — derived, not postulated. The
knowledge-order `∃` extends the diagonal `⊤`-terminal by `⊥` off the diagonal. The
diagonal carries `⊤` (information-maximal), the off-diagonal `⊥` (no claim). -/
theorem paraconsistentEq_eq (s o : Entity) :
    paraconsistentEq s o = if s = o then Charge.kTop else Charge.kBot := by
  unfold paraconsistentEq diagFiber
  by_cases h : s = o <;> simp [h, Charge.joinList]

/-- The two equalities agree on *where* they hold (the diagonal) but disagree on the
*charge* — classical lands at the truth poles `t`/`f`, paraconsistent at the
knowledge poles `⊤`/`⊥`. Reflexivity in both. -/
theorem classicalEq_refl (s : Entity) : classicalEq s s = Charge.tTop := by
  rw [classicalEq_eq]; simp
theorem paraconsistentEq_refl (s : Entity) : paraconsistentEq s s = Charge.kTop := by
  rw [paraconsistentEq_eq]; simp

end Infomaterial
