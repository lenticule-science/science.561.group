---
kind: question
status: open-with-initial-laws
explores:
  - relconlang
  - dialogue
  - conditional-relevance
  - state-transition
  - question-answer
  - refusal
  - repair
---
# What dialogue transition laws does RelConLang need?

The current dialogue tests do not infer dialogue structure. They parse each turn, then verify that hand-authored `move`, `respondsTo`, and `adjacency` labels are internally consistent with a small hard-coded pair table.

The blind-dialogue experiment needs the inverse problem: derive conversational relations from language and context.

An initial transition algebra can be stated without treating conversation as a stack of duties.

For a context-grounded proposition (P):

[
ku(P) : D mapsto D + open(question,P)
]

A later `se(P')` may close that relevance only if (P') is propositionally compatible with (P). An irrelevant answer-marked sentence remains syntactically an answer move but fails the compatibility condition.

Candidate `nes+ccomp P'` can act as a negative answer/denial report. Candidate `nul+ccomp P'` can refuse the relevance without making (P) false.

A `du(P)` request opens request relevance, but dialogue force alone does not create a deontic obligation. `kod` or external normative structure must be represented separately.

A counter-question can open a new relevance item while preserving the first.

These are experimental state-transition laws, not production policy and not yet a complete conversation-analysis theory.
