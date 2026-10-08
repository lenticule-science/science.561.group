---
name: "sente"
aliases:
  - "sente"
  - "initiative"
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

Sente in [weiqi](../topics/weiqi.md) is the initiative: a move the opponent must answer, so that the player who made it may play again elsewhere [@berlekampwolfe1994mathgo]. [Gote](./gote.md) is its complement, a move that ends the mover's turn because the opponent need not answer. A sequence is sente for a player if that player retains the initiative through it.

Sente is already mathematized, and well. Berlekamp and Wolfe's combinatorial-game-theory treatment of the Go endgame decomposes a position into a disjunctive sum of independent local games; each has a *temperature*, roughly the value of moving there first; optimal play takes the hottest available game; and the sente/gote distinction falls out of that temperature structure rather than needing a separate definition [@berlekampwolfe1994mathgo]. This is exact for the class of endgame positions the book treats, and the section's own research does not attempt to re-derive it: CGT owns this ground.

As a proposal in [Weiqi as Arena, Chu Space, Predication, and Manifold](../../documents/articles/research-articles/2026-09-03-note-on-weiqi-as-arena-chu-space-predication-and-manifold.md), sente reads as a move whose pullback changes the opponent's readouts across the position, so that the opponent must answer before the exchange can be read as settled — status: proposal.

## Related terms

- [gote](./gote.md) - Gote is the complementary state: a move the opponent need not answer.
- [miai](./miai.md) - Miai points are settled precisely because neither side needs sente to secure one of them.
- [honte](./honte.md) - Honte is the solid move played at the cost of the tempo sente would have kept.
- [aji](./aji.md) - Unlike aji, sente's value is spent the moment the opponent answers, not held open.
