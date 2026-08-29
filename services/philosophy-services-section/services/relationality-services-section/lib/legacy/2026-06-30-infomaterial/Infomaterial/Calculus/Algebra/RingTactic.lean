import Lean.Elab.Tactic
import Infomaterial.Calculus.Algebra.Ring

/-!
# Algebra.RingTactic

A small reflective polynomial normalizer for bundled commutative rings.
-/

namespace Infomaterial
namespace Algebra

/-- Reflected polynomial expressions over a context of ring elements. -/
inductive PolyExpr where
  | atom : Nat -> PolyExpr
  | lit : Int -> PolyExpr
  | add : PolyExpr -> PolyExpr -> PolyExpr
  | mul : PolyExpr -> PolyExpr -> PolyExpr
  | neg : PolyExpr -> PolyExpr
deriving Repr, DecidableEq

namespace CommRing

variable (R : CommRing)

/-- The natural-number scalar `n • 1` in a bundled commutative ring. -/
def ofNat : Nat -> R.carrier
  | 0 => R.zero
  | n + 1 => R.add (ofNat n) R.one

/-- The integer scalar `z • 1` in a bundled commutative ring. -/
def ofInt : Int -> R.carrier
  | Int.ofNat n => ofNat R n
  | Int.negSucc n => R.neg (ofNat R (n + 1))

@[simp] theorem ofNat_zero : ofNat R 0 = R.zero := rfl

@[simp] theorem ofNat_succ (n : Nat) : ofNat R (n + 1) = R.add (ofNat R n) R.one := rfl

/-- `0 : Int` maps to ring zero. -/
@[simp] theorem ofInt_zero : ofInt R 0 = R.zero := rfl

/-- `1 : Int` maps to ring one. -/
@[simp] theorem ofInt_one : ofInt R 1 = R.one := by
  show R.add R.zero R.one = R.one
  exact R.zero_add R.one

/-- Natural scalars preserve addition. -/
theorem ofNat_add (m n : Nat) :
    ofNat R (m + n) = R.add (ofNat R m) (ofNat R n) := by
  induction m with
  | zero =>
      simp [Nat.zero_add, ofNat_zero, R.zero_add]
  | succ m ih =>
      rw [Nat.succ_add, ofNat_succ, ih, ofNat_succ]
      calc R.add (R.add (ofNat R m) (ofNat R n)) R.one
          = R.add (ofNat R m) (R.add (ofNat R n) R.one) :=
              R.add_assoc (ofNat R m) (ofNat R n) R.one
        _ = R.add (ofNat R m) (R.add R.one (ofNat R n)) := by
              rw [R.add_comm (ofNat R n) R.one]
        _ = R.add (R.add (ofNat R m) R.one) (ofNat R n) :=
              (R.add_assoc (ofNat R m) R.one (ofNat R n)).symm

/-- Natural scalars preserve multiplication. -/
theorem ofNat_mul (m n : Nat) :
    ofNat R (m * n) = R.mul (ofNat R m) (ofNat R n) := by
  induction m with
  | zero =>
      simp [Nat.zero_mul, ofNat_zero, R.zero_mul]
  | succ m ih =>
      rw [Nat.succ_mul, ofNat_add, ofNat_succ, ih, R.right_distrib,
        R.one_mul]

/-- Negating an integer scalar agrees with the ring negation. -/
theorem ofInt_neg (z : Int) :
    ofInt R (-z) = R.neg (ofInt R z) := by
  cases z with
  | ofNat n =>
      cases n with
      | zero =>
          simp [ofInt_zero, Ring.neg_zero]
      | succ n =>
          rfl
  | negSucc n =>
      show ofInt R (Int.ofNat (n + 1)) = R.neg (R.neg (ofNat R (n + 1)))
      exact (Ring.neg_neg R.toRing (ofNat R (n + 1))).symm

/-- `(a + b) - a = b` in the additive group of a ring. -/
theorem add_add_neg_left (a b : R.carrier) :
    R.add (R.add a b) (R.neg a) = b := by
  calc R.add (R.add a b) (R.neg a)
      = R.add a (R.add b (R.neg a)) := R.add_assoc a b (R.neg a)
    _ = R.add a (R.add (R.neg a) b) := by rw [R.add_comm b (R.neg a)]
    _ = R.add (R.add a (R.neg a)) b := (R.add_assoc a (R.neg a) b).symm
    _ = R.add R.zero b := by rw [Ring.add_right_neg]
    _ = b := R.zero_add b

/-- `a - (a + b) = -b` in the additive group of a ring. -/
theorem add_neg_add_left (a b : R.carrier) :
    R.add a (R.neg (R.add a b)) = R.neg b := by
  apply Ring.add_left_cancel R.toRing (a := b)
  calc R.add b (R.add a (R.neg (R.add a b)))
      = R.add (R.add a b) (R.neg (R.add a b)) := by
          calc R.add b (R.add a (R.neg (R.add a b)))
              = R.add (R.add b a) (R.neg (R.add a b)) :=
                  (R.add_assoc b a (R.neg (R.add a b))).symm
            _ = R.add (R.add a b) (R.neg (R.add a b)) := by rw [R.add_comm b a]
    _ = R.zero := Ring.add_right_neg R.toRing (R.add a b)
    _ = R.add b (R.neg b) := (Ring.add_right_neg R.toRing b).symm

