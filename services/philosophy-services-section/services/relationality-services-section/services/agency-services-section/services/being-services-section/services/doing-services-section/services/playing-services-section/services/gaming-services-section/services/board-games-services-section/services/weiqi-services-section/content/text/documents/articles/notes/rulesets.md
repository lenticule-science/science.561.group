---
title: Rulesets
description: "Audience: kernel implementers and readers who already understand ko, suicide, seki, and both scoring methods. A comparison of five rulesets across five parameters, with a stable identifier for each cell so this document can be encoded directly as the kernel's ruleset data."
date-created: 2026-08-19
date-updated: 2026-08-19
tags: []
requires:
- /games/topics/board-games/weiqi/curricula/ending-the-game.md
uses-mechanic:
- /games/topics/board-games/weiqi/terms/superko.md
- /games/topics/board-games/weiqi/terms/suicide.md
- /games/topics/board-games/weiqi/terms/area-scoring.md
- /games/topics/board-games/weiqi/terms/territory-scoring.md
- /games/topics/board-games/weiqi/terms/komi.md
- /games/topics/board-games/weiqi/terms/handicap.md
type: specification
authors:
  - claude-sonnet-5
cites:
  - "British Go Association, A. Default Rules"
  - "American Go Association, AGA Rules of Go"
  - "Nihon Ki-in and Kansai Ki-in, The Japanese Rules of Go"
  - "New Zealand Go Society, New Zealand Rules of Go"
  - "Ing Chang-ki, Ing's Rules of Wei-chi"
---

Audience: kernel implementers and readers who already understand [ko](../../../glossary/terms/ko.md), [suicide](../../../glossary/terms/suicide.md), [seki](../../../glossary/terms/seki.md), and both scoring methods, per [Ending the Game](./ending-the-game.md).

Learning goal: fix, for five widely-played rulesets, the exact value of the five parameters that most affect play — ko regime, suicide, scoring method, standard komi, and handicap placement — precisely enough that each cell below is a rule object, not prose. Per the [Weiqi Platform Plan](./weiqi-platform-plan.md), this document *is* the kernel's ruleset spec: `@lenticule-science/weiqi-kernel` should be able to encode `ruleset.<name>.<parameter>` directly from the identifiers used here, as declared rule objects rather than code forks.

See also: [Weiqi Rulesets](./weiqi-rulesets.md) is this specification's learner-facing companion, explaining the same five rulesets in prose for readers comparing a club, server, or tournament rather than implementing a kernel.

## Comparison table

| Ruleset | Ko regime | Suicide | Scoring | Standard komi (even game) | Handicap placement |
|---|---|---|---|---|---|
| Chinese | Positional superko | Illegal | Area | 7.5 | Fixed star points |
| Japanese | Simple ko only | Illegal | Territory | 6.5 | Fixed star points |
| AGA | Situational superko | Illegal | Area or territory (reconciled by pass stone) | 7.5 (area) / 6.5 (territory) | Fixed star points |
| New Zealand | Positional superko | Legal (any size) | Area | 7 | Fixed star points |
| Ing | Positional superko | Illegal | Area | 8 | Fixed star points |

## Stable identifiers

Each cell above is addressable as `ruleset.<name>.<parameter>`, matching the [ontology](../../../glossary/topics/weiqi.md)'s intent that the engine be the executable form of the glossary. The five ruleset names are `chinese`, `japanese`, `aga`, `newzealand`, `ing`. The five parameter names, and the value vocabulary each one draws from, are:

```
ko_regime          : simple_ko | positional_superko | situational_superko
suicide             : illegal | legal
scoring             : area | territory | area_or_territory
komi                : <number> (points added to White's score in an even game)
handicap_placement  : fixed_star_points | free_placement
```

