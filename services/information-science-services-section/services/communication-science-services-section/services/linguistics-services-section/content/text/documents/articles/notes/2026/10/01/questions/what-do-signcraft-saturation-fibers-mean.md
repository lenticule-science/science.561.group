---
kind: question
status: open-with-preferred-interpretation
explores:
  - relconlang
  - signcraft
  - saturation
  - formal-concept-analysis
  - selectional-restrictions
  - evidence
---
# What do SignCraft's RelConLang saturation fibers mean?

Current SignCraft builds subject/object fibers from every parsed RelConLang cell.

Crucially, the fiber update ignores the clause's stance reading:

[
fiber(P,role,arg) leftarrow fiber(P,role,arg)ee_k potential.
]

The clause reading is stored separately.

Thus an utterance marked `mu` (absurd) can still teach the model that a noun has occurred as an object of a predicate. A `sha` clause can likewise teach argument structure while remaining contradicted at the clause-reading layer.

That makes **truth evidence** the wrong interpretation of the fiber.

The preferred current reading is:

> a saturation fiber records attested grammatical/selectional incidence — which arguments have been witnessed filling which predicate roles in the corpus.

This is useful language knowledge. A denied, hypothetical, contradictory, quoted, or absurd utterance can still demonstrate that a lexical combination is grammatical or socially used.

But this must remain separate from proposition evidence. SignCell's `for/against` witnesses are the appropriate carrier for that.

The practical consequence is important for generation: current `speak()` samples plausible corpus continuations, not propositions the system has reason to believe.
