import Obsmetrologia.Language.Predicating.Cell

/-!
# Sibling seed composition — off-diagonal cells from composed seeds

The RelMath blueprint (`content.tex:136`) promises, and never elsewhere discharges:
cells with `subject ≠ object` "arise only by composing such seeds drawn from
sibling utterances of the articulating recursion, never by postulating an entity
from nothing." This module discharges that promise.

**Stated hypothesis (never glossed in the prose): what "sibling" means.** The
blueprint never defines which utterances count as siblings of one another. The
reading taken here is the linear one: for an `Articulating` recursion `a`, its
siblings are the utterances of `a.utterances` — the flat list obtained by walking
the `pair`/`utter` spine and collecting every utterance carried along the way, in
order. This is the natural reading of a *linear* recursion (each `pair` has one
utterance and one further articulating, no branching), but it is a choice, not a
theorem: a different notion of "sibling" (e.g. utterances at the same depth across
distinct recursions) is not ruled out and is not addressed here.

**What is proved.** `PredicationCell.composeSeeds u v` composes the reflexive
seeds of two utterances `u`, `v` through the first utterance's claim:
`⟨u.token, u.claim, v.token⟩`. This is shown to:

* specialize to the diagonal seed when `u = v` (`composeSeeds_self`);
* read its subject and object directly off the two input seeds
  (`composeSeeds_subject_object`);
* recover the subject-seed exactly under `subjProj`, and recover the
  *object-token* of the object-seed (but not in general its predicate) under
  `objProj` — the asymmetry is real and is stated honestly, not smoothed over
  (`subjProj_composeSeeds`, `objProj_composeSeeds`,
  `objProj_composeSeeds_endpoints`, `objProj_composeSeeds_of_claim_eq`);
* be surjective onto `PredicationCell`: every cell, on- or off-diagonal, is
  `composeSeeds u v` for some pair of utterances (`composeSeeds_surjective`) — so
  nothing off-diagonal need be postulated;
* be drawn, for a given recursion `a`, from `a`'s own sibling list: `cellsOf a` is
  the list of all `composeSeeds u v` for `u v` ranging over `a.utterances`, and the
  diagonal seed at `a`'s head is always a member (`seed_head_mem_cellsOf`), with
  the base case computed exactly (`cellsOf_utter`).

**What remains open.** Whether "sibling" should instead mean something
structural (e.g. co-occurrence at a fixed depth, or an equivalence closed under
some articulating congruence) is not decided here — only the linear reading is
formalized. Nothing here claims a *unique* pair `(u, v)` witnessing a given cell;
`composeSeeds_surjective` produces one witness, not a bijection.
-/

namespace Obsmetrologia

namespace Articulating

/-- The utterances of the recursion, walking the `pair`/`utter` spine in order.
Under the linear-sibling hypothesis stated in this module's docstring, these are
`a`'s *siblings* — the pool `composeSeeds` is meant to draw from. Structural
recursion on `a`; total because `Articulating` is finite. -/
def utterances : Articulating → List Utterance
  | utter u => [u]
  | pair u a => u :: a.utterances

@[simp] theorem utterances_utter (u : Utterance) : (utter u).utterances = [u] := rfl

@[simp] theorem utterances_pair (u : Utterance) (a : Articulating) :
    (pair u a).utterances = u :: a.utterances := rfl

/-- The head utterance is always among the recursion's own utterances — so
whatever is drawn from `a.head` below is honestly "drawn from `a`'s siblings",
not smuggled in from outside. -/
@[simp] theorem head_mem_utterances (a : Articulating) : a.head ∈ a.utterances := by
  cases a <;> simp [head, utterances]

end Articulating

namespace PredicationCell

/-! ## Composing sibling seeds -/

/-- The composite of the reflexive seeds of two utterances `u` and `v`, taken
through the *first* utterance's claim: subject and predicate come from `u`,
object comes from `v`'s token. When `u = v` this degenerates to the diagonal
seed (`composeSeeds_self`); in general the predicate carried is `u`'s, not `v`'s
— composition is not symmetric in the two seeds. -/
def composeSeeds (u v : Utterance) : PredicationCell := ⟨u.token, u.claim, v.token⟩

/-- Composing a seed with itself is the diagonal seed: nothing off-diagonal is
produced from a single utterance alone. -/
@[simp] theorem composeSeeds_self (u : Utterance) : composeSeeds u u = seed u := rfl