/-- Negation distributes over addition in the additive group of a ring. -/
theorem neg_add (a b : R.carrier) :
    R.neg (R.add a b) = R.add (R.neg a) (R.neg b) := by
  apply Ring.add_left_cancel R.toRing (a := R.add a b)
  calc R.add (R.add a b) (R.neg (R.add a b))
      = R.zero := Ring.add_right_neg R.toRing (R.add a b)
    _ = R.add (R.add a b) (R.add (R.neg a) (R.neg b)) := by
        have hzero :
            R.add (R.add a (R.neg a)) (R.add b (R.neg b)) = R.zero := by
          calc R.add (R.add a (R.neg a)) (R.add b (R.neg b))
              = R.add R.zero (R.add b (R.neg b)) := by rw [Ring.add_right_neg]
            _ = R.add b (R.neg b) := R.zero_add (R.add b (R.neg b))
            _ = R.zero := Ring.add_right_neg R.toRing b
        calc R.zero
            = R.add (R.add a (R.neg a)) (R.add b (R.neg b)) := hzero.symm
          _ = R.add (R.add a b) (R.add (R.neg a) (R.neg b)) := by
              calc R.add (R.add a (R.neg a)) (R.add b (R.neg b))
                  = R.add a (R.add (R.neg a) (R.add b (R.neg b))) :=
                      R.add_assoc a (R.neg a) (R.add b (R.neg b))
                _ = R.add a (R.add b (R.add (R.neg a) (R.neg b))) := by
                      rw [(R.add_assoc (R.neg a) b (R.neg b)).symm,
                        R.add_comm (R.neg a) b,
                        R.add_assoc b (R.neg a) (R.neg b)]
                _ = R.add (R.add a b) (R.add (R.neg a) (R.neg b)) :=
                      (R.add_assoc a b (R.add (R.neg a) (R.neg b))).symm

/-- The scalar of a natural subtraction is the corresponding ring difference. -/
theorem ofInt_subNatNat (m n : Nat) :
    ofInt R (Int.subNatNat m n) = R.add (ofNat R m) (R.neg (ofNat R n)) := by
  refine Int.subNatNat_elim m n
    (fun m n z => ofInt R z = R.add (ofNat R m) (R.neg (ofNat R n))) ?pos ?neg
  · intro i n
    rw [ofNat_add]
    exact (add_add_neg_left R (ofNat R n) (ofNat R i)).symm
  · intro i m
    change R.neg (R.add (ofNat R i) R.one) =
      R.add (ofNat R m) (R.neg (ofNat R (m + (i + 1))))
    rw [ofNat_add]
    change R.neg (R.add (ofNat R i) R.one) =
      R.add (ofNat R m) (R.neg (R.add (ofNat R m) (R.add (ofNat R i) R.one)))
    exact (add_neg_add_left R (ofNat R m) (R.add (ofNat R i) R.one)).symm

/-- Integer scalars preserve addition. -/
theorem ofInt_add (a b : Int) :
    ofInt R (a + b) = R.add (ofInt R a) (ofInt R b) := by
  cases a with
  | ofNat m =>
      cases b with
      | ofNat n =>
          change ofInt R (Int.ofNat (m + n)) = R.add (ofNat R m) (ofNat R n)
          exact ofNat_add R m n
      | negSucc n =>
          change ofInt R (Int.subNatNat m (n + 1))
              = R.add (ofNat R m) (R.neg (ofNat R (n + 1)))
          exact ofInt_subNatNat R m (n + 1)
  | negSucc m =>
      cases b with
      | ofNat n =>
          change ofInt R (Int.subNatNat n (m + 1))
              = R.add (R.neg (ofNat R (m + 1))) (ofNat R n)
          calc ofInt R (Int.subNatNat n (m + 1))
              = R.add (ofNat R n) (R.neg (ofNat R (m + 1))) :=
                  ofInt_subNatNat R n (m + 1)
            _ = R.add (R.neg (ofNat R (m + 1))) (ofNat R n) :=
                  R.add_comm (ofNat R n) (R.neg (ofNat R (m + 1)))
      | negSucc n =>
          change ofInt R (Int.negSucc (m + n + 1))
              = R.add (R.neg (ofNat R (m + 1))) (R.neg (ofNat R (n + 1)))
          change R.neg (ofNat R ((m + n + 1) + 1))
              = R.add (R.neg (ofNat R (m + 1))) (R.neg (ofNat R (n + 1)))
          have hnat : (m + n + 1) + 1 = (m + 1) + (n + 1) := by omega
          rw [hnat, ofNat_add, neg_add]

