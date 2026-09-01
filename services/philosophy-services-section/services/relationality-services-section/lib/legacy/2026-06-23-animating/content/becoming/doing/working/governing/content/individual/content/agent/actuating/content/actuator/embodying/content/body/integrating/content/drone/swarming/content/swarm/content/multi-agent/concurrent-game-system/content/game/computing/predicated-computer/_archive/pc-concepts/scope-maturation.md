---
type: concept
class: pattern
depends-on: [closure-conditions, scope]
see-also: [entity-maturation, align, depth-filtration]
---

# Scope maturation

The pattern by which a *region* of the substrate — typically a [scope](scope.md) or a [sublocale](sublocale-as-application.md) — progresses from raw declaration to fully-closed completeness by satisfying the [closure conditions](closure-conditions.md) in sequence. Where [entity-maturation](entity-maturation.md) describes the arc of a *single entity* (fleeting → working → settled), scope-maturation describes the arc of an *entire region*: the region accumulates structural commitments — operators, shapes, governance, gluing — until it is a closed sub-substrate.

The named milestones below are the substrate's engineering vocabulary for *which closure conditions a region has reached*. They are not arbitrary: each name marks the specific structural transition the corresponding closure condition produces. The math reformulation behind the milestones is precise — each stage corresponds to a structurally distinct mathematical object — but the engineering content is what the substrate needs to commit to at each stage to claim it.

## The four named milestones

The arc has four distinguished stages, each defined by which closure conditions are satisfied:

- **Outpost.** Conditions 1–4 satisfied. The region admits entities, identity is canonical, composites are present, and operations referenceable from inside the region are themselves entities in it. The mathematical content is the region's *signature* in algebraic-specification terms — a vocabulary of sorts and operations declared, with no axioms yet. An outpost has named operations as first-class objects but no commitments about which configurations are admissible. It is the substrate's region-level analog of "the API surface is published, no governance yet."
- **Blueprint.** Conditions 1–6 satisfied. The region has shapes (condition 5) classifying admissible sub-configurations and structural procedures (condition 6) operating on the region itself. The mathematical content is a [geometric theory](geometric-blueprint.md) over the outpost's signature: signature plus axioms, with no covering policies. A blueprint fully constrains what valid configurations look like, but does not name who operates the region or what counts as comprehensive coverage.
- **Charter.** Conditions 1–6 plus a declared *covering structure*. The region carries a Grothendieck-topology-style declaration of which families of operations together cover the region's scope — in agential settings, who the agents are and what their operational policies are; in non-agential settings, which automated covering predications constitute valid total coverage. The mathematical content is a *site* over the blueprint: a geometric theory equipped with a topology selecting admissible covering families. A charter is structurally complete but has not yet received its first live operations.
- **Locale.** All seven conditions satisfied. The region is live: receiving operations, accumulating sections, gluing compatible local content into globally coherent state. The mathematical content is a *classifying topos* — the full sheaf category over the charter's site, with global sections, internal [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) structure, and the substrate's algebra acting on its content. A locale is the substrate's complete sub-region; the substrate at top scope is itself a locale.

The arc is strictly ordered: each milestone presumes its predecessor's commitments. A region cannot become a charter without first being a blueprint; a region cannot become a locale without first being a charter.

## How a region advances between milestones

The transition from one milestone to the next is a substrate operation, not an emergent property. Per [align](../morphisms/align.md), the substrate's `align` operator advances a region by one closure condition. The transitions:

- **Outpost → Blueprint.** Align to condition 5 (shapes) and then condition 6 (structural procedures). The substrate edits admit the necessary shape records and procedure declarations; the settle phase verifies they apply correctly to the region's existing content.
- **Blueprint → Charter.** Declare the covering structure — for an agential locale, admit an `AGENTS.md` or equivalent agent-community predication; for an automated locale, admit the covering-predication policy. The substrate verifies the covering structure's well-formedness against the blueprint's commitments.
- **Charter → Locale.** Begin live operation: admit messages, settle the resulting state, glue local sections into global content. The transition is condition 7's commitment — that compatible local sections assemble uniquely.

Reverse transitions are not substrate operations. A region cannot be "demoted" from locale to charter; if a locale's coverage breaks, the substrate's [repair](repair.md) discipline records the breakage but the region remains classified as locale-with-repair-pending. The arc is one-way at the substrate level.

## What each stage is good for, what each stage cannot do

The named milestones are operationally useful because each marks distinctive substrate capabilities and limitations:

| Stage | Can do | Cannot do |
|---|---|---|
| Outpost | Hold entities; reference operations; describe what's possible at the region | Validate configurations against shapes; run structural procedures; declare governance; receive coordinated work |
| Blueprint | All outpost capabilities; validate against shapes; run structural procedures; classify sub-configurations | Declare an agent community; have a governing soul; receive live cross-session work |
| Charter | All blueprint capabilities; declare agent community; install governing soul; describe its full operational protocol | Receive cross-session live work; accumulate global memory across sessions; produce coherent global sections |
| Locale | All charter capabilities; receive live work; accumulate cross-session memory; glue local sections into global state; produce coherent observable output | Be deployed without all seven conditions met (becoming a degenerate locale that the substrate flags) |

The capability table is what makes the named milestones operationally meaningful: an engineer wanting a region to do a specific kind of work checks whether the region's current stage permits it. If the work requires a capability the region's stage lacks, the engineering response is to advance the region per `align`.

## Scope maturation across the depth filtration

The four-stage progression sits inside a richer mathematical picture: the substrate's [depth filtration](depth-filtration.md) $R_0 \hookrightarrow R_1 \hookrightarrow R_2 \hookrightarrow \cdots \hookrightarrow R$. Each $R_n$ is a complete relational universe at depth $n$, satisfying all closure conditions up to that depth. Outpost, Blueprint, Charter, Locale are the engineering names for the depths that correspond to the substrate's named structural commitments — they are not separate from the depth filtration but milestones along it.

This is what makes the substrate's region-progression both concrete (the four named stages) and structurally complete (the underlying depth filtration is unbounded). A region claiming to be a locale is at the depth where all seven conditions are satisfied; a region claiming to be a blueprint is at the depth where six are satisfied; a region claiming to be at any other position must declare which conditions it satisfies and which it does not.

## Position in the substrate

Scope maturation is the substrate's *region development arc*. Without explicit naming, "this region is incomplete" is vague; with the named milestones, it is precise — *which* closure condition is unmet identifies the region's current stage and what aligning to the next stage will require. Per [align](../morphisms/align.md), the advancement between stages is a substrate operation; per [witness](witness.md), the advancement is recorded; per [audit](teaching/explanations/events-as-source-of-truth.md), any region's full maturation history is reproducible from the event log.

The pattern composes with [entity-maturation](entity-maturation.md) (its single-entity counterpart, recursively applicable to entities within a region), with [closure-conditions](closure-conditions.md) (which the milestones name and number), and with [depth-filtration](depth-filtration.md) (the underlying mathematical object the milestones inhabit).

A consequence of the pattern is that the substrate is *fractal* in its development: the substrate-as-a-whole undergoes scope maturation; sub-regions within it undergo their own scope maturations independently; entities within sub-regions undergo entity maturation. The same mathematical structure governs all three scales, instantiated at progressively finer granularity.
