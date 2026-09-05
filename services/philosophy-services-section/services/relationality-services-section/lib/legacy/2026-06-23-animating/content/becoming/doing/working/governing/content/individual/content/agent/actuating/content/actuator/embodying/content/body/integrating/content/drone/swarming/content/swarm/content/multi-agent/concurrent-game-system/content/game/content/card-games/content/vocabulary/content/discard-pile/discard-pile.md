---
title: "discard pile"
aliases:
  - "discard pile"
date-created: 2026-03-01T00:00:00
type: term
tags: []
---

The discard pile is the stack of cards removed from active [hand](./hand.md) use during a [card game](../index.md), usually placed face up but sometimes face down depending on the game's rules.
Cards reach the discard pile through player choices (playing or voluntarily discarding) or through game events (cards that have resolved their effect).

The visibility of the discard pile is a critical design choice that shapes the information structure of the game.
A public (face-up) discard pile creates a memory game: attentive [players](../../../../terms/player.md) can track which cards have been played and infer what remains in the [draw pile](./draw-pile.md) and in opponents' hands.
In rummy-family games, the discard pile is also a resource — players may draw from it instead of the draw pile, turning discards into a shared market where every card you discard might be exactly what an opponent needs.
This creates tension: you want to shed cards that help no one, but you can't always tell what your opponents are collecting.

In some games the discard pile is hidden (face-down), which eliminates the tracking advantage and forces players to rely on memory of what was played during the round rather than visible evidence.
Other games make the discard pile partially visible — only the top card is shown, or only the most recent few.
Each variation produces a different balance between skill (memory, counting, inference) and uncertainty (not knowing what has been removed from play).
