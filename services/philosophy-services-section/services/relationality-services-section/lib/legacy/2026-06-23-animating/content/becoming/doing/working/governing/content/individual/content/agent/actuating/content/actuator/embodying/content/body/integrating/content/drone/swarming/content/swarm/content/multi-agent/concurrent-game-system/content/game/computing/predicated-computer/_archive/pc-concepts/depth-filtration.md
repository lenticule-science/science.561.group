---
type: concept
class: structure
depends-on: [closure-conditions, scope-maturation]
see-also: [align, entity-maturation, geometric-blueprint]
---

# Depth filtration

The substrate's mathematical structure that organizes regions by *which closure conditions* they satisfy. The substrate at the top scope is not built all at once; it is the colimit of an ascending chain of progressively-more-complete sub-substrates, each satisfying additional closure conditions. The chain is the *depth filtration*:

$$R_0 \hookrightarrow R_1 \hookrightarrow R_2 \hookrightarrow \cdots \hookrightarrow R = \varinjlim_n R_n$$

Each $R_n$ is a complete relational universe at *depth* $n$ — every entity in $R_n$ is a valid, complete entity at that depth, satisfying the first $n$ closure conditions. The substrate's full structure $R$ is the colimit of the chain — the union of all the depths, with structure inherited from each.

The framing matters because it tells the substrate's engineering *what depth* a given region is at, what it can do at that depth, and what advancing to depth $n+1$ requires. The substrate's [scope-maturation](scope-maturation.md) milestones (Outpost, Blueprint, Charter, Locale) are named landmarks along the depth filtration; the substrate's [align](../morphisms/align.md) operator is what advances a region from $R_n$ to $R_{n+1}$.

## What each depth contains

The substrate's filtration corresponds to the seven [closure conditions](closure-conditions.md), each adding structural content:

| Depth | Conditions satisfied | Substrate-level content the depth supports |
|---|---|---|
| $R_0$ | Bare carrier | Entities admitted but no closure structure |
| $R_1$ | Atom admission | Primitive entities present; identity not yet canonical |
| $R_2$ | + Identity closure | Canonical identity by participating relations |
| $R_3$ | + Composite closure | Joinings of entities are themselves entities |
| $R_4$ | + Reference closure | Operations are entities; first-class procedure references |
| $R_5$ | + Constraint classification | Shapes classify sub-configurations; admissibility is internal |
| $R_6$ | + Procedure closure | The region's own procedures are in the region |
| $R_7 = R$ | + Coherence closure | Compatible local sections glue into global content; full sheaf condition |

The depths are inclusive: $R_n \subseteq R_{n+1}$, with the inclusion preserving every entity and every predication. Advancing depth never retracts content; it only adds structural commitments to existing content.

## Why the filtration is a colimit, not a union

The depth filtration is presented as $R = \varinjlim_n R_n$ — a *colimit* in the categorical sense — rather than a set-theoretic union. The reformulation is meaningful: the colimit construction respects the substrate's structural maps (restriction maps, closure operators, gluing morphisms) rather than just merging contents at the set level.

Three consequences:

- **Every entity is at some depth.** An entity in $R$ enters at the depth where the closure conditions defining it become satisfied. An entity carrying only `id` and `description` is at depth $\geq 2$; an entity with named operations as first-class objects is at depth $\geq 4$; a fully-closed entity (with shapes, structural procedures, covering policies, and live sections) is at depth $7$. The substrate's audit can identify the depth of any entity by inspecting its content.
- **Restriction across depths is meaningful.** An entity at depth $n+1$, when restricted to depth $n$ (forgetting the structural content that condition $n+1$ added), is the same entity at depth $n$. The forgetting is a substrate operation — it produces a coarser view of the entity that is still a valid view at the lower depth.
- **The colimit captures self-generation.** The substrate's $R = U_G(R)$ self-generation property (per [self-representation](self-representation.md)) is a fixed-point property at the limit. At any finite depth $R_n$, the substrate's self-generation is *partial* — some structural elements (axioms, agents, governance) live at depths above $n$ and are not yet self-represented. Only at the colimit $R$ does every structural element become an entity. This is the substrate-level reformulation of the substrate being its own metalanguage.

