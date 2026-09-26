---
name: Mark
description: "The atomic primitive of Obsmetrologia: an arbitrary surface string, built from nothing, whose identity is the role it takes. A mark enters the theory only on a hand of an utterance, as a token or as a claim."
aliases: [marks]
---
A **mark** is the atomic primitive of Obsmetrologia ([`Primitive/Mark.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Primitive/Mark.lean)): an arbitrary surface string, built from nothing. The string is how the mark is presented, not what it is; a mark's identity is the role it takes downstream.

A mark has one of exactly two kinds, **token** and **claim** (`Kind.two_kinds`, `Kind.token_ne_claim`). They are not two primitive types but the two sides of the [utterance](utterance.md) pair, and a mark may stand on either. The token is the identity-carrying side, first in the pair; the claim is the content-carrying side, second.

A mark is admitted only on a hand of an utterance: the utterance is the sole place the theory lets a mark in.

In the relationality derivation the corresponding step is the first name. The void holds two copies of nothing it cannot tell apart; drawing attention to one of them names it, and a name that refers to itself is the first thing that is something rather than its absence.

## Related

- [Utterance](utterance.md)
- [Articulating](articulating.md)
