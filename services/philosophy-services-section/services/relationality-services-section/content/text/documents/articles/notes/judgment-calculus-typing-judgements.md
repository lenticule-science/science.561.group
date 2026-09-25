---
title: Judgment Calculus Typing Judgements
keywords:
  - lambda
  - typing
layer: internal-theorem
status: plan
depends-on:
  - seed-judgement-triad
  - flow-judgement
description: "encode the typing judgements Γ ⊢ t : A of the internal judgment calculus in the relational calculus."
---

The acts

- `SeedJudgementTriad` through
- `FlowJudgement`

encode the typing judgements `Γ ⊢ t : A` of the internal judgment calculus in
the relational calculus.

Contexts, terms, and types obtained from the judgment calculus structures are related by
these judgement-triad acts in a way that matches the standard typing rules:

- variable, abstraction, application, and fixpoint typing rules are all
  represented by appropriate compositions of acts along the trace.
