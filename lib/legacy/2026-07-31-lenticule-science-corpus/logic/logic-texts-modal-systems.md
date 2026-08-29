---
title: "Modal Systems"
aliases:
  - "Modal Systems"
id: modal-logic-lesson-3
authors:
- gpt-5.2-codex
date-created: 2025-12-26
type: lesson
tags: []
teaches:
  - "Modal Systems"
---

## Entry conditions

Use named modal systems only when you can specify properties of the accessibility relation.

## Definitions

Common modal systems correspond to constraints on $R$:

- **K**: no additional constraints.
- **T**: $R$ is reflexive.
- **S4**: $R$ is reflexive and transitive.
- **S5**: $R$ is an equivalence relation (reflexive, symmetric, transitive).

## Vocabulary (plain language)

- **Reflexive**: every world accesses itself.
- **Transitive**: if $wRv$ and $vRu$, then $wRu$.
- **Symmetric**: if $wRv$ then $vRw$.

## Symbols used

- $R$: the accessibility relation.

## Intuition

Modal axioms are not arbitrary; they encode specific structural assumptions about access between worlds.

## Worked example

If $R$ is reflexive and transitive but not symmetric, then the appropriate system is S4, not S5.

## How to recognize the structure

- You can test whether $R$ is reflexive, transitive, symmetric.
- You can choose the system that matches those properties.

## Common mistakes

- Assuming S5 semantics without proving symmetry.
