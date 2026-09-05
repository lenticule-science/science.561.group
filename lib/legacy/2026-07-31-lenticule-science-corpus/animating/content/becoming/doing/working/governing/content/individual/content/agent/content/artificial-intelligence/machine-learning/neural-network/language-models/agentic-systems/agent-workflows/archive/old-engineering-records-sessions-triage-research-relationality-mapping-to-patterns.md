---
name: relationality-mapping-to-patterns
date-created: 2026-04-04
description: "Concrete mappings from mathematical objects (fibers, nuclei, traces, reindexing) to existing code patterns, data structures, and proposed system components."
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

This document maps abstract mathematical concepts from the predication paper and GSU specification to concrete patterns in the 561 system. It serves as a bridge between pure theory and implementation.

## Part A: From Mathematics to Data Structures

### Fiber → Predicate in EAVT

**Mathematical object:** A fiber is the collection of all (subject, object, value) triples using a predicate $p$.

$$\mathrm{Fib}(p) = \{ \langle s, o, v \rangle : \langle s, p, o \rangle \in \mathcal{S} \text{ with value } v \}$$

**Current system encoding:**

```json
// In knowledge-graph.json EAVT triples
[
  [1, 5, "alice"],        // entity 1, attr 5 ("has-name"), value "alice"
  [1, 12, "bob"],         // entity 1, attr 12 ("knows"), value "bob"
  [2, 5, "bob"],          // entity 2, attr 5 ("has-name"), value "bob"
]
```

Here, attribute 5 is the predicate "has-name". To extract its fiber:

```json
// fiber("has-name")
[
  [1, 5, "alice"],   // subject=1, object="alice"
  [2, 5, "bob"],     // subject=2, object="bob"
]
```

**Pattern: Fiber as Query Filter**

```javascript
// Get all facts in a specific fiber (predicate)
const fiber = (graph, predicateName) => {
  const predicateId = graph.attrs[Object.keys(graph.attrs).find(
    k => graph.attrs[k] === predicateName
  )];
  return graph.eavt.filter(([e, a, v]) => a === predicateId);
};

// Extract a fiber's algebraic structure
const fiberAlgebra = (fiber) => {
  const subjects = new Set(fiber.map(([e, _, __]) => e));
  const objects = new Set(fiber.map(([_, __, v]) => v));
  return { subjects, objects, triples: fiber };
};
```

**Architectural implication:** Tools should be wired to think about fibers as first-class objects, not iterate through all facts and filter post-hoc.

---

### Bilattice Value → Epistemic State

**Mathematical object:** Each value in a fiber is drawn from the bilattice $\mathbf{2} \otimes \mathbf{2}$, representing four epistemic states:

- $\bot = (0,0)$ — no information
- $t = (1,0)$ — told true
- $f = (0,1)$ — told false
- $\top = (1,1)$ — told both (conflicting information)

**Current system encoding:**

```yaml
# In markdown frontmatter
title: "Alice"
status: "active"
knows: ["bob", "charlie"]
```

**Required encoding:** Epistemic state must be explicit in EAVT values.

```json
// Proposal: string representation of bilattice value
[
  [1, 5, "alice|t"],              // entity 1, "has-name", value "alice" with confidence t (told true)
  [1, 12, "bob|t|f|top"],         // entity 1, "knows", "bob" with conflicting info
  [1, 12, "charlie|t|f"],         // entity 1, "knows", "charlie" with contradiction
]

// Alternative: structured object in value
[
  [1, 5, { object: "alice", truth: "t", knowledge: "t" }],
  [1, 12, { object: "bob", truth: "t", knowledge: "bot" }],
]
```

**Pattern: Bilattice Operations on Values**

```javascript
// Parse bilattice value
const parseValue = (v) => {
  if (typeof v === "string" && v.includes("|")) {
    const [obj, ...parts] = v.split("|");
    return {
      object: obj,
      truth: parts[0] || "bot",
      knowledge: parts[1] || "bot"
    };
  }
  return { object: v, truth: "t", knowledge: "t" };  // default: told true
};

// Extending operation (⊙): combine epistemic states
const extend = (a, p) => {
  // a ⊙ p combines subject's epistemic state with predicate's state
  const truthResult = (a.truth === "t" && p.truth === "t") ? "t" : (a.truth === "f" || p.truth === "f") ? "f" : "bot";
  const knowResult = (a.knowledge === "t" && p.knowledge === "t") ? "t" : (a.knowledge === "bot" || p.knowledge === "bot") ? "bot" : "top";
  return { truth: truthResult, knowledge: knowResult };
};

// Restricting operation (⇒): implication
const restrict = (a, p, q) => {
  // a ⇒ q tests whether p ≤ (a ⇒ q)
  // Shorthand: does implication hold?
  return (a.truth === "f" || p.truth === "f" || q.truth === "t") ? "t" : "f";
};
```

