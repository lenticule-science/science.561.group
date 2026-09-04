---
name: "area scoring"
aliases:
  - "area scoring"
  - "area-scoring"
date-created: 2026-08-19
date-updated: 2026-08-19
authors:
  - claude-sonnet-5
tags: []
cites:
  - "British Go Association, A. Default Rules"
  - "New Zealand Go Society, New Zealand Rules of Go"
---

Area scoring in [weiqi](../topics/weiqi.md) computes each player's final score as the number of that player's own live stones remaining on the board plus the vacant points that count as that player's [territory](./territory.md); captures made during play matter only insofar as they change which stones are on the board at the end, not as separately counted prisoner points [@britgo2025default]. Chinese, New Zealand, and Ing rules all use area scoring. Because a stone on the board and an enclosed empty point are worth the same one point each, playing an extra move inside your own territory late in the game costs nothing under area scoring: it simply converts a territory point into a stone point.

That single property is the main practical difference from [territory-scoring](./territory-scoring.md), and it is why area-scoring rulesets can set standard [komi](./komi.md) a half-point to a full point higher than territory-scoring rulesets covering the same game: Black, moving first, typically ends a game with one more stone on the board than White, and area scoring counts that stone directly where territory scoring would not. The exact standard komi for each ruleset is recorded in the [rulesets comparison](../../documents/articles/teaching-articles/references/rulesets.md).

## Related terms

- [territory](./territory.md) - Area scoring counts a player's territory as part of the total, alongside that player's own stones.
- [territory-scoring](./territory-scoring.md) - Area scoring and territory scoring are the two families of final-count rule a ruleset must choose between.
- [komi](./komi.md) - Standard komi values differ between area-scoring and territory-scoring rulesets partly to offset how each counts stones.
- [dead-stones](./dead-stones.md) - Area-scoring rulesets typically resolve disputed dead stones by resuming play to an actual capture.
- [pass](./pass.md) - Some area-scoring implementations reconcile counts with territory scoring using a pass stone.