/-- The composite reads its subject and object directly off the two sibling
seeds: the subject is `seed u`'s subject, the object is `seed v`'s object. This
is the sense in which the off-diagonal cell is *assembled from* the two seeds
rather than posited fresh. -/
theorem composeSeeds_subject_object (u v : Utterance) :
    (composeSeeds u v).subject = (seed u).subject ∧
      (composeSeeds u v).object = (seed v).object :=
  ⟨rfl, rfl⟩

/-! ## Projections recover the diagonal seeds — with an honest asymmetry -/

/-- Subject-projection recovers the diagonal seed of `u` *exactly*: collapsing
the composite onto its subject side reproduces `seed u` in full, predicate
included, because the composite's predicate already is `u`'s claim. -/
@[simp] theorem subjProj_composeSeeds (u v : Utterance) :
    subjProj (composeSeeds u v) = seed u := rfl

/-- Object-projection computed directly: collapsing the composite onto its
object side gives `v`'s token paired with *`u`'s* claim, not `v`'s — the
composite only ever carries the first utterance's predicate. This is the exact
value; see `objProj_composeSeeds_endpoints` for what it shares with `seed v` and
`objProj_composeSeeds_of_claim_eq` for when it equals `seed v` outright. -/
@[simp] theorem objProj_composeSeeds (u v : Utterance) :
    objProj (composeSeeds u v) = ⟨v.token, u.claim, v.token⟩ := rfl

/-- Object-projection recovers `seed v`'s subject and object endpoints (both
`v.token`), but — unlike `subjProj_composeSeeds` — does *not* in general recover
`seed v` itself, since the predicate carried is `u`'s claim, not `v`'s. Stated
honestly at the endpoint level rather than claiming full equality. -/
theorem objProj_composeSeeds_endpoints (u v : Utterance) :
    (objProj (composeSeeds u v)).subject = (seed v).subject ∧
      (objProj (composeSeeds u v)).object = (seed v).object :=
  ⟨rfl, rfl⟩

/-- The missing case: when the two utterances share a claim, object-projection
does recover `seed v` exactly. -/
theorem objProj_composeSeeds_of_claim_eq (u v : Utterance) (h : u.claim = v.claim) :
    objProj (composeSeeds u v) = seed v := by
  simp [objProj_composeSeeds, seed, h]

/-! ## Completeness: nothing off-diagonal need be postulated -/

/-- **Every** predication cell, on- or off-diagonal, is `composeSeeds u v` for
some pair of utterances `u v` — drawn as the seeds of `⟨φ.subject, φ.predicate⟩`
and `⟨φ.object, default⟩`. The second utterance's claim is irrelevant to the
witness (`composeSeeds` never reads `v.claim`), so `default` stands for
"any claim at all". This is the completeness half of the blueprint's promise:
off-diagonal cells never need to be postulated from nothing, only composed. -/
theorem composeSeeds_surjective (φ : PredicationCell) :
    ∃ u v : Utterance, composeSeeds u v = φ := by
  refine ⟨⟨φ.subject, φ.predicate⟩, ⟨φ.object, default⟩, ?_⟩
  cases φ; rfl

/-! ## Drawn from a recursion's own siblings -/

/-- The cells composable from `a`'s own sibling utterances: every
`composeSeeds u v` with `u`, `v` both drawn from `a.utterances`. -/
def cellsOf (a : Articulating) : List PredicationCell :=
  a.utterances.flatMap (fun u => a.utterances.map (fun v => composeSeeds u v))

/-- Base case: a bare `utter u` has exactly one sibling (itself), so its only
composable cell is the diagonal seed. -/
@[simp] theorem cellsOf_utter (u : Utterance) : cellsOf (Articulating.utter u) = [seed u] := by
  simp [cellsOf]

/-- The diagonal seed at `a`'s own head is always among the cells drawn from
`a`'s siblings — the recursion always composes at least its own reflexive seed,
never needing anything from outside itself. -/
theorem seed_head_mem_cellsOf (a : Articulating) : seed a.head ∈ cellsOf a := by
  have hmem : a.head ∈ a.utterances := Articulating.head_mem_utterances a
  have : composeSeeds a.head a.head ∈ cellsOf a :=
    List.mem_flatMap.mpr ⟨a.head, hmem, List.mem_map.mpr ⟨a.head, hmem, rfl⟩⟩
  simpa [composeSeeds_self] using this

end PredicationCell

end Obsmetrologia
