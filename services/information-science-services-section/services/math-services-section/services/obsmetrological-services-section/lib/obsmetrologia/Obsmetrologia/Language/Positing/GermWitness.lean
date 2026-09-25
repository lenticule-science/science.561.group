import Obsmetrologia.Language.Positing.Record

/-!
# The witnessed germ order — where the residue stops being discarded

`Record.DomBy` says that one record sequence is dominated by another when *some* fixed
record covers the gap at every stage:

```
def DomBy (s t : Nat → Record) : Prop :=
  ∃ C : Record, ∀ n, KLE (s n) (add (t n) C)
```

That existential is where the corpus loses the thing it is trying to measure. The witness
`C` **is** the residue — the standing surplus by which `t` runs ahead of `s` — and two
sequences can be dominated by many different bounds. `∃` keeps only that *some* bound
exists, and `Prop`'s proof irrelevance then collapses every one of them to a single
inhabitant. So `DomBy` is a genuine preorder that fails antisymmetry
(`Record.germ_order_not_antisymm`) and is *still* thin: at most one arrow between any two
points, because the arrows were quantified away in their own definition.

This module keeps the witness. `DomByW s t` is the `Type` of bounds that dominate, so its
elements are the residues themselves. Two distinct bounds are two distinct arrows, and
`domByW_not_thin` exhibits a hom-`Type` with more than one inhabitant — the first carrier
in the corpus where a hom is genuinely many-valued rather than a `Prop` wearing arrow
notation.

The point is not generality for its own sake. `Closure.LaxSlackDiagnosis` proves that a
lax closure cell is a witnessed failure of antisymmetry, so stable contradiction can live
only on a non-antisymmetric carrier; `Record.tally_lax_slack` then exhibits one. But a
`Prop`-valued order cannot record *how* two things fail to be equal, only *that* they do.
Keeping the bound is what makes the failure measurable rather than merely present.

Nothing here replaces `DomBy`: `DomByW.forget` maps the witnessed order onto it, so every
existing germ theorem still applies. This is a refinement, not a substitution.
-/

namespace Obsmetrologia
namespace Record

/-! ## The witnessed order -/