/-- `Int.negOfNat` maps to the ring negative of the natural scalar. -/
theorem ofInt_negOfNat (n : Nat) :
    ofInt R (Int.negOfNat n) = R.neg (ofNat R n) := by
  cases n with
  | zero =>
      show R.zero = R.neg R.zero
      exact (Ring.neg_zero R.toRing).symm
  | succ n =>
      rfl

/-- Integer scalars preserve multiplication. -/
theorem ofInt_mul (a b : Int) :
    ofInt R (a * b) = R.mul (ofInt R a) (ofInt R b) := by
  cases a with
  | ofNat m =>
      cases b with
      | ofNat n =>
          change ofInt R (Int.ofNat (m * n)) = R.mul (ofNat R m) (ofNat R n)
          exact ofNat_mul R m n
      | negSucc n =>
          change ofInt R (Int.negOfNat (m * (n + 1)))
              = R.mul (ofNat R m) (R.neg (ofNat R (n + 1)))
          rw [ofInt_negOfNat, ofNat_mul]
          exact (Ring.mul_neg R.toRing (ofNat R m) (ofNat R (n + 1))).symm
  | negSucc m =>
      cases b with
      | ofNat n =>
          change ofInt R (Int.negOfNat ((m + 1) * n))
              = R.mul (R.neg (ofNat R (m + 1))) (ofNat R n)
          rw [ofInt_negOfNat, ofNat_mul]
          exact (Ring.neg_mul R.toRing (ofNat R (m + 1)) (ofNat R n)).symm
      | negSucc n =>
          change ofInt R (Int.ofNat ((m + 1) * (n + 1)))
              = R.mul (R.neg (ofNat R (m + 1))) (R.neg (ofNat R (n + 1)))
          change ofNat R ((m + 1) * (n + 1))
              = R.mul (R.neg (ofNat R (m + 1))) (R.neg (ofNat R (n + 1)))
          rw [ofNat_mul]
          exact (Ring.neg_mul_neg R.toRing (ofNat R (m + 1)) (ofNat R (n + 1))).symm

end CommRing

namespace PolyExpr

/-- Evaluate a reflected expression in a bundled commutative ring. -/
def eval (R : CommRing) (ctx : List R.carrier) : PolyExpr -> R.carrier
  | atom i => ctx.getD i R.zero
  | lit n => CommRing.ofInt R n
  | add a b => R.add (eval R ctx a) (eval R ctx b)
  | mul a b => R.mul (eval R ctx a) (eval R ctx b)
  | neg a => R.neg (eval R ctx a)

end PolyExpr

namespace RingNF

/-- A monomial key is a sorted list of atom indices. -/
abbrev Monomial := List Nat

/-- A normal form is a sorted list of monomial/coefficient pairs. -/
abbrev NF := List (Monomial × Int)

/-- Boolean comparison on natural numbers. -/
def natLt (a b : Nat) : Bool := Nat.ble (a + 1) b

/-- Boolean equality on natural numbers. -/
def natEq (a b : Nat) : Bool := a == b

/-- Lexicographic `<` on monomial keys. -/
def monoLt : Monomial -> Monomial -> Bool
  | [], [] => false
  | [], _ :: _ => true
  | _ :: _, [] => false
  | a :: as, b :: bs =>
      if natLt a b then true
      else if natLt b a then false
      else monoLt as bs

/-- Boolean equality on monomial keys. -/
def monoEq : Monomial -> Monomial -> Bool
  | [], [] => true
  | [], _ :: _ => false
  | _ :: _, [] => false
  | a :: as, b :: bs => natEq a b && monoEq as bs

/-- Insert an atom index into a sorted monomial. -/
def insertNat (i : Nat) : Monomial -> Monomial
  | [] => [i]
  | j :: js => if natLt i j then i :: j :: js else j :: insertNat i js

/-- Merge two sorted monomial keys. -/
def mergeMono : Monomial -> Monomial -> Monomial
  | [], bs => bs
  | a :: as, bs => insertNat a (mergeMono as bs)

/-- Insert one term into a canonical normal-form accumulator. -/
def insertTerm (m : Monomial) (c : Int) : NF -> NF
  | [] => if c == 0 then [] else [(m, c)]
  | (m', c') :: rest =>
      if m == m' then
        let s := c + c'
        if s == 0 then rest else (m, s) :: rest
      else if monoLt m m' then
        if c == 0 then (m', c') :: rest else (m, c) :: (m', c') :: rest
      else
        (m', c') :: insertTerm m c rest

/-- Add two canonical normal forms. -/
def add (p q : NF) : NF :=
  q.foldl (fun acc t => insertTerm t.1 t.2 acc) p

/-- Negate a canonical normal form. -/
def neg (p : NF) : NF :=
  p.map (fun t => (t.1, -t.2))

/-- Multiply one term through a polynomial. -/
def mulTerm (m : Monomial) (c : Int) : NF -> NF
  | [] => []
  | (m', c') :: rest => insertTerm (mergeMono m m') (c * c') (mulTerm m c rest)

/-- Multiply two canonical normal forms. -/
def mul : NF -> NF -> NF
  | [], _ => []
  | (m, c) :: rest, q => add (mulTerm m c q) (mul rest q)

