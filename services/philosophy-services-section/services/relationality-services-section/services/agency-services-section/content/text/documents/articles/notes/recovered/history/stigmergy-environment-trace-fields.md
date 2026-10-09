---
name: stigmergy-environment-trace-fields
description: Topic note on stigmergy, environment-trace fields, and pheromone trails as the corpus describes them (`theories/agency/.../swarm/library/swarm-intelligence/stigmergy/`), distilled as the coordination mechanism `@561-group/computer` already realizes through its append-only EAVT trace. Reports what the files say with citations; own synthesis marked [INFERENCE].
audience: 561-group computer dev team
status: study-notes
---

# Stigmergy & environment-trace fields — the coordination mechanism

Companion to [`agentic-drone-swarm-systems.md`](agentic-drone-swarm-systems.md).
Path abbreviation: `…/SI/` = `theories/agency/library/agent/actuating/library/actuator/embodying/library/body/integrating/library/drone/swarming/library/swarm/library/swarm-intelligence/`.

Plain statements report a file; **[INFERENCE]** marks my synthesis / OS mapping.

## 1. What stigmergy is

`…/SI/stigmergy/stigmergy.md`: **stigmergy is the coordination mechanism in which
agents influence each other indirectly by modifying a shared environment, with
later agents responding to the modifications rather than to the agents that made
them** (Grassé 1959, termite nest construction). "The channel of coordination is
the environment itself. There are no addresses, no recipients, no messages typed
by performative." Coordination is "decoupled in both space and time: agents that
never coexist can coordinate through their shared modifications to a persistent
medium."

Two regimes (same file):

- **Quantitative (sematectonic):** the trace is a continuous variable (pheromone
  concentration, terrain, wear); agents respond to its gradient. ACO and boids
  are quantitative-stigmergic.
- **Qualitative (sign-based):** the trace is a discrete structural state (wall
  built, stone placed, marker dropped); agents respond to its presence/pattern.
  Termite construction and many cellular automata are qualitative-stigmergic.

What stigmergy explicitly is **not** (same file): not message passing (a message
has sender + recipient; a trace has neither), not shared memory (no interface),
not blackboard architecture (a blackboard has explicit read/write protocols; a
stigmergic field "is unstructured by design"), not gossip protocols (no
inter-agent messages at all).

## 2. The environment-trace field (the object)

`…/SI/stigmergy/environment-trace-field/environment-trace-field.md`: a trace
field is a time-indexed map $E_t : L \to V$ from a **location space** $L$ to a
**value space** $V$. Specializations by $V$:

- $V = \mathbb{R}^+$ → the **pheromone field** of ACO (continuous evaporation);
- $V = \mathbb{R}^k$ → vector traces (direction / multi-dimensional);
- $V$ a finite alphabet → the **qualitative** regime (e.g. empty / brick-placed /
  brick-mortared);
- $V$ a record type → multi-channel pheromone systems.

