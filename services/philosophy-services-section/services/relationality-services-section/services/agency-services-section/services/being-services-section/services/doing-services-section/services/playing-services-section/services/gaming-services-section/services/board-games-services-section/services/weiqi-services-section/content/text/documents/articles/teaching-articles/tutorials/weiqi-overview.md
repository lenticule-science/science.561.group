---
title: Weiqi Overview
description: "Audience: readers who want a first structural map of weiqi before studying joseki, life and death, or advanced strategy."
date-created: 2026-03-09
tags: []
requires:
- /games/curricula/what-is-a-game.md
- /games/topics/board-games/index.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/liberty.md
- /games/topics/board-games/weiqi/terms/capture.md
- /games/topics/board-games/weiqi/terms/territory.md
- /games/topics/board-games/weiqi/terms/ko.md
- /games/topics/board-games/weiqi/terms/atari.md
teaches:
- Weiqi Overview
date-updated: 2026-03-09
type: lesson
authors:
  - openai-chatgpt-5.4-fast
cites:
  - "Encyclopaedia Britannica, Go"
  - "North American Go Federation, This Is Go"
  - "British Go Association, A. Default Rules"
  - Britannica2026go
  - Nagofed2026thisisgo
  - Britgo2025default
---

Audience: readers who want a first structural map of weiqi before studying joseki, life and death, or advanced strategy.

Learning goal: explain how liberties, capture, territory, and ko organize play in weiqi.

## Worked example: surrounding one stone

Imagine an empty 9 by 9 board. Black places one stone near the center. White then places stones on each of the four adjacent intersections around it. Once Black's stone has no remaining [liberties](../../../../glossary/terms/liberty.md), White removes it from the board. That is a [capture](../../../../glossary/terms/capture.md).

This small example shows the core logic of the game. Stones do not move after placement. They remain in place, connect to neighboring stones of the same color, and survive only while the group retains at least one liberty. Much of weiqi can be understood as managing that relation between extension and enclosure.

Weiqi is a two-player territorial board game played by placing black and white stones on grid intersections, usually on a 19 by 19 board [@britannica2026go; @nagofed2026thisisgo]. Black moves first. Stones normally remain where they are played unless they are captured. Because the board state is almost fully public, the game rewards long-range spatial judgment rather than hidden-information inference.

The central tactical unit is the liberty. A single stone in open space has four liberties, fewer on the edge, and fewer again in the corner. Connected stones share liberties, which is why groups matter more than isolated stones. When a move removes the last liberty from an opposing stone or group, the player captures it and removes it from the board [@nagofed2026thisisgo]. A stone or group reduced to one liberty is in [atari](../../../../glossary/terms/atari.md), which is the game's simplest tactical alarm.

The strategic objective is [territory](../../../../glossary/terms/territory.md), not only capture. Players try to secure vacant points by surrounding them more solidly than the opponent can invade or reduce [@britannica2026go; @nagofed2026thisisgo]. This is why a move that does not capture anything immediately can still be strong: it may stabilize a large territorial framework or prevent the opponent from doing so.

The game also needs a rule to prevent immediate infinite repetition. That rule is [ko](../../../../glossary/terms/ko.md): after a capture that would allow the opponent to recreate the exact previous board position with one move, that immediate recapture is forbidden [@britgo2025default]. Ko turns some local fights into timing problems that reach across the whole board, because the player who is blocked from recapturing must play elsewhere first.

## Exercises

1. Why is a group of connected stones usually stronger than the same number of isolated stones?

<details>
<summary>Answer</summary>

Connected stones share liberties. That usually makes them harder to capture because the opponent must remove the liberties of the whole group, not each stone separately.
</details>

2. Why is ko important even though it applies only to a narrow kind of local repetition?

<details>
<summary>Answer</summary>

Without ko, some local captures could repeat forever and stop the game from progressing. Ko forces the fight to break and often links a local struggle to the wider board because one player must play elsewhere first.
</details>

## What comes next

The next step is [Living Groups and Eyes](./living-groups-and-eyes.md), which explains why [connection](../../../../glossary/terms/connection.md) and [eyes](../../../../glossary/terms/eye.md) determine whether groups survive. For scoring and matchmaking structure, continue with [Komi and Handicap](./komi-and-handicap.md). For vocabulary work, continue with [Terms](../../../../glossary/topics/weiqi.md), especially [liberty](../../../../glossary/terms/liberty.md), [atari](../../../../glossary/terms/atari.md), [eye](../../../../glossary/terms/eye.md), and [life and death](../../../../glossary/terms/life-and-death.md).
