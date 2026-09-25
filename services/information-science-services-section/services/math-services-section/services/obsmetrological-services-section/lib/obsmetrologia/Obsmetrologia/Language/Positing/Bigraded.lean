import Obsmetrologia.Language.Positing.Four

/-!
# Bigraded diamond — the nuclear quartet, as a recurrent fiberwise pattern

This is *not one object*. The nuclear quartet is a **pattern** — two commuting
nuclei on a Heyting algebra giving four fixed-point sub-algebras — that the corpus
instantiates several ways and, crucially, lets **vary fiberwise**:

* as `(j_k, j_t)` — the two **orders** (knowledge / truth) of the bilattice;
* as `(σ, Δ)` — **saturation** (the past has nothing further to add) and **transfer**
  (the future has already sent everything back), the temporal pair;
* and the pair `(σ_t, Δ_t)` **varies across fibers/histories `t`** — a *family* of
  quartets. That fiberwise variation is exactly what promotes aperiodicity from an
  assumption to a **theorem** (the Axiom of History Separation): a constant nuclear
  pair would leave automorphisms invisible. Grading the diamond by the Klein-four
  and stacking gives the **bigraded diamond tower**.

What this module derives (the 1-categorical reduction of the 2-categorical KZ diamond):

1. A **Heyting algebra** base, and a **nucleus** as a meet-preserving closure.
2. **`Nucleus.fix_imp`** — the fixed points are closed under `⇒`: *this* is why
   meet-preservation matters (`Fix(j)` is a Heyting sub-algebra, not just a lattice).
3. The **nuclear quartet** of two commuting nuclei: the joint nucleus `π = j₁∘j₂`,
   `Fix(π) = Fix(j₁) ∩ Fix(j₂)`, the commuting square, four corners indexed by the
   articulation phases `Articulating.Corner`.
4. The **fiberwise family** `SquareFamily` and `Varies` — the recurrence — with a
   concrete varying family on the reading knowledge-Heyting-algebra.

> The 2-categorical truth this projects: the closure-2-monad `Cl` (KZ, lax-idempotent;
> strict only when Scott-continuous, κ=ω) and the Emmenegger fibration 2-comonad `ℕ`
> commute *strictly* on the temporal 2-category `T(C,λ)` because they touch disjoint
> data (values vs. indexing). The two parallel hyperdoctrine adjoint systems drive
> two distinct *bigradings* (cohomology vs. common-knowledge). Those remain to derive.

No free data.
-/

namespace Obsmetrologia

/-- A Heyting algebra: a meet-semilattice with a relative pseudocomplement `imp`
adjoint to meet. The order is `a ≤ b := a ⊓ b = a`. -/
structure HeytingAlgebra where
  carrier : Type
  meet : carrier → carrier → carrier
  imp : carrier → carrier → carrier
  meet_comm : ∀ a b, meet a b = meet b a
  meet_assoc : ∀ a b c, meet (meet a b) c = meet a (meet b c)
  meet_idem : ∀ a, meet a a = a
  /-- The Heyting adjunction `b ⊓ a ≤ c ⇔ b ≤ (a ⇒ c)`, with `≤` unfolded to meets. -/
  imp_adj : ∀ a b c, (meet (meet b a) c = meet b a) ↔ (meet b (imp a c) = b)

namespace HeytingAlgebra
variable (H : HeytingAlgebra)

/-- The induced order `a ≤ b ⇔ a ⊓ b = a`. -/
def le (a b : H.carrier) : Prop := H.meet a b = a

theorem le_refl (a : H.carrier) : H.le a a := H.meet_idem a
theorem le_trans {a b c : H.carrier} (h1 : H.le a b) (h2 : H.le b c) : H.le a c := by
  show H.meet a c = a
  calc H.meet a c = H.meet (H.meet a b) c := by rw [h1]
    _ = H.meet a (H.meet b c) := H.meet_assoc a b c
    _ = H.meet a b := by rw [h2]
    _ = a := h1
theorem le_antisymm {a b : H.carrier} (h1 : H.le a b) (h2 : H.le b a) : a = b := by
  show a = b; rw [← h1, H.meet_comm]; exact h2

/-- Meet is monotone in each argument. -/
theorem meet_mono (z : H.carrier) {x y : H.carrier} (h : H.le x y) :
    H.le (H.meet z x) (H.meet z y) := by
  show H.meet (H.meet z x) (H.meet z y) = H.meet z x
  calc H.meet (H.meet z x) (H.meet z y)
      = H.meet z (H.meet x (H.meet z y)) := H.meet_assoc z x _
    _ = H.meet z (H.meet (H.meet x z) y) := by rw [H.meet_assoc x z y]
    _ = H.meet z (H.meet (H.meet z x) y) := by rw [H.meet_comm x z]
    _ = H.meet z (H.meet z (H.meet x y)) := by rw [H.meet_assoc z x y]
    _ = H.meet z (H.meet z x) := by rw [h]
    _ = H.meet (H.meet z z) x := (H.meet_assoc z z x).symm
    _ = H.meet z x := by rw [H.meet_idem]

