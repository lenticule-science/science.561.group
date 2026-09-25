import Obsmetrologia.Language.Predicating.Cell
import Obsmetrologia.Language.Predicating.Hyperdoctrine
import Obsmetrologia.Language.Predicating.Fibration
import Obsmetrologia.Language.Positing.Valuation
import Obsmetrologia.Language.Settling

/-!
# YonedaArrowsFirst — an object is recovered from its morphisms

This is the last categorical node. It closes the circle "category theory is already
Obsmetrologia" by proving the **arrows-first thesis**: an object is nothing over and above
its bundle of incoming arrows, and is completely recovered from them via the **Yoneda
embedding** into presheaves. The codomain/object is a *derived projection* of the morphism
structure — exactly the corpus's Curry–Howard-by-Yoneda directionality (see
`content/CLAUDE.md`: "Curry–Howard directionality by Yoneda embedding").

Corpus nodes read:
* `…/predication-fiber-algebra/content/presheaf-indexed-fiber/presheaf-indexed-fiber.md`
  — a fiber algebra packaged as a presheaf `𝓕 : 𝓒ᵒᵖ → Bilat` on a small context
  category; restriction maps are homomorphisms; presheaf laws
  `𝓕(id)=id`, `𝓕(g∘f)=𝓕(f)∘𝓕(g)`. We formalize presheaves into `Set` (Type) — the
  generic shape the bilattice-valued instance specializes; the value-into-`Bilat` case
  is `PredicationFibration`'s Grothendieck transpose `F : 𝓒ᵒᵖ → DBiLat(L)`, a presheaf
  whose components are the bilattice-homomorphism reindexings.
* `…/settling-cohomology/_archive/predication-bucket-3-knowledge-presheaf-category.md`
  and `…-initial-terminal.md` — the **knowledge-presheaf category** `KP`, a *thin*
  (poset-enriched) category: `Hom(v,v')` is a singleton iff `v ≤ₖ v'`, else empty;
  it has an initial object (constant-⊥ₖ) and terminal object (constant-⊤ₖ). The
  arrows-first reading is sharpest in a thin category, where "object recovered from
  its arrows" is `v ≅ v' ↔ y(v) ≅ y(v')`.

## What is proved

1. `SmallCat` — a (small) category: objects, `Hom`, `id`, `comp`, and the three
   category laws (left/right unit, associativity). Models the predication category and
   the knowledge-presheaf category.
2. `Presheaf C` — a contravariant `Set`-valued functor `Cᵒᵖ → Type`: an object map and a
   *restriction* (reindexing) action `map f : P b → P a` for `f : a ⟶ b`, with the
   presheaf laws `map id = id`, `map (g ∘ f) = map f ∘ map g`. `Nat P Q` — natural
   transformations, with `funext`-extensionality `NatExt`.
3. `repr X` — the **representable presheaf** `y(X) = Hom(−, X)` (the object's bundle of
   incoming arrows), with restriction = precomposition. `yoneda` — `y` on morphisms.
4. **`yoneda_lemma`** — the Yoneda lemma: `Nat (y X) P ≅ P X`, a natural bijection.
   Both directions (`yonedaForward`/`yonedaBackward`) and both round-trips proved.
5. **`yoneda_fully_faithful`** — `Nat (y X) (y Y) ≅ Hom X Y`: `y` is full and faithful,
   so the object `X` is completely recovered from its presheaf of arrows `y(X)`.
6. **`object_is_its_morphisms`** / **`isoToPshIso_pshIsoToIso`** — in any small category,
   `X ≅ Y ⇔ y(X) ≅ y(Y)` (a presheaf isomorphism), with both round-trips proved
   (`pshIsoToIso ∘ isoToPshIso = id` and `isoToPshIso ∘ pshIsoToIso = id`), so the two
   constructions are mutually inverse. The object IS its system of arrows; the codomain is
   a derived projection. Instantiated on the thin knowledge-presheaf category
   (initial/terminal objects) to exhibit the arrows-first reading concretely.
-/

namespace Obsmetrologia
namespace Yoneda

/-! ## 1. A small category -/

