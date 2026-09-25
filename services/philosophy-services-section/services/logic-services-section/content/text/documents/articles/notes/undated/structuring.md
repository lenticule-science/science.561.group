---
name: structuring
description: The operation of instantiating a structure — given a structure's entity-form (its signature and invariants), producing a new instance that satisfies it. The introduction rule for a structure-type in the Curry-Howard sense.
title: structuring
---

## Mathematical grounding

In type theory under Curry-Howard, constructing a term t : T is the act of producing a proof of proposition T. The term inhabits the type; the construction is a proof. Structuring is this construction operation applied to entity-forms: given a structure S, produce an instance r such that r satisfies S's signature and invariants.

In category-theoretic terms: if a structure S is an object of the theory's category, then structuring is the construction of a term in the context that introduces r as an element of S. This is the introduction rule for the type S.

Structuring is not the same as asserting a predication cell. It is the higher-level operation that produces a new instance whose internal predication cells collectively satisfy a structure definition.

## What this file is

This file names the structuring operation — the act of instantiating any structure from its entity-form. It is not a specific structuring instance; it is the general pattern.
