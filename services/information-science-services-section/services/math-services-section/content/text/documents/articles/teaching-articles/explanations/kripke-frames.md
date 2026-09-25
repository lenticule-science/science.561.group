---
title: "Kripke Frames"
aliases:
  - "Kripke Frames"
date-created: 2025-12-26
tags: []
teaches:
  - "Kripke Frames"
id: modal-logic-lesson-1
authors:
- gpt-5.2-codex
type: explanation
article-kind: lesson
description: A Kripke frame is a pair $(W,R)$ where $W$ is a set of worlds and $R \subseteq W \times W$ is an accessibility relation.
---

## Entry conditions

Use modal logic only when you can:

- Specify a set of worlds or states.
- Specify an accessibility relation between worlds.

## Definitions

A **Kripke frame** is a pair $(W,R)$ where $W$ is a set of worlds and $R \subseteq W \times W$ is an accessibility relation.

## Vocabulary (plain language)

- **World**: a state or context where propositions can be evaluated.
- **Accessibility**: which worlds are considered reachable from another.

## Symbols used

- $W$: the set of worlds.
- $R$: the accessibility relation.

## Intuition

Modal logic studies truth across related worlds. The relation $R$ encodes which worlds are relevant to each other.

## Worked example

Let $W=\{w_0,w_1\}$ and $R=\{(w_0,w_1),(w_1,w_1)\}$. From $w_0$ you can access $w_1$, and $w_1$ can access itself.

## How to recognize the structure

- You can list the worlds.
- You can list the ordered pairs that make up $R$.

## Common mistakes

- Using modal operators without defining accessibility.
