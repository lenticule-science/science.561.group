---
date: 2026-05-29
kind: derivation
status: the ontology of TAB — agential realism, fusing substance and process
---

# being is agential-realist: predications are intra-actions, not "has-x"

TAB's mistake to avoid: reading a predication-cell `(s, p, o)` as English **"subject s has-property/relation p to object o"** — a substance with attributes, relata given in advance, the predicate a label hung on them.
That is the substance-metaphysics the lab calls *the shadow* (voidmath `articulating/docs/dev/journal/2026-05-25.md`: "the act of articulating is primary … relating is prior to relata.
Substance-metaphysics is the shadow that falls out when the act is collapsed into passive recording").
TAB is built on **Karen Barad's agential realism**, which is the framework that *fuses* substance and process so the math can **make real worlds**.

## The reading

- A cell `(s, p, o)` is a **phenomenon**, not a fact about things.
  The ontic unit is the phenomenon — the intra-active configuration — not the object.
- **Intra-action, not interaction.** Interaction presumes pre-existing relata that meet.
  Intra-action is the primary scene in which the relata *come to be distinct at all*.
  So `s` and `o` are **enacted by** the predication, not inputs to it (`entity.schema.json`: an entity "carries no structure beyond set-hood" — bare until cut).
  Cf. the lab's `intra-action.md`.
- **`p` is an apparatus / agential cut**, not a linguistic relation.
  It is the material-discursive practice that enacts a determinate boundary out of the entangled field.
  Name predicates as **intra-actions** (`pressing`, `looking`, `traversing`, `naming`) — the engagement that makes a cut — not as `has-property`.
- **The value is a mark.** The settled `(α, β) ∈ L×L` is the *mark left on the phenomenon* by the intra-action — the **enacted determinacy**, the rich pair of positive/negative evidence degrees over a residuated lattice L.
  Determinacy is *enacted, not revealed*; the degrees are the value and are never collapsed to a coarse label.
- **The observer is the apparatus.** The `observer` on an enactment is not metadata — it is the agency whose cut enacts the determinacy.
  "Agents **witness**" (lab `mash/.../agential-realism.md`): to witness is to be part of the intra-action that produces the settled cell.
  Determinacy is **local to the cut**, so two agents pressing the same door can enact genuinely different marks.
  `knowledgeJoin` carrying both to ⊤ is not error — it is Barad's point that different cuts yield different determinacies and the world must carry all of them.
- **Being and doing are fused.** `doing` (the intra-action / `positing`) is primary; `being` (the settled mark, an entity's `thing`) is **enacted by** doing — process-at-rest, never fully at rest.
  An un-intra-acted phenomenon has **no determinate being** (⊥): genuine indeterminacy (Heyting, not Boolean), not falsity.
  Sever every intra-action and there is no thing-in-itself.
- **Spacetimemattering.** Space and time are not a pre-given grid the world sits in; they are enacted through intra-actions.
  TAB's `growing` does not *place* rooms in space — its inflation apparatus **enacts** space (adjacency, position) as it goes.
  The world is mattered into being.

## Why this lets the math make real worlds

A flat MUD stores a pre-given world and lets players read it.
An agential-realist MUD has **no pre-given world**: it is enacted through players' intra-actions.
Each player is an apparatus; each look/press/move is a witnessing that enacts local determinacy (a mark, graded over L) within a phenomenon.
The shared on-disk trace is the sediment of all intra-actions; a player's perception is their observer-local settling — the determinacy *their* cuts enact.
Disagreement is plural phenomena, not a bug.
This is a world that is real **because** it is enacted, relationally, by the agencies within it — substance (being) continuously produced by process (doing).

Witness: `tests/prove-being.mjs`.
Builds on the value over a general residuated lattice (`bilattice/scripts/twist-value.mjs`) and the derivation `articulating-to-thing.md`.
