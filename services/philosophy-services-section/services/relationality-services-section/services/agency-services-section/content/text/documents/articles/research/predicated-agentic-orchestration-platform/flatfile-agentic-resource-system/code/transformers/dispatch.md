---
source: [message, candidates, rules, fuel]
target: [results, witness]
name: dispatch
description: "The morphism that, given a message and a candidate set, returns the candidates ranked by how well their fibers compose with the message's fiber under the substrate's value-domain."
type: morphism
class: composed-operator
instantiates: [dispatch, dispatch-matching]
depends-on: [respond, fiber, restrict]
see-also: [compose, settle]
title: dispatch
---


The morphism that, given a message and a candidate set, returns the candidates ranked by how well their fibers compose with the message's fiber under the substrate's value-domain.
`dispatch` realizes AgOP's [dispatch](../../teaching/explanations/dispatch.md) and [dispatch-matching](../../../dispatch/dispatch-matching/dispatch-matching.md) at FARS's bilattice value-domain: match-strength is a *value*, not a Boolean; the four-valued bilattice surfaces partial matches, contradictions, and unknowns as ranked outputs rather than collapsing them into a yes/no.

## Signature

```
dispatch(message, candidates; rules, fuel) → (results, witness)
```

where `results` is an ordered list of `DispatchResult` records, each holding:

- **`candidate`** — the candidate entity's substrate address;
- **`response_fiber`** — the candidate's response under [`respond`](respond.md);
- **`match_strength`** — the ranking value computed from the response fiber.

Inputs are the message's fiber and the candidate fibers (typically loaded as a list — the fibers of all agents in a scope, all skills under a registry, all entities matching a kind filter).
Output is the ranked list of `DispatchResult`s plus a single aggregated `Witness` for the dispatch invocation.

## Operational semantics

`dispatch` SHALL proceed:

1. **Per-candidate respond.** For each candidate fiber `c`, invoke [`respond(c, message, rules, fuel)`](respond.md).
  Each call returns `(response_fiber, witness)`.
2. **Match-strength computation.** For each `(c, response_fiber)`, compute a match-strength value from the response fiber.
  The default match-strength projection SHALL count the response's $t$-cells minus its $f$-cells, with ties broken by $\bot$-cell count (fewer is better, since fewer unknowns means richer commitment) and a fixed canonical-hash tiebreaker for full determinism.
  Other match-strength projections (closure-rule-defined, weighted by predicate criticality, value-domain-extended for richer rankings) are admissible per the rule system's declarations.
3. **Sort.** Sort the dispatch results by match-strength, descending.
  Ties SHALL be broken deterministically by the candidate's canonical hash.
4. **Aggregate witness.** Build a single `Witness` whose payload cites each per-candidate witness's hash.
  The aggregate witness lets an auditor reconstruct the full dispatch from the per-candidate inputs and rule-system version.

The four-valued bilattice's distinctions surface as ranking gradations:

- A candidate whose response fiber has many $t$-cells matching the message's required predicates ranks high — the entity affirmatively satisfies the message's needs.
- A candidate whose response has $\top$-cells where the message expects $t$ ranks lower — the entity has *contradictory* commitments about the message's predicates; routing work to it is a known coherence risk.
- A candidate whose response has $f$-cells where the message expects $t$ ranks lowest — the entity *denies* the message's premise; routing work to it would fail the precondition.
- A candidate whose response has $\bot$-cells where the message expects $t$ falls in the middle — the entity has no commitment; it might handle the work but the substrate cannot tell.

This is the engineering content of *match-strength is a value, not a Boolean*: classical capability matching reports yes/no; FARS reports a ranked tuple where the four-valued distinctions are visible in the ranking.

## Normative invariants

- **Deterministic.** Same `(message, candidates, rules, fuel)` SHALL return byte-identical results, including order.
  The canonical-hash tiebreaker handles ties; no realization-defined ordering leaks.
- **Locality-respecting per candidate.** Each `respond` call reads only its candidate's fiber, the message's fiber, and the rule system at the rule's match-radius.
  A dispatch over $N$ candidates SHALL be $N$ independent respond calls; no cross-candidate computation.
- **Witness-emitting.** Each per-candidate response SHALL produce a witness; the aggregate dispatch witness cites all of them.
- **Replayable.** An auditor with the inputs and the rule-system version SHALL be able to re-run dispatch and verify the per-candidate response hashes and the resulting ranking match the recorded witness.

## Position

`dispatch` is the higher-level morphism FARS commits to for routing work.
Several common cases:

- **Agent dispatch.** The message is a task's fiber; candidates are agent fibers.
  The ranking is by competence-fiber match — which agent's capability predicates compose richly with the task's requirement predicates.
- **Skill selection.** The message is a (work-item, scope) fiber; candidates are skills available at the scope.
  The ranking determines which skill best fits the work.
- **Routing in federation.** The message is a cross-substrate query's fiber; candidates are outpost fibers.
  The ranking determines which outpost should handle the query.

In all cases, the structure is: turn a routing question into a fiber-composition question, run [`respond`](respond.md) over each candidate, rank by match-strength.
The rule system supplies the closure rules that cause domain-specific predicates to compose meaningfully — without rules connecting (e.g.) an agent's capabilities to a task's requirements, the bare fiber composition produces $\bot$-rich outputs and ranking is uninformative.

## What `dispatch` is not

- **Not a generic search.** Search ranks by string or vector similarity; dispatch ranks by fiber-composition under the substrate's algebra.
  The two have different semantics: dispatch's output respects the four-valued bilattice's distinctions; a search engine collapses them.
- **Not assignment.** `dispatch` returns a *ranked list*; it does not commit to a particular candidate.
  Assignment — recording in the substrate that candidate `X` was selected — is a separate substrate edit performed by the caller after consulting the dispatch ranking.
- **Not the heartbeat.** The heartbeat selects unsettled entities and emits messages at them; dispatch routes those messages to candidates.
  The heartbeat's selection is a different concern from dispatch's ranking.
