---
title: "Proposition"
id: proposition
description: "A truth-evaluable statement: an element of a fiber Heyting algebra H_t that can be placed under nucleus evaluation. Propositions are the elements the doctrine language operates on."
contains: [conjecture-claim, corroborated-claim, open-claim]
produced-by: [assertion, concept]
measured-by: gap
describes: Observation, Entity, Relation
component-of: relational-universe
fiber-of: relational-universe
base: t
element-of: relational-history-fiber-doctrine-language
date-created: 2026-03-18
date-modified: 2026-03-19
params:
  fiber: relational-history-fiber-fixed-layer
  history: relational-history
output: relational-universe
ast:
  fiber-element:
    - fiber:
        - heyting-algebra-element
    - history:
        - nucleus-evaluation
---


## What this is

A **Proposition** is a truth-evaluable statement — an element of a fiber Heyting algebra $H_t$ at some history $t$.
A Proposition MUST be truth-evaluable in some fiber $H_t$ — every Proposition lives at some history.

Propositions are what the [RelationalHistoryFiberDoctrineLanguage](relational-history-fiber-doctrine-language.md) operates on.
The nuclei $\sigma_t$ (Saturate) and $\Delta_t$ (Transfer) act on propositions.
A proposition that is a fixed point of both nuclei — $\sigma_t(P) = P$ and $\Delta_t(P) = P$ — has settled: it is in $H^*_t$.

A Proposition is distinct from an [Entity](entity.md):
- An Entity has identity — it is a named individual.
- A Proposition has truth conditions — it is something that can be true or false.
An Entity can appear in a Proposition; the Proposition is what makes a claim about the Entity.

A Proposition is distinct from an [Observation](observation.md):
- An Observation is a witnessed, empirically grounded fact — a local section of an Accord type.
- A Proposition is a statement in the internal language of the fiber — it may or may not have an Observation backing it.
An Observation provides backing for a Proposition; the Proposition states what is claimed.
A Proposition MUST be distinguished from an Observation: a Proposition is a claim; an Observation is evidence for a claim.

## The four primitives

Entity, Relation, Proposition, and Observation are the four ontological primitives of the system.

| Primitive | What it is | Role in R |
|---|---|---|
| [Entity](entity.md) | Named, addressable individual | Node in the graph |
| [Relation](relation.md) | Named connection between entities | Edge label — itself a node (condition 4) |
| Proposition | Truth-evaluable statement in H_t | Element the nuclei act on |
| [Observation](observation.md) | Witnessed, grounded fact — local section | The backing that nucleates a Proposition |

These four generate the whole system.
Every resource, skill, runbook, and script is a combination of these four primitives.
A `grounding:` frontmatter entry is a settled Proposition: the nucleus has evaluated it to a fixed point, and it is now recorded as a Relation in the graph.

## In the RelationalHistoryFiberDoctrineLanguage

The [RelationalHistoryFiberDoctrineLanguage](relational-history-fiber-doctrine-language.md) is the internal propositional logic of $H_t$.
Its single type is **Prop** — every term has this type.
Its two nuclear operators are:
- $\sigma_t$ (Saturate): idempotent, extensive, meet-preserving; raises a Prop toward its saturation fixed point
- $\Delta_t$ (Transfer): idem; moves a stable Prop from one fiber to an adjacent fiber

A Proposition settles when both nuclei leave it unchanged.
An unsettled Proposition is still in R — it exists as an element of $H_t$ — but it has not yet become part of the stable layer $H^*_t$.

## Proposed relations are Propositions

A frontmatter relation assertion — any key-value pair — is a Proposition in $H_t$.

`grounding: NuclearLanguage` in a frontmatter block is the Proposition "$\sigma_t(\text{related}(A, B)) = \text{grounding}(A, B)$" — the claim that the nucleus has settled the raw `related` proposal to the specific predicate `grounding`.

This means:
- Every `related:` entry is an unsettled Proposition — the nucleus has not yet refined it
- Every specific predicate entry is a settled Proposition — the nucleus result
- The process of writing a specific relation to frontmatter IS recording a Proposition that has settled

## In the FARS

In a [FlatfileAgentialResourceSystem](flatfile-agential-resource-system.md), Propositions appear as:

- Frontmatter key-value pairs: each pair is a Relation-assertion Proposition — "this entity stands in this relation with this value"
- Body claims in a spec or math file: natural-language statements that encode mathematical Propositions
- [FlatfileAgentialResourceSystemGroundingClaim](flatfile-agential-resource-system-grounding-claim.md) files: first-class Proposition records under nucleus evaluation
- PLANS.md entries: Propositions about future work — what must be done

## Open questions

