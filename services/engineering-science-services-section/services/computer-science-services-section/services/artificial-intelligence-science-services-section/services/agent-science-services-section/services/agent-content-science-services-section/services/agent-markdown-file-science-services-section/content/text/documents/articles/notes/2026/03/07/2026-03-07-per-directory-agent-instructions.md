---
title: "Per-directory agent instructions: patterns and practices"
date-created: 2026-03-07T00:00:00
type: text
authors:
  - claude
keywords:
  - AgentConfiguration
  - AgentialSemioverse
  - RepositoryDesign
cites:
  - "[@vasilopoulos2026codified]"
description: "Survey of how AI agent instruction files are scoped to directories across tools and ecosystems, with analysis of what these patterns mean for knowledge repositories."
---

Agent instruction files — AGENTS.md, CLAUDE.md, .cursorrules, copilot-instructions.md — tell AI agents how to behave when working in a repository. Most start as a single root file. As repositories grow, the question arises: should subdirectories carry their own instructions?

This text surveys how per-directory agent instructions work across the ecosystem, what the research says about their effectiveness, and how the patterns apply to knowledge repositories (as opposed to code repositories).

## 1. The AGENTS.md specification

The AGENTS.md specification, formalized in August 2025 by a consortium including OpenAI, Google, Cursor, Factory, and Sourcegraph (now stewarded by the Agentic AI Foundation under the Linux Foundation), explicitly supports subdirectory placement.

**Cascading mechanics.** The agent walks from the repository root down to the current working directory, checking each level for `AGENTS.override.md`, then `AGENTS.md`. Files are concatenated from root downward, joined with blank lines. Files closer to the current directory appear later in the combined prompt, giving them effective precedence through prompt positioning. At most one instruction file is included per directory level. Combined files are capped at 32 KiB by default.

**Override files.** `AGENTS.override.md` supersedes `AGENTS.md` at the same level, intended for temporary high-priority contexts like release freezes.

OpenAI's own repository reportedly uses 88 AGENTS.md files across subcomponents.

## 2. Cursor rules

Cursor migrated from a single `.cursorrules` file to a structured `.cursor/rules/` directory system (0.45 update). Rule files use the `.mdc` format (markdown with YAML frontmatter) and are scoped to files via gitignore-style glob patterns. Rules are automatically attached when matching files are referenced in chat.

This is a fundamentally different philosophy from AGENTS.md. Cursor centralizes rules in a dotfile directory using glob-based targeting. AGENTS.md distributes rules via filesystem co-location.

## 3. GitHub Copilot

Copilot supports two tiers. A single `.github/copilot-instructions.md` applies repository-wide. Multiple `.instructions.md` files with `applyTo` YAML frontmatter target specific paths:

```yaml
---
applyTo: "**/*.py"
---
Follow PEP 8. Use type hints for all function signatures.
```

These live in `.github/instructions/` or its subdirectories. Copilot also supports AGENTS.md natively since August 2025.

## 4. Three architectural patterns

The ecosystem has converged on three patterns for scoping agent instructions:

**Pattern A — co-located.** Instructions live inside content directories as peer files (AGENTS.md model). Instructions travel with content, the filesystem encodes scope, discoverability is natural.

**Pattern B — centralized with glob targeting.** Instructions live in a separate directory (`.cursor/rules/`), targeting content via glob patterns. Clean separation of concerns, content directories stay uncluttered, rules are easier to audit as a whole.

**Pattern C — hybrid.** Central instructions with `applyTo` targeting, plus co-located files possible (Copilot model).

For knowledge repositories, the evidence favors Pattern A. In a knowledge repository organized by discipline, the boundary between content and meta-content is blurry — an instruction file describing "how to reason about quantum mechanics" is itself a knowledge artifact. Co-location treats instruction files as a special kind of content rather than as external configuration.

## 5. Monorepo cascading analogies

The most instructive analogy comes from Bazel's BUILD file model. One BUILD file per directory defines that directory as a "package." A package includes all files in its directory plus subdirectories, except those containing their own BUILD file. No file may belong to two packages.

