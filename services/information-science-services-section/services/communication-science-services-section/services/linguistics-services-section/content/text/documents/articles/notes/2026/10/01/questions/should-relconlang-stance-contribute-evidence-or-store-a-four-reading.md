---
kind: question
status: open-with-candidate-model
explores:
  - relconlang
  - signcell
  - signchain
  - signcraft
  - four
  - evidence
  - stance
---
# Should RelConLang stance contribute evidence or store a FOUR reading?

Current SignStuff makes evidence primary.

A SignCell stores a triple and two grow-only witness sets, `for` and `against`. It stores no FOUR value. FOUR is a reading derived from which evidence sides are nonempty. SignChain then composes those evidence sets under truth and knowledge orders.

The current SignCraft RelConLang intake instead maps a clause-initial stance particle directly to a named `reading` and copies that reading onto event rows.

The RelConLang manifest contains a still-richer structure: a charge-valued Chu relation from particle × {truth,falsity} to FOUR, whose knowledge aggregation reproduces the flat stance-system value.

This suggests three levels that should be experimentally separated:

[
surface particle \to stance profile \to evidence interpretation \to derived FOUR reading.
]

The open question is where linguistic stance belongs.

If a speaker says `sha P`, does the utterance itself supply witnesses both for and against P, report that the speaker's current evidence state is both-sided, or merely classify P with a grammatical stance whose evidential basis must come from elsewhere?

The answer matters because SignCell's evidence is auditable provenance. A grammar should not fabricate evidence witnesses merely because its morphology names a stance.

## Candidate model from current SignStuff

The strongest current candidate is **report, do not inject**.

A parsed stance particle produces a stance-report resource about a proposition nucleus. The utterance itself can witness that report. The target proposition's SignCell evidence is unchanged by grammar alone.

This mirrors the existing SignStuff distinction between a source-statement's evidentiary identity and a truth judgment about what the source asserted.

See [Should RelConLang stance be a report about a proposition rather than evidence on it?](./should-relconlang-stance-be-a-report-about-a-proposition.md) and the `stance-report-v0.1` schema.
