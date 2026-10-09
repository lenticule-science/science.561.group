---
name: "Link Rot"
description: "Link rot and its sibling reference rot -- content drift, where a URI still resolves but no longer to the cited content -- are documented at roughly one in five scholarly-article references (Klein et al. 2014, PLOS ONE) and at rates above 70 percent of law-journal citations and around 50 percent of U.S. Supreme Court opinion URLs (Zittrain, Albert & Lessig 2014), establishing non-delivery and drift, not backfire, as the failure mode correction-propagation infrastructure should be designed against."
aliases:
  - "link rot"
  - "reference rot"
  - "content drift"
date-created: 2026-08-22
instance-of: systems-pattern
---

Link rot is the failure of a URI to resolve to any content; reference rot, the broader term, includes content drift — the URI still resolves, but to content other than what was originally cited.

Klein, Van de Sompel, et al., "Scholarly Context Not Found: One in Five Articles Suffers from Reference Rot," *PLOS ONE* 9(12):e115253, 26 December 2014, examined over a million web references extracted from over 3.5 million articles published 1997-2012 and found one in five articles affected: [DOI 10.1371/journal.pone.0115253](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0115253).
Zittrain, Albert, and Lessig, "Perma: Scoping and Addressing the Problem of Link and Reference Rot in Legal Citations," *Harvard Law Review Forum* vol. 127 (2014), found more than 70 percent of URLs cited in sampled law-journal articles no longer produced the originally cited content, and roughly 50 percent of URLs cited in U.S. Supreme Court opinions suffered the same fate: [harvardlawreview.org/forum/vol-127](https://harvardlawreview.org/forum/vol-127/perma-scoping-and-addressing-the-problem-of-link-and-reference-rot-in-legal-citations/).
Jones, Klein, and Van de Sompel's Robust Links program — "Scholarly Context Adrift" (*PLOS ONE* 11(12):e0167475, 2016, [DOI 10.1371/journal.pone.0167475](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0167475)) measuring up to 75 percent content change within three years, and "Robustifying Links To Combat Reference Rot" (*Code4Lib Journal* Issue 50, 10 February 2021, [journal.code4lib.org/articles/15509](https://journal.code4lib.org/articles/15509)) — proposes decorating a citation with both the live URI and a [Memento](./memento-protocol.md)-compatible archived-snapshot URI taken at citation time, so the reference survives the live target rotting.

This literature converges with the program note's citation of the non-replicating backfire effect (Wood & Porter against Nyhan & Reifler) on a single design instruction: corrections fail chiefly by not arriving — rotting, drifting, or never propagating to downstream copies — not by boomeranging on contact, so correction-propagation infrastructure should be designed and evaluated against non-delivery as the real failure mode.

See [Study of Syndication and Propagation Protocols](../../documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-syndication-and-propagation-protocols.md), section 6.
