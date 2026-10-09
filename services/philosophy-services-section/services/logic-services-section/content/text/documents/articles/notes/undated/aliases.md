---
name: aliases
description: The catalog of alias-cells, either per-record or substrate-wide; equivalently the binary relation between surface forms and canonical entities induced by those cells. Carries the catalog-level invariants (function-uniqueness, no-chain, no-alias-and-retired) that the resolve function depends on.
title: aliases
---

**Aliases** is the catalog of [alias](alias.md)-cells, indexed and addressable. The same word names both:

- the **catalog** — a collection of alias-cells, viewed as a substrate-resident object;
- the **relation** $\sim_\text{alias}$ on surface forms — the binary equivalence relation induced by the catalog.

The two are two presentations of the same data: the catalog is the *extensional list*; the relation is its *equivalence-class structure*. The math of [[aliases-are-resolve-pullbacks-of-classical-equality]] addresses the relation; this structure record covers the catalog and its invariants.

## Characteristic predications

Cells uniquely characteristic of an aliases-catalog:

- `is-aliases-catalog-of(catalog, entity)` — per-record catalog: the cells whose canonical-entity coordinate is this entity. Each record's `aliases:` frontmatter field witnesses this catalog.
- `is-substrate-aliases-catalog(catalog, substrate)` — substrate-wide catalog: the union of per-record catalogs over all records. There is exactly one such catalog per substrate state.
- `contains-alias(catalog, alias-cell)` — membership relation; the catalog contains the alias-cell as one of its elements.
- `induces-relation(catalog, equivalence-relation)` — the catalog viewed extensionally induces a unique equivalence relation on its surface forms; this is the $\sim_\text{alias}$ relation of the claim.

## Invariants

Each invariant is the inverse of a substrate condition that lints check for.

**Function-uniqueness of the resolve function.** Across the substrate-wide catalog, no surface form $\sigma$ appears in two distinct alias-cells with distinct canonical entities. Formally: if $(e_1, \text{accepts-alias}, \sigma)$ and $(e_2, \text{accepts-alias}, \sigma)$ both hold, then $e_1 = e_2$. This is what makes the resolve function $\rho : \Sigma \rightharpoonup E$ a function rather than a multi-valued relation. Per Theorem 1 of the claim, the alias relation is the resolve-pullback of [classical equality](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/name/theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/classical-equality.md) on entities — that pullback is well-defined only when $\rho$ is a function.

**No self-aliasing.** For any record with canonical slug $\sigma_0$ and alias catalog $A$, $\sigma_0 \notin A$. The canonical slug already resolves to the entity through the canonical-address branch; including it in the alias catalog would duplicate the cell and trip uniqueness against the canonical-address branch.

**No alias-of-canonical.** For any surface form $\sigma$ in any record's alias catalog, $\sigma$ is not the canonical slug of any other record. Formally: $\sigma \in A_e \implies \sigma$ is not the file basename of any canonical record other than $e$'s. This is the cross-branch case of function-uniqueness: the canonical-address branch and the alias-walk branch of $\rho$ must not assign $\sigma$ to different entities.

**No chains by construction.** If function-uniqueness holds, then no $\sigma$ is simultaneously canonical-for-one-entity and alias-of-another. Therefore alias chains (the situation where $\sigma_1$ aliases $\sigma_2$ and $\sigma_2$ aliases $e$) are structurally impossible: the would-be intermediate $\sigma_2$ cannot be both canonical and alias. This is Theorem 4 of the claim, derived rather than imposed.

**No alias-and-retired.** No surface form appears in both an `aliases:` list and any `retired-prior-addresses:` list. The predicates `accepts-alias` and `retired-prior-address-of` are semantically incompatible: the first admits the form for resolution; the second records that the form was once canonical but does not admit it now.

## Step-induction role