**Architectural implication:** Every triple value should carry epistemic state. Tools should preserve epistemic state when querying, combining, or updating facts.

---

### Fixed Fiber (H*) → active Layer

**Mathematical object:** The fixed fiber $H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ is the set of propositions stable under both saturation and translation nuclei.

$$H_t^* = \{ a \in H_t : \sigma_t(a) = a \text{ and } \Delta_t(a) = a \}$$

**Current system encoding:** Not explicitly represented. We compute saturated state but not translation-invariant state.

**Required encoding:** Three layers in ledger/graph.

```json
// Proposed structure: fact with layer information
{
  "subject": "task-123",
  "predicate": "is-ready",
  "object": "planner",
  "layers": {
    "asserted": "f",          // what was directly asserted
    "saturated": "t",         // what holds after saturation closure
    "stable": "f"             // what holds after both closures
  },
  "trace": "session-1",
  "nucleus-tags": {
    "saturation": ["rule-5", "rule-12"],  // which saturation rules apply
    "translation": []                      // which translation rules apply
  }
}
```

**Pattern: Multi-Layer Query**

```javascript
// Query a fact at different layers
const query = (graph, subject, predicate, object, layer = "stable") => {
  const triple = graph.eavt.find(
    [s, p, o] => s === subject && p === predicateId(predicate)
  );
  if (!triple) return null;
  
  // Resolve the fact at the requested layer
  const fact = layerCache[layer][triple];
  return fact ? fact.value : null;
};

// Three layers, computed independently
const layerCache = {
  asserted: {},     // direct input
  saturated: {},    // after saturation closure
  stable: {}        // after both closures
};

// Compute saturation closure (fixed point of σ)
const saturate = (fact) => {
  let current = fact;
  let previous;
  while (previous !== current) {
    previous = current;
    current = applyAllSaturationRules(current);
  }
  return current;
};

// Compute translation invariance (fixed point of Δ)
const translateInvariant = (fact, fromTrace, toTrace) => {
  // Check if fact remains true when reindexed from fromTrace to toTrace
  const reindexed = reindex(fact, fromTrace, toTrace);
  return areEqual(fact, reindexed);
};
```

**Architectural implication:** The ledger should track which layer a fact belongs to. Queries should specify which layer they want. Facts move between layers as rules are applied.

---

## Part B: From Mathematics to Operational Patterns

### Nucleus → Closure Operator

**Mathematical object:** A nucleus on a Heyting algebra is an extensive, idempotent, meet-preserving endomorphism.

$$\sigma: H \to H \text{ where } a \leq \sigma(a), \quad \sigma(\sigma(a)) = \sigma(a), \quad \sigma(a \wedge b) = \sigma(a) \wedge \sigma(b)$$

**Two distinct nuclei in the system:**

**Saturation nucleus (σ):** Applies inference rules to reach stable equilibrium.

```javascript
const saturationNucleus = (fact, rules) => {
  // Keep applying saturation rules until fixed point
  let current = { ...fact };
  let changed = true;
  
  while (changed) {
    changed = false;
    for (const rule of rules.filter(r => r.nucleus === "saturation")) {
      const result = rule.apply(current);
      if (!equal(result, current)) {
        current = result;
        changed = true;
      }
    }
  }
  
  return current;
};

// Example saturation rules
const saturationRules = [
  {
    nucleus: "saturation",
    name: "modus-ponens",
    apply: (fact) => {
      // If we know "P → Q" and "P", derive "Q"
      const p = findFact(subject, "implies", object);
      const q = findFact(object, "holds", fact.subject);
      if (p && q) {
        return { ...fact, truth: "t" };  // Strengthen confidence
      }
      return fact;
    }
  },
  {
    nucleus: "saturation",
    name: "universal-instantiation",
    apply: (fact) => {
      // If "all X have P", and this is an X, then it has P
      // ...
    }
  }
];
```

**Translation nucleus (Δ):** Checks if facts persist across trace boundaries.

```javascript
const translationNucleus = (fact, traces) => {
  // Keep checking if fact remains true across trace transitions
  let current = fact;
  let stable = true;
  
  for (const transition of traces) {
    const reindexed = reindex(current, transition.from, transition.to);
    if (!equal(reindexed, current)) {
      // Fact changed across this trace boundary
      stable = false;
      // Mark as translation-variant
      current.translation_variant = true;
    }
  }
  
  return current;
};

// Example translation rules
const translationRules = [
  {
    nucleus: "translation",
    name: "session-persistence",
    apply: (fact, fromTrace, toTrace) => {
      // Does this fact persist from session A to session B?
      if (isSessionBoundary(fromTrace, toTrace)) {
        // Session-local facts don't persist
        if (fact.scope === "session-local") {
          return null;  // Fact doesn't survive
        }
      }
      return fact;
    }
  },
  {
    nucleus: "translation",
    name: "plan-phase-transition",
    apply: (fact, fromTrace, toTrace) => {
      // Does this fact persist from planning to execution phase?
      if (fromTrace.phase === "planning" && toTrace.phase === "execution") {
        // Commitments (predicate "is-committed") persist
        if (fact.predicate === "is-committed") {
          return fact;
        }
      }
      return fact;
    }
  }
];
```

