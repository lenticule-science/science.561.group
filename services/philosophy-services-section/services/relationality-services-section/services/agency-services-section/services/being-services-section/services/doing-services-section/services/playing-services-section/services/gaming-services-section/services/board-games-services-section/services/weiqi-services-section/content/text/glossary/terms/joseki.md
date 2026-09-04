---
name: "joseki"
aliases:
  - "joseki"
date-created: 2026-09-03
date-updated: 2026-09-03
authors:
  - claude-sonnet-5
tags: []
references:
  ishida1977joseki:
    authors:
      - Ishida, Yoshio
    title: "Dictionary of Basic Joseki"
cites:
  - "Ishida, Yoshio, Dictionary of Basic Joseki"
---

Joseki in [weiqi](../topics/weiqi.md) are the memorized, locally-balanced corner sequences catalogued across the standard literature, most exhaustively by Ishida's three-volume *Dictionary of Basic Joseki* [@ishida1977joseki]. Each joseki is a locally complete exchange in which neither side gains a clear local advantage; the players agree, in effect, to a fair local trade and both move on.

The essential caveat belongs with the definition: joseki are locally balanced and therefore whole-board-neutral by construction. That is why "knowing joseki" is famously worth little on its own — the sequence that is correct in one whole-board context can be the wrong one to play in another, and choosing which corner sequence fits the position in front of a player is a [direction-of-play](./fuseki.md) judgment the dictionary itself cannot make. The AI era additionally showed several long-canonical joseki to be slightly worse for one side than professional play had assumed for decades.

## Related terms

- [fuseki](./fuseki.md) - Fuseki is the whole-board opening a joseki must be chosen to fit; a joseki correct in isolation can still be the wrong choice for the fuseki around it.
- [influence](./influence.md) - AI-era analysis revalued several joseki specifically on the influence/territory balance they leave.
- [miai](./miai.md) - Many joseki sequences end by leaving the two players a miai choice between equivalent local continuations.
