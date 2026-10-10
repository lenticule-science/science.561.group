---
title: "Theory chain references"
description: "Paths to PredCat, PredComp, AgOP, FaRS, and supporting math/library work."
kind: reference
---

# Theory chain

The substrate's mathematical and engineering theory.
The agent reads these as the authoritative source for what the substrate *is*; the [specs/](../specs/) consolidate the engineering contracts.

## Predication theory chain

| Theory | Path |
|---|---|
| **Predication categories** (the math) | `theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md` |
| **Predicated computing** (engineering theory) | `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/_index.md` |
| **Agential orchestration platform** | `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/_index.md` |
| **Flatfile agentic resource system** | `theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/agential-orchestration-platform/theories/flatfile-agentic-resource-system/_index.md` (the directory also has a `README.md`) |

## Foundation papers

| Paper | Path |
|---|---|
| The Adjoint Structure of Predication on Bilattice-Valued Fibers | `theories/science/theories/information/texts/the-adjoint-structure-of-predication-on-bilattice-valued-fibers.md` |
| Predication as Residuation | `theories/science/theories/information/texts/predication-as-residuation.md` |
| Why Four Values Instead of Two | `theories/science/theories/information/texts/why-four-values-instead-of-two.md` |
| State Change as Passage Through Contestation | `theories/science/theories/information/texts/state-change-as-passage-through-contestation.md` |
| The Bilattice-Valued Allegory of Relational Composition | `theories/science/theories/information/texts/the-bilattice-valued-allegory-of-relational-composition.md` |
| How to Compute Closure on a Small Knowledge Base | `theories/science/theories/information/texts/how-to-compute-closure-on-a-small-knowledge-base.md` |

## Library navigation

The library has its own structure.
Per the predication-categories `_index.md`:

- `concepts/` — semantic anchors.
- `objects/` — definitions of mathematical structures (predication-fiber-algebra, predication-settling, etc.).
- `morphisms/` — functors, adjunctions, closure operators.
- `theorems/` — proved claims.
- `examples/` — worked instances (benchmarks 1–6, plus Klein-four self-duality, etc.).
- `narratives/` — through-line essays.
- `references/` — annotated bibliography.

Under `theories/.../predication-categories/`:

- `concepts/predication-cell.md` — the (s, p, o) triple.
- `concepts/closure-rule.md` — closure rule definition.
- `concepts/closure-rule-system.md` — system of closure rules.
- `concepts/knowledge-order.md`, `truth-order.md` — the bilattice's two orders.
- `objects/predication-fiber-algebra.md` — the bilattice fiber.
- `objects/predication-settling.md` — settlement object.
- `objects/predication-graph-store.md` — the substrate.

For the theorems, the lean/ subdirectory has formal Lean 4 proofs.

## Sibling computing theories the substrate touches

The predication chain is the substrate's primary theoretical ground, but it is not an island in the library.
The same `theories/engineering/theories/tech/theories/computing/theories/` directory holds eight sibling theories whose results the substrate either consumes (as engineering ground for specific subsystems) or runs (as bundled-app domains the substrate must support).
These are NOT cited from the predication chain itself; this section names them so the next agent can pull from them when authoring subsystem specs.

