---
title: Ending the Game
description: "Audience: readers who have played a few games of weiqi and are still unsure how a game actually ends, and why."
date-created: 2026-08-18
date-updated: 2026-08-19
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/weiqi-overview.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/pass.md
- /games/topics/board-games/weiqi/terms/dame.md
- /games/topics/board-games/weiqi/terms/territory.md
- /games/topics/board-games/weiqi/terms/life-and-death.md
- /games/topics/board-games/weiqi/terms/komi.md
- /games/topics/board-games/weiqi/terms/seki.md
- /games/topics/board-games/weiqi/terms/area-scoring.md
- /games/topics/board-games/weiqi/terms/territory-scoring.md
references:
  britgo2026howtoplaygo:
    authors:
    - Britgo2026howtoplaygo
    title: Britgo2026howtoplaygo
  britgo2025default:
    authors:
    - Britgo2025default
    title: Britgo2025default
  britgoagaexplain2026:
    authors:
    - Britgoagaexplain2026
    title: Britgoagaexplain2026
  swissgo2026japaneserules:
    authors:
    - Swissgo2026japaneserules
    title: Swissgo2026japaneserules
  polgote2026rules:
    authors:
    - Polgote2026rules
    title: Polgote2026rules
  ogs2026playinggames:
    authors:
    - Ogs2026playinggames
    title: Ogs2026playinggames
  ref1:
    title: British Go Association, How to Play Go
  ref2:
    title: British Go Association, A. Default Rules
  ref3:
    title: British Go Association, American Go Association Rules - Explanation
  ref4:
    title: Swiss Go Association, The Japanese Rules of Go
  ref5:
    title: "Polgote, Go Rules: Japanese vs Chinese"
  ref6:
    title: "Online Go Server (OGS), Playing Games"
teaches:
- Ending the Game
type: lesson
authors:
  - claude-fable-5
cites:
  - "British Go Association, How to Play Go"
  - "British Go Association, A. Default Rules"
  - "British Go Association, American Go Association Rules - Explanation"
  - "Swiss Go Association, The Japanese Rules of Go"
  - "Polgote, Go Rules: Japanese vs Chinese"
  - "Online Go Server (OGS), Playing Games"
---

Audience: readers who have played a few games of weiqi and are still unsure how a game actually ends, and why.

Learning goal: explain what a [pass](../../../glossary/terms/pass.md) actually does, how players agree on dead stones, [dame](../../../glossary/terms/dame.md), and [seki](../../../glossary/terms/seki.md) during the settlement phase, what happens when they disagree, how online servers automate the whole process, and why area and territory scoring almost always agree once settlement is done.

## Worked example: settling a disagreement under area scoring

Two players finish a 13x13 game under Chinese-style area rules. The board looks essentially decided: both sides have secured their frameworks, and neither has a move left that would gain more than it loses. Black passes. White passes. By the basic rule, two consecutive passes end the game and move both players into settlement, where they try to agree on which remaining groups are dead [@britgo2026howtoplaygo].

Here the disagreement shows up. White points at three Black stones sitting alone in the lower-left corner and calls them dead — surrounded, with no room to make two eyes. Black disagrees, convinced there is a hidden liberty that lets the group survive. Neither player has to win the argument. Because area scoring counts every living stone on the board plus enclosed territory, and does not charge either player extra for the stones needed to prove a point, they simply resume play: White plays into the corner to actually capture the group, and Black defends it as if the game had never stopped. Within a handful of moves the position answers its own question — either Black finds the second eye the group needed, or White finishes the capture — and the score reflects exactly what happened on the board, not what either player claimed [@polgote2026rules].

This is the moment that confuses almost every new player at some point: the game does not have a referee, a buzzer, or a rulebook check that fires automatically. "The game is over" is a claim two players make about the board, tested by passing, and if the claim does not survive the test, the players simply keep playing until it does. Understanding that passing is a claim, not a switch, resolves most of the confusion about when and why a game of weiqi ends.

## Passing signals "nothing here is worth a move"

A [pass](../../../glossary/terms/pass.md) is a player declining to place a stone on their turn. It is not a special move with its own effect on the board — it places nothing, so it is always legal, and it can never be blocked by the [ko](../../../glossary/terms/ko.md) rule or any other placement restriction, even while a ko fight is still open elsewhere on the board. It is, instead, a statement that, in the passing player's judgment, no move remains that would improve their position. Two consecutive passes — one from each player, in immediate succession — trigger the end of ordinary play and move both players into settlement [@britgo2026howtoplaygo].

