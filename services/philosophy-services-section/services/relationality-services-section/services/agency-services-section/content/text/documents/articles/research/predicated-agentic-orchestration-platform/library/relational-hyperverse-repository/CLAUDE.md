---
title: CLAUDE.md
description: Rules for agents working in this repository.
---
# CLAUDE.md

Rules for agents working in this repository.
Read `AGENTS.md` for orientation.

## Hard rules

**Frontmatter has two required fields and two optional kinds.** `id` and `description` are required on every unit.
Hyphenated keys make logical claims about the file's content.
Underscored keys (`math_symbol`, `lean_file`, `aliases`) are annotations.
No other fields.
Full schema: `spec/frontmatter.md`.

**Never number anything.** No "Theorem 3", no "§2.1".
Use descriptive names.
(Numbered lists within prose are fine — "satisfying: 1. extensivity, 2. idempotence" is a list, not a numbering system.)

**Cross-references are markdown links.** Use `[unit-id](relative/path/to/file.md)` to reference another unit.
Define link targets with `{#anchor-id}` on headers when deep-linking within a file.
Do not use `§id` syntax — that is non-standard and not clickable.

**Prefix order is natural.** $t \leq t'$ means $t'$ has more history.
Do not reverse.

**Presheaves are contravariant.** Restriction maps go $H_{t'} \to H_t$ for $t \leq t'$.

**Heyting implication is $\Rightarrow_t$.** Distinct from $\to$ (metalevel arrow), `FiberNuclearLanguage` function types, and set-theoretic $\Rightarrow$.
Different things at different levels.

**FiberNuclearLanguage is the nuclear fiber language.** Internal propositional language of the fiber Heyting algebras with two KZ modal operators ($\mathsf{Saturate}$, $\mathsf{Transfer}$).
Not a general-purpose $\lambda$-calculus.

**Morphisms in $T$ are the prefix order.** Rewriting identifies objects (equivalence classes); it does not produce arrows.

**math/ is pure mathematics.** No Lean, proof assistants, code, or tooling references belong in unit files.
Planning docs (`PLANS_*.md`, `IDEAS.md`) are exempt.

**The two towers are distinct.** The depth-filtration tower builds $R$ within a fixed $T$.
The hyperverse tower builds $\mathcal{H}$ by iterating $U_\mathcal{H}$ across universes.
Do not conflate them.

**Naming a file is an instruction to create it.** When the operator names a file path (existing or not), treat it as "create this file fully and properly if it doesn't exist, following all applicable specs and frontmatter rules."
Do not ask.
Do not stub.
