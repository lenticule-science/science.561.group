---
kind: question
status: open
explores:
  - relconlang
  - dialogue
  - conversation-analysis
  - speech-acts
  - discourse
  - causal-structure
---
# Can dialogue relations be recovered from RelConLang without hand-authored metadata?

Current RelConLang dialogue fixtures provide `move`, `respondsTo`, and adjacency-pair labels manually. The parser verifies the utterances and the tests verify those supplied relations.

The blind-dialogue experiment removes that metadata.

Input is restricted to speaker identity, turn order, and RelConLang text. The system must infer which obligations each turn opens, which prior obligation a later turn purports to address, whether its content is compatible with that obligation, and which obligations remain open.

Success must be scored separately from syntax. A perfectly parsed sentence may still be an irrelevant answer.

The experiment should compare semantic connectivity, temporal/causal threading, and inferred dialogue edges rather than treating any one as a substitute for the others.
