---
title: Handicap Placement and Komi Values
description: "Audience: readers who already understand the difference between komi and handicap and now need the operational tables: which hoshi to place in which order, what komi to use in a handicap game, standard even-game komi by ruleset, and the rank-to-stone conversion."
date-created: 2026-08-18
date-updated: 2026-08-19
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/komi-and-handicap.md
- /games/topics/board-games/weiqi/terms/hoshi.md
references:
  britgo2026rating:
    authors:
    - Britgo2026rating
    title: Britgo2026rating
  wikipedia2026handicap:
    authors:
    - Wikipedia2026handicap
    title: Wikipedia2026handicap
  wikipedia2026komi:
    authors:
    - Wikipedia2026komi
    title: Wikipedia2026komi
  britgo2026compare:
    authors:
    - Britgo2026compare
    title: Britgo2026compare
  ref1:
    title: British Go Association, Ratings, Grades and Handicaps
  ref2:
    title: Wikipedia, Handicapping in Go
  ref3:
    title: Wikipedia, Komi (Go)
  ref4:
    title: British Go Association, Comparison of Some Go Rules
uses-mechanic:
- /games/topics/board-games/weiqi/terms/hoshi.md
- /games/topics/board-games/weiqi/terms/handicap.md
- /games/topics/board-games/weiqi/terms/komi.md
teaches:
- Handicap Placement and Komi Values
type: lesson
authors:
  - claude-fable-5
cites:
  - "British Go Association, Ratings, Grades and Handicaps"
  - "Wikipedia, Handicapping in Go"
  - "Wikipedia, Komi (Go)"
  - "British Go Association, Comparison of Some Go Rules"
---

Audience: readers who already understand the difference between komi and handicap and now need the operational tables: which hoshi to place in which order, what komi to use in a handicap game, standard even-game komi by ruleset, and the rank-to-stone conversion.

Learning goal: place a fixed handicap of any size 2 through 9 in the standard order, choose the correct komi for a handicap or even game, and convert a rank gap between two players into a stone count.

This lesson assumes the conceptual distinction covered in [Komi and Handicap](../tutorials/komi-and-handicap.md): komi is a scoring offset for an even game, handicap is a positional offset for an unequal one. Nothing here repeats that distinction. What follows is the operational layer: the tables a table director, a teacher, or an online server actually consults before a game starts.

## Worked example: setting up a game between a 5 kyu and a 1 kyu player

Two players want a fair game. One is 5 kyu, the other 1 kyu. The rank gap is four grades, so the rule of thumb calls for a four-stone handicap [@britgo2026rating]. The weaker player, 5 kyu, takes Black and places four stones before White's first move, on the four corner [hoshi](../../../../glossary/terms/hoshi.md): the two diagonal corners used for a two-stone handicap, plus the third and fourth corners added in sequence [@wikipedia2026handicap]. Because this is a handicap game rather than an even game, White does not receive the usual 6 to 7 and a half point komi; instead, under Japanese rules (assumed here), the game is played at a nominal 0.5 komi, just enough to prevent a drawn result [@wikipedia2026komi]. Not every ruleset stops there — see the komi table below for the additional stone-scaled compensation Chinese and AGA rules add on top of that 0.5. If the two players later find the four-stone game one-sided, the standard adjustment is to change the stone count by one rather than to tune komi, since komi is calibrated for near-equal strength, not for large rank gaps.

## Standard placement order for fixed handicaps (19x19)

The nine hoshi are the 4-4 point in each corner, the 4-10 point at the midpoint of each edge, and the 10-10 center point (tengen). The Japanese fixed-placement tradition, which most rule sets treat as the default, adds stones in this order [@wikipedia2026handicap]:

| Stones | Points added | Points now on the board |
|---|---|---|
| 2 | two diagonal corners (upper right, lower left) | 2 corners |
| 3 | the third corner (lower right) | 3 corners |
| 4 | the fourth corner (upper left) | 4 corners |
| 5 | tengen (center) | 4 corners + center |
| 6 | the two side points, left and right; tengen is removed | 4 corners + 2 side points |
| 7 | tengen (center), added back | 4 corners + 2 side points + center |
| 8 | the remaining two side points, top and bottom; tengen removed again | 4 corners + 4 side points |
| 9 | tengen (center), added back | all 9 hoshi |

Two things about this table are easy to misread. Tengen is not cumulative: it appears at 5 and 7 stones, is absent at 6 and 8, and returns at 9. And a "one-stone handicap" is not a placement rule at all; giving Black the move order with no extra stone is simply an even game with Black already moving first, which is why the table starts at 2.

## Free placement in Chinese and Ing traditions

The fixed order above is the Japanese default, and it is also the AGA default. But it is not universal. Chinese, Ing (SST), and New Zealand rule sets let Black place the handicap stones on any points at all, not only the nine hoshi, and some of those rule sets add a small point compensation for the handicap stones on top of that free placement [@britgo2026compare]. The AGA rules keep the hoshi as the default but explicitly permit a tournament director to specify free placement instead [@britgo2026compare]. In practice this means the placement table above should be read as "the standard convention," not as a universal constraint: a director running an event under Chinese or Ing rules may legitimately allow Black to set the handicap stones anywhere on the board.

## Komi in handicap games

