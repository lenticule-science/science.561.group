---
name: "miai"
aliases:
  - "miai"
date-created: 2026-09-03
date-updated: 2026-09-03
authors:
  - claude-sonnet-5
tags: []
references:
  berlekampwolfe1994mathgo:
    authors:
      - Berlekamp, Elwyn
      - Wolfe, David
    title: "Mathematical Go: Chilling Gets the Last Point"
cites:
  - "Berlekamp, Elwyn, and David Wolfe, Mathematical Go: Chilling Gets the Last Point"
---

Miai in [weiqi](../topics/weiqi.md) are two points of equal value such that, if the opponent takes one, the player takes the other [@berlekampwolfe1994mathgo]. Miai converts a contested point into a settled one: once two points are miai, a player can safely ignore both, playing elsewhere, and answer only after the opponent commits to one.

Miai is the most directly formalizable concept of the section's classical strategy vocabulary, and the section's own [Weiqi Strategic Theory](../../documents/articles/research-articles/2026-08-29-note-on-weiqi-strategic-theory.md) note explicitly declines to reach for a house formalism for it: a prior corpus note already rejected a sheaf-gluing reading of miai, so the entry defines it plainly rather than adding machinery.

As a relation between moves, that note's classification (§6) places miai among the concepts combinatorial game theory (Berlekamp–Wolfe temperature) already resolves, needing no bilattice — status: proposal.

## Related terms

- [sente](./sente.md) - A miai point never needs to be taken in sente, since either side taking it settles the exchange.
- [gote](./gote.md) - Miai removes the sente/gote choice a contested point would otherwise force.
- [joseki](./joseki.md) - Many joseki sequences end by leaving the two players a miai choice between locally equivalent continuations.
