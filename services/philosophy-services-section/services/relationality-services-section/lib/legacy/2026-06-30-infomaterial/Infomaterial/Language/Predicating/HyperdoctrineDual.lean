import Infomaterial.Language.Positing.OrderSwapDuality
import Infomaterial.Language.Predicating.Hyperdoctrine
import Infomaterial.Language.Predicating.Quantifying
import Infomaterial.Language.Predicating.Equality

/-!
# Dual predication hyperdoctrine — σ-conjugation of the adjoint system

This module closes the two connective-tissue gaps between the predication
hyperdoctrine and its truth-order dual, formalizing

* `settling/content/predication-hyperdoctrine/predication-hyperdoctrine.md`
* `settling/content/dual-predication-hyperdoctrine/dual-predication-hyperdoctrine.md`

A predication hyperdoctrine carries the quantifier adjoints `∃_f ⊣ f* ⊣ ∀_f`,
Frobenius reciprocity, and Beck–Chevalley in BOTH the knowledge order `≤ₖ`
(built in `Hyperdoctrine`/`Quantifying`) and the truth order `≤ₜ` (built in
`Equality`). The corpus's claim is that the truth-order system is NOT a fresh
construction but the **σ-conjugate** of the knowledge-order one, where `σ` is the
order-swap involution of `OrderSwapDuality` carrying `(Charge,≤ₖ) ≅ (Charge,≤ₜ)`.

We make σ act on whole valuations (`Valuation.swap = σ ∘ –`) and prove:

* **`valSwap_leK_leT`** — `σ` lifts to an order-iso on valuations:
  `leK v w ↔ leT (σ v) (σ w)`.
* **`galoisK_to_galoisT`** — the GENERIC transport: any `≤ₖ` Galois connection
  `L ⊣ R` σ-conjugates to a `≤ₜ` Galois connection `(σ∘L∘σ) ⊣ (σ∘R∘σ)`. This is
  connective tissue #5: *every `≤ₖ` adjunction theorem maps to a `≤ₜ` adjunction
  theorem with matching shape, not re-proved.*
* **`dual_adjoint_system`** — instantiating the transport at the
  fiber quantifiers gives the dual triple `∃ᵗ ⊣ f* ⊣ ∀ᵗ` in `≤ₜ`, AND we show the
  σ-transport of `existsF`/`forallF` reproduces exactly `Equality`'s independently
  built `existsT`/`forallT` (so the dep's directly-proved truth system EQUALS the
  σ-transport of the knowledge system — nothing is re-postulated).
* **`two_equalities_one_diagonal`** — `Equality`'s classical
  (`classicalEq`, in `≤ₜ`) and paraconsistent (`paraconsistentEq`, in `≤ₖ`)
  equality predicates are the SAME diagonal reindexing pushed through the two
  adjoint systems: `classicalEq = σ ∘ paraconsistentEq` pointwise. One diagonal,
  two adjoint systems, two equalities.
* **`frobenius_dual`** — `Hyperdoctrine`'s `≤ₖ` meet-Frobenius for converse
  σ-conjugates to a `≤ₜ` meet-Frobenius. (Caveat on the fusion `⊙` documented in
  prose below, not imported.)
* **`beck_chevalley_dual`** — Beck–Chevalley transported to the σ-conjugate
  reindexings (order-free: it is an equality of valuations, so it holds verbatim
  in both orders).
-/

namespace Infomaterial
namespace Valuation

/-! ## σ on valuations — the order-iso lifted pointwise -/

/-- The order-swap `σ` acting on a whole valuation, pointwise:
`(σ v) φ = Charge.swap (v φ)`. This is the lift of `OrderSwapDuality`'s order-iso
to the fibration's fibre objects (the valuations). -/
def swap (v : Valuation) : Valuation := fun φ => Charge.swap (v φ)

/-- `σ` is involutive on valuations — the lift of `Charge.swap_swap`. -/
@[simp] theorem swap_swap (v : Valuation) : swap (swap v) = v := by
  funext φ; simp [swap, Charge.swap_swap]

