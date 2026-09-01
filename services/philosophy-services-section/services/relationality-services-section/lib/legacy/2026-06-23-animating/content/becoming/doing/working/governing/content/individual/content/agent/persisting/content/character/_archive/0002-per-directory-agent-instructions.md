---

name: 0002-per-directory-agent-instructions
date-created: 2026-03-07T00:00:00
authors:
  - emsenn
  - claude
specialization: research
---

## Context

The ASR has two root-level agent instruction files (CLAUDE.md and AGENTS.md) and a content-level CLAUDE.md, following decision 0001's progressive disclosure structure.
But discipline modules (mathematics/, philosophy/, technology/, etc.) have no agent-facing context beyond what the root files provide.

When an agent works in a discipline directory, it loads root instructions and content instructions but receives no discipline-specific interpretive guidance.
For code repositories this is adequate — instructions are procedural ("use pytest, follow PEP 8").
For a knowledge repository organized by discipline, the instructions are epistemic: what interpretive stance to adopt, what vocabulary is central, what methodological commitments apply.

Research into per-directory agent configuration patterns across the ecosystem (AGENTS.md cascading spec, Cursor rules, GitHub Copilot .instructions.md, Datadog's monorepo approach, the Codified Context paper) confirms that co-located instruction files are the dominant pattern for scoping agent behavior to subdirectories.
The AGENTS.md specification explicitly supports nested files with concatenation from root downward.

The existing AGENTS.md files in triage/ are legacy project files, not discipline-level interpretive contexts.

## Decision

Adopt co-located AGENTS.md files in discipline module directories as bounded interpretive contexts.
These files:

1. Live inside the content directory they scope (e.g., `mathematics/AGENTS.md`), not in a centralized config directory.
2. Define the interpretive stance for agents working in that directory: central vocabulary, methodological commitments, what reasoning style applies, cross-references to adjacent disciplines.
3. Are themselves content — visible in Obsidian, editable as notes, linkable via standard paths.
4. Are kept small (under 60 lines).
  Detailed instructions belong in SKILL.md files and specs, not in AGENTS.md.
5. Reference the discipline's domain ASR spec where one exists.
6. Follow the AGENTS.md format (not CLAUDE.md) for cross-tool compatibility.

This is Pattern A from the research (co-located, filesystem encodes scope), chosen because: - The Obsidian ecosystem treats all .md files as first-class content. - The ASR's fragment concept maps directly: each directory-level AGENTS.md defines a bounded interpretive context (fragment) in the mathematical sense. - The AGENTS.md specification's cascading rules (root → subdirectory concatenation) match the ASR's progressive disclosure principle.

## Consequences

- Discipline modules gain agent-visible interpretive context without bloating root CLAUDE.md.
- The fragment/bounded-context correspondence becomes concrete: each AGENTS.md IS a fragment boundary marker.
- AGENTS.md files must be maintained as discipline understanding evolves.
  The Codified Context paper warns that context drift (outdated instruction files) causes agents to generate work conflicting with current state.
- Agents loading files from a discipline directory receive root + content + discipline instructions — three layers of progressive disclosure.
- Skills and specs remain the detailed operational layer; AGENTS.md provides orientation, not procedure.

## Alternatives considered

- **Centralized config with glob targeting (Cursor pattern)**: Rejected.
  Separates instructions from content, which conflicts with the ASR principle that instruction files in a knowledge repo are themselves knowledge artifacts.
- **No per-directory files; rely on skills and specs**: Rejected.
  Skills provide procedural instructions on demand.
  What is missing is ambient interpretive context — what the agent should know before it even receives a task.
- **agents/ subdirectory per discipline**: Deferred.
  The AGENTS.md specification's single-file-per-directory model is simpler and sufficient for now.
  If discipline-level agent configuration grows complex (multiple agent types, conditional rules), an agents/ subdirectory could be added later.