Well-behaved fields (required for the ACO-convergence theorem) satisfy:
boundedness below ($\tau_{\min}$, so unvisited regions don't lose all info),
boundedness above ($\tau_{\max}$), **monotone evaporation** between deposits, and
**bounded deposition** (each agent's per-step contribution bounded by a constant).

**Reading** is *local*: an agent at $\ell$ accesses $E_t|_{N(\ell)}$, a bounded
neighborhood (it "does not see the full field"). **Writing** is *local*: an agent
modifies $E_t$ only in a bounded neighborhood of its location; field-wide
single-agent modifications are not permitted (would violate the scalability
premise).

## 3. The pheromone trail (the canonical channel)

`…/SI/stigmergy/pheromone-trail/pheromone-trail.md`: a scalar field $\tau :
\text{Locations} \to \mathbb{R}^+$ with three components — **the field**,
**deposition** ($+\Delta\tau$ on traversal, bounded, depends only on local
state), and **evaporation** (multiply by $(1-\rho)$ each step, applied
uniformly). The decay $\rho$ is "the central control": small $\rho$ = long-memory
trails, large $\rho$ = short-memory. The file tabulates **pheromone vs. message**:

| Property | Message | Pheromone trail |
|---|---|---|
| Sender named | yes | no |
| Recipient named | yes | no |
| Persists after delivery | optional | yes (until evaporation) |
| Decays over time | no | yes |
| Delivered to recipient | yes | no — recipient finds it |
| Coordination cost grows with | recipient count | environment size |

The last row is "the load-bearing distinction."

## 4. The cost theorem — why stigmergy scales

`…/SI/stigmergy/stigmergy-decouples-coordination-cost/…md` (status **proved**):
total coordination cost per step is $O(N + |L|)$ — *no $O(N^2)$ term* — because
evaporation is $O(|L|)$ and agent-independent, deposition is $O(N)$, sensing/
update is $O(N)$, and **no inter-agent operation appears in the cost
decomposition**. For fixed-size environments this is $O(N)$, versus the
orchestrated regime's $O(N^2)$ (peer-to-peer) or super-linear (orchestrator-
workers). The narrative `…/SI/stigmergy/why-stigmergy-works/…md` frames the
trade-off: stigmergy "binds the cost of coordination to the size of the
environment, not to the agent population"; the price is expressive power
(low per-interaction precision, high latency, statistical rather than
per-message guarantees). Its closing design question: *not* "how do we make our
system more like a swarm?" but **"does this task have the structure that makes
swarm coordination possible?"** Tasks needing per-message precision
(multi-step reasoning with causal dependencies) do not admit stigmergic
solutions; their $O(N^2)$ cost is "intrinsic to the task, not the architecture."

The honest limit: `stigmergy-decouples-coordination-cost.md` notes the result
"depends on the scalability premise" ($O(1)$ per-agent cost) — "precisely the
condition LLM-based agents violate"
(`…/SI/llm-swarms-fail-classical-conditions/…`).

## 5. [INFERENCE] Mapping to the OS: the EAVT trace IS a stigmergic field

The OS's append-only EAVT log is an environment-trace field $E_t : L \to V$ in
the corpus's exact sense:

- **Location space $L$** = the typed POSIX path namespace + the $(e,a)$ dual-filed
  anchors (journal §4: "address = type = name = location, one act"; every row
  filed at both subject `e` and predicate `a`).
- **Value space $V$** = FOUR / the kernel charge (`math/bilattice/charge`,
  journal §1) — a *categorical/structured* trace field, the qualitative regime in
  the corpus's taxonomy (§2 above), not the scalar pheromone regime.
- **Deposition** = appending datoms (local: a worker writes at the cells it
  touches). **Reading** = a fold over the log restricted to the cells of interest
  ("recipient finds it," no addressee).

Two differences from classical pheromones, both meaningful:

1. **No evaporation by default.** The classical field decays ($1-\rho$); the OS
   trace is *append-only and monotone* (journal §"buys": "computation is only
   ever ascent in the knowledge order… you never have to undo"). **[INFERENCE]**
   This is a deliberate substitution: where ACO uses evaporation to *forget* stale
   trails, the OS uses **monotone knowledge ascent + linearity** (evidence is
   "never discarded and never freely duplicated," journal §2) to *keep* everything
   and let later evidence dominate via the truth-order read. If the OS ever wants
   recency-weighting it would re-introduce a decay-like operator over the truth
   projection — but it would be a *read-time* weighting, not a destructive write.
2. **Paraconsistent values.** Classical trace fields are scalar/real; the OS field
   is FOUR-valued, so a cell can hold $\top$ (two workers depositing
   contradicting evidence) without the field becoming ill-defined (journal §1,
   "$\top$ is a held value, not a fault"). This is exactly the multi-observer
   disagreement case (companion consensus note).

The cost-decoupling theorem (§4) is **[INFERENCE]** the corpus-side justification
for the journal's "coordination-free distribution" payoff: because the OS
coordinates through trace reads/writes (stigmergy) and merges monotonically (CALM),
its substrate-layer coordination sits in the $O(N+|L|)$ regime — the part of the
swarm that *does* scale. The LLM consultation is the part that does not, which is
why the lead note's hybrid architecture (cheap stigmergic substrate + sparse
aim-frontier consultation) is the right shape.

## 6. Related corpus items worth a later read

- `…/SI/stigmergy/stigmergic-context-engineering/…` — making LLM agents
  themselves stigmergic (complementary to hybrid-orchestration).
- `…/SI/ant-colony-optimization/` (Dorigo 1992, ACO-convergence) and
  `…/SI/particle-swarm-optimization/` (Kennedy–Eberhart 1995) — the two classical
  algorithms whose convergence theorems the trace-field properties are stated for.
- `…/SI/flocking/` (Reynolds 1987 boids; neighborhood, neighbor-sensing) — the
  local-rule / bounded-neighborhood sensing model.
