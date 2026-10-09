---
kind: question
status: open
explores:
  - relconlang
  - deixis
  - pronouns
  - dialogue
  - reference-resolution
  - speaker
  - addressee
---
# How should RelConLang ground indexicals across turns?

RelConLang currently documents:

- `mi` = first-person singular;
- `tu` = second-person singular;
- `sa` = third-person singular;
- `ni` = third-person both/neutral.

The shared reference resolver does not bind first- or second-person pronouns. It only performs local third-person anaphora resolution.

This matters immediately for the existing dialogue corpus. A question spoken by `mi` may contain `tu` and address another participant. If the next turn is spoken by that participant, another surface `tu` is still second person relative to the new speaker; it does not automatically denote the same individual as the prior turn's `tu`.

Several current dialogue fixtures label such repeated-`tu` turns as question/answer or request/acknowledgement pairs. Their syntactic relation may be correct, but proposition identity is not established until deixis is grounded.

The experiment therefore needs an explicit speech-event context:

[
Context_t=(speaker_t, addressee_t, participants_t, prior discourse).
]

Pronoun interpretation should be a context-dependent map, not a lexical constant:

[
\llbracket mi\rrbracket_{Context_t}=speaker_t,qquad
\llbracket tu\rrbracket_{Context_t}=addressee_t.
]

Open questions include plural/multiple addressees, quoted speech and role shift, collective speakers, and whether `ni` is deictic, anaphoric, or both.

## Corpus consequence

The existing `dialogue-samples.jsonl` uses `speaker: "mi"/"tu"` as participant labels while also using `mi/tu` inside utterances as first/second-person pronouns. Several adjacency pairs repeat surface `tu` after the speaker changes.

Under the manifest's documented person features, those repeated forms change referent. The old adjacency labels are therefore retained as authorial intent / parser fixtures, not deictically grounded semantic gold.

The preferred blind assay is now `blind-dialogue-v0.2.json`, which names participants A/B outside the language and binds pronouns per turn.
