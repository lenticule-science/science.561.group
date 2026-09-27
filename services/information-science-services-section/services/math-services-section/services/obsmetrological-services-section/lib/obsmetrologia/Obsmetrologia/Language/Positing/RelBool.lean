import Obsmetrologia.Language.Positing.FourCorner
import Obsmetrologia.Language.Positing.Value.Category
import Obsmetrologia.Language.Positing.FiberAlgebra

/-!
# RelBool -- the Boolean truth axis as a projection of FOUR

`RelBool` is not a second Boolean ontology. It is the carrier already named by
`Positing.Value.booleanV`, i.e. the `Order.Two` carrier, read as the consistent
truth axis inside the existing FOUR/`Reading` object.

The embedding is the truth axis:

* `false ↦ Reading.tBot = ⟨false,true⟩`
* `true  ↦ Reading.tTop = ⟨true,false⟩`

Projection back is by the positive evidence slot `Reading.pos`. Thus every reading
has a two-valued projection, while only the readings whose negative slot is the
complement of the positive slot lie on the Boolean truth axis.
-/

namespace Obsmetrologia

/-- The Obsmetrologia Boolean object: exactly the carrier of `booleanV`, hence `Order.Two`
as a value category. This is an abbreviation, not a new carrier. -/
abbrev RelBool : Type := Positing.Value.booleanV.carrier

namespace RelBool

/-- The value-category presentation of `RelBool` is the existing `booleanV`. -/
def valueCategory : Positing.Value.ValueCategory := Positing.Value.booleanV

@[simp] theorem valueCategory_eq_booleanV :
    valueCategory = Positing.Value.booleanV := rfl

@[simp] theorem carrier_eq_bool : RelBool = Bool := rfl

/-! ## Axis embedding and projection -/

/-- Embed a two-valued truth into FOUR along the consistent truth axis `{f,t}`. -/
def truthAxis (b : RelBool) : Reading := Reading.ofSlots b (!b)

/-- Project a FOUR reading to its Boolean truth projection by reading positive evidence. -/
def fromReading (c : Reading) : RelBool := Reading.pos c

@[simp] theorem truthAxis_false : truthAxis false = Reading.tBot := rfl
@[simp] theorem truthAxis_true : truthAxis true = Reading.tTop := rfl

@[simp] theorem fromReading_kBot : fromReading Reading.kBot = false := rfl
@[simp] theorem fromReading_tBot : fromReading Reading.tBot = false := rfl
@[simp] theorem fromReading_tTop : fromReading Reading.tTop = true := rfl
@[simp] theorem fromReading_kTop : fromReading Reading.kTop = true := rfl

@[simp] theorem truthAxis_pos (b : RelBool) : (truthAxis b).pos = b := by
  cases b <;> rfl

@[simp] theorem truthAxis_negSlot (b : RelBool) : (truthAxis b).neg = !b := by
  cases b <;> rfl

@[simp] theorem fromReading_ofSlots (p n : Bool) :
    fromReading (Reading.ofSlots p n) = p := Reading.pos_ofSlots p n

/-- Projecting the truth-axis embedding returns the Boolean value. -/
@[simp] theorem fromReading_truthAxis (b : RelBool) :
    fromReading (truthAxis b) = b := by
  cases b <;> rfl

/-- Re-embedding an arbitrary charge's Boolean projection normalizes it to the truth axis. -/
theorem truthAxis_fromReading (c : Reading) :
    truthAxis (fromReading c) = Reading.ofSlots c.pos (!c.pos) := rfl

/-- A reading is exactly on the Boolean truth axis iff its negative slot complements
its positive slot. -/
theorem truthAxis_iff (c : Reading) :
    truthAxis (fromReading c) = c ↔ c.neg = !c.pos := by
  cases c <;> decide

/-! ## Existing four-corner / pair bridges -/

/-- The truth-axis embedding is the existing four-corner-to-corner bridge on the
same `(positive, negative)` pair. -/
theorem truthAxis_eq_fourCorner (b : RelBool) :
    truthAxis b = Articulating.FourCorner.toCorner (b, !b) := rfl

@[simp] theorem fourCorner_ofReading_truthAxis (b : RelBool) :
    Articulating.FourCorner.ofCorner (truthAxis b) = (b, !b) := by
  cases b <;> rfl

/-! ## Boolean operations transported along the truth axis -/

/-- Boolean negation on `RelBool`; transported to FOUR by `Reading.negate`. -/
def neg (b : RelBool) : RelBool := !b

/-- Boolean conjunction, using the `Order.Two` meet. -/
def meet (a b : RelBool) : RelBool := Order.Two.meet a b

/-- Boolean disjunction, using the `Order.Two` join. -/
def join (a b : RelBool) : RelBool := Order.Two.join a b

/-- Boolean implication, using the `Order.Two` residual. -/
def imp (a b : RelBool) : RelBool := Order.Two.imp a b

@[simp] theorem truthAxis_neg (b : RelBool) :
    truthAxis (neg b) = Reading.negate (truthAxis b) := by
  cases b <;> rfl

@[simp] theorem truthAxis_meet (a b : RelBool) :
    truthAxis (meet a b) = Reading.meetT (truthAxis a) (truthAxis b) := by
  cases a <;> cases b <;> rfl

@[simp] theorem truthAxis_fuse (a b : RelBool) :
    truthAxis (Order.Two.fuse a b) = Reading.meetT (truthAxis a) (truthAxis b) := by
  cases a <;> cases b <;> rfl

@[simp] theorem truthAxis_join (a b : RelBool) :
    truthAxis (join a b) = Reading.joinT (truthAxis a) (truthAxis b) := by
  cases a <;> cases b <;> rfl

@[simp] theorem truthAxis_imp (a b : RelBool) :
    truthAxis (imp a b)
      = Positing.FiberAlgebra.Reading.impT (truthAxis a) (truthAxis b) := by
  cases a <;> cases b <;> rfl

/-- The Boolean value category is the two-valued truth-axis projection of `readingV`.
This bundles the facts automation should ask for before replacing local Boolean
`simp`: the carrier is `booleanV`, the source FOUR carrier is `readingV`, projection
round-trips on the axis, and the axis is the existing four-corner bridge on `(b,!b)`. -/
theorem booleanV_truth_axis_projection_of_readingV :
    (Positing.Value.booleanV.carrier = RelBool)
      ∧ (Positing.Value.booleanV.bot = false)
      ∧ (Positing.Value.readingV.carrier = Reading)
      ∧ (Positing.Value.readingV.bot = Reading.kBot)
      ∧ (∀ b : RelBool, fromReading (truthAxis b) = b)
      ∧ (∀ c : Reading, truthAxis (fromReading c) = c ↔ c.neg = !c.pos)
      ∧ (∀ b : RelBool, truthAxis b = Articulating.FourCorner.toCorner (b, !b)) :=
  ⟨rfl, rfl, rfl, rfl, fromReading_truthAxis, truthAxis_iff, truthAxis_eq_fourCorner⟩

end RelBool
end Obsmetrologia