/-- Normalize a reflected expression to canonical integer-coefficient form. -/
def normalize : PolyExpr -> NF
  | .atom i => [([i], 1)]
  | .lit n => if n == 0 then [] else [([], n)]
  | .add a b => add (normalize a) (normalize b)
  | .mul a b => mul (normalize a) (normalize b)
  | .neg a => neg (normalize a)

/-- Evaluate a monomial key as the product of its atoms. -/
def evalMonomial (R : CommRing) (ctx : List R.carrier) : Monomial -> R.carrier
  | [] => R.one
  | i :: is => R.mul (ctx.getD i R.zero) (evalMonomial R ctx is)

/-- Evaluate one normal-form term. -/
def evalTerm (R : CommRing) (ctx : List R.carrier) (t : Monomial × Int) : R.carrier :=
  R.mul (CommRing.ofInt R t.2) (evalMonomial R ctx t.1)

/-- Evaluate a normal form as a sum of coefficient-weighted monomials. -/
def evalNF (R : CommRing) (ctx : List R.carrier) : NF -> R.carrier
  | [] => R.zero
  | t :: ts => R.add (evalTerm R ctx t) (evalNF R ctx ts)

/-- A zero coefficient evaluates to zero. -/
theorem evalTerm_zero_coeff (R : CommRing) (ctx : List R.carrier) (m : Monomial) :
    evalTerm R ctx (m, 0) = R.zero := by
  unfold evalTerm
  rw [CommRing.ofInt_zero]
  exact R.zero_mul (evalMonomial R ctx m)

/-- Term evaluation preserves integer-coefficient addition for a fixed monomial. -/
theorem evalTerm_add_coeff (R : CommRing) (ctx : List R.carrier) (m : Monomial)
    (a b : Int) :
    evalTerm R ctx (m, a + b) =
      R.add (evalTerm R ctx (m, a)) (evalTerm R ctx (m, b)) := by
  unfold evalTerm
  rw [CommRing.ofInt_add, R.right_distrib]

/-- Commuting an inserted summand past the head of a normal form preserves value. -/
theorem add_swap_tail (R : CommRing) (a b c : R.carrier) :
    R.add a (R.add b c) = R.add b (R.add a c) := by
  calc R.add a (R.add b c)
      = R.add (R.add a b) c := (R.add_assoc a b c).symm
    _ = R.add (R.add b a) c := by rw [R.add_comm a b]
    _ = R.add b (R.add a c) := R.add_assoc b a c

