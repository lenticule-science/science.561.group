---
title: "Question notes"
description: "A question note (frontmatter type: question, directory questions/) is a typed research artifact that names an open problem, decomposes it structurally, and cites the theorems / morphisms / examples that bound and witness it."
---


A *question note* (frontmatter `type: question`, directory `questions/`) is a typed research artifact that names an open problem, decomposes it structurally, and cites the theorems / morphisms / examples that bound and witness it. A question is the corpus's commitment that there is structure here worth working out, with as much evidence as we currently have for what that structure is. Questions are first-class in the corpus — see [question-as-first-class](question-as-first-class.md) for why.

## Required frontmatter

```yaml
---
type: question
class: <classifier>          # internal | external | structural | empirical | scoping | ...
---
```

`class:` distinguishes question kinds:

- **`internal`** — a question about how the theory's own machinery should be developed. Most questions are internal.
- **`external`** — a question about how the theory connects to outside literature, neighboring theories, or applications.
- **`structural`** — a question about what to construct or how to characterize (often partial: parts of the answer are established, parts are open).
- **`empirical`** — a question whose answer requires running an experiment, computation, or measurement. Often paired with [examples](../research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/systems/archive/example.md) that supply the data.
- **`scoping`** — a question about what the theory should commit to (boundaries, axioms, terminology). Often resolved by a charter-level decision rather than a proof.

## Required body shape

A question note's body SHOULD have this shape:

```
# <Display name>

<First paragraph: the question, stated precisely. What is being asked, and what
the question's answer would look like as a structural artifact. NOT a vague
"how does X work?" — a precise structural ask.>

## Decomposition                          (when applicable)

<The question's structural decomposition into sub-questions. A good question
decomposes — by axis, by regime, by case, by layer. Each sub-question SHOULD
be a citable artifact: typically another question note, or a per-axis theorem.>

## What is established                    (recommended — often the bulk of the note)

<What the corpus already knows that bears on the question. Citations to
theorems (with their status), examples that witness specific cases,
morphisms that make pieces of the question precise. This section is what
distinguishes a typed question from a vague TODO: the question knows what
it can already lean on.>

## What remains open                      (recommended)

<The substantive open work. Phrased as targets for future theorems, examples,
or constructions.>

## Why the question matters               (recommended)

<One paragraph on the question's structural role: what its answer would
unlock, what it connects to elsewhere in the corpus.>
```

## Recommended frontmatter

- `explores: [...]` — the entities (concepts, objects, morphisms, theorems) the question is inquiring into. This relation is what exempts a question from orphan detection: a question with non-empty `explores:` is by construction *pointed at* the corpus, not floating.
- `depends-on: [...]` — entities the question's *statement* presupposes. (Distinct from `explores:`, which names what the question is *about*.)
- `status:` — `open | partial | resolved | abandoned`. A resolved question SHOULD link to the theorem(s) or note(s) that resolved it.
- `see-also: [...]` — related questions or material.

## When to use `question` vs. alternatives

- Use `question` when the open work is *structural*: what to construct, how to characterize, which decomposition to take. Questions are research programs in miniature.
- Use [theorem](../../../../../../../../../../engineering-science-services-section/services/computer-science-services-section/services/software-services-section/services/lean-services-section/content/text/glossary/terms/theorem.md) with `status: open` when the open work is a *single claim* whose statement is firm and only the proof is missing.
- Use a `narrative` when the open work is a discursive *direction* — a position paper, an outlook — without a precise question to anchor it.
- Use a TODO comment in the source code when the open work is *implementation* of an already-established morphism. TODOs do not belong in the library.

## Validation rules (informal)

- A question note MUST declare `type: question` and `class:`.
- A question note SHOULD declare `explores:` with at least one entity. Questions without `explores:` are diagnostics — they are floating.
- A question note MAY have arbitrarily long body when the decomposition is rich. Long questions are typically *good* questions; brevity is not a virtue here.
- A question's `explores:` set MUST resolve to existing notes in the corpus.

## Theory-level commitments

A theory's open work SHOULD be visible in its `questions/` directory. A theory with no `questions/` directory is either (a) genuinely complete (rare) or (b) hiding its open work in narratives, READMEs, or off-corpus documents (common). The latter is a curation diagnostic — see [theory-discipline](theory-discipline.md).

## Examples

- Richly-decomposed structural question: [realizability-of-cohomology-classes](../research/2026/07/31/lenticule-import/humanities/theories/math/theories/categories/theories/predication-categories/questions/realizability-of-cohomology-classes.md). Decomposes by regime and axis, lists per-regime theorems with their statuses, names lower-bound witnesses, states explicitly what remains open.
- Engineering question: [agential-fixed-point-asymptote](../research/predicated-agentic-orchestration-platform/agent/agential-self-generation/agential-fixed-point-asymptote/agential-fixed-point-asymptote.md).
