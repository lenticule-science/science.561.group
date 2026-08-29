import Obsmetrologia.Closure.Ordinal.Arithmetic
import Obsmetrologia.Calculus.Order.SetNumberGraphTheory

/-!
# Ordinal.SignedTally — the group completion of the tally, on `Quot.sound` alone

`Language/Positing/Record.lean` carries the corpus's tally: `Record = ⟨pos, neg⟩`, a
told-true count beside a told-false count. It then proves, at length, that this carrier
cannot support a coboundary theory — `no_kTop`, `no_tTop`, `no_tBot`, and
`deltaAdd_eq_kBot_iff`, whose docstring states the obstruction exactly:

> `Record` has no subtraction to cancel repeated terms.

That diagnosis is correct and the impossibility theorems stand. What follows from it is
not that signed quantity must be imported: it is that the tally must be **completed**. A
pair of tallies is quotiented by the relation that only their *difference* is witnessable,

    ⟨p, n⟩ ≈ ⟨p', n'⟩   ⟺   p + n' = p' + n

and the resulting object has the additive inverse `Record` lacks (`add_left_neg`). This
is the Grothendieck completion of the tally monoid, and it is the corpus's ℤ.

Two things make it worth building rather than borrowing:

**Axiomatically**, a quotient costs `Quot.sound` and nothing else. Every declaration in
this module depends on `Quot.sound` alone or on no axiom at all — where core `Int`'s
`le_total`, `le_trans`, `le_refl`, `mul_comm`, `mul_pos` and `le_antisymm` each carry
`propext`, which the whole rational and real tower has been inheriting from below.

**Theoretically**, the quotient is not a construction convenience. Marks are opaque: a
witness cannot be told apart from the same witness counted again, so `⟨3,1⟩` and `⟨2,0⟩`
are not two states that happen to agree numerically — they are indistinguishable, and the
equivalence relation says exactly that. Sign is not a primitive here; it is what remains
of two tallies once the unwitnessable part is quotiented away. The order is carried on
`Bool` rather than `Prop` for the same reason `Rat.le` is: lifting a `Prop` through a
quotient owes an equality of `Prop`s, which is `propext` and nothing else, whereas lifting
a `Bool` owes an equality of data.

Ordinal addition and multiplication are not commutative, so this completion is taken over
`Natural` — the finite fragment, where `Ordinal/Arithmetic.lean` proves they are, and
where addition cancels.
-/

namespace Obsmetrologia
namespace Ord

namespace Natural

/-! ## (A) Rearrangement on our ℕ

The two four-term shuffles the completion needs, proved from `Natural`'s own associativity
and commutativity rather than transported — our ℕ doing its own algebra. -/

/-- **Interchange**: sums pair up across the two brackets. -/
theorem interchange (a b c d : Natural) : (a + b) + (c + d) = (a + c) + (b + d) := by
  calc (a + b) + (c + d)
      = a + (b + (c + d)) := add_assoc a b (c + d)
    _ = a + ((b + c) + d) := by rw [add_assoc b c d]
    _ = a + ((c + b) + d) := by rw [add_comm b c]
    _ = a + (c + (b + d)) := by rw [add_assoc c b d]
    _ = (a + c) + (b + d) := (add_assoc a c (b + d)).symm

/-- **Crosswise**: the outer and inner terms swap partners — the shuffle that makes a
cross-sum equivalence transitive. -/
theorem crosswise (a b c d : Natural) : (a + b) + (c + d) = (a + d) + (c + b) := by
  calc (a + b) + (c + d)
      = a + (b + (c + d)) := add_assoc a b (c + d)
    _ = a + ((b + c) + d) := by rw [add_assoc b c d]
    _ = a + ((c + b) + d) := by rw [add_comm b c]
    _ = a + (d + (c + b)) := by rw [add_comm (c + b) d]
    _ = (a + d) + (c + b) := (add_assoc a d (c + b)).symm

/-- **The four-term shuffle a triple product needs.** Expanding `(ab)c` and `a(bc)` over
the signed tally yields the same four monomials in two different pairings. -/
theorem shuffle4 (p q r s : Natural) : (p + q) + (r + s) = (p + r) + (s + q) := by
  rw [interchange p q r s, add_comm q s]