/-- Inserting a term into a canonical normal form adds its value. -/
theorem evalNF_insertTerm (R : CommRing) (ctx : List R.carrier)
    (m : Monomial) (c : Int) (p : NF) :
    evalNF R ctx (insertTerm m c p) =
      R.add (evalTerm R ctx (m, c)) (evalNF R ctx p) := by
  induction p with
  | nil =>
      unfold insertTerm evalNF
      by_cases hc : (c == 0) = true
      · have hc0 : c = 0 := (beq_iff_eq.mp hc)
        rw [if_pos hc, hc0, evalTerm_zero_coeff, R.zero_add]
      · rw [if_neg hc]
        rfl
  | cons t rest ih =>
      rcases t with ⟨m', c'⟩
      unfold insertTerm
      by_cases hm : (m == m') = true
      · rw [if_pos hm]
        have hmEq : m = m' := (beq_iff_eq.mp hm)
        subst m'
        by_cases hs : ((c + c') == 0) = true
        · rw [if_pos hs]
          rw [evalNF]
          have hs0 : c + c' = 0 := (beq_iff_eq.mp hs)
          have hsum :
              R.add (evalTerm R ctx (m, c)) (evalTerm R ctx (m, c')) = R.zero := by
            rw [← evalTerm_add_coeff, hs0, evalTerm_zero_coeff]
          calc evalNF R ctx rest
              = R.add R.zero (evalNF R ctx rest) := (R.zero_add (evalNF R ctx rest)).symm
            _ = R.add (R.add (evalTerm R ctx (m, c)) (evalTerm R ctx (m, c')))
                (evalNF R ctx rest) := by rw [hsum]
            _ = R.add (evalTerm R ctx (m, c))
                (R.add (evalTerm R ctx (m, c')) (evalNF R ctx rest)) :=
                  R.add_assoc (evalTerm R ctx (m, c)) (evalTerm R ctx (m, c'))
                    (evalNF R ctx rest)
        · rw [if_neg hs, evalNF, evalNF, evalTerm_add_coeff]
          exact R.add_assoc (evalTerm R ctx (m, c)) (evalTerm R ctx (m, c'))
            (evalNF R ctx rest)
      · rw [if_neg hm]
        by_cases hlt : monoLt m m' = true
        · rw [if_pos hlt]
          by_cases hc : (c == 0) = true
          · have hc0 : c = 0 := (beq_iff_eq.mp hc)
            rw [if_pos hc, hc0, evalTerm_zero_coeff, R.zero_add]
          · rw [if_neg hc]
            rfl
        · rw [if_neg hlt, evalNF, ih, evalNF]
          exact add_swap_tail R (evalTerm R ctx (m', c')) (evalTerm R ctx (m, c))
            (evalNF R ctx rest)

/-- Normal-form addition preserves evaluation. -/
theorem evalNF_add (R : CommRing) (ctx : List R.carrier) (p q : NF) :
    evalNF R ctx (add p q) = R.add (evalNF R ctx p) (evalNF R ctx q) := by
  unfold add
  induction q generalizing p with
  | nil =>
      simp [evalNF, R.add_zero]
  | cons t rest ih =>
      rcases t with ⟨m, c⟩
      simp [List.foldl]
      rw [ih, evalNF_insertTerm, evalNF]
      calc R.add (R.add (evalTerm R ctx (m, c)) (evalNF R ctx p)) (evalNF R ctx rest)
          = R.add (evalNF R ctx p) (R.add (evalTerm R ctx (m, c)) (evalNF R ctx rest)) := by
              rw [R.add_comm (evalTerm R ctx (m, c)) (evalNF R ctx p)]
              exact R.add_assoc (evalNF R ctx p) (evalTerm R ctx (m, c))
                (evalNF R ctx rest)

/-- Negating a term coefficient negates the term value. -/
theorem evalTerm_neg_coeff (R : CommRing) (ctx : List R.carrier) (m : Monomial)
    (c : Int) :
    evalTerm R ctx (m, -c) = R.neg (evalTerm R ctx (m, c)) := by
  unfold evalTerm
  rw [CommRing.ofInt_neg]
  exact Ring.neg_mul R.toRing (CommRing.ofInt R c) (evalMonomial R ctx m)

/-- Normal-form negation preserves evaluation. -/
theorem evalNF_neg (R : CommRing) (ctx : List R.carrier) (p : NF) :
    evalNF R ctx (neg p) = R.neg (evalNF R ctx p) := by
  induction p with
  | nil =>
      unfold neg evalNF
      exact (Ring.neg_zero R.toRing).symm
  | cons t rest ih =>
      rcases t with ⟨m, c⟩
      unfold neg
      change R.add (evalTerm R ctx (m, -c)) (evalNF R ctx (List.map (fun t => (t.1, -t.2)) rest))
          = R.neg (R.add (evalTerm R ctx (m, c)) (evalNF R ctx rest))
      rw [evalTerm_neg_coeff]
      change R.add (R.neg (evalTerm R ctx (m, c))) (evalNF R ctx (neg rest))
          = R.neg (R.add (evalTerm R ctx (m, c)) (evalNF R ctx rest))
      rw [ih, CommRing.neg_add]

/-- Reassociate and commute four factors in a commutative ring. -/
theorem mul_cross (R : CommRing) (a b c d : R.carrier) :
    R.mul (R.mul a b) (R.mul c d) = R.mul (R.mul a c) (R.mul b d) := by
  calc R.mul (R.mul a b) (R.mul c d)
      = R.mul a (R.mul b (R.mul c d)) := R.mul_assoc a b (R.mul c d)
    _ = R.mul a (R.mul c (R.mul b d)) := by
          rw [(R.mul_assoc b c d).symm, R.mul_comm b c, R.mul_assoc c b d]
    _ = R.mul (R.mul a c) (R.mul b d) := (R.mul_assoc a c (R.mul b d)).symm

/-- Product evaluation is invariant under inserting one atom into a monomial key. -/
theorem evalMonomial_insertNat (R : CommRing) (ctx : List R.carrier)
    (i : Nat) : ∀ (m : Monomial),
      evalMonomial R ctx (insertNat i m) =
        R.mul (ctx.getD i R.zero) (evalMonomial R ctx m)
  | [] => by
      unfold insertNat evalMonomial
      rfl
  | j :: js => by
      unfold insertNat
      by_cases hlt : natLt i j = true
      · rw [if_pos hlt]
        unfold evalMonomial
        rfl
      · rw [if_neg hlt]
        unfold evalMonomial
        rw [evalMonomial_insertNat R ctx i js]
        calc R.mul (ctx.getD j R.zero)
              (R.mul (ctx.getD i R.zero) (evalMonomial R ctx js))
            = R.mul (ctx.getD i R.zero)
                (R.mul (ctx.getD j R.zero) (evalMonomial R ctx js)) := by
                  rw [(R.mul_assoc (ctx.getD j R.zero) (ctx.getD i R.zero)
                    (evalMonomial R ctx js)).symm]
                  rw [R.mul_comm (ctx.getD j R.zero) (ctx.getD i R.zero)]
                  exact R.mul_assoc (ctx.getD i R.zero) (ctx.getD j R.zero)
                    (evalMonomial R ctx js)

/-- Product evaluation is invariant under merging two sorted monomial keys. -/
theorem evalMonomial_merge (R : CommRing) (ctx : List R.carrier) :
    ∀ (a b : Monomial),
      evalMonomial R ctx (mergeMono a b) =
        R.mul (evalMonomial R ctx a) (evalMonomial R ctx b)
  | [], b => by
      unfold mergeMono
      exact (R.one_mul (evalMonomial R ctx b)).symm
  | i :: is, b => by
      unfold mergeMono
      change evalMonomial R ctx (insertNat i (mergeMono is b)) =
        R.mul (R.mul (ctx.getD i R.zero) (evalMonomial R ctx is)) (evalMonomial R ctx b)
      rw [evalMonomial_insertNat, evalMonomial_merge R ctx is b]
      exact (R.mul_assoc (ctx.getD i R.zero) (evalMonomial R ctx is)
        (evalMonomial R ctx b)).symm

/-- Multiplying two evaluated terms corresponds to merging keys and multiplying coefficients. -/
theorem evalTerm_mul (R : CommRing) (ctx : List R.carrier)
    (m n : Monomial) (a b : Int) :
    evalTerm R ctx (mergeMono m n, a * b) =
      R.mul (evalTerm R ctx (m, a)) (evalTerm R ctx (n, b)) := by
  unfold evalTerm
  rw [CommRing.ofInt_mul, evalMonomial_merge]
  exact mul_cross R (CommRing.ofInt R a) (CommRing.ofInt R b)
    (evalMonomial R ctx m) (evalMonomial R ctx n)

/-- Multiplication of one term through a normal form preserves evaluation. -/
theorem evalNF_mulTerm (R : CommRing) (ctx : List R.carrier)
    (m : Monomial) (c : Int) (q : NF) :
    evalNF R ctx (mulTerm m c q) =
      R.mul (evalTerm R ctx (m, c)) (evalNF R ctx q) := by
  induction q with
  | nil =>
      unfold mulTerm evalNF
      exact (R.mul_zero (evalTerm R ctx (m, c))).symm
  | cons t rest ih =>
      rcases t with ⟨m', c'⟩
      unfold mulTerm
      rw [evalNF_insertTerm, ih, evalNF, evalTerm_mul]
      exact (R.left_distrib (evalTerm R ctx (m, c)) (evalTerm R ctx (m', c'))
        (evalNF R ctx rest)).symm

/-- Normal-form multiplication preserves evaluation. -/
theorem evalNF_mul (R : CommRing) (ctx : List R.carrier) (p q : NF) :
    evalNF R ctx (mul p q) = R.mul (evalNF R ctx p) (evalNF R ctx q) := by
  induction p with
  | nil =>
      unfold mul
      exact (R.zero_mul (evalNF R ctx q)).symm
  | cons t rest ih =>
      rcases t with ⟨m, c⟩
      unfold mul
      rw [evalNF_add, evalNF_mulTerm, ih, evalNF]
      exact (R.right_distrib (evalTerm R ctx (m, c)) (evalNF R ctx rest)
        (evalNF R ctx q)).symm

/-- Normalization preserves the value of a reflected polynomial expression. -/
theorem normalize_sound (R : CommRing) (ctx : List R.carrier) (e : PolyExpr) :
    PolyExpr.eval R ctx e = evalNF R ctx (normalize e) := by
  induction e with
  | atom i =>
      unfold PolyExpr.eval normalize evalNF evalTerm evalMonomial
      change ctx.getD i R.zero =
        R.add (R.mul (CommRing.ofInt R 1) (R.mul (ctx.getD i R.zero) R.one)) R.zero
      rw [CommRing.ofInt_one, R.one_mul, R.mul_one, R.add_zero]
  | lit n =>
      unfold PolyExpr.eval normalize
      by_cases hn : (n == 0) = true
      · have hn0 : n = 0 := (beq_iff_eq.mp hn)
        rw [if_pos hn, hn0, CommRing.ofInt_zero]
        rfl
      · rw [if_neg hn]
        unfold evalNF evalTerm evalMonomial
        change CommRing.ofInt R n = R.add (R.mul (CommRing.ofInt R n) R.one) R.zero
        rw [R.mul_one, R.add_zero]
  | add a b iha ihb =>
      unfold PolyExpr.eval normalize
      rw [iha, ihb, evalNF_add]
  | mul a b iha ihb =>
      unfold PolyExpr.eval normalize
      rw [iha, ihb, evalNF_mul]
  | neg a ih =>
      unfold PolyExpr.eval normalize
      rw [ih, evalNF_neg]

/-- Equal normal forms give equal reflected evaluations. -/
theorem eval_eq_of_normalize_eq (R : CommRing) (ctx : List R.carrier)
    {a b : PolyExpr} (h : normalize a = normalize b) :
    PolyExpr.eval R ctx a = PolyExpr.eval R ctx b := by
  rw [normalize_sound R ctx a, normalize_sound R ctx b, h]

end RingNF

namespace RingTactic

open Lean Elab Tactic Meta

/-- The bundled pieces needed while quoting a ring expression. -/
structure QuoteState where
  R : Expr
  ring : Expr
  semiring : Expr
  carrier : Expr
  atoms : Array Expr

/-- Build a Lean expression for a list of carrier elements. -/
def mkExprList (α : Expr) (xs : Array Expr) : Expr := Id.run do
  let mut out := mkApp (mkConst ``List.nil [Level.zero]) α
  for x in xs.reverse do
    out := mkApp3 (mkConst ``List.cons [Level.zero]) α x out
  return out

/-- Build an expression for a reflected polynomial atom. -/
def mkAtom (i : Nat) : Expr :=
  mkApp (mkConst ``PolyExpr.atom) (mkNatLit i)

/-- Build an expression for a reflected integer literal. -/
def mkLit (n : Int) : Expr :=
  mkApp (mkConst ``PolyExpr.lit) (mkIntLit n)

/-- Find a defeq atom already present in the shared context. -/
partial def findAtom? (e : Expr) (atoms : Array Expr) (i : Nat := 0) : MetaM (Option Nat) := do
  if h : i < atoms.size then
    if ← isDefEq e atoms[i] then
      return some i
    else
      findAtom? e atoms (i + 1)
  else
    return none

/-- Quote an unrecognized term as a deduplicated atom. -/
def quoteAtom (e : Expr) (s : QuoteState) : MetaM (Expr × QuoteState) := do
  match ← findAtom? e s.atoms with
  | some i => return (mkAtom i, s)
  | none =>
      let i := s.atoms.size
      return (mkAtom i, { s with atoms := s.atoms.push e })

/-- True when `e` is definitionally equal to the supplied expression. -/
def isDefEqTo (e expected : Expr) : MetaM Bool :=
  isDefEq e expected

/-- Quote a ring expression into `PolyExpr`, sharing an atom context. -/
partial def quoteExpr (e : Expr) (s : QuoteState) : MetaM (Expr × QuoteState) := do
  let e := e.consumeMData
  let zero ← mkAppM ``Semiring.zero #[s.semiring]
  if ← isDefEqTo e zero then
    return (mkLit 0, s)
  let one ← mkAppM ``Semiring.one #[s.semiring]
  if ← isDefEqTo e one then
    return (mkLit 1, s)
  let (fn, args) := e.getAppFnArgs
  if fn == ``OfNat.ofNat && args.size >= 2 then
    match args[1]! with
    | Expr.lit (Literal.natVal n) => return (mkLit (Int.ofNat n), s)
    | _ => pure ()
  if fn == ``Semiring.add && args.size == 3 then
    if ← isDefEq args[0]! s.semiring then
      let (a, s) ← quoteExpr args[1]! s
      let (b, s) ← quoteExpr args[2]! s
      return (mkApp2 (mkConst ``PolyExpr.add) a b, s)
  if fn == ``Semiring.mul && args.size == 3 then
    if ← isDefEq args[0]! s.semiring then
      let (a, s) ← quoteExpr args[1]! s
      let (b, s) ← quoteExpr args[2]! s
      return (mkApp2 (mkConst ``PolyExpr.mul) a b, s)
  if fn == ``Ring.neg && args.size == 2 then
    if ← isDefEq args[0]! s.ring then
      let (a, s) ← quoteExpr args[1]! s
      return (mkApp (mkConst ``PolyExpr.neg) a, s)
  if fn == ``HAdd.hAdd && args.size >= 2 then
    let (a, s) ← quoteExpr args[args.size - 2]! s
    let (b, s) ← quoteExpr args[args.size - 1]! s
    return (mkApp2 (mkConst ``PolyExpr.add) a b, s)
  if fn == ``HMul.hMul && args.size >= 2 then
    let (a, s) ← quoteExpr args[args.size - 2]! s
    let (b, s) ← quoteExpr args[args.size - 1]! s
    return (mkApp2 (mkConst ``PolyExpr.mul) a b, s)
  if fn == ``HSub.hSub && args.size >= 2 then
    let (a, s) ← quoteExpr args[args.size - 2]! s
    let (b, s) ← quoteExpr args[args.size - 1]! s
    return (mkApp2 (mkConst ``PolyExpr.add) a (mkApp (mkConst ``PolyExpr.neg) b), s)
  if fn == ``Neg.neg && args.size >= 1 then
    let (a, s) ← quoteExpr args[args.size - 1]! s
    return (mkApp (mkConst ``PolyExpr.neg) a, s)
  quoteAtom e s

/-- Close the main equality goal using a bundled commutative-ring expression. -/
def evalCringWithExpr (R : Expr) : TacticM Unit := withMainContext do
  let ring ← mkAppM ``CommRing.toRing #[R]
  let semiring ← mkAppM ``Ring.toSemiring #[ring]
  let carrier ← mkAppM ``Semiring.carrier #[semiring]
  let target ← getMainTarget
  let (fn, args) := target.getAppFnArgs
  unless fn == ``Eq && args.size == 3 do
    throwError "cring expects an equality goal"
  unless ← isDefEq args[0]! carrier do
    throwError "cring: goal is not an equality in the supplied CommRing carrier"
  let init : QuoteState := { R := R, ring := ring, semiring := semiring, carrier := carrier, atoms := #[] }
  let (lhsExpr, s) ← quoteExpr args[1]! init
  let (rhsExpr, s) ← quoteExpr args[2]! s
  let ctx := mkExprList carrier s.atoms
  let lhsNF ← mkAppM ``RingNF.normalize #[lhsExpr]
  let rhsNF ← mkAppM ``RingNF.normalize #[rhsExpr]
  let eqProp ← mkEq lhsNF rhsNF
  let h ← mkFreshExprMVar (some eqProp)
  let proof ← mkAppM ``RingNF.eval_eq_of_normalize_eq #[R, ctx, h]
  let goal ← getMainGoal
  goal.assign proof
  setGoals [h.mvarId!]
  Lean.Elab.Tactic.evalTactic (← `(tactic| decide))

/-- Close the main equality goal using the supplied bundled commutative ring. -/
def evalCringWith (rStx : Syntax) : TacticM Unit := withMainContext do
  let R ← Elab.Term.elabTerm rStx (some (mkConst ``CommRing))
  evalCringWithExpr R

/-- Names of concrete bundled commutative rings that may be available downstream. -/
def knownCommRingNames : List Name :=
  [Name.str (Name.str (Name.str Name.anonymous "Infomaterial") "Algebra") "intCommRing",
   Name.str (Name.str (Name.str Name.anonymous "Infomaterial") "Algebra") "ratCommRing",
   Name.str (Name.str (Name.str Name.anonymous "Infomaterial") "Algebra") "rrealCommRing"]

/-- Try to infer a bundled commutative ring from the equality carrier. -/
def inferCommRingForTarget : TacticM (Option Expr) := withMainContext do
  let target ← getMainTarget
  let (fn, args) := target.getAppFnArgs
  unless fn == ``Eq && args.size == 3 do
    return none
  let goalCarrier := args[0]!
  let lctx ← Lean.MonadLCtx.getLCtx
  let local? ← lctx.foldlM (fun acc decl => do
    match acc with
    | some _ => return acc
    | none =>
        if ← isDefEq decl.type (mkConst ``CommRing) then
          let R := decl.toExpr
          let ring ← mkAppM ``CommRing.toRing #[R]
          let semiring ← mkAppM ``Ring.toSemiring #[ring]
          let carrier ← mkAppM ``Semiring.carrier #[semiring]
          if ← isDefEq carrier goalCarrier then
            return some R
          else
            return none
        else
          return none) (none : Option Expr)
  match local? with
  | some R => return some R
  | none =>
      let env ← getEnv
      knownCommRingNames.foldlM (fun acc n => do
        match acc with
        | some _ => return acc
        | none =>
            if env.contains n then
              let R := mkConst n
              let ring ← mkAppM ``CommRing.toRing #[R]
              let semiring ← mkAppM ``Ring.toSemiring #[ring]
              let carrier ← mkAppM ``Semiring.carrier #[semiring]
              if ← isDefEq carrier goalCarrier then
                return some R
              else
                return none
            else
              return none) (none : Option Expr)

/-- Close the main equality goal by inferring an available bundled commutative ring. -/
def evalCringInferred : TacticM Unit := withMainContext do
  match ← inferCommRingForTarget with
  | some R => evalCringWithExpr R
  | none =>
      Lean.Elab.Tactic.evalTactic (← `(tactic|
        (apply RingNF.eval_eq_of_normalize_eq
         · decide)))

end RingTactic

syntax "cring" : tactic
syntax "cring " term : tactic

elab_rules : tactic
  | `(tactic| cring $r:term) => RingTactic.evalCringWith r
  | `(tactic| cring) => RingTactic.evalCringInferred

section Examples

example (R : CommRing) (ctx : List R.carrier) :
    PolyExpr.eval R ctx (.add (.atom 0) (.lit 0)) =
      PolyExpr.eval R ctx (.atom 0) := by
  apply RingNF.eval_eq_of_normalize_eq
  decide

example (R : CommRing) (ctx : List R.carrier) :
    PolyExpr.eval R ctx (.add (.atom 0) (.atom 1)) =
      PolyExpr.eval R ctx (.add (.atom 1) (.atom 0)) := by
  apply RingNF.eval_eq_of_normalize_eq
  decide

example (R : CommRing) (ctx : List R.carrier) :
    PolyExpr.eval R ctx (.mul (.atom 0) (.add (.atom 1) (.atom 2))) =
      PolyExpr.eval R ctx (.add (.mul (.atom 0) (.atom 1)) (.mul (.atom 0) (.atom 2))) := by
  apply RingNF.eval_eq_of_normalize_eq
  decide

example (R : CommRing) (x y : R.carrier) :
    R.add x y = R.add y x := by
  cring R

example (R : CommRing) (x y z : R.carrier) :
    R.mul x (R.add y z) = R.add (R.mul x y) (R.mul x z) := by
  cring R

example (R : CommRing) (x : R.carrier) :
    R.add x (R.neg x) = R.zero := by
  cring R

end Examples

end Algebra
end Infomaterial
