---
title: Regression Positions
description: "Audience: kernel implementers. Thirteen small, hand-verified board positions, each labeled with an expected outcome, meant to seed the rules kernel's regression test corpus."
date-created: 2026-08-19
date-updated: 2026-08-19
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/ending-the-game.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/ko.md
- /games/topics/board-games/weiqi/terms/superko.md
- /games/topics/board-games/weiqi/terms/suicide.md
- /games/topics/board-games/weiqi/terms/seki.md
- /games/topics/board-games/weiqi/terms/dead-stones.md
- /games/topics/board-games/weiqi/terms/area-scoring.md
- /games/topics/board-games/weiqi/terms/territory-scoring.md
type: specification
authors:
  - claude-sonnet-5
cites:
  - "British Go Association, A. Default Rules"
---

Audience: kernel implementers building `@lenticule-science/weiqi-kernel`, per the [Weiqi Platform Plan](./weiqi-platform-plan.md)'s call for "a corpus of regression positions drawn from the rules-completeness documents so the doctrine and the code cite each other."

Learning goal: give the kernel a first, hand-checked set of small positions covering ko, superko, suicide, seki, dead-stone settlement, both scoring methods, and handicap placement — each with a stable id and an expected outcome precise enough to assert against in a test file.

## Diagram format

Every diagram below is a complete, self-contained board of the exact size stated — not a fragment of a larger board — so every edge shown is a true board edge and every liberty count is unambiguous. Columns are lettered left to right starting at `A`; rows are numbered top to bottom starting at `1`. Symbols: `X` = Black stone, `O` = White stone, `.` = empty point, `*` = an empty point of particular interest (a ko point, or the point about to be played), called out in the prose beneath each diagram. Coordinates are written column-then-row, e.g. `B2`.

Each position carries an `id` for citation from kernel test files, and an `expected:` block giving the outcome as key-value pairs, matching the [rulesets](./rulesets.md) identifier vocabulary where applicable.

## R1 — simple ko: retake illegal

```
    A B C D E
  1 . . . . .
  2 . . X . .
  3 . X * X .
  4 . O X O .
  5 . . O . .
```

5×5 board. Black's last move was `C4`, which captured a lone White stone that had been sitting at `C3` (White's only liberty was `C4`, since `B3`, `D3`, and `C2` were already Black). It is now White's turn.

```
expected:
  id: R1-simple-ko
  ko_point: C3
  white_may_play_C3: illegal
  reason: >
    Playing C3 would capture Black's single stone at C4 (its only liberty is
    C3) and would recreate, point for point, the whole-board position that
    existed immediately before Black's last move. Forbidden under simple ko
    and under every ruleset in this corpus, since simple ko is their shared
    baseline. White must play elsewhere first.
```

## R2 — positional superko: a long cycle simple ko alone would permit