/-- Monotonicity on the left, from monotonicity on the right and commutativity. -/
theorem add_le_add_left {m n : Natural} (h : m ≤ n) (k : Natural) : k + m ≤ k + n := by
  rw [add_comm k m, add_comm k n]; exact add_le_add_right h k

/-- **Two inequalities add.** Needed to combine the two hypotheses of transitivity for the
completed order. -/
theorem add_le_add {m n p q : Natural} (h₁ : m ≤ n) (h₂ : p ≤ q) : m + p ≤ n + q :=
  le_trans (add_le_add_right h₁ p) (add_le_add_left h₂ n)

end Natural

/-! ## (B) The tally pair and the witnessability relation -/

/-- A pair of tallies over our ℕ — told-for beside told-against, the shape of
`Positing.Record` lifted onto `Natural`. -/
structure TallyPair where
  /-- The told-true tally. -/
  pos : Natural
  /-- The told-false tally. -/
  neg : Natural

namespace TallyPair

theorem ext : ∀ {a b : TallyPair}, a.pos = b.pos → a.neg = b.neg → a = b
  | ⟨_, _⟩, ⟨_, _⟩, rfl, rfl => rfl

/-- **Only the difference is witnessable.** Two tally pairs are indistinguishable when
their cross-sums agree — the statement, as a relation, that a mark counted again is not a
second mark. -/
def equiv (a b : TallyPair) : Prop := a.pos + b.neg = b.pos + a.neg

theorem equiv_refl (a : TallyPair) : equiv a a := rfl

theorem equiv_symm {a b : TallyPair} (h : equiv a b) : equiv b a := h.symm

theorem equiv_trans {a b c : TallyPair} (hab : equiv a b) (hbc : equiv b c) : equiv a c := by
  apply Natural.add_left_cancel (m := b.pos + b.neg)
  calc (b.pos + b.neg) + (a.pos + c.neg)
      = (a.pos + c.neg) + (b.pos + b.neg) := Natural.add_comm _ _
    _ = (a.pos + b.neg) + (b.pos + c.neg) := (Natural.crosswise a.pos b.neg b.pos c.neg).symm
    _ = (b.pos + a.neg) + (c.pos + b.neg) := by rw [hab, hbc]
    _ = (b.pos + b.neg) + (c.pos + a.neg) := Natural.crosswise b.pos a.neg c.pos b.neg

end TallyPair

/-- The setoid of tally pairs under witnessability. -/
def tallySetoid : Setoid TallyPair :=
  ⟨TallyPair.equiv, ⟨TallyPair.equiv_refl, TallyPair.equiv_symm, TallyPair.equiv_trans⟩⟩

/-- **The signed tally** — the corpus's ℤ, the group completion of the tally monoid. -/
def SignedTally : Type := Quotient tallySetoid

namespace SignedTally

/-- A tally pair, read as a signed tally. -/
def mk (a : TallyPair) : SignedTally := Quotient.mk tallySetoid a

theorem sound {a b : TallyPair} (h : TallyPair.equiv a b) : mk a = mk b := Quotient.sound h

@[elab_as_elim]
theorem ind {motive : SignedTally → Prop} (h : ∀ a : TallyPair, motive (mk a)) :
    ∀ s, motive s := fun s => Quotient.inductionOn s h

@[elab_as_elim]
theorem ind₂ {motive : SignedTally → SignedTally → Prop}
    (h : ∀ a b : TallyPair, motive (mk a) (mk b)) : ∀ s t, motive s t :=
  fun s t => Quotient.inductionOn₂ s t h

/-! ## (C) Addition and negation -/

/-- Representative addition: tallies add side by side. -/
def TallyPair.plus (a b : TallyPair) : TallyPair := ⟨a.pos + b.pos, a.neg + b.neg⟩

/-- Representative negation: **the two tallies swap**. Told-for becomes told-against.
Sign reversal is not an operation on a magnitude here — it is the exchange of the two
sides of the witness. -/
def TallyPair.invert (a : TallyPair) : TallyPair := ⟨a.neg, a.pos⟩

