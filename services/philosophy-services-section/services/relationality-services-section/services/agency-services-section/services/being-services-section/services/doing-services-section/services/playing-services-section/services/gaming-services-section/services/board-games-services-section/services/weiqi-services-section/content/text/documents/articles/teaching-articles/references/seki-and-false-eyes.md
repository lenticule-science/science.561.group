---
title: Seki and False Eyes
description: "Audience: readers who already understand eyes, connection, and life and death and want to work through positions where the ordinary two-eyes rule does not directly apply."
date-created: 2026-08-18
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/living-groups-and-eyes.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/eye.md
- /games/topics/board-games/weiqi/terms/false-eye.md
- /games/topics/board-games/weiqi/terms/seki.md
- /games/topics/board-games/weiqi/terms/life-and-death.md
- /games/topics/board-games/weiqi/terms/liberty.md
teaches:
- Seki and False Eyes
date-updated: 2026-08-19
type: lesson
authors:
  - claude-fable-5
cites:
  - "British Go Association, Comparison of Some Go Rules"
  - "Sensei's Library, False Eye"
  - Britgo2026compare
  - Senseislibrary2026falseeye
---

Audience: readers who already understand eyes, connection, and life and death and want to work through positions where the ordinary two-eyes rule does not directly apply.

Learning goal: recognize a seki when neither side can safely fill a shared liberty, and recognize a false eye when an eye-shaped point does not actually protect a group.

## Worked example: two groups sharing two liberties

Imagine a small region near the side of the board where a Black group and a White group are packed against each other and against the edge. Both groups are otherwise completely enclosed, connected to nothing else alive elsewhere on the board, and neither has an [eye](../../../../glossary/terms/eye.md) of its own. Between the two groups sit exactly two empty points, side by side, and those two points are the only [liberties](../../../../glossary/terms/liberty.md) either group has left.

Neither player can safely act on those two points. If Black plays on one of them, Black fills one of Black's own group's last two liberties, along with one of White's, and Black's group drops to a single liberty: [atari](../../../../glossary/terms/atari.md). White then plays the remaining shared point and captures the entire Black group. The same logic runs in reverse if White moves first: White's group ends up in atari, and Black captures. Because moving first into the shared space is always worse than leaving it alone, neither player ever plays there, and the position holds for the rest of the game. This is [seki](../../../../glossary/terms/seki.md): both groups stay on the board, alive, without either one ever forming two separate eyes.

Scoring this position depends on the ruleset. Under Japanese territory scoring, the two shared points earn nobody any points, because they were never enclosed as one player's exclusive territory [@britgo2026compare]. Under Chinese-style area scoring, each side's living stones count toward its score along with whatever territory it alone encloses elsewhere, but the two shared points still belong to neither side, since area scoring counts stones and exclusively-enclosed empty points, not disputed ones [@britgo2026compare]. The stones survive under either ruleset; only the point total for that local exchange differs.

## Worked example: an eye that is not really an eye

Now imagine a Black group that has enclosed a single empty point in what looks like a normal eye: the point itself is empty, and every intersection directly orthogonal to it is a Black stone. This point sits on the first line, directly along the side of the board (not in a corner). But of the diagonal points next to it, only one is Black, and that stone is a lone stone with few liberties of its own and no solid [connection](../../../../glossary/terms/connection.md) to the rest of the group. The other relevant diagonal belongs to White.

An eye's security depends on more than its four orthogonal neighbors. The defending color also needs to control enough of the diagonal points around it: one diagonal if the eye sits in a corner, two if it sits on an edge, and three if it sits in the middle of the board [@senseislibrary2026falseeye]. This eye is on the edge, so Black needs two secure diagonals and has only one, and that one is itself capturable. If White captures the weak diagonal stone, White gets a stone directly next to the eye point. The point is then no longer surrounded solely by connected Black stones, so White can play into it. That makes this a [false eye](../../../../glossary/terms/false-eye.md): a point that currently looks like a second eye but can eventually be forced open.

If this is the only other candidate eye the group has besides one genuine eye elsewhere, the group does not have two real eyes yet. Under ordinary [life and death](../../../../glossary/terms/life-and-death.md) reading, one true eye plus one false eye counts as one eye, not two, and a group with only one secure eye is not unconditionally alive. It survives only if it can still make a second true eye somewhere else, or if the surrounding position turns into a capturing race or a seki instead.

## Exercises

1. In the two-group seki above, why does playing at either shared point immediately backfire on the player who plays it?

<details>
<summary>Answer</summary>

Filling one shared liberty removes one of the mover's own last two liberties, dropping that group into atari with only the other shared point left. The opponent's group still has that same point as its own last liberty, so the opponent plays it and captures. Because the same backfire happens to whichever side moves first, both sides prefer to leave the two points alone indefinitely.
</details>

2. Why can a single weakly connected diagonal stone turn a real-looking eye into a false eye?

<details>
<summary>Answer</summary>

An eye on the edge is secure only if the defending color holds at least two of the diagonal points around it, not just the four orthogonal points. If one of those diagonals depends on a stone that can itself be captured, the opponent can remove that stone and gain a stone directly next to the eye point, which breaks the enclosure that made the point a protected liberty in the first place.
</details>

## What comes next

Seki and false eyes are both exceptions to the simple version of "two eyes live" introduced in [Living Groups and Eyes](../tutorials/living-groups-and-eyes.md), so it is worth rereading that lesson's eye-shape discussion once these two ideas are clear. For the scoring consequences of seki under different rulesets, continue with [Komi and Handicap](../tutorials/komi-and-handicap.md). For vocabulary work, continue with [Terms](../../../../glossary/topics/weiqi.md), especially [seki](../../../../glossary/terms/seki.md), [false eye](../../../../glossary/terms/false-eye.md), [eye](../../../../glossary/terms/eye.md), and [life and death](../../../../glossary/terms/life-and-death.md).