/-- Modus ponens / the counit: `(a ⇒ c) ⊓ a ≤ c`. -/
theorem modus_ponens (a c : H.carrier) : H.le (H.meet (H.imp a c) a) c :=
  (H.imp_adj a (H.imp a c) c).mpr (H.le_refl (H.imp a c))

end HeytingAlgebra

/-- A **nucleus**: an inflationary, idempotent, meet-preserving endomap of a Heyting
algebra. Monotonicity follows; its fixed points form a Heyting sub-algebra. -/
structure Nucleus (H : HeytingAlgebra) where
  j : H.carrier → H.carrier
  infl : ∀ a, H.le a (j a)
  idem : ∀ a, j (j a) = j a
  meet : ∀ a b, j (H.meet a b) = H.meet (j a) (j b)

namespace Nucleus
variable {H : HeytingAlgebra} (N : Nucleus H)

theorem mono {a b : H.carrier} (h : H.le a b) : H.le (N.j a) (N.j b) := by
  show H.meet (N.j a) (N.j b) = N.j a
  rw [← N.meet, h]

/-- **Why meet-preservation matters.** The fixed points are closed under `⇒`: if `b`
is fixed, so is `a ⇒ b`. This is what makes `Fix(j)` a Heyting *sub-algebra*, not
merely a sub-lattice. Without the meet law the closure would only reflect the
lattice. -/
theorem fix_imp {a b : H.carrier} (hb : N.j b = b) : N.j (H.imp a b) = H.imp a b := by
  refine H.le_antisymm ?_ (N.infl _)
  show H.meet (N.j (H.imp a b)) (H.imp a b) = N.j (H.imp a b)
  rw [← H.imp_adj a (N.j (H.imp a b)) b]
  have step1 : H.le (H.meet (N.j (H.imp a b)) a) (H.meet (N.j (H.imp a b)) (N.j a)) :=
    H.meet_mono (N.j (H.imp a b)) (N.infl a)
  rw [(N.meet (H.imp a b) a).symm] at step1
  have step4 : H.le (N.j (H.meet (H.imp a b) a)) b := by
    have := N.mono (H.modus_ponens a b); rwa [hb] at this
  exact H.le_trans step1 step4

end Nucleus

/-- A **nuclear square**: two commuting nuclei on one Heyting algebra. Read `j1, j2`
as `(j_k, j_t)` (the two orders) or as `(σ, Δ)` (saturation, transfer). -/
structure NuclearSquare (H : HeytingAlgebra) where
  j1 : Nucleus H
  j2 : Nucleus H
  comm : ∀ a, j1.j (j2.j a) = j2.j (j1.j a)

namespace NuclearSquare
variable {H : HeytingAlgebra} (Q : NuclearSquare H)

/-- The joint closure `π = j₁ ∘ j₂` — the doubly-quiescent corner's operator. -/
def pi (a : H.carrier) : H.carrier := Q.j1.j (Q.j2.j a)

/-- **Nuclear Quartet Theorem, part 1.** Commuting nuclei compose to a nucleus. -/
def compNucleus : Nucleus H where
  j := Q.pi
  infl a := H.le_trans (Q.j2.infl a) (Q.j1.infl (Q.j2.j a))
  idem a := by
    calc Q.pi (Q.pi a)
        = Q.j1.j (Q.j2.j (Q.j1.j (Q.j2.j a))) := rfl
      _ = Q.j1.j (Q.j1.j (Q.j2.j (Q.j2.j a))) := by rw [← Q.comm (Q.j2.j a)]
      _ = Q.j1.j (Q.j1.j (Q.j2.j a)) := by rw [Q.j2.idem]
      _ = Q.j1.j (Q.j2.j a) := Q.j1.idem _
      _ = Q.pi a := rfl
  meet a b := by
    show Q.j1.j (Q.j2.j (H.meet a b))
        = H.meet (Q.j1.j (Q.j2.j a)) (Q.j1.j (Q.j2.j b))
    rw [Q.j2.meet, Q.j1.meet]

/-- **Nuclear Quartet Theorem, part 2.** `Fix(π) = Fix(j₁) ∩ Fix(j₂)` — the
joint-quiescent corner is exactly the joint fixed point. Commutativity is the hinge. -/
theorem fix_pi_iff (a : H.carrier) : Q.pi a = a ↔ (Q.j1.j a = a ∧ Q.j2.j a = a) := by
  constructor
  · intro h
    have hu : Q.j1.j (Q.j2.j a) = a := h
    have hge : H.le a (Q.j2.j a) := Q.j2.infl a
    have hle : H.le (Q.j2.j a) a := by
      have h' := Q.j1.infl (Q.j2.j a); rw [hu] at h'; exact h'
    have hj2 : Q.j2.j a = a := H.le_antisymm hle hge
    rw [hj2] at hu; exact ⟨hu, hj2⟩
  · intro ⟨h1, h2⟩; show Q.j1.j (Q.j2.j a) = a; rw [h2, h1]

