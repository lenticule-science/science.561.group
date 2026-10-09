---
name: "Issue-Based Information System"
description: "An issue-based information system (IBIS) records deliberation as a graph of issues (questions to be settled), positions (candidate answers that respond to an issue) and arguments (supporting or objecting to a position). A position without an issue answers nothing; an issue is settled by adopting a position, and the arguments are the record of why."
aliases:
  - "IBIS"
  - "issue-based information system"
  - "issue, position, argument"
date-created: 2026-10-02
tags: []
provenance:
  authors:
    - emsenn
    - claude-opus-5-5
  sources:
    - "Kunz, W. and Rittel, H. W. J. (1970). Issues as Elements of Information Systems. Working Paper 131, Institute of Urban and Regional Development, University of California, Berkeley."
    - "Conklin, J. and Begeman, M. L. (1988). gIBIS: A Hypertext Tool for Exploratory Policy Discussion. ACM Transactions on Office Information Systems 6(4), 303–331."
    - "Rittel, H. W. J. and Webber, M. M. (1973). Dilemmas in a General Theory of Planning. Policy Sciences 4(2), 155–169."
---

Kunz and Rittel built IBIS for *wicked problems* (Rittel and Webber 1973): problems with no definitive formulation, where understanding the problem and choosing a solution proceed together through argument among stakeholders. Instead of recording conclusions, IBIS records the deliberation itself, in three node types and a few typed links:

- an **issue** is a question to be settled ("How should the ledger handle concurrent writers?");
- a **position** *responds-to* an issue — one candidate answer;
- an **argument** *supports* or *objects-to* a position.

Issues may *generalize*, *specialize* or *question* other nodes, so a position can raise a further issue. Two rules give the scheme its force. A position is only ever a position *on an issue*: an idea floated with no question behind it cannot be weighed, because nothing says what it would settle. And deciding is adopting a position, with the arguments left standing as the rationale ([warrant](warrant.md) in Toulmin's terms) — so a later reader can see not only what was chosen but what was rejected and why.

## In the house

The work arena's openings already carry IBIS's node types: an `ask` or a `report` (or a request whose means is open) is an issue; a `propose` is a position and must name what it `addresses` (or the aim it serves); `argue` with a stance *for* or *against*, and evidence, is an argument, played only while the position is open. Adoption settles the position; the board derives each issue's live positions and each position's argument counts, so the deliberation is read from the board rather than restated in prose. See the [note on the work arena's fifth edition](../../../../../../../561-group-services-section/content/text/documents/articles/notes/2026/10/02/2026-10-02-note-on-the-work-arenas-fifth-edition.md).