theorem TallyPair.plus_respects {a a' b b' : TallyPair}
    (ha : TallyPair.equiv a a') (hb : TallyPair.equiv b b') :
    TallyPair.equiv (TallyPair.plus a b) (TallyPair.plus a' b') := by
  show (a.pos + b.pos) + (a'.neg + b'.neg) = (a'.pos + b'.pos) + (a.neg + b.neg)
  calc (a.pos + b.pos) + (a'.neg + b'.neg)
      = (a.pos + a'.neg) + (b.pos + b'.neg) := Natural.interchange a.pos b.pos a'.neg b'.neg
    _ = (a'.pos + a.neg) + (b'.pos + b.neg) := by rw [ha, hb]
    _ = (a'.pos + b'.pos) + (a.neg + b.neg) := Natural.interchange a'.pos a.neg b'.pos b.neg

theorem TallyPair.invert_respects {a a' : TallyPair} (h : TallyPair.equiv a a') :
    TallyPair.equiv (TallyPair.invert a) (TallyPair.invert a') := by
  show a.neg + a'.pos = a'.neg + a.pos
  rw [Natural.add_comm a.neg a'.pos, Natural.add_comm a'.neg a.pos]
  exact h.symm

def add : SignedTally → SignedTally → SignedTally :=
  Quotient.lift₂ (fun a b => mk (TallyPair.plus a b))
    (fun _ _ _ _ ha hb => sound (TallyPair.plus_respects ha hb))

def neg : SignedTally → SignedTally :=
  Quotient.lift (fun a => mk (TallyPair.invert a))
    (fun _ _ h => sound (TallyPair.invert_respects h))

/-- Zero — the balanced witness, nothing told either way. -/
def zero : SignedTally := mk ⟨Natural.zero, Natural.zero⟩

/-- One — a single mark told true. -/
def one : SignedTally := mk ⟨Natural.one, Natural.zero⟩

instance : Add SignedTally := ⟨add⟩
instance : Neg SignedTally := ⟨neg⟩

theorem add_comm (s t : SignedTally) : s + t = t + s := by
  refine ind₂ (fun a b => ?_) s t
  apply sound
  show (a.pos + b.pos) + (b.neg + a.neg) = (b.pos + a.pos) + (a.neg + b.neg)
  rw [Natural.add_comm a.pos b.pos, Natural.add_comm b.neg a.neg]

theorem add_assoc (s t u : SignedTally) : s + t + u = s + (t + u) := by
  refine ind (fun a => ?_) s
  refine ind (fun b => ?_) t
  refine ind (fun c => ?_) u
  apply sound
  show ((a.pos + b.pos) + c.pos) + (a.neg + (b.neg + c.neg))
      = (a.pos + (b.pos + c.pos)) + ((a.neg + b.neg) + c.neg)
  rw [Natural.add_assoc a.pos b.pos c.pos, Natural.add_assoc a.neg b.neg c.neg]

theorem add_zero (s : SignedTally) : s + zero = s := by
  refine ind (fun a => ?_) s
  apply sound
  show (a.pos + Natural.zero) + a.neg = a.pos + (a.neg + Natural.zero)
  rw [Natural.add_zero, Natural.add_zero]

theorem zero_add (s : SignedTally) : zero + s = s := by rw [add_comm]; exact add_zero s

/-- **The additive inverse `Record` provably lacks.** `Record`'s `no_kTop`/`no_tTop`/
`no_tBot` show the uncompleted tally has no cancellation, and `deltaAdd_eq_kBot_iff` shows
what that costs: the additive coboundary vanishes only degenerately. Here it exists, and
it costs `Quot.sound`. -/
theorem add_left_neg (s : SignedTally) : -s + s = zero := by
  refine ind (fun a => ?_) s
  apply sound
  show (a.neg + a.pos) + Natural.zero = Natural.zero + (a.pos + a.neg)
  rw [Natural.add_zero, Natural.zero_add, Natural.add_comm a.neg a.pos]

theorem add_right_neg (s : SignedTally) : s + -s = zero := by
  rw [add_comm]; exact add_left_neg s

/-! ## (D) Multiplication

The product of two differences, expanded: `(p−n)(p'−n') = (pp' + nn') − (pn' + np')`. -/

/-- Representative multiplication. -/
def TallyPair.times (a b : TallyPair) : TallyPair :=
  ⟨a.pos * b.pos + a.neg * b.neg, a.pos * b.neg + a.neg * b.pos⟩

theorem TallyPair.times_comm (a b : TallyPair) :
    TallyPair.times a b = TallyPair.times b a := by
  refine TallyPair.ext ?_ ?_
  · show a.pos * b.pos + a.neg * b.neg = b.pos * a.pos + b.neg * a.neg
    rw [Natural.mul_comm a.pos b.pos, Natural.mul_comm a.neg b.neg]
  · show a.pos * b.neg + a.neg * b.pos = b.pos * a.neg + b.neg * a.pos
    rw [Natural.mul_comm a.pos b.neg, Natural.mul_comm a.neg b.pos, Natural.add_comm]

theorem TallyPair.times_respects_left {a a' b : TallyPair} (h : TallyPair.equiv a a') :
    TallyPair.equiv (TallyPair.times a b) (TallyPair.times a' b) := by
  show (a.pos * b.pos + a.neg * b.neg) + (a'.pos * b.neg + a'.neg * b.pos)
      = (a'.pos * b.pos + a'.neg * b.neg) + (a.pos * b.neg + a.neg * b.pos)
  calc (a.pos * b.pos + a.neg * b.neg) + (a'.pos * b.neg + a'.neg * b.pos)
      = (a.pos * b.pos + a'.neg * b.pos) + (a'.pos * b.neg + a.neg * b.neg) :=
        Natural.crosswise _ _ _ _
    _ = (a.pos + a'.neg) * b.pos + (a'.pos + a.neg) * b.neg := by
        rw [Natural.right_distrib, Natural.right_distrib]
    _ = (a'.pos + a.neg) * b.pos + (a.pos + a'.neg) * b.neg := by rw [h]
    _ = (a'.pos * b.pos + a.neg * b.pos) + (a.pos * b.neg + a'.neg * b.neg) := by
        rw [Natural.right_distrib, Natural.right_distrib]
    _ = (a'.pos * b.pos + a'.neg * b.neg) + (a.pos * b.neg + a.neg * b.pos) :=
        Natural.crosswise _ _ _ _

theorem TallyPair.times_respects {a a' b b' : TallyPair}
    (ha : TallyPair.equiv a a') (hb : TallyPair.equiv b b') :
    TallyPair.equiv (TallyPair.times a b) (TallyPair.times a' b') :=
  TallyPair.equiv_trans (TallyPair.times_respects_left (b := b) ha)
    (by
      rw [TallyPair.times_comm a' b, TallyPair.times_comm a' b']
      exact TallyPair.times_respects_left (b := a') hb)

def mul : SignedTally → SignedTally → SignedTally :=
  Quotient.lift₂ (fun a b => mk (TallyPair.times a b))
    (fun _ _ _ _ ha hb => sound (TallyPair.times_respects ha hb))

instance : Mul SignedTally := ⟨mul⟩

theorem mul_comm (s t : SignedTally) : s * t = t * s := by
  refine ind₂ (fun a b => ?_) s t
  exact congrArg mk (TallyPair.times_comm a b)

theorem mul_one (s : SignedTally) : s * one = s := by
  refine ind (fun a => ?_) s
  apply sound
  show (a.pos * Natural.one + a.neg * Natural.zero) + a.neg
      = a.pos + (a.pos * Natural.zero + a.neg * Natural.one)
  rw [Natural.mul_one, Natural.mul_zero, Natural.mul_zero, Natural.mul_one,
    Natural.add_zero, Natural.zero_add]

theorem one_mul (s : SignedTally) : one * s = s := by rw [mul_comm]; exact mul_one s

theorem mul_zero (s : SignedTally) : s * zero = zero := by
  refine ind (fun a => ?_) s
  refine congrArg mk (TallyPair.ext ?_ ?_) <;>
    · show a.pos * Natural.zero + a.neg * Natural.zero = Natural.zero
      rw [Natural.mul_zero, Natural.mul_zero, Natural.add_zero]

theorem zero_mul (s : SignedTally) : zero * s = zero := by rw [mul_comm]; exact mul_zero s

/-- Distributivity already holds **on representatives** — no quotient needed, both sides
build the same tally pair. -/
theorem TallyPair.times_plus_left (a b c : TallyPair) :
    TallyPair.times a (TallyPair.plus b c)
      = TallyPair.plus (TallyPair.times a b) (TallyPair.times a c) := by
  refine TallyPair.ext ?_ ?_
  · show a.pos * (b.pos + c.pos) + a.neg * (b.neg + c.neg)
        = (a.pos * b.pos + a.neg * b.neg) + (a.pos * c.pos + a.neg * c.neg)
    rw [Natural.left_distrib, Natural.left_distrib]
    exact Natural.interchange _ _ _ _
  · show a.pos * (b.neg + c.neg) + a.neg * (b.pos + c.pos)
        = (a.pos * b.neg + a.neg * b.pos) + (a.pos * c.neg + a.neg * c.pos)
    rw [Natural.left_distrib, Natural.left_distrib]
    exact Natural.interchange _ _ _ _

theorem left_distrib (s t u : SignedTally) : s * (t + u) = s * t + s * u := by
  refine ind (fun a => ?_) s
  refine ind (fun b => ?_) t
  refine ind (fun c => ?_) u
  exact congrArg mk (TallyPair.times_plus_left a b c)

theorem right_distrib (s t u : SignedTally) : (s + t) * u = s * u + t * u := by
  rw [mul_comm, left_distrib, mul_comm u s, mul_comm u t]

/-- Associativity also holds **on representatives**: expanding either bracketing gives the
same four monomials, paired differently. -/
theorem TallyPair.times_assoc (a b c : TallyPair) :
    TallyPair.times (TallyPair.times a b) c = TallyPair.times a (TallyPair.times b c) := by
  refine TallyPair.ext ?_ ?_
  · show (a.pos * b.pos + a.neg * b.neg) * c.pos + (a.pos * b.neg + a.neg * b.pos) * c.neg
        = a.pos * (b.pos * c.pos + b.neg * c.neg) + a.neg * (b.pos * c.neg + b.neg * c.pos)
    rw [Natural.right_distrib, Natural.right_distrib, Natural.left_distrib,
      Natural.left_distrib, ← Natural.mul_assoc, ← Natural.mul_assoc, ← Natural.mul_assoc,
      ← Natural.mul_assoc]
    exact Natural.shuffle4 _ _ _ _
  · show (a.pos * b.pos + a.neg * b.neg) * c.neg + (a.pos * b.neg + a.neg * b.pos) * c.pos
        = a.pos * (b.pos * c.neg + b.neg * c.pos) + a.neg * (b.pos * c.pos + b.neg * c.neg)
    rw [Natural.right_distrib, Natural.right_distrib, Natural.left_distrib,
      Natural.left_distrib, ← Natural.mul_assoc, ← Natural.mul_assoc, ← Natural.mul_assoc,
      ← Natural.mul_assoc]
    exact Natural.shuffle4 _ _ _ _

theorem mul_assoc (s t u : SignedTally) : s * t * u = s * (t * u) := by
  refine ind (fun a => ?_) s
  refine ind (fun b => ?_) t
  refine ind (fun c => ?_) u
  exact congrArg mk (TallyPair.times_assoc a b c)

/-! ## (E) The order

Carried on `Bool`. Lifting a `Prop` through the quotient would owe an equality of `Prop`s
— `propext` and nothing else; lifting a `Bool` owes an equality of data. -/

/-- Representative order: `a ≤ b` when the cross-sums compare. -/
def TallyPair.leB (a b : TallyPair) : Bool := decide (a.pos + b.neg ≤ b.pos + a.neg)

theorem TallyPair.le_of_le {a a' b b' : TallyPair}
    (ha : TallyPair.equiv a a') (hb : TallyPair.equiv b b')
    (H : a.pos + b.neg ≤ b.pos + a.neg) : a'.pos + b'.neg ≤ b'.pos + a'.neg := by
  refine Natural.le_of_add_le_add_left (m := a.neg + b.neg) ?_
  have hl : (a.neg + b.neg) + (a'.pos + b'.neg) = (a.pos + b.neg) + (a'.neg + b'.neg) := by
    calc (a.neg + b.neg) + (a'.pos + b'.neg)
        = (a.neg + a'.pos) + (b.neg + b'.neg) := Natural.interchange _ _ _ _
      _ = (a.pos + a'.neg) + (b.neg + b'.neg) := by
          rw [Natural.add_comm a.neg a'.pos, ha]
      _ = (a.pos + b.neg) + (a'.neg + b'.neg) := Natural.interchange _ _ _ _
  have hr : (a.neg + b.neg) + (b'.pos + a'.neg) = (b.pos + a.neg) + (a'.neg + b'.neg) := by
    calc (a.neg + b.neg) + (b'.pos + a'.neg)
        = (a.neg + a'.neg) + (b'.pos + b.neg) := Natural.crosswise _ _ _ _
      _ = (a.neg + a'.neg) + (b.pos + b'.neg) := by rw [hb]
      _ = (a.neg + b.pos) + (a'.neg + b'.neg) := Natural.interchange _ _ _ _
      _ = (b.pos + a.neg) + (a'.neg + b'.neg) := by rw [Natural.add_comm a.neg b.pos]
  rw [hl, hr]
  exact Natural.add_le_add_right H _

theorem TallyPair.leB_respects {a a' b b' : TallyPair}
    (ha : TallyPair.equiv a a') (hb : TallyPair.equiv b b') :
    TallyPair.leB a b = TallyPair.leB a' b' :=
  Discrete.decide_eq_decide_of_imp
    (TallyPair.le_of_le ha hb)
    (TallyPair.le_of_le (TallyPair.equiv_symm ha) (TallyPair.equiv_symm hb))

/-- The order, as a `Bool`-valued lift. -/
def leB : SignedTally → SignedTally → Bool :=
  Quotient.lift₂ TallyPair.leB (fun _ _ _ _ ha hb => TallyPair.leB_respects ha hb)

/-- The order on signed tallies. -/
def le (s t : SignedTally) : Prop := leB s t = true

instance : LE SignedTally := ⟨le⟩

instance decidableLe (s t : SignedTally) : Decidable (s ≤ t) :=
  inferInstanceAs (Decidable (leB s t = true))

theorem mk_le (a b : TallyPair) : mk a ≤ mk b ↔ a.pos + b.neg ≤ b.pos + a.neg :=
  Iff.intro of_decide_eq_true decide_eq_true

theorem le_refl (s : SignedTally) : s ≤ s := by
  refine ind (fun a => ?_) s
  exact (mk_le a a).mpr (Natural.le_refl _)

theorem le_trans {s t u : SignedTally} : s ≤ t → t ≤ u → s ≤ u := by
  refine ind (fun a => ?_) s
  refine ind (fun b => ?_) t
  refine ind (fun c => ?_) u
  intro h₁ h₂
  refine (mk_le a c).mpr (Natural.le_of_add_le_add_left (m := b.pos + b.neg) ?_)
  have hsum : (a.pos + b.neg) + (b.pos + c.neg) ≤ (b.pos + a.neg) + (c.pos + b.neg) :=
    Natural.add_le_add ((mk_le a b).mp h₁) ((mk_le b c).mp h₂)
  calc (b.pos + b.neg) + (a.pos + c.neg)
      = (a.pos + c.neg) + (b.pos + b.neg) := Natural.add_comm _ _
    _ = (a.pos + b.neg) + (b.pos + c.neg) := (Natural.crosswise a.pos b.neg b.pos c.neg).symm
    _ ≤ (b.pos + a.neg) + (c.pos + b.neg) := hsum
    _ = (b.pos + b.neg) + (c.pos + a.neg) := Natural.crosswise b.pos a.neg c.pos b.neg

theorem le_antisymm {s t : SignedTally} : s ≤ t → t ≤ s → s = t := by
  refine ind₂ (fun a b => ?_) s t
  intro h₁ h₂
  exact sound (Natural.le_antisymm ((mk_le a b).mp h₁) ((mk_le b a).mp h₂))

theorem le_total (s t : SignedTally) : s ≤ t ∨ t ≤ s := by
  refine ind₂ (fun a b => ?_) s t
  rcases Natural.le_total (a.pos + b.neg) (b.pos + a.neg) with h | h
  · exact Or.inl ((mk_le a b).mpr h)
  · exact Or.inr ((mk_le b a).mpr h)

/-! ## (F) Our ℕ sits inside, and the completion is proper -/

/-- Our ℕ read as a signed tally: told-for only, nothing told against. -/
def ofNatural (n : Natural) : SignedTally := mk ⟨n, Natural.zero⟩

theorem ofNatural_add (m n : Natural) :
    ofNatural (m + n) = ofNatural m + ofNatural n :=
  congrArg mk (TallyPair.ext rfl (Natural.add_zero Natural.zero).symm)

theorem ofNatural_mul (m n : Natural) :
    ofNatural (m * n) = ofNatural m * ofNatural n := by
  refine congrArg mk (TallyPair.ext ?_ ?_)
  · show m * n = m * n + Natural.zero * Natural.zero
    rw [Natural.zero_mul, Natural.add_zero]
  · show Natural.zero = m * Natural.zero + Natural.zero * n
    rw [Natural.mul_zero, Natural.zero_mul, Natural.add_zero]

/-- **The embedding is injective** — completing the tally loses nothing. Proved through the
antisymmetry of the completed order rather than through `Quotient.exact`: the order is
`Bool`-carried and so axiom-free, whereas `Quotient.exact` costs `propext`. This is the
same route `Ord.ofNat_injective` takes upstream. -/
theorem ofNatural_injective {m n : Natural} (h : ofNatural m = ofNatural n) : m = n := by
  have h₁ : ofNatural m ≤ ofNatural n := h ▸ le_refl (ofNatural m)
  have h₂ : ofNatural n ≤ ofNatural m := h ▸ le_refl (ofNatural m)
  have k₁ := (mk_le ⟨m, Natural.zero⟩ ⟨n, Natural.zero⟩).mp h₁
  have k₂ := (mk_le ⟨n, Natural.zero⟩ ⟨m, Natural.zero⟩).mp h₂
  rw [Natural.add_zero, Natural.add_zero] at k₁ k₂
  exact Natural.le_antisymm k₁ k₂

/-- **Every signed tally has an additive inverse.** Stated as the existence claim
`Record.no_kTop`/`no_tTop`/`no_tBot` refute for the uncompleted tally, and
`deltaAdd_eq_kBot_iff` shows the cost of: an alternating-sum coboundary needs cancellation,
and the uncompleted tally has none. The completion supplies it, for `Quot.sound`. -/
theorem exists_add_inverse (s : SignedTally) : ∃ t, s + t = zero :=
  ⟨-s, add_right_neg s⟩

/-- **The completion is proper**: `-1` is not the image of any natural. Together with
`ofNatural_injective` this says the signed tally is a strict extension of our ℕ — the
told-against side is genuinely new, not a relabelling. -/
theorem neg_one_not_natural : ¬ ∃ n : Natural, ofNatural n = -one := by
  rintro ⟨n, hn⟩
  have h₁ : ofNatural n ≤ -one := hn ▸ le_refl (ofNatural n)
  have k₁ := (mk_le ⟨n, Natural.zero⟩ ⟨Natural.zero, Natural.one⟩).mp h₁
  rw [Natural.zero_add] at k₁
  have hz := Natural.le_iff_toNatCore_le.mp k₁
  rw [Natural.toNatCore_add, Natural.toNatCore_one] at hz
  exact Nat.not_succ_le_zero _ hz

end SignedTally
end Ord
end Obsmetrologia