/-- **The commuting square.** Both paths `A → A*` agree. -/
theorem square (a : H.carrier) : Q.j1.j (Q.j2.j a) = Q.j2.j (Q.j1.j a) := Q.comm a

/-- The four corners read off the articulation phases: absurd = free carrier
(neither), potential = `j₁`-quiescent, active = `j₂`-quiescent, stable = joint-quiescent
(both, `π`). The quartet's corners are the recurring FOUR, lifted to sub-algebras. -/
def corner (c : Articulating.Corner) (a : H.carrier) : H.carrier :=
  match c with
  | .absurd => a
  | .potential => Q.j1.j a
  | .active => Q.j2.j a
  | .stable => Q.pi a

@[simp] theorem corner_absurd (a) : Q.corner .absurd a = a := rfl
@[simp] theorem corner_potential (a) : Q.corner .potential a = Q.j1.j a := rfl
@[simp] theorem corner_active (a) : Q.corner .active a = Q.j2.j a := rfl
@[simp] theorem corner_stable (a) : Q.corner .stable a = Q.pi a := rfl

end NuclearSquare

/-! ## The recurrence: a fiberwise-varying family of nuclear squares -/

/-- A **family of nuclear squares** indexed by fibers (histories / steps). The
nuclear pair `(j₁_i, j₂_i)` may differ per fiber — this is the recurrence the
bigraded diamond *is*: not one square but a square at every fiber. -/
structure SquareFamily (H : HeytingAlgebra) (I : Type) where
  square : I → NuclearSquare H

namespace SquareFamily
variable {H : HeytingAlgebra} {I : Type} (F : SquareFamily H I)

/-- The family **varies**: some two fibers carry different nuclear pairs.
Constant families leave automorphisms invisible; a varying family is what makes
aperiodicity (history-separation) a theorem rather than an assumption. -/
def Varies : Prop :=
  ∃ i i', (F.square i).j1.j ≠ (F.square i').j1.j ∨ (F.square i).j2.j ≠ (F.square i').j2.j

/-- Every fiber realizes the Nuclear Quartet Theorem. -/
theorem fiber_quartet (i : I) (a : H.carrier) :
    (F.square i).pi a = a ↔ ((F.square i).j1.j a = a ∧ (F.square i).j2.j a = a) :=
  (F.square i).fix_pi_iff a

end SquareFamily

/-! ## Instantiation on the reading knowledge-Heyting-algebra -/

namespace Reading

/-- Knowledge-order implication: `Reading ≅ 2 × 2` (componentwise Boolean), so
`a ⇒ c = (¬a.pos ∨ c.pos, ¬a.neg ∨ c.neg)`. -/
def impK (a c : Reading) : Reading := ofSlots ((!a.pos) || c.pos) ((!a.neg) || c.neg)

/-- The reading bilattice's knowledge order is a Heyting algebra (`⊓ = ∧ₖ`, `⇒ = impK`). -/
def heytingK : HeytingAlgebra where
  carrier := Reading
  meet := meetK
  imp := impK
  meet_comm := meetK_comm
  meet_assoc := meetK_assoc
  meet_idem := meetK_idem
  imp_adj a b c := by cases a <;> cases b <;> cases c <;> decide

/-- Raising toward a bound `c` by `∨ₖ` is a nucleus of the knowledge-Heyting-algebra. -/
def joinNucleusK (c : Reading) : Nucleus heytingK where
  j a := joinK c a
  infl a := by show meetK a (joinK c a) = a; cases c <;> cases a <;> rfl
  idem a := by cases c <;> cases a <;> rfl
  meet a b := by
    show joinK c (meetK a b) = meetK (joinK c a) (joinK c b)
    cases c <;> cases a <;> cases b <;> rfl

/-- Any two join-nuclei commute, so they form a nuclear square. -/
def joinSquare (c1 c2 : Reading) : NuclearSquare heytingK where
  j1 := joinNucleusK c1
  j2 := joinNucleusK c2
  comm a := by cases c1 <;> cases c2 <;> cases a <;> rfl

/-- A **varying** two-fiber family: fiber `true` raises toward `t`, fiber
`false` toward `⊤ₖ`; the `j₁` nuclei differ. A concrete bigraded-diamond recurrence. -/
def varyingFamily : SquareFamily heytingK Bool where
  square
    | true => joinSquare tTop tBot
    | false => joinSquare kTop tBot

theorem varyingFamily_varies : varyingFamily.Varies := by
  refine ⟨true, false, Or.inl ?_⟩
  intro h
  have h2 : joinK tTop kBot = joinK kTop kBot := congrFun h kBot
  exact absurd h2 (by decide)

end Reading

end Obsmetrologia
