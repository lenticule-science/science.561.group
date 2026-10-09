---
kind: question
status: candidate-resolved-no-explicit-stance
explores:
  - relconlang
  - stance
  - zero-marking
  - signcraft
  - evidence
---
# What does an unmarked RelConLang clause say about stance?

Current RelConLang frequently omits `ta/na/sha/mu`.

The current SignCraft intake initializes every clause to `potential`, so:

`mi ga ran do kelu.`

and

`ta mi ga ran do kelu.`

receive the same flat reading.

But the recovered language documentation does not state an implicit-`ta` rule. Meanwhile the current SignStuff evidence substrate treats an untouched cell as `absurd` — no evidence on either side — and only reaches `potential` when positive evidence is actually supplied.

Three models therefore remain open:

1. **implicit ta**: zero marking grammatically means `ta`;
2. **no explicit stance**: zero marking leaves stance unspecified;
3. **default assertion distinct from stance**: an ordinary clause can be assertive without pretending that it carried the explicit `ta` stance profile.

The third model currently looks especially worth testing because it preserves the distinction between illocutionary assertion, stance marking, and target evidence.

This question must be settled before a realization codec decides whether dropping `ta` is semantically lossless.

## Stronger corpus-based conclusion

The current best experimental reading is now **no explicit stance**.

The grammar reference makes the clause-initial charge/dialogue slot optional, and Lesson 01 says to add a charge particle *when you need to say how the claim is held*. That is positive language-internal evidence that zero marking is not simply an unpronounced `ta`.

Accordingly:

[
unmarked(P) mapsto P + stanceReport(null)
]

while

[
ta(P) mapsto P + stanceReport(ta).
]

Any default assertive force belongs to the illocutionary layer, not the stance coordinate.

Current SignCraft's default `potential` is therefore treated as a lossy implementation projection pending an explicit change/test—not as the language law itself.
