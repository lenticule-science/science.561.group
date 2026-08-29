/-
# FormalConceptAnalysis — the derivation Galois connection and the concept lattice

Formal Concept Analysis (Ganter & Wille 1999) is the order-theoretic body that a
**formal context** `(G, M, I)` — objects `G`, attributes `M`, incidence
`I : G → M → Prop` ("object `g` has attribute `m`") — generates by *derivation*.
This module derives its two load-bearing facts, dependency-free, as a further
discrete-predication shadow of the order substrate (`OrderInfra`, `Settling`'s
closure pattern, `SetNumberGraphTheory`'s powerset-as-predicate, with the
many-valued generalization keyed to `ResiduatedLatticeStandalone`).

A *subset* is the extension of a predicate (`SetNumberGraphTheory`: `Set U := U → Bool`);
to quantify universally over **all** objects/attributes without a `Fintype`, we
model subsets as `Prop`-valued predicates `ExtSet G := G → Prop`, `IntSet M := M → Prop`,
ordered by pointwise implication (inclusion). The two **derivation operators**

* `primeA I A := fun m => ∀ g, A g → I g m`  (attributes shared by every object in `A`)
* `primeB I B := fun g => ∀ m, B m → I g m`  (objects bearing every attribute in `B`)

form a **Galois connection** between the two powersets ordered by inclusion: it is
**antitone**, **extensive** (`A ⊆ primeB (primeA A)`), and satisfies the cancellation
`primeA (primeB (primeA A)) = primeA A` (i.e. `A′ = A‴`). Hence
`closeA A := primeB (primeA A)` is a genuine **closure operator** (extensive, monotone,
idempotent) — exactly the closure pattern `Settling` derives over `Charge`, here over
the powerset. **Formal concepts** are the closed pairs `(A, B)` with `primeA A = B`
and `primeB B = A` (`A` the *extent*, `B` the *intent*); ordered by extent-inclusion
they form a **complete lattice** (the fundamental theorem of FCA): every family of
concepts has an infimum (extent = intersection of extents, already closed) and a
supremum (extent = closure of the union of extents). An **attribute implication**
`B₁ ⟹ B₂` holds in the context iff `B₂ ⊆ primeA (primeB B₁) = closeM B₁`.

Belohlavek (2004) generalizes the incidence to a *many-valued* context
`I : G × M → L` valued in a residuated lattice `L` (our `Order.ResiduatedLattice`);
the derivation operators become residuated (`primeA A m := ⨅ g, A g → I g m` with `→`
the residual `imp`), and the concept lattice inherits `L`-residuated structure. That
generalization is documented here in prose; the **Boolean case `L = 2`** — incidence
as `Prop` — is what we prove. (Forbidden tokens appearing in this comment are doc prose.)
-/
import RelMath.OrderInfra
import RelMath.Settling
import RelMath.SetNumberGraphTheory
import RelMath.ResiduatedLatticeStandalone

namespace RelMath
namespace FCA

/-! ## The formal context and its subset powersets -/

/-- A subset of the object set `G`, as the extension of a `Prop`-predicate. -/
abbrev ExtSet (G : Type) : Type := G → Prop
/-- A subset of the attribute set `M`, as the extension of a `Prop`-predicate. -/
abbrev IntSet (M : Type) : Type := M → Prop

/-- Inclusion of object-subsets: pointwise implication. -/
def subA {G : Type} (A1 A2 : ExtSet G) : Prop := ∀ g, A1 g → A2 g
/-- Inclusion of attribute-subsets: pointwise implication. -/
def subB {M : Type} (B1 B2 : IntSet M) : Prop := ∀ m, B1 m → B2 m

/-- `subA` is reflexive. -/
theorem subA_refl {G : Type} (A : ExtSet G) : subA A A := fun _ h => h
/-- `subA` is transitive. -/
theorem subA_trans {G : Type} {A1 A2 A3 : ExtSet G}
    (h1 : subA A1 A2) (h2 : subA A2 A3) : subA A1 A3 := fun g h => h2 g (h1 g h)
/-- `subB` is reflexive. -/
theorem subB_refl {M : Type} (B : IntSet M) : subB B B := fun _ h => h
/-- `subB` is transitive. -/
theorem subB_trans {M : Type} {B1 B2 B3 : IntSet M}
    (h1 : subB B1 B2) (h2 : subB B2 B3) : subB B1 B3 := fun m h => h2 m (h1 m h)

