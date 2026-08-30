---

name: foss-planning-practices-survey
date-created: 2026-03-07T00:00:00
authors:
  - claude
keywords:
  - project-management
  - governance
  - f-o-s-s
description: "Survey of how mature FOSS projects handle planning, governance, and prioritization."
---

## Purpose

Research for plan 0004 (planning system improvements). Surveys how
mature FOSS projects handle planning to inform ASR planning
infrastructure.

## Plan/proposal lifecycle states

Most FOSS projects converge on similar lifecycles:

| State | PEP (Python) | RFC (Rust) | ADR | IETF |
|-------|-------------|------------|-----|------|
| Initial | Draft | Pre-RFC | Proposed | Internet-Draft |
| Review | Under Review | FCP | Proposed | Proposed Standard |
| Accepted | Accepted | Merged | Accepted | Draft Standard |
| Active | Active | Tracking Issue | potential | Internet Standard |
| Done | Final | Stabilized | — | — |
| Rejected | Rejected | Closed | Superseded | — |

Recommended minimal lifecycle for small projects:

```
draft → proposed → accepted → active → completed
                 → rejected (with reason)
                 → deferred (not now, maybe later)
         accepted → abandoned (started but stopped, with reason)
```

The "proposed" state (between draft and accepted) is important — it
signals "ready for review" vs. "still being authored."

## Priority ranking systems

**Dependency-based ordering** (most natural for FOSS): Build a
dependency graph of plans. Plans that unblock other plans have
implicit higher priority. "Foundation before features."

**MoSCoW** (simple, widely used): Must have / Should have / Could
have / Won't have this time.

**Simple labels**: critical / high / medium / low. Combined with
dependency ordering for a complete system.

**RICE scoring** (product management): Reach × Impact × Confidence /
Effort. Too heavyweight for small teams.

## How projects decide what to work on next

1. Check if any active work is blocked → unblock it
2. Check if any accepted plans aren't started → start highest priority
3. Review proposed plans → accept/reject
4. Review unplanned work → write plans for important items
5. If nothing is pending → solicit new ideas or maintenance

## Governance for knowledge-management projects

**BDFL model**: One person has final say. All proposals are proposals.
This is already how the emsemioverse works.

**Lazy consensus**: If no objection within reasonable time, accepted.
Good for low-risk changes.

**Convention over configuration**: Establish conventions and follow
them. Reduces decision overhead.

**"Good enough" governance**: Don't over-engineer governance. It
should be lighter than the work it governs.

**Governance as code**: Where possible, encode governance rules as
automated checks rather than prose. (Aligns with plan 0003.)

## Relevant models

- **Wikipedia**: Policies (mandatory), guidelines (best practices),
  essays (opinions). "Bold, Revert, Discuss" cycle.
- **Zettelkasten**: No central authority on content. Governance
  focuses on linking quality, term consistency, avoiding orphans.
- **IETF**: "Rough consensus and running code." Standards must be
  implemented before advancing in maturity.

## Sources

- Python PEP 1 (PEP Purpose and Guidelines)
- Rust RFC process (github.com/rust-lang/rfcs)
- Michael Nygard, "Documenting Architecture Decisions" (2011)
- IETF RFC 2026, The Internet Standards Process
- MoSCoW method (DSDM consortium)
