---
name: "territory scoring"
aliases:
  - "territory scoring"
  - "territory-scoring"
date-created: 2026-08-19
date-updated: 2026-08-19
authors:
  - claude-sonnet-5
tags: []
cites:
  - "Nihon Ki-in and Kansai Ki-in, The Japanese Rules of Go"
  - "British Go Association, A. Default Rules"
---

Territory scoring in [weiqi](../topics/weiqi.md) computes each player's final score as the vacant points that count as that player's [territory](./territory.md) plus the prisoners that player captured from the opponent during the game; a live stone remaining on the board at the end contributes no direct point value of its own [@nihonkiin1989rules]. Japanese and Korean rules use territory scoring. Because stones themselves are not counted, playing an extra move inside your own territory late in the game costs a full point under territory scoring: it removes one territory point and, since nothing was captured, adds nothing back.

That cost is the main practical difference from [area-scoring](./area-scoring.md), and it is one reason experienced players under territory scoring stop playing inside their own territory as soon as a group is settled, while players under area scoring can fill such points for free. The exact standard komi and other parameters for each ruleset are recorded in the [rulesets comparison](../../documents/articles/notes/rulesets.md).

## Related terms

- [territory](./territory.md) - Territory scoring's core term is the vacant points a player's stones enclose.
- [area-scoring](./area-scoring.md) - Territory scoring and area scoring are the two families of final-count rule a ruleset must choose between.
- [komi](./komi.md) - Standard komi values differ between territory-scoring and area-scoring rulesets partly to offset how each counts stones.
- [dead-stones](./dead-stones.md) - Territory-scoring rulesets typically resolve dead stones by mutual agreement after passing.
- [capture](./capture.md) - Captures matter directly under territory scoring, since prisoners are added to the final count.