/-- **`σ` lifts to an order-iso on valuations.** `leK v w ↔ leT (σ v) (σ w)`: the
valuation knowledge order maps onto the valuation truth order under `σ`, pointwise
by `OrderSwapDuality.swap_kle_tle`. (`Valuation.leT` is `Equality`'s pointwise
`≤ₜ`.) -/
theorem valSwap_leK_leT (v w : Valuation) : leK v w ↔ leT (swap v) (swap w) := by
  constructor
  · intro h φ
    exact (Charge.swap_kle_tle (v φ) (w φ)).1 (h φ)
  · intro h φ
    exact (Charge.swap_kle_tle (v φ) (w φ)).2 (h φ)

/-- The inverse direction: `leT v w ↔ leK (σ v) (σ w)` — the full poset iso on
valuations, by `OrderSwapDuality.swap_tle_kle`. -/
theorem valSwap_leT_leK (v w : Valuation) : leT v w ↔ leK (swap v) (swap w) := by
  constructor
  · intro h φ
    exact (Charge.swap_tle_kle (v φ) (w φ)).1 (h φ)
  · intro h φ
    exact (Charge.swap_tle_kle (v φ) (w φ)).2 (h φ)

/-! ## Generic σ-transport of a Galois connection (connective tissue #5) -/

/-- A `≤ₜ` Galois connection on valuations — the truth-order analogue of
`Hyperdoctrine.GaloisK`. -/
def GaloisT (L R : Valuation → Valuation) : Prop :=
  ∀ v w, (leT (L v) w ↔ leT v (R w))

/-- The σ-conjugate of a valuation endomap: `conj L := σ ∘ L ∘ σ`. -/
def conj (L : Valuation → Valuation) : Valuation → Valuation := fun v => swap (L (swap v))

/-- `conj` is involutive on endomaps — the lift of `OrderSwapDuality.conj_conj`. -/
theorem conj_conj (L : Valuation → Valuation) : conj (conj L) = L := by
  funext v; simp [conj, swap_swap]

/-- **The transport meta-lemma.** Any `≤ₖ` Galois connection `L ⊣ R` σ-conjugates
to a `≤ₜ` Galois connection `(σ∘L∘σ) ⊣ (σ∘R∘σ)`. Every `≤ₖ` adjunction theorem
maps to a `≤ₜ` one with matching shape — it is NOT re-proved, only transported
through the order-iso `valSwap_leK_leT`. -/
theorem galoisK_to_galoisT (L R : Valuation → Valuation) (h : GaloisK L R) :
    GaloisT (conj L) (conj R) := by
  intro v w
  -- Rephrase both sides through σ: leT a b ↔ leK (σ a) (σ b).
  rw [valSwap_leT_leK (conj L v) w, valSwap_leT_leK v (conj R w)]
  -- conj unfolds with a cancelling σ∘σ.
  simp only [conj, swap_swap]
  -- Now it is exactly the ≤ₖ Galois statement at (σ v, σ w).
  exact h (swap v) (swap w)

/-! ## (A) The dual adjoint system `∃ᵗ ⊣ f* ⊣ ∀ᵗ` as the σ-transport -/

/-- `σ` distributes over the knowledge fiber-join list as the truth fiber-join
list: `σ (joinList l) = joinTList (l.map σ)`. The σ-image of a `≤ₖ` fiber join is
the `≤ₜ` fiber join of the σ-imaged charges — the engine behind `existsF ↦ existsT`. -/
theorem swap_joinList : ∀ l : List Charge,
    Charge.swap (Charge.joinList l) = Charge.joinTList (l.map Charge.swap)
  | [] => rfl
  | a :: l => by
      show Charge.swap (Charge.joinK a (Charge.joinList l))
        = Charge.joinT (Charge.swap a) (Charge.joinTList (l.map Charge.swap))
      rw [Charge.swap_joinK, swap_joinList l]

