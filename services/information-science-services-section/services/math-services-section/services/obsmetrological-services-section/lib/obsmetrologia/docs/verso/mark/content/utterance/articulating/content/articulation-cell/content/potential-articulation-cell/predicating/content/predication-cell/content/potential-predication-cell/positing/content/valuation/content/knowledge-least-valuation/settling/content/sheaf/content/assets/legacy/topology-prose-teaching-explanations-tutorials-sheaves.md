---
title: "Sheaves"
aliases:
  - "Sheaves"
date-created: 2025-12-26
tags: []
introduces:
  - "Sheaves"
type: overview
status: current
---
## Entry conditions

Use sheaves only when you can:

- Start from a site $(C,J)$.
- Define a [presheaf](../objects/presheaf.md) on $C$.
- State a concrete gluing requirement for your data.

## Definitions

- A **sheaf** is a [presheaf](../objects/presheaf.md) that satisfies the [sheaf condition](../teaching/explanations/sheaf-condition.md): compatible local data can be uniquely glued into global data.

## Vocabulary (plain language)

- **Compatible**: local pieces agree on overlaps.
- **Glue**: combine compatible local pieces into one global piece.
- **Sheaf condition**: the formal rule that guarantees unique gluing.

## Symbols used

- $F$: a [presheaf](../objects/presheaf.md) or sheaf.
- $\{U_i \to U\}$: a cover of $U$.

## Intuition

Sheaves formalize "local-to-global." If you know data on all pieces of a cover and those pieces agree where they overlap, then there is one global piece of data that explains all the local pieces.

## Worked example

Let $C$ be the open sets of a space and $F(U)$ be continuous functions on $U$. If functions agree on overlaps, there is a unique function on the union that restricts to each piece. This [presheaf](../objects/presheaf.md) is a sheaf.

## How to recognize the structure

- You can define what it means for local data to agree.
- You can define what it means to glue.
- Gluing is unique when it exists.

## Common mistakes

- Using sheaves without a clear notion of overlap.
- Assuming gluing is unique when it is not.

## Minimal data

- A site $(C,J)$.
- A [presheaf](../objects/presheaf.md) $F$.
- A stated [sheaf condition](../teaching/explanations/sheaf-condition.md).
