---
kind: question
status: open
explores:
  - relconlang
  - agency
  - modality
  - speech-acts
  - semantics
  - communicating
---
# How should RelConLang agency and modality enter semantic interpretation?

RelConLang's agency lexicon is already syntactically visible.

The parser recognizes verbs such as `tem`, `vom`, `dav`, `ren`, `nul`, `kod`, `kan`, and `var`. Verb-form rules add features such as `intended`, `commissive`, `doubted`, `repaired`, `refused`, `obligated`, and `capable`. The manifest also carries witness-journal rows naming speech-act, modality, and process interpretations.

No current generic semantic consumer was found for those RelConLang-specific verb features.

In particular:

- generic `polarity()` recognizes English modal surface forms such as `can` and `must`, not RelConLang `kan` and `kod`;
- `vom` receiving a `commissive` word feature does not automatically create a commissive illocution;
- `nul` receiving a `refused` feature does not by itself establish which prior conditional relevance or deontic proposition is refused;
- witness-journal metadata is not compiled into the parser bundle.

The experiment should decide whether lexical agency meanings belong in the language manifest as semantic lexical entries, arise compositionally from root/derivational structure, or are interpreted by a separate language-specific semantic projection.

A key constraint is to avoid turning lexical meaning into hidden operational authority. Recognizing `kod` as obligation-language is a semantic act; enforcing an obligation is a different system.
