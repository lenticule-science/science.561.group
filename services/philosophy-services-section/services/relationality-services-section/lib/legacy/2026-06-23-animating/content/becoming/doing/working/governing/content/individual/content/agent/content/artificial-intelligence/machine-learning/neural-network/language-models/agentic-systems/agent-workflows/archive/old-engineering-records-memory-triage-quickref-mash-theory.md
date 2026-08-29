---
name: QUICKREF-mash-theory
format: reference
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## The Insight

**MASH provides persistent dynamics to FARS's modal geometry.**

Not new primitives. Not new objects. Not a new logical space.

MASH is how the system *inhabits* FARS's logical space and moves through it over time.

## The Formula

```
GFRTU (math)
    ↓
CCE/CDS/RTL (specs)
    ↓
FARS (files + logic)
    ↓
MASH (dynamics + time)
    ↓
Physical control (user features)
```

## What's What

| Layer | Is | Does | Example |
|-------|----|----|---------|
| **GFRTU** | Mathematical universe | Defines possibility space | Fiber Heyting algebras at each history |
| **Cellular** | Specification machine | Operationalizes closure | CCE, CDS, RTL, Node-Cycle |
| **FARS** | Static substrate | Files with frontmatter relations | `task.md` with `status: open` |
| **MASH** | Living system | Advances through possibility space | `mash-engine daemon` world_tick |

## The Core Mechanism

The daemon runs this loop every 5 minutes:

1. **Saturation (σ_t)**: Ingest JSONL events into graph. Materialize what history forces.
2. **Transfer (Δ_t)**: Propagate changes. Ensure all forward extensions stay consistent.
3. **Action**: Notice anomalies. Emit events. Close gaps.

This IS the composite nucleus π_t = σ_t ∘ Δ_t operating.

## The History Monoid

```
JSONL events → (T, ⋆, ⊥) → each step independent or sequential
                                ↓
                        Graph state H_t
                                ↓
                    Settled state H*_t = Fix(σ) ∩ Fix(Δ)
                                ↓
                        Move to next history
```

## What's Implemented

✓ FARS substrate (files, frontmatter relations)
✓ Events + JSONL log
✓ Operations graph (materialized state)
✓ Daemon heartbeat + world tick
✓ MCP query interface
✓ Double-entry accounting

## What's Missing

✗ Explicit nucleus rules (rules codified, queryable)
✗ File watcher (immediate rule triggering)
✗ Evidence preservation (before/after hashes, repair logs)
✗ Multi-level closure (composable rule stacks)
✗ Constraint enforcement (prevent violations)
✗ Physical equipment interface

## The Next Step

**Local-svc-file-watcher** (task: local-svc-file-watcher):
- Codify the rules world_tick runs
- Watch for file changes
- Apply rules immediately, not every 5 minutes
- Emit events, update graph

This unblocks everything downstream.

## Key Equations

σ_t saturation nucleus: what history forces
Δ_t transfer nucleus: what forward extensions share
π_t = σ_t ∘ Δ_t: composite nucleus (the daemon)
H*_t = Fix(σ) ∩ Fix(Δ): settled fiber (the truth)

T = (Σ, I): history monoid with step set Σ and independence I
t ∈ T: equivalence class of sequences (what happened)

## Why This Matters

The system is not ad hoc. It's the operational instantiation of a rigorous mathematical specification. Every component can be grounded in GFRTU. Every design decision can be justified by the math. Every bug can be traced to a violation of the mathematics.

This enables:
- Independent implementations (specs are formal)
- Auditability (evidence vectors like CCE)
- Composability (rule stacks, multi-level closure)
- Safety (constraint verification before equipment action)

## For More Detail

- Theory session: `project_theory-session-2026-04-04.md`
- Cellular mapping: `project_cellular-instantiation-mapping.md`
- Implementation roadmap: `project_theory-to-implementation-roadmap.md`
- Code: `operations/engineering/fars/mash-engine/src/session/daemon.rs` line 196 (world_tick)
- Specs: `operations/command/.../semiotic-cell-machine/cce.md`
