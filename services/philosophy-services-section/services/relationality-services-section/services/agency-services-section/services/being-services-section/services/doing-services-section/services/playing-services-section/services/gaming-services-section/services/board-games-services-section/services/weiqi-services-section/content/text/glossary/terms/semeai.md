---
name: "semeai"
aliases:
  - "semeai"
  - "capturing race"
date-created: 2026-09-03
date-updated: 2026-09-03
authors:
  - claude-sonnet-5
tags: []
references:
  senseislibrary:
    title: "Sensei's Library"
  berlekampwolfe1994mathgo:
    authors:
      - Berlekamp, Elwyn
      - Wolfe, David
    title: "Mathematical Go: Chilling Gets the Last Point"
cites:
  - "Sensei's Library"
  - "Berlekamp, Elwyn, and David Wolfe, Mathematical Go: Chilling Gets the Last Point"
---

Semeai ("capturing race") in [weiqi](../topics/weiqi.md) is a contest between two adjacent groups, neither of which has secured two eyes, where each side fills the other's [liberties](./liberty.md) as fast as possible and the group that runs out first is [captured](./capture.md) [@senseislibrary]. It differs from an ordinary [atari](./atari.md) chase because both groups are mutually vulnerable at once — the racing side must count whether it can fill the opponent's last liberty before its own runs out, not merely whether it can force the opponent into atari.

Counting a semeai correctly is exact, countable work: shared liberties, approach moves, and whether either group has an eye that must be filled last all change the count in specific, computable ways rather than by rough estimation [@berlekampwolfe1994mathgo]. A semeai miscounted by even one liberty reverses which side survives.

## Related terms

- [liberty](./liberty.md) - A semeai is decided entirely by counting liberties on both sides of the race.
- [atari](./atari.md) - A semeai is the mutual, two-sided generalization of the one-sided pressure atari names.
- [life-and-death](./life-and-death.md) - A semeai is a life-and-death question between two groups at once, rather than one group reading against an empty board.
