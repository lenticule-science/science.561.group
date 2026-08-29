---
type: concept
class: parameterized-discipline
parameters: [artifact-class, reconstruction-criterion, plan-cues]
realizes: [accountable-closure]
see-also: [sequence, communicative-closure]
instantiated-by:
- "../../math/theories/mathematical-communication/concepts/plan-reconstruction.md"
date-created: 2026-05-02
---

# Plan reconstruction

*Plan reconstruction* is the criterion that an artifact communicates when the reader can reconstruct the plan that makes its parts belong together. A derivation may contain every inference and still obscure the plan. A high-level sketch may communicate a plan while failing to discharge enough obligations. The defect is not whether detail is present; the defect is whether the reader can recover *why these particular parts, in this particular order, jointly do the work*.

## Pattern

The artifact provides explicit cues that let the reader reconstruct its plan: introductions that state the plan, transitions that mark plan-relevant moves, sectioning that mirrors plan structure, summary remarks that locate completed sub-tasks, signposts that distinguish dependency moves from motivational moves. The plan is not implicit; the artifact teaches the reader how to recover it.

## Parameters

- **`artifact-class`** — the kind of artifact whose plan is at stake (research paper, textbook chapter, formal proof library, software repository, lecture, blog post, documentation page).
- **`reconstruction-criterion`** — what counts as successful plan reconstruction for this artifact-class (paraphrase of the strategy, identification of pivot lemmas, recovery of the dependency skeleton, identification of the motivating obstruction).
- **`plan-cues`** — the explicit signals the artifact uses to support reconstruction (plan-statement panels, transition language, sectioning rhythm, summary remarks, dependency callouts, motivation callouts).

## Conformance shape

For the artifact, attempt the reconstruction-criterion using only the plan-cues the artifact provides. Tally how much of the plan a competent reader of the stated audience can recover. An artifact whose plan cannot be reconstructed from its cues is a defect even if every individual inference checks.

## Lineage

The plan-reconstruction criterion is taken directly from Hamami & Morris, "Understanding in mathematics: The case of mathematical proofs" (*Noûs* 58, 2024), and is connected to McCloud's account of how panel sequence supports closure. Its broader role in the present theory is developed in section 6 of the [good-mathematical-communication](../../math/texts/good-mathematical-communication.md) essay.

## Instances in the corpus

- The [mathematical-communication plan-reconstruction concept](../../math/theories/mathematical-communication/concepts/plan-reconstruction.md) instantiates this concept for the mathematical artifact-classes `{research-paper, textbook-chapter, formal-proof-library, lecture, expository-essay}` with reconstruction-criteria and plan-cues specific to each.
