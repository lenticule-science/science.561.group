---
name: has character
type: morphism
class: agent-form-relation
source: persona
target: character
status: open
---

`has-character(persona, character)` — the persona carries the named character (the χ-nucleus) as its stable disposition.

## Shape

A binary cell.
A persona has at most one character at a given history t (the character's nucleus is a single endomorphism); whether multiple characters can co-exist on a persona at the same history is open (see [character.md](../structures/character.md) §Open questions).

A persona's character can change over time — a substrate edit replaces the character cell — but such edits are governed: they represent a formal change-of-disposition act, not a per-action style adjustment.

## Step-induction role

Closure-rule consultation.
When a body-natural is about to emit a witness for the persona, closure rules consult the persona's character.
If the proposed witness lies in F_χ, fine; otherwise a closure rule flags out-of-character before the witness lands.

This is the categorical analog of "this persona wouldn't say this."
Without `has-character`, character-consistency has no formal handle in the predication graph.
