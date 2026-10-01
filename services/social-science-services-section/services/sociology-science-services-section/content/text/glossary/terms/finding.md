---
extends: [record]
description: "A judgment comparing observed outcomes to expected outcomes — what review produces. The structured assessment that identifies variance, attributes cause, and feeds the feedback stage."
date-created: 2026-04-07
instance-of: act
part-of-stage: review
has: [variance, cause, scope, severity]
observed-takes: [observation]
expected-takes: [plan, goal, objective, baseline]
part-of-takes: [review]
display:
  headline: title
  body: variance
  metadata: [observed, expected, cause, scope, severity]
help-predicates: [id, variance, cause, scope]
references:
  army-aar1993:
    authors: ["US Army"]
    title: "A Leader's Guide to After-Action Reviews"
    publication: "Training Circular 25-20"
    year: 1993
  argyris-schon1978:
    authors: ["Chris Argyris", "Donald A. Schön"]
    title: "Organizational Learning: A Theory of Action Perspective"
    publication: "Addison-Wesley"
    year: 1978
  dekker2006:
    authors: ["Sidney Dekker"]
    title: "The Field Guide to Understanding Human Error"
    publication: "Ashgate"
    year: 2006
  isa1947:
    authors: ["International Organization of Supreme Audit Institutions"]
    title: "ISSAI Framework — Audit Findings"
    year: 1947
    note: "Formalized audit finding structure: condition, criteria, cause, effect"
aliases:
  - finding
---

A finding is a judgment comparing what happened to what was supposed to happen. It is what the [review](../../../../../../content/text/glossary/terms/review.md) stage produces. A finding takes [observations](observation.md) (actual state) and plan/goal predicates (intended state) as inputs and produces a structured assessment: what the gap is, why it exists, and how much it matters.

## What a finding carries

- **observed** — links to the observations this finding is based on. What actually happened, as measured by tracking.
- **expected** — links to the plan, goal, or objective that defined what should have happened. The criterion against which actuality is judged.
- **variance** — the gap between observed and expected. Not just "different" but *how* different and in what direction. "Planned 5 completions, observed 2" is a variance. "Completed on time but the output doesn't meet the definition-of-done" is also a variance.
- **cause** — the systemic factor explaining the variance. Following Dekker (2006): the question is never "who is responsible?" but "what conditions made this outcome likely?" A finding's cause points at system structure, not at agents. Missing information, unclear procedures, tool failures, capacity overload, wrong assumptions in the plan.
- **scope** — whether this is single-loop or double-loop (Argyris and Schön, 1978). A single-loop finding says "execution deviated from plan" — the fix is tactical. A double-loop finding says "the plan was wrong" — the fix is structural. The distinction matters because they feed different kinds of [adjustments](adjustment.md).
- **severity** — how much this finding matters. A minor variance on a low-priority task is noise. A systemic factor that affects every plan is critical. Severity determines which findings get acted on first.

## The audit finding structure

The International Standards of Supreme Audit Institutions formalize audit findings as four components: **condition** (what is), **criteria** (what should be), **cause** (why the gap), **effect** (what results from the gap). This maps directly: condition = observed, criteria = expected, cause = cause, effect = the downstream impact that severity measures.

The Army's After Action Review (TC 25-20, 1993) asks the same questions less formally: What was supposed to happen? What actually happened? Why the difference? What do we do better? The first two are inputs (expected and observed). The third is the finding's cause. The fourth is what the finding feeds — the [adjustment](adjustment.md).

## Findings compose into reviews

A [review](../../../../../../content/text/glossary/terms/review.md) is a container of findings. A session review contains findings about that session's work. A plan review contains findings about the plan's progress. A project review contains findings about whether the project is advancing its goal. The review's scope determines what observations and expectations feed its findings. The review itself doesn't carry the judgment — the findings do. The review is the container that groups related findings and provides the context for interpreting them together.

## See also

- [Review](../../../../../../content/text/glossary/terms/review.md) — the stage and container that findings belong to
- [Observation](observation.md) — the measured actuality that findings evaluate
- [Adjustment](adjustment.md) — the change that findings motivate
- [Tracking](../../../../services/work-science-services-section/content/text/glossary/terms/tracking.md) — the stage that produces the observations findings use
