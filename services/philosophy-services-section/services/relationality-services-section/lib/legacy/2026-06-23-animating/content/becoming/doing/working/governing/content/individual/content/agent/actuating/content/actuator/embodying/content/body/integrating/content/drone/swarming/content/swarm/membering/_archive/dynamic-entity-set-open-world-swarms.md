---
type: question
class: bridge
status: open
explores:
  - entity-set
  - predication-settling
  - multi-observer-system
  - distributed-settling-system
  - non-ordinal-entity-sets
  - settling-bound
---

# Dynamic entity sets for open-world swarm populations

The corpus's [entity set](../objects/entity-set.md) $E$ is fixed throughout settling: at every settling step $\tau < \lambda$, the predication valuation $v_\tau$ is defined on the same entity-pair index $E \times E$.
This is a structural assumption, not a foundational necessity, and it bounds the swarm-theoretic content the corpus can address.

Real swarms have *agent birth and death*: agents join (newly-spawned drones, newly-recruited nodes, newly-instantiated LLM workers) and leave (failed drones, departed nodes, terminated workers) during the system's evolution.
The corpus has no machinery for this.
The [non-ordinal entity sets question](non-ordinal-entity-sets.md) addresses one foundational extension; *time-varying* entity sets is a different one, not currently a corpus question.

This question sets up the work to extend predication settling to dynamic entity-set evolution in service of open-world swarm modeling.

## What the corpus has

- The [entity set](../objects/entity-set.md) $E$, fixed.
- The [predication settling](../objects/predication-settling.md) family $(v_\tau)_{\tau < \lambda}$, all on the same $E$.
- The [multi-observer system](../objects/multi-observer-system.md) — observers indexed by a fixed category $O$.
- The [distributed settling system](../objects/distributed-settling-system.md) — finite-presheaf-of-replicas.
- The [non-ordinal entity sets question](non-ordinal-entity-sets.md) — addresses the cardinal / structure of $E$, not its time-evolution.
- The [predication-settling base-morphism](../morphisms/predication-settling-base-morphism.md) — has an entity-set-map component $e : E \to E'$, but is *cross-base*, not *within-settling*.

What the corpus *does not* have:

- A settling object whose entity-set varies with $\tau$.
- An "agent-birth" / "agent-death" event primitive.
- Cohomological invariants that respect entity-set-evolution.

## What the public literature has that this question needs to read

- **Streaming algorithms / online algorithms** — the natural neighbor for time-varying input.
  Cormode, Muthukrishnan, the streaming-algorithms textbook.
- **Population protocols** (Angluin, Aspnes, et al) — finite-state agent populations with explicit population dynamics.
- **Open multi-agent systems** — Tumer, Dignum on open MAS where agents enter / leave.
- **Membrane computing / P-systems** (Păun) — formal computation models with hierarchical compartments where agents are created / destroyed.
- **CRDT with churn** — the distributed-systems literature has a sub-stream on CRDTs surviving node churn; the recent work on Δ-state CRDTs and AntidoteDB is the engineering-side reference.
- **Filtration in stochastic processes** — the standard way to handle time-varying state spaces in probability theory.
- **Recent: dynamic graph neural networks and dynamic-graph cellular sheaves** — the public sheaf-theoretic literature is starting to address time-varying topologies.

## The question

How does the corpus's predication-settling apparatus extend to a setting where the entity set $E_\tau$ varies with the settling step $\tau$, and what does the resulting machinery say about open-world swarm populations — agent birth, agent death, churning networks, swarm growth, swarm collapse?

## Sub-questions

### (9a) Define a time-varying entity-set settling

Three candidate framings:

- **Filtration-style** — $E_\tau \subseteq E_{\tau+1}$ monotone (only birth, no death).
  Cells $(s, p, o) \in E_\tau \times \Pi \times E_\tau$ are added; existing cells stay.
  This is the simplest extension; it preserves $\leq_k$-monotonicity of values trivially (cells in earlier $E_\sigma$ keep their values).
- **Co-filtration-style** — $E_\tau \supseteq E_{\tau+1}$ monotone (only death, no birth).
  Cells are removed; values at removed cells are forgotten.
- **General time-varying** — $E_\tau$ arbitrary at each $\tau$; transitions $E_\tau \to E_{\tau+1}$ are partial functions describing which agents persist, are born, or die.

Sub-question 9a asks: choose the right framing, define the resulting settling object, and state under what conditions the existing settling-monotonicity / continuity / quiescence conditions transfer.

### (9b) Agent-birth and agent-death as predicate firings

