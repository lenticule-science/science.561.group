---
description: A single specification of a source-view relation that yields a coupled forward `get` and backward `put`, so editing the view and propagating back is well-defined by construction. Its reference laws (GetPut, PutGet) come from Foster, Greenwald, Moore, Pierce, and Schmitt's lens combinators (ACM TOPLAS, 2007).
identity: bidirectional-transformation
name: Bidirectional Transformation
provenance:
  date-created: 2026-09-04
  authors:
    - emsenn
    - claude-fable-5-1
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/operations-services-section/content/text/glossary/terms/fabrication-friday.md
    - /home/emsenn/info/.claude/skills/dispatch-agents/SKILL.md
references:
  foster2007:
    authors:
      - J. Nathan Foster
      - Michael B. Greenwald
      - Jonathan T. Moore
      - Benjamin C. Pierce
      - Alan Schmitt
    title: "Combinators for bidirectional tree transformations: a linguistic approach to the view-update problem"
    year: 2007
    publication: ACM Transactions on Programming Languages and Systems (TOPLAS), 29(3)
---
A bidirectional transformation is a single specification of a relation between a source and a view that yields both a forward `get` (deriving the view from the source) and a backward `put` (propagating an edited view back into the source) as one committed pair, rather than as two independently maintained functions (J. Nathan Foster, Michael B. Greenwald, Jonathan T. Moore, Benjamin C. Pierce, Alan Schmitt, "Combinators for bidirectional tree transformations: a linguistic approach to the view-update problem", ACM TOPLAS 29(3), 2007). This distinguishes a bidirectional transformation from an ordinary pair of forward and inverse functions hand-written and maintained separately, where nothing forces the two to stay consistent with each other as either one changes. The engineering consequence: a lens that reads a carrier in and puts a carrier out must satisfy the GetPut and PutGet laws — put(get(s), s) = s and get(put(v, s)) = v — so idempotence on a round trip (read-in, no edit, write-out reproduces the source) is exactly the PutGet law, and a script that fails it is not a lens, it is a lossy one-way projector wearing a lens's name.
