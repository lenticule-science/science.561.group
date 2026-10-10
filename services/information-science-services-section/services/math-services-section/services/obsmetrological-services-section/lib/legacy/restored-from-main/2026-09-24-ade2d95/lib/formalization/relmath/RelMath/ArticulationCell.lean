/-
# Articulation Cell — articulating's codomain

An **articulation cell** is what an utterance *becomes* once articulating acts on
it: the utterance together with a record, for each side, of whether that side has
been articulated. Two independent binary statuses (token-articulated,
claim-articulated) give exactly **four** cells — the partition the utterance's pair
structure was for.

By `(token, claim)` articulation status the four corners are:

| Cell        | token | claim | reading                                           |
|-------------|-------|-------|---------------------------------------------------|
| `potential` | no    | no    | neither side articulated — the initial cell       |
| `active`    | yes   | no    | token articulated, claim not — next on the path   |
| `absurd`    | yes   | yes   | both sides articulated                            |
| `stable`    | no    | yes   | claim without token — off the natural path        |

Nothing free is introduced: a cell is an `Utterance` plus two `Bool`s, and the
four corners are *derived* as the image of `Bool × Bool`. The headline result is
`Corner.card_eq_four`: there are exactly four cells — proven, not postulated.
-/
import RelMath.Articulating

namespace RelMath

/-- A cell of articulating's codomain: the utterance, plus whether each side has
been articulated. Pure structure over `Utterance` and `Bool` — no new data. -/
structure ArticulationCell where
  utterance : Utterance
  tokenArticulated : Bool
  claimArticulated : Bool
  deriving DecidableEq, Repr, Inhabited

/-- The four corners of the partition. These are *names* for the four points of
`Bool × Bool`; they carry no data of their own. -/
inductive Corner where
  | potential
  | active
  | absurd
  | stable
  deriving DecidableEq, Repr, Inhabited

namespace Corner

/-- The complete list of corners. -/
def all : List Corner := [potential, active, absurd, stable]

/-- Classify a `(token, claim)` status pair into its corner. The bijection with
`Bool × Bool` runs through here. -/
def ofStatus : Bool → Bool → Corner
  | false, false => potential
  | true,  false => active
  | true,  true  => absurd
  | false, true  => stable

/-- The inverse: the `(token, claim)` status pair a corner stands for. -/
def toStatus : Corner → Bool × Bool
  | potential => (false, false)
  | active    => (true,  false)
  | absurd    => (true,  true)
  | stable    => (false, true)

@[simp] theorem ofStatus_toStatus (c : Corner) :
    ofStatus (c.toStatus.1) (c.toStatus.2) = c := by cases c <;> rfl

@[simp] theorem toStatus_ofStatus (t k : Bool) :
    (ofStatus t k).toStatus = (t, k) := by cases t <;> cases k <;> rfl

/-- Every corner appears in `all`. -/
theorem mem_all (c : Corner) : c ∈ all := by cases c <;> simp [all]

/-- `all` lists the corners without repetition. -/
theorem nodup_all : all.Nodup := by decide

/-- **There are exactly four cells.** The headline of this stage: the partition's
cardinality is four — derived from the two-sidedness of the utterance, not posited.
One kind would give two, three would give eight; two gives four. -/
theorem card_eq_four : all.length = 4 := rfl

end Corner

namespace ArticulationCell

/-- The corner a cell sits in, read off its two statuses. -/
def corner (c : ArticulationCell) : Corner :=
  Corner.ofStatus c.tokenArticulated c.claimArticulated

/-- The cell over `u` whose initial presentation articulating carries: neither
side articulated yet. Articulating's codomain *presents* the potential corner. -/
def initial (u : Utterance) : ArticulationCell := ⟨u, false, false⟩

@[simp] theorem corner_initial (u : Utterance) : (initial u).corner = .potential := rfl

/-- The corner classification is surjective onto the four corners: every corner is
realized by some cell over any chosen utterance. The partition has no empty cell. -/
theorem corner_surjective (u : Utterance) (k : Corner) :
    ∃ c : ArticulationCell, c.corner = k := by
  refine ⟨⟨u, k.toStatus.1, k.toStatus.2⟩, ?_⟩
  simp [corner, Corner.ofStatus_toStatus]

end ArticulationCell

end RelMath
