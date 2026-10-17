---
kind: question
status: open-with-candidate-model
explores:
  - relconlang
  - stance
  - signcell
  - evidence
  - attribution
  - four
---
# Should RelConLang stance be a report about a proposition rather than evidence on it?

Current SignStuff gives a strong representational constraint: a SignCell's `for` and `against` sets are actual witnesses for and against that exact triple. The FOUR reading is derived from those evidence sets.

A linguistic stance particle does not automatically provide such witnesses.

A useful analogue already exists in SignStuff source handling: a source statement records that a source asserted some text, and its identity is explicitly **not** itself a truth judgment about the source's assertion.

The candidate RelConLang model applies the same separation.

For an utterance `sha P`:

1. parse a proposition nucleus (P);
2. create a separate stance report saying that this utterance/speaker presented (P) under particle `sha`;
3. preserve `sha`'s richer Chu profile and derived aggregate reading on that report;
4. do **not** add for/against witnesses to (P) merely because `sha` occurred.

Then independent evidence can populate (P)'s SignCell. If both sides become nonempty, (P)'s own FOUR reading becomes stable for evidential reasons.

This separates:

[
	ext{what the speaker marks P as}
quad
eqquad
	ext{what evidence the system has for P}.
]

The main remaining question is whether some stance constructions — perhaps an assertion under `ta` with authenticated speaker provenance — should *also* count as a defeasible evidence-for witness. That should be an explicit evidential policy or semantic rule, not an automatic consequence of the FOUR name attached to the particle.