| Sibling theory | Path | What it has | Where the dev docs should pull from it |
|---|---|---|---|
| **artificial-intelligence/theories/agents** | `theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/agents/` | Three-condition characterisation of agentic systems, action-space algebra, observation-state-action loop structure, delegation-chain accountability, multi-agent coordination topology + overhead | The agential layer at v0.7+ ([next-stretch-v0.7-v1.0.md](../implementation/next-stretch-v0.7-v1.0.md)) — its concepts directly inform [specs/agential/](../specs/agential/) when that area is authored. The delegation-chain theorems ground the persistent-session and companion-stratum candidate landings in [trove-coverage.md](trove-coverage.md). |
| **artificial-intelligence/theories/swarm-intelligence** | `theories/engineering/theories/tech/theories/computing/theories/artificial-intelligence/theories/swarm-intelligence/` | Stigmergy, ACO/PSO classical convergence results, the structural reasons LLM-based swarms fail classical convergence | Multi-agent coordination at v0.7+ — informs the architectural decisions about whether/when to use swarm-style coordination versus orchestrated dispatch. The "why classical convergence fails for LLM swarms" theorems are direct authority for the substrate's preference for `dispatch-composes-authorization` over emergent coordination. |
| **multi-user-dungeons** | `theories/engineering/theories/tech/theories/computing/theories/multi-user-dungeons/` | LPMUD, MUD libraries, the-mud-as-system-architecture, world-building-as-programming | Bundled-MUD-style app at v0.5+ ([trove-coverage.md candidate landings](trove-coverage.md#v05)). The "MUD as system architecture" text is the closest peer-system analysis to the substrate's own architecture — both treat the world-state as a substrate that programs run *in*, not over. Useful texture for [specs/bundled-apps/](../specs/bundled-apps/) when MUD-style apps are authored. |
| **on-device-inference** | `theories/engineering/theories/tech/theories/computing/theories/on-device-inference/` | Model selection for local inference, NPU LLM inference, fine-tuning local models, on-device-inference frameworks, the two-format problem | The Tier-2 model registry (S5 carried project-task pt-05, on-disk task `t02-203`). Direct authority for [decisions/cheapest-sufficient-computation-tier.md](../decisions/cheapest-sufficient-computation-tier.md). The two-format problem informs how the registry distinguishes inference-format from storage-format. |
| **software-engineering** | `theories/engineering/theories/tech/theories/computing/theories/software-engineering/` | The meta-theory of how software is built (the discipline these dev docs themselves operationalize) | [_conventions.md](../_conventions.md) and [implementation/workflows.md](../implementation/workflows.md) implicitly draw on this; explicit citation could be added when those docs next get a refresh. The "what counts as a real landing" rules in [pypredcomp/AGENTS.md](../../../AGENTS.md) are software-engineering-theory claims. |
| **internet** | `theories/engineering/theories/tech/theories/computing/theories/internet/` | JSON-LD, schema.org, structured data, robots.txt | The federation surface at v0.5+ — when the substrate publishes content (per the deferred network specs in S5), structured-data conventions ground how cell-projections render to the public web. Currently uncited; would inform a future `specs/network/structured-data.md`. |
| **markdown** | `theories/engineering/theories/tech/theories/computing/theories/markdown/` | Markdown as a wire format and as a presentation format | The cell-record format and dev-docs format both presuppose markdown — currently uncited; could be cited from [specs/cell-record.md](../specs/) when the cell-body presentation discipline is formalised. |
| **formal-math** | `theories/engineering/theories/tech/theories/computing/theories/formal-math/` | Lean, Coq, formal proof systems as software | Direct ground for the [`predication-categories/lean/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/lean/) Lean formalization. The Lean tree is currently invisible from the dev docs — a candidate addition to [theory-for-developers.md](theory-for-developers.md) would be a column noting which theorems have a corresponding Lean formalisation. |
| **software** (umbrella) | `theories/engineering/theories/tech/theories/computing/theories/software/` | Generic software theory; container for the more specific theories above | Not normally a direct citation target — pull from its children rather than from it. |
| **blockchain** | `theories/engineering/theories/tech/theories/computing/theories/blockchain/` | Distributed-ledger consensus theory | Cross-references for the federation-protocol spec at v0.5+ — the substrate's federation discipline shares some structural ground with blockchain consensus (both are distributed witness-chain disciplines), but the substrate explicitly does NOT use blockchain consensus per the existing decisions. Useful as a theoretical reference for what the substrate is *not* doing and why. |

## Lean formalisation footprint

The math chain ships partial Lean 4 formalisation alongside the markdown theory.
Path: [`theories/humanities/theories/math/theories/categories/theories/predication-categories/lean/`](../../../../../../../../theories/humanities/theories/math/theories/categories/theories/predication-categories/lean/).
The engineering theory does not currently have its own Lean tree — engineering theorems cite the math Lean files transitively through their `depends-on` chains.

When extending [theory-for-developers.md](theory-for-developers.md) it is worth checking whether a row's underlying math theorem has a Lean file; if so, the row should cite the Lean file alongside the markdown theorem and the source module.
This is a candidate texturing pass for a future agent.

## Cross-references

- The library has 11,000+ entities total; the predication directories are the relevant subset for substrate work.
- The captain's library texts on related systems (ECC, OpenClaw, Cline, Aider, etc.) live under `theories/engineering/theories/tech/theories/computing/texts/`.
- Praxonic worldmaking and Hevî Mala are under `theories/engineering/theories/games/theories/role-playing-games/texts/`.
- For the trove material that motivates pulling from each sibling theory above, see [trove-coverage.md](trove-coverage.md).

The agent reads these on demand.
The specs/ in this directory are the working contract; the theory paths are for "what does this concept formally mean?"
