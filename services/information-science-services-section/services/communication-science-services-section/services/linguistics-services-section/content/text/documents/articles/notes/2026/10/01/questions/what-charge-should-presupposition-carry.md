---
kind: question
status: open
explores:
  - communicating
  - presupposition
  - common-ground
  - four
  - bilattice
  - relconlang
---
# What FOUR charge should a presupposition carry?

The communicating stack currently has two different presupposition conventions.

The semantic detector emits a presupposition trigger with status `absurd`, which can be read as: the presupposed proposition has been identified but no evidence-for or evidence-against has yet been supplied by this reading.

The `presuppose` meme endomorphism instead constructs a `stable` charge and puts the same trigger witness on both truth and falsity evidence lists. Its documentation glosses this as a background fact that "must already be held."

Under the canonical relating bilattice, however, `stable = (1,1)` denotes evidence both for and against. It is a held contradiction, not merely a strongly established proposition.

The open question is whether:

1. the `stable` use is deliberate because presupposition is modeled through a special dual/both-sided construction;
2. a different fiber interpretation is intended and must be made explicit;
3. presupposed/common-ground status should be a separate coordinate from epistemic FOUR;
4. the implementation is simply conflating "stable" in ordinary English with the bilattice's `stable/top`.

RelConLang should not grammaticalize or inherit this mapping until that distinction is resolved.