```
ruleset.chinese.ko_regime         = positional_superko
ruleset.chinese.suicide           = illegal
ruleset.chinese.scoring           = area
ruleset.chinese.komi              = 7.5
ruleset.chinese.handicap_placement = fixed_star_points

ruleset.japanese.ko_regime        = simple_ko
ruleset.japanese.suicide          = illegal
ruleset.japanese.scoring          = territory
ruleset.japanese.komi             = 6.5
ruleset.japanese.handicap_placement = fixed_star_points

ruleset.aga.ko_regime             = situational_superko
ruleset.aga.suicide               = illegal
ruleset.aga.scoring               = area_or_territory
ruleset.aga.komi                  = 7.5   # area count
ruleset.aga.komi_territory        = 6.5   # territory count, reconciled via the pass-stone rule
ruleset.aga.handicap_placement    = fixed_star_points

ruleset.newzealand.ko_regime      = positional_superko
ruleset.newzealand.suicide        = legal
ruleset.newzealand.scoring        = area
ruleset.newzealand.komi           = 7
ruleset.newzealand.handicap_placement = fixed_star_points

ruleset.ing.ko_regime             = positional_superko
ruleset.ing.suicide               = illegal
ruleset.ing.scoring               = area
ruleset.ing.komi                  = 8
ruleset.ing.handicap_placement    = fixed_star_points
```

## Notes per parameter

**Ko regime.** [Simple ko](../../../glossary/terms/ko.md) forbids only the single immediate recapture; it is the shared baseline every ruleset here includes. [Superko](../../../glossary/terms/superko.md) extends that ban to any repeated whole-board position. Japanese rules are the outlier: they specify no formal superko rule at all, relying instead on the two-pass-and-agree convention for ordinary games and a "no result" (rematch) ruling for the rare unresolved long cycle such as triple ko [@nihonkiin1989rules]. AGA rules specify situational superko explicitly [@usgo2022agarules]; Chinese, New Zealand, and Ing rules are generally implemented with positional superko in modern digital play, though traditional over-the-board Chinese rules historically left long cycles to ad hoc agreement much like Japanese rules do [@britgo2025default]. A kernel targeting strict traditional Chinese play should treat `ruleset.chinese.ko_regime` as configurable rather than fixed.

**Suicide.** [New Zealand rules](../../../glossary/terms/suicide.md) are the standard citation for legal suicide of any size; every other ruleset in this table forbids it entirely [@nzgo2013rules].

**Scoring.** [Area scoring](../../../glossary/terms/area-scoring.md) counts stones plus territory; [territory scoring](../../../glossary/terms/territory-scoring.md) counts territory plus prisoners only. AGA rules are unusual in supporting both, reconciled so the two counts normally agree via the pass-stone convention described in [pass](../../../glossary/terms/pass.md) [@usgo2022agarules].

**Standard komi.** Values above are the modern standard for an even game with no handicap; historical values have differed (Japanese komi was commonly 5.5 before a widely-adopted 2002 shift to 6.5, and Chinese komi has likewise moved between 5.5, 7.5, and other values across the twentieth century) [@britannica2026go]. The roughly one-point gap between Chinese-style area komi (7.5) and Japanese territory komi (6.5) is not arbitrary: it approximates the systematic scoring difference explained in [Ending the Game](./ending-the-game.md#why-area-and-territory-rarely-differ), where area scoring credits Black with one extra stone that territory scoring does not. Ing komi (8) reflects a separately-set tradition rather than the same offset logic.

**Handicap placement.** All five rulesets here place handicap stones on the fixed star points (hoshi) standard for the board size, in the conventional 2-through-9-stone patterns; none of the five mandates free placement as a rule, though free placement is sometimes used informally in casual or teaching games under any ruleset.

## What comes next

Return to [Ending the Game](./ending-the-game.md) for the procedural context these parameters govern, or continue to the [regression positions appendix](./regression-positions.md), which exercises several of these parameters — ko regime, suicide, and both scoring methods — against small labeled board positions.
