---
name: prose cell extraction
description: Open question — how should the linter extract predication cells from natural-language sentences in a markdown body, so that modal-evaluation checks (cell-in-modal-interval, possibility-gap, derivation-chain, mode-coherence, interval-non-empty) can be wired into the resource-file linter?
status: open
---

The modal-evaluation check kinds named in [`finest-possible-truth.md`](../../rough/finest-possible-truth.md) and [`modal-calculus-for-writers.md`](../../rough/modal-calculus-for-writers.md) require, for each sentence in a prose body, the set of cells $(s, p, o)$ the sentence posits values on. Without that extraction, the modal pair $(\Box_R u, \Diamond_R u)$ cannot be evaluated at the sentence's addressed cells, and the modal-check interpreters reduce to stubs.

## What is needed

For a sentence like *"The captain is responsible for every outcome on the project,"* the linter needs:

- Subject: `captain` (or the entity it canonically resolves to, e.g., `personnel:emsenn`).
- Predicate: `is-responsible-for`.
- Object: `every-outcome-on-project` (or a quantified expression that decomposes into per-outcome positings).

This is the mapping from natural language to a set of typed predication cells. Once a sentence's addressed cells are known, evaluating the modal pair against the running valuation is mechanical.

## Why this is hard

The extraction is not a regex problem. Sentences in this repository's prose have unbounded surface variation: passive voice, multi-clause structure, anaphora, technical noun phrases that themselves expand into multi-cell positings. A rule-based parser handles a small fraction of cases. A trained model handles more but introduces a dependency on an inference call per linted file, with the inference cost dominating the lint cost.

## Candidate approaches

- **LLM-side function call.** The linter, for each sentence, calls an LLM with a prompt asking for the addressed cells. Cost: one inference per sentence per file. Latency: bounded by the LLM call. Trust: the LLM may extract cells the records don't recognize.
- **Frontmatter-declared addressing surface.** The author declares, in frontmatter, the cells the body will address. The linter checks the body for sentences that posit outside the declared surface. Cost: zero, but the discipline depends on author honesty.
- **Markdown-link extraction.** Use the body's local markdown links as a proxy for the addressed cells: a link to `code/structures/<term>.md` is a positing on cells with `<term>` as subject. Cost: zero. Coverage: low — most positings are not link-marked.
- **Sentence-pattern grammar.** Define a controlled subset of English ("the X is a Y", "X is-a-kind-of Y", etc.) that maps cleanly to cells, and require prose to use it. Cost: zero. Coverage: depends on how restrictive the grammar is.

## Decision needed

Pick an approach, or pick a sequence (start with markdown-link extraction as the cheap floor, add frontmatter-declared surface for prose with high coverage requirements, defer LLM-side extraction). The decision determines what the modal-check interpreters look like in the lint script.

## Related

- [`code/structures/prose.md`](../../../code/structures/prose.md) — the prose structure that declares this extraction as part of its observation surface.
- [`work/governance/rules/specifications/prose/checks.json`](../../../work/governance/rules/specifications/prose/) — the manifest that will carry the modal-check entries once extraction is solved.
- [`prose/rough/modal-calculus-for-writers.md`](../../rough/modal-calculus-for-writers.md) — the essay this question follows from.
