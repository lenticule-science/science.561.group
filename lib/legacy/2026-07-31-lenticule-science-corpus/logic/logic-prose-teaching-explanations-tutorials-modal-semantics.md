---
title: "Modal Semantics"
aliases:
  - "Modal Semantics"
date-created: 2025-12-26
tags: []
introduces:
  - "Modal Semantics"
type: overview
status: current
---
## Entry conditions

Use modal semantics only when you have a Kripke frame and a valuation for atomic propositions.

## Definitions

In a Kripke model $(W,R,V)$, the modal operators are defined by:

- $\Box \varphi$ is true at $w$ if $\varphi$ is true at every world $v$ with $wRv$.
- $\Diamond \varphi$ is true at $w$ if $\varphi$ is true at some world $v$ with $wRv$.

## Vocabulary (plain language)

- **Necessity**: true in all accessible worlds.
- **Possibility**: true in at least one accessible world.

## Symbols used

- $\Box$: necessity
- $\Diamond$: possibility

## Intuition

Modal operators talk about what is true across related worlds, not just within one world.

## Worked example

If $w_0$ accesses only $w_1$, and $p$ is true at $w_1$, then $\Box p$ is true at $w_0$.

## How to recognize the structure

- You have a valuation $V$ for atomic propositions.
- You can evaluate formulas at each world using $R$.

## Common mistakes

- Using $\Box$ or $\Diamond$ without specifying $R$.
