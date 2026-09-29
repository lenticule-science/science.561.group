# questions/

Open engineering questions, conjectures with no current attempt, and program-shaping questions about what to construct next. The corpus is early; the questions section is where the engineering uncertainty lives.

A question is *not* a theorem-stated-as-an-imperative. A question is a place where the engineer does not yet know what the right answer is, and where capturing the question keeps the uncertainty visible.

## Frontmatter

```yaml
---
type: question
status: open | resolved | superseded
explores: [...]        # the entities the question is inquiring into
---
```

The `explores:` frontmatter records which structures the question concerns. Questions exist as outgoing-graph edges in the corpus's structure: a question that explores no listed entities is exempt from orphan-detection but should be cross-checked at validation time.

## Body shape

A question's body has the structure:

1. **Statement.** What is unknown.
2. **Concrete cases.** Sub-questions or specific instances that, if answered, would resolve the larger question.
3. **Relevance.** What the answer would let the engineer do or assume.

A question may close to a theorem when its statement crystallizes into a theorem-grade claim with a proof or sketch. When it does, the question note's `status:` becomes `resolved` and the body links to the theorem.

## When to add a question

When the corpus's coherence depends on a specific uncertainty and capturing the uncertainty visibly is more useful than ignoring it. Examples:

- [Are there closure rules whose unbounded match-radius is essential?](unbounded-radius-rules.md) — the corpus's locality discipline depends on the answer.
- [When does the file-first to event-first transition complete?](two-store-coherence-asymptote.md) — the corpus's two-store discipline is both patterns; the transition policy is engineering policy not yet committed.

Questions that do not affect the corpus's structural commitments are documentation, not corpus structure; they belong in the operations triage, not here.
