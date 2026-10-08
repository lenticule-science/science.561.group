---
name: rule-addition-is-substrate-local
description: "Rule addition is substrate-local: new rules only re-settle entities within their match-radius"
type: theorem
class: engineering-claim
status: proved
depends-on:
  - teaching/explanations/four-layer-rule-architecture.md
  - ../morphisms/settle.md
  - ../morphisms/apply-edit.md
  - ../objects/closure-rule-record.md
  - ../objects/closure-rule-system.md
  - ../objects/fiber.md
  - ../../../../../theorems/wavefront-termination.md
  - ../../../../../theorems/wavefront-locality-via-cohomology-vanishing.md
  - ../../../../../theorems/settlement-determinism.md
  - ../../../../teaching/explanations/closure-rule.md
see-also:
  - teaching/explanations/scope-as-fiber.md
  - teaching/explanations/validation-as-settlement.md
  - flatfile-federation-equivalence.md
  - scope-composition-is-knowledge-order-monotone.md
  - ../../../../../theorems/just-in-time-orchestration-via-cohomological-vanishing.md
title: rule-addition-is-substrate-local
---

# Rule addition is substrate-local: new rules only re-settle entities within their match-radius

**Claim.** Let $\mathcal{S}$ be a FARS closure-rule system and let $r_{\mathrm{new}}$ be a new [`ClosureRuleRecord`](../objects/closure-rule-record.md) being added to $\mathcal{S}$ to produce $\mathcal{S}' = \mathcal{S} \cup \{r_{\mathrm{new}}\}$.
Let $E$ be the set of entities whose fibers, at the time of rule addition, match $r_{\mathrm{new}}$'s premise pattern.
Then:

1. **Locality.** Only entities in $E$ (the *triggered set*) have their settled fiber state changed by the transition from $\mathcal{S}$ to $\mathcal{S}'$.
  Entities outside $E$ are unaffected — their settled fibers are identical under $\mathcal{S}$ and $\mathcal{S}'$.
2. **Boundedness.** The triggered set $E$ is bounded by $r_{\mathrm{new}}$'s declared `match-radius`: $|E|$ is at most the number of entities within that radius of $r_{\mathrm{new}}$'s premise pattern's anchor cell.
3. **Determinism.** The re-settlement of entities in $E$ under $\mathcal{S}'$ is deterministic: same pre-addition fiber state + same $r_{\mathrm{new}}$ + same $\mathcal{S}$ produces byte-identical post-addition settled fiber state for all entities in $E$.

## Why this holds

**Part 1: Closure-rule application is premise-gated.** Per [four-layer-rule-architecture](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md) and [`closure-rule`](../../../../teaching/explanations/closure-rule.md), a closure rule fires only when its premise pattern matches an entity's (or entity-neighborhood's) cells.
A new rule $r_{\mathrm{new}}$ with premise $\phi$ fires only on entities whose current fiber satisfies $\phi$.
Entities whose fiber does not satisfy $\phi$ are not matched; the rule produces no conclusion for them; their fiber is unchanged.

Per [`settle`](../code/transformers/settle.md)'s operational semantics: the match phase walks the rule system and scans the target for cells matching each rule's premise.
Entities outside the match — those for which $r_{\mathrm{new}}$'s premise evaluates to $\bot$ or $f$ — are simply not in the match set.
The rule's conclusion is never composed into their fibers.

**Part 2: Match-radius bounds the triggered set.** Per [four-layer-rule-architecture](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md), each closure-rule record carries a `match-radius` declaration: `single-fiber` (the rule reads one entity's fiber), `neighbor-fiber` (reads the target entity and its direct neighbors in the entity graph), or `two-hop` (reads up to two hops).
The premise pattern can only reference cells within this radius.
Therefore, only entities within $r_{\mathrm{new}}$'s radius of the pattern's anchor can be in the triggered set $E$.
Per [wavefront-locality-via-cohomology-vanishing](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-locality-via-cohomology-vanishing.md), the wavefront activated by the new rule is bounded by its declared radius; no long-range effects propagate beyond the radius.

**Part 3: Cascade is also bounded.** When $r_{\mathrm{new}}$'s firing produces a conclusion that changes some entity's fiber, that change may trigger *existing* rules $r \in \mathcal{S}$ on the changed entity.
These cascades are the normal settle layers — per [wavefront-termination](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-termination.md), the cascade terminates in finitely many layers when the rule system is strict-regime (finite antecedents), and in a transfinite-but-bounded ordinal for Scott-continuous or aperiodic rules.
The cascade is still local: each cascade step activates rules only on entities within the changed entity's neighborhood (per the rules' own `match-radius` declarations).
The cascade's reach is bounded by the product of the radii and the number of settle layers.

