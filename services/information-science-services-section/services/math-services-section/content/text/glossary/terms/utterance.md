---
name: Utterance
description: "The ordered pair of a token and a claim: a mark on the left hand (the subject position) and a mark on the right hand (the predicate position). The sole admission boundary of the theory and the input articulating takes; its two-sidedness gives articulating's codomain its four corners."
aliases: [utterances, token, claim, hand, hands]
---
An **utterance** is the ordered pair of a token and a claim ([`Articulation/Articulating/Utterance.lean`](../../../../services/obsmetrological-services-section/lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/Utterance.lean)). A **token** is a [mark](mark.md) carried on the left hand, the subject position; a **claim** is a mark carried on the right hand, the predicate position. The hands are types: `Token` and `Claim` each carry one `Mark`, so which hand a mark sits on is carried by the mark's type, not read off an index afterwards. Token first, claim second; the order is load-bearing.

The utterance is the **sole admission boundary** of the theory: the one place a mark is let in, and it is let in on a hand. An utterance is not an act and articulates nothing. It is what [articulating](articulating.md) takes as input, and its two sides, each of which may or may not be articulated, are what give articulating's codomain its four [corners](articulation-cell.md).

In the relationality derivation the utterance is the entry: a recognition witnessing itself yields two positions engaged with each other, and choosing which leads gives the leading and trailing positions, the token and the claim.

"Token" and "claim" here name the two hands of an utterance. They are not the tokens a language model processes or the claims an essay argues.

## Related

- [Mark](mark.md)
- [Articulating](articulating.md)
- [Articulation cell](articulation-cell.md)
