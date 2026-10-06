---
kind: question
status: open
explores:
  - relconlang
  - speech-acts
  - dialogue
  - illocution
  - conversation-analysis
---
# How should RelConLang factor illocutionary force from dialogue move?

The current manifest already encodes two levels:

- `ku` = directive + question;
- `du` = directive + request;
- `se` = assertive + answer;
- `ha` = expressive + acknowledgement.

This means a flat taxonomy that places `directive`, `question`, and `answer` in one enum is structurally wrong.

The open question is how the two levels compose with lexical speech-act verbs such as `vom` (promise), `nul` (refusal), `ren` (repair), `dav` (doubt), and with complement clauses.

For example, a refusal may be a commissive-like or assertive-like act depending on analysis while also functioning as the second pair-part of a request sequence. A repair may be a lexical action while the utterance's conversational move is clarification or replacement.

A satisfactory model should allow:

[
IllocutionaryForce \times DialogueMove \times Proposition
]

without requiring these coordinates to be independent if the corpus reveals lawful constraints between them.