/-- Dually, `σ (meetList l) = meetTList (l.map σ)`. -/
theorem swap_meetList : ∀ l : List Charge,
    Charge.swap (Charge.meetList l) = Charge.meetTList (l.map Charge.swap)
  | [] => rfl
  | a :: l => by
      show Charge.swap (Charge.meetK a (Charge.meetList l))
        = Charge.meetT (Charge.swap a) (Charge.meetTList (l.map Charge.swap))
      rw [Charge.swap_meetK, swap_meetList l]

/-- **`σ`-transport of the existential.** The σ-conjugate of the knowledge
existential `∃_f` IS the truth existential `∃ᵗ_f` of `Equality`. So `existsT` is
NOT a fresh construction — it is `σ ∘ existsF ∘ σ`. -/
theorem conj_existsF_eq_existsT (F : FiniteFibration) :
    conj (existsF F) = existsT F := by
  funext v φ
  show Charge.swap (existsF F (swap v) φ) = existsT F v φ
  show Charge.swap (Charge.joinList ((F.fiber φ).map (swap v)))
      = Charge.joinTList ((F.fiber φ).map v)
  rw [swap_joinList]
  congr 1
  rw [List.map_map]
  apply List.map_congr_left
  intro ψ _
  show Charge.swap (Charge.swap (v ψ)) = v ψ
  exact Charge.swap_swap (v ψ)

/-- **`σ`-transport of the universal.** Likewise `σ ∘ ∀_f ∘ σ = ∀ᵗ_f`. -/
theorem conj_forallF_eq_forallT (F : FiniteFibration) :
    conj (forallF F) = forallT F := by
  funext v φ
  show Charge.swap (forallF F (swap v) φ) = forallT F v φ
  show Charge.swap (Charge.meetList ((F.fiber φ).map (swap v)))
      = Charge.meetTList ((F.fiber φ).map v)
  rw [swap_meetList]
  congr 1
  rw [List.map_map]
  apply List.map_congr_left
  intro ψ _
  show Charge.swap (Charge.swap (v ψ)) = v ψ
  exact Charge.swap_swap (v ψ)

/-- `σ`-transport of reindexing: reindexing is σ-self-conjugate, `σ ∘ f* ∘ σ = f*`,
because `f*` acts in the base (precomposition) and σ acts in the fibre. So the
shared right/left adjoint `f*` survives transport unchanged — exactly as the
hyperdoctrine demands. -/
theorem conj_reindex_eq (r : PredicationCell → PredicationCell) :
    conj (reindex r) = reindex r := by
  funext v φ
  show Charge.swap (reindex r (swap v) φ) = reindex r v φ
  show Charge.swap (Charge.swap (v (r φ))) = v (r φ)
  exact Charge.swap_swap (v (r φ))

/-- **HEADLINE (A): the dual adjoint system `∃ᵗ ⊣ f* ⊣ ∀ᵗ`.** Both halves of the
truth-order triple are the σ-transports of `Quantifying`'s knowledge-order
adjunctions, AND each equals `Equality`'s independently-built truth system. The
theorem packages the dual triple together with the identity
*(transport of the ≤ₖ system) = (the directly-built ≤ₜ system)*, which is
connective tissue #5 made formal: the dep's `existsT_adjunction`/`forallT_adjunction`
are not new facts, they are `existsF`/`forallF` σ-conjugated. -/
theorem dual_adjoint_system (F : FiniteFibration) :
    -- the ≤ₜ existential adjunction holds, obtained by σ-transport
    (GaloisT (existsT F) (reindex F.base)
      ∧ GaloisT (reindex F.base) (forallT F))
    -- and it IS the σ-transport of the ≤ₖ system (matching maps, not re-proved)
    ∧ (existsT F = conj (existsF F)
      ∧ forallT F = conj (forallF F)
      ∧ reindex F.base = conj (reindex F.base)) := by
  -- The two transport identities, used to rewrite the transported Galois facts.
  have hE : conj (existsF F) = existsT F := conj_existsF_eq_existsT F
  have hA : conj (forallF F) = forallT F := conj_forallF_eq_forallT F
  have hR : conj (reindex F.base) = reindex F.base := conj_reindex_eq F.base
  refine ⟨⟨?_, ?_⟩, ?_, ?_, ?_⟩
  · -- ∃ᵗ ⊣ f*  as the σ-transport of  ∃_f ⊣ f*
    have hk : GaloisK (existsF F) (reindex F.base) := existsF_adjunction F
    have ht : GaloisT (conj (existsF F)) (conj (reindex F.base)) :=
      galoisK_to_galoisT _ _ hk
    rw [hE, hR] at ht; exact ht
  · -- f* ⊣ ∀ᵗ  as the σ-transport of  f* ⊣ ∀_f
    have hk : GaloisK (reindex F.base) (forallF F) := forallF_adjunction F
    have ht : GaloisT (conj (reindex F.base)) (conj (forallF F)) :=
      galoisK_to_galoisT _ _ hk
    rw [hR, hA] at ht; exact ht
  · exact hE.symm
  · exact hA.symm
  · exact hR.symm

