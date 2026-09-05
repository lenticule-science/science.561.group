---
type: question
class: scoping
status: open
explores:
  - question
  - explores
  - closes
see-also:
  - ../specifications/note-types/question.md
  - ../specifications/question-as-first-class.md
  - ../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/questions/amplitude-valued-settlings.md
---

# What does a well-formed question look like?

Questions are now a first-class note type with their own directory in every theory. Predication-categories has 124 of them. They differ from a TODO or a hand-wave in that they are *typed research artifacts*: each declares what it is inquiring into, why the answer matters, and what would count as an acceptable answer.

The question: what are the *necessary* features of a well-formed question, and what discriminates a question from a half-formed thought that should not yet be a question note?

## Why it matters

If anything that ends in a "?" is allowed in `questions/`, the directory becomes a TODO list and loses its standing as a research artifact. If the bar is too high, contributors stop posting questions and open work goes back to living in private heads or scattered comments.

The question type is meant to make the corpus's *not-knowing* as load-bearing as its knowing. That requires that questions be checkable for well-formedness.

## Candidate well-formedness conditions

Drawn from inspection of the predication-categories questions:

1. **The question has a definite subject.** It explores specific named entities (its `explores:` is non-empty), not a vague topic.
2. **The question states what is at stake.** A "Why it matters" or equivalent section says what hangs on the answer — what a wrong answer would cost, what a right answer would unlock.
3. **The question states acceptance criteria.** A "What an answer would look like" section names what would count as the question being closed: a theorem with a particular form, a worked example with particular properties, a discrimination rule defended in a particular way.
4. **The question cites its boundary.** Related theorems, examples, and prior attempts that bound the question are linked. This makes the question's *position* in the corpus visible.
5. **The question is open in a checkable way.** Either the question has `status: open` and no `closed-by:` field, or it has `status: closed` and a `closed-by:` field pointing at the theorem/spec/example that closed it. (The lifecycle is not under-specified.)

## Sub-questions

- **Should questions cite the *attempts* against them**, separate from the closure? A question could carry an `attempted-by:` list of theorems that tried but did not succeed. Or that information could live in the attempting theorems' frontmatter as `attempts:`. Either places the information once; consistency requires picking one direction.
- **What about questions that turn out to be ill-posed?** A question that, once examined, turns out to rest on a confused presupposition — does it get `status: dissolved` with a note saying why? Does it get deleted? Predication-categories has not yet faced a dissolved question; we should decide before we do.
- **What is the granularity?** A meta-question that decomposes into sub-questions — does each sub-question get its own file, or do sub-questions live as headings in the meta-question's body? The amplitude-valued-settlings question in predication-categories does the latter; should that be the convention?

## What an answer would look like

A short well-formedness specification (3–5 conditions) that any contributor can check against their draft question, plus a short lifecycle specification (open → attempted → closed | dissolved), plus the answer to the granularity question.

## What is at stake in the wrong answer

A loose answer turns `questions/` into a TODO list and the corpus loses its way of treating not-knowing as research. A strict answer raises the contribution bar so high that questions stop appearing.
