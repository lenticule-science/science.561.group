/-
# LambekCalculus — the (possibly non-commutative) Lambek calculus as a residuated lattice

The corpus node `_archive/lambek-calculus/research-lambek-calculus.md` reads the
**Lambek calculus** (Lambek 1958, the *syntactic calculus*) as the logic of how a
functor — a predicate, a verb, any expression that takes arguments — combines with
its arguments. A product `·` combines two expressions, and because the product has
**two** argument positions there are **two** residuals, the *left* `\` and *right*
`/`, characterized by the **bi-residuation**

>  `a · b ≤ c   ⟺   b ≤ a \ c   ⟺   a ≤ c / b`.

The left residual `a \ c` asks what must combine with `a` *on the right* to land
below `c`; the right residual `c / b` asks what must combine with `b` *on the left*.
The calculus is **substructural**: it drops contraction, weakening, and exchange.
Galatos–Jipsen–Kowalski–Ono (2007) proved it is exactly the logic of
**residuated lattices** — the `/` and `\` of categorial grammar *are* the algebraic
residuals — so the full theory of residuated lattices governs predicate-argument
combination.

In the **commutative** case (`a · b = b · a`) the two residuals **coincide** into a
single implication `→`, and the bi-residuation collapses to the single adjunction
`a · b ≤ c ⟺ a ≤ b → c` — exactly the integral-commutative-residuated /
linear-logic FOUR fragment carried by `ResiduatedLatticeStandalone` and
`LinearLogicChu`. Lawvere (1969) identified that same adjunction in categorical
logic: existential quantification `∃` (left adjoint to substitution) and universal
`∀` (right adjoint) are the categorical form of the two residuals — the
`∃ ⊣ ∀` / `exists-left-adjoint-forall` instance. Wurm (2012) proved syntactic
**concept lattices** give complete semantics for the *full* (non-commutative)
calculus; Pentus (1993) proved Lambek grammars generate exactly the **context-free**
languages. Those two completeness/expressivity results are documented here but
**not formalized** (they are model-theoretic / language-theoretic, outside this
algebraic core).

This module builds the structure standalone on `Order.Lattice` (whose order
`a ≤ b := a ⊓ b = a` and antisymmetry come for free), then **derives** — never
posits — the standard Lambek laws (left/right modus ponens, two-sided fusion
monotonicity, residual mono/antitone, unit laws) from the bi-residuation alone, and
proves the commutative collapse to a single implication. It instantiates the
trivial one-element Lambek algebra. A `LambekAlgebra` is a `Lattice` plus a monoid
`⟨dot, e⟩` and two residuals, with the two adjunctions as its only nontrivial
fields; every Lambek law below is derived from those adjunctions.
-/
import RelMath.ResiduatedLatticeStandalone
import RelMath.LinearLogicChu
import RelMath.OrderInfra

namespace RelMath
namespace Lambek

open RelMath.Order

/-! ## The Lambek algebra

A `LambekAlgebra` is a lattice-ordered monoid `⟨L, ∧, ∨, ·, e⟩` — the product `·`
need **not** be commutative — together with two residuals (left `\` = `lres`,
right `/` = `rres`) and the **bi-residuation** as two adjunction fields:

* `dot a b ≤ c ⟺ b ≤ lres a c`   (`·` left-adjoint to the *left* residual `a \ –`)
* `dot a b ≤ c ⟺ a ≤ rres c b`   (`·` right-adjoint to the *right* residual `– / b`)

The order `le` is the inherited lattice order. -/

/-- A **Lambek algebra**: a (possibly **non-commutative**) lattice-ordered monoid
with two residuals satisfying the **bi-residuation**. It extends `Order.Lattice`
— so the lattice `⟨∧,∨⟩` and the derived order `a ≤ b := a ⊓ b = a` come for free —
and adds:

* a monoid `⟨dot, e⟩`: an associative product `dot` (`·`) with two-sided unit `e`,
  **not** assumed commutative;
* a **left residual** `lres` (`\`) and a **right residual** `rres` (`/`);
* the two **bi-residuation adjunctions**
  `dot a b ≤ c ⟺ b ≤ lres a c` and `dot a b ≤ c ⟺ a ≤ rres c b`,
  with `≤` the lattice order `Lattice.le` (`a ⊓ b = a`).
-/
structure LambekAlgebra extends Lattice where
  /-- The product `·` — combination of two expressions (not assumed commutative). -/
  dot : carrier → carrier → carrier
  /-- The left residual `a \ c` — what combines with `a` on the right to reach `c`. -/
  lres : carrier → carrier → carrier
  /-- The right residual `c / b` — what combines with `b` on the left to reach `c`. -/
  rres : carrier → carrier → carrier
  /-- The monoid unit `e`. -/
  e : carrier
  dot_assoc : ∀ a b c, dot (dot a b) c = dot a (dot b c)
  dot_one_left : ∀ a, dot e a = a
  dot_one_right : ∀ a, dot a e = a
  /-- Left bi-residuation `a · b ≤ c ⟺ b ≤ a \ c`, with `≤` unfolded to a meet. -/
  dot_lres_adj : ∀ a b c, meet (dot a b) c = dot a b ↔ meet b (lres a c) = b
  /-- Right bi-residuation `a · b ≤ c ⟺ a ≤ c / b`, with `≤` unfolded to a meet. -/
  dot_rres_adj : ∀ a b c, meet (dot a b) c = dot a b ↔ meet a (rres c b) = a

namespace LambekAlgebra
variable (A : LambekAlgebra)

/-- Left adjunction in `≤`-form: `a · b ≤ c ⟺ b ≤ a \ c`. -/
theorem dot_lres_le_iff (a b c : A.carrier) :
    A.le (A.dot a b) c ↔ A.le b (A.lres a c) := A.dot_lres_adj a b c

/-- Right adjunction in `≤`-form: `a · b ≤ c ⟺ a ≤ c / b`. -/
theorem dot_rres_le_iff (a b c : A.carrier) :
    A.le (A.dot a b) c ↔ A.le a (A.rres c b) := A.dot_rres_adj a b c

/-- **Left modus ponens** `a · (a \ c) ≤ c`: residuate reflexivity of `a \ c`. -/
theorem modus_ponens_left (a c : A.carrier) : A.le (A.dot a (A.lres a c)) c :=
  (A.dot_lres_le_iff a (A.lres a c) c).mpr (A.le_refl (A.lres a c))

/-- **Right modus ponens** `(c / b) · b ≤ c`. -/
theorem modus_ponens_right (c b : A.carrier) : A.le (A.dot (A.rres c b) b) c :=
  (A.dot_rres_le_iff (A.rres c b) b c).mpr (A.le_refl (A.rres c b))

/-- **Fusion is monotone in its left argument**: `a ≤ a' ⟹ a · b ≤ a' · b`. -/
theorem dot_mono_left (b : A.carrier) {a a' : A.carrier} (h : A.le a a') :
    A.le (A.dot a b) (A.dot a' b) :=
  (A.dot_rres_le_iff a b (A.dot a' b)).mpr
    (A.le_trans h ((A.dot_rres_le_iff a' b (A.dot a' b)).mp (A.le_refl _)))

/-- **Fusion is monotone in its right argument**: `b ≤ b' ⟹ a · b ≤ a · b'`. -/
theorem dot_mono_right (a : A.carrier) {b b' : A.carrier} (h : A.le b b') :
    A.le (A.dot a b) (A.dot a b') :=
  (A.dot_lres_le_iff a b (A.dot a b')).mpr
    (A.le_trans h ((A.dot_lres_le_iff a b' (A.dot a b')).mp (A.le_refl _)))

/-- **The left residual is monotone in its second (numerator) argument.**
`c ≤ c' ⟹ a \ c ≤ a \ c'`. From `a·(a\c) ≤ c ≤ c'`, residuate. -/
theorem lres_mono_right (a : A.carrier) {c c' : A.carrier} (h : A.le c c') :
    A.le (A.lres a c) (A.lres a c') := by
  apply (A.dot_lres_le_iff a (A.lres a c) c').mp
  exact A.le_trans (A.modus_ponens_left a c) h

/-- **The left residual is antitone in its first (denominator) argument.**
`a ≤ a' ⟹ a' \ c ≤ a \ c`. From `a·(a'\c) ≤ a'·(a'\c) ≤ c`, residuate. -/
theorem lres_antitone_left {a a' : A.carrier} (c : A.carrier) (h : A.le a a') :
    A.le (A.lres a' c) (A.lres a c) := by
  apply (A.dot_lres_le_iff a (A.lres a' c) c).mp
  exact A.le_trans (A.dot_mono_left (A.lres a' c) h) (A.modus_ponens_left a' c)

/-- **The right residual is monotone in its first (numerator) argument.**
`c ≤ c' ⟹ c / b ≤ c' / b`. From `(c/b)·b ≤ c ≤ c'`, residuate. -/
theorem rres_mono_left {c c' : A.carrier} (b : A.carrier) (h : A.le c c') :
    A.le (A.rres c b) (A.rres c' b) := by
  apply (A.dot_rres_le_iff (A.rres c b) b c').mp
  exact A.le_trans (A.modus_ponens_right c b) h

/-- **The right residual is antitone in its second (denominator) argument.**
`b ≤ b' ⟹ c / b' ≤ c / b`. From `(c/b')·b ≤ (c/b')·b' ≤ c`, residuate. -/
theorem rres_antitone_right (c : A.carrier) {b b' : A.carrier} (h : A.le b b') :
    A.le (A.rres c b') (A.rres c b) := by
  apply (A.dot_rres_le_iff (A.rres c b') b c).mp
  exact A.le_trans (A.dot_mono_right (A.rres c b') h) (A.modus_ponens_right c b')

/-! ### Unit laws

The two-sided unit `e` is a unit for the lattice order via the residuals: `e ≤ a \ a`
and `e ≤ a / a`, and `a \ a`, `a / a` reflect identity along the unit. -/

/-- **Unit reflexivity, left.** `e ≤ a \ a`: residuate `a · e = a ≤ a`. -/
theorem one_le_lres (a : A.carrier) : A.le A.e (A.lres a a) := by
  apply (A.dot_lres_le_iff a A.e a).mp
  rw [A.dot_one_right a]; exact A.le_refl a

/-- **Unit reflexivity, right.** `e ≤ a / a`: residuate `e · a = a ≤ a`. -/
theorem one_le_rres (a : A.carrier) : A.le A.e (A.rres a a) := by
  apply (A.dot_rres_le_iff A.e a a).mp
  rw [A.dot_one_left a]; exact A.le_refl a

/-- **The unit residuates trivially, left.** `e \ a = a` is below `a` and above `a`
(hence equal): `e \ a ≤ a` from `e·(e\a) = e\a` … and `a ≤ e \ a` by residuating
`e · a = a`. -/
theorem lres_one (a : A.carrier) : A.lres A.e a = a := by
  apply A.le_antisymm
  · -- e \ a ≤ a : from modus ponens `e · (e \ a) ≤ a`, rewriting `e · x = x`.
    have h := A.modus_ponens_left A.e a
    rw [A.dot_one_left (A.lres A.e a)] at h
    exact h
  · -- a ≤ e \ a : residuate `e · a = a ≤ a`.
    apply (A.dot_lres_le_iff A.e a a).mp
    rw [A.dot_one_left a]; exact A.le_refl a

/-- **The unit residuates trivially, right.** `a / e = a`. -/
theorem rres_one (a : A.carrier) : A.rres a A.e = a := by
  apply A.le_antisymm
  · have h := A.modus_ponens_right a A.e
    rw [A.dot_one_right (A.rres a A.e)] at h
    exact h
  · apply (A.dot_rres_le_iff a A.e a).mp
    rw [A.dot_one_right a]; exact A.le_refl a

/-! ### the bi-residuation bundle (substructural ⇔ algebraic) -/

/-- **The Lambek bi-residuation and its derived laws.** From a
`LambekAlgebra`'s two adjunction fields alone we obtain, as one bundle, the full
substructural↔algebraic correspondence — *the Lambek connectives ARE the residuated
operations*:

1. the **left adjunction** `a · b ≤ c ⟺ b ≤ a \ c`;
2. the **right adjunction** `a · b ≤ c ⟺ a ≤ c / b`;
3. **left modus ponens** `a · (a \ c) ≤ c`;
4. **right modus ponens** `(c / b) · b ≤ c`;
5. **fusion monotone left** `a ≤ a' ⟹ a · b ≤ a' · b`;
6. **fusion monotone right** `b ≤ b' ⟹ a · b ≤ a · b'`.

Every conjunct is derived above from the bi-residuation; nothing is re-postulated. -/
theorem lambek_biresiduation :
    (∀ a b c, A.le (A.dot a b) c ↔ A.le b (A.lres a c))
      ∧ (∀ a b c, A.le (A.dot a b) c ↔ A.le a (A.rres c b))
      ∧ (∀ a c, A.le (A.dot a (A.lres a c)) c)
      ∧ (∀ c b, A.le (A.dot (A.rres c b) b) c)
      ∧ (∀ (a a' b : A.carrier), A.le a a' → A.le (A.dot a b) (A.dot a' b))
      ∧ (∀ (a b b' : A.carrier), A.le b b' → A.le (A.dot a b) (A.dot a b')) :=
  ⟨A.dot_lres_le_iff, A.dot_rres_le_iff,
   A.modus_ponens_left, A.modus_ponens_right,
   fun _ _ b h => A.dot_mono_left b h, fun a _ _ h => A.dot_mono_right a h⟩

/-! ### the commutative collapse to a single implication -/

/-- **Commutativity collapses the two residuals into one implication.**
If `·` is **commutative** (`dot a b = dot b a`), then the left and right residuals
**coincide**, `a \ c = c / a` for all `a, c`, and the bi-residuation collapses to the
**single** adjunction `a · b ≤ c ⟺ b ≤ a \ c` — exactly the
integral-commutative-residuated / linear-logic FOUR case of
`ResiduatedLatticeStandalone` and `LinearLogicChu`.

We return, as one bundle:

1. **residual coincidence** `lres a c = rres c a` (proved by antisymmetry: each `≤`
   the other, both from the two adjunctions composed with commutativity);
2. the surviving **single adjunction** `a · b ≤ c ⟺ b ≤ a \ c`.

This is the commutative case the corpus flags
(`research-lambek-calculus.md`: "the two residuals coincide into a single
implication `→`"); Lawvere's `∃ ⊣ ∀` (`exists-left-adjoint-forall`) is its
categorical form, and Wurm (2012) proves concept-lattice completeness for the
*full* (non-commutative) calculus — documented, not formalized here. -/
theorem commutative_collapses_to_single_implication
    (comm : ∀ a b, A.dot a b = A.dot b a) :
    (∀ a c, A.lres a c = A.rres c a)
      ∧ (∀ a b c, A.le (A.dot a b) c ↔ A.le b (A.lres a c)) := by
  refine ⟨?_, A.dot_lres_le_iff⟩
  intro a c
  apply A.le_antisymm
  · -- a \ c ≤ c / a : use the right adjunction; need `a · (a\c) ≤ c`,
    -- i.e. `(a\c) · a ≤ c` after commuting, which is left modus ponens commuted.
    apply (A.dot_rres_le_iff (A.lres a c) a c).mp
    rw [comm (A.lres a c) a]
    exact A.modus_ponens_left a c
  · -- c / a ≤ a \ c : use the left adjunction; need `a · (c/a) ≤ c`,
    -- i.e. `(c/a) · a ≤ c` after commuting, which is right modus ponens.
    apply (A.dot_lres_le_iff a (A.rres c a) c).mp
    rw [comm a (A.rres c a)]
    exact A.modus_ponens_right c a

end LambekAlgebra

/-! ## Headlines at the spec paths

The two headline theorems are stated on a `LambekAlgebra` argument `A` and
re-exported here at the bare `RelMath.Lambek.*` namespace paths the spec names. -/

/-- **(`RelMath.Lambek.lambek_biresiduation`). The Lambek bi-residuation
bundle for any `LambekAlgebra A`: the two adjunctions, left/right modus ponens, and
two-sided fusion monotonicity — the substructural↔algebraic correspondence. -/
theorem lambek_biresiduation (A : LambekAlgebra) :
    (∀ a b c, A.le (A.dot a b) c ↔ A.le b (A.lres a c))
      ∧ (∀ a b c, A.le (A.dot a b) c ↔ A.le a (A.rres c b))
      ∧ (∀ a c, A.le (A.dot a (A.lres a c)) c)
      ∧ (∀ c b, A.le (A.dot (A.rres c b) b) c)
      ∧ (∀ (a a' b : A.carrier), A.le a a' → A.le (A.dot a b) (A.dot a' b))
      ∧ (∀ (a b b' : A.carrier), A.le b b' → A.le (A.dot a b) (A.dot a b')) :=
  A.lambek_biresiduation

/-- **(`RelMath.Lambek.commutative_collapses_to_single_implication`).
For any commutative `LambekAlgebra A`, the two residuals coincide (`a \ c = c / a`)
and the bi-residuation collapses to the single adjunction — the
integral-commutative-residuated / linear-logic case. -/
theorem commutative_collapses_to_single_implication (A : LambekAlgebra)
    (comm : ∀ a b, A.dot a b = A.dot b a) :
    (∀ a c, A.lres a c = A.rres c a)
      ∧ (∀ a b c, A.le (A.dot a b) c ↔ A.le b (A.lres a c)) :=
  A.commutative_collapses_to_single_implication comm

/-! ## A concrete instance: the trivial one-element Lambek algebra

The one-element carrier `Unit` carries a (vacuously commutative) Lambek algebra:
all operations land on `()`, every lattice and monoid law is `rfl`, and both
adjunctions hold because every `≤`-goal is the trivial `() ⊓ () = ()`. This
witnesses `LambekAlgebra` non-vacuously and, being commutative, also witnesses the
collapse theorem. -/

/-- The **trivial one-element Lambek algebra** over `Unit`. Every operation is
constantly `()`; `Unit`'s eta makes every component law `rfl` (each side reduces to
the unique element `()`), so every field is a closed proof term. -/
def Trivial : LambekAlgebra where
  carrier := Unit
  meet := fun _ _ => ()
  join := fun _ _ => ()
  meet_comm := fun _ _ => rfl
  meet_assoc := fun _ _ _ => rfl
  meet_idem := fun _ => rfl
  join_comm := fun _ _ => rfl
  join_assoc := fun _ _ _ => rfl
  join_idem := fun _ => rfl
  absorb_mj := fun _ _ => rfl
  absorb_jm := fun _ _ => rfl
  dot := fun _ _ => ()
  lres := fun _ _ => ()
  rres := fun _ _ => ()
  e := ()
  dot_assoc := fun _ _ _ => rfl
  dot_one_left := fun _ => rfl
  dot_one_right := fun _ => rfl
  dot_lres_adj := fun _ _ _ => Iff.rfl
  dot_rres_adj := fun _ _ _ => Iff.rfl

/-- `Trivial` is commutative, so it instantiates the collapse theorem. -/
theorem Trivial_comm : ∀ a b, Trivial.dot a b = Trivial.dot b a := fun _ _ => rfl

/-- Re-confirmation on the concrete instance: the residuals coincide and the single
adjunction survives, by the general `commutative_collapses_to_single_implication`. -/
example :
    (∀ a c, Trivial.lres a c = Trivial.rres c a)
      ∧ (∀ a b c, Trivial.le (Trivial.dot a b) c ↔ Trivial.le b (Trivial.lres a c)) :=
  Trivial.commutative_collapses_to_single_implication Trivial_comm

/-- Re-confirmation that the bi-residuation bundle holds on the concrete instance:
left modus ponens, projected out of the general bundle. -/
example : ∀ a c, Trivial.le (Trivial.dot a (Trivial.lres a c)) c :=
  Trivial.lambek_biresiduation.2.2.1

end Lambek
end RelMath
