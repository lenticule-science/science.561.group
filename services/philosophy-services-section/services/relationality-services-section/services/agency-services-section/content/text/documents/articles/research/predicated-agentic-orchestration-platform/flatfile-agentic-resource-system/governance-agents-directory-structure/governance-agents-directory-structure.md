---
name: governance-agents-directory-structure
description: "Should `governance/agents/` be a flat directory or have subdirectories and if subdirectories what must those subdirectories be?"
type: question
status: open
explores:
  - ../objects/governance-agent.md
  - teaching/explanations/agent-organization.md
  - ../theorems/agent-discovery-principle.md
see-also:
  - teaching/explanations/flatfile.md
  - ../objects/agentic-resource.md
  - teaching/explanations/predicated-computing.md
discharges-to:
  - teaching/explanations/agent-organization.md
title: governance-agents-directory-structure
---

# Should `governance/agents/` be a flat directory or have subdirectories and if subdirectories what must those subdirectories be?

## Context The 561 Group's governance system maintains agent records as markdown files with YAML frontmatter in the `governance/agents/` directory.
Over time, agents have experienced location drift despite being well-organized, raising questions about optimal directory structure for agent discovery, maintenance, and system clarity.

This question arises from observations that: - The directory currently contains 38+ agent files in a flat structure - Some functional grouping is visible in filenames (e.g., *-reviewer.md, *-auditor.md, *-developer.md) - Two subdirectories already exist: emsemiote/ and endpoints/ - As the number of agents grows, flat structure may impact discoverability

## Theoretical Significance This question relates to the flatfile-agentic-resource-system theory which examines how agent-based systems store and organize resources as flat files.
The answer impacts: - Agent discoverability within the PyFARS substrate - Maintenance overhead as the agent ecosystem grows - Consistency with predicated computing principles - Operational efficiency in liberation-focused technical work

## Specific Questions to Address

### Primary Question Should the `governance/agents/` directory remain flat or be reorganized into subdirectories?

### If Subdirectories Are Recommended: 1.
What should the subdirectory structure be?
2.
What criteria determine placement of agents in specific subdirectories?
3.
How should naming conventions be established for subdirectories?
4.
How should edge cases (agents spanning multiple categories) be handled?
5.
What is the migration path from current flat structure to proposed structure?

### If Flat Structure Is Recommended: 1.
What naming conventions or metadata approaches can improve discoverability without subdirectories?
2.
How can the system scale effectively with increasing agent counts?
3.
What supplemental organization mechanisms (tags, indexes, etc.) should be employed?

## Connection to 561 Group Work This organizational question ties directly into the 561 Group's pursuit of Black Liberation and Indigenous Sovereignty by ensuring that technical governance systems are: - Clear and maintainable for collective use - Properly governed as part of praxis - Efficient enough to support liberation work rather than hinder it - Structurally sound to allow focus on substantive objectives

## Current State Analysis The `561/governance/agents/` directory contains files representing various functional roles: - Engineering/technical roles: build-error-resolver, harness-optimizer, rust-build-resolver - Analysis/review roles: code-reviewer, security-reviewer, theory-auditor, theory-researcher - Operational roles: quartermaster, helmsman, librarian, doc-updater - Leadership/governance: architect, operations-officer, organizational-counsel - Specialized roles: cartographer, graph-analyst, diviner, writer - Theory work: derived-theory-improver, mathematical-researcher, predicated-sociologist - System maintenance: citation-auditor, researcher, reviewer

Two existing subdirectories suggest some organizational precedent: - emsemiote/ (semiotic engineering agents) - endpoints/ (API/interface agents)

## Expected Resolution Format A complete answer should include: 1.
Clear recommendation (flat vs subdirectories) 2.
If subdirectories: detailed proposed structure with rationale 3.
Mapping of current agents to proposed locations 4.
Migration plan if structural change is recommended 5.
Updates to any affected documentation or discovery mechanisms 6.
Connection to broader flatfile-agentic-resource-system principles

--- *Question recorded at: 2026-05-11 17:50 UTC* *Recorded by: Codi (AI familiar coding agent for 561 Group)* *Location: flatfile-agentic-resource-system theory questions*
