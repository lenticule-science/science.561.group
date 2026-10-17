---
description: A function that projects a formatted textual layout from a program's parsed tree by declared width and layout combinators, so surface code style is computed rather than hand-typed. Wadler's "A prettier printer" (2003) gives the combinator theory; Prettier is its current JavaScript-ecosystem realization.
identity: pretty-printer
name: Pretty-Printer
date-created: 2026-09-04
provenance:
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/561-group-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  wadler2003:
    authors:
      - Philip Wadler
    title: A prettier printer
    year: 2003
    publication: The Fun of Programming (Palgrave Macmillan)
---
A pretty-printer is a function that projects a formatted textual layout from a program's parsed tree according to a declared width and set of layout combinators, so that the surface style of code is computed rather than typed by hand (Philip Wadler, "A prettier printer", in The Fun of Programming, Palgrave, 2003; realized for JavaScript by the tool Prettier). This distinguishes a pretty-printer from a style reviewed and enforced by human comment, where the same tree can be laid out in many different ways and a reviewer's opinion, not a total function of the tree, decides which one lands. The engineering consequence: the same code style across the whole tree is a projection the pretty-printer computes from the parsed tree every time, never a review comment asking an engineer to reformat by hand.
