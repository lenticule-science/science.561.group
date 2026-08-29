---
name: quick-reference
date-created: 2026-04-04
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

## Core Claim (One Sentence)
**Entities do not have relations; entities are constituted by them. The system's architecture must reflect this.**

---

## Key Terms

| Term | Definition | System Encoding |
|------|-----------|-----------------|
| **Fiber** | All (subject, object) pairs using a single predicate $p$ | All triples with the same attribute/predicate |
| **Predicate** | A relation that defines a fiber | An attribute in EAVT (e.g., "has-name", "knows") |
| **Bilattice** | 4-valued epistemic state: confidence × contradiction | Value carries both truth (t/f) and knowledge (bot/top) |
| **Saturation (σ)** | Inference closure to stable equilibrium | Apply all saturation rules to fixed point |
| **Translation (Δ)** | Invariance across trace refinement | Check if fact persists across context boundaries |
| **Fixed Fiber (H*)** | Propositions stable under both nuclei | Intersection of saturated and translation-stable layers |
| **Trace** | Canonical sequence of relational steps; level of abstraction | Session → Phase → Task → Step hierarchy |
| **Reindexing** | Moving a fact between traces while preserving structure | Communication between agents at different traces |

---

## Seven Requirements (What Must Change)

| Requirement | Current State | Required State | Impact |
|-------------|---------------|----------------|--------|
| **1. Predication as Primitive** | EAVT triples are understood as "entity has attribute" | EAVT triples are "subject relates to object through predicate" | Conceptual (reframing, no code change immediately) |
| **2. Bilattice Values** | Values are strings/numbers without epistemic state | Values encode confidence, contradiction, evidence | High impact on data representation |
| **3. Dual Nuclei** | Rules applied without distinguishing nucleus type | Saturation rules ≠ translation rules; both computed | High impact on inference engine |
| **4. Trace Awareness** | All agents operate on global shared knowledge | Agents bound to traces; trace context on all facts | Very high impact on agent dispatch |
| **5. Fiber-Local Ledger** | Events recorded as entity state changes | Events recorded as predicate-local relational transitions | Medium impact on event schema |
| **6. Predication Messaging** | Messages are task descriptions or tool outputs | All messages are SPO assertions with epistemic state | High impact on agent communication |
| **7. Fiber-Aware MCP** | Tools expose entity properties (IDs → attributes) | Tools expose fiber operations (predicates → facts) | High impact on tool interface |

---

## Quick Decision Matrix

**What to implement first:**

| Phase | What | Why | Effort | Impact | Priority |
|-------|------|-----|--------|--------|----------|
| 1 | Document semantic reframing | Establishes shared understanding | Low | Medium | High |
| 2 | Tag rules by nucleus | Enables dual-nucleus closure | Low | Medium | High |
| 2 | Extend ledger schema | Makes facts trace-aware | Low | High | High |
| 2 | Compute three-layer cache | Separates asserted/saturated/stable | Medium | High | High |
| 3 | Formalize trace hierarchy | Enables trace-aware dispatch | Medium | Very High | Medium |
| 3 | Implement reindexing | Enables agent-to-agent communication | Medium | Very High | Medium |
| 4 | Reorganize graph by fiber | Makes composition explicit | High | Medium | Lower (future) |
| 5 | Rewrite MCP tools | Makes external interface correct | High | High | Medium (future) |

---

## Fiber Algebra Cheat Sheet

### Extending (⊙): Combine Two Epistemic States
```
a ⊙ b: fuse positive evidence, cross-check against negative evidence
(1,0) ⊙ (1,0) = (1,0)  [both told true]
(1,0) ⊙ (0,1) = (0,1)  [told true AND told false = contradiction]
(0,0) ⊙ (1,0) = (0,1)  [no info + told true → told false (by reductio)]
```

### Restricting (⇒): Test Implication
```
a ⇒ b: does 'a implies b' hold? Bidirectional test.
(1,0) ⇒ (1,0) = (1,0)  [true implies true = yes]
(1,0) ⇒ (0,1) = (0,1)  [true implies false = no]
(0,0) ⇒ (1,0) = (1,0)  [no info implies anything = yes (vacuously)]
```

### Fixed Point Computation
```
Iterate until stable:
  saturated = apply_saturation_rules(fact)
  stable = apply_translation_rules(saturated)
  if (stable == previous) break
```

---

## Trace Hierarchy (Proposed)

```
session-2026-04-04                [coarse: goals, commitments]
  ├─ planning                     [medium: tasks, resources]
  │   ├─ task-123                 [fine: steps, implementations]
  │   │   ├─ step-1               [very fine: details, states]
  │   │   └─ step-2
  │   └─ task-124
  └─ execution                    [medium: actions, results]
      ├─ task-123                 [fine: steps, implementations]
      │   ├─ step-1
      │   └─ step-2
      └─ task-124
```

**Reindexing rules:**
- Coarser → finer: abstract details, state assumptions
- Finer → coarser: aggregate details, lose precision
- Same level: preserve structure

---

## Message Template (Proposed)

