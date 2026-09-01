import Infomaterial.Articulation.Articulating.Cell

/-!
# Predicating — the generative home of category theory

Predicating is the morphism **out of the potential articulation cell**. Where
articulating only brings a cell into being, predicating says something *of* it: it
asserts a **predicate** over the cell, orienting it from a subject to an object.

A predicate asserted over a cell is an **arrow**; predicates compose
(associatively, with identities) and so **generate a category** — the *predication
category*. This is the literal sense in which category theory is not filed nearby
but is *what this morphism produces*. Its object is the **predication cell**
`φ = (s, p, o)`, an oriented assertion-position from subject through predicate to
object, with `(s,p,o)` and `(o,p,s)` distinct.
-/

namespace Infomaterial

/-- An entity: a mark in identity-carrying (token) role — a subject/object position
of a predication. Derived from `Mark`; no new data. -/
abbrev Entity := Mark

/-- A predicate: a mark in content-carrying (claim) role — the typed middle
coordinate of a predication. Derived from `Mark`. Typing proper enters downstream
at positing/valuation, not at this base. -/
abbrev Predicate := Mark

/-- The object of the predication category: the oriented triple `φ = (s, p, o)`,
an assertion-position from subject `s` through predicate `p` to object `o`. -/
structure PredicationCell where
  subject : Entity
  predicate : Predicate
  object : Entity
  deriving DecidableEq, Repr, Inhabited

namespace PredicationCell

/-- The seed predicating produces from an utterance `(token t, claim c)`: the
reflexive oriented triple `(t, c, t)`. -/
def seed (u : Utterance) : PredicationCell := ⟨u.token, u.claim, u.token⟩

/-- Predicating proper — the morphism *out of the potential articulation cell*.
Defined only where the cell is the potential (initial) corner, since predicating
descends from that seed. -/
def predicating (c : Articulating.Cell) (_ : c.corner = Articulating.Corner.potential) : PredicationCell :=
  seed c.utterance

/-! ## The four canonical morphism classes

Cellular reindexings of the `(subject, object)` pair, plus predicate
specialization. These are the generators of the predication category. -/

/-- Converse: swap subject and object — the orientation-reversing reindexing. -/
def converse (φ : PredicationCell) : PredicationCell := ⟨φ.object, φ.predicate, φ.subject⟩

/-- Subject-projection: collapse the object coordinate onto the subject. -/
def subjProj (φ : PredicationCell) : PredicationCell := ⟨φ.subject, φ.predicate, φ.subject⟩

/-- Object-projection: collapse the subject coordinate onto the object. -/
def objProj (φ : PredicationCell) : PredicationCell := ⟨φ.object, φ.predicate, φ.object⟩

/-- Specialization by a predicate move `f`: identity on entities, refine the typed
middle coordinate. The reindexing on the entity pair is the identity. -/
def specialize (f : Predicate → Predicate) (φ : PredicationCell) : PredicationCell :=
  ⟨φ.subject, f φ.predicate, φ.object⟩

/-! ## Laws — the category structure, derived -/

/-- Converse is an involution. -/
@[simp] theorem converse_converse (φ : PredicationCell) : converse (converse φ) = φ := rfl

/-- The seed is reflexive: it is its own converse (subject = object = the token). -/
@[simp] theorem converse_seed (u : Utterance) : converse (seed u) = seed u := rfl

/-- **Orientation is real.** When subject ≠ object the converse is a *different*
cell — the directed asymmetry articulating introduced, inherited here. -/
theorem converse_ne (φ : PredicationCell) (h : φ.subject ≠ φ.object) : converse φ ≠ φ := by
  obtain ⟨s, p, o⟩ := φ
  intro heq
  simp only [converse, PredicationCell.mk.injEq] at heq
  exact h heq.2.2

/-- Both projections are idempotent (each lands in the reflexive diagonal). -/
@[simp] theorem subjProj_idem (φ : PredicationCell) : subjProj (subjProj φ) = subjProj φ := rfl
@[simp] theorem objProj_idem (φ : PredicationCell) : objProj (objProj φ) = objProj φ := rfl

/-- Specialization composes by composing predicate moves — functoriality of the
typed coordinate. -/
@[simp] theorem specialize_comp (f g : Predicate → Predicate) (φ : PredicationCell) :
    specialize f (specialize g φ) = specialize (f ∘ g) φ := rfl

/-- The identity specialization is the identity morphism. -/
@[simp] theorem specialize_id (φ : PredicationCell) : specialize id φ = φ := rfl

end PredicationCell

end Infomaterial
