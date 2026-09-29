---
type: reference
class: foundational
status: active
authors: ["Elias Koutsoupias", "Christos Papadimitriou"]
year: 1999
venue: "STACS 1999, LNCS 1563"
title: "Worst-case Equilibria"
---

# Koutsoupias & Papadimitriou 1999 — Worst-case Equilibria

Koutsoupias, E., & Papadimitriou, C.
(1999).
Worst-case Equilibria. *Proceedings of STACS 1999*, LNCS 1563, 404-413.

The paper introducing the *price of anarchy* (PoA) concept: the worst-case ratio of social welfare at the worst Nash equilibrium to social welfare at the socially optimal outcome.
The framework launched algorithmic game theory's PoA program — quantifying the cost of decentralized self-interested behavior across game classes.

The original paper analyzed simple load-balancing games; subsequent work extended PoA analysis to:

- Selfish routing (Roughgarden-Tardos).
- Network formation games.
- Auctions and combinatorial allocation.
- Resource sharing in distributed systems.

Roughgarden's *smoothness framework* (2009) provides a unified technique for proving PoA bounds across many settings, dramatically simplifying analysis.

The PoA framework is one of the most influential contributions of theoretical computer science to game theory and continues to inform analysis of decentralized multi-agent systems.

Cited by: [price-of-anarchy](../theorems/price-of-anarchy.md).
