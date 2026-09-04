---
title: Ko and Superko
description: "Audience: readers who already understand the simple ko rule and want to know why long cycles need a stronger rule, and how that stronger rule differs across rulesets."
date-created: 2026-08-18
date-updated: 2026-08-19
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/weiqi-overview.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/ko.md
- /games/topics/board-games/weiqi/terms/superko.md
- /games/topics/board-games/weiqi/terms/capture.md
- /games/topics/board-games/weiqi/terms/liberty.md
teaches:
- Ko and Superko
references:
  britgo2025default:
    authors:
    - Britgo2025default
    title: Britgo2025default
  britgo2026compare:
    authors:
    - Britgo2026compare
    title: Britgo2026compare
  britgo2026agasummary:
    authors:
    - Britgo2026agasummary
    title: Britgo2026agasummary
  jasiek2026superko:
    authors:
    - Jasiek2026superko
    title: Jasiek2026superko
  brouwer2026tripleko:
    authors:
    - Brouwer2026tripleko
    title: Brouwer2026tripleko
  brouwer2026eternallife:
    authors:
    - Brouwer2026eternallife
    title: Brouwer2026eternallife
  kgs2026superko:
    authors:
    - Kgs2026superko
    title: Kgs2026superko
  ref1:
    title: British Go Association, A. Default Rules
  ref2:
    title: British Go Association, Comparison of Some Go Rules
  ref3:
    title: British Go Association, American Go Association Rules - Summary
  ref4:
    title: Robert Jasiek, Super Ko
  ref5:
    title: "A. E. Brouwer, Rules of Go: Triple Ko"
  ref6:
    title: "A. E. Brouwer, Rules of Go: Eternal Life"
  ref7:
    title: KGS, Superko in KGS Computer Go Tournaments
type: lesson
authors:
  - claude-fable-5
cites:
  - "British Go Association, A. Default Rules"
  - "British Go Association, Comparison of Some Go Rules"
  - "British Go Association, American Go Association Rules - Summary"
  - "Robert Jasiek, Super Ko"
  - "A. E. Brouwer, Rules of Go: Triple Ko"
  - "A. E. Brouwer, Rules of Go: Eternal Life"
  - "KGS, Superko in KGS Computer Go Tournaments"
---

Audience: readers who already understand the simple ko rule and want to know why long cycles need a stronger rule, and how that stronger rule differs across rulesets.

Learning goal: explain why simple ko is not enough to stop every repeating position, define positional and situational superko, and know which rulesets use which.

## Worked example: a cycle simple ko cannot see

Imagine three separate, interlocking ko fights on the board at once — call them ko A, ko B, and ko C. Black captures ko A. White, unable to retake ko A immediately, captures ko B instead. Black, unable to retake ko B immediately, captures ko C. White, unable to retake ko C immediately, retakes ko A — which is legal now, because ko A's capture happened three of White's moves ago, not one. Black then retakes ko B, and White then retakes ko C. After these six plies, the whole board is back to exactly the position it held before Black's first capture, and it is Black's turn again, exactly as it was then.

The [simple ko rule](../../../../glossary/terms/ko.md) never objected once during this sequence, because at every step the move in question recreated a position from several moves back, not the position from immediately before the opponent's last capture [@britgo2025default]. Nothing in simple ko stops the six of them from repeating this loop forever. This is a **triple ko**, and it is the clearest illustration of why weiqi rulesets need something stronger than simple ko.

## Simple ko: a quick recap

The [simple ko rule](../../../../glossary/terms/ko.md) forbids exactly one move: the immediate recapture that would recreate the board position exactly as it stood just before the opponent's last capture [@britgo2025default]. If White captures a single Black stone in a ko, Black cannot retake it on the very next move, because doing so would restore the position from one move-pair earlier. Black must play a [ko threat](../../../../glossary/terms/ko.md) elsewhere first, giving White a chance to respond or to connect the ko, before Black can try to retake it.

That rule is deliberately narrow. It looks exactly one move-pair into the past and no further. For an ordinary single ko, that is all that is needed — the only way to recreate the forbidden position quickly is the one banned recapture. But narrowness is also its limit.

## Why simple ko is not enough

Simple ko's one-move lookback cannot see a cycle whose period is longer than one move-pair. The triple ko above has a period of three move-pairs (six plies): the position that recurs was last seen three of the mover's own turns ago, not one, so the rule's test never triggers. The same blind spot applies to two other named patterns:

- **Eternal life** (chosei), a rotating capture-and-recapture pattern, often four to six plies long, in which players repeatedly sacrifice stones as ko threats and the position cycles back to an earlier state without either side gaining ground [@brouwer2026eternallife].
- **Sending-two-returning-one**, a shape (most often along an edge) where a player can sacrifice two stones and recapture only one, resetting the local position while technically making a different move each time, which lets the position on the whole board recur even though no single move looks like a repeat [@britgo2026compare].

All three patterns share the same structure: a position from earlier in the game recurs, but not from one move ago, so a rule that only checks one move back cannot stop it. Left unresolved, any of them can repeat without end, and the game cannot reach a score.

## Positional superko vs situational superko

Superko rules close this gap by checking a candidate move against the *entire history* of positions in the game, not just the immediately previous one. Two variants are in common use, and the difference is in exactly what counts as "the same position" [@jasiek2026superko]:

- **Positional superko**: illegal to play a move that would recreate any whole-board position that has occurred at any earlier point in the game — the stones on the board must never repeat, independent of whose turn it is to move.
- **Situational superko**: illegal to play a move that would recreate a position that occurred earlier in the game *with the same player to move next*. If the identical stone arrangement occurred before but it was the other player's turn, replaying it is legal.

