---
title: Weiqi Rulesets
description: "Audience: readers who already understand territory, komi, and handicap and want to know which named ruleset governs a given club, server, or tournament, and why the differences rarely change who wins."
date-created: 2026-08-18
date-updated: 2026-08-19
type: lesson
authors:
  - claude-fable-5
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/weiqi-overview.md
- /games/topics/board-games/weiqi/curricula/komi-and-handicap.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/territory.md
- /games/topics/board-games/weiqi/terms/komi.md
- /games/topics/board-games/weiqi/terms/handicap.md
- /games/topics/board-games/weiqi/terms/ko.md
- /games/topics/board-games/weiqi/terms/capture.md
teaches:
- Weiqi Rulesets
references:
  britgo2026compare:
    authors:
    - Britgo2026compare
    title: Britgo2026compare
  gokgs2026rulesets:
    authors:
    - Gokgs2026rulesets
    title: Gokgs2026rulesets
  gomagic2026rulesets:
    authors:
    - Gomagic2026rulesets
    title: Gomagic2026rulesets
  wikipedia2026ingrules:
    authors:
    - Wikipedia2026ingrules
    title: Wikipedia2026ingrules
  jasiek2026superko:
    authors:
    - Jasiek2026superko
    title: Jasiek2026superko
  ref1:
    title: British Go Association, Comparison of Some Go Rules
  ref2:
    title: KGS Go Server, Rule Sets
  ref3:
    title: "Go Magic, Go Game Rule Sets: Chinese, Japanese, Korean, AGA and Others"
  ref4:
    title: Wikipedia, Ing Rules
  ref5:
    title: Robert Jasiek, Super Ko
cites:
  - "British Go Association, Comparison of Some Go Rules"
  - "KGS Go Server, Rule Sets"
  - "Go Magic, Go Game Rule Sets: Chinese, Japanese, Korean, AGA and Others"
  - "Wikipedia, Ing Rules"
  - "Robert Jasiek, Super Ko"
---

Audience: readers who already understand [territory](../../../glossary/terms/territory.md), [komi](../../../glossary/terms/komi.md), and [handicap](../../../glossary/terms/handicap.md) and want to know which named ruleset governs a given club, server, or tournament, and why the differences rarely change who wins.

Learning goal: distinguish area scoring from territory scoring, compare standard komi and suicide legality across the Chinese, Japanese, AGA, New Zealand, and Ing rulesets, and explain why a beginner can safely postpone choosing among them.

See also: [Rulesets](./rulesets.md) is this lesson's implementer-facing companion, fixing the same five rulesets' ko-regime, suicide, scoring, komi, and handicap values as stable identifiers for the rules kernel rather than as club-facing prose.

## Worked example: one finished position, two ways of counting it

Picture a finished 9x9 game with no disputes left on the board. Black has a living group enclosing 12 empty points and has played 32 stones over the course of the game that remain on the board. White has a living group enclosing 15 empty points and has 31 stones remaining on the board. Nobody has left a seki, and every dead stone has already been removed by capture.

Counted under **territory rules**: Black's score is territory plus prisoners captured; White's score is territory plus prisoners captured, then White adds komi. Counted under **area rules**: Black's score is territory plus living stones on the board; White's score is territory plus living stones on the board, then White adds komi.

These are different arithmetic procedures, but they almost always produce the same winner by close to the same margin, because every point one player gains by playing an extra stone on the board (which only area scoring rewards directly) is a point the same player did not need to leave as territory (which both methods reward). The British Go Association's own comparison of rule sets puts it plainly: "the result of the two methods is usually the same to within one point" [@britgo2026compare]. That near-equivalence, not any deep philosophical difference between "area" and "territory" as goals, is the main thing to understand before looking at named rulesets.

## Area scoring vs. territory scoring

**Territory scoring** (used by Japanese and Korean rules) counts each player's surrounded empty points plus prisoners captured during the game, and does not otherwise count stones on the board [@britgo2026compare; @gomagic2026rulesets]. Because stones themselves are worth nothing under this method, playing a stone inside your own [territory](../../../glossary/terms/territory.md) without capturing anything turns a counted territory point into an uncounted stone, which is why filling in your own territory late in the game typically costs a point.

**Area scoring** (used by Chinese, AGA, New Zealand, and Ing rules) counts each player's surrounded empty points plus every living stone of that color remaining on the board [@britgo2026compare; @gomagic2026rulesets]. Under area scoring, filling in your own territory does not cost anything, because the stone you added is worth exactly as much as the territory point it replaced. This is the practical difference that matters, not some difference in what counts as "winning."

## Why the two methods almost always agree

Across a full game, both players place roughly the same number of stones, including the neutral endgame points ([dame](../../../glossary/terms/dame.md)) that get filled in near the close of play. Area scoring pays a point for every stone on the board, including those dame-filling moves; territory scoring pays nothing for them. As long as both sides fill roughly equal numbers of dame points, that difference cancels out between the two players, leaving the margin between area and territory results at zero or one point [@britgo2026compare].

