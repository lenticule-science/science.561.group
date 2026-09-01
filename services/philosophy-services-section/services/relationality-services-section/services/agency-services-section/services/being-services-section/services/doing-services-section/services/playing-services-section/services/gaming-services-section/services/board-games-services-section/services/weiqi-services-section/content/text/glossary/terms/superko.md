---
name: "superko"
aliases:
  - "superko"
  - "positional superko"
  - "situational superko"
date-created: 2026-08-19
date-updated: 2026-08-19
authors:
  - claude-sonnet-5
tags: []
cites:
  - "British Go Association, A. Default Rules"
  - "American Go Association, AGA Rules of Go"
  - "New Zealand Go Society, New Zealand Rules of Go"
---

Superko in [weiqi](../topics/weiqi.md) is a repetition rule that extends [ko](./ko.md) beyond the single immediately-preceding position: it forbids recreating *any* whole-board position that has already occurred in the game, not only the one position just before the opponent's last move [@britgo2025default]. Two variants are in common use. Positional superko (PSK) forbids any recurrence of an identical arrangement of stones, regardless of whose turn it is. Situational superko (SSK) forbids a recurrence only when it is also the same player's turn to move as it was the earlier time that arrangement occurred — so the same stone arrangement may legally recur once with the other player to move, but not a second time with the original player to move [@usgo2022agarules].

Superko matters because the simple ko rule alone only blocks immediate two-move recaptures; it does nothing to stop longer cycles, such as triple ko or other multi-ko patterns, from repeating a board position indefinitely and preventing the game from ever concluding. Superko rules close that gap by treating repetition of the whole board, not just of one local point, as the thing to forbid. Which variant a ruleset adopts is one of the parameters recorded in the [rulesets comparison](../../documents/articles/notes/rulesets.md), since Chinese-tradition and New Zealand rules typically use positional superko while AGA rules specify situational superko, and Japanese rules historically rely on simple ko alone plus an ad hoc "no result" convention for unresolved long cycles.

## Related terms

- [ko](./ko.md) - Superko generalizes the simple ko rule from one forbidden position to all previously occurring positions.
- [capture](./capture.md) - Superko violations can only arise from sequences of captures and recaptures, since placement alone never restores an earlier board.
- [liberty](./liberty.md) - Long ko cycles that superko must adjudicate arise from groups repeatedly reduced to and restored from a shared last liberty.
- [seki](./seki.md) - Some multi-ko fights that superko must resolve are closely related to seki: neither side can safely play the deciding capture.
