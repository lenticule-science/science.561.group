---
name: "suicide"
aliases:
  - "suicide"
  - "self-capture"
date-created: 2026-08-19
date-updated: 2026-08-19
authors:
  - claude-sonnet-5
tags: []
cites:
  - "British Go Association, A. Default Rules"
  - "New Zealand Go Society, New Zealand Rules of Go"
---

Suicide in [weiqi](../topics/weiqi.md) is a move that would leave the moving player's own stone or group with zero [liberties](./liberty.md) after any opposing stones it removes are taken off the board [@britgo2025default]. Under most rulesets suicide is simply illegal: a player may not place a stone that reduces their own group to no liberties unless that same move first captures an opposing group and thereby restores at least one liberty. New Zealand rules are the well-known exception, permitting suicide of any size — a player may play a stone, or fill their own group's last liberties entirely, and the played stones are then immediately removed as self-captured [@nzgo2013rules].

Suicide is worth distinguishing carefully from an ordinary [capture](./capture.md) that happens to leave the capturing stone momentarily surrounded: legality is checked by removing captured opponent stones first, then checking the mover's own liberties, so a move that captures is never suicide even if, before the capture is applied, it looked like it had none. Suicide also differs from [ko](./ko.md): a ko recapture always removes exactly one opposing stone and is judged by the repetition rule, while suicide by definition captures nothing at all.

## Related terms

- [liberty](./liberty.md) - Suicide is defined directly in terms of a move reducing the mover's own liberties to zero.
- [capture](./capture.md) - A move is never suicide if it captures an opposing group first, since capture is checked before self-liberties.
- [eye](./eye.md) - Rulesets that forbid suicide are the reason a genuine single-point eye cannot legally be filled by the opponent without first capturing around it.
- [ko](./ko.md) - Ko recaptures and suicide are easy to confuse; ko always captures one stone, suicide by definition captures none.