## How regions sit in the filtration

A region of the substrate (a [scope](scope.md), a [sublocale](sublocale-as-application.md)) sits at *some specific depth* in the filtration. The depth is determined by which closure conditions the region has satisfied; per [scope-maturation](scope-maturation.md), the four named milestones identify specific depths:

- A region at *Outpost* maturation sits at depth 4: conditions 1–4 satisfied, condition 5 (shapes) not yet present.
- A region at *Blueprint* maturation sits at depth 6: conditions 1–6 satisfied; the region has its full geometric theory but no covering structure.
- A region at *Charter* maturation sits between depth 6 and depth 7: the geometric theory is in place plus a Grothendieck topology is declared, but the sheaf condition (compatible sections gluing into global content) has not yet been live-tested.
- A region at *Locale* maturation sits at depth 7: all conditions satisfied; the region is a full sub-substrate.

The substrate may simultaneously contain regions at different depths. A region at $R_4$ does not block a sibling region from being at $R_7$; the substrate's coherence does not require uniform depth. What is required is that each region's *claimed* depth is checkable against its content.

## Engineering use of the framing

The depth-filtration framing produces several substrate-level commitments:

- **Depth is a queryable substrate property.** A query "what depth is this region?" is a substrate operation: traverse the region's content, check which closure conditions are satisfied, return the maximum $n$. The depth is not metadata stored separately; it is a derivation from the substrate's content.
- **Advancement is the act of depth-increase.** Per [align](../morphisms/align.md), advancing a region from $R_n$ to $R_{n+1}$ is a substrate operation: admit the predications expressing the next condition's commitments, settle the resulting state. Each advancement produces a witness; the chain of advancements is the region's *depth history*.
- **Depth bounds capability.** A region at depth $n$ can perform operations whose structural prerequisites are at depths $\leq n$; operations requiring depth $> n$ are refused or queued until the region advances. The substrate's runtime checks the depth precondition for every operation; the check is a substrate traversal of the region's claimed depth versus the operation's required depth.
- **Substrate migration preserves depth.** Per [substrate-universality](substrate-universality.md), moving substrate content between implementations preserves the depth filtration: every region's depth in the new implementation is the same as in the original. Depth is a substrate property, not an implementation property.

## The filtration's relation to per-fiber settlement

The substrate's [closure operators](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md) act *within* each [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md), not across the depth filtration. The two structures compose:

- *Within* each fiber at history $t$, the substrate's closure operators drive the fiber's content toward fixed-point under [settling monotonicity](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-monotonicity.md), reaching [settling quiescence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) when no further closure-rule application changes the valuation. This is the substrate's per-fiber settlement, formalized as a [predication settling](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-settling.md).
- *Across* fibers, the depth filtration tracks which closure conditions the substrate's regions satisfy. This is the substrate's structural completeness.

Two regions at the same depth may have different settled fibers; two regions with identical fibers may be at different depths if their structural commitments differ. The substrate's complete description requires both — depth tells you what conditions a region commits to; fiber settlement tells you how its content has been driven to fixed-point under those conditions.

## Position in the substrate

Depth filtration is the substrate's *closure-condition organization*. Without it, "this region satisfies conditions 1–6" is a list; with it, the region is at depth 6 in a structurally-complete filtration whose colimit is the substrate's full structure. The framing is what makes the substrate's progression *measurable* — every region sits at a specific depth, depth advancement is a substrate operation, and the substrate's full structure is the asymptote of all regions advancing through their depths.

The pattern composes with [closure-conditions](closure-conditions.md) (which the depths enumerate), with [scope-maturation](scope-maturation.md) (whose named milestones correspond to specific depths), with [align](../morphisms/align.md) (the depth-advancement operator), and with [self-representation](self-representation.md) (which is the property that the substrate satisfies *only* at the colimit, asymptotically approached as more and more structural elements become substrate entities).