```json
{
  "from": {
    "agent": "planner",
    "trace": "session-1::planning"
  },
  "to": {
    "agent": "executor",
    "trace": "session-1::execution::task-123"
  },
  "content": {
    "subject": "task-123",
    "predicate": "is-executable",
    "object": "now",
    "value": {
      "truth": "t",
      "knowledge": "t",
      "evidence": ["all-dependencies-satisfied", "resources-allocated"]
    }
  },
  "reindex": {
    "applied": true,
    "from_granularity": "coarse",
    "to_granularity": "fine",
    "detail_loss": ["estimated-duration", "resource-flexibility"]
  }
}
```

---

## Ledger Entry Template (Proposed)

```json
{
  "timestamp": "2026-04-04T14:23:15Z",
  "event_type": "assertion",
  "subject": "alice",
  "predicate": "is-in-location",
  "object": "office-1",
  "value_old": "f|bot",
  "value_new": "t|t",
  "trace": "session-1",
  "layer": "saturated",
  "nucleus": "saturation",
  "rules_applied": ["location-by-arrival", "arrival-means-present"],
  "source": "agent:executor"
}
```

---

## Tool Interface Evolution

### Current (Entity-Centric)
```javascript
// Input: entity ID
// Output: entity properties
getTool("get-person", "person-123")
→ { name: "Alice", age: 30, location: "office-1" }
```

### Required (Fiber-Centric)
```javascript
// Input: fiber query (predicate + wildcards)
// Output: all matching (subject, object) pairs in fiber
getTool("query-is-in-location-fiber", 
  { subject: "alice", object: "?" }
)
→ [
    { subject: "alice", object: "office-1", value: "t|t", trace: "session-1" },
    { subject: "alice", object: "home-1", value: "f|t", trace: "session-1" }
  ]
```

---

## Computation Patterns

### Three-Layer Query
```javascript
const query = (entity, predicate, trace) => {
  return {
    asserted: findAsserted(entity, predicate),
    saturated: findSaturated(entity, predicate),
    stable: findStable(entity, predicate)
  };
};
// Returns fact at each layer with provenance
```

### Nucleus-Tagged Rule
```javascript
const rule = {
  id: "modus-ponens",
  nucleus: "saturation",  // ← NEW
  apply: (facts) => {
    // Derive Q from P and (P → Q)
  }
};
```

### Fiber Composition
```javascript
const fiber = (graph, predicateName) => {
  const pred_id = lookupAttribute(graph, predicateName);
  return graph.eavt.filter(([_, attr, __]) => attr === pred_id);
};
```

---

## What Already Works

1. **EAVT triples** — Already encode SPO structure correctly
2. **Session/phase boundaries** — Already mark traces structurally
3. **Inference rules** — Already exist; just need nucleus tags
4. **Fiber-based queries** — Already possible; just not primary pattern
5. **Ledger recording** — Already logs events; just needs extended schema

**No fundamental architecture change required. Just explicit representation of what's already implicit.**

---

## Red Flags (Architectural Incoherence)

If you see any of these, it's a sign architecture is drifting:

- [ ] Code treating entity as primary and relations as secondary
- [ ] Inference rules that don't fall into "saturation" or "translation" clearly
- [ ] Messages that don't include source and target trace
- [ ] Tools that return entity properties instead of fiber facts
- [ ] Facts in ledger without trace or layer context
- [ ] Agents operating on global knowledge without trace-awareness
- [ ] Values without epistemic state (confidence, contradiction, evidence)

---

## Who Needs to Know What

| Role | Must Know | Should Know | Nice to Know |
|------|-----------|------------|-------------|
| **System Architect** | All requirements, dual nuclei | Mapping examples | Implementation details |
| **Agent Developer** | Trace-awareness, predication messaging | Fiber algebra, reindexing | Mathematical foundation |
| **Tool Builder** | Fiber operations, fiber inputs/outputs | Epistemic state | Trace hierarchy details |
| **Ledger/Database Designer** | Three-layer structure, nucleus tags | Fiber organization | Reindexing mechanics |
| **Team Lead** | Phase priorities, implementation roadmap | High-level requirements | Mathematical details |

---

## FAQ

**Q: Do we have to change everything at once?**
A: No. Phase 1 (semantics) is zero code change. Phase 2 (dual nuclei, ledger) has high impact and moderate effort. Phases 3–5 are progressive refinements. You can stop at any phase and have a working system.

**Q: Will this break existing code?**
A: No, if you implement carefully. EAVT triples are already SPO; just document it. Rules can be tagged without changing execution. Ledger schema can be extended backwards-compatibly. Trace-awareness is additive. No destructive changes required.

**Q: Is this faster or slower?**
A: Coherent systems are usually faster. Redundant computations drop. Caching becomes more efficient. Queries become more precise. But performance work comes after correctness work.

**Q: What if we don't implement this?**
A: The system still works but with persistent incoherence. Parts operate as if relationality is true; parts operate as if it's not. This creates friction, requires special cases, and makes reasoning about the system harder. The architecture will eventually force alignment anyway.

**Q: Why is the dual nucleus needed?**
A: Saturation alone doesn't capture what persists. Translation alone doesn't capture inference. Both are needed for complete information. They commute, so order doesn't matter, but both matter.

---

**Last updated:** 2026-04-04  
**Format:** Reference sheet for print or quick lookup  
**Companion:** Read the full research package for details