/-- **Witnessed bounded-difference domination.** An arrow `s ⟶ t` is a record `C` covering
the gap at every stage. Unlike `DomBy`, which existentially quantifies `C` away, this is a
`Type`: its inhabitants are the covering bounds, and distinct bounds are distinct arrows.
The bound is the residue. -/
def DomByW (s t : Nat → Record) : Type :=
  { C : Record // ∀ n, KLE (s n) (add (t n) C) }

/-- The bound carried by a witnessed domination — the residue itself. -/
def DomByW.bound {s t : Nat → Record} (w : DomByW s t) : Record := w.val

/-- **Forgetting the witness recovers the corpus's existing order.** Every theorem proved
about `DomBy` continues to hold of anything this module produces. -/
theorem DomByW.forget {s t : Nat → Record} (w : DomByW s t) : DomBy s t :=
  ⟨w.val, w.property⟩

/-- Two witnessed dominations are equal exactly when their bounds are: the covering
condition is a `Prop`, so it contributes nothing to identity. This is what makes the
hom-`Type`'s cardinality *the number of distinct residues*, no more and no less. -/
theorem DomByW.ext {s t : Nat → Record} {v w : DomByW s t}
    (h : v.val = w.val) : v = w :=
  Subtype.ext h

/-! ## Identity and composition — the germ carrier as a category

The two order laws `domBy_refl` and `domBy_trans` are re-proved here as *data*: the
identity arrow carries the empty bound, and composition adds the bounds. Addition of
residues along a composite is the whole content of transitivity once the witness is kept.
-/

/-- The **identity arrow**: dominated by oneself at no cost. -/
def DomByW.id (s : Nat → Record) : DomByW s s :=
  ⟨kBot, fun _ => ⟨Nat.le_add_right _ _, Nat.le_add_right _ _⟩⟩

/-- **Composition adds residues.** If `t` runs ahead of `s` by `C₁` and `u` runs ahead of
`t` by `C₂`, then `u` runs ahead of `s` by `C₂ + C₁`. The proof is `domBy_trans`'s, with
the bound retained rather than discarded. -/
def DomByW.comp {s t u : Nat → Record} (g : DomByW t u) (f : DomByW s t) : DomByW s u :=
  ⟨add g.val f.val, fun n => by
    refine ⟨?_, ?_⟩
    · show (s n).pos ≤ (u n).pos + (g.val.pos + f.val.pos)
      exact Nat.add_assoc (u n).pos g.val.pos f.val.pos ▸
        Nat.le_trans (f.property n).1 (Nat.add_le_add_right (g.property n).1 f.val.pos)
    · show (s n).neg ≤ (u n).neg + (g.val.neg + f.val.neg)
      exact Nat.add_assoc (u n).neg g.val.neg f.val.neg ▸
        Nat.le_trans (f.property n).2 (Nat.add_le_add_right (g.property n).2 f.val.neg)⟩

/-- The composite's bound is the sum of the bounds — residues accumulate along a chain. -/
theorem DomByW.comp_bound {s t u : Nat → Record} (g : DomByW t u) (f : DomByW s t) :
    (DomByW.comp g f).bound = add g.bound f.bound := rfl

/-! ## The category laws -/

/-- The empty record is a right unit for accumulation. -/
theorem add_kBot (a : Record) : add a kBot = a :=
  ext (Nat.add_zero a.pos) (Nat.add_zero a.neg)

/-- The empty record is a left unit for accumulation. -/
theorem kBot_add (a : Record) : add kBot a = a :=
  ext (Nat.zero_add a.pos) (Nat.zero_add a.neg)

/-- Accumulation is associative — so composing residues in either grouping gives the same
standing surplus. -/
theorem add_assoc (a b c : Record) : add (add a b) c = add a (add b c) :=
  ext (Nat.add_assoc a.pos b.pos c.pos) (Nat.add_assoc a.neg b.neg c.neg)

/-- Left identity: composing with the identity arrow leaves the residue unchanged. -/
theorem DomByW.id_comp {s t : Nat → Record} (f : DomByW s t) :
    DomByW.comp (DomByW.id t) f = f :=
  DomByW.ext (by
    show add kBot f.val = f.val
    exact kBot_add f.val)

/-- Right identity. -/
theorem DomByW.comp_id {s t : Nat → Record} (f : DomByW s t) :
    DomByW.comp f (DomByW.id s) = f :=
  DomByW.ext (by
    show add f.val kBot = f.val
    exact add_kBot f.val)

/-- Associativity: residues accumulate associatively, so the order of composition does not
change the total surplus. -/
theorem DomByW.comp_assoc {s t u v : Nat → Record}
    (h : DomByW u v) (g : DomByW t u) (f : DomByW s t) :
    DomByW.comp (DomByW.comp h g) f = DomByW.comp h (DomByW.comp g f) :=
  DomByW.ext (add_assoc h.val g.val f.val)

/-! ## The payoff: a hom that is not a `Prop`

`Record.germ_order_not_antisymm` shows the germ order fails antisymmetry — two distinct
sequences dominate each other. That is a statement about *objects*. The statement below is
about *arrows*: a single hom-`Type` with two distinct inhabitants. No `Prop`-valued
relation can satisfy it, so no order structure elsewhere in the corpus can.
-/

/-- The constantly-empty sequence — the germ carrier's seed. -/
def germSeed : Nat → Record := fun _ => kBot

/-- The zero-cost self-domination of the seed. -/
def germSeedId : DomByW germSeed germSeed :=
  ⟨kBot, fun _ => ⟨Nat.le_refl 0, Nat.le_refl 0⟩⟩

/-- A self-domination of the seed carrying a standing surplus of one told-true. It covers
the same gap — there is no gap — but it covers it *at a cost*, and that cost is real data. -/
def germSeedSlack : DomByW germSeed germSeed :=
  ⟨⟨1, 0⟩, fun _ => ⟨Nat.zero_le 1, Nat.le_refl 0⟩⟩

/-- **The germ hom is not thin.** Two distinct arrows between the same pair of objects,
differing exactly in the residue they carry. Because `Prop` is proof-irrelevant, no
`Prop`-valued comparison — including `DomBy` itself, and every order in
`Calculus.Order.OrderInfra` — can exhibit this. The corpus's other carriers are thin not
by choice of axiom but by choice of universe: they compare in `Prop`, so their arrows
cannot differ.

This is the smallest statement that distinguishes "`s` is dominated by `t`" from "here is
*how* `s` is dominated by `t`", and it is the difference the aperiodic regime needs. -/
theorem domByW_not_thin :
    ∃ s t : Nat → Record, ∃ v w : DomByW s t, v ≠ w := by
  refine ⟨germSeed, germSeed, germSeedId, germSeedSlack, ?_⟩
  intro h
  have hval : (germSeedId).val = (germSeedSlack).val := congrArg Subtype.val h
  exact absurd (congrArg Record.pos hval) (by decide)

/-- Both witnesses forget to the *same* inhabitant of `DomBy` — the existential cannot
tell them apart. This is the collapse made explicit: refining `Prop` to `Type` adds
distinctions that were always present in the mathematics and absent from its statement. -/
theorem forget_collapses :
    DomByW.forget germSeedId = DomByW.forget germSeedSlack :=
  rfl

/-- The two seed arrows are distinct — the fact `domByW_not_thin` asserts, isolated so the
2-cell layer below can reuse it. -/
theorem germSeedId_ne_germSeedSlack : germSeedId ≠ germSeedSlack := by
  intro h
  exact absurd (congrArg Record.pos (congrArg Subtype.val h)) (by decide)

/-! ## 2-cells: the construction iterates

If an arrow is a residue, then the comparison between two arrows is again a residue — the
surplus by which one bound overruns another. So the same witnessed-domination shape that
gave non-thin homs gives non-thin 2-cells one level up, with no new idea required.

This is what `Cohomology.KZCoherentSheaf` describes and declines to build: "in that regime
a KZ 2-cell `α : f ⇒ f'` need *not* force `f = f'`." On the strict/Scott-regime carriers
that is impossible — `Temporal.TwoCell` is literally `eq : p.f = q.f`, so a 2-cell *is* an
equality and cannot exist between distinct 1-cells. Here `twoCell_without_equality`
exhibits the aperiodic case: two distinct arrows with a 2-cell between them. -/

/-- A **2-cell** between parallel witnessed dominations: a record `D` by which `f`'s bound
is overrun by `g`'s. Type-valued, for the same reason `DomByW` is — the overrun is data,
and different overruns are different 2-cells. -/
def DomByW2 {s t : Nat → Record} (f g : DomByW s t) : Type :=
  { D : Record // KLE f.val (add g.val D) }

/-- Two 2-cells are equal exactly when their overruns are. -/
theorem DomByW2.ext {s t : Nat → Record} {f g : DomByW s t} {α β : DomByW2 f g}
    (h : α.val = β.val) : α = β :=
  Subtype.ext h

/-- The **identity 2-cell**: an arrow overruns itself by nothing. -/
def DomByW2.id {s t : Nat → Record} (f : DomByW s t) : DomByW2 f f :=
  ⟨kBot, ⟨Nat.le_add_right _ _, Nat.le_add_right _ _⟩⟩

/-- **Vertical composition adds overruns**, exactly as horizontal composition adds bounds.
The residue arithmetic is the same one level up — which is what makes this a spiral rather
than a special case. -/
def DomByW2.vcomp {s t : Nat → Record} {f g h : DomByW s t}
    (β : DomByW2 g h) (α : DomByW2 f g) : DomByW2 f h :=
  ⟨add β.val α.val, by
    refine ⟨?_, ?_⟩
    · show f.val.pos ≤ h.val.pos + (β.val.pos + α.val.pos)
      exact Nat.add_assoc h.val.pos β.val.pos α.val.pos ▸
        Nat.le_trans α.property.1 (Nat.add_le_add_right β.property.1 α.val.pos)
    · show f.val.neg ≤ h.val.neg + (β.val.neg + α.val.neg)
      exact Nat.add_assoc h.val.neg β.val.neg α.val.neg ▸
        Nat.le_trans α.property.2 (Nat.add_le_add_right β.property.2 α.val.neg)⟩

/-- Vertical composition is associative. -/
theorem DomByW2.vcomp_assoc {s t : Nat → Record} {f g h k : DomByW s t}
    (γ : DomByW2 h k) (β : DomByW2 g h) (α : DomByW2 f g) :
    DomByW2.vcomp (DomByW2.vcomp γ β) α = DomByW2.vcomp γ (DomByW2.vcomp β α) :=
  DomByW2.ext (add_assoc γ.val β.val α.val)

/-- Left identity for vertical composition. -/
theorem DomByW2.id_vcomp {s t : Nat → Record} {f g : DomByW s t} (α : DomByW2 f g) :
    DomByW2.vcomp (DomByW2.id g) α = α :=
  DomByW2.ext (kBot_add α.val)

/-- Right identity for vertical composition. -/
theorem DomByW2.vcomp_id {s t : Nat → Record} {f g : DomByW s t} (α : DomByW2 f g) :
    DomByW2.vcomp α (DomByW2.id f) = α :=
  DomByW2.ext (add_kBot α.val)

/-- **A 2-cell that does not force its 1-cells equal.** The seed's zero-cost
self-domination is overrun by its one-told-true self-domination, so there is a 2-cell
`germSeedId ⇒ germSeedSlack`; and the two are provably distinct arrows.

This is the aperiodic-regime 2-cell the corpus names and does not construct. Every 2-cell
elsewhere in the corpus is an equality of 1-cells (`Temporal.TwoCell.eq`), so elsewhere the
statement below is not merely unproved but unstatable. -/
theorem twoCell_without_equality :
    ∃ (s t : Nat → Record) (f g : DomByW s t), f ≠ g ∧ Nonempty (DomByW2 f g) :=
  ⟨germSeed, germSeed, germSeedId, germSeedSlack, germSeedId_ne_germSeedSlack,
    ⟨⟨kBot, ⟨Nat.zero_le _, Nat.zero_le _⟩⟩⟩⟩

/-- **The 2-cell layer is itself non-thin.** Two distinct 2-cells between the same pair of
arrows, differing in how far one overruns the other. So the multiplicity does not stop at
the first level: residues have residues. -/
theorem domByW2_not_thin :
    ∃ (s t : Nat → Record) (f g : DomByW s t) (α β : DomByW2 f g), α ≠ β := by
  refine ⟨germSeed, germSeed, germSeedId, germSeedId,
    ⟨kBot, ⟨Nat.le_refl 0, Nat.le_refl 0⟩⟩,
    ⟨⟨1, 0⟩, ⟨Nat.zero_le _, Nat.le_refl 0⟩⟩, ?_⟩
  intro h
  exact absurd (congrArg Record.pos (congrArg Subtype.val h)) (by decide)

end Record
end Obsmetrologia
