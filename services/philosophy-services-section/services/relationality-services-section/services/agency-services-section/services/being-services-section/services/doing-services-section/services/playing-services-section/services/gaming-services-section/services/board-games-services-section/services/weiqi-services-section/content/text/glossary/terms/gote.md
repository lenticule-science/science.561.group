---
name: "gote"
aliases:
  - "gote"
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

Gote in [weiqi](../topics/weiqi.md) is a move that ends the mover's turn because the opponent need not answer it [@berlekampwolfe1994mathgo]. It is the complement of [sente](./sente.md): where a sente sequence lets its player keep the initiative and play elsewhere next, a gote sequence hands the initiative to the opponent.

Gote is not simply a worse outcome than sente; it is a distinct position in Berlekamp and Wolfe's combinatorial-game-theory treatment of the endgame, where a position decomposes into a disjunctive sum of independent local games, each with a temperature, and the sente/gote distinction falls directly out of that temperature structure rather than being judged move by move [@berlekampwolfe1994mathgo]. A large gote play can still be worth more than a small sente play; the two are compared by their values, not by category alone.

As a relation between moves, the section's own [Weiqi Strategic Theory](../../documents/articles/research-articles/2026-08-29-note-on-weiqi-strategic-theory.md) (§6) classifies gote among the concepts combinatorial game theory (Berlekamp–Wolfe temperature) already resolves, needing no bilattice — status: proposal.

## Related terms

- [sente](./sente.md) - Gote is the complementary state to sente: a move that ends the initiative rather than keeping it.
- [miai](./miai.md) - Miai converts a point that would otherwise force a sente/gote choice into one that can be ignored by both sides.
- [aji-keshi](./aji-keshi.md) - A gote move that spends latent potential for a small local gain is the classic aji-keshi error.
