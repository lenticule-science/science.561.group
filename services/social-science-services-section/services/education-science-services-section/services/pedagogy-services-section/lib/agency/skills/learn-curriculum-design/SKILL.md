---
name: learn-curriculum-design
description: Analyze a subject as a dependency graph, define testable completion criteria for each node, annotate edges with what specifically the prerequisite supplies, and state scope honestly.
requires-capabilities:
  - read
  - path-corpus
  - markdown-search-workbench
  - term-intension
  - read-term-catalog
  - markdown-corpus-workbench
  - relate-relations
---

# Learn Curriculum Design

A curriculum is a dependency graph, not a numbered list. Curriculum design is the work of making the dependency structure explicit, defining what completion of each node means, and being honest about scope.

## When to use

You are building or critiquing a sequence of lessons that together cover a subject. You want to expose the dependency structure (what depends on what), state completion criteria, and avoid the distortions of forced linear ordering.

## How it works

### Dependency graphs over numbered lists

A numbered list pretends a sequence; a dependency graph shows which orderings are possible. Two nodes with no dependency between them can be studied in either order — the graph says so, the numbered list hides it. Shared dependencies likewise become visible only as a graph.

### Completion criteria

For each node, write a *testable* completion criterion. Not "understand X" but "given Y, do Z." If you cannot test it, you cannot say when it's done.

### Edge annotations

Each prerequisite edge carries a specific requirement. State *what* from the prerequisite is needed — not just that it's needed. "Requires the definition of Y and the ability to draw a Z" is an edge annotation; "requires Y" is not enough.

### Scope honesty

Every curriculum centers some knowledge and excludes other knowledge (see `learn-decolonial-pedagogy`). Honest scope says what's covered, what's deliberately excluded, and why those exclusions matter. A curriculum that pretends comprehensive coverage misrepresents itself.

### Spiral curriculum

Some concepts return at deeper levels. A spiral curriculum (Bruner) revisits an idea at successive grades of formality — graphically, this is a node visited multiple times along a deepening trajectory, not a single node studied once.

## Reference

- `library/domains/humanities/domains/education/domains/pedagogy/texts/designing-curricula.md` — the canonical treatment.
- `library/domains/humanities/domains/education/domains/pedagogy/terms/curriculum.md`, `spiral-curriculum.md`, `hidden-curriculum.md` — the term entries.

## Prerequisites

- `learn-lesson-design` — backward design (you need the concept of starting from desired results, applied here at the larger scale of a node-set) and the distinction between teaching and presenting (so you can evaluate whether each node actually teaches).
- `learn-decolonial-pedagogy` — the "whose knowledge?" question (you need this to evaluate scope honestly).

## Verification

Design a small dependency graph (3–5 nodes) for a subject you know well. For each node, write a completion criterion. For each edge, annotate what specifically is required. Identify one place where a numbered list would misrepresent the dependency structure (independent nodes, shared dependencies). State what your curriculum covers and one thing it doesn't.
