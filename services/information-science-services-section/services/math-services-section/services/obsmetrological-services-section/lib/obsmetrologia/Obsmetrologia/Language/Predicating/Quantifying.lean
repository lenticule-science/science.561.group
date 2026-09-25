import Obsmetrologia.Language.Predicating.Hyperdoctrine

/-!
# Quantifying — the fiber quantifier adjoints

`Hyperdoctrine` gave the adjoints for the *bijection* generators (converse). This
module completes B1 for the **projection** generators, whose fibers collapse the
entity pair, by the general construction: for a base map `f` with finite preimages,

  `(∃_f v)(φ) = ⨆ { v ψ : f ψ = φ }`     `(∀_f v)(φ) = ⨅ { v ψ : f ψ = φ }`

are the fiber join / meet, and `∃_f ⊣ f* ⊣ ∀_f` holds. The fiber is the finite
complete lattice `Charge`; the only assumption is that each preimage is finitely
enumerable — packaged as a `FiniteFibration` carrying the preimage as a `List`.
(The projection generators satisfy this exactly when the entity index is finite;
the bijection generators always do, with singleton fibers — shown coherent below.)
-/

namespace Obsmetrologia

/-! ## Finite joins and meets over a list of charges -/

namespace Charge

/-- The knowledge-join of a finite list of charges (⊥ₖ on the empty list). -/
def joinList (l : List Charge) : Charge := l.foldr joinK kBot
/-- The knowledge-meet of a finite list of charges (⊤ₖ on the empty list). -/
def meetList (l : List Charge) : Charge := l.foldr meetK kTop