**Part 4: Entities outside all reachable neighborhoods are unchanged.** An entity $e$ is unaffected by the addition of $r_{\mathrm{new}}$ if and only if $e$ is not in the transitive closure of the cascade from $E$ — not in $E$ itself, not a neighbor of any entity whose fiber was changed, not a second-hop from any changed entity, etc. Per the wavefront locality theorem, this transitive closure is bounded (finite or transfinite-bounded depending on the rule system's regime).
Entities outside this closure have the same settled fiber under $\mathcal{S}'$ as under $\mathcal{S}$.

**Part 5: Determinism follows from settlement-determinism.** Per [settlement-determinism](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/settlement-determinism.md), `settle` is deterministic: same target + same rule system + same fuel produces byte-identical output.
The addition of $r_{\mathrm{new}}$ to $\mathcal{S}$ produces a new rule system $\mathcal{S}'$; running `settle` under $\mathcal{S}'$ from the pre-addition fiber state is deterministic.
The post-addition settled fiber of entities in $E$ is therefore fully determined by the pre-addition state and $r_{\mathrm{new}}$.

## Engineering consequences

**Rule additions are safe for live substrates.** A FARS realization may add a new rule to its rule system while the substrate is live (between ticks, or even within a tick if the heartbeat discipline allows mid-cycle rule edits).
By the locality theorem, only entities matching the new rule's premise are re-settled; the rest of the substrate's state is untouched.
A live-rule-addition is operationally equivalent to a local repair of the matching entities — not a global re-settlement.

**Rule-addition cost is O(triggered set × cascade depth), not O(substrate size).** The re-settlement cost of adding $r_{\mathrm{new}}$ is bounded by $|E| \times D$, where $D$ is the maximum cascade depth (bounded by the rule system's wavefront-termination ordinal).
For strict-regime rule systems (per [strict-regime-engineering-envelope](../../../../../theorems/strict-regime-engineering-envelope.md)), $D$ is a small finite number; the cost is $O(|E|)$.
For a substrate with millions of entities where the new rule matches $k \ll N$ entities, the rule-addition cost is $O(k)$, not $O(N)$.

**Federation of rules is safe.** When a FARS federation peer sends a new rule record (a new `ClosureRuleRecord` entity) as part of a federation envelope (per [flatfile-federation-equivalence](../flatfile-federation-equivalence/flatfile-federation-equivalence.md)), the receiving instance adds the rule to its rule system and re-settles only the entities the rule matches locally.
The receiving instance's substrate state for entities outside the triggered set is unchanged by the peer's rule contribution.
Federation is therefore rule-safe: a peer cannot cause a global re-settlement by sending one new rule.

**Rule tuning (match-radius, severity) is also local.** Editing an existing rule's `match-radius`, `severity`, or `repair-catalog-entry` (per [four-layer-rule-architecture](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md)) is a substrate edit (via [`apply-edit`](../code/transformers/apply-edit.md)) that changes the rule entity's predications.
By the same locality argument, the effect of the rule edit is bounded by the new rule's match-radius applied to entities currently matching the rule's (possibly changed) premise.
Narrowing the `match-radius` may *reduce* the triggered set; widening it may *expand* it; changing `severity` affects how $\top$-outputs are reported but not which entities are settled.

**Rule audit is entity-local.** Because rule additions only change fibers in the triggered set, an auditor investigating a historical rule addition can identify exactly which entities were affected: replay the substrate from the pre-addition state, add the rule, observe the wavefront.
The witness chain records the rule-addition event and the settled outputs at the triggered entities.
Entities outside the triggered set have the same pre- and post-addition witnesses.

**Substrate self-representation is safe under rule self-editing.** Per [self-representation](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/self-representation.md) and [four-layer-rule-architecture](../architecture/four-layer-rule-architecture/four-layer-rule-architecture.md), closure rules are themselves substrate entities.
A rule that matches *other rules' predications* is admissible — meta-rules that check whether rules satisfy a shape (e.g., "every rule must have a `severity` predication").
By the locality theorem, such a meta-rule fires only on rule entities that match its premise; it does not affect non-rule entities.
Self-editing is structurally contained.

## What the theorem requires

- Each `ClosureRuleRecord`'s `match-radius` is declared and respected by the realization's `settle` implementation.
  A realization that reads beyond the declared radius (e.g., a "single-fiber" rule that reads across the entity graph) violates the locality guarantee.
- The entity graph's connectivity is finite (each entity has finitely many neighbors at each hop).
  Under FARS's flatfile substrate, entity references in frontmatter are the graph edges; the entity set is finite per session; connectivity is bounded.
- The rule system's settling is wavefront-terminating (per [wavefront-termination](../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/wavefront-termination.md)).
  For strict-regime rule systems this is always satisfied; for richer rule systems the termination ordinal bounds the cascade depth.

## What the theorem does not claim

- **That the triggered set is always small.** A new rule with a `two-hop` match-radius on a dense entity graph may match many entities.
  The locality theorem bounds the triggered set by the match-radius and graph density — it does not guarantee $|E|$ is small.
  High-radius rules on dense graphs can be expensive; the theorem establishes locality (not global-ness), not cheapness.
- **That rule removal is equally local.** Removing a rule may de-settle entities that were at fixed point only because of that rule's contribution.
  The cascade of de-settling is harder to bound than the cascade of settling; rule removal is not guaranteed to be as local as rule addition.
  This is an asymmetry in the closure operator's structure (adding information is monotone; removing is not necessarily so).