Applied to the triple ko above, both variants agree: the position White or Black would be recreating at ply six is identical in stone arrangement *and* in whose turn is next (the cycle's period is even, so the same player is always to move at the recurrence), so both positional and situational superko forbid the repeating move and force one side to break the cycle by playing elsewhere. Cases that actually distinguish the two variants — where the arrangement of stones repeats but with the opposite player to move — exist but are rare enough in practice that Jasiek's comparative study of the two finds "the actual difference... as to occurring positions is rather small" [@jasiek2026superko]. The variants matter more for how a rule is *written and proven correct* than for how often they produce different outcomes at the board.

## Which rulesets use which

| Ruleset | Approach to long cycles |
|---|---|
| AGA (American Go Association) | Explicit situational superko: a move may not recreate a board position from earlier in the game with the same player to move [@britgo2026agasummary]. |
| New Zealand | Adopted positional superko in 1975, closely modeled on the Taiwanese (Ing) rule text, then switched to situational superko in 1978 [@jasiek2026superko]. It is often grouped with the positional-flavored rulesets because of that shared textual lineage even in its current situational form. |
| Ing (Taiwan) | Does not state a single blanket superko clause. Instead it separates "fighting kos" from "disturbing kos" and restricts repetition of position within each category on positional grounds — same board content, not same player to move — which gives it a positional flavor without adopting positional superko as one general rule [@jasiek2026superko]. |
| Chinese | The written rule (1988) states a positional-style prohibition on repeating any board position [@jasiek2026superko]. In tournament practice, however, complicated repetitions such as triple ko are often simply ruled void rather than resolved by that clause, and many Chinese tournaments prohibit the sending-two-returning-one shape outright rather than leaning on superko to police it [@britgo2026compare]. |
| Japanese | Does not generalize ko into a superko rule at all. The ko rule covers only the ordinary single-stone case. When a longer cycle such as triple ko or eternal life arises and neither player will give way, the game is declared "no result" (or void) and is normally replayed [@britgo2026compare; @brouwer2026tripleko; @brouwer2026eternallife]. |

The pattern across all five: everyone agrees simple ko is insufficient, but they disagree on the fix. AGA and (currently) New Zealand write a superko clause into the rules and let it silently absorb triple ko, eternal life, and sending-two-returning-one as special cases of one general principle. Chinese rules write a similar clause but often fall back on Japanese-style voiding in practice. Japanese rules never generalize the clause at all, treating every long cycle as an exceptional outcome for the tournament director rather than an illegal move for the rules engine to reject.

## What this means in practice for online play

A server that only labels its ruleset "Japanese," "Chinese," or "AGA" has not actually told a player (or a rules engine) what happens the one time in a thousand games that a long cycle appears — that behavior depends on which superko variant, if any, sits underneath the named ruleset. This is not a hypothetical concern: in KGS's computer Go tournaments, the server enforced positional superko strictly, and the report on that period found several games where a program's intended move was illegal only under positional superko and would have been permitted under situational or natural situational superko — in a few cases deciding the outcome when a program, unable to find a legal alternative, timed out or played badly instead [@kgs2026superko]. Positional superko is also the stricter of the two common variants: it forbids some positions that situational superko would allow, since it does not exempt a repeat where the player to move differs.

For a human game between casual players, the choice of superko variant almost never matters — long cycles are uncommon, and the two variants virtually never diverge on the position actually reached. It matters for exactly the audiences this distinction was built for: rules engines and tournament software that must decide, without a human referee in the room, whether a candidate move is legal; and any platform serving multiple named rulesets, which has to pick a concrete superko variant (or none, plus a no-result path) for each one rather than leaving it implicit.

## Exercises

1. Why does the simple ko rule fail to stop a triple ko, even though it reliably stops an ordinary single ko?

<details>
<summary>Answer</summary>

Simple ko only forbids recreating the position from exactly one move-pair ago. A triple ko's repeating position last occurred three move-pairs earlier, well outside that one-move lookback, so the rule's test never triggers even though the same position keeps recurring.
</details>

2. A move would recreate a board position that occurred earlier in the game, but the player to move next is the opposite of who was to move next at that earlier occurrence. Is the move legal under positional superko? Under situational superko?

<details>
<summary>Answer</summary>

Illegal under positional superko, which bans any recurrence of the whole-board arrangement regardless of whose turn it is. Legal under situational superko, which only bans a recurrence when the same player is to move next — here the player to move is different, so situational superko does not object.
</details>

3. Under Japanese rules, what happens if a triple ko appears and neither player is willing to break the cycle?

<details>
<summary>Answer</summary>

The game is declared "no result" (void) rather than decided, and is typically replayed, since Japanese rules do not generalize the ko rule into a superko clause that would forbid the repeating move outright.
</details>

## What comes next

For the underlying vocabulary, see [ko](../../../../glossary/terms/ko.md) and [superko](../../../../glossary/terms/superko.md) in the glossary, along with [capture](../../../../glossary/terms/capture.md) and [liberty](../../../../glossary/terms/liberty.md). For how the same superko question fits alongside scoring style, standard komi, and suicide across named rulesets, see [Weiqi Rulesets](../tutorials/weiqi-rulesets.md). For the broader structural picture that ko and superko sit inside, continue with [Living Groups and Eyes](../tutorials/living-groups-and-eyes.md). For how rulesets diverge on scoring rather than repetition, see [Komi and Handicap](../tutorials/komi-and-handicap.md).