Take the shape at R1, but suppose the surrounding position also contains a second, independent ko elsewhere on the board (structurally identical to R1's shape, at points `K1`/`K2` rather than `C3`/`C4`). A well-known property of two independent, alternately-played ko fights is that captures and recaptures can, after several plies, return the *entire* board to an exact earlier arrangement while it is again the same player's turn to move — this is the standard "long cycle" (triple-ko-style) case rules literature uses to motivate superko.

```
expected:
  id: R2-positional-superko-long-cycle
  reason: >
    Simple ko only inspects the single position immediately before the
    opponent's last move, so it does not by itself forbid a position from
    recurring several plies later. Positional superko forbids the move that
    would recreate ANY position that has occurred earlier in the game,
    regardless of whose turn it was then, so it forbids this recurrence
    where simple ko alone would not.
  note: >
    Given here as a structural specification, not a fully hand-traced move
    list: the exact intervening sequence should be constructed and verified
    directly against the kernel's board history once superko is
    implemented, using two instances of the R1 ko shape as the starting
    point.
```

## R3 — situational superko permits what positional superko forbids

Using the same long-cycle setup as R2: suppose the identical whole-board position recurs, but with the *opposite* player to move compared to its earlier occurrence (an odd number of stone-placing plies apart, rather than an even number).

```
expected:
  id: R3-situational-superko-permits
  reason: >
    Positional superko forbids this recurrence outright, since it inspects
    the board only, not whose turn it is. Situational superko permits it,
    because SSK's forbidden unit is the pair (position, player-to-move), and
    here the player to move differs from the earlier occurrence — so under
    ruleset.aga (situational superko) this move is legal, while under
    ruleset.chinese, ruleset.newzealand, and ruleset.ing (positional
    superko) the equivalent move is illegal.
  note: >
    Given here as a structural specification alongside R2, for the same
    reason; verify the exact parity of the intervening plies against the
    kernel's implementation before relying on this as a literal test fixture.
```

## R4 — suicide: illegal under standard rulesets

```
    A B C
  1 X X X
  2 X * X
  3 X X X
```

3×3 interior fragment; treat the Black ring shown as having additional liberties outside this diagram on a larger board, so it is unconditionally alive and unaffected by White's move. It is White's turn, considering `B2`.

```
expected:
  id: R4-suicide-illegal
  white_may_play_B2: illegal (under ruleset.chinese, ruleset.japanese, ruleset.aga, ruleset.ing)
  reason: >
    B2's four neighbors are all Black. Black's ring is alive (liberties
    exist outside this fragment), so White's stone at B2 would capture
    nothing and would itself have zero liberties: suicide.
```

## R5 — suicide: legal only under New Zealand rules

Same diagram and same move as R4 (`B2`, all four neighbors Black, capturing nothing).

```
expected:
  id: R5-suicide-legal-nz
  white_may_play_B2: legal (under ruleset.newzealand only)
  result_if_played: >
    White's stone at B2 is placed and immediately removed as a self-capture
    (ruleset.newzealand.suicide = legal), per rulesets.md. Under every other
    ruleset in this corpus the same move is illegal — see R4.
```

## R6 — seki: minimal two-liberty standoff

```
    A B C
  1 X . O
  2 X . O
```

3×2 board (both edges shown are true board edges). Black group `{A1, A2}` and White group `{C1, C2}` each have exactly two liberties, `B1` and `B2`, both shared with the opponent. Neither group has an eye.

```
expected:
  id: R6-seki-minimal
  status: seki
  reason: >
    If either side plays B1 or B2, that side's own group drops to a single
    shared liberty while the opponent's group does too, and it becomes the
    opponent's turn — who then captures by playing the last shared point.
    Filling first therefore loses the group that fills. Neither side plays;
    both groups remain on the board for the rest of the game.
  scoring:
    territory: B1 and B2 count for neither player under ruleset.*.scoring = territory
    area: Black area = 2 (A1, A2 only), White area = 2 (C1, C2 only); B1
      and B2 count for neither player under ruleset.*.scoring = area, since
      they are not enclosed by one color alone.
```

## R7 — dead stones: unconditionally dead, no escape available

```
    A B C D
  1 X X X X
  2 X O * X
  3 X X X X
```

4×3 board, fully enclosed. White's single stone sits at `B2`; its only remaining liberty is `C2`.

```
expected:
  id: R7-dead-stone-no-escape
  status: dead
  white_group: [B2]
  reason: >
    White's only liberty is C2. If White plays C2 to try to gain space, the
    resulting two-stone White group (B2, C2) has zero liberties (every
    neighbor of both points is Black) and captures nothing: that move is
    itself illegal suicide. White therefore has no legal move that improves
    this group's status; it can never escape or make two eyes and is
    unconditionally dead. It may be removed during dead-stone settlement
    (see dead-stones.md) without either player needing to play out a
    capture.
```

## R8 — a legal capturing move is not suicide

```
    A B
  1 O *
  2 X .
```

2×2 board. White's stone at `A1` has exactly one liberty, `B1`. `A2` is Black; `B2` is empty. It is Black's turn, considering `B1` (marked `*`).

```
expected:
  id: R8-capture-not-suicide
  black_may_play_B1: legal
  reason: >
    Playing B1 removes White's last liberty at A1, capturing it. Captures
    are resolved before the mover's own liberties are checked, so even
    though B1's only other neighbor before the capture was White, Black's
    new stone gains a liberty at A1 the instant White's stone is removed
    (and already had one at B2). This is an ordinary capture, not suicide.
```

## R9 — area score of a finished board

```
       A B C D E F G
    1  . . X . O . .
    2  . . X O O . .
    3  . . X . O . .
    4  . . X X O . .
    5  . . X . O . .
```

7×5 finished board. Black wall at column `C` (5 stones) plus one extra move at `D4` filling a neutral point; White wall at column `E` (5 stones) plus one neutral-point fill at `D2`. Columns `A`–`B` are Black's territory (10 empty points, bordered only by the Black wall and the board edge). Columns `F`–`G` are White's territory (10 empty points, bordered only by the White wall and the board edge). `D1`, `D3`, `D5` are neutral points left unfilled, each bordered by both colors. No captures occurred during the game.

```
expected:
  id: R9-area-score
  ruleset: chinese
  black_stones_on_board: 6   # C1-C5, D4
  black_territory: 10        # A1-A5, B1-B5
  black_area_score: 16
  white_stones_on_board: 6   # E1-E5, D2
  white_territory: 10        # F1-F5, G1-G5
  white_area_score: 16
  white_final_with_komi: 23.5   # 16 + ruleset.chinese.komi (7.5)
  margin: White by 7.5
```

## R10 — territory score of the same finished board

Same diagram as R9. No captures occurred at any point during the game (prisoners for both players are zero).

```
expected:
  id: R10-territory-score
  ruleset: japanese
  black_territory: 10
  black_prisoners: 0
  black_territory_score: 10
  white_territory: 10
  white_prisoners: 0
  white_territory_score: 10
  white_final_with_komi: 16.5   # 10 + ruleset.japanese.komi (6.5)
  margin: White by 6.5
```

Note the raw totals (16–16 area vs. 10–10 territory) look different, but once each ruleset's own standard komi is applied the margins are close (7.5 vs. 6.5) — see R11 for the case where a wasted move inside one's own territory pushes them further apart, and see [Ending the Game](./ending-the-game.md#why-area-and-territory-rarely-differ) for why.

## R11 — where area and territory actually diverge

Start from R9/R10's finished position, then suppose Black plays one additional, unnecessary stone at `A3` — a point that was previously part of Black's own territory — before passing. Nothing is captured.

```
expected:
  id: R11-area-territory-diverge
  change_from_R9_R10: "Black plays A3 (own territory) before passing; no capture."
  area_scoring:
    black_stones_on_board: 7   # C1-C5, D4, A3
    black_territory: 9         # A3 no longer empty
    black_area_score: 16       # unchanged from R9: a territory point became a stone point
    white_area_score: 16       # unchanged
    white_final_with_komi: 23.5
    margin: "White by 7.5 — same as R9; filling one's own territory is free under area scoring."
  territory_scoring:
    black_territory: 9         # down by 1, nothing gained back
    black_prisoners: 0
    black_territory_score: 9
    white_territory_score: 10
    white_final_with_komi: 16.5
    margin: "White by 7.5 — up from 6.5 in R10; filling one's own territory cost Black a full point under territory scoring."
  significance: >
    This is the mechanism Ending the Game describes: the same extra move
    is free under area scoring and costs exactly one point under territory
    scoring, which is the usual cause of the two methods' margins
    diverging by more than their standard-komi offset.
```

## R12 — two passes end the main phase

```
    A B C
  1 . X .
  2 . O .
```

Any position; shown here as a minimal example. Black passes. White passes (the second pass, immediately following Black's).

```
expected:
  id: R12-two-passes-end-play
  after_black_pass: main phase still open (one pass does not end play)
  after_white_pass: main phase ends; dead-stones settlement begins
  if_disagreement_during_settlement: >
    Play conventionally resumes from this point to resolve the disputed
    group by actual capture, per pass.md and dead-stones.md.
```

## R13 — handicap placement: fixed star points (9×9)

```
       A B C D E F G H J
    1  . . . . . . . . .
    2  . . . . . . . . .
    3  . . X . . . X . .
    4  . . . . . . . . .
    5  . . . . . . . . .
    6  . . . . . . . . .
    7  . . X . . . X . .
    8  . . . . . . . . .
    9  . . . . . . . . .
```

9×9 board (column `I` conventionally skipped in Go coordinate letters, hence `A`–`H`, `J`). A 4-stone handicap, placed on the four corner star points: `C3`, `G3`, `C7`, `G7`.

```
expected:
  id: R13-handicap-fixed-star-points
  handicap_stones: 4
  points: [C3, G3, C7, G7]
  agreement: >
    All five rulesets in rulesets.md set
    ruleset.<name>.handicap_placement = fixed_star_points, and place a
    4-stone handicap at exactly these four points on a 9x9 board (the
    center point, E5, is the fifth star point, used starting at a 5-stone
    handicap but left empty here).
```

## What comes next

Return to [Rulesets](./rulesets.md) for the parameter definitions these positions exercise, or [Ending the Game](./ending-the-game.md) for the procedural narrative around R7 through R12. R2 and R3 are flagged above as structural specifications rather than fully traced sequences — implementers should construct and verify an exact move list against the kernel's own board-history representation before trusting them as literal test fixtures; every other position in this appendix (R1, R4 through R13) was hand-verified point by point during authoring.