**Pattern: Dual-Nucleus Closure**

```javascript
// Compute fixed fiber: apply both nuclei until convergence
const computeFixedFiber = (facts, saturationRules, translationRules, traces) => {
  const fixed = {};
  
  for (const fact of facts) {
    // Apply saturation
    let saturated = saturationNucleus(fact, saturationRules);
    
    // Check translation invariance
    const translationStable = translationNucleus(saturated, traces);
    
    if (translationStable) {
      fixed[fact.id] = saturated;  // This fact is in the fixed fiber
    } else {
      // This fact is saturation-active but translation-variant
      // Keep track separately
    }
  }
  
  return fixed;
};
```

**Architectural implication:** Rules must be tagged by nucleus. The inference engine must compute saturation and translation closures as separate operations. The fixed fiber (intersection) is the most reliable layer for answers.

---

### Trace → Agent Context

**Mathematical object:** A trace is a canonical sequence of relational steps describing how a proposition was constructed. Propositions are trace-relative.

$$t: \text{sequence of steps} \quad H_t: \text{Heyting algebra at trace } t$$

**Current system encoding:** Sessions and plans exist but are not formalized as traces.

**Required encoding:** Traces as first-class system components.

```javascript
// Trace hierarchy
const traces = {
  "session-2026-04-04": {
    type: "session",
    granularity: "coarse",
    parent: null,
    steps: ["start", "planning", "execution", "review"],
    fiber_algebra: {
      // Propositions at session level are about goals and commitments
      "is-committed": true,
      "is-planning": true,
      "is-executing": true,
    }
  },
  "session-2026-04-04::planning": {
    type: "phase",
    granularity: "medium",
    parent: "session-2026-04-04",
    steps: ["goal-formulation", "task-decomposition", "resource-allocation"],
    fiber_algebra: {
      // Propositions at planning level are about tasks and resources
      "has-goal": true,
      "is-decomposed-into": true,
      "requires-resource": true,
    }
  },
  "session-2026-04-04::planning::task-123": {
    type: "task",
    granularity: "fine",
    parent: "session-2026-04-04::planning",
    steps: ["design", "code", "test"],
    fiber_algebra: {
      // Propositions at task level are about steps and implementations
      "is-designed": true,
      "is-coded": true,
      "is-tested": true,
    }
  }
};

// Reindexing between traces
const reindex = (fact, fromTrace, toTrace) => {
  const fromGranularity = traces[fromTrace].granularity;
  const toGranularity = traces[toTrace].granularity;
  
  if (fromGranularity === "fine" && toGranularity === "coarse") {
    // Reindex down (abstract): lose detail
    return abstract(fact);
  } else if (fromGranularity === "coarse" && toGranularity === "fine") {
    // Reindex up (refine): add detail
    return refine(fact);
  } else if (sameLevel(fromTrace, toTrace)) {
    // Sibling reindex: preserve structure
    return fact;
  }
};
```

**Pattern: Trace-Aware Agent Dispatch**

```javascript
// Agent dispatch includes trace context
const dispatchAgent = (agentType, task, trace) => {
  // Agent operates within its trace's fiber algebra
  const agentTrace = getAgentTrace(agentType, trace);
  const agentFibers = traces[agentTrace].fiber_algebra;
  
  // Agent can only work with predicates in its fiber algebra
  const relevantFacts = facts.filter(f => 
    agentFibers[f.predicate]
  );
  
  return {
    agent: agentType,
    trace: agentTrace,
    task: task,
    workspace: relevantFacts
  };
};

// Example: dispatch planner
dispatchAgent("planner", "decompose-objective", "session-2026-04-04::planning");
// Planner works at medium granularity with "has-goal", "is-decomposed-into" predicates

// Example: dispatch executor
dispatchAgent("executor", "execute-step", "session-2026-04-04::planning::task-123");
// Executor works at fine granularity with "is-designed", "is-coded" predicates
```

**Architectural implication:** Agents should be bound to traces at dispatch time. Agent specifications should include which predicates they can operate on. Agent-to-agent communication is reindexing between traces.

---

### Reindexing Functor → Message Adaptation

