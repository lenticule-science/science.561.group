---
title: "Philosophical Content Types in an ASR"
description: "The content types a philosophical ASR adds to the general type vocabulary — governed by arguability rather than provability, with different thresholds for structural validity."
date-created: 2026-03-05T00:00:00
date-updated: 2026-03-29
type: lesson
authors:
  - claude-opus-4-6
status: draft
teaches:
  - "philosophical content types"
  - "philosophical validity requirements"
  - "arguability as validity principle"
keywords:
  - AgentialSemioverse
  - Repository
---

This lesson introduces the content types that a [Philosophical ASR](../index.md) adds to the general type vocabulary. After completing it, you should be able to identify which type a philosophical page should have and what relations it needs.

## How philosophical types differ from mathematical ones

Mathematical types are governed by provability: a theorem without a proof is ill-formed. Philosophical types are governed by arguability: a claim without an argument is weaker (an assertion), but not ill-formed. The threshold for structural error is different.

The philosophical dependency graph can be cyclic. A claim generates arguments; arguments face objections; objections receive responses; responses may revise the original claim. This is not a defect — it is how philosophical inquiry works.

## The types

### claim

A proposition advanced as true. The atomic unit of philosophical discourse. Unlike a mathematical axiom (taken as given) or theorem (required to be proven), a claim invites evaluation. It says: here is something I think is true, and I am prepared to argue for it.

SHOULD have `argued-by:` — but a claim without arguments is an assertion, not an error.

MAY have `tradition:` — identifying the discourse context (e.g., `relational-ontology`, `classical-logic`).

### argument

A structured case supporting a claim. Has premises and a conclusion, and the relationship between them is made explicit.

MUST have `supports:` — an argument that does not say what it argues for is ill-formed.

SHOULD have `argument-form:` — what kind of inference? Deductive (the conclusion follows necessarily), inductive (the conclusion is probable), abductive (the conclusion is the best explanation), transcendental (the conclusion is a condition of possibility), dialectical (the conclusion emerges from contradiction).

### objection

A challenge to a claim or argument. Identifies a weakness: an invalid inference, a false premise, an unconsidered case, an alternative explanation.

MUST have `targets:` — an objection that does not say what it objects to is ill-formed.

MAY have `proposes:` — advancing an alternative claim.

### response

A reply to an objection. Defends the original claim or argument, possibly in modified form.

MUST have `addresses:` — a response that does not say what objection it responds to is ill-formed.

MUST engage with the substance — dismissing the objection or repeating the original claim is not a response.

MAY have `revises:` (modifying the original claim) or `concedes:` (partially accepting the objection).

## What the types track

The types track the *structure* of engagement, not its outcome. The spec cannot say whether a claim is true — it can say whether a claim has arguments, whether those arguments face objections, and whether those objections have been addressed. This makes the state of inquiry visible and transparent.

## Check for understanding

Given a page that says "relations are ontologically prior to entities" and provides three reasons:
1. What type should it be? (It advances a proposition and argues for it → could be a `claim` page with a linked `argument` page, or a single page combining both)
2. What relations does the claim need? (SHOULD: `argued-by:` linking to the argument)
3. What relations does the argument need? (MUST: `supports:` linking back to the claim)

Given a page that says "substance ontology provides a simpler account" in response to the relational priority claim:
1. What type should it be? (`objection`)
2. What MUST relation does it need? (`targets:` linking to the claim or argument it challenges)
3. If it also advances an alternative view, what additional relation? (`proposes:` linking to the alternative claim)

## Key takeaway

Philosophical types have fewer structural requirements than mathematical ones, but the requirements that exist are still constitutive. An objection that targets nothing is not an objection. A response that addresses nothing is not a response. The types make these structural roles explicit.
