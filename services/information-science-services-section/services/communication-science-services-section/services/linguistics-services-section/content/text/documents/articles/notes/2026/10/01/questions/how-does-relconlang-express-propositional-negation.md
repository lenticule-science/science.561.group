---
kind: question
status: open-with-candidate-construction
explores:
  - relconlang
  - negation
  - denial
  - refusal
  - four
  - polarity
  - evidence
---
# How does RelConLang express propositional negation or evidence-against?

RelConLang currently has several superficially adjacent mechanisms that are not equivalent.

- `nes` is a lexical transitive verb glossed "negate". Current SignCraft intentionally treats it as predicate identity `nes`, not as a polarity operator.
- `nul` is a lexical refusal verb / speech act.
- `active` is the canonical FOUR point for evidence-against only.
- The current stance system provides no surface particle whose aggregate reading is `active`.
- The generic communicating polarity reader does not consume RelConLang `nes` or its `negated` word feature as proposition negation.

Therefore none of these currently establishes a compositional form for ordinary proposition-level denial:

[
P mapsto \neg P
]

or for the evidential act "I supply evidence against P."

This is an expressive design question, not a request to add a negative particle immediately.

The experiment should distinguish:

1. **logical/predicational negation** — changing the polarity of proposition P;
2. **metalinguistic negation** — asserting that a prior claim should be negated/rejected;
3. **evidence-against** — adding an against-side witness while preserving evidence-for;
4. **refusal** — declining an action, request, commitment, or obligation;
5. **contradiction** — both evidence sides present.

A satisfactory design should preserve paraconsistency: denying P must not erase prior evidence-for P.

## Candidate construction from current parser + denial substrate

The existing complement machinery permits an experimental `nes … ve P` construction without adding a new particle.

The proposed semantics is not "syntax writes active onto P." It is:

[
nes(P) 	o DenialReport(P) 	o_{	ext{explicit evidential policy}} witnessAgainst(P).
]

Current SignCraft's formal-context denial lane then supplies the actual algebra for negative support and paraconsistent contradiction.

A matched `nul … ve P` construction is the refusal control: it may close a conversational relevance item without supplying evidence-against (P).

See [Can nes + ccomp realize proposition denial?](./can-nes-plus-ccomp-realize-proposition-denial.md).
