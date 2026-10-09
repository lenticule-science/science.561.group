---
kind: question
status: open-with-candidate-factorization
explores:
  - relconlang
  - signcraft
  - generation
  - stance
  - evidence
  - pragmatics
---
# How should RelConLang generation use stance and evidence?

Current SignCraft learns predicate and argument fibers independently of clause stance. This is sensible for grammatical/selectional learning: even a contradicted or unusable utterance can teach that a lexical combination occurs.

Current `speak()`, however, also ignores source-cell stance when generating. A corpus containing only

`mu sa ga mor do rama.`

is sufficient to generate the unmarked

`sa ga mor do rama.`

because predicate counts and role fibers survive while the source `mu` does not participate in realization.

The research program should therefore separate three jobs.

### 1. Selectional competence

What predicates and arguments have been witnessed combining in the language?

This may learn from `mu`, `sha`, denials, quotations, hypotheticals, and other non-assertive material.

### 2. Corpus continuation

What surface utterance is plausible as a sample from the learned language corpus?

This is what current SignCraft `speak()` most closely implements. Its receipt is a **sampling receipt**, not epistemic warrant.

### 3. Semantic realization

What does an agent intend to communicate now, under what dialogue move and stance, given current proposition evidence?

This must begin from an explicit semantic/realization plan. Selectional fibers may constrain grammatical word choice, but stance should come from the present plan/evidence policy, not be inherited from or erased out of training examples.

The distinction matters because language competence and world-model confidence should be able to evolve independently.