New players sometimes pass reflexively when they run out of obvious ideas, without checking whether any [dame](../../../glossary/terms/dame.md) remain unfilled or whether a marginal group is actually settled. Under scoring systems where filling dame is worth a point, an early pass can quietly hand that point to the opponent. Under scoring systems where dame are worth nothing either way, an early pass costs nothing but can still trigger settlement before a player intended it to, which is its own common surprise.

## The settlement phase: agreeing on dead stones

Once both passes land, the players do not immediately get a final score. They first attempt to agree on the status of every group still on the board: which stones are unquestionably alive, which are unquestionably dead, and which points are dame that belong to neither side [@britgo2026howtoplaygo]. Stones both players agree are dead — hopeless strings that could not escape capture if play continued — are lifted off the board as prisoners without needing to be captured move by move. This is what makes settlement fast in the ordinary case: most games end with only one or two groups worth discussing, and the rest of the board is obvious to both players.

A group can also end up in a third state that is neither dead nor simply alive-and-settled: if two groups of opposite color are left sharing liberties that neither side can fill without immediately losing the resulting capturing race, the group is in [seki](../../../glossary/terms/seki.md) — alive, but never awarded to either player as territory, under any ruleset. Seki stones are never removed during settlement; they simply stay on the board, unclaimed, for the rest of the game.

Settlement is an agreement, not a vote or a rule check. If both players agree a group is dead, it is treated as dead even though it was never actually captured. This is convenient, but it is also exactly the point where disagreement can surface.

## When players disagree: play it out

If the players cannot agree on a group's status, the rules do not ask them to argue further. They resume play. Under the AGA-style default rules that many Western clubs use, the opponent of whichever player passed last gets the next move, and the disputed group is fought out on the board exactly as in the worked example above. The game is over for real once the players reach agreement, or once both pass twice again in succession — at which point any stones still standing are simply ruled alive, disagreement or not [@britgo2025default].

Area scoring, described above, makes this resumption nearly free: every stone played toward proving a group dead or alive is still worth its normal value, so nothing is lost by actually playing out the fight [@britgoagaexplain2026]. This is also why Chinese-style area rules are often described as friendlier for beginners — there is less pressure to argue a disputed group correctly, because playing it out costs nothing extra.

### Japanese resumption rules, briefly

Classical Japanese rules handle the same problem with their own, stricter mechanism. Because territory scoring charges a player a point for playing an unnecessary stone inside their own territory, resuming play is not free the way it is under area scoring, so the rules are more careful about when a stopped game can be reopened. In the 1989 Japanese rules text, a player may request that a stopped game resume, and the opponent is obliged to allow it; the position is then played out and, once both sides again agree to stop, returned to what it would have been had the dispute never happened before the prisoners are counted [@swissgo2026japaneserules]. The text is also notably strict about bad-faith resumption: if a player later finds a move that would have gained something but the two players cannot agree whether the game should have already ended, the rules can rule that both players lose the game outright [@swissgo2026japaneserules]. Beginners rarely need this level of detail, but it explains why players coming from Japanese rules tend to be far more careful about exactly when they pass than players coming from area scoring.

## How online servers automate settlement

Go servers cannot rely on two people talking through a disagreement the way club players do, so they build the settlement phase directly into the interface. On the Online Go Server (OGS), for example, both passes move the game into a stone-removal phase: an automatic score estimator suggests which stones are dead, and each player can click stones to toggle them dead or alive and mark dame directly on the board [@ogs2026playinggames]. The automated suggestion is explicitly not meant to be trusted blindly — it is a starting point, not a ruling. Once both players accept the same result, the game locks in permanently; if they do not agree, either player can choose to cancel the settlement and resume play, which is the software version of the same resumption rule described above [@ogs2026playinggames]. Other servers vary in interface but follow the same shape: propose a settlement, let both sides correct it, and fall back to actual play when they cannot agree.

## Scoring the same board two ways

Once settlement is done — every group's status agreed or fought out, every dead stone removed — the game still needs to be turned into a final score, and the world's rulesets do this one of two ways. [Area scoring](../../../glossary/terms/area-scoring.md) counts a player's living stones on the board plus that player's enclosed territory; it is what Chinese, AGA, New Zealand, and Ing rules use, and it is what the worked example at the top of this lesson assumed. [Territory scoring](../../../glossary/terms/territory-scoring.md), used by Japanese rules, counts only a player's enclosed territory plus the prisoners captured from the opponent during play — stones sitting on the board earn no points of their own. The two methods count different things, but on a finished board where no captures happened during play, they tend to land on nearly the same margin between the players, once each ruleset's own standard [komi](../../../glossary/terms/komi.md) is applied [@britgo2025default] — see the worked arithmetic in the [regression positions appendix](./regression-positions.md), which scores one small finished board both ways side by side.

