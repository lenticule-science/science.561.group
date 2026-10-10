/-
# Conformance vectors — golden-value regression tests

The RelMath ancestor kept a golden-vector conformance suite
(`conformance/ConformanceVectors.lean`, see the archived copy at
`services/engineering-services-section/lib/legacy/2026-06-17-archive-emsenn-net/
preservation/wsl-home-archive/src/lib/local/relmath-lean/conformance/
ConformanceVectors.lean`) that emitted JSON rows recording input/output pairs for
every Charge operation, the CHL calculus, and the domain term evaluator, for an
external tool to diff against. That JSON-emission apparatus does not exist here —
this module instead follows the RelMath *tradition* (concrete inputs, concrete
outputs, one vector per fact worth pinning) in the idiom this Lean corpus already
uses everywhere else: `example : <concrete-lhs> = <concrete-rhs> := rfl` (or
`decide` where `rfl` does not reduce through a `Decidable` instance). Each
kernel-checked `example` *is* the golden vector — no separate JSON artifact to
keep in sync with the Lean it claims to describe.

**What a vector here is for.** Every fact below is already a theorem somewhere in
the library (cited in each vector's comment). Re-asserting it as a *concrete*
`example` is not redundant: a generic theorem (`∀ a, P a`) can survive a
definition change that silently swaps its instantiated meaning at the exact
constants downstream code and prose actually rely on (a corner relabeling, an
operator swapped for its dual, an off-by-one in which slot is "positive"). A
concrete golden vector pins the value, not just the shape of the theorem — this
is exactly the kind of regression the corner-naming-convention drift
(`docs/history/corner-naming-convention.md`) shows can happen silently. Every
vector below is named for the fact it locks down and states, in one line, what
would break if it stopped holding.

**Naming convention in force throughout (evidence reading, ruled 2026-08-05).**
`absurd` = ⊥ₖ = told none (the initial cell); `potential` = t = told true;
`active` = f = told false; `stable` = ⊤ₖ = told both.

**What is covered.** Charge table load-bearing corners (kBot as ⊥ₖ-unit, kTop as
⊥ₖ-absorbing, negate's fixed/swapped points); the corner↔status round-trip;
`ArticulationMeasure.measure` at all four cell shapes; `Valuation.posit` /
`positList` algebra on two concrete Utterances built from string Marks; guarded
predicating and sibling-seed composition (`Predicating.Guarded`,
`Predicating.SiblingSeed`) on the same two concrete Utterances.

**What is not covered.** No `Diataxis`↔`Corner` vector: no `Diataxis` module
exists anywhere under `Obsmetrologia/` at the time of writing (checked via
`grep -rl Diataxis Obsmetrologia/`), so there is nothing to import — adding one
would be inventing a claim, not guarding an existing one. The full 16×16 Charge
binary-operation table (`joinK`/`meetK`/`negate` on every pair) is not
reproduced either, per this task's own instruction that it would be overkill;
`Charge.lean`'s own `cases a <;> cases b <;> rfl`-style proofs already discharge
the exhaustive case analysis where it is needed, at the theorem level.
-/
import Obsmetrologia

open Obsmetrologia

namespace Conformance

/-! ## Charge table — the load-bearing corners

Not the full 16-pair table (overkill, per task instruction): `kBot` as the
`joinK` unit, `kTop` as the `joinK`-absorbing top, and `negate` fixing the two
knowledge-poles while swapping the two truth-poles. -/

/-- `kBot` is `joinK`'s left identity at `potential` — guards `Charge.joinK_kBot`
(and, transitively, `Valuation.posit_kBot`'s "abstaining is a no-op" reading) at
a concrete instantiation rather than only the universally-quantified theorem. -/
example : Charge.joinK Charge.kBot Charge.tTop = Charge.tTop := rfl

/-- `kBot` is `joinK`'s left identity at `active` — the other truth-pole, so the
unit law is pinned on both sides of the truth axis, not just one. -/
example : Charge.joinK Charge.kBot Charge.tBot = Charge.tBot := rfl

/-- `kBot` is `joinK`'s left identity at `stable` (`⊤ₖ`) too — guards that the
unit law holds even at the top of the knowledge order, not only below it. -/
example : Charge.joinK Charge.kBot Charge.kTop = Charge.kTop := rfl

/-- `kTop` absorbs into `joinK` from `potential` — guards `Charge.leK_kTop`'s
partner fact (`⊤ₖ` is `joinK`-absorbing) at a concrete pair; this is the fact
`Predicating.CellPartition.phase_stable_absorbs` and `Positing.Morphism`'s
`contest_absorbs` both rest on. -/
example : Charge.joinK Charge.kTop Charge.tTop = Charge.kTop := rfl

/-- `kTop` absorbs into `joinK` from `active` — the other truth-pole. -/
example : Charge.joinK Charge.kTop Charge.tBot = Charge.kTop := rfl

/-- `kTop` absorbs into `joinK` from `absurd` (`⊥ₖ`) — the seed itself cannot
escape absorption once joined against `⊤ₖ`. -/
example : Charge.joinK Charge.kTop Charge.kBot = Charge.kTop := rfl

/-- `negate` fixes `absurd` — guards `Charge.negate_kBot`: the initial corner is
not on the truth axis `negate` swaps. -/
example : Charge.negate Charge.kBot = Charge.kBot := rfl

/-- `negate` fixes `stable` — guards `Charge.negate_kTop`: the held-contradiction
corner is likewise off the truth axis. -/
example : Charge.negate Charge.kTop = Charge.kTop := rfl

/-- `negate` swaps `potential` to `active` — guards `Charge.negate_tTop`: told-true
and told-false trade places under negation, the FOUR-object's Klein symmetry. -/
example : Charge.negate Charge.tTop = Charge.tBot := rfl

/-- `negate` swaps `active` to `potential` — the other direction of the same
swap, guarding `Charge.negate_tBot`. -/
example : Charge.negate Charge.tBot = Charge.tTop := rfl

/-! ## Corner ↔ status round-trip

Guards the evidence-reading table itself (`docs/history/corner-naming-convention.md`)
at the value level: if a future edit ever silently rotated the labeling back
toward RelMath's old convention (`potential` initial, `absurd` both-told), these
eight vectors would be the first thing to fail. -/

example : Articulating.Corner.ofStatus false false = Articulating.Corner.absurd := rfl
example : Articulating.Corner.ofStatus true false = Articulating.Corner.potential := rfl
example : Articulating.Corner.ofStatus false true = Articulating.Corner.active := rfl
example : Articulating.Corner.ofStatus true true = Articulating.Corner.stable := rfl
example : Articulating.Corner.absurd.toStatus = (false, false) := rfl
example : Articulating.Corner.potential.toStatus = (true, false) := rfl
example : Articulating.Corner.active.toStatus = (false, true) := rfl
example : Articulating.Corner.stable.toStatus = (true, true) := rfl

/-! ## `ArticulationMeasure.measure` at all four cell shapes

Concrete instances of `measure_absurd`/`measure_potential`/`measure_active`/
`measure_stable` (`Positing/ArticulationMeasure.lean`) — guards that "measure"
reads the corner off a cell's own two `Bool`s the same way `Corner.ofStatus`
does, at one fixed utterance. -/

/-- A concrete utterance the measure vectors below share, so every shape is
compared at the same underlying `(token, claim)` pair. -/
def measureUtterance : Utterance := ⟨⟨"measure-token"⟩, ⟨"measure-claim"⟩⟩

example : Articulating.Cell.measure ⟨measureUtterance, false, false⟩ = Charge.kBot := rfl
example : Articulating.Cell.measure ⟨measureUtterance, true, false⟩ = Charge.tTop := rfl
example : Articulating.Cell.measure ⟨measureUtterance, false, true⟩ = Charge.tBot := rfl
example : Articulating.Cell.measure ⟨measureUtterance, true, true⟩ = Charge.kTop := rfl

/-- The freshly-initial cell (`Articulating.Cell.initial`) measures to `kBot` —
guards `meme_initial_charge`'s reading that "born absurd" and "measures to ⊥ₖ"
agree, at a concrete cell rather than only the `∀ u` theorem. -/
example : (Articulating.Cell.initial measureUtterance).meme.charge = Charge.kBot := rfl

/-! ## `posit`/`positList` algebra on two concrete Utterances

Two distinct Utterances built from string Marks, and their two distinct claim
points, carry every vector in this section — the concreteness is the point: a
generic `∀ φ q v` theorem cannot catch a bug that only shows up once real,
distinct claim points are compared against each other (e.g. an accidental `=`
where `≠` was meant in a guard condition inside `delta`/`posit`). -/

def markAlpha : Mark := ⟨"alpha"⟩
def markBeta : Mark := ⟨"beta"⟩
def markGamma : Mark := ⟨"gamma"⟩
def markDelta : Mark := ⟨"delta"⟩

/-- The first of the two Utterances every posit-algebra vector below is built
from. -/
def utteranceOne : Utterance := ⟨markAlpha, markBeta⟩

/-- The second — token and claim both distinct from `utteranceOne`'s, so
`claimOne ≠ claimTwo` genuinely (not merely by an unproven assumption). -/
def utteranceTwo : Utterance := ⟨markGamma, markDelta⟩

def claimOne : Claim := Claim.seed utteranceOne
def claimTwo : Claim := Claim.seed utteranceTwo

/-- The two claims really are distinct — the standing hypothesis every
"posit here, read there" vector below relies on being non-vacuous. -/
example : claimOne ≠ claimTwo := by decide

/-- Positing `t` (told-true) at `claimOne` from the knowledge-least seed reads
back exactly `t` there — guards `Valuation.posit`'s point-mass update
(`Positing.Morphism.delta`) landing where aimed, concretely. -/
example : Valuation.posit claimOne Charge.tTop Valuation.knowledgeLeast claimOne
    = Charge.tTop := rfl

/-- The same posit leaves the *other* claim at the seed's `kBot` — guards that
`delta`'s point mass genuinely does not leak to an unrelated claim point. -/
example : Valuation.posit claimOne Charge.tTop Valuation.knowledgeLeast claimTwo
    = Charge.kBot := rfl

/-- Two posits at the *same* claim (`t` then `f`) join to `⊤ₖ` — a concrete
instance of `posit_posit_same`: told-true and told-false, merged, is told-both. -/
example : Valuation.posit claimOne Charge.tBot
    (Valuation.posit claimOne Charge.tTop Valuation.knowledgeLeast) claimOne
    = Charge.kTop := rfl

/-- Contesting `claimOne` (`Valuation.contesting`, `⊤ₖ`) from the seed reads
`stable` there — a concrete instance of `phase_contesting_knowledgeLeast`
(`Predicating.CellPartition`), tying the speech-act name to the corner it
reaches. -/
example : Valuation.phase (Valuation.contesting claimOne Valuation.knowledgeLeast) claimOne
    = Articulating.Corner.stable := rfl

/-- **`positList` permutation invariance, concretely.** Two posit-instruction
lists that are exact reverses of each other (`[claimOne↦t, claimTwo↦f]` vs.
`[claimTwo↦f, claimOne↦t]`) compute to the *same* result at `claimOne` — a
direct, `rfl`-checked instance of `Batch.positList_perm`'s CRDT-style
order-independence, not merely the generic permutation theorem applied to an
unspecified list. -/
example :
    Valuation.positList [(claimOne, Charge.tTop), (claimTwo, Charge.tBot)]
        Valuation.knowledgeLeast claimOne
      = Valuation.positList [(claimTwo, Charge.tBot), (claimOne, Charge.tTop)]
        Valuation.knowledgeLeast claimOne := rfl

/-- The same permutation pair, read at `claimTwo` instead — order-independence
holds at both claim points the batch touches, not only the one checked above. -/
example :
    Valuation.positList [(claimOne, Charge.tTop), (claimTwo, Charge.tBot)]
        Valuation.knowledgeLeast claimTwo
      = Valuation.positList [(claimTwo, Charge.tBot), (claimOne, Charge.tTop)]
        Valuation.knowledgeLeast claimTwo := rfl

/-! ## Guarded predicating and sibling-seed composition (new modules)

One concrete vector each for `Language.Predicating.Guarded` and
`Language.Predicating.SiblingSeed`, on the same two Utterances used above. -/

/-- A concrete cell over `utteranceOne`, told-true (token articulated, claim
not) — the potential corner `predicatingOf` demands a proof of. -/
def potentialCellOne : Articulating.Cell := ⟨utteranceOne, true, false⟩

/-- `predicatingOf`, guarded by a concrete `decide`-discharged proof that
`potentialCellOne` sits in the `potential` corner, agrees with the plain
`PredicationCell.seed` reading — guards `Guarded.lean`'s headline definition
computing exactly what the ungated `predicating` already did, at a concrete
cell rather than only via `predicatingOf_toCell`'s `PotentialCell`-shaped
argument. -/
example :
    Articulating.Cell.predicatingOf potentialCellOne (by decide)
      = PredicationCell.seed utteranceOne := rfl

/-- **Sibling-seed composition, concretely.** Composing the seeds of
`utteranceOne` and `utteranceTwo` produces the *off-diagonal* cell carrying
`utteranceOne`'s subject and predicate with `utteranceTwo`'s object — a
concrete instance of `composeSeeds_subject_object`, pinning the exact triple
`composeSeeds` builds rather than only its subject/object projections. -/
example : PredicationCell.composeSeeds utteranceOne utteranceTwo
    = ⟨markAlpha, markBeta, markGamma⟩ := rfl

/-- Composing a seed with itself stays diagonal — a concrete instance of
`composeSeeds_self`, guarding that self-composition never manufactures an
off-diagonal cell from nothing. -/
example : PredicationCell.composeSeeds utteranceOne utteranceOne
    = PredicationCell.seed utteranceOne := rfl

end Conformance

/-- Runnable confirmation that this module's `example`s all kernel-checked
(if this file failed to elaborate, `lake build conformance` / `lake exe
conformance` would already have failed before `main` ever ran — this is a
human-readable "yes, it ran" marker, not the check itself). -/
def main : IO Unit :=
  IO.println "conformance: OK — every golden vector in ConformanceVectors.lean kernel-checked."
