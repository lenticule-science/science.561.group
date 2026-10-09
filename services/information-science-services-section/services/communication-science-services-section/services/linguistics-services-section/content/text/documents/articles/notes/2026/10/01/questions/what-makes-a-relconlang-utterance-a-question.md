---
kind: question
status: open
explores:
  - relconlang
  - interrogativity
  - dialogue
  - orthography
  - prosody
---
# What makes a RelConLang utterance a question?

Current RelConLang has at least two visible question cues that are not equivalent in software.

`ku` is grammatical. The shared parser gives it `dialogue:question` and a discourse arc; SignCraft emits a question discourse row.

A sentence-final `?` is only orthographic segmentation in the shared parser and is stripped before parsing by SignCraft.

This creates an existing mismatch: `ko tu kan kano?` is documented as a contrastive question, but neither parser derives question force from its punctuation because it lacks `ku`.

The experiment should decide whether:

1. `ku` is the sole grammatical interrogative marker and `?` is merely redundant spelling;
2. punctuation/prosody are independent interrogative witnesses that can license a question without `ku`;
3. multiple carriers contribute to one interrogativity reading with explicit agreement/conflict rules.

Until then, punctuation-only examples should not be treated as machine-readable questions.