/-- A **small category** `𝓒`: objects, hom-types, identity, composition, and the three
category laws. Composition `comp f g` is `g ∘ f` read left-to-right: `f : a ⟶ b`,
`g : b ⟶ c`, `comp f g : a ⟶ c`. Models the predication category (objects `φ`, the four
generators as morphisms) and the knowledge-presheaf category (thin). -/
structure SmallCat where
  /-- The objects. -/
  Obj : Type
  /-- The hom-type of arrows `a ⟶ b`. -/
  Hom : Obj → Obj → Type
  /-- The identity arrow on each object. -/
  id : (a : Obj) → Hom a a
  /-- Composition `comp f g = g ∘ f` (diagrammatic order). -/
  comp : {a b c : Obj} → Hom a b → Hom b c → Hom a c
  /-- Left identity law. -/
  id_comp : ∀ {a b : Obj} (f : Hom a b), comp (id a) f = f
  /-- Right identity law. -/
  comp_id : ∀ {a b : Obj} (f : Hom a b), comp f (id b) = f
  /-- Associativity. -/
  assoc : ∀ {a b c d : Obj} (f : Hom a b) (g : Hom b c) (h : Hom c d),
    comp (comp f g) h = comp f (comp g h)

namespace SmallCat

variable (C : SmallCat)

/-- An **isomorphism** `X ≅ Y` in `𝓒`: a forward/back pair with both round-trips. -/
structure Iso (X Y : C.Obj) where
  /-- The forward arrow. -/
  hom : C.Hom X Y
  /-- The backward arrow. -/
  inv : C.Hom Y X
  /-- `inv ∘ hom = id`. -/
  hom_inv : C.comp hom inv = C.id X
  /-- `hom ∘ inv = id`. -/
  inv_hom : C.comp inv hom = C.id Y

end SmallCat

/-! ## 2. Presheaves and natural transformations -/

