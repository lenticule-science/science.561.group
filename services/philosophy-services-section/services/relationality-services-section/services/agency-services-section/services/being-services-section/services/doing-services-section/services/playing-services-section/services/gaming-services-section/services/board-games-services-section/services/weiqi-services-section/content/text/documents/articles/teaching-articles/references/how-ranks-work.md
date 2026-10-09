---
title: How Ranks Work
description: "Audience: readers who have played a number of games and want to understand what their kyu or dan rank actually measures, how it relates to handicap stones, why it differs between organizations and servers, and what to realistically expect as their own rank moves."
date-created: 2026-08-18
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/weiqi-overview.md
- /games/topics/board-games/weiqi/curricula/komi-and-handicap.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/handicap.md
- /games/topics/board-games/weiqi/terms/komi.md
teaches:
- How Ranks Work
date-updated: 2026-08-19
type: lesson
authors:
  - claude-fable-5
cites:
  - "British Go Association, Ratings, Grades and Handicaps"
  - "British Go Association, Ratings and Grades FAQ"
  - "Wikipedia, Go ranks and ratings"
  - "Sensei's Library, Rank - worldwide comparison"
  - "Wikipedia, Glicko rating system"
  - "Online Go Server Announcements, OGS has a new Glicko-2 based rating system! (2017)"
  - "KGS Go Server, Rating System"
  - "Life In 19x19 forum, Level on FOX server compared to others"
  - Britgo2026rating
  - Britgo2026krfaq
  - Wikipedia2026goranks
  - Senseislibrary2026rankcomparison
  - Wikipedia2026glicko
  - Ogs2017glicko2
  - Kgs2026rank
  - Lifein19x192026fox
---

Audience: readers who have played a number of games and want to understand what their kyu or dan rank actually measures, how it relates to handicap stones, why it differs between organizations and servers, and what to realistically expect as their own rank moves.

Learning goal: read a kyu/dan rank correctly, convert a rank gap into a handicap, explain why the same numeral means different things on different servers and in different countries, and know what normal rank progress looks like so early plateaus and losses stop feeling like evidence of failure.

## Worked example: two ranks, one number, three different meanings

A player's profile says "7 kyu." On its own that string tells you almost nothing portable. It tells you, roughly, how many stones that player would need from a much stronger opponent, and roughly how many stones they would give a much weaker one [@britgo2026rating]. It does not tell you how that player would fare against a 7 kyu on a different server, in a different country, or under a different organization's grading, because kyu and dan numbers are calibrated locally, not globally [@wikipedia2026goranks; @senseislibrary2026rankcomparison]. And if the "7 kyu" comes from an account with only a handful of games played, it may not even be a settled estimate of that player's own strength yet, only a provisional guess the rating system is still correcting [@kgs2026rank; @ogs2017glicko2]. All three of those facts are true about the same rank at once. This lesson takes them one at a time.

## The kyu/dan ladder

