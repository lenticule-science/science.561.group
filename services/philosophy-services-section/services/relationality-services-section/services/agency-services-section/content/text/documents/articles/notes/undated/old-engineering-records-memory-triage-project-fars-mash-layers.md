---
name: project_fars-mash-layers
description: FARS is the file substrate with its own hooks/tools. MASH is the virtual environment users operate in. Most hooks are FARS hooks; only a couple are MASH hooks.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
title: project_fars-mash-layers
---

FARS and MASH are two distinct tool systems living under `operations/engineering/fars/`:

- **FARS** (Flatfile Agential Resource System) is the substrate: resource entities as markdown files, relations as frontmatter keys, operations as scripts. Most of our hooks are FARS hooks — they operate on the file substrate (frontmatter checking, file warnings, config protection, quality checks). FARS tools: `tools/fars/docs/terms/` has 119 terms specifying how the substrate works.

- **MASH** (Multi-Agentic Semiotic Hub) is the virtual environment in which users of the system are operating. It's what makes the repo feel like a world you're in rather than a pile of files you're searching. Currently we have maybe two MASH hooks (context-injector, skill-matcher) — the rest is FARS. MASH tools: `tools/mash/docs/terms/` exists but is empty; the concepts need to be defined through use.

The distinction matters for colocation: hooks, commands, and skills should live with the tool system they depend on. A hook that validates frontmatter is a FARS hook. A hook that composes the user's operational context is a MASH hook. A skill that teaches how to write a term is a FARS skill. A skill that teaches how to navigate domains is a MASH skill.

**Why:** The user corrected the conflation of MASH with "the harness." The harness is engineering infrastructure. MASH is what the user experiences. Most of what we've built is FARS tooling; MASH barely exists yet.

**How to apply:** When building new hooks/skills/commands, ask: does this operate on the file substrate (FARS) or on the user's environment (MASH)? Colocate accordingly. Skills may eventually mirror library domain structure under operational domains — a writing skill belongs with writing tools, not in a flat skills/ directory.
