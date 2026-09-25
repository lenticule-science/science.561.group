---
name: hand
description: "A hand in [poker](../_index.md) is a set of cards held by or assigned to a player, used to determine the outcome of a round [@britannica2026poker]. The term has two related meanings: the specific cards a player holds and a complete round of play from deal to [showdown](showdown.md)."
aliases:
- hand
date-created: 2025-12-31
date-modified: 2026-03-09
tags: []
references:
  - id: britannica2026poker
    type: document
    title: Britannica2026poker
    author:
      - literal: Britannica2026poker
  - id: sklansky1999
    type: document
    title: Sklansky1999
    author:
      - literal: Sklansky1999
  - id: ref1
    type: document
    title: Encyclopaedia Britannica, Poker
  - id: ref2
    type: document
    title: David Sklansky, The Theory of Poker
cites:
  - Encyclopaedia Britannica, Poker
  - David Sklansky, The Theory of Poker
---

A hand in [poker](../_index.md) is a set of cards held by or assigned to a player, used to determine the outcome of a round [@britannica2026poker]. The term has two related meanings: the specific cards a player holds and a complete round of play from deal to [showdown](showdown.md).

Poker hands are ranked by a hierarchy that reflects the probability of being dealt each combination from a standard [deck](deck.md). The rarest combinations rank highest: a royal flush is the strongest hand in most variants, while a high card is the weakest. Between these extremes, the standard ranking runs through pairs, two pair, three of a kind, straights, flushes, full houses, four of a kind, and straight flushes. Some poker variants modify this hierarchy or introduce additional categories.

The strength of a hand is always relative to what opponents hold, which is unknown until showdown. This incomplete information is what makes poker a game of skill rather than a pure lottery: players must infer the likely strength of opposing hands from betting patterns, position, and revealed community cards [@sklansky1999]. A hand that is statistically strong can still lose, and a weak hand can win the [pot](pot.md) if opponents [fold](fold.md) to a well-timed bet.

---

## Supplementary formulation

```yaml
---

name: "hand"
aliases:
  - "hand"
date-created: 2025-12-31
tags: []
---
```

A hand is the set of cards currently held by a [player](../../../../services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/content/text/glossary/terms/player.md) as private information in a [card game](../_index.md). The hand is the player's primary resource: it defines what actions are available, what combinations are possible, and what information the player holds that opponents don't. In poker, the hand is what you are betting on. In a trick-taking game, the hand is the sequence of plays you have available across an entire round.

Hand management — deciding what to play now versus what to preserve for later — is the core strategic problem in most card games. Every card committed to a [trick](trick.md), [meld](../../../../services/relationality-services-section/services/agency-services-section/services/being-services-section/services/doing-services-section/services/playing-services-section/services/gaming-services-section/services/card-games-services-section/content/text/glossary/terms/meld.md), or discard is a card no longer available for future use. This creates a planning horizon: players must balance immediate tactical needs (winning this trick, completing this meld) against future strategic needs (holding a strong card for a critical moment, keeping flexibility for unknown situations). The tension between spending and saving is what makes card games feel like resource management even when the only resource is information.

Hand size and replenishment rules shape this tension. A large hand offers more options but is harder to optimize. A small hand forces faster commitments and higher-stakes individual decisions. Games that replenish hands from a [draw pile](draw-pile.md) extend the planning horizon by introducing new cards; games that deal all cards at the start (as in many trick-taking games) create a fixed horizon where every card in your hand is all you will ever have. Whether hands are hidden (standard in most games) or partially revealed (open-hand variants, games where some cards are played face up) changes the information structure of the entire game. See also [hand](hand.md) in the poker context, where the term refers specifically to the cards a player holds for evaluation against a ranking system.

## Earlier material

- [pot](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/gambling-analysis-service/services/poker-services-section/content/text/glossary/terms/pot.md) - The hand is what players are trying to turn into a claim on the pot.
- [showdown](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/gambling-analysis-service/services/poker-services-section/content/text/glossary/terms/showdown.md) - At showdown, the remaining hands are compared directly.
- [fold](../../../../../../../engineering-services-section/services/computer-engineering-services-section/services/computer-systems-engineering-services-section/services/computer-game-system-services-section/services/gambling-analysis-service/services/poker-services-section/content/text/glossary/terms/fold.md) - Folding ends a player's use of the hand without requiring its strength to be revealed.
