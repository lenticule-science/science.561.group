---
title: "Architecture Decision Records"
date-created: 2026-03-07T00:00:00
authors:
  - claude
type: text
keywords:
  - architecture-decision-records
  - software-architecture
  - documentation-practice
  - lightweight-process
description: "Research summary of Architecture Decision Records (ADRs), a lightweight method for documenting architectural decisions in software projects."
cites:
  - "Nygard, Michael. 'Documenting Architecture Decisions.' Cognitect Blog, November 15, 2011."
  - "ThoughtWorks. 'Lightweight Architecture Decision Records.' Technology Radar, November 2017."
references:
  - id: ref1
    type: document
    title: Nygard, Michael. 'Documenting Architecture Decisions.' Cognitect Blog, November 15, 2011.
  - id: ref2
    type: document
    title: ThoughtWorks. 'Lightweight Architecture Decision Records.' Technology Radar, November 2017.
---

Architecture Decision Records (ADRs) are short text documents that
capture a single architectural decision, its context, and its
consequences. Michael Nygard introduced the format in a November 2011
blog post titled "Documenting Architecture Decisions," published on
the Cognitect blog (Nygard, 2011). The post argued that agile projects
need lightweight documentation that stays close to the code, rather
than large design documents that fall out of date.

## Format

Nygard's original ADR format draws on the structure of Alexandrian
patterns. Each record contains five sections:

- **Title**: a short noun phrase with a sequential number (e.g.,
  "ADR 1: Use PostgreSQL for persistence").
- **Status**: one of "proposed," "accepted," "deprecated," or
  "superseded." A superseded ADR links to its replacement.
- **Context**: the forces at play --- technical, political, social,
  or project-specific --- that create the need for a decision.
- **Decision**: the response to those forces, stated in active voice.
- **Consequences**: what follows from the decision, including both
  benefits and costs.

ADRs are stored as numbered text files in source control, typically
in a directory such as `doc/adr/` or `docs/decisions/`. This keeps
decision history versioned alongside the code the decisions govern.

## Core planning mechanism

The ADR's planning function is retrospective rather than prospective.
Where a design document plans future work, an ADR records the
rationale behind a choice already made or about to be made. The
accumulation of ADRs creates a decision log --- a navigable history
that answers "why is the system this way?" rather than "what should
the system become?"

The mechanism works because decisions are immutable records. When
circumstances change, a team writes a new ADR that supersedes the
old one rather than editing the original. This preserves the chain
of reasoning over time.

## Adoption

In November 2017, ThoughtWorks placed "Lightweight Architecture
Decision Records" in the Adopt ring of its Technology Radar,
indicating strong industry recommendation (ThoughtWorks, 2017).
Since then, multiple ADR templates have appeared, including the
Markdown Any Decision Records (MADR) format and Y-statement
templates. The UK Government Digital Service (GDS) adopted ADRs
as a standard practice for documenting technical choices across
government projects.

Joel Parker Henderson maintains a widely referenced open-source
repository of ADR templates and examples on GitHub
(joelparkerhenderson/architecture-decision-record). The University
of Queensland's software engineering curriculum includes ADRs as
a teaching topic in its CSSE6400 course materials.

## Key citations

- Nygard, Michael. "Documenting Architecture Decisions." Cognitect
  Blog, November 15, 2011.
- ThoughtWorks. "Lightweight Architecture Decision Records."
  Technology Radar, November 2017.
- Tyree, Jeff, and Art Akerman. "Architecture Decisions: Demystifying
  Architecture." *IEEE Software* 22, no. 2 (2005): 19--27.
