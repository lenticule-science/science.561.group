---
kind: question
status: open
explores:
  - relconlang
  - chu
  - four
  - semantics
  - stance
  - relation
---
# What does the RelConLang Chu matrix actually mean?

The RelConLang manifest supplies a FOUR-valued matrix over particle × state, with states named `truth` and `falsity`.

The manifest receipt proves only that the generic Chu dual is involutive on the supplied matrix. That is a structural law of the carrier, not a validation of the linguistic interpretation of its rows.

At least three plausible projections of the current matrix disagree.

**Row knowledge-join** reproduces the stance table:

[
ta,na,sha,mu mapsto potential,potential,stable,absurd.
]

**Standard relation state-extension**, using the existing relating rule that a point is in a state's extension when the cell's positive side is told, yields:

[
truth={ta,sha},qquad falsity={na}.
]

On that reading, `sha` is *not* in the falsity extension.

**Non-bottom state occupancy** treats any non-`absurd` entry as participation. That yields side profiles:

[
ta=(1,0), na=(0,1), sha=(1,1), mu=(0,0),
]

which recover the four canonical FOUR points—but that is not the current relation API's definition of state extension.

The matrix therefore needs a semantic specification independent of its structural Chu receipt. In particular, the program should not infer that the matrix proves `sha` means contradiction or that `na` means falsity merely from labels.

A good next experiment is to reconstruct why the matrix was authored in this exact form, then state an explicit projection law and test it against corpus contrasts.