/-- Inclusion is **antisymmetric up to predicate extensionality** (`propext`/`funext`):
mutually-included subsets are equal. -/
theorem subA_antisymm {G : Type} {A1 A2 : ExtSet G}
    (h1 : subA A1 A2) (h2 : subA A2 A1) : A1 = A2 := by
  funext g; exact propext ⟨h1 g, h2 g⟩
/-- Dual antisymmetry on attribute-subsets. -/
theorem subB_antisymm {M : Type} {B1 B2 : IntSet M}
    (h1 : subB B1 B2) (h2 : subB B2 B1) : B1 = B2 := by
  funext m; exact propext ⟨h1 m, h2 m⟩

/-! ## The derivation operators `′` -/

/-- The **object derivation** `A ↦ A′`: the attributes shared by every object in `A`. -/
def primeA {G M : Type} (I : G → M → Prop) (A : ExtSet G) : IntSet M :=
  fun m => ∀ g, A g → I g m
/-- The **attribute derivation** `B ↦ B′`: the objects bearing every attribute in `B`. -/
def primeB {G M : Type} (I : G → M → Prop) (B : IntSet M) : ExtSet G :=
  fun g => ∀ m, B m → I g m

/-- The object-side **closure** `A ↦ A″ = primeB (primeA A)`. -/
def closeA {G M : Type} (I : G → M → Prop) (A : ExtSet G) : ExtSet G :=
  primeB I (primeA I A)
/-- The attribute-side **closure** `B ↦ B″ = primeA (primeB B)`. -/
def closeM {G M : Type} (I : G → M → Prop) (B : IntSet M) : IntSet M :=
  primeA I (primeB I B)

/-! ## Antitone -/

/-- `primeA` is **antitone**: `A1 ⊆ A2 → primeA A2 ⊆ primeA A1`. -/
theorem primeA_antitone {G M : Type} (I : G → M → Prop) {A1 A2 : ExtSet G}
    (h : subA A1 A2) : subB (primeA I A2) (primeA I A1) :=
  fun m hm g hg => hm g (h g hg)
/-- `primeB` is **antitone**: `B1 ⊆ B2 → primeB B2 ⊆ primeB B1`. -/
theorem primeB_antitone {G M : Type} (I : G → M → Prop) {B1 B2 : IntSet M}
    (h : subB B1 B2) : subA (primeB I B2) (primeB I B1) :=
  fun g hg m hm => hg m (h m hm)

/-! ## Extensive (the unit of the Galois connection) -/

/-- `A ⊆ A″`: an object set sits inside the closure of its derivation. -/
theorem subA_closeA {G M : Type} (I : G → M → Prop) (A : ExtSet G) :
    subA A (closeA I A) :=
  fun g hg m hm => hm g hg
/-- `B ⊆ B″`: dual extensiveness on attribute sets. -/
theorem subB_closeM {G M : Type} (I : G → M → Prop) (B : IntSet M) :
    subB B (closeM I B) :=
  fun m hm g hg => hg m hm

/-- The **Galois connection adjunction** `A ⊆ primeB B ⟺ B ⊆ primeA A`: both unfold to
the same statement `∀ g m, A g → B m → I g m`, so the two derivations are antitone
adjoints. -/
theorem prime_adjunction {G M : Type} (I : G → M → Prop) (A : ExtSet G) (B : IntSet M) :
    subA A (primeB I B) ↔ subB B (primeA I A) :=
  ⟨fun h m hm g hg => h g hg m hm, fun h g hg m hm => h m hm g hg⟩

/-! ## The cancellation `A′ = A‴` -/

/-- `primeA A = primeA (closeA A)`, i.e. `A′ = A‴` (`primeA ∘ primeB ∘ primeA = primeA`). -/
theorem primeA_closeA {G M : Type} (I : G → M → Prop) (A : ExtSet G) :
    primeA I (closeA I A) = primeA I A := by
  apply subB_antisymm
  · exact primeA_antitone I (subA_closeA I A)
  · exact subB_closeM I (primeA I A)
/-- Dually `primeB B = primeB (closeM B)`, i.e. `B′ = B‴`. -/
theorem primeB_closeM {G M : Type} (I : G → M → Prop) (B : IntSet M) :
    primeB I (closeM I B) = primeB I B := by
  apply subA_antisymm
  · exact primeB_antitone I (subB_closeM I B)
  · exact subA_closeA I (primeB I B)

