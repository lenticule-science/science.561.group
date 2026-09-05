---
description: One rule applied uniformly across a whole codebase by tooling, in independently reviewed and reversible batches, as distinct from a single engineer's refactor of one module. Named and specified as an industry practice in Winters, Manshreck, and Wright's Software Engineering at Google (O'Reilly, 2020, ch. 22).
identity: large-scale-change
name: Large-Scale Change
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/operations-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  winters2020:
    authors:
      - Titus Winters
      - Tom Manshreck
      - Hyrum Wright
    title: Software Engineering at Google
    year: 2020
    publisher: O'Reilly Media
---
A large-scale change is one rule applied uniformly across an entire codebase through tooling, sliced into independently reviewed and independently reversible batches rather than delivered as one giant commit (Titus Winters, Tom Manshreck, Hyrum Wright, Software Engineering at Google, O'Reilly, 2020, chapter 22, "Large-Scale Changes"). This distinguishes a large-scale change from an ordinary refactor of one module done by a single engineer inside one review, since the defining property of an LSC is that the same mechanical rule crosses ownership boundaries the codebase's normal review process was never built to batch. The engineering consequence: the org's standardization campaign runs as large-scale-change batches: a fabricated operator applies one rule record across the tree, each batch carries a receipt, and a session never moves or edits a file by hand mid-campaign because a hand sweep is exactly the drift an LSC process exists to prevent.