The two methods diverge in a few well-known situations rather than randomly:

- **[Seki](../../../glossary/terms/seki.md)** (a mutual standoff where neither side can profitably capture the other). Territory scoring gives no territory and no prisoners to either seki group, since nothing was captured and no space was ever "enclosed" territory. Area scoring still counts each living stone in the seki, so an uneven number of stones on each side of a seki can shift the count by a few points under area rules where it would not move at all under territory rules [@britgo2026compare; @gomagic2026rulesets].
- **Disputed dead stones.** Territory scoring requires the players to agree on which stones are dead before counting, because a stone left on the board uncounted is worth nothing either way. Area scoring lets a disagreement be settled by simply resuming play and capturing the stone, since filling in the extra move costs nothing. This is a procedural difference in how disputes get resolved, not a difference in the game's usual result.

These are corner cases. For an ordinary finished game with no seki and no disputed groups, area and territory scoring will hand the same player the win, usually by the same margin plus or minus a point tied to whichever side passed last.

## The named rulesets

### Japanese rules

Territory scoring; standard even-game komi is 6.5 points [@britgo2026compare; @gomagic2026rulesets]. Suicide (playing a stone with no remaining [liberty](../../../glossary/terms/liberty.md) that captures nothing) is forbidden. Only the simple [ko](../../../glossary/terms/ko.md) rule — no immediate one-move recapture that restores the prior position — is written into the rules; broader repeating whole-board positions have traditionally been ruled "no result," requiring the game to be replayed, rather than resolved by a general superko rule [@britgo2026compare].

### Korean rules

Territory scoring with the same 6.5 standard komi as Japanese rules, and the same general shape of rule set. Korean rules write out a more explicit procedure for repeated whole-board positions than Japanese rules do, but the outcome is the same: if neither player is willing to break the cycle, the game ends in a draw or "no result," not a decided winner [@gomagic2026rulesets].

### Chinese rules

Area scoring; standard even-game komi is 7.5 area points [@britgo2026compare; @gomagic2026rulesets]. Suicide is forbidden. Chinese rules broadly forbid recreating any earlier whole-board position, which functions in practice like a positional superko rule, though the traditional rule text states it more simply than the AGA's formal version [@britgo2026compare; @gokgs2026rulesets].

### AGA rules

The American Go Association rules are area scoring by default, but are written so that territory-style counting, if used instead, is defined to produce the same result [@gomagic2026rulesets]. Standard komi is 7.5. Suicide is forbidden. AGA rules state an explicit **situational superko** rule: a move may not recreate a previous whole-board position with the same player to move next [@britgo2026compare].

### New Zealand rules

Area scoring, essentially Chinese rules with a handful of deliberate changes. The most notable is that a **multi-stone suicide** move — playing a stone that removes the last liberty from a group of two or more stones of your own color, without capturing anything — is legal. New Zealand rules are the rule set most often cited for this, alongside Ing rules [@britgo2026compare; @gokgs2026rulesets]. Standard komi is 7 points [@britgo2026compare; @gomagic2026rulesets]. New Zealand rules were also the first to write down an explicit situational superko rule, switching to it in 1978 after starting with positional superko in 1975 [@jasiek2026superko].

### Ing rules

Area scoring, but counted by a distinctive physical method: each player starts with exactly 180 stones, and after play both players fill their own remaining territory with their leftover stones, so the score can be read directly from how many stones are left over [@wikipedia2026ingrules]. Standard komi is stated as 8 points, but because Black wins any exact tie, the rule is effectively equivalent to a komi of 7.5 [@wikipedia2026ingrules; @gomagic2026rulesets]. Like New Zealand rules, Ing rules permit multi-stone suicide. Rather than a single superko statement, Ing rules distinguish a "fighting ko" from a "disturbing ko" and regulate each with its own timing restrictions [@wikipedia2026ingrules].

## Suicide: forbidden almost everywhere, legal in two rulesets

Playing a single stone onto a point where it would immediately have zero liberties and capture nothing is pointless under any rule set, so single-stone suicide almost never comes up as a live question. The real difference between rulesets is **multi-stone suicide**: a move that removes the last liberty of a larger friendly group without capturing anything. Japanese, Chinese, and AGA rules forbid this outright. New Zealand and Ing rules permit it [@britgo2026compare; @gokgs2026rulesets]. This mostly matters in rare, carefully constructed double-ko and multi-stone capturing race positions; it essentially never comes up in ordinary play, which is one reason many players go years without noticing which side of this rule their games are being played under.

## Ko and [superko](../../../glossary/terms/superko.md), in outline

Every ruleset above starts from the same simple [ko](../../../glossary/terms/ko.md) rule: a player may not immediately recapture a single stone if doing so would recreate the position from just before the opponent's last move. Where the rulesets differ is in how far that principle extends to rarer whole-board repetitions:

