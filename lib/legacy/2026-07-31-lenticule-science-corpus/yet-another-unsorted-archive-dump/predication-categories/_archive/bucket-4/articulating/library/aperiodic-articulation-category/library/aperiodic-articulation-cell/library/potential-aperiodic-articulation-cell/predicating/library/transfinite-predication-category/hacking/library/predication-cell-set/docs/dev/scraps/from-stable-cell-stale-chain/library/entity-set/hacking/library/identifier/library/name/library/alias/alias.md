---
name: alias
description: An individual predication cell asserting that an alternate surface form resolves to a canonical entity. One cell of the form (canonical-entity, accepts-alias, surface-form), with cell-level invariants on the surface form's well-formedness.
---

An **alias** is one cell. Specifically, a [predication cell](predication-cell.md) of the form $(e, \text{accepts-alias}, \sigma)$ where:

- $e$ is a canonical repo [entity](entity.md), addressable by a primary slug that is the file basename of some record;
- `accepts-alias` is a typed [predicate](predicate.md) declaring this cell's role;
- $\sigma$ is a kebab-case surface form admissible (per the cell-level invariants below) as an alternate address for $e$.

The cell's value under the [predication valuation](predication-valuation.md) is $\mathbf{t}$ when the alias is in force, $\bot$ when no claim has been made, $\mathbf{f}$ when the alias has been explicitly negated.

## Characteristic predications

Cells uniquely characteristic of an alias:

- `accepts-alias(canonical-entity, surface-form)` — the central predication; declares the alias relation between the entity and the form.
- `has-surface-form(alias, kebab-case-string)` — the surface form as a string-typed value, recovered from the third coordinate of the cell.
- `has-canonical-entity(alias, entity)` — the canonical entity, recovered from the first coordinate.

The cell itself, viewed as a repo entity, is an alias-instance. Its identity is determined by the triple; two cells with the same canonical entity, predicate, and surface form are the same alias.

## Invariants

Cell-level conditions for a single alias to be well-formed:

- **Kebab-case form.** $\sigma$ consists of lowercase ASCII letters, ASCII digits, and ASCII hyphens (`-`). No underscores, no whitespace, no capitalization, no extended-Unicode characters except where admitted by convention (Lakota orthography being the leading case — see [`wolakhota`](wolakhota.md)).
- **Non-self-aliasing.** $\sigma$ is not equal to the canonical slug of $e$ itself. Self-aliasing is redundant — the canonical slug already resolves to $e$ through the canonical-address branch of the resolve function.
- **Disjoint from canonical slugs.** $\sigma$ is not the canonical slug of any other [entity](entity.md). (At the catalog level this is the function-uniqueness invariant; at the cell level it is a well-formedness condition.)
- **Disjoint from retired addresses.** $\sigma$ is not also recorded under `retired-prior-addresses:` on any record. The two predicates' semantics are incompatible.
- **Orthographic-only (editing discipline).** $\sigma$ is a spelling variant of the canonical slug, not a morphological or semantic variant. Enforced at the editing layer, not at the cell-shape layer — the relation $\sim_\text{alias}$ admits any extension of the resolve function (per [[aliases-are-resolve-pullbacks-of-classical-equality]] Theorem 8); the editing discipline narrows.

## Step-induction role

The alias-form earns its place because the resolve function $\rho$ documented at [`aliases`](aliases.md) — the partial mapping from surface forms to entities — needs to be definable at slugs that are not themselves canonical slugs. Without alias-cells, the resolve function is exactly the canonical-address bijection: $\rho(\sigma) = e$ iff $\sigma$ is the file basename of $e$'s canonical record. With alias-cells, $\rho$ extends to admit alternate surface forms.

Each alias-cell adds one input to $\rho$'s domain. Most records carry no alias-cells. The cells exist for the small set of cases (chiefly Lakota transliteration variants and diacritic fallbacks) where multiple admissible spellings name what is genuinely one entity.

## The alias-invocation operator

There is no operator on a single alias-cell beyond the cell's existence-or-absence in the repo. An alias does not "fire" the way a [closure-rule](closure-rule.md) does; it is consulted by the resolve function as repo content. The act on the cell is:

- **Author** — a repo edit (typically frontmatter modification on the canonical record) inserts the cell into the repo.
- **Read** — the resolve function, when computing $\rho(\sigma)$, reads the catalog of alias-cells and returns $e$ if $\sigma$ is the surface-form coordinate of any cell.
- **Retire** — a repo edit removes the cell from the repo. Distinct from retiring the surface form (which moves it to `retired-prior-addresses:`); retiring the cell removes the alias declaration without recording history.

The cell is read substantially more often than it is authored. Lints and naming-grammar parsers consult the catalog on every reference; authoring is a one-time repo edit per alias.

## Not synonymous with

- **Synonym** — a different entity with overlapping meaning. Synonyms are substantively related entities, not surface forms of one entity. Their relationship is recorded by relations like `closely-relates-to`, not by `accepts-alias`. Note also the math tree's [synonymy](../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/synonymy.md), which is an equivalence on [predication settlings](../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/predication-settling.md) — distinct from $\sim_\text{alias}$ at a different level of the predication-hyperdoctrine.
- **Plural form** — `scripts` and `script` are distinct entities. Plural forms are not aliases of singulars.
- **Verb morphology** — `auditing` (gerund) and `auditor` (agent-noun) on a [transformer](transformer.md) record are typed cells with their own predicates (`gerund-form-of`, `agent-noun-form-of`), not aliases. They have specific roles in the skill naming grammar per the transformer and skill specs.
- **Abbreviation** — `docs` for `documents` is forbidden by the no-abbreviation rule. Aliases admit spelling variants, not truncations.
- **Retired prior address** — a name that was once canonical but has been replaced. Recorded under `retired-prior-addresses:`, not under `aliases:`. Retired forms do not resolve.
