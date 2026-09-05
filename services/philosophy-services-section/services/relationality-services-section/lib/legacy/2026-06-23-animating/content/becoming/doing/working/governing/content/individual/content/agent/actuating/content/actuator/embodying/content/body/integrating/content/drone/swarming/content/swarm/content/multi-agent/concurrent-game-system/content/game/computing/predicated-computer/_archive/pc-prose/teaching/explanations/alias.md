---
name: alias
description: One predication cell of the form (e, accepts-alias, σ) declaring that an alternate surface form σ resolves to a canonical entity e. The cell-level unit; the catalog of such cells is recorded separately as aliases.
status: draft
---

An **alias** is one [predication cell](../../../../code/structures/predication-cell.md). Specifically: a cell of the form $(e, \text{accepts-alias}, \sigma)$, where $e$ is a canonical [entity](../../../../code/structures/entity.md) addressable by some primary slug, and $\sigma$ is an alternate kebab-case surface form admitted as resolving to $e$. The cell asserts that anywhere $\sigma$ appears in a slug, parser, or reference, the resolution returns $e$.

An alias is **not** the catalog of such cells (that is [[aliases]], plural), and it is **not** the relation $\sim_\text{alias}$ on surface forms (also located at [[aliases]]). An alias is the unit — one declaration, one cell.

## Anatomy of one alias

A single alias-cell has three coordinates:

- The **canonical entity** $e$ — the [entity](../../../../code/structures/entity.md) the alias resolves to. Addressable by its primary slug — i.e., by its canonical record's file basename. Existing somewhere in the [structure](../../../../code/structures/structure.md), [transformer](../../../../code/structures/transformer.md), or concept layer.
- The **predicate** [`accepts-alias`](../../../../code/structures/aliases.md) — the typed [predicate](../../../../code/structures/predicate.md) coordinate declaring this is an alias declaration (rather than, say, a synonymy claim, a retirement record, or a name-history note).
- The **surface form** $\sigma$ — a kebab-case slug, lowercase, hyphens-only. Not already the canonical slug of any other entity.

Adding `aliases: [σ]` to a record's frontmatter authors one such cell. Adding two entries authors two cells. Each entry is one alias.

## Cell-level well-formedness

For a single alias-cell to be well-formed, the surface form $\sigma$ must satisfy:

- It is kebab-case (lowercase ASCII letters, digits, and hyphens; no underscores, no whitespace, no capitals).
- It is not the canonical slug of $e$ itself (declaring something its own alias is redundant and trips repo-wide uniqueness lints).
- It is not the canonical slug of any other entity (this would collide with that entity's canonical resolution).
- It is not also recorded in $e$'s — or any other entity's — `retired-prior-addresses:` list (the surface form is either admissible-for-resolution or retired, not both; see [[aliases]] §9).
- It is genuinely an orthographic variant of $e$'s name. Per the claim [[aliases-are-resolve-pullbacks-of-classical-equality]], this means *orthographic* variation: transliteration variants (e.g., `wolakhota` for `wolakȟota` — see [`wolakhota`](../../../../code/structures/wolakhota.md)), diacritic-stripped forms. It does not mean morphological variation (singular/plural, verb inflection) — those are distinct entities, not aliases.

The first four are mechanical and lintable. The fifth is contributor-judgment discipline; lints can flag candidates that look morphologically derived (plural suffixes, gerund or agent-noun suffixes) but the final call is human.

## What an alias is not

Each item on this list is something the word "alias" sometimes covers in casual usage but does not cover as a record-attested entity here.

- **A synonym** — a different concept that overlaps semantically. [Synonymy](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/synonymy.md) (per the math tree) is a distinct equivalence relation on [predication settlings](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/predication-settling.md), not on surface forms. Synonymous entities are separate entities; their relationship is recorded as a substantive predication, not an alias.
- **A plural form** — `scripts` is not an alias of `script`. They are distinct entities; `script.md` and `scripts.md` are separate records if both senses are needed.
- **A verb form** — `auditing` is not an alias of `audit`. On a [transformer](../../../../code/structures/transformer.md) record, the verb's morphological roles (gerund, agent-noun) are recorded in typed frontmatter fields (`gerund:`, `agent-noun:`), which are *not* aliases. They are typed cells with their own predicates and their own role in the skill naming grammar.
- **An abbreviation** — `docs` is not an alias of `documents`. The no-abbreviation rule forbids this; both forms cannot resolve to the same entity. If `documents` is the canonical form, `docs` is not admissible anywhere.
- **A retired prior name** — a name that was once canonical but has been replaced is recorded under `retired-prior-addresses:`, not `aliases:`. Retired names do not resolve. The distinction is essential per the renaming discipline and the ethics-of-naming considerations surveyed in [[aliases-may-2026]] §10.9.
- **A compatibility shim during a rename** — same as retired prior name. Renaming is a repo edit; the old form is retired, not aliased.

## Why an individual alias matters

A single alias-cell extends the partial resolve function $\rho : \Sigma \rightharpoonup E$ at exactly one input. Without that cell, $\rho(\sigma)$ is undefined; with it, $\rho(\sigma) = e$. The cell is the smallest unit of resolution-discipline authored at repo-edit time.

Per the claim [[aliases-are-resolve-pullbacks-of-classical-equality]], the cell is also the smallest unit through which [identity-by-relations](../../../../code/structures/entity.md) is honored on surface forms: the entity $e$ remains constituted by its predications; the alias-cell adds one more predication about $e$ (that it accepts $\sigma$ as an alternate address); the entity's identity is unchanged by the addition, but its addressability is extended.
