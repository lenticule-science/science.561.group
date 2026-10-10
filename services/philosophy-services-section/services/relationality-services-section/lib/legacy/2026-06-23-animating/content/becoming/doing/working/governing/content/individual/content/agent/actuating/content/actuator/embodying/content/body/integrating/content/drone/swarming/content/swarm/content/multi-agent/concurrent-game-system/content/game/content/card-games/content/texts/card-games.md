---
title: "Card Games Specification"
aliases:
  - "Card Games Specification"
  - "card games specification"
authors:
- claude-opus-4-6
date-created: 2026-03-06T00:00:00
type: topic
tags: []
---

This specification defines the structural features that distinguish card games from other game types.
It provides constitutive criteria — the features whose presence or absence decides whether a game *is* a card game — and descriptive criteria — features that are common but not definitional.

## Constitutive features

A game is a card game if and only if:

1. **Card-based parts**: the primary game material is a set of discrete, portable objects (cards) that carry information on their faces — [rank](../terms/rank.md), [suit](../terms/suit.md), text, images, or other markings.
  The cards are the medium through which [game state](../../../terms/game-state.md) is represented and manipulated.

2. **Information asymmetry through orientation**: cards have a hidden face and a visible face (or back), and the game uses this physical property to create information asymmetry.
  Some cards are face down (hidden from some or all [players](../../../terms/player.md)); some are face up (visible).
  The management of this asymmetry — what is known, what is hidden, and how hidden information is revealed — is a defining structural feature.
  Games that use cards purely as tokens (visible to all, with no hidden face) are using cards as pieces, not as cards in the structural sense.

3. **[Deck](../terms/deck.md) as bounded resource**: the cards form a finite, bounded set — a deck — whose composition is known in advance (or at least knowable).
  The deck defines the probability landscape: what cards exist, how many of each type, and therefore what combinations and distributions are possible.
  Play draws from and depletes this bounded resource, creating an arc from uncertainty toward resolution.

## Common but non-constitutive features

These features appear in most card games but aren't definitional:

- **[Shuffling](../terms/shuffle.md)**: most card games randomize card order before play.
  But some card games (particularly trading card games and deck-building games) involve constructed decks where the player chooses the composition, and the shuffle randomizes only the order of a personally selected set.
- **[Hands](../terms/hand.md)**: most card games deal cards to players as private holdings.
  But some card games place all cards on the table (face up or face down) and players interact with a shared layout rather than personal hands.
- **[Turn](../../../terms/turn.md) structure**: most card games use sequential turns.
  But simultaneous-play card games (Snap, Egyptian Ratscrew, some phases of Pit) distribute action across all players at once.
- **Standardized deck**: many card games use a conventional deck (52-card French-suited, 32-card German-suited, etc.).
  But custom-deck games (Uno, Set, Dominion, trading card games) use purpose-built decks and are still card games.
- **Scoring across rounds**: many card games play multiple rounds with cumulative scoring.
  But single-round games and games with binary outcomes are still card games.

## Boundary cases

- **Tile games** (dominoes, mahjong): tiles are discrete objects with markings, they can be hidden or revealed, and they form a bounded set.
  Structurally, tile games share the constitutive features of card games.
  The medium differs (rigid tiles vs. flexible cards), but the information structure is analogous.
  This specification treats tile games as a closely related family rather than a subset, because the physical affordances differ enough to change game design — tiles can stand upright (visible to the holder but not opponents without the orientation trick that cards use), and they connect edge-to-edge in ways cards typically don't.
- **Collectible and trading card games** (Magic: The Gathering, Pokémon): these meet all three constitutive criteria.
  The main structural difference from traditional card games is that the deck composition is player-constructed rather than standardized, which moves significant strategic decision-making to the pre-game phase (deck building).
  They are card games by this specification.
- **Deck-building games** (Dominion, Star Realms): these meet all three criteria.
  Players construct their deck *during* play rather than before it, adding a resource-management layer to the card game structure.
  They are card games by this specification.
- **Board games with card parts** (e.g., Ticket to Ride, Pandemic): many board games use cards as one part among some (boards, tokens, dice).
  If the cards serve primarily as randomizers or event triggers within a board-based system, the game is a board game with card elements rather than a card game.
  If the cards are the primary medium of play and the board is secondary, the game may be a card game.
  The boundary is gradient rather than sharp.
- **Single-card oracle systems** (tarot reading, oracle decks used for divination): these use cards and involve hidden-face information, but they lack [rules](../../../terms/rules.md) that create a space of meaningful choice between players.
  They are card-based practices, not card games.
  See [tarot](../../../../spirituality/divination/tarot/index.md) for the divination tradition.

## Relationship to parent discipline

The constitutive features map to the general game features defined in [What is a Game?]
(../../../curricula/what-is-a-game.md): card games have [rules](../../../terms/rules.md) (the specific mechanics governing play), objectives ([win conditions](../../../terms/win-condition.md) based on tricks, points, hand depletion, or other criteria), uncertainty (hidden cards, shuffled order, opponent behavior), and voluntariness.
The card-game-specific addition is that the medium of play is a bounded set of discrete information-carrying objects whose hidden/visible orientation creates the game's information structure.

## Relationship to subtopics

Card games encompass a few major families, each distinguished by its core [mechanic](../../../terms/mechanic.md):

- **Trick-taking games** define play around the [trick](../terms/trick.md) as the unit of action, with [follow-suit](../terms/follow-suit.md) rules and [trump](../terms/trump.md) systems structuring the competition within each trick.
- **Melding games** define play around collecting and declaring valid [melds](../terms/meld.md) from a [hand](../terms/hand.md).
- **Shedding games** define play around emptying the hand by matching or sequencing cards against a shared pile.
- **Betting card games** combine card mechanics with [wagering](../../gambling/terms/wager.md) systems.
  These overlap with the [gambling](../../gambling/index.md) topic; poker is treated under [gambling games](../../gambling/gambling-games/poker/index.md) because the betting structure is as central as the card structure.

These families aren't formal subtopics in the directory structure — they are analytic categories used throughout the [curricula](../curricula/index.md) to classify and compare games.