end Valuation

/-! ## (B) Two equalities from one diagonal -/

/-- `σ` carries the paraconsistent (`≤ₖ`, `⊤`/`⊥`-valued) equality to the classical
(`≤ₜ`, `t`/`f`-valued) one, pointwise: `classicalEq = σ ∘ paraconsistentEq`. The
single diagonal `diagFiber` is pushed through the knowledge existential to give
`paraconsistentEq`, and σ-transport (which sends `∃ᵏ ↦ ∃ᵗ`, `kTop ↦ tTop`,
`kBot ↦ tBot`) turns it into `classicalEq`. -/
theorem classicalEq_eq_swap_paraconsistentEq (s o : Entity) :
    classicalEq s o = Charge.swap (paraconsistentEq s o) := by
  unfold classicalEq paraconsistentEq
  rw [Valuation.swap_joinList]
  rw [List.map_map]
  apply congrArg
  apply List.map_congr_left
  intro u _
  rfl

/-- **HEADLINE (B): one diagonal, two adjoint systems, two equalities.** Both the
classical (`≤ₜ`) and the paraconsistent (`≤ₖ`) equality predicates of `Equality`
are derived from the SAME diagonal `diagFiber s o`, pushed through the two adjoint
systems; the two outputs are σ-conjugate (`classicalEq = σ ∘ paraconsistentEq`),
they hold on the SAME diagonal (`s = o`), and on the diagonal they land at the
two orders' respective tops (`t` for classical, `⊤` for paraconsistent). Off the
diagonal they land at the respective bottoms. Equality is derived, not postulated,
and one diagonal yields both. -/
theorem two_equalities_one_diagonal (s o : Entity) :
    -- both arise from the one diagonal via σ-conjugate adjoint systems
    (classicalEq s o = Charge.swap (paraconsistentEq s o))
    -- reflexivity at the two orders' tops
    ∧ (classicalEq s s = Charge.tTop ∧ paraconsistentEq s s = Charge.kTop)
    -- the explicit two-valued / two-polar readings on/off the diagonal
    ∧ (classicalEq s o = if s = o then Charge.tTop else Charge.tBot)
    ∧ (paraconsistentEq s o = if s = o then Charge.kTop else Charge.kBot) := by
  refine ⟨classicalEq_eq_swap_paraconsistentEq s o,
          ⟨classicalEq_refl s, paraconsistentEq_refl s⟩,
          classicalEq_eq s o, paraconsistentEq_eq s o⟩

/-! ## (C) Frobenius in both orders -/

namespace Valuation

/-- `σ` distributes over the pointwise knowledge-meet as the pointwise truth-meet:
`σ (v ∧ₖ w) = (σ v) ∧ₜ (σ w)` — the valuation lift of `OrderSwapDuality.swap_meetK`.
(`meetT` here is the pointwise truth-meet of valuations, defined locally to match
`Valuation.meetK`.) -/
def meetT (v w : Valuation) : Valuation := fun φ => Charge.meetT (v φ) (w φ)

