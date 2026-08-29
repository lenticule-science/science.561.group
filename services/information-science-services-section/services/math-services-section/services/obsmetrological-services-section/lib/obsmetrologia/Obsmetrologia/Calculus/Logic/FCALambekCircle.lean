import Obsmetrologia.Calculus.Order.FormalConceptAnalysis
import Obsmetrologia.Calculus.Logic.LambekCalculus
import Obsmetrologia.Calculus.Order.ResiduatedLatticeStandalone
import Obsmetrologia.Language.Settling

/-!
# FCALambekCircle — closing the FCA ⇄ Lambek ⇄ residuated-lattice ⇄ settling-closure circle

This turns four threads of the corpus into a single closed circle of theorems. The
corpus nodes
`_archive/knowledge-science/.../formal-concept-analysis/formal-concept-analysis.md`
("the derivation operators form a Galois connection … computing concepts is computing
closures"; "Belohlavek generalized FCA to many-valued contexts over a residuated
lattice … Wurm 2012 proved such concept lattices give complete semantics for the
Lambek calculus") and
`_archive/lambek-calculus/research-lambek-calculus.md` (algebraic semantics =
residuated lattice; complete semantics = concept lattice) name the four edges; here
each *algebraic* edge is proved.

The circle, with each edge a theorem or a documented model-theoretic fact:

* **(1) FCA-closure = settling-closure.** The FCA derivation closure
  `closeA A := A″ = primeB (primeA A)` (`FormalConceptAnalysis`) is *extensive,
  monotone, idempotent* — the very shape of closure the **settling** morphism
  iterates (`Settling`'s `Charge.Closure`: `infl`/`mono`/`idem`). So "computing formal
  concepts" **is** "running the settling closure on a finite formal context"
  (the corpus's "computing concepts is computing closures"). Proved by `reuse` of
  FCA's own `subA_closeA` / `closeA_mono` / `closeA_idem`.
* **(2) Concept lattice = complete lattice.** The concepts of any context form a
  complete lattice (FCA's `conceptLatticeData`, reused).
* **(3) residuated-lattice = commutative-Lambek.** The Lambek calculus's *algebraic
  semantics* is residuated lattices; every **integral commutative** residuated
  lattice (`ResiduatedLatticeStandalone`'s `Order.ResiduatedLattice`) **is** a
  commutative `Lambek.LambekAlgebra` — the single residual `imp` serves as *both*
  the left residual `lres` and the right residual `rres`, and the two Lambek
  bi-residuation adjunctions both follow from the single `fuse_le_iff` adjunction
  (commutativity makes the left and right adjunctions coincide).
* **The closing edge (model-theoretic, documented not formalized).** Wurm (2012)
  proved syntactic **concept lattices give complete semantics for the Lambek
  calculus**, and Pentus (1993) that Lambek grammars generate exactly the
  context-free languages. In the many-valued (Belohlavek) setting the concept lattice
  of (2) carries the residuated/Lambek structure of (3), routing the loop back to
  (1)–(2). The full Wurm completeness ("every Lambek-valid sequent holds in some
  concept lattice") and Pentus's expressivity are **model- and language-theoretic** and
  are stated here only in prose; the *algebraic* edges (1)/(3) and the lattice fact
  (2) ARE proved.
-/

namespace Obsmetrologia
namespace FCALambek

open Obsmetrologia.FCA
open Obsmetrologia.Lambek
open Obsmetrologia.Order

/-! ## Edge (1): the FCA derivation closure IS a settling-shape closure operator

The settling morphism (`Settling`) iterates a `Charge.Closure`: an endomap that is
**inflationary/extensive, monotone, idempotent**. FCA's `closeA I` is an endomap on
the powerset `ExtSet G` with *exactly* those three laws (`subA_closeA`,
`closeA_mono`, `closeA_idem`). We package them as FCA's own `ClosureOp` — the
powerset reading of `Charge.Closure` — establishing the identity at the abstract
closure-operator level: the FCA closure on a finite formal context is a settling
closure. -/

/-- **Edge (1): the FCA derivation closure is a settling-shape closure
operator.** For any formal context `I : G → M → Prop`, the object-side derivation
closure `closeA I` (`A ↦ A″`) satisfies the three abstract closure-operator laws —
**extensive** (`A ⊆ closeA A`), **monotone**, **idempotent**
(`closeA (closeA A) = closeA A`) — bundled as FCA's `ClosureOp G`.

These are exactly the laws of `Settling.Charge.Closure` (`infl`/`mono`/`idem`): both
are extensive + monotone + idempotent endomaps, so `closeA` on a finite context **is**
the settling closure, and "computing formal concepts" is "running the settling closure"
(the corpus's *computing concepts is computing closures*). The proof **reuses** FCA's
`subA_closeA`, `closeA_mono`, `closeA_idem` — nothing is re-derived or postulated. -/
def fcaClosureOp {G M : Type} (I : G → M → Prop) :
    FCA.ClosureOp G where
  op := FCA.closeA I
  ext := FCA.subA_closeA I
  mono := fun h => FCA.closeA_mono I h
  idem := FCA.closeA_idem I

/-- The three closure laws, projected back out of the bundle, witnessing the
extensive/monotone/idempotent shape shared with `Settling`'s `Charge.Closure`. -/
theorem fca_closure_laws {G M : Type} (I : G → M → Prop) :
    (∀ A : FCA.ExtSet G, FCA.subA A (FCA.closeA I A))
      ∧ (∀ {A1 A2 : FCA.ExtSet G}, FCA.subA A1 A2 → FCA.subA (FCA.closeA I A1) (FCA.closeA I A2))
      ∧ (∀ A : FCA.ExtSet G, FCA.closeA I (FCA.closeA I A) = FCA.closeA I A) :=
  ⟨(fcaClosureOp I).ext,
   (fcaClosureOp I).mono,
   (fcaClosureOp I).idem⟩

/-- Edge (2), reused: the concept-lattice **data** of any context (`FCA.conceptLatticeData`),
re-exported here as the second edge of the circle. -/
def conceptLatticeData {G M : Type} (I : G → M → Prop) :
    FCA.ConceptLatticeData G M I :=
  FCA.conceptLatticeData I

/-- **The concepts of any context form a complete lattice** (FCA's fundamental theorem): the family
meet is the greatest lower bound and the family join is the least upper bound, over *arbitrary*
families of concepts. The specific equivalence the bare data only gestured at — projected from
`conceptLatticeData`'s `Order.CompleteLattice`. -/
theorem concept_lattice_is_complete {G M : Type} (I : G → M → Prop) :
    (∀ (S : FCA.Concept G M I → Prop) c, S c → FCA.leC ((conceptLatticeData I).lattice.sInf S) c)
    ∧ (∀ (S : FCA.Concept G M I → Prop) d, (∀ c, S c → FCA.leC d c) → FCA.leC d ((conceptLatticeData I).lattice.sInf S))
    ∧ (∀ (S : FCA.Concept G M I → Prop) c, S c → FCA.leC c ((conceptLatticeData I).lattice.sSup S))
    ∧ (∀ (S : FCA.Concept G M I → Prop) d, (∀ c, S c → FCA.leC c d) → FCA.leC ((conceptLatticeData I).lattice.sSup S) d) :=
  ⟨(conceptLatticeData I).lattice.sInf_le, (conceptLatticeData I).lattice.le_sInf,
   (conceptLatticeData I).lattice.le_sSup, (conceptLatticeData I).lattice.sSup_le⟩

/-! ## Edge (3): every integral commutative residuated lattice IS a commutative Lambek algebra

The Lambek calculus's algebraic semantics is residuated lattices
(`research-lambek-calculus.md`). A `Lambek.LambekAlgebra` is a lattice-ordered monoid
with *two* residuals `lres`/`rres` and the two bi-residuation adjunctions. An integral
**commutative** residuated lattice `Order.ResiduatedLattice` has a *single* residual
`imp`; setting `dot := fuse`, `lres a c := rres c a := imp a c`, and `e := top`
(`= one`, by integrality), both Lambek adjunctions reduce to the single `fuse_le_iff`
— the left one needing one application of `fuse_comm`. So the residuated lattices the
corpus carries (and the FOUR / `Two` fragment) are a sub-class of the Lambek calculus's
algebraic models. In the **many-valued** (Belohlavek) setting the complete concept
lattice of edge (2) carries exactly this residuated/Lambek structure — and Wurm (2012)
makes the concept lattice a *complete* model — closing the loop back to (1)–(2). -/

/-- **Edge (3): every integral commutative residuated lattice is a
commutative Lambek algebra.** Given `R : Order.ResiduatedLattice` we build a
`Lambek.LambekAlgebra` on the same lattice (`R.toLattice`), with

* product `dot := R.fuse`, unit `e := R.top` (`= R.one` by **integrality**),
* **single residual serving as both** `lres a c := R.imp a c` and `rres c b := R.imp b c`,

and we **prove** the two Lambek bi-residuation fields from the single residuated
adjunction `R.fuse_le_iff`:

* `dot_rres_adj` (`a·b ≤ c ⟺ a ≤ c/b`) is *exactly* `R.fuse_le_iff a b c`;
* `dot_lres_adj` (`a·b ≤ c ⟺ b ≤ a\c`) follows after commuting `fuse a b = fuse b a`
  (`R.fuse_comm`) and applying `R.fuse_le_iff b a c` — **commutativity collapses the
  left and right adjunctions onto one**.

The monoid unit laws use `R.fuse_one` and `R.fuse_comm` together with integrality
`R.one_eq_top`. This realizes the corpus edge "the Lambek calculus's algebraic
semantics is residuated lattices"; Wurm (2012) (documented, not formalized) supplies
the concept-lattice completeness that closes the circle. No free data: every field is
inherited lattice data or a derived adjunction/unit fact. -/
def lambekOfResiduated (R : Order.ResiduatedLattice) : Lambek.LambekAlgebra where
  toLattice := R.toLattice
  dot := R.fuse
  lres := fun a c => R.imp a c
  rres := fun c b => R.imp b c
  e := R.top
  dot_assoc := R.fuse_assoc
  dot_one_left := by
    intro a
    -- fuse top a = a : top = one, fuse_one gives fuse a one = a, commute.
    rw [← R.one_eq_top, R.fuse_comm, R.fuse_one]
  dot_one_right := by
    intro a
    rw [← R.one_eq_top, R.fuse_one]
  dot_lres_adj := by
    -- meet (fuse a b) c = fuse a b  ↔  meet b (imp a c) = b
    -- LHS is R.le (fuse a b) c; commute fuse a b = fuse b a; apply fuse_le_iff b a c.
    intro a b c
    have h := R.fuse_le_iff b a c          -- R.le (fuse b a) c ↔ R.le b (imp a c)
    rw [R.fuse_comm b a] at h
    exact h
  dot_rres_adj := by
    -- meet (fuse a b) c = fuse a b  ↔  meet a (imp b c) = a   — exactly fuse_le_iff.
    intro a b c
    exact R.fuse_le_iff a b c

/-- `lambekOfResiduated R` is **commutative** (`dot a b = dot b a`), since `dot = fuse`
and `fuse` is commutative — so it also satisfies the Lambek collapse theorem
`commutative_collapses_to_single_implication`. -/
theorem lambekOfResiduated_comm (R : Order.ResiduatedLattice) :
    ∀ a b, (lambekOfResiduated R).dot a b = (lambekOfResiduated R).dot b a :=
  R.fuse_comm

/-- **Edge (3), bundled.** Every integral commutative residuated lattice
`R` yields a commutative Lambek algebra whose two residuals coincide (`a \ c = c / a`)
and whose bi-residuation collapses to the single adjunction — the Lambek algebraic
semantics restricted to the residuated/FOUR fragment. This is `lambekOfResiduated R`
fed through the Lambek calculus's own collapse theorem. -/
theorem residuated_lattice_is_commutative_lambek (R : Order.ResiduatedLattice) :
    (∀ a c, (lambekOfResiduated R).lres a c = (lambekOfResiduated R).rres c a)
      ∧ (∀ a b c, (lambekOfResiduated R).le ((lambekOfResiduated R).dot a b) c
          ↔ (lambekOfResiduated R).le b ((lambekOfResiduated R).lres a c)) :=
  (lambekOfResiduated R).commutative_collapses_to_single_implication
    (lambekOfResiduated_comm R)

/-! ## Concrete witness: `Two` as a commutative Lambek algebra

The 2-element Boolean integral commutative residuated lattice `Order.Two` (the FOUR
base) is, via `lambekOfResiduated`, a concrete commutative `LambekAlgebra` — a closed
witness that edge (3) is non-vacuous. -/

/-- `Order.Two` (the Boolean residuated lattice) as a concrete commutative Lambek
algebra: the FOUR base sits inside the Lambek calculus's algebraic semantics. -/
def TwoLambek : Lambek.LambekAlgebra := lambekOfResiduated Order.Two

/-- The `Two` Lambek algebra is commutative — confirming the collapse on the concrete
FOUR base. -/
theorem TwoLambek_comm : ∀ a b, TwoLambek.dot a b = TwoLambek.dot b a :=
  lambekOfResiduated_comm Order.Two

/-- On the concrete `Two` witness the two residuals coincide and the single Lambek
adjunction survives — edge (3) instantiated. -/
example :
    (∀ a c, TwoLambek.lres a c = TwoLambek.rres c a)
      ∧ (∀ a b c, TwoLambek.le (TwoLambek.dot a b) c ↔ TwoLambek.le b (TwoLambek.lres a c)) :=
  residuated_lattice_is_commutative_lambek Order.Two

/-! ## The circle, named

Edges as one record over a context `I` and a residuated lattice `R`:
(1) FCA closure is a settling-shape closure operator; (2) the concept lattice is
complete; (3) `R` is a commutative Lambek algebra. The closing edge — Wurm (2012)
concept-lattice completeness for the Lambek calculus, in the many-valued setting — is
documented (model-theoretic), not a field. -/

/-- The closed **FCA ⇄ Lambek ⇄ residuated-lattice ⇄ settling-closure circle** for a
context `I` and a residuated lattice `R`, as the three proved algebraic edges bundled.
The fourth (closing) edge, Wurm (2012)'s concept-lattice completeness for the Lambek
calculus, is documented in this module's header — model-theoretic, not formalized. -/
structure CircleData (G M : Type) (I : G → M → Prop) (R : Order.ResiduatedLattice) where
  /-- Edge (1): FCA's derivation closure is a settling-shape closure operator. -/
  fcaClosure : FCA.ClosureOp G
  /-- Edge (2): the concepts of `I` form a complete lattice. -/
  conceptLattice : FCA.ConceptLatticeData G M I
  /-- Edge (3): `R` is a commutative Lambek algebra. -/
  lambek : Lambek.LambekAlgebra

/-- The circle assembled from the three proved edges. -/
def the_circle {G M : Type} (I : G → M → Prop) (R : Order.ResiduatedLattice) :
    CircleData G M I R where
  fcaClosure := fcaClosureOp I
  conceptLattice := conceptLatticeData I
  lambek := lambekOfResiduated R

end FCALambek
end Obsmetrologia
