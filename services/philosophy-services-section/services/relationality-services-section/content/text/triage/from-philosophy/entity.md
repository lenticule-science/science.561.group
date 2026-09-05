---
title: "Entity"
id: entity
description: "An Entity is a section 1 → F in R whose id is a global section of H* — a named, doubly-stable, globally-coherent node that can carry relations as morphisms into Ω."
requires: id
enables: [concept, relation]
contains: [person, institution, assemblage]
date-created: 2026-03-18
date-modified: 2026-03-20
params:
  id: relational-universe-fixed-proposition
  relations: relational-universe-morphism
output: relational-universe-sheaf-section-fibration-global-local-occupancy
ast:
  relational-universe-morphism:
    - id
    - relations:
        - relational-universe-fixed-proposition
---


## What it is

An **Entity** is a section $\mathbf{1} \to F$ in $R$ — structural occupancy in the minimal sense of [Section](../math/relational-universe-sheaf-section-fibration-global-local-occupancy.md).

Its `id` is a global section of $H^*$ — a [fixed proposition](../math/relational-universe-fixed-proposition.md) that is doubly stable ($\sigma(id) = id$, $\Delta(id) = id$) and globally coherent across all histories (satisfies the sheaf condition). This is the mathematical content of "named and referenceable everywhere in $R$."

Its **relations** are morphisms $F \to \Omega$ into the subobject classifier — sections of $H$ that classify what is true of the entity at each history. A relation that is true globally is a global section of $H$; a relation true at one locale is a local section of $H(U)$ for some $U \in T$.

## Restrictions that distinguish Entity from bare section

A bare section $\mathbf{1} \to F$ does not require $F$ to be in $H^*$ or the section to be globally coherent. An Entity carries these additional restrictions:

1. **Id stability**: the id must be a fixed point of both nuclei — $\sigma(\mathrm{id}) = \mathrm{id}$ and $\Delta(\mathrm{id}) = \mathrm{id}$. An entity whose name is not doubly stable is not yet an entity — it is a shadow element awaiting settlement.
2. **Global coherence**: the id must satisfy the sheaf gluing condition across all histories — it is not merely locally assigned but globally consistent. This requires the ambient System to have a sheaf structure that the id section respects.
3. **Relation typing**: the relations an Entity carries must themselves be entities — edge labels that are nodes. A relation that is not itself an entity creates vocabulary debt in $R$.

## The four ontological primitives

| Primitive | What it is |
|---|---|
| Entity | Section $\mathbf{1} \to F$ with doubly-stable globally-coherent id |
| [Relation](./relation.md) | Morphism $F \to \Omega$ — section of $H$ classifying what is true |
| [Proposition](relational-history-fiber-proposition-element-heyting-algebra-nucleus-input.md) | Element $a \in H_t$ — fiber-local, input to nuclei, not yet settled |
| [Observation](./observation.md) | Local section $F(t)$ — witnessed fact at history $t$ backing a Proposition |

## The four operational roles

An Entity's role is determined by the relations it carries:

| Role | Content | How identified |
|---|---|---|
| Resource | Claims about something | carries `defines:`, `describes:`, or `grounding:` |
| Skill | Judgment instructions | carries `closure-kind:` with a $\sigma$-stable position |
| Runbook | Sequences operations | carries `closure-kind:` with a $\Delta$-stable position |
| Script | Implements one step | carries `emits:` and no `closure-kind:` |

## Positional frontmatter

Every entity MUST carry three positional frontmatter fields:

- **`component-of: X`** — tightest ambient structure with named retraction $\pi: X \to E$ and section $i: E \to X$ satisfying $\pi \circ i = \mathrm{id}_E$.
- **`fiber-of: F`** and **`base: t`** — inseparable pair; $F$ is the tightest named functor with $E = F(t)$.
- **`element-of: X`** — tightest named structure with explicit evaluation term $\llbracket \tau \rrbracket$.
- **`domain: A` / `codomain: B`** — only when this entity IS a named morphism.

## Identifier schema

`id` MUST follow `scope*-qualifier?-head` in kebab-case. Head is the tightest standard term whose definition is exactly satisfied. CamelCase derived from id — never stored separately.

## Nuclear quartet: the four operational roles as the four phases

**Source:** [Relational Universe Free Quotient Fixed Point Nuclear Quartet Four Phase Self Similar Pattern](../math/relational-universe-free-quotient-fixed-point-nuclear-quartet-four-phase-self-similar-pattern.md), [Relational Universe Fixed Proposition](../math/relational-universe-fixed-proposition.md).