/-! ## `closeA` is a closure operator -/

/-- `closeA` is **monotone**. -/
theorem closeA_mono {G M : Type} (I : G → M → Prop) {A1 A2 : ExtSet G}
    (h : subA A1 A2) : subA (closeA I A1) (closeA I A2) :=
  primeB_antitone I (primeA_antitone I h)
/-- `closeA` is **idempotent**: `A‴‴ = A″` collapses, i.e. `closeA (closeA A) = closeA A`. -/
theorem closeA_idem {G M : Type} (I : G → M → Prop) (A : ExtSet G) :
    closeA I (closeA I A) = closeA I A := by
  show primeB I (primeA I (closeA I A)) = primeB I (primeA I A)
  rw [primeA_closeA I A]

/-- A **closure operator** on a powerset ordered by inclusion: extensive, monotone,
idempotent (the powerset reading of `Settling`'s `Charge.Closure`). -/
structure ClosureOp (G : Type) where
  /-- The underlying operator. -/
  op : ExtSet G → ExtSet G
  /-- Extensive: `A ⊆ op A`. -/
  ext : ∀ A, subA A (op A)
  /-- Monotone in inclusion. -/
  mono : ∀ {A1 A2}, subA A1 A2 → subA (op A1) (op A2)
  /-- Idempotent. -/
  idem : ∀ A, op (op A) = op A

/-! ## the derivation Galois connection / closure bundle -/

/-- The bundled facts of the derivation **Galois connection**: the adjunction, both
antitonicities, extensiveness, the cancellation `A′ = A‴`, and the genuine
**closure operator** `closeA`. -/
structure GaloisConnectionData (G M : Type) (I : G → M → Prop) where
  /-- The antitone adjunction `A ⊆ B′ ⟺ B ⊆ A′`. -/
  adjunction : ∀ (A : ExtSet G) (B : IntSet M),
    subA A (primeB I B) ↔ subB B (primeA I A)
  /-- `primeA` antitone. -/
  primeA_anti : ∀ {A1 A2 : ExtSet G}, subA A1 A2 → subB (primeA I A2) (primeA I A1)
  /-- `primeB` antitone. -/
  primeB_anti : ∀ {B1 B2 : IntSet M}, subB B1 B2 → subA (primeB I B2) (primeB I B1)
  /-- Extensive on the object side. -/
  extensive : ∀ A : ExtSet G, subA A (closeA I A)
  /-- The cancellation `A′ = A‴`. -/
  cancel : ∀ A : ExtSet G, primeA I (closeA I A) = primeA I A
  /-- `closeA` is a genuine closure operator. -/
  closure : ClosureOp G

/-- The derivation operators of any formal context form a **Galois
connection**, and the composite `closeA A := A″` is a **closure operator**
(extensive / monotone / idempotent). -/
def derivation_galois_connection {G M : Type} (I : G → M → Prop) :
    GaloisConnectionData G M I where
  adjunction := prime_adjunction I
  primeA_anti := primeA_antitone I
  primeB_anti := primeB_antitone I
  extensive := subA_closeA I
  cancel := primeA_closeA I
  closure :=
    { op := closeA I
      ext := subA_closeA I
      mono := fun h => closeA_mono I h
      idem := closeA_idem I }

/-! ## Formal concepts and their order -/

/-- A **formal concept** of the context `(G, M, I)`: a closed pair `(extent, intent)`
with `primeA extent = intent` and `primeB intent = extent`. -/
structure Concept (G M : Type) (I : G → M → Prop) where
  /-- The extent (closed object set). -/
  extent : ExtSet G
  /-- The intent (closed attribute set). -/
  intent : IntSet M
  /-- The extent derives to the intent. -/
  extent_prime : primeA I extent = intent
  /-- The intent derives to the extent. -/
  intent_prime : primeB I intent = extent

/-- A concept is determined by its extent (the intent is forced). -/
theorem Concept.ext_eq {G M : Type} {I : G → M → Prop} {c d : Concept G M I}
    (h : c.extent = d.extent) : c = d := by
  cases c with | mk ce ci cep cip =>
  cases d with | mk de di dep dip =>
  simp only at h
  subst h
  have : ci = di := by rw [← cep, ← dep]
  subst this
  rfl

/-- The extent of a concept is **closed**: `closeA extent = extent`. -/
theorem Concept.extent_closed {G M : Type} {I : G → M → Prop} (c : Concept G M I) :
    closeA I c.extent = c.extent := by
  show primeB I (primeA I c.extent) = c.extent
  rw [c.extent_prime, c.intent_prime]

/-- Build a concept from any **closed** extent `A = A″`. -/
def conceptOfClosed {G M : Type} (I : G → M → Prop) (A : ExtSet G)
    (h : closeA I A = A) : Concept G M I where
  extent := A
  intent := primeA I A
  extent_prime := rfl
  intent_prime := h

/-- The closure of any object set yields a concept (its extent is `A″`). -/
def conceptOfExtent {G M : Type} (I : G → M → Prop) (A : ExtSet G) : Concept G M I :=
  conceptOfClosed I (closeA I A) (closeA_idem I A)

/-- The **concept order**: `c ≤ d` iff `c.extent ⊆ d.extent`. -/
def leC {G M : Type} {I : G → M → Prop} (c d : Concept G M I) : Prop :=
  subA c.extent d.extent

theorem leC_refl {G M : Type} {I : G → M → Prop} (c : Concept G M I) : leC c c :=
  subA_refl c.extent
theorem leC_trans {G M : Type} {I : G → M → Prop} {c d e : Concept G M I}
    (h1 : leC c d) (h2 : leC d e) : leC c e := subA_trans h1 h2
theorem leC_antisymm {G M : Type} {I : G → M → Prop} {c d : Concept G M I}
    (h1 : leC c d) (h2 : leC d c) : c = d :=
  Concept.ext_eq (subA_antisymm h1 h2)

/-! ## Family meets and joins of concepts -/

/-- The **intersection of the extents** of a family `S` of concepts (indexed by a
predicate on concepts). This is already closed, so it is the meet's extent. -/
def familyMeetExtent {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop) :
    ExtSet G := fun g => ∀ c, S c → c.extent g

/-- The **union of the extents** of a family `S` of concepts; its closure is the
join's extent. -/
def familyJoinExtent {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop) :
    ExtSet G := fun g => ∃ c, S c ∧ c.extent g

/-- An intersection of closed sets is closed: `familyMeetExtent` is its own closure. -/
theorem familyMeetExtent_closed {G M : Type} {I : G → M → Prop}
    (S : Concept G M I → Prop) :
    closeA I (familyMeetExtent S) = familyMeetExtent S := by
  apply subA_antisymm
  · -- closeA (⋂ extents) ⊆ each extent (closed) ⊆ ⋂ extents
    intro g hg c hc
    have hsub : subA (familyMeetExtent S) c.extent := fun x hx => hx c hc
    have : subA (closeA I (familyMeetExtent S)) (closeA I c.extent) :=
      closeA_mono I hsub
    have hg' : closeA I c.extent g := this g hg
    rw [c.extent_closed] at hg'
    exact hg'
  · exact subA_closeA I (familyMeetExtent S)

/-- The **meet** of a family of concepts: extent = intersection of extents. -/
def familyMeet {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop) :
    Concept G M I :=
  conceptOfClosed I (familyMeetExtent S) (familyMeetExtent_closed S)

/-- The **join** of a family of concepts: extent = closure of the union of extents. -/
def familyJoin {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop) :
    Concept G M I :=
  conceptOfExtent I (familyJoinExtent S)

/-! ### Infimum property of `familyMeet` -/

/-- `familyMeet S` is a **lower bound** of `S`. -/
theorem familyMeet_le {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop)
    (c : Concept G M I) (hc : S c) : leC (familyMeet S) c :=
  fun g hg => hg c hc
/-- `familyMeet S` is the **greatest** lower bound. -/
theorem le_familyMeet {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop)
    (d : Concept G M I) (h : ∀ c, S c → leC d c) : leC d (familyMeet S) :=
  fun g hg c hc => h c hc g hg

/-! ### Supremum property of `familyJoin` -/

/-- `familyJoin S` is an **upper bound** of `S`. -/
theorem familyJoin_ge {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop)
    (c : Concept G M I) (hc : S c) : leC c (familyJoin S) := by
  show subA c.extent (closeA I (familyJoinExtent S))
  have h1 : subA c.extent (familyJoinExtent S) := fun g hg => ⟨c, hc, hg⟩
  exact subA_trans h1 (subA_closeA I (familyJoinExtent S))
/-- `familyJoin S` is the **least** upper bound. -/
theorem familyJoin_le {G M : Type} {I : G → M → Prop} (S : Concept G M I → Prop)
    (d : Concept G M I) (h : ∀ c, S c → leC c d) : leC (familyJoin S) d := by
  show subA (closeA I (familyJoinExtent S)) d.extent
  have hunion : subA (familyJoinExtent S) d.extent := by
    rintro g ⟨c, hc, hg⟩; exact h c hc g hg
  -- close both sides; d.extent is closed
  have hclosed : subA (closeA I (familyJoinExtent S)) (closeA I d.extent) :=
    closeA_mono I hunion
  intro g hg
  have := hclosed g hg
  rw [d.extent_closed] at this
  exact this

/-! ## Attribute implications -/

/-- An **attribute implication** `B₁ ⟹ B₂` *holds in the context* when every object
having all of `B₁` also has all of `B₂` — equivalently `primeB B₁ ⊆ primeB B₂`. -/
def implies {G M : Type} (I : G → M → Prop) (B1 B2 : IntSet M) : Prop :=
  subA (primeB I B1) (primeB I B2)

/-- **Characterization.** `B₁ ⟹ B₂` holds iff `B₂ ⊆ closeM B₁ = primeA (primeB B₁)`. -/
theorem implies_iff_closeM {G M : Type} (I : G → M → Prop) (B1 B2 : IntSet M) :
    implies I B1 B2 ↔ subB B2 (closeM I B1) := by
  constructor
  · intro h m hm g hg
    -- g ∈ primeB B1, want I g m; from B2 ⊆ ... no: use h : primeB B1 ⊆ primeB B2
    exact (h g hg) m hm
  · intro h
    -- B2 ⊆ closeM B1 = primeA (primeB B1); want primeB B1 ⊆ primeB B2
    intro g hg m hm
    exact (h m hm) g hg

/-! ## the concept lattice is complete + attribute-implication law -/

/-- The bundled **fundamental theorem of FCA** for this context: the concept order is a
partial order, every family of concepts has an infimum (`familyMeet`) and a supremum
(`familyJoin`) — so the concepts form a **complete lattice** — together with the
**attribute-implication** characterization `B₁ ⟹ B₂ ⟺ B₂ ⊆ closeM B₁`. -/
structure ConceptLatticeData (G M : Type) (I : G → M → Prop) where
  /-- The concept order is reflexive. -/
  le_refl : ∀ c : Concept G M I, leC c c
  /-- Transitive. -/
  le_trans : ∀ {c d e : Concept G M I}, leC c d → leC d e → leC c e
  /-- Antisymmetric. -/
  le_antisymm : ∀ {c d : Concept G M I}, leC c d → leC d c → c = d
  /-- The infimum operator. -/
  inf : (Concept G M I → Prop) → Concept G M I
  /-- `inf S` is a lower bound. -/
  inf_le : ∀ (S : Concept G M I → Prop) c, S c → leC (inf S) c
  /-- `inf S` is the greatest lower bound. -/
  le_inf : ∀ (S : Concept G M I → Prop) d, (∀ c, S c → leC d c) → leC d (inf S)
  /-- The supremum operator. -/
  sup : (Concept G M I → Prop) → Concept G M I
  /-- `sup S` is an upper bound. -/
  le_sup : ∀ (S : Concept G M I → Prop) c, S c → leC c (sup S)
  /-- `sup S` is the least upper bound. -/
  sup_le : ∀ (S : Concept G M I → Prop) d, (∀ c, S c → leC c d) → leC (sup S) d
  /-- The attribute-implication characterization. -/
  implication : ∀ B1 B2 : IntSet M, implies I B1 B2 ↔ subB B2 (closeM I B1)

/-- The formal concepts of any context form a **complete lattice** under
extent-inclusion (the fundamental theorem of FCA), with the family meet/join above as
infimum/supremum, and attribute implications characterized by `closeM`. -/
def concept_lattice_complete {G M : Type} (I : G → M → Prop) :
    ConceptLatticeData G M I where
  le_refl := leC_refl
  le_trans := leC_trans
  le_antisymm := leC_antisymm
  inf := familyMeet
  inf_le := familyMeet_le
  le_inf := le_familyMeet
  sup := familyJoin
  le_sup := familyJoin_ge
  sup_le := familyJoin_le
  implication := implies_iff_closeM I

end FCA
end RelMath
