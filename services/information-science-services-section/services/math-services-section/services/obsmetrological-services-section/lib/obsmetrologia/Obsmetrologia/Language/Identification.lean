import Obsmetrologia.Language.Positing.Measure
import Obsmetrologia.Calculus.Logic.LinearLogicChu

/-!
# The root identification: the biextensional collapse of a measured trace

A mark's identity is its role (`Mark.lean`). Read a trace's measurement as a
FOUR-valued Chu space: tokens are the points, a claim together with the token it
is told toward is a test, and the entry is the reading measured at that oriented
cell. Identity by role is then the space's **biextensional collapse**: two tokens
are one when every test reads them alike, and two tests are one when every token
reads them alike (Pratt 1999; clarification of a formal context, Ganter & Wille
1999; the separated, extensional classification, Barwise & Seligman 1997).

The collapse is a quotient in both coordinates, and the matrix descends to it
because equal rows and equal columns carry equal entries. It is separable and
extensional, measurement factors through it exactly, and every Chu transform
descends to a transform between collapses. The lifts out of the quotients go by
`Quot.lift` and `Quot.ind`; identifying two presentations uses `Quot.sound`, the
one identification the axiom law admits.
-/

namespace Obsmetrologia
namespace ChuSpace

/-- Two points are **row-equal** when every state reads them alike. -/
def RowEq (C : ChuSpace) (a a' : C.pts) : Prop := ∀ x, C.r a x = C.r a' x

/-- Two states are **column-equal** when every point reads them alike. -/
def ColEq (C : ChuSpace) (x x' : C.sts) : Prop := ∀ a, C.r a x = C.r a x'

/-- The matrix entry at a point and a collapsed state. -/
def rowAt (C : ChuSpace) (a : C.pts) : Quot C.ColEq → Reading :=
  Quot.lift (fun x => C.r a x) (fun _ _ h => h a)

/-- Row-equal points read every collapsed state alike. -/
theorem rowAt_respects (C : ChuSpace) (a a' : C.pts) (h : C.RowEq a a') (q : Quot C.ColEq) :
    C.rowAt a q = C.rowAt a' q := by
  induction q using Quot.ind with
  | mk x => exact h x

/-- **The biextensional collapse**: points up to row equality, states up to column
equality, and the matrix descended to both quotients. -/
def collapse (C : ChuSpace) : ChuSpace where
  pts := Quot C.RowEq
  sts := Quot C.ColEq
  r := fun p q => Quot.lift (fun a => C.rowAt a q) (fun a a' h => C.rowAt_respects a a' h q) p

/-- The collapsed matrix is the original matrix on representatives. -/
@[simp] theorem collapse_r_mk (C : ChuSpace) (a : C.pts) (x : C.sts) :
    (collapse C).r (Quot.mk _ a) (Quot.mk _ x) = C.r a x := rfl

/-- **Separable**: collapsed points with equal rows are equal. -/
theorem collapse_separable (C : ChuSpace) (p p' : (collapse C).pts)
    (h : ∀ q, (collapse C).r p q = (collapse C).r p' q) : p = p' := by
  induction p using Quot.ind with
  | mk a =>
    induction p' using Quot.ind with
    | mk a' => exact Quot.sound (fun x => h (Quot.mk _ x))

/-- **Extensional**: collapsed states with equal columns are equal. -/
theorem collapse_extensional (C : ChuSpace) (q q' : (collapse C).sts)
    (h : ∀ p, (collapse C).r p q = (collapse C).r p q') : q = q' := by
  induction q using Quot.ind with
  | mk x =>
    induction q' using Quot.ind with
    | mk x' => exact Quot.sound (fun a => h (Quot.mk _ a))

/-- Two points collapse together exactly when no state tells them apart. -/
theorem collapse_mk_eq_iff (C : ChuSpace) (a a' : C.pts) :
    (Quot.mk C.RowEq a = Quot.mk C.RowEq a') ↔ C.RowEq a a' := by
  constructor
  · intro h x
    have := congrArg (fun p => (collapse C).r p (Quot.mk _ x)) h
    exact this
  · intro h
    exact Quot.sound h

end ChuSpace

namespace ChuMap

/-- **Chu transforms descend.** A transform `C → D` induces a transform between the
collapses: its forward map respects row equality and its backward map respects column
equality, both by adjointness. -/
def collapse {C D : ChuSpace} (f : ChuMap C D) : ChuMap (ChuSpace.collapse C) (ChuSpace.collapse D) where
  fwd := Quot.lift (fun a => Quot.mk D.RowEq (f.fwd a)) (fun a a' h =>
    Quot.sound (fun y => by rw [f.adj a y, f.adj a' y]; exact h (f.bwd y)))
  bwd := Quot.lift (fun y => Quot.mk C.ColEq (f.bwd y)) (fun y y' h =>
    Quot.sound (fun a => by rw [← f.adj a y, ← f.adj a y']; exact h (f.fwd a)))
  adj := by
    intro p q
    induction p using Quot.ind with
    | mk a =>
      induction q using Quot.ind with
      | mk y => exact f.adj a y

end ChuMap

/-- **The measured Chu space of a trace**: tokens as points, a claim with the token it is
told toward as a test, and the reading measured at that oriented cell as the entry. -/
def measuredChu (k : Contradictory) (trace : List Articulating) : ChuSpace where
  pts := Token
  sts := Claim × Token
  r := fun t test => (measure k trace ⟨t, test.1, test.2⟩).value

/-- **Measurement factors through the root identification.** The reading measured at any
cell is the collapsed matrix at the cell's collapsed subject and collapsed test. -/
theorem measure_factors_collapse (k : Contradictory) (trace : List Articulating)
    (φ : PredicationCell) :
    (measure k trace φ).value =
      (ChuSpace.collapse (measuredChu k trace)).r
        (Quot.mk _ φ.subject) (Quot.mk _ (φ.predicate, φ.object)) := rfl

/-- **Identity by role.** Two tokens are identified by the root identification exactly when
every claim toward every token measures them alike. -/
theorem token_identified_iff (k : Contradictory) (trace : List Articulating) (t t' : Token) :
    (Quot.mk (measuredChu k trace).RowEq t = Quot.mk (measuredChu k trace).RowEq t') ↔
      ∀ (c : Claim) (o : Token), (measure k trace ⟨t, c, o⟩).value = (measure k trace ⟨t', c, o⟩).value :=
  (ChuSpace.collapse_mk_eq_iff (measuredChu k trace) t t').trans
    ⟨fun h c o => h (c, o), fun h test => h test.1 test.2⟩

end Obsmetrologia
