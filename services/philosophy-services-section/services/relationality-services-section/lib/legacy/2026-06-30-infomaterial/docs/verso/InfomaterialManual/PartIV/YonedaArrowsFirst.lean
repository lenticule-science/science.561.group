import InfomaterialManual.DocSetup
import Infomaterial

open Verso.Genre Manual InlineLean
open Infomaterial.Yoneda

/-!
A recovered-foundations chapter: the Yoneda lemma and the arrows-first thesis — an
object is recovered from its bundle of incoming morphisms. Welds against
`Infomaterial.Yoneda`, closing the "category theory is already Infomaterial" circle at the
predication base.
-/

#doc (Manual) "Yoneda arrows-first: an object is its morphisms" =>

# Yoneda Arrows-First — An Object Is Its Morphisms

_A recovered foundation: the object is nothing over and above its arrows, and the
Yoneda embedding proves it._

Infomaterial generates oriented morphisms at predication before it has any notion of a
free-standing object. This chapter shows that costs nothing: an object is completely
recovered from its bundle of incoming arrows, via the *Yoneda embedding* into
presheaves. The codomain is a derived projection of the morphism structure — the
corpus's Curry–Howard-by-Yoneda directionality, made a theorem.

## 1. Small categories and presheaves

A {name Infomaterial.Yoneda.SmallCat}`SmallCat` is a bundled small category; a presheaf is a
contravariant functor into types, with the functor laws as fields.

{docstring Infomaterial.Yoneda.Presheaf}

A natural transformation {name Infomaterial.Yoneda.Nat}`Nat` carries the naturality square,
and {name Infomaterial.Yoneda.repr}`repr` is the representable presheaf `y(X) = Hom(−, X)` —
the bundle of arrows into `X`.

## 2. The Yoneda lemma

The lemma is the bijection between natural transformations out of a representable and
the elements of the target presheaf — proven both directions, with naturality.

{docstring Infomaterial.Yoneda.yoneda_lemma}

## 3. Full and faithful

Specialized to two representables, the lemma says the embedding `y` is fully faithful:
natural transformations `y(X) ⟹ y(Y)` are *exactly* the morphisms `X ⟶ Y`
({name Infomaterial.Yoneda.yoneda_fully_faithful}`yoneda_fully_faithful`). The inverse
direction recovers a morphism from its image by evaluation at the identity:

```lean
example (C : SmallCat) {X Y : C.Obj}
    (f : C.Hom X Y) :
    (yoneda_fully_faithful C X Y).toFun
      (yoneda C f) = f :=
  yoneda_recovers_hom C f
```

Fullness ({name Infomaterial.Yoneda.yoneda_full}`yoneda_full`) and faithfulness
({name Infomaterial.Yoneda.yoneda_faithful}`yoneda_faithful`) are the two halves, and `y`
respects identity and composition — it is a genuine embedding.

## 4. An object is its morphisms

Hence the thesis: two objects are isomorphic exactly when their arrow-bundles are, and
the recovered maps are the originals.

{docstring Infomaterial.Yoneda.object_is_its_morphisms}

## 5. The instances inside Infomaterial

The thesis is then realized on Infomaterial's own structure. The thin *knowledge-presheaf
category* over {name Infomaterial.Charge}`Charge` — objects are charges, an arrow `a ⟶ b` is
a proof `a ≤ₖ b` — has the property that an iso of arrow-bundles forces equality of
charges ({name Infomaterial.Yoneda.kp_object_is_its_arrows}`kp_object_is_its_arrows`). And
the predication category itself, whose objects are predication cells, satisfies the
same ({name Infomaterial.Yoneda.predication_object_is_its_arrows}`predication_object_is_its_arrows`).

So "category theory is already Infomaterial" closes as a theorem: the categorical structure
the library uses is not imported, and its central fact — that objects are their
arrows — holds at the predication base the whole edifice rests on.
