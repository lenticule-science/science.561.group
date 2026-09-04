---
name: "seki"
aliases:
  - "seki"
  - "mutual life"
date-created: 2026-08-19
date-updated: 2026-08-19
authors:
  - claude-sonnet-5
tags: []
cites:
  - "British Go Association, How to Play Go"
  - "Nihon Ki-in and Kansai Ki-in, The Japanese Rules of Go"
---

Seki in [weiqi](../topics/weiqi.md) is a standoff in which two or more groups of opposite color share their remaining [liberties](./liberty.md), and neither side can play into the shared liberties without reducing its own group to a liberty count the opponent can then capture on the next move [@nihonkiin1989rules]. Neither group has two [eyes](./eye.md), yet neither can be captured either, so both remain on the board unresolved for the rest of the game. Seki is a genuine third outcome for a local fight, distinct from either group living outright or dying.

Seki matters for scoring because it is handled differently, in detail, by different rulesets, which is exactly the kind of parameter the [rulesets comparison](../../documents/articles/teaching-articles/references/rulesets.md) exists to pin down. Under territory scoring, the shared liberties inside a seki count as points for neither player and stones in seki earn no prisoner value, since nothing was captured. Under area scoring, each side's own stones in the seki count as that side's area as normal, while the shared liberties still count for neither side, since they are not enclosed exclusively by one color.

## Related terms

- [life-and-death](./life-and-death.md) - Seki is the standoff outcome that arises specifically when neither side's life-and-death reading resolves in its favor.
- [eye](./eye.md) - Groups in seki characteristically lack the two eyes that would make them unconditionally alive.
- [liberty](./liberty.md) - Seki is defined by a shared, unfillable pool of liberties between opposing groups.
- [area-scoring](./area-scoring.md) - Area scoring counts each seki group's own stones but not the shared liberties between them.
- [territory-scoring](./territory-scoring.md) - Territory scoring credits neither side with the shared liberties inside a seki.