Once handicap stones are on the board, komi is no longer doing the job of compensating for the first-move advantage; the stones already overcompensate for that. Under Japanese, Ing (SST), and New Zealand rules, handicap games are played with a nominal komi of 0.5, present only to break what would otherwise be a tied score, not to offset anything structural [@wikipedia2026komi]. That flat 0.5 figure is not universal, though: Chinese and AGA rules additionally compensate White for the area the handicap stones occupy, on top of the same 0.5 tie-breaker. Under Chinese rules, for an *n*-stone handicap, *n*/2 is added to White's score and *n*/2 is subtracted from Black's; under AGA rules using area (Chinese-style) counting, *n*−1 is added to White's score instead [@britgo2026compare]. In every case this is a sharp departure from even-game komi, which runs into the mid-single digits, and it is the detail most often mishandled by newcomers running their own handicap games: raising handicap komi to even-game levels effectively hands White extra stones on top of the reduced handicap.

## Standard komi values by ruleset, and why they moved

Even-game komi has drifted upward across a century of play, and the drift is itself evidence about how large Black's first-move advantage actually is. Under Japanese rules, the Hisekai group used a 4.5 komi in 1922; the Oza tournament adopted 5.5 in 1955; and the Nihon Ki-in raised the Japanese-rules standard to 6.5 in 2002, citing a measured 51.855 percent win rate for Black under the old 5.5 figure as evidence the earlier komi undercompensated [@wikipedia2026komi]. Under American rules, the AGA moved from 5.5 to 7.5 komi in August 2004, effective in 2005 [@wikipedia2026komi]. Chinese-rules play used 5.5 for years before also settling on 7.5 as standard [@wikipedia2026komi; @britgo2026compare]. The British Go Association itself used Japanese rules with 6 or 6.5 komi for years before adopting AGA rules with 7.5 komi in 2007 [@britgo2026compare]. Ing rules use 8, and New Zealand rules use 7 [@britgo2026compare]. Current statistical estimates from professional and computer play put the value of Black's first move, under area scoring, at around 7 points [@wikipedia2026komi]. Read together, this history is not a story of arbitrary rule tinkering: each increase followed measured win-rate imbalance at the previous value, which is why the trend runs in one direction, from 4.5 up toward 7 or 7.5, rather than oscillating.

| Ruleset | Standard even-game komi |
|---|---|
| Japanese rules (current) | 6.5 |
| AGA rules | 7.5 |
| Chinese rules (current) | 7.5 |
| Ing (SST) rules | 8 |
| New Zealand rules | 7 |
| Japanese, Ing (SST), New Zealand rules, handicap games | 0.5 (nominal, breaks ties only) |
| Chinese rules, handicap games | 0.5, plus *n*/2 added to White and subtracted from Black for an *n*-stone handicap |
| AGA rules, handicap games (area counting) | 0.5, plus *n*−1 added to White for an *n*-stone handicap |

## The rank-gap rule of thumb

The simplest working rule for choosing a handicap size is that the number of handicap stones equals the difference in rank between the two players, one stone per full grade of separation, whether the grades are both kyu, both dan, or span the kyu-to-dan boundary [@britgo2026rating]. A 5 kyu playing a 1 kyu takes four stones, as in the worked example above. A 3 dan playing a 1 dan takes two stones. When the gap is exactly one grade, the common convention is to skip stones altogether and simply give the weaker player Black with no komi, rather than add a single handicap stone [@britgo2026rating]. This rule of thumb is deliberately coarse: it is a starting point for pairing unfamiliar players, not a guarantee of an even contest, and organizers routinely adjust the stone count by one after a session if the games it produces are consistently lopsided.

## Exercises

1. A 4 kyu player and a 9 kyu player want to play a handicap game under Japanese rules. How many stones, on which points, and what komi?

<details>
<summary>Answer</summary>

The rank gap is five grades, so Black takes a five-stone handicap: the four corner hoshi plus tengen (the center point). Komi is the nominal handicap value, 0.5, not an even-game komi.
</details>

2. A club is running a six-stone handicap game. A player new to handicap games assumes tengen must be one of the six points, since it appeared at five stones and will appear again at seven. Why is that assumption wrong?

<details>
<summary>Answer</summary>

Tengen is not cumulative across handicap sizes. It is added at 5 stones, removed at 6 (replaced by the two side hoshi), added back at 7, removed again at 8 (replaced by the remaining two side hoshi), and added back at 9. At six stones the board holds the four corners plus two side points, with no stone on tengen.
</details>

3. Why did the Nihon Ki-in raise Japanese-rules komi from 5.5 to 6.5 in 2002 instead of leaving it unchanged?

<details>
<summary>Answer</summary>

Recorded results under the 5.5 komi showed Black winning about 51.855 percent of games, indicating the existing komi undercompensated for the first-move advantage. Raising komi to 6.5 was a direct response to that measured imbalance, not an arbitrary change.
</details>

4. A tournament director running an event under Ing rules tells Black to "put the handicap stones wherever you like, not just on the hoshi." Is this an error?

<details>
<summary>Answer</summary>

No. Ing rules, along with Chinese and New Zealand rules, permit free placement of handicap stones rather than requiring the fixed hoshi pattern. The Japanese fixed order is the common default, not a universal requirement.
</details>

## What comes next

For the conceptual groundwork this lesson builds on, return to [Komi and Handicap](../tutorials/komi-and-handicap.md). For the board points these tables place stones on, see the glossary term [hoshi](../../../../glossary/terms/hoshi.md), along with [handicap](../../../../glossary/terms/handicap.md) and [komi](../../../../glossary/terms/komi.md). To connect handicap play back to ordinary game structure, continue with [Weiqi Overview](../tutorials/weiqi-overview.md).