In the filtration case, each new agent $a \in E_{\tau+1} \setminus E_\tau$ is *born*.
This birth event can be encoded as a closure-rule firing: a rule of the shape "when antecedent holds, a new entity is created with cell-values determined by the antecedent."
In the co-filtration case, agent-death is a closure-style cell-collapse: a rule that drives certain cells to a terminal state ($\top$ or a designated "died" state).

Sub-question 9b asks: extend the [closure-rule language](teaching/explanations/closure-rule-language.md) to support agent-birth and agent-death events.
The technical question is whether this preserves the rule-language's positive $\Pi_1$+$<$ structure, and whether the resulting rule systems still have a well-defined closure operator.

### (9c) Cohomological invariants under entity-set evolution

The corpus's [aperiodic classifying invariant](../objects/aperiodic-classifying-invariant.md) lives in $H^1$ of a fixed bitopological settling site.
With time-varying $E_\tau$, the bitopological site itself becomes time-varying, and the cohomology must accommodate changing fiber spaces.

Sub-question 9c asks: define the bitopological settling site for time-varying $E_\tau$, and identify whether the aperiodic classifying invariant has a well-defined limit / direct-limit / colimit form.
The expected pattern: filtration-style entity-set evolution gives a direct system of bitopological sites, and the cohomology is the colimit of cohomologies — a structure analogous to the Anderson-Putnam direct-limit, but indexed by entity-evolution rather than substitution-iteration.

### (9d) CRDT-with-churn as a corpus theorem

The CRDT-convergence-with-churn problem in the engineering literature: replicas join and leave a CRDT cluster; convergence still holds as long as the joins / leaves are eventually consistent.
The corpus's [CRDT convergence theorem](../theorems/crdt-convergence.md) assumes fixed replicas.

Sub-question 9d asks: state and prove the CRDT-convergence-with-churn theorem in the dynamic-entity-set extension.
This is application-relevant for any swarm-engineering use; it is structurally close to the existing CRDT machinery once the foundational extension lands.

### (9e) Open-world multi-observer systems and the unified-distributed-systems-cohomology question

The existing [unified-distributed-systems-cohomology question](unified-distributed-systems-cohomology.md) asks for a common framework for settling-cohomology and Felber-style task sheaves. *Time-varying* entity sets are a feature of Felber's simplicial protocol complexes but are entirely absent on the corpus's side.

Sub-question 9e asks: with the dynamic-entity-set extension in place, does the unified-distributed-systems-cohomology question's Sub-question 1 (common host category) become more directly answerable?
Specifically, whether a *time-varying* d-frame-valued sheaf on the time-varying bitopological settling site is the right common framework.

## What would settle the question

Five deliverables:

1. **Dynamic-entity-set settling object** (9a) — foundational object definition.
2. **Birth / death rule semantics** (9b) — closure-rule language extension.
3. **Time-varying bitopological site and its cohomology** (9c) — cohomological foundation.
4. **CRDT-with-churn theorem** (9d) — application-relevant deliverable.
5. **Open-world unified-cohomology connection** (9e) — connects to the existing unified-cohomology question.

Deliverables 1–2 are session-scale.
Deliverables 3–4 are cluster-scale.
Deliverable 5 is research-program-scale.

## Why this question

Most real-world swarm settings have agent churn: drones fail, LLM workers terminate, P2P nodes disconnect.
The corpus's fixed-$E$ assumption is a structural constraint that limits its applicability to closed-world / static-population systems.
Lifting the constraint:

- Makes the corpus engageable with the population-protocols, open-MAS, and CRDT-with-churn literatures.
- Connects naturally to the time-varying side of the unified-distributed-systems-cohomology question.
- Gives a cohomological framework for swarm growth / collapse dynamics that the public literature handles informally.

What the corpus's machinery would yield:

- *Bilattice-valued* CRDT-with-churn — paraconsistent disagreement that survives node-departures.
- *Cohomological invariants* of swarm-population dynamics — the direct-limit-of-bitopological-sites construction is structurally novel.
- *Dynamic-entity-set* aperiodic classification — a swarm whose population is changing while its dynamics are aperiodic gets a refined classifying invariant.

## Position in the program

This question is **not in the existing [agentic-swarm-theory study plan](prose/teaching/explanations/toward-agentic-swarm-theory.md)**.
It is a foundational extension that would underwrite future plan additions on open-world swarms.

It depends on the corpus's existing entity-set / settling apparatus and is otherwise self-contained at the foundational level.
Settling 9a is the entry point.

This question stays `open` until 9a yields a workable dynamic-entity-set settling object.