/-- Every member sits below the list-join. -/
theorem le_joinList (a : Charge) : ∀ l : List Charge, a ∈ l → KLE a (joinList l)
  | b :: l, h => by
      rcases List.mem_cons.1 h with rfl | h'
      · exact le_joinK_left a (joinList l)
      · exact kle_trans _ _ _ (le_joinList a l h') (le_joinK_right b (joinList l))

/-- The list-join is the least upper bound. -/
theorem joinList_le (c : Charge) : ∀ l : List Charge, (∀ a ∈ l, KLE a c) → KLE (joinList l) c
  | [], _ => kBot_le c
  | b :: l, h =>
      joinK_le b (joinList l) c
        (h b (List.mem_cons.2 (Or.inl rfl)))
        (joinList_le c l (fun a ha => h a (List.mem_cons.2 (Or.inr ha))))

/-- The positive slot of the list-join is the disjunction of the members' positive slots. -/
theorem joinList_pos (l : List Charge) : (joinList l).pos = l.any (fun c => c.pos) := by
  induction l with
  | nil => rfl
  | cons a l ih =>
    show (joinK a (joinList l)).pos = _
    simp [joinK, List.any_cons, ih]

/-- The negative slot of the list-join is the disjunction of the members' negative slots. -/
theorem joinList_neg (l : List Charge) : (joinList l).neg = l.any (fun c => c.neg) := by
  induction l with
  | nil => rfl
  | cons a l ih =>
    show (joinK a (joinList l)).neg = _
    simp [joinK, List.any_cons, ih]

/-- The list-meet sits below every member. -/
theorem meetList_le (a : Charge) : ∀ l : List Charge, a ∈ l → KLE (meetList l) a
  | b :: l, h => by
      rcases List.mem_cons.1 h with rfl | h'
      · exact meetK_le_left a (meetList l)
      · exact kle_trans _ _ _ (meetK_le_right b (meetList l)) (meetList_le a l h')

/-- The list-meet is the greatest lower bound. -/
theorem le_meetList (c : Charge) : ∀ l : List Charge, (∀ a ∈ l, KLE c a) → KLE c (meetList l)
  | [], _ => le_kTop c
  | b :: l, h =>
      le_meetK b (meetList l) c
        (h b (List.mem_cons.2 (Or.inl rfl)))
        (le_meetList c l (fun a ha => h a (List.mem_cons.2 (Or.inr ha))))

end Charge

namespace Valuation

/-! ## Finite fibrations and their quantifiers -/

/-- A base map together with each cell's preimage as a finite list — the data that
makes `∃_f`/`∀_f` constructive. -/
structure FiniteFibration where
  base : PredicationCell → PredicationCell
  fiber : PredicationCell → List PredicationCell
  mem_fiber : ∀ ψ φ, ψ ∈ fiber φ ↔ base ψ = φ

/-- The existential quantifier: fiber knowledge-join. -/
def existsF (F : FiniteFibration) (v : Valuation) : Valuation :=
  fun φ => Charge.joinList ((F.fiber φ).map v)

/-- The universal quantifier: fiber knowledge-meet. -/
def forallF (F : FiniteFibration) (v : Valuation) : Valuation :=
  fun φ => Charge.meetList ((F.fiber φ).map v)

/-- **(B1, left) `∃_f ⊣ f*`** — the existential is left adjoint to reindexing. -/
theorem existsF_adjunction (F : FiniteFibration) (v w : Valuation) :
    leK (existsF F v) w ↔ leK v (reindex F.base w) := by
  constructor
  · intro H ψ
    have hmem : ψ ∈ F.fiber (F.base ψ) := (F.mem_fiber ψ (F.base ψ)).2 rfl
    have h1 : Charge.KLE (v ψ) (existsF F v (F.base ψ)) :=
      Charge.le_joinList (v ψ) _ (List.mem_map.2 ⟨ψ, hmem, rfl⟩)
    exact Charge.kle_trans _ _ _ h1 (H (F.base ψ))
  · intro H φ
    refine Charge.joinList_le (w φ) _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    have hbase : F.base ψ = φ := (F.mem_fiber ψ φ).1 hψ
    rw [← hbase]; exact H ψ

/-- **(B1, right) `f* ⊣ ∀_f`** — reindexing is left adjoint to the universal. -/
theorem forallF_adjunction (F : FiniteFibration) (v w : Valuation) :
    leK (reindex F.base v) w ↔ leK v (forallF F w) := by
  constructor
  · intro H φ
    refine Charge.le_meetList (v φ) _ ?_
    intro a ha
    rcases List.mem_map.1 ha with ⟨ψ, hψ, rfl⟩
    have hbase : F.base ψ = φ := (F.mem_fiber ψ φ).1 hψ
    rw [← hbase]; exact H ψ
  · intro H ψ
    have hmem : ψ ∈ F.fiber (F.base ψ) := (F.mem_fiber ψ (F.base ψ)).2 rfl
    have h1 : Charge.KLE (forallF F w (F.base ψ)) (w ψ) :=
      Charge.meetList_le (w ψ) _ (List.mem_map.2 ⟨ψ, hmem, rfl⟩)
    exact Charge.kle_trans _ _ _ (H (F.base ψ)) h1

/-! ## Coherence with the bijection case -/

/-- Converse as a finite fibration: each fiber is the singleton `[converse φ]`. -/
def converseFib : FiniteFibration where
  base := PredicationCell.converse
  fiber φ := [PredicationCell.converse φ]
  mem_fiber ψ φ := by
    rw [List.mem_singleton]
    constructor
    · intro h; rw [h, PredicationCell.converse_converse]
    · intro h; rw [← h, PredicationCell.converse_converse]

/-- The fiber existential over converse agrees with reindexing along converse —
the bijection adjoints of `Hyperdoctrine` are the singleton-fiber case of these. -/
theorem existsF_converse (v : Valuation) :
    existsF converseFib v = reindex PredicationCell.converse v := by
  funext φ
  show Charge.joinK (v (PredicationCell.converse φ)) Charge.kBot
      = v (PredicationCell.converse φ)
  rw [Charge.joinK_comm]; exact Charge.joinK_kBot _

end Valuation

end Obsmetrologia