/-- `σ` carries the pointwise knowledge-meet to the pointwise truth-meet:
`σ (v ∧ₖ w) = (σ v) ∧ₜ (σ w)` — the valuation lift of `OrderSwapDuality.swap_meetK`.
This is the equation that transports `≤ₖ` meet-Frobenius to the `≤ₜ` order. -/
theorem swap_meetK (v w : Valuation) : swap (meetK v w) = meetT (swap v) (swap w) := by
  funext φ
  show Charge.swap (Charge.meetK (v φ) (w φ))
      = Charge.meetT (Charge.swap (v φ)) (Charge.swap (w φ))
  exact Charge.swap_meetK (v φ) (w φ)

/-- Reindexing preserves the pointwise truth-meet (the `meetT` companion of
`Hyperdoctrine.reindex_meetK`), since it is pure precomposition in the base. -/
@[simp] theorem reindex_meetT (r : PredicationCell → PredicationCell) (v w : Valuation) :
    reindex r (meetT v w) = meetT (reindex r v) (reindex r w) := rfl

/-- **(C) Frobenius reciprocity in the TRUTH order**, for the converse quantifier —
the σ-dual of `Hyperdoctrine.converse_frobenius` (the `≤ₖ` meet-Frobenius).
`∃ᵗ_f(f*α ∧ₜ φ) = α ∧ₜ ∃ᵗ_f φ` with `∃ᵗ_f = f* = reindex converse`. Meet-Frobenius
therefore holds in BOTH orders: it is the SAME reciprocity equation read off the
truth-meet `∧ₜ`, the σ-image (`swap_meetK`) of the knowledge-meet equation.
(The fusion `⊙` caveat — failure for non-integral `⊙` on three of four generator
classes — is documented in the module header; `⊙` is out of scope here.) -/
theorem frobenius_dual (α φ : Valuation) :
    reindex PredicationCell.converse (meetT (reindex PredicationCell.converse α) φ)
      = meetT α (reindex PredicationCell.converse φ) := by
  rw [reindex_meetT, reindex_converse_converse]

/-- And the explicit σ-conjugation witness: the truth Frobenius is literally the
σ-image of the knowledge Frobenius. Applying `σ` to `converse_frobenius` at the
σ-preimages `(σ α, σ φ)` and cancelling the `σ∘σ` round-trips reproduces
`frobenius_dual`, so the truth reciprocity is NOT re-proved from scratch — it is
the knowledge reciprocity transported. -/
theorem swap_reindex (r : PredicationCell → PredicationCell) (v : Valuation) :
    swap (reindex r v) = reindex r (swap v) := rfl

theorem frobenius_dual_is_transport (α φ : Valuation) :
    reindex PredicationCell.converse (meetT (reindex PredicationCell.converse α) φ)
      = swap (reindex PredicationCell.converse
          (meetK (reindex PredicationCell.converse (swap α)) (swap φ))) := by
  -- Inner knowledge Frobenius, then push σ inward and cancel the σ∘σ round-trips.
  rw [converse_frobenius, swap_meetK, swap_swap, swap_reindex]
  simp only [swap_swap]
  exact frobenius_dual α φ

/-! ## (D) Beck–Chevalley transported to the σ-conjugate reindexings -/

/-- **(D) Beck–Chevalley, dual.** Reindexings along commuting base maps commute,
and this is an equality of VALUATIONS — order-free — so it holds verbatim under
σ-transport. Stated on the σ-conjugate reindexings (which equal the originals by
`conj_reindex_eq`): the Beck–Chevalley square of the dual hyperdoctrine is the σ-
image of `Hyperdoctrine.beck_chevalley`, with no new content. -/
theorem beck_chevalley_dual (r s : PredicationCell → PredicationCell)
    (hcomm : s ∘ r = r ∘ s) (v : Valuation) :
    conj (reindex r) (conj (reindex s) v) = conj (reindex s) (conj (reindex r) v) := by
  rw [conj_reindex_eq, conj_reindex_eq]
  exact beck_chevalley r s hcomm v

end Valuation

end Infomaterial