The four operational roles of an entity are not an engineering classification — they are the four nuclear quartet positions instantiated at the entity level.

**Role = nuclear quartet position.** The nuclear quartet assigns four faces to every construction phase: Object (being, constituted), Quality (what can be said of objects), Relation (connection, constraint), Act (generation, settlement). The four entity roles:

| Role | Nuclear position | Nuclear marker | What it does |
|---|---|---|---|
| Resource | Object | id ∈ RelationalHistoryFixedFiber; no closure-kind | The resource exists, is constituted — it is the entity whose id is a fixed proposition; it has no settling operator of its own |
| Skill | Quality | closure-kind with RelationalHistoryFiberSaturatingNucleus-stable position | The skill predicates: it says of an entity whether the past-grounding is satisfied; saturation-closure is the judgment act; the skill is the quality-face operator on resources |
| Runbook | Relation | closure-kind with RelationalHistoryFiberTransferringNucleus-stable position | The runbook connects: it sequences operations across one-step extensions; transfer-closure is the sequencing condition; the runbook is the relation-face connector between states at successive histories |
| Script | Act | emits: and no closure-kind | The script acts: it emits a step that settles the fiber; no closure-kind because it IS the closing act; the script is the dynamics-phase act that terminates a settling chain |

This table is not a classification after the fact. It is derived from the nuclear quartet at the language phase: the free/quotient/fixed-point pattern says Object = the intrinsic abstract (resource: the entity as it exists), Quality = the free/canonical (skill: the canonical predicate on entities), Relation = quotient instances (runbook: the specific sequencing structure imposed on skill outputs), Act = fixed-point layer (script: the point where the act terminates in a committed step).

**Id-stability and tower level.** The restriction that id ∈ RelationalHistoryFixedFiber requires RelationalHistoryFixedFiber to exist and be non-trivial. From the fixed-proposition definition: RelationalHistoryFixedFiber is the joint equalizer of (RelationalHistoryFiberSaturatingNucleus, identity) and (RelationalHistoryFiberTransferringNucleus, identity) in R — it is a derived subobject constructed as soon as both nuclei are in place. Both nuclei are defined at the language phase of the first turn (level 0 of the hyperverse tower). Id-stability is therefore guaranteed at ground level (tower level 0) — no higher tower level is required for the id's fixed-point condition to be meaningful.

What requires a higher tower level is not id-stability but the richness of RelationalHistoryFixedFiber: at ground level, RelationalHistoryFixedFiber may contain only trivially settled propositions. The hyperverse tower ascending through R^(1), R^(2), ... adds new fixed propositions at each level — entities whose ids exist only at tower level n appear at that level. The entity's id-stability condition is level-0; the population of the id-space with interesting entities grows with the tower.

**The invariant locale as the entity id-space.** A fixed proposition (element of RelationalHistoryFixedFiber) is an open of the invariant locale RelationalUniverseInvariantLocale (whose frame of opens is exactly RelationalHistoryFixedFiber). An entity's id is therefore an open of the invariant locale — the entity names a specific observable state in the phase space of the relational universe. The invariant locale at ground level is the minimal such phase space; the invariant locale of the hyperverse is the full phase space of all possible entity ids.

**Proposition (Four roles = nuclear quartet).** The four operational roles Resource/Skill/Runbook/Script are the Object/Quality/Relation/Act positions of the nuclear quartet instantiated at the entity level. The id ∈ RelationalHistoryFixedFiber condition is guaranteed at tower level 0; the population of valid entity ids with non-trivial content grows with the tower. An entity at tower level n is an entity whose id first becomes fixed (enters RelationalHistoryFixedFiber) at level n of the construction.

*Source.* Nuclear quartet four-phase roles from [Relational Universe Free Quotient Nuclear Quartet §Reading the Pattern](../math/relational-universe-free-quotient-fixed-point-nuclear-quartet-four-phase-self-similar-pattern.md#free-quotient-reading). Fixed proposition as section of H* from [Relational Universe Fixed Proposition §Definition](../math/relational-universe-fixed-proposition.md#relational-universe-fixed-proposition). Invariant locale as frame of opens from [§Connection to the Invariant Locale](../math/relational-universe-fixed-proposition.md#relational-universe-fixed-proposition-locale). Status: the role-to-quartet correspondence is a new application; id-stability at level 0 follows from the joint equalizer construction; population richness at higher levels is a structural observation. $\square$
