---
type: bibliography
key: berlekamp-wolfe1994
reference-type: book
authors:
  - Berlekamp, Elwyn
  - Wolfe, David
year: 1994
title: "Mathematical Go: Chilling Gets the Last Point"
publisher: A K Peters
---

## Why this is central

Berlekamp and Wolfe give the combinatorial-game-theory (CGT) treatment of
the Go endgame: a position decomposes into a disjunctive sum of
independent local games, each with a *temperature* (roughly, the value of
moving there first), and optimal endgame play takes the hottest available
game first — the "chilling" operator of the title is the technical device
that makes this precise for Go's integer-scored positions. This is the
one piece of formal Go theory this corpus already leans on directly: the
2026-08-29 [Weiqi Strategic Theory](../research-articles/2026-08-29-note-on-weiqi-strategic-theory.md)
note classifies sente, gote, and miai as "relations between moves" that
CGT — named there as Berlekamp–Wolfe temperature — already solves, and
explicitly declines to rebuild a house formalism for them: "CGT owns
this. What the section needs is a glossary entry that defines the terms
and points at Berlekamp and Wolfe, not a new formalism." That note listed
the citation under "working references from assistant knowledge; verify
before public use" — this carrier is that verification.

The [Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md)
research note builds directly on top of this book's own stated limit:
CGT's disjunctive-sum machinery "has no formal device for a single move
whose effect is shared across otherwise-independent regions" (a
ladder-breaker serving two ladders, aji shared across two fights). The
note's one surviving conjecture — coordination cohomology as a measure of
whole-board-versus-regional reading — is explicitly framed as filling
exactly the gap this book leaves open, not as competing with what it
already settles.

## What it does not settle

CGT's decomposition assumes the position *can* be split into
independent local games; it has no account of aji (latent potential whose
resolution depends on context not yet played) or of moves whose effect
is genuinely shared across regions. The strategic-theory note's own
classification table places aji outside CGT's reach for exactly this
reason. The book is also purely an endgame theory — it says nothing about
opening or middle-game strategy (influence, thickness, direction of
play), which this section's glossary and strategic-theory note handle
through other vocabulary.

## Bridges

- [Weiqi Strategic Theory](../research-articles/2026-08-29-note-on-weiqi-strategic-theory.md) — cites this work for sente/gote/miai and for the endgame-temperature treatment
- [Obsmetrologia and Go Strategy](../research-articles/obsmetrologia-and-go-strategy.md) — the coordination-cohomology conjecture is framed against this book's disjunctive-sum limit
- [dame](../../../glossary/terms/dame.md), [ending the game](../teaching-articles/tutorials/ending-the-game.md) — the corpus's own endgame vocabulary this theory formalizes