**Mathematical object:** For each morphism $f: t \to t'$ in the trace category, reindexing is a functor $H(f): H_{t'} \to H_t$ preserving propositional structure.

$$H(f)(a \wedge_{t'} b) = H(f)(a) \wedge_t H(f)(b)$$

**Current system encoding:** Not present. Agents don't understand reindexing; they just receive facts.

**Required encoding:** Explicit reindexing in agent communication.

```javascript
// Reindexing map between traces
const reindexingFunctor = (fact, sourceFiber, targetFiber) => {
  // Preserve propositional structure (meets, joins, implications)
  
  const abstractionLevel = (fiber) => traces[fiber].granularity;
  
  if (abstractionLevel(sourceFiber) > abstractionLevel(targetFiber)) {
    // Abstracting downward: lose detail
    return {
      ...fact,
      detail_level: "abstract",
      original_trace: sourceFiber,
      confidence: decreaseConfidence(fact.confidence)
    };
  } else if (abstractionLevel(sourceFiber) < abstractionLevel(targetFiber)) {
    // Refining upward: add assumptions
    return {
      ...fact,
      detail_level: "refined",
      original_trace: sourceFiber,
      refinement_assumptions: getAssumptions(fact)
    };
  } else {
    // Same level: preserve as-is
    return fact;
  }
};

// Pattern: Message with explicit reindexing
const message = {
  from_agent: "planner",
  from_trace: "session-2026-04-04::planning",
  to_agent: "executor",
  to_trace: "session-2026-04-04::planning::task-123",
  
  content: {
    subject: "task-123",
    predicate: "is-committed",
    object: "to-completion-by-2026-04-06",
    original_value: "t",
    
    // Reindexing applied
    reindexed_value: reindexingFunctor(
      { subject: "task-123", predicate: "is-committed", value: "t" },
      "session-2026-04-04::planning",
      "session-2026-04-04::planning::task-123"
    )
  }
};
```

**Architectural implication:** Messages should include both source trace and target trace. The message itself carries the reindexing operation. Agents should validate that reindexing is structure-preserving.

---

## Part C: Existing Patterns That Already Encode Mathematics

### 1. EAVT Triples Encode Bilattice-Valued Predication

The current `[entity, attribute, value]` format already captures SPO at scale. The only missing piece is making epistemic state explicit in the value field.

**Quick win:** Parse values as `"object|truth|knowledge"` and validate the bilattice operations.

### 2. Sessions Already Correspond to Traces

Sessions mark coarse-level boundaries. Phases (planning/execution) mark finer boundaries. Plans contain tasks. This is already a trace hierarchy.

**Quick win:** Formalize the hierarchy. Tag all facts with their trace context.

### 3. Rules Already Exist; Just Need Nucleus Tags

Saturation rules (inference, logic) and translation rules (persistence, temporal) exist in the system. Just need to label them.

**Quick win:** Review all rules in `operations/command/records/rules/` and tag each with `nucleus: saturation` or `nucleus: translation`.

### 4. Ledger Entries Already Can Carry Nucleus Info

The event-jsonl format can be extended to include `nucleus` and `layer` fields.

**Quick win:** Add these fields to new entries. Compute which layer (asserted/saturated/stable) each event belongs to.

---

## Part D: Implementation Checklist

- [ ] **Semantics (no code changes):**
  - [ ] Document how EAVT triples are bilattice-valued predications
  - [ ] Define fiber, nucleus, trace terminology in repo glossary
  - [ ] Create guides for reinterpreting queries as fiber operations

- [ ] **Value Representation:**
  - [ ] Extend EAVT value format to include epistemic state
  - [ ] Implement bilattice operations (extend, restrict) on values
  - [ ] Update graph generator to preserve epistemic state

- [ ] **Rule System:**
  - [ ] Tag all rules with `nucleus: saturation` or `nucleus: translation`
  - [ ] Implement dual-nucleus closure operator
  - [ ] Compute three-layer ledger (asserted, saturated, stable)

- [ ] **Trace System:**
  - [ ] Formalize trace hierarchy (session → phase → task)
  - [ ] Implement reindexing functors between trace levels
  - [ ] Bind agents to traces at dispatch time

- [ ] **Messaging:**
  - [ ] Standardize message format as SPO with epistemic state
  - [ ] Include source/target trace in messages
  - [ ] Implement reindexing in message delivery

- [ ] **Ledger:**
  - [ ] Extend event schema with `nucleus`, `layer`, `trace` fields
  - [ ] Store layer information for each fact
  - [ ] Make ledger queries fiber-local

---

**Document completed:** 2026-04-04  
**Next steps:** Implement high-impact patterns (value representation, rule tagging, ledger extension) before full trace-aware redesign