The aliases-form earns its place because the catalog-level invariants are global properties that must attach to a substrate-resident object. Individual [alias](alias.md)-cells are local; properties like function-uniqueness and no-chain are global. Without aliases-as-catalog, these invariants would have no entity to attach to, which would not match identity-by-relations (invariants are recorded on entities, not on substrate-level meta-objects).

The catalog is also what the resolve function is computed against. The resolve transformer (when authored; currently substrate-deferred work) takes a surface form, consults the aliases catalog, and returns the canonical entity or undefined. Without an explicit catalog entity, the transformer has no domain object to read.

## The relation $\sim_\text{alias}$

Viewing the catalog as a relation, for $\sigma_1, \sigma_2 \in \Sigma$:

$$\sigma_1 \sim_\text{alias} \sigma_2 \iff \exists e \in E. \; (\sigma_1 = e\text{'s canonical slug or } (e, \text{accepts-alias}, \sigma_1) \in \text{catalog}) \;\land\; (\sigma_2 = e\text{'s canonical slug or } (e, \text{accepts-alias}, \sigma_2) \in \text{catalog})$$

— two surface forms are alias-related when there is a common canonical entity to which they both resolve. Equivalently, by Theorem 1 of the claim, $\sigma_1 \sim_\text{alias} \sigma_2 \iff \rho(\sigma_1) = \rho(\sigma_2)$.

The relation is reflexive on $\text{dom}(\rho)$, symmetric, and transitive (per Theorem 2 of the claim). It partitions $\text{dom}(\rho)$ into equivalence classes, each class being the set of surface forms resolving to one canonical entity.

## Resolution as catalog-traversal

The resolve function $\rho$ is computed against the substrate-wide catalog as follows:

1. **Canonical-address branch.** If $\sigma$ is the file basename of some canonical record, $\rho(\sigma)$ is that record's canonical entity.
2. **Alias branch.** Else, walk the catalog: for each record's `aliases:` field, check whether $\sigma$ is an entry; the first match returns that record's canonical entity.
3. **Undefined.** If neither branch produces a hit, $\rho(\sigma)$ is undefined.

By function-uniqueness (the first invariant), at most one branch produces a hit, and if branch 2 produces a hit, only one record's catalog can contain the form. The procedure is well-defined.

Implementations typically cache this as an inverse map $\Sigma \to E$ regenerated on substrate edit. The cache is the operationalized resolve function; the catalog is its specification.

## Not synonymous with

- **Synonymy** in the sense of the math tree's [synonymy](../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/mutually-locally-derivable/content/synonymy/synonymy.md): an equivalence relation on [predication settlings](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/name/theories/humanities/theories/math/theories/categories/theories/predication-categories/code/structures/predication-settling.md), not on surface forms. Synonymy classifies entire substrate states up to dynamic equivalence; aliases classifies surface forms up to coincident resolution. Per Theorem 5 of the claim, the two live at structurally distinct levels of the [predication-hyperdoctrine](../../research/2026/07/31/lenticule-import/yet-another-unsorted-archive-dump/predication-categories/_archive/bucket-4/articulating/library/aperiodic-articulation-category/library/aperiodic-articulation-cell/library/potential-aperiodic-articulation-cell/predicating/library/transfinite-predication-category/hacking/library/predication-cell-set/docs/dev/scraps/from-stable-cell-stale-chain/library/entity-set/hacking/library/identifier/library/name/library/aliases/predication-hyperdoctrine.md).
- **Contextual identity** (e.g., lenticular lenses in the linked-data literature): admits context-dependent equivalence. The aliases catalog under the editing discipline is context-independent: an alias holds in all contexts in which it has been authored.
- **Co-reference** in NLP: discourse-internal references resolved per-document. Lives outside the substrate; the aliases catalog is substrate-resident.
- **The retirement record** (`retired-prior-addresses:`): records prior canonical forms that no longer resolve. Disjoint from aliases by the no-alias-and-retired invariant.
