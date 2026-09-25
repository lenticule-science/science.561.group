---
title: "Propositional Logic"
aliases:
  - "Propositional Logic"
date-created: 2025-12-26
tags: []
teaches:
  - "Propositional Logic"
id: logic-lesson-1
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
description: Use propositional logic only when your statements can be treated as true/false without internal structure.
---

## Entry conditions

Use propositional logic only when your statements can be treated as true/false without internal structure.

## Definitions

- A **propositional language** has atomic propositions $p,q,r$ and connectives like $\wedge,\vee,\Rightarrow,\neg$.
- A **valuation** assigns each atomic proposition a truth value.

## Vocabulary (plain language)

- **Atomic proposition**: a basic statement with no logical parts.
- **Connective**: a symbol that combines propositions.
- **Valuation**: a truth assignment to atoms.

## Symbols used

- $\wedge$: and
- $\vee$: or
- $\Rightarrow$: implies
- $\neg$: not

## Intuition

Propositional logic treats each statement as a black box that is either true or false. Logic then tells you how compound statements depend on the truth of their parts.

## Worked example

If $p$ is "it rains" and $q$ is "the ground is wet", then $p \Rightarrow q$ is true except when $p$ is true and $q$ is false.

## How to recognize the structure

- You can list the atomic propositions.
- You can assign truth values independently to each atom.

## Common mistakes

- Using propositions that contain internal structure that should be modeled with quantifiers.
