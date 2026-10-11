---
description: "Produces a brief orientation to the repository: four departments, dependency order, skill system, and naming convention. Use when a new agent or user needs a one-paragraph-per-topic introduction before asking specific questions."
skill-closure-kind: process
---

# familiarize

Briefly orient a new agent or user to this repository. Do not go deep. The goal
is one short paragraph per topic, enough to ask an informed question.

---

1. Read `AGENTS.md` — the dependency order (math → proof → spec → src), the four
   departments, and the department rule.

2. State the four departments and what each contains:
   - `math/` — unit files, one per mathematical concept; the source of truth
   - `proof/` — Lean 4 formalization of math/ results
   - `spec/` — system specification derived from verified proofs
   - `src/` — implementation of the spec (planned)

3. State the skill system: commands in `.claude/commands/` are thin wrappers.
   Each calls a skill file in the relevant department's `skills/` directory.
   Available commands: `/improve-math`, `/improve-proofs`, `/improve-spec`,
   `/improve-src`, `/familiarize`.

4. State the naming convention: every math unit has an `id` (kebab-case) and a
   `name` (CamelCase of the id). Names follow `spec/naming-spec.md`.

5. Stop. Do not read further files unless the user asks a specific question.