- Japanese and Korean rules mostly stop at the simple ko rule and traditionally treat other repeating cycles as an unresolved "no result."
- Chinese rules broadly forbid recreating any prior whole-board position.
- AGA and New Zealand rules state an explicit situational superko rule.
- Ing rules use a separate "fighting ko" versus "disturbing ko" distinction instead of a general superko statement.

This is a summary, not the full account. The mechanics of positional versus situational superko, and the rare board positions that expose the difference, belong to a dedicated lesson on [ko and superko](./ko-and-superko.md).

## What a beginner should actually do about all this

A beginner should pick whichever ruleset their club, teacher, or server already uses and not spend study time comparing rulesets further, for two reasons. First, as shown above, area and territory scoring agree on the winner in the overwhelming majority of finished games; the cases where they diverge (seki, disputed dead stones, rare multi-stone suicide positions) are advanced enough that a beginner is unlikely to produce one, let alone need to adjudicate one. Second, the skills that decide beginner-level games — reading captures, keeping groups alive, building territory — are identical under every ruleset described here. None of these rule sets changes how liberties, captures, or life and death work; they only change how the already-finished board gets turned into a final score.

Most online servers default to Chinese-style area scoring, and this is a practical choice rather than an aesthetic one. Because filling in your own territory costs nothing under area scoring, any disagreement about whether a group is alive or dead can be settled by simply resuming play and capturing it out, instead of requiring the players to negotiate an agreement before the count can happen. That makes area scoring far easier for software to enforce automatically without a human arbiter, which is exactly the situation an online server is in [@gomagic2026rulesets; @gokgs2026rulesets].

## Comparison table

| Ruleset | Scoring style | Standard komi | Suicide | Superko approach |
|---|---|---|---|---|
| Japanese | Territory | 6.5 | Forbidden | Simple ko only; other repetitions traditionally "no result" |
| Korean | Territory | 6.5 | Forbidden | Simple ko; repeated whole-board positions are handled by a more explicitly written procedure than Japan's, but still end in a draw/"no result" if neither side breaks the cycle |
| Chinese | Area | 7.5 | Forbidden | Broad ban on recreating any prior whole-board position (positional-superko-like) |
| AGA | Area (defined to match territory counting) | 7.5 | Forbidden | Explicit situational superko |
| New Zealand | Area | 7 | Legal (multi-stone only) | Explicit situational superko (first ruleset to state one, switching from positional superko in 1978) |
| Ing | Area (counted via stone-filling) | 8, but Black wins ties (effectively 7.5) | Legal (multi-stone only) | "Fighting ko" vs. "disturbing ko" distinction, not a single superko rule |

## Exercises

1. Two players finish a game with no seki and no disputed dead stones. One count is done under Japanese territory rules, the other under Chinese area rules. Why should you expect the same player to win both counts?

<details>
<summary>Answer</summary>

Because area scoring only adds the value of stones on the board on top of territory, and both players place roughly the same number of stones over the course of an ordinary game, including the dame-filling moves near the end. That extra value cancels out between the two players, so the margin between the two counting methods is usually zero or one point, not enough to flip the result outside unusual positions like seki or disputed dead stones.
</details>

2. A group is in seki. Why might a Chinese-rules count and a Japanese-rules count disagree about the score even though neither player captured anything?

<details>
<summary>Answer</summary>

Territory scoring gives no territory and no prisoners for a seki, since nothing was enclosed as territory and nothing was captured. Area scoring still counts every living stone in the seki as a point for its owner. If the two sides of the seki have an unequal number of stones, area scoring will show a different margin than territory scoring, even though the position and the set of living groups are identical under both rule sets.
</details>

3. Why do New Zealand and Ing rules allow multi-stone suicide when Japanese, Chinese, and AGA rules forbid it, and why does this rarely matter in practice?

<details>
<summary>Answer</summary>

New Zealand and Ing rules were written to remove the suicide prohibition as an unnecessary special case rather than because suicide is normally useful; a legal multi-stone suicide move only changes the outcome of a small number of unusual double-ko or capturing-race positions. Because those positions are rare, most games played under any of these five rulesets would end identically whether or not multi-stone suicide were legal.
</details>

4. A beginner asks which ruleset they should learn first. What should they actually do, and why?

<details>
<summary>Answer</summary>

Learn whichever ruleset their club, teacher, or server already uses, and stop worrying about the others. The differences between rulesets are almost entirely about how an already-finished position gets converted into a final score, not about how liberties, captures, or life and death work during play. A beginner's practical skills transfer completely across every ruleset described here.
</details>

## What comes next

Continue with [Ko and Superko](./ko-and-superko.md) for the detailed mechanics behind the summary above, including positional versus situational superko and the rare positions that expose the difference. For the scoring vocabulary this lesson depends on, see [Komi and Handicap](./komi-and-handicap.md) and the local [Terms](../../../glossary/topics/weiqi.md), especially [territory](../../../glossary/terms/territory.md), [komi](../../../glossary/terms/komi.md), and [ko](../../../glossary/terms/ko.md).
