---
title: "Sets"
type: "lesson"
date-created: 2025-12-26
description: "Use set-based structures only when you can:"
---

Learning objectives

- Sets

## Entry conditions

Use set-based structures only when you can:

- Identify a finite or well-defined collection of elements.

- Decide membership clearly (no ambiguous membership rules).

- Represent relations as explicit pairs of elements.

If membership is undefined or dynamic without rules, do not treat it as a set.

## Definitions

- A **set** $S$ is a collection of elements with clear membership.

## Vocabulary (plain language)

- **Set**: a named collection of distinct items.

- **Element**: one item that may belong to a set.

- **Ordered pair**: a two-item list where order matters, written (x,y)(x,y).

- **Membership**: the rule that decides whether an element is in the set.

## Symbols used

- $S, T$: sets.

- $x \in S$: &ldquo;xx is an element of $S$.&rdquo;

## Intuition

Think of a set as a named bucket of distinct items. What matters is whether an item is in the bucket or not.

If you cannot list or decide membership, you should not claim a set. If you cannot list or decide the pairs, you should not claim a relation. If one input can map to multiple outputs, you do not have a function.

## Worked examples

### Example 1: A set

Let S={red,green,blue}S = \{\text{red}, \text{green}, \text{blue}\}. Membership is clear: &ldquo;red in SS&rdquo; is true, &ldquo;yellow in SS&rdquo; is false.

### Example 2: A set of strings

Let S={"cat","dog"}S=\{\text{"cat"}, \text{"dog"}\}. Then &ldquo;cat&rdquo; is in $S$, and &ldquo;bird&rdquo; is not.

## How to recognize the structure

- **Set**: you can answer &ldquo;is $x$ in SS?&rdquo; for any candidate $x$.

## Common mistakes

- Treating vague groupings as sets when membership is not defined.

## Minimal data

- A list of elements for $S$.

## Misuse warnings

- Do not treat &ldquo;similarity&rdquo; as a function unless it is single-valued.

- Do not infer relations from vague description without listing pairs.
