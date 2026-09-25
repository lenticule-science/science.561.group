import ObsmetrologiaManual.DocSetup
import Obsmetrologia

open Verso.Genre Manual InlineLean
open Obsmetrologia.Predicating.CurryHowardLambek

/-!
A recovered-foundations chapter: confluence (Church–Rosser) for the simply-typed
lambda calculus, proven by Takahashi's complete-development method, together with the
Curry–Howard and Lambek halves of the correspondence. Every cited declaration is a
build-failing `{name …}`/`{docstring …}` weld against the current Obsmetrologia
Curry-Howard-Lambek declarations, and the
load-bearing theorems are re-elaborated as `lean` terms, so the exposition cannot
drift from the proof.
-/

#doc (Manual) "Church–Rosser: confluence by complete development" =>

# Church–Rosser — Confluence by Complete Development

_A recovered foundation: PROOFS = PROGRAMS = MORPHISMS, with the central confluence
theorem proven in full rather than asserted._

The Curry–Howard–Lambek correspondence is not a fresh corpus node. It is the
categorical-logic *projection* of the predication hyperdoctrine — Lawvere's quantifier
adjoints `∃_f ⊣ f* ⊣ ∀_f` read at the level of simple types. This chapter makes the
propositional, simply-typed projection a theorem, and proves its hardest part —
confluence of reduction — by the Tait–Martin-Löf / Takahashi method, with no stubs.

The three readings the chapter establishes:

* *Curry* — types are propositions, terms are proofs;
* *Church–Rosser* — reduction is confluent, so a proof's normal form is well-defined;
* *Lambek* — the type structure is a cartesian closed category.

## 1. The object language: a simply-typed lambda calculus

The types {name Obsmetrologia.Predicating.CurryHowardLambek.Ty}`Ty` are `base`, `arrow` (→), `prod` (×), and `unit`.
The terms {name Obsmetrologia.Predicating.CurryHowardLambek.Tm}`Tm` are de-Bruijn — `var n`, `lam`, `app`, `pair`,
`fst`, `snd`, `star` — and {name Obsmetrologia.Predicating.CurryHowardLambek.HasTy}`HasTy` is the intrinsic typing
relation `HasTy Γ t A` over a context `List Ty`.

## 2. Reduction

The one-step relation contracts a β-redex or a projection, congruently in every
subterm; {name Obsmetrologia.Predicating.CurryHowardLambek.Red}`Red` is its reflexive-transitive closure — the actual
notion of "computes to."

{docstring Obsmetrologia.Predicating.CurryHowardLambek.step}

Confluence is the claim that this relation never forces an irreversible choice: if a
term reduces two different ways, the two results can always be brought back together.
The difficulty is that {name Obsmetrologia.Predicating.CurryHowardLambek.step}`step` itself does *not* have the
diamond property — one step on the left may need many steps on the right to catch up.

## 3. The method: parallel reduction and complete development

The Takahashi method routes around that difficulty through an auxiliary relation that
*does* have the diamond property, sandwiched between `step` and `Red`.

{docstring Obsmetrologia.Predicating.CurryHowardLambek.Par}

Parallel reduction reduces any chosen set of redexes at once. The key construction is
the *complete development* — reduce *every* redex present, simultaneously:

{docstring Obsmetrologia.Predicating.CurryHowardLambek.dev}

## 4. The triangle and the diamond

The crux is one lemma, {name Obsmetrologia.Predicating.CurryHowardLambek.par_triangle}`par_triangle`: `dev t` is
*cofinal* among the parallel reducts of `t` — any parallel step out of `t` can be
completed to `dev t`.

The diamond property {name Obsmetrologia.Predicating.CurryHowardLambek.par_diamond}`par_diamond` for parallel
reduction falls out immediately, and — the part worth noticing — its common reduct is
*explicit*: both sides meet at `dev t`, not at some existentially-quantified mystery
term.

```lean
example {t u v : Tm}
    (h1 : Par t u) (h2 : Par t v) :
    Par u (dev t) ∧ Par v (dev t) :=
  ⟨par_triangle h1, par_triangle h2⟩
```

## 5. Confluence (Church–Rosser)

Diamond for one parallel step lifts, by the standard strip argument, to confluence of
the transitive closure; and since parallel reduction is sandwiched between `step` and
`Red`, the closures coincide. Hence confluence of ordinary reduction:

{docstring Obsmetrologia.Predicating.CurryHowardLambek.church_rosser}

```lean
example {t u v : Tm}
    (h1 : Red t u) (h2 : Red t v) :
    ∃ w, Red u w ∧ Red v w :=
  church_rosser h1 h2
```

This is the genuine theorem, not a model of it: `Red` is the real reflexive-transitive
closure of real β/projection reduction on real de-Bruijn terms (with the full suite of
renaming/substitution lemmas — `subst_subst`, `par_subst`, `par_inst` — discharged,
not assumed).

## 6. Curry and Lambek — the other two corners

With normalization well-defined, the other two readings are short. *Curry*: a type,
read as a proposition via {name Obsmetrologia.Predicating.CurryHowardLambek.propOfTy}`propOfTy`, is inhabited whenever
the base proposition is — the propositions-as-types half ({name Obsmetrologia.Predicating.CurryHowardLambek.curry_howard}`curry_howard`).

```lean
example {B : Prop} (hB : B) (A : Ty) :
    propOfTy B A :=
  curry_howard hB A
```

*Lambek*: the type structure is a cartesian closed category — `unit` terminal, `prod`
the product cone, `arrow` the exponential with the currying adjunction
`Hom(C × A, B) ≅ Hom(C, A → B)`. The adjunction's two triangle identities hold on the
nose:

```lean
example (B : Prop) (C A D : Ty) :
    (∀ f, uncurryFn B C A D (curryFn B C A D f) = f)
    ∧ (∀ g, curryFn B C A D (uncurryFn B C A D g) = g) :=
  ccc_exponential_adjunction B C A D
```

The three readings are collected into one bundle
{name Obsmetrologia.Predicating.CurryHowardLambek.CurryHowardLambek}`CurryHowardLambek`, inhabited by
{name Obsmetrologia.Predicating.CurryHowardLambek.curry_howard_lambek}`curry_howard_lambek`.

## 7. Closing the circle: the CHL quartet is the recurring four

The type-formers themselves — terminal, product, exponential, and the dual — are a
four-element index, {name Obsmetrologia.Predicating.CurryHowardLambek.TypeFormer}`TypeFormer`, and that index is the
*same* {name Obsmetrologia.Articulating.Corner}`Articulating.Corner` the bilattice reading, the nuclear quartet, and
the modal four are read off (cf. the Part III keystone). The CHL quartet does not
introduce a fifth structure; it re-meets the recurring four.

```lean
example : TypeFormer.all.length = 4 :=
  TypeFormer.card_eq_four

example (f : TypeFormer) :
    TypeFormer.ofCorner (TypeFormer.toCorner f) = f :=
  TypeFormer.ofCorner_toCorner f
```

That the four type-formers are the nuclear quartet's four corners — same index,
reused verbatim — is {name Obsmetrologia.Predicating.CurryHowardLambek.chl_quartet_is_nuclear}`chl_quartet_is_nuclear`.

So Curry–Howard–Lambek is not an external correspondence imported into Obsmetrologia. Its
logical, computational, and categorical faces are three readings of the predication
hyperdoctrine, and its four type-formers are the four corners the whole library keeps
meeting. The one substantial theorem — that reduction is confluent — is proven here in
full.