## Why area and territory rarely differ

The two methods agree so often because of a simple accounting identity: for a finished position with no captures during play, a player's area score equals that player's territory score plus the number of that player's own stones sitting on the board. Since neither method credits a shared, neutral dame point to either side, the only way the two totals can diverge is if a player places a stone somewhere that changes one count without changing the other — concretely, by playing inside their own territory.

Playing inside your own territory is free under area scoring: the point simply stops being territory and starts being a stone, and the total stays the same. The identical move costs a full point under territory scoring, because the point stops being territory and nothing is gained to replace it. This is also why the two families of rules use slightly different standard komi values for what is meant to be a fair even game: because Black moves first, a finished game very often ends with Black having placed one more living stone than White, and area scoring credits that stone directly where territory scoring does not, so area-scoring rulesets typically set komi a point higher than territory-scoring rulesets covering the same game, exactly to offset this effect [@britgo2025default]. Where the two methods still differ by more than that fixed offset, the cause is nearly always a player filling their own territory unnecessarily, or a [seki](../../../glossary/terms/seki.md) whose shared points the two methods treat identically but whose surrounding stones were counted differently along the way.

## Exercises

1. A player passes on move 140, then immediately regrets it because a large dame point is still open. Under area scoring, what does that pass cost them, and why would the same pass cost nothing under most forms of territory scoring?

<details>
<summary>Answer</summary>

Under area scoring, every stone on the board counts toward the final score, so leaving a fillable dame for the opponent to take is a real, one-point loss. Under territory scoring, dame are not counted at all — filling them establishes boundaries but does not add to either player's score — so passing before they are filled changes nothing about the count, even though it may still trigger settlement earlier than the player wanted.
</details>

2. Two players pass, then disagree about whether a five-stone group in the corner is dead. Under the AGA-style default rules, who gets to move first when play resumes, and what ends the game for good this time?

<details>
<summary>Answer</summary>

The opponent of whichever player passed last gets the next move. The game ends for good either when the players reach agreement on the group's status, or when both players pass twice again in succession, at which point any stones still on the board are simply ruled alive.
</details>

3. Why does an online server's "auto-score" or score-estimator button need a human override, instead of just deciding the game automatically?

<details>
<summary>Answer</summary>

Automated estimators are good at obvious cases but can misjudge close life-and-death situations, seki, or unusual dame configurations. Because the final result is often locked in permanently once accepted, servers let players correct the estimate — or cancel and resume play entirely — rather than trusting the automation to settle a genuinely disputed group.
</details>

4. Why doesn't a pass ever violate the ko rule, no matter what ko fights are active on the board?

<details>
<summary>Answer</summary>

Because a pass places no stone and changes nothing about the board. The ko rule only restricts moves that would recreate a previous position; a pass cannot recreate anything, since it alters nothing.
</details>

5. A player fills one point of their own already-secure territory late in the game, capturing nothing. What happens to that player's score under area scoring, and under territory scoring?

<details>
<summary>Answer</summary>

Under area scoring the score is unchanged: the point simply converts from a territory point to a stone point, and both count the same. Under territory scoring the score drops by one point: the point stops counting as territory and nothing is gained in its place, since no capture occurred.
</details>

## What comes next

The next useful step is [Komi and Handicap](./komi-and-handicap.md), which explains what happens to the score that settlement produces here, or [Rulesets](./rulesets.md), which fixes exact komi, ko-regime, suicide, scoring, and handicap parameters for Chinese, Japanese, AGA, New Zealand, and Ing play, and the [regression positions appendix](./regression-positions.md), which works through small labeled positions — including both scoring methods — as concrete test cases. For the underlying vocabulary, continue with [Terms](../../../glossary/topics/weiqi.md), especially [pass](../../../glossary/terms/pass.md), [dame](../../../glossary/terms/dame.md), [territory](../../../glossary/terms/territory.md), [life and death](../../../glossary/terms/life-and-death.md), [seki](../../../glossary/terms/seki.md), [area scoring](../../../glossary/terms/area-scoring.md), and [territory scoring](../../../glossary/terms/territory-scoring.md).