This maps to knowledge repositories: each discipline module directory is a package with its own BUILD-equivalent (an AGENTS.md), inheriting defaults from the root but defining its own local rules. The Bazel principle that no file may belong to two packages provides useful conceptual clarity: each note belongs to exactly one interpretive context.

Nx uses `nx.json` at the root for workspace defaults that cascade down, with per-project overrides. Turborepo uses a single root config — no per-directory cascading.

## 6. The Codified Context paper

Vasilopoulos (2026) [@vasilopoulos2026codified] presents a three-tier architecture developed across 283 development sessions on a 108,000-line C# system:

**Tier 1 — hot memory (~660 lines).** A constitution loaded into every session: code quality standards, naming conventions, build commands, orchestration protocols.

**Tier 2 — specialized agents (~9,300 lines across 19 agents).** Domain-expert specifications where over half the content is project-domain knowledge (codebase facts, formulas, failure modes) rather than behavioral instructions.

**Tier 3 — cold memory (~16,250 lines across 34 documents).** On-demand specifications retrieved selectively through an MCP service, preventing context window exhaustion.

The paper treats "documentation as infrastructure — load-bearing artifacts that AI agents depend on to produce correct output." This reframes context files from optional guidance into structural dependencies.

**Cautionary finding.** On at least two occasions, outdated context documents caused agents to generate code conflicting with recent refactors. Context drift is a real risk.

A companion evaluation paper found developer-provided context files only improved agent performance by ~4% on average, while increasing costs by 20%+ due to increased exploration. Quality and specificity of context files matter far more than their mere presence.

## 7. Practical examples

**Datadog's monorepo.** The root AGENTS.md acts as a router, not a comprehensive document: "To create an email, read @emails/AGENTS.md." Nested AGENTS.md per domain. `.agents/` directory for cross-cutting concerns. `AGENTS.local.md` (gitignored) for personal overrides. The principle: give the agent only what it needs right now; point to deeper resources as needed.

**Claude Code.** CLAUDE.md files in subdirectories (e.g., `Database/CLAUDE.md`, `API/CLAUDE.md`). `.claude/skills/` directories in nested packages for monorepo setups.

**GitLab.** Root AGENTS.md included in all conversations; `/frontend/AGENTS.md` and `/backend/AGENTS.md` loaded contextually when editing files in those directories.

## 8. Implications for knowledge repositories

In code repositories, agent instructions are procedural: "use pytest, follow PEP 8, run migrations before testing." The instructions are clearly meta-level — they describe how to work with code, not the code itself.

In knowledge repositories organized by discipline, the instructions are epistemic. A per-directory agent instruction file for a mathematics directory might say: "reason constructively; treat all claims as requiring proof; cross-reference with the formal specifications." For a sociology directory: "ground claims in observable structures; cite schools of thought; distinguish analytical from normative statements."

This distinction — procedural vs. epistemic instructions — means that in a knowledge repository, per-directory instruction files are themselves knowledge artifacts. They express disciplinary epistemology. They should be maintained with the same care as other content, visible in the normal editing workflow, and treated as first-class notes.

The ASR's [fragment](../../../../../../../../../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/glossary/terms/fragment.md) concept maps directly: each directory-level instruction file defines a bounded interpretive context in the mathematical sense. A fragment is a finitely generated modal subalgebra of the meaning domain — the smallest subset closed under the operations that matter locally. A per-directory AGENTS.md is the concrete realization of this: it declares what vocabulary, what reasoning style, and what interpretive commitments are active in this part of the repository.

## Sources

- [AGENTS.md specification](https://agents.md/)
- [Cursor rules documentation](https://docs.cursor.com/context/rules)
- [GitHub Copilot custom instructions](https://docs.github.com/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot)
- [Datadog: Steering AI agents in monorepos](https://dev.to/datadog-frontend-dev/steering-ai-agents-in-monorepos-with-agentsmd-13g0)
- [Codified Context paper (arXiv:2602.20478)](https://arxiv.org/abs/2602.20478)
- [Evaluating AGENTS.md (arXiv:2602.11988)](https://arxiv.org/html/2602.11988v1)
- [Bazel: Build concepts](https://bazel.build/concepts/build-ref)