/-- A **presheaf** on `𝓒` — a contravariant `Set`-valued functor `𝓒ᵒᵖ → Type`. `obj b`
is the set at `b`; `map f : obj b → obj a` is the **restriction** along `f : a ⟶ b`
(reindexing — the presheaf-indexed-fiber's restriction discipline). Laws:
`map id = id`, `map (comp f g) = map f ∘ map g` (contravariant). -/
structure Presheaf (C : SmallCat) where
  /-- The set at each object. -/
  obj : C.Obj → Type
  /-- Restriction along `f : a ⟶ b` lands `obj b → obj a` (contravariant). -/
  map : {a b : C.Obj} → C.Hom a b → obj b → obj a
  /-- `map id = id`. -/
  map_id : ∀ (a : C.Obj) (x : obj a), map (C.id a) x = x
  /-- `map (comp f g) = map f ∘ map g` — contravariant functoriality. -/
  map_comp : ∀ {a b c : C.Obj} (f : C.Hom a b) (g : C.Hom b c) (x : obj c),
    map (C.comp f g) x = map f (map g x)

/-- A **natural transformation** `α : P ⟹ Q` of presheaves: a component at each object
and the naturality square `Q.map f ∘ αb = αa ∘ P.map f`. -/
structure Nat {C : SmallCat} (P Q : Presheaf C) where
  /-- The component at each object. -/
  app : (a : C.Obj) → P.obj a → Q.obj a
  /-- Naturality: restriction commutes with the components. For `f : a ⟶ b`,
  `Q.map f (app b x) = app a (P.map f x)`. -/
  naturality : ∀ {a b : C.Obj} (f : C.Hom a b) (x : P.obj b),
    Q.map f (app b x) = app a (P.map f x)

/-- **Extensionality for natural transformations**: equal on every component ⇒ equal.
Uses `funext` (`Quot.sound`). -/
theorem NatExt {C : SmallCat} {P Q : Presheaf C} {α β : Nat P Q}
    (h : ∀ a x, α.app a x = β.app a x) : α = β := by
  cases α with
  | mk aapp anat =>
    cases β with
    | mk bapp bnat =>
      have happ : aapp = bapp := by
        funext a x; exact h a x
      subst happ
      rfl

/-! ### Presheaf isomorphism -/

/-- An **isomorphism of presheaves** `P ≅ Q`: a natural pair with both round-trips. -/
structure Psh.Iso {C : SmallCat} (P Q : Presheaf C) where
  /-- The forward natural transformation. -/
  hom : Nat P Q
  /-- The backward natural transformation. -/
  inv : Nat Q P
  /-- `inv ∘ hom = id` componentwise. -/
  hom_inv : ∀ a x, inv.app a (hom.app a x) = x
  /-- `hom ∘ inv = id` componentwise. -/
  inv_hom : ∀ a x, hom.app a (inv.app a x) = x

/-- **Extensionality for presheaf isomorphisms**: agreeing on `hom` and `inv` (the data
fields) forces equality — the two round-trip fields are proofs of propositions, hence
proof-irrelevant. Same shape as `NatExt`. -/
theorem Psh.IsoExt {C : SmallCat} {P Q : Presheaf C} {e f : Psh.Iso P Q}
    (hh : e.hom = f.hom) (hi : e.inv = f.inv) : e = f := by
  cases e with
  | mk ehom einv ehi eih =>
    cases f with
    | mk fhom finv fhi fih =>
      simp only at hh hi
      subst hh
      subst hi
      rfl

/-! ## 3. The representable presheaf y(X) = Hom(−, X) -/

/-- The **representable presheaf** `y(X) = Hom(−, X)` — the object `X` packaged as its
bundle of incoming arrows. Restriction along `f : a ⟶ b` is **precomposition**:
`map f (h : Hom b X) = comp f h : Hom a X`. The presheaf laws are the category's unit
and associativity laws. -/
def repr (C : SmallCat) (X : C.Obj) : Presheaf C where
  obj a := C.Hom a X
  map f h := C.comp f h
  map_id _ x := C.id_comp x
  map_comp f g x := C.assoc f g x

/-- `y` on morphisms: a morphism `f : X ⟶ Y` induces a natural transformation
`y(f) : y(X) ⟹ y(Y)` by **postcomposition**. This is the action of the Yoneda functor
`y : 𝓒 → [𝓒ᵒᵖ, Set]` on arrows. -/
def yoneda (C : SmallCat) {X Y : C.Obj} (f : C.Hom X Y) : Nat (repr C X) (repr C Y) where
  app _ h := C.comp h f
  naturality g h := (C.assoc g h f).symm

/-! ## 4. THE YONEDA LEMMA — Nat(y X, P) ≅ P X -/

/-- **Yoneda, forward.** A natural transformation `α : y(X) ⟹ P` is sent to its value on
the identity arrow: `α ↦ α_X(id_X) ∈ P X`. -/
def yonedaForward (C : SmallCat) (X : C.Obj) (P : Presheaf C)
    (α : Nat (repr C X) P) : P.obj X :=
  α.app X (C.id X)

/-- **Yoneda, backward.** An element `u ∈ P X` is sent to the natural transformation whose
component at `a` restricts `u` along each arrow `h : a ⟶ X`: `(u)_a(h) = P.map h u`.
Naturality is `P.map_comp`. -/
def yonedaBackward (C : SmallCat) (X : C.Obj) (P : Presheaf C)
    (u : P.obj X) : Nat (repr C X) P where
  app a h := P.map h u
  naturality {a b} f h := by
    -- goal: P.map f (P.map h u) = P.map (comp f h) u
    show P.map f (P.map h u) = P.map (C.comp f h) u
    rw [P.map_comp]

/-- **Round-trip 1:** `forward ∘ backward = id` on `P X`. The backward of `u`, evaluated
on the identity, gives `P.map id u = u`. -/
theorem yoneda_forward_backward (C : SmallCat) (X : C.Obj) (P : Presheaf C) (u : P.obj X) :
    yonedaForward C X P (yonedaBackward C X P u) = u := by
  show P.map (C.id X) u = u
  rw [P.map_id]

/-- **Round-trip 2:** `backward ∘ forward = id` on `Nat (y X) P`. For any `α`, the
backward of `α_X(id)` agrees with `α` on every component by naturality of `α` together
with the right-unit law `comp h id = h`. -/
theorem yoneda_backward_forward (C : SmallCat) (X : C.Obj) (P : Presheaf C)
    (α : Nat (repr C X) P) :
    yonedaBackward C X P (yonedaForward C X P α) = α := by
  apply NatExt
  intro a h
  -- LHS component: P.map h (α.app X (id X)); RHS: α.app a h
  show P.map h (α.app X (C.id X)) = α.app a h
  -- naturality of α at h : a ⟶ X applied to (id X) ∈ (y X).obj X = Hom X X:
  --   P.map h (α.app X (id X)) = α.app a ((repr C X).map h (id X))
  --   = α.app a (comp h (id X)) = α.app a h
  have hnat := α.naturality h (C.id X)
  -- hnat : P.map h (α.app X (id X)) = α.app a ((repr C X).map h (id X))
  rw [hnat]
  -- now: α.app a ((repr C X).map h (id X)) = α.app a h
  show α.app a (C.comp h (C.id X)) = α.app a h
  rw [C.comp_id]

/-- **THE YONEDA LEMMA.** `Nat (y X, P) ≅ P X` — a bijection between natural
transformations out of the representable presheaf and elements of `P` at `X`, given by
"evaluate at the identity," with explicit inverse. This is the arrows-first theorem in
its general form: a presheaf's value at `X` is exactly the maps out of `X`'s bundle of
arrows. Packaged as an explicit bijection (forward, backward, both round-trips). -/
structure Bijection (A B : Type) where
  /-- The forward map. -/
  toFun : A → B
  /-- The inverse map. -/
  invFun : B → A
  /-- `invFun ∘ toFun = id`. -/
  left : ∀ a, invFun (toFun a) = a
  /-- `toFun ∘ invFun = id`. -/
  right : ∀ b, toFun (invFun b) = b

/-- **`yoneda_lemma`** — the Yoneda bijection `Nat (y X) P ≅ P X`. -/
def yoneda_lemma (C : SmallCat) (X : C.Obj) (P : Presheaf C) :
    Bijection (Nat (repr C X) P) (P.obj X) where
  toFun := yonedaForward C X P
  invFun := yonedaBackward C X P
  left := yoneda_backward_forward C X P
  right := yoneda_forward_backward C X P

/-! ### Naturality of the Yoneda bijection (in P)

For a natural transformation `θ : P ⟹ Q`, the Yoneda bijection commutes with postcomposing
`θ`: evaluating `(θ ∘ α)` at the identity equals applying `θ_X` to `α`'s value at the
identity. This is the naturality of `yoneda_lemma` in the presheaf argument. -/

/-- Vertical composition of natural transformations `α : P ⟹ Q`, `β : Q ⟹ R`. -/
def vcomp {C : SmallCat} {P Q R : Presheaf C} (α : Nat P Q) (β : Nat Q R) : Nat P R where
  app a x := β.app a (α.app a x)
  naturality {a b} f x := by
    rw [β.naturality, α.naturality]

/-- **Naturality of the Yoneda lemma in `P`.** For `θ : P ⟹ Q` and `α : y(X) ⟹ P`,
`yonedaForward (θ ∘ α) = θ_X (yonedaForward α)`. So the family of bijections
`yoneda_lemma C X (–)` is natural in the presheaf argument. -/
theorem yoneda_lemma_natural (C : SmallCat) (X : C.Obj) {P Q : Presheaf C}
    (θ : Nat P Q) (α : Nat (repr C X) P) :
    yonedaForward C X Q (vcomp α θ) = θ.app X (yonedaForward C X P α) := rfl

/-! ## 5. y IS FULLY FAITHFUL — Nat(y X, y Y) ≅ Hom(X, Y) -/

/-- **`yoneda_fully_faithful`** — the Yoneda embedding is full and faithful:
`Nat (y X) (y Y) ≅ Hom (X, Y)`. This is `yoneda_lemma` with `P := y Y`, since
`(y Y).obj X = Hom (X, Y)`. The bijection sends `α ↦ α_X(id_X)` and `f ↦ y(f)`. So an
object `X` is **completely recovered** from its presheaf of incoming arrows `y(X)`:
arrows-first. -/
def yoneda_fully_faithful (C : SmallCat) (X Y : C.Obj) :
    Bijection (Nat (repr C X) (repr C Y)) (C.Hom X Y) :=
  yoneda_lemma C X (repr C Y)

/-- **Faithful (explicit):** `yoneda` is injective on hom — `y(f) = y(g) ⇒ f = g`. The
inverse direction of full-faithfulness recovers `f` from `y(f)` by evaluation at the
identity: `(yoneda_fully_faithful C X Y).toFun (yoneda C f) = f`. -/
theorem yoneda_recovers_hom (C : SmallCat) {X Y : C.Obj} (f : C.Hom X Y) :
    (yoneda_fully_faithful C X Y).toFun (yoneda C f) = f := by
  show C.comp (C.id X) f = f
  rw [C.id_comp]

/-- **Full (explicit):** every natural transformation `y(X) ⟹ y(Y)` is `y(f)` for the
recovered `f`. `yoneda` of the recovered arrow round-trips back to `α`. -/
theorem yoneda_full (C : SmallCat) {X Y : C.Obj} (α : Nat (repr C X) (repr C Y)) :
    yoneda C ((yoneda_fully_faithful C X Y).toFun α) = α :=
  (yoneda_fully_faithful C X Y).left α

/-- `yoneda` is **faithful**: injective on each hom-set. -/
theorem yoneda_faithful (C : SmallCat) {X Y : C.Obj} {f g : C.Hom X Y}
    (h : yoneda C f = yoneda C g) : f = g := by
  have hf := yoneda_recovers_hom C f
  have hg := yoneda_recovers_hom C g
  rw [← hf, ← hg, h]

/-! ## 6. THE ARROWS-FIRST READING — an object IS its system of morphisms -/

/-- `y(f)` and `y(g)` compose to `y(g ∘ f)` (the Yoneda functor preserves composition). -/
theorem yoneda_comp (C : SmallCat) {X Y Z : C.Obj} (f : C.Hom X Y) (g : C.Hom Y Z) :
    vcomp (yoneda C f) (yoneda C g) = yoneda C (C.comp f g) := by
  apply NatExt
  intro a h
  show C.comp (C.comp h f) g = C.comp h (C.comp f g)
  rw [C.assoc]

/-- `y(id) = id` (the Yoneda functor preserves identities). -/
theorem yoneda_id (C : SmallCat) (X : C.Obj) :
    yoneda C (C.id X) = (⟨fun _ h => h, fun _ _ => rfl⟩ : Nat (repr C X) (repr C X)) := by
  apply NatExt
  intro a h
  show C.comp h (C.id X) = h
  rw [C.comp_id]

/-- The identity natural transformation on a presheaf. -/
def Nat.id {C : SmallCat} (P : Presheaf C) : Nat P P where
  app _ x := x
  naturality _ _ := rfl

/-- **Forward:** an isomorphism `X ≅ Y` of objects induces an isomorphism `y(X) ≅ y(Y)`
of presheaves (functoriality of `y`). -/
def isoToPshIso (C : SmallCat) {X Y : C.Obj} (e : C.Iso X Y) :
    Psh.Iso (repr C X) (repr C Y) where
  hom := yoneda C e.hom
  inv := yoneda C e.inv
  hom_inv a x := by
    -- yoneda inv (yoneda hom x) = comp (comp x hom) inv = comp x (comp hom inv) = comp x id = x
    show C.comp (C.comp x e.hom) e.inv = x
    rw [C.assoc, e.hom_inv, C.comp_id]
  inv_hom a x := by
    show C.comp (C.comp x e.inv) e.hom = x
    rw [C.assoc, e.inv_hom, C.comp_id]

/-- **Backward:** an isomorphism `y(X) ≅ y(Y)` of presheaves induces an isomorphism
`X ≅ Y` of objects — the object is recovered from its arrows. The component arrows come
from full-faithfulness (evaluate the natural iso at the identity); the round-trips follow
from faithfulness of `y` plus `yoneda_comp`/`yoneda_id`. -/
def pshIsoToIso (C : SmallCat) {X Y : C.Obj} (e : Psh.Iso (repr C X) (repr C Y)) :
    C.Iso X Y where
  hom := (yoneda_fully_faithful C X Y).toFun e.hom
  inv := (yoneda_fully_faithful C Y X).toFun e.inv
  hom_inv := by
    -- recovered hom ∘ recovered inv = id, proved via faithfulness of y
    apply yoneda_faithful C
    rw [← yoneda_comp]
    -- vcomp (yoneda f) (yoneda g) where f = recovered hom, g = recovered inv
    rw [yoneda_full, yoneda_full, yoneda_id]
    apply NatExt
    intro a x
    exact e.hom_inv a x
  inv_hom := by
    apply yoneda_faithful C
    rw [← yoneda_comp]
    rw [yoneda_full, yoneda_full, yoneda_id]
    apply NatExt
    intro a x
    exact e.inv_hom a x

/-- **`object_is_its_morphisms`** — the arrows-first thesis, forward round-trip. In any
small category, `pshIsoToIso ∘ isoToPshIso = id` on `C.Iso X Y`: turning an object
isomorphism into a presheaf isomorphism and recovering the object isomorphism from it
returns the original arrows. Combined with `isoToPshIso_pshIsoToIso` below (the other
round-trip, `isoToPshIso ∘ pshIsoToIso = id` on `Psh.Iso (repr C X) (repr C Y)`), the two
constructions `isoToPshIso`/`pshIsoToIso` are mutually inverse: an isomorphism of objects
`X ≅ Y` is the SAME DATA as an isomorphism of their presheaves of incoming arrows
`y(X) ≅ y(Y)`. So an object IS its system of arrows; the codomain/object is a derived
projection of the morphism structure. -/
theorem object_is_its_morphisms (C : SmallCat) (X Y : C.Obj) :
    (∀ e : C.Iso X Y,
        (pshIsoToIso C (isoToPshIso C e)).hom = e.hom
      ∧ (pshIsoToIso C (isoToPshIso C e)).inv = e.inv) := by
  intro e
  constructor
  · -- recovered hom of y(e.hom) is e.hom
    show (yoneda_fully_faithful C X Y).toFun (yoneda C e.hom) = e.hom
    exact yoneda_recovers_hom C e.hom
  · show (yoneda_fully_faithful C Y X).toFun (yoneda C e.inv) = e.inv
    exact yoneda_recovers_hom C e.inv

/-- **`isoToPshIso_pshIsoToIso`** — the arrows-first thesis, backward round-trip. In any
small category, `isoToPshIso ∘ pshIsoToIso = id` on `Psh.Iso (repr C X) (repr C Y)`: turning
a presheaf isomorphism into an object isomorphism (`pshIsoToIso`, via full-faithfulness of
`y`) and pushing it back through `y` (`isoToPshIso`) returns the original presheaf
isomorphism. Each component is exactly `yoneda_full` applied to `e.hom`/`e.inv`; the
resulting `hom`/`inv` equalities are assembled into full structure equality by
`Psh.IsoExt` (the round-trip proof fields being proof-irrelevant). Together with
`object_is_its_morphisms`, this completes the mutually-inverse round-trip bijection between
`C.Iso X Y` and `Psh.Iso (repr C X) (repr C Y)`. -/
theorem isoToPshIso_pshIsoToIso (C : SmallCat) {X Y : C.Obj}
    (e : Psh.Iso (repr C X) (repr C Y)) :
    isoToPshIso C (pshIsoToIso C e) = e :=
  Psh.IsoExt (yoneda_full C e.hom) (yoneda_full C e.inv)

/-! ## 7. INSTANCE — the thin knowledge-presheaf category over `Reading`

The knowledge-presheaf category `KP` is *thin*: `Hom(a,b)` is a singleton iff `a ≤ₖ b`,
else empty. We realize a faithful finite fragment on the four-corner `Reading` poset
(`Reading.KLE`), the value-bilattice at a point — objects are readings, an arrow `a ⟶ b`
is a proof `KLE a b`. This is the predication/knowledge-presheaf base in
miniature (one cell's fiber, ordered by knowledge), with the corpus's initial object
`⊥ₖ` and terminal object `⊤ₖ` (`…-initial-terminal.md`). On a thin category `y` is
automatically fully faithful — `object_is_its_morphisms` says `a ≅ b ⇔ y(a) ≅ y(b)`, and
since the category is a *poset* (antisymmetric), `a ≅ b ⇔ a = b`: the object is exactly
its up-set of arrows. -/

/-- The thin knowledge-presheaf category on the `Reading` knowledge poset: objects are
readings, `Hom a b = PLift (KLE a b)` (proof-irrelevant singleton/empty), identities and
composition are reflexivity/transitivity of `≤ₖ`. -/
def KnowledgePresheafCat : SmallCat where
  Obj := Reading
  Hom a b := PLift (Reading.KLE a b)
  id a := ⟨Reading.kle_refl a⟩
  comp {a b c} f g := ⟨Reading.kle_trans a b c f.down g.down⟩
  id_comp _ := rfl
  comp_id _ := rfl
  assoc _ _ _ := rfl

/-- The corpus's **initial object** of `KP`: the knowledge-bottom `⊥ₖ` — a unique arrow to
every object (`kBot_le`). -/
def kpInitialArrow (a : Reading) : KnowledgePresheafCat.Hom Reading.kBot a :=
  ⟨Reading.kBot_le a⟩

/-- The corpus's **terminal object** of `KP`: the knowledge-top `⊤ₖ` — a unique arrow from
every object (`le_kTop`). -/
def kpTerminalArrow (a : Reading) : KnowledgePresheafCat.Hom a Reading.kTop :=
  ⟨Reading.le_kTop a⟩

/-- In the thin knowledge-presheaf category, an **object iso is object equality**: `a ≅ b`
forces `a = b` by antisymmetry of `≤ₖ`. Combined with `object_is_its_morphisms`, this is
the sharpest arrows-first statement: the reading (object) is *literally* recovered from its
bundle of `≤ₖ`-arrows `y(a) = {x : KLE x a}`. -/
theorem kp_iso_is_eq {a b : Reading} (e : KnowledgePresheafCat.Iso a b) : a = b :=
  Reading.kle_antisymm a b e.hom.down e.inv.down

/-- **The arrows-first reading, concretely.** In the knowledge-presheaf category, a reading
`a` is recovered from its representable presheaf `y(a) = Hom(−, a) = {x | x ≤ₖ a}` (its
down-set of knowledge-arrows): if `y(a) ≅ y(b)` as presheaves then `a = b`. The object is
its system of incoming arrows — the corpus's initial/terminal `⊥ₖ`/`⊤ₖ` are then just the
empty-information and full-information *arrow bundles*. -/
theorem kp_object_is_its_arrows {a b : Reading}
    (e : Psh.Iso (repr KnowledgePresheafCat a) (repr KnowledgePresheafCat b)) : a = b :=
  kp_iso_is_eq (pshIsoToIso KnowledgePresheafCat e)

/-! ## 8. INSTANCE — the predication category as a SmallCat

The predication category's objects are predication cells `φ = (s,p,o)`; its four
generators (converse / subjProj / objProj / specialize) are endo-reindexings. We expose
the **discrete-on-cells with reindexing-monoid** realization is heavy; the faithful
small fact we land is that the cellwise reindexings form the *arrows*, and `converse` is
a self-inverse arrow — so each cell `φ` with `s ≠ o` is, via Yoneda, distinguished from
its converse `φᵒᵖ` purely by its arrow bundle. We package the predication base minimally
as objects = cells, morphisms = the free identity (the discrete category), enough to host
`y` on the cell objects. Note `converse` itself is *not* a morphism of this discrete
category (it moves between distinct objects, not an identity arrow), so it is not a case
of `object_is_its_morphisms`; what transports cheaply through `repr` is only its
object-level involution law `converse_converse` (`predication_converse_repr_involution`
below). -/

/-- The **discrete predication category**: objects are predication cells, the only arrows
are identities. (The generic Yoneda machinery above applies to any `SmallCat`; this hosts
`y` on the cell objects. The richer generator structure is `Predicating`'s
reindexings, whose presheaf transpose is `PredicationFibration`'s `F : 𝓒ᵒᵖ → DBiLat`.) -/
def PredicationDiscrete : SmallCat where
  Obj := PredicationCell
  Hom a b := PLift (a = b)
  id _ := ⟨rfl⟩
  comp {_ _ _} f g := ⟨f.down.trans g.down⟩
  id_comp _ := rfl
  comp_id _ := rfl
  assoc _ _ _ := rfl

/-- In the discrete predication category, Yoneda makes **object equality recoverable from
arrows**: distinct cells have non-isomorphic representable presheaves. Concretely a cell
`φ` and its converse `φᵒᵖ` are recovered as distinct objects whenever `s ≠ o`
(`Predicating.converse_ne`), so the *oriented* predication object is its bundle
of arrows, not a free datum. -/
theorem predication_object_is_its_arrows {φ : PredicationCell}
    (e : PredicationDiscrete.Iso φ (PredicationCell.converse φ))
    (h : φ.subject ≠ φ.object) : False :=
  (PredicationCell.converse_ne φ h) (e.inv.down)

/-- `converse`'s object-level involution (`converse_converse`) transported through `repr`:
taking `y` of a cell after converse-ing it twice gives back `y` of the original cell. This
is the honest, cheap sense in which the converse generator is "involutive at the presheaf
level" here — `converse` is not itself an arrow of `PredicationDiscrete` (only identities
are), so there is no natural transformation `y(φ) ⟹ y(φᵒᵖ)` to speak of in general; what
survives is this pointwise equation of representable presheaves. -/
theorem predication_converse_repr_involution (φ : PredicationCell) :
    repr PredicationDiscrete (PredicationCell.converse (PredicationCell.converse φ))
      = repr PredicationDiscrete φ := by
  rw [PredicationCell.converse_converse]

end Yoneda
end Obsmetrologia