Weiqi ranks run in two connected but oppositely-ordered stretches. Beginners start somewhere in the 20s or 30s kyu (the exact starting point is a convention, not a law: the British Go Association's grading starts novices around 35 kyu) and improve by counting the kyu number *down* toward 1 kyu [@britgo2026rating; @wikipedia2026goranks]. Once a player is stronger than 1 kyu, the ladder switches direction: they become 1 dan and then count *up* through the amateur dan ranks, which run to 7 dan in most organizations and as high as 9 dan in a few [@wikipedia2026goranks; @britgo2026rating]. So the full amateur ladder, from weakest to strongest, reads roughly: 30 kyu, 29 kyu, ... 2 kyu, 1 kyu, 1 dan, 2 dan, ... 7 dan. There is no "0 dan" or "0 kyu" step; the ladder crosses directly from 1 kyu to 1 dan.

Professional dan ranks are a separate track, not a continuation of the amateur one. Professional 1 dan through 9 dan are awarded by national professional associations (in Japan, Korea, and China) based on tournament results and promotion examinations, and they are graded far more finely than amateur ranks: a professional 1 dan plays at roughly the level of a strong amateur 7 dan, and the entire spread from professional 1 dan to professional 9 dan corresponds to no more than two or three handicap stones of real strength difference [@britgo2026rating; @wikipedia2026goranks]. Treating "9 dan" as one uniform unit of strength across the amateur and professional tracks is the single most common misreading of the system: an amateur 9 dan and a professional 9 dan are not the same rank wearing the same label, and even within the professional track, the top ranks compress toward a narrow band of genuinely elite play rather than spreading out the way amateur kyu ranks do.

## Rank differences and handicap stones

Within a single organization's amateur ladder, the practical payoff of a rank is this: the number of handicap stones a weaker player takes from a stronger one is simply the size of the rank gap between them, counted in full grades, whether those grades are both kyu, both dan, or span the kyu-to-dan boundary [@britgo2026rating; @wikipedia2026goranks]. A few worked conversions:

| Stronger player | Weaker player | Rank gap | Handicap stones |
|---|---|---|---|
| 3 kyu | 7 kyu | 4 | 4 |
| 5 kyu | 2 kyu | 3 | 3 |
| 4 dan | 1 dan | 3 | 3 |
| 4 dan | 4 kyu | 8 | 7 (capped near 9; see below) |

When the gap is exactly one grade, the usual convention is not to add a stone at all: the weaker player simply takes Black, which already carries the first-move advantage that komi would otherwise cancel [@britgo2026rating]. This one-stone-equals-no-extra-stone convention is why handicap tables typically start at two stones rather than one.

This rule of thumb holds reliably across single-digit kyu ranks and amateur dan ranks, which is exactly the range most players spend their time in [@wikipedia2026goranks]. It stops holding at the professional level, where, as noted above, a full eight-grade gap from professional 1 dan to professional 9 dan corresponds to only two or three stones of real strength, not eight [@wikipedia2026goranks; @senseislibrary2026rankcomparison]. Fixed handicap placement also has a practical ceiling: traditional board setups do not go past nine stones, so a rank gap larger than nine is not fully absorbed by stones alone. For the placement order itself and how komi changes in a handicap game, see [Handicap Placement and Komi Values](./handicap-placement-and-komi-values.md).

## Why the same number means different things in different places

Rank inflation and deflation is not a rumor players spread to feel better about losing; it is a documented, structural feature of how each organization sets its own promotion bar. A player who is judged 2nd kyu in one country may be judged only 5th kyu in another, purely because of how each system calibrates promotions, not because the player's actual skill changed when they crossed a border [@wikipedia2026goranks].

A few of the largest, best-documented gaps:

- **AGA (American Go Association).** The AGA's system is built on numerical ratings first; kyu/dan labels are a derived, informal translation layered on top, and the AGA does not issue amateur ranks above 7 dan [@senseislibrary2026rankcomparison]. Because AGA promotion at the kyu and low-dan levels is comparatively strict, AGA ranks in that range tend to run stronger-than-the-label, relative to more lenient systems [@wikipedia2026goranks].
- **EGF (European Go Federation).** The EGF also runs an explicit Elo-style rating underneath its ranks, but methodology and promotion practice vary noticeably between European national federations, so even "EGF rank" is not perfectly uniform across Europe [@senseislibrary2026rankcomparison].
- **Japanese and Korean associations (Nihon Ki-in, Hanguk Kiwon, and equivalents).** These are the oldest continuously operating grading bodies and issue both amateur and the professional dan ranks described above. Their amateur grading conventions predate the rating-system era and were set independently of AGA or EGF calibration, which is part of why cross-comparisons need an explicit conversion rather than a direct numeral match [@wikipedia2026goranks; @britgo2026rating].

None of this means rank is meaningless. Within one organization, on one ladder, the handicap correspondence above holds well. The caution is narrower and more specific: never assume a rank earned on one ladder transfers unchanged to another without checking how that other ladder is calibrated.

## Online servers: rank is relative to that server's own pool

Online servers add a further wrinkle. A server rank is a statement about where you sit inside that specific server's population of active players, not a portable statement about your strength on any absolute scale [@senseislibrary2026rankcomparison].

- **KGS** computes a player's rank by scanning the ranked games that player has played in roughly the last 180 days and deriving a rank from those results; a new account's rank displays with a "?" until it has accumulated wins against solidly-ranked opponents and losses against solidly-ranked opponents in both directions, at which point the provisional mark is dropped [@kgs2026rank]. KGS's own professional ranks are explicitly on a different scale from KGS's amateur kyu/dan ladder, which the server documents itself; KGS does not compute those pro ranks from game results at all, but simply displays the rank a player was already awarded by an outside professional Go organization such as the Nihon Ki-in or Hanguk Kiwon [@kgs2026rank].
- **Fox** is informally reported by players who hold ranks on both servers to run noticeably weaker at the same numeral than KGS, on the order of a couple of ranks [@lifein19x192026fox]. This kind of cross-server comparison is necessarily informal, built from players' lived experience of moving between servers rather than from a shared calibration, which is itself the point: there is no authority reconciling Fox's ladder against KGS's.
- **OGS (Online-Go.com)** moved to a Glicko-2 based rating system in 2017; ranks shown to players are derived from the underlying rating rather than being the primary number [@ogs2017glicko2]. Because OGS's rank is a function of its own rating pool, it is calibrated to OGS's own players, not to KGS, Fox, or any offline federation.

The practical upshot: comparing your rank across two servers, or between a server and an in-person club's grading, is a rough translation exercise, not a lookup. Treat any such comparison as an estimate good to a stone or two, not an exact equivalence.

## How modern servers actually derive your rank

Older systems, including the original Elo rating system built for chess, track a single number per player: a point estimate of strength that moves up after wins and down after losses, with the size of the move set by a fixed constant. That single number carries no explicit statement of how confident the system is in it.

The Glicko and Glicko-2 rating systems, which are public-domain and widely used on game servers including Online-Go.com, add exactly that missing confidence measure: a ratings deviation (RD), which behaves like a standard deviation around the point rating [@wikipedia2026glicko]. A newly created, unrated account starts with maximum uncertainty, typically an RD around 350, which shrinks as the account accumulates games against opponents whose own ratings are already well established [@wikipedia2026glicko; @ogs2017glicko2]. Glicko-2 goes one step further and also tracks a volatility term, which captures how erratically a player's results are moving, separately from the plain rating and its uncertainty [@wikipedia2026glicko].

This matters concretely for a beginner because servers use that uncertainty measure operationally, not just for display. OGS, for example, does not offer handicap games by default to players whose deviation is still high, precisely because a rank with a wide uncertainty band is not yet a reliable basis for setting a fair handicap [@ogs2017glicko2]. A "?" next to a KGS rank is the same idea expressed differently: the system is telling you, explicitly, that the number attached to your account is not yet a settled estimate [@kgs2026rank].

## What a beginner should actually expect

Put the last two sections together and a specific, reassuring picture falls out.

**Expect a fast early climb that is partly an artifact of the rating math, not proof of rapid skill gain.** While your account's uncertainty (RD) is still high, each game moves your rating a large amount, because the system is still resolving a wide range of plausible strength down to a narrower one [@wikipedia2026glicko; @ogs2017glicko2]. A brand-new player often shoots through several kyu ranks in their first weeks. That speed is real information resolving quickly, not a sign you are exceptionally talented, and it is expected to slow down.

**Expect plateaus, and do not read a plateau as failure.** As your uncertainty shrinks, each individual game result moves your rating less, by design [@wikipedia2026glicko]. Spending weeks or months at the same rank while you absorb harder material (life and death reading, whole-board judgment) is the system behaving exactly as intended: it has converged on a good estimate of your current strength, and moving that estimate now requires more accumulated evidence, not less effort from you.

**Expect to lose close to half your games once your rank is settled, and treat that as the healthy state, not a warning sign.** Rating and matchmaking systems are built on one principle: in an even game between two players of genuinely equal strength, each has a 50% chance of winning [@britgo2026krfaq]. Because ranked matchmaking tries to pair you against opponents near your own rank, a correctly calibrated rank should produce a win rate close to 50% against that pool, not close to 100% [@britgo2026krfaq]. If you are winning far more than half your games, your rank has not yet caught up with your actual strength and will rise; if you are losing far more than half, the reverse is true. A near-even record is not evidence you have stopped improving. It is evidence the number next to your name is currently accurate, which is the entire point of having one.

## Exercises

1. A player is 6 kyu and wants a handicap game against a friend who is 2 dan. How many handicap stones should the weaker player take?

<details>
<summary>Answer</summary>

The ladder runs ...4 kyu, 3 kyu, 2 kyu, 1 kyu, 1 dan, 2 dan. From 6 kyu to 1 kyu is 5 grades, and from 1 kyu to 2 dan is 2 more grades (1 kyu to 1 dan, then 1 dan to 2 dan), for a total gap of 7 grades. The weaker player takes 7 handicap stones.
</details>

2. A player holds a "5 kyu" account on one server and a "5 kyu" account on a different server, and loses most of their games when they use the second account against players who were also 5 kyu there. Does this mean the player's strength has gotten worse?

<details>
<summary>Answer</summary>

Not necessarily. Ranks are calibrated to each server's own player pool, and different servers are documented to run their ladders at different overall strengths (Fox running informally weaker than KGS at the same numeral is one concrete example). A rank that transfers unchanged in label can still sit at a different real strength on a different server, so a losing record right after switching servers is often a calibration gap, not a skill decline, until enough games let that account's own rating settle.
</details>

3. After ten games on a brand-new account, a player's rank has already moved by six grades, and then over the next two hundred games it moves by only two more. Is something wrong with the rating system?

<details>
<summary>Answer</summary>

No. A new account starts with maximum rating uncertainty, so early games move the estimate a large amount as the system narrows down a wide range of plausible strength. As uncertainty shrinks with more games against well-established opponents, each additional result carries less new information and moves the rating less. Fast early movement followed by a slow, plateauing rate of change is exactly how an uncertainty-tracking rating system (Glicko/Glicko-2) is supposed to behave, not a sign of malfunction.
</details>

4. A player has stopped improving quickly and is now winning about half of their ranked games. Should they be discouraged?

<details>
<summary>Answer</summary>

No. A correctly calibrated rank, matched against opponents near that same rank, is expected to produce a win rate close to 50%, since an even game between equally strong players gives each side about a 50% chance of winning. Winning close to half your games is the signature of an accurate rank, not a sign of stalled progress. Sustained improvement will show up as the rank itself moving upward over time, not as the win rate at any single rank climbing toward 100%.
</details>

## What comes next

For the operational tables this lesson assumes but does not repeat, continue with [Handicap Placement and Komi Values](./handicap-placement-and-komi-values.md), which covers exact stone placement order and the komi used once a handicap is set. For the underlying distinction between komi and handicap, return to [Komi and Handicap](../tutorials/komi-and-handicap.md). For vocabulary, see the glossary terms [handicap](../../../../glossary/terms/handicap.md) and [komi](../../../../glossary/terms/komi.md). For the broader structural picture this lesson sits inside, return to [Weiqi Overview](../tutorials/weiqi-overview.md).
