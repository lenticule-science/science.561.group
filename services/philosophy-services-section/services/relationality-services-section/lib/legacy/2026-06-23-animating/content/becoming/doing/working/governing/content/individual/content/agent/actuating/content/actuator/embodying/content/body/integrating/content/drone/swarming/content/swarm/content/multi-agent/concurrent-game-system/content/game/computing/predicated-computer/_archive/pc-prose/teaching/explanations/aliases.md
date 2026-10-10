---
name: aliases
description: The catalog of alias-cells, either per-record or substrate-wide; equivalently the binary relation between surface forms and canonical entities induced by those cells. Carries the catalog-level invariants — function-uniqueness, no-chain, no-alias-and-retired — that the resolve function depends on.
status: draft
---

**Aliases** is the catalog. Where [[alias]] is one [predication cell](../../../../code/structures/predication-cell.md), *aliases* is a collection of them — either the catalog *of one record* (the cells in that record's `aliases:` frontmatter list) or the catalog *of the whole substrate* (the union of all alias-cells across all records). The same word also names the binary relation $\sim_\text{alias}$ on surface forms that the catalog induces.

The plural is load-bearing. The properties most relevant to substrate-edit discipline — function-uniqueness of resolution, the no-chain rule, the no-alias-and-retired invariant — are properties of the catalog, not of any individual cell. The singular form is the unit of authorship; the plural form is the unit of constraint.

## The catalog has two scopes

A record's `aliases:` frontmatter field declares its **per-record catalog**: the set of alias-cells in which that record's canonical entity appears as the canonical-entity coordinate. A record with `aliases: [a, b, c]` has a per-record catalog of three cells.

The **substrate-wide catalog** is the union of all per-record catalogs across `code/structures/`, `code/transformers/`, `prose/concepts/`, and any other record-bearing directory. This is what the resolve function $\rho$ traverses when a surface form doesn't match a file basename directly: walk the substrate, check each record's `aliases:`, return the first hit.

## Aliases is also a relation

Viewed as a binary relation, $\sim_\text{alias} \subseteq \Sigma \times \Sigma$ on surface forms:

$$\sigma_1 \sim_\text{alias} \sigma_2 \iff \rho(\sigma_1) = \rho(\sigma_2)$$

— two surface forms are alias-related when they resolve to the same canonical entity. The claim [[aliases-are-resolve-pullbacks-of-classical-equality]] establishes that this relation is the pullback of [classical equality](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/classical-equality.md) on entities along the resolve function via the [predicate-specialization](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/transformers/predicate-specialization.md) construction, and that it is an equivalence relation (reflexive, symmetric, transitive on $\text{dom}(\rho)$).

The catalog and the relation are two views of the same data: the catalog is the *list of facts*; the relation is the *equivalence classes* those facts induce. A complete catalog determines a unique relation, and vice versa.

## Catalog-level invariants

These are properties the substrate-wide catalog must satisfy. Each is stated as the inverse of a substrate condition that lints check for.

- **Function-uniqueness of $\rho$.** No surface form is alias of two distinct entities. Equivalently: across all per-record catalogs, no $\sigma$ appears in more than one record's `aliases:` list. This is what makes $\rho$ a function rather than a multi-valued relation.

- **No-self-aliasing.** A record's `aliases:` list does not contain its own canonical slug. Self-aliasing is redundant (the canonical slug already resolves to the entity through the canonical-address branch) and trips the uniqueness invariant against itself.

- **No-alias-of-canonical.** No surface form in any record's `aliases:` list is also the canonical slug of some other record. This is a special case of uniqueness violation: the surface form would resolve to two entities, one through the canonical-address branch and one through the alias branch.

- **No-chain by construction.** Per Theorem 4 of the claim, if function-uniqueness holds, no surface form can simultaneously be canonical-for-one-entity and alias-of-another. Aliases of aliases are structurally impossible: catalogs are flat hub-and-spoke, not transitive chains.

- **No-alias-and-retired.** No surface form appears in both `aliases:` and `retired-prior-addresses:` anywhere in the substrate. Retired forms do not resolve; the two fields' semantics are incompatible.

The first three are mechanical lints over the substrate-wide catalog. The fourth follows from the first three (a theorem, not an additional check). The fifth requires joining `aliases:` data with `retired-prior-addresses:` data.

## What the catalog admits at the editing layer

Authoring a new entry in any record's `aliases:` list is a substrate edit. The editing discipline admits only **orthographic** variation:

- Transliteration variants where one entity has multiple conventional spellings (the [`wolakhota`](../../../../code/structures/wolakhota.md) structure carries one such Lakota term whose ASCII-only fallback is alias-related to its diacritic-bearing form).
- Diacritic-stripped fallbacks where ASCII-only conventions strip accents.

The catalog does *not* admit at the editing layer:

- Morphological variation. Singular/plural are distinct entities; verb forms (gerund, agent-noun, past tense) are typed cells on the [transformer](../../../../code/structures/transformer.md) record with their own predicates, not aliases.
- Semantic variation. Synonyms are distinct entities related by substantive predications, not aliases. See the math tree's [synonymy](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/concepts/synonymy.md) for the distinct equivalence on [predication settlings](../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/predication-settling.md).
- Abbreviation. Per the no-abbreviation rule, `docs` is not admissible anywhere; `documents` is the canonical form.
- Compatibility shims for renames. Renamed forms go to `retired-prior-addresses:`, not `aliases:`. See §9 of [`aliases`](../../../../work/governance/rules/specifications/aliases.md).

This discipline is narrower than the math admits (per Theorem 8 of the claim). The math admits any extension of $\rho$; the editing discipline accepts only orthographic. The narrowing is implemented at the substrate-edit level: lints, contributor review. It is not built into the math because doing so would conflate a specific editing constraint with the formal definition of the alias relation.

## Where aliases live: the canonical-on-structure rule

For an entity with both a math layer ([`code/structures/<name>.md`](../../../../code/structures/)) and other layers, the `aliases:` field lives on the structure record. Concept and specification records for the same entity do not duplicate the field.

For an entity that exists only at the concept layer (purely adjectival modifiers like `rust` or `predicated`, which have no math), the `aliases:` field lives on the concept record.

For [transformer](../../../../code/structures/transformer.md) records, the `aliases:` field is for orthographic variants only — distinct from the typed morphological fields (`gerund:`, `agent-noun:`), which are not aliases.

The canonical-on-structure rule resolves a question the math leaves open (the per-record catalog could live anywhere) by appealing to layer-priority: the math layer is the most authoritative substrate-resident record of an entity, so the catalog of alias-cells about that entity lives there.

## The catalog drives resolution

The resolve function $\rho$ is computed from the catalog. For each query slug:

1. Try the canonical-address branch: does any canonical record have this as its file basename? Return that entity.
2. If not: walk the catalog. For each record's `aliases:` list, check whether the slug is an entry. Return the first hit.
3. If neither: $\rho$ is undefined on this slug.

Function-uniqueness (the catalog-level invariant) is what guarantees this procedure is well-defined: under uniqueness, exactly one record's catalog can contain any given alias-form, so the walk produces a unique answer.

Practical implementation caches this as an inverse index $\Sigma \to E$ regenerated on substrate edit. The cache *is* $\rho$; the catalog is its specification.
