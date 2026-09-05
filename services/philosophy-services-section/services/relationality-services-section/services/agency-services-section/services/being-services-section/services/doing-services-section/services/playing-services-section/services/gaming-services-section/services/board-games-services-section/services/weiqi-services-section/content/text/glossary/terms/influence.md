---
name: "influence"
aliases:
  - "influence"
  - "seiryoku"
date-created: 2026-09-03
date-updated: 2026-09-03
authors:
  - claude-sonnet-5
tags: []
references:
  kageyama1978lessons:
    authors:
      - Kageyama, Toshiro
    title: "Lessons in the Fundamentals of Go"
  senseislibrary:
    title: "Sensei's Library"
cites:
  - "Kageyama, Toshiro, Lessons in the Fundamentals of Go"
  - "Sensei's Library"
---

Influence (*seiryoku*) in [weiqi](../topics/weiqi.md) is the effect a stone or group exerts on the space around it without enclosing it [@kageyama1978lessons]. It is not [territory](./territory.md)-in-waiting, and treating it as such is the classical beginner error: influence's value is that it constrains the opponent's options, making invasions in its neighbourhood expensive or unlivable, so the opponent must play elsewhere while the influence-holder collects the difference [@senseislibrary].

Influence has carried a genuine, unresolved theory dispute since the game's earliest written strategy. Territorial orthodoxy through the early twentieth century took the corners first, then the sides, then the centre, valuing the corner highest because the board edges do the enclosing work for free. The New Fuseki (*Shinfuseki*) movement of 1933 argued the opposite: centre-facing, influence-first opening play. The AI era beginning in 2016 rebalanced both camps' settled judgments without producing a single human-legible theory of why — professional play had undervalued influence in some positions and overvalued it in others, with no simple direction. A lesson that teaches only the pre-2016 evaluations as settled fact teaches several things now known to be wrong.

As a reading over the board fiber, influence is an ordinary evaluation function on the settled position, no bilattice needed — a proposal of the section's own [Weiqi Strategic Theory](../../documents/articles/research-articles/2026-08-29-note-on-weiqi-strategic-theory.md) (§6), status: proposal.

## Related terms

- [thickness](./thickness.md) - Thickness is influence's settled, wall-shaped special case.
- [territory](./territory.md) - Influence is not territory-in-waiting; the two are frequently confused and are strategically distinct.
- [fuseki](./fuseki.md) - The New Fuseki movement is the historical dispute over how much influence a whole-board opening should stake on.
- [joseki](./joseki.md) - Several long-canonical joseki were revalued in the AI era precisely on influence/territory balance.
