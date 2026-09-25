---
title: "Work Type Classification: Is the 2Ã—2 Enough?"
date-created: 2026-04-03
description: "Evaluating the process/procedure/derivation/inquiry taxonomy against Perrow, Cynefin, Stacey, Thompson, Dreyfus, and Klein â€” does the 2Ã—2 (meaning settled Ã— execution settled) hold up?"
part-of: ops-research-foundations
references:
  perrow1967:
    authors: ["Charles Perrow"]
    title: "A Framework for the Comparative Analysis of Organizations"
    publication: "American Sociological Review, 32(2)"
    year: 1967
  thompson1967:
    authors: ["James D. Thompson"]
    title: "Organizations in Action"
    publication: "McGraw-Hill"
    year: 1967
  snowden-boone2007:
    authors: ["David J. Snowden", "Mary E. Boone"]
    title: "A Leader's Framework for Decision Making"
    publication: "Harvard Business Review, 85(11)"
    year: 2007
  stacey2001:
    authors: ["Ralph D. Stacey"]
    title: "Complex Responsive Processes in Organizations"
    publication: "Routledge"
    year: 2001
  dreyfus1980:
    authors: ["Stuart E. Dreyfus", "Hubert L. Dreyfus"]
    title: "A Five-Stage Model of the Mental Activities Involved in Directed Skill Acquisition"
    publication: "University of California, Berkeley, Operations Research Center"
    year: 1980
  klein1998:
    authors: ["Gary Klein"]
    title: "Sources of Power: How People Make Decisions"
    publication: "MIT Press"
    year: 1998
---

The taxonomy classifies work into four types based on two dimensions: whether meaning is settled (do you know what to do?) and whether execution is settled (do you know how to do it?). The result is a 2Ã—2:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](../terms/process.md) | [Procedure](../../glossary/terms/procedure.md) |
| **Meaning open** | [Derivation](../terms/derivation.md) | [Inquiry](../terms/inquiry.md) |

The question this survey addresses: is this taxonomy adequate? Do established frameworks for classifying work agree with it, extend it, or contradict it?

## Perrow's technology matrix

Charles Perrow's *A Framework for the Comparative Analysis of Organizations* (1967) classifies organizational technologies along two dimensions:

**Task analyzability** â€” can the work be broken down into known steps? High analyzability means the work is well-understood; low analyzability means the work requires search, judgment, or discovery.

**Task variety** â€” how many different situations does the worker encounter? High variety means every case is different; low variety means most cases are similar.

Perrow's four cells:

| | Low variety | High variety |
|---|---|---|
| **High analyzability** | Routine (assembly line) | Engineering (custom manufacturing) |
| **Low analyzability** | Craft (artisan work) | Non-routine (research) |

The mapping to our taxonomy:
- Routine â†’ **Process** (meaning settled, execution settled)
- Engineering â†’ **Procedure** (meaning settled, execution open â€” you know what to build but each case requires different steps)
- Craft â†’ **Derivation** (meaning open, execution settled â€” the execution is practiced but the creative judgment is open)
- Non-routine â†’ **Inquiry** (meaning open, execution open)

The fit is strong. Perrow's "analyzability" corresponds to our "meaning settled" â€” can you specify in advance what the work should produce? Perrow's "variety" corresponds roughly to our "execution settled" â€” does the same approach work every time?

The difference: Perrow's dimensions are continuous, not binary. Work can be partially analyzable or somewhat varied. Our 2Ã—2 treats the dimensions as binary (settled/open). This is a deliberate simplification for operational purposes â€” the binary classification determines how the dispatch stage routes work (process-type tasks can be automated; inquiry-type tasks need capable agents). The continuous version is more descriptive; the binary version is more actionable.

## Thompson's interdependence types

James Thompson's *Organizations in Action* (1967) classifies work not by its internal structure but by how work units relate to each other:

**Pooled interdependence** â€” units contribute to the whole but don't interact. Each unit's failure is independent. Example: regional sales offices.

**Sequential interdependence** â€” one unit's output is another's input, in a fixed order. Example: assembly line stations.

**Reciprocal interdependence** â€” units pass work back and forth. Example: emergency room and surgical team.

Thompson's taxonomy is orthogonal to ours. It classifies the dependencies between work units, not the nature of the work itself. A process-type task can have pooled, sequential, or reciprocal dependencies with other tasks. The `depends-on` frontmatter key captures sequential interdependence. Reciprocal interdependence is harder â€” it means two tasks affect each other, which our current model (unidirectional dependencies) doesn't fully represent.

This suggests an extension: the dependency model should distinguish dependency types. `depends-on` is sequential. A new relation â€” `co-depends` or `reciprocal-with` â€” would capture reciprocal interdependence. This matters for dispatch: reciprocally interdependent tasks should be assigned to agents who can coordinate in real time (or to the same agent).

## Cynefin: sense-making domains

David Snowden and Mary Boone's Cynefin framework (2007) classifies situations by the relationship between cause and effect:

**Clear** (formerly "obvious") â€” cause and effect are evident to everyone. Best practice applies. Sense-categorize-respond.

**Complicated** â€” cause and effect require expertise to discern. Good practice applies. Sense-analyze-respond.

**Complex** â€” cause and effect are only coherent in retrospect. Emergent practice. Probe-sense-respond.

**Chaotic** â€” no relationship between cause and effect at the system level. Novel practice. Act-sense-respond.

**Confused** â€” you don't know which domain you're in.

The mapping to our taxonomy:
- Clear â†’ **Process** (meaning and execution settled; just follow the practice)
- Complicated â†’ **Procedure** (meaning settled; execution requires analysis and branching)
- Complex â†’ **Inquiry** (meaning and execution both open; you probe and discover)
- Chaotic â†’ no direct mapping â€” chaotic situations require immediate action to establish order, which is more about incident response than work type

Cynefin adds the crucial insight that work type is not fixed. A situation can shift from complicated to complex (an unexpected interaction emerges) or from complex to clear (a pattern is discovered and standardized). Our settlement path captures exactly this: work starts as inquiry, settles through derivation and procedure to process. Cynefin confirms that this is a real phenomenon, not just an organizational preference.

**The disorder domain** (confused) is an important addition. When you don't know what type of work you're doing, you're in disorder. The first act is to figure out which domain you're in â€” which means the first act is itself an inquiry. This recursive structure (the classification of work is itself work that must be classified) is inherent in any self-referential system.

## Stacey matrix: agreement and certainty

Ralph Stacey's matrix (2001) adds a second dimension that our taxonomy doesn't capture: the degree of agreement among stakeholders. Stacey plots two axes:

- **Certainty** â€” how well-understood is the technical solution? (This corresponds to our "execution settled")
- **Agreement** â€” how well do stakeholders agree on what should be done? (This is related to but not identical with our "meaning settled")

The distinction matters. "Meaning settled" in our taxonomy means the goal is clear â€” we know what the work should produce. But "agreement" in Stacey's sense is broader: even if the goal is clear, different stakeholders may disagree about priorities, methods, or trade-offs. A task can have settled meaning (everyone agrees on the goal) but low agreement (people disagree about how to prioritize it relative to other work).

This suggests our "meaning settled" dimension conflates two sub-dimensions: clarity of the goal AND agreement on its priority. For a single-user system (one principal, one agent), agreement is trivial â€” the user decides. For a multi-agent multi-principal system, agreement becomes a real dimension. The dispatch stage would need to handle disagreement: when two principals assign conflicting priorities, how does the system resolve it?

## Dreyfus skill model

Stuart and Hubert Dreyfus's five-stage skill acquisition model (1980) describes how practitioners develop from novice to expert:

1. **Novice** â€” follows context-free rules
2. **Advanced beginner** â€” recognizes situational aspects
3. **Competent** â€” chooses among approaches
4. **Proficient** â€” sees the whole situation intuitively
5. **Expert** â€” acts from absorbed understanding

The Dreyfus model doesn't classify work â€” it classifies the worker's relationship to the work. The same task can be process-type for an expert (they do it automatically) and inquiry-type for a novice (they don't know where to start). This means work type is not an intrinsic property of the task. It is a relation between the task and the agent.

In practice: a task's declared work type should be understood as "work type given the expected agent capability." A task marked `process` assumes the agent has expert-level skill for that work. If a novice agent receives it, the effective work type is higher (procedure or inquiry). The dispatch stage should account for this: match not just capability but skill level.

## Klein: recognition-primed decisions

Gary Klein's *Sources of Power* (1998) studies how experts make decisions under time pressure. The recognition-primed decision model (RPD): experienced practitioners don't analyze options â€” they recognize the situation, mentally simulate the first plausible course of action, and if it works in simulation, they execute it. Analysis happens only when simulation reveals a problem.

RPD explains why proficient and expert agents (Dreyfus levels 4-5) can execute procedure-type work as if it were process-type. They don't consciously branch â€” they recognize the pattern and act. The conscious branching (procedure) is what competent agents (level 3) do. Novice agents (level 1-2) need explicit process-type instructions.

In practice: agents develop recognition through accumulated experience â€” captured patterns, heuristics, and learned responses. As these accumulate and gain confidence, the agent's effective skill level rises â€” inquiry becomes derivation, derivation becomes procedure, procedure becomes process. The settlement path IS skill acquisition applied to the organization itself.

## Evaluation: does the 2Ã—2 hold?

After surveying six frameworks:

**The 2Ã—2 is valid.** Every framework maps onto it. Perrow's dimensions align directly. Cynefin's four domains correspond to our four types. The binary simplification is deliberate and actionable â€” it determines routing, not description.

**Two extensions are needed:**

1. **Interdependence type** (from Thompson) â€” whether tasks are independent, sequential, or reciprocal. This affects dispatch and coordination. Add a `dependency-type` frontmatter key.

2. **Work type is relational, not intrinsic** (from Dreyfus) â€” a task's effective work type depends on the agent's skill level. The `work-type` key on the task should be understood as "work type for a capable agent." The dispatch stage adjusts based on the actual agent.

**One addition may be needed:**

3. **Agreement dimension** (from Stacey) â€” for multi-principal systems, who has authority to define priorities and resolve conflicts? This becomes relevant when the system serves multiple users or organizations. For now (single principal), it is not needed.

The four types are sufficient for single-principal systems. They may need enrichment when scaling to multiple principals and agents with varying skill levels.

## See also

- [process](../terms/process.md), [procedure](../../glossary/terms/procedure.md), [derivation](../terms/derivation.md), [inquiry](../terms/inquiry.md) â€” the four work types
- [work](../terms/work.md) â€” the umbrella term
- [The Ontology of Work Operations](./2026-04-03-note-on-ontology-of-work-operations.md) â€” how the ontology applies to work

## Earlier material

The mapping to our taxonomy:
- Routine → **Process** (meaning settled, execution settled)
- Engineering → **Procedure** (meaning settled, execution open — you know what to build but each case requires different steps)
- Craft → **Derivation** (meaning open, execution settled — the execution is practiced but the creative judgment is open)
- Non-routine → **Inquiry** (meaning open, execution open)

The fit is strong. Perrow's "analyzability" corresponds to our "meaning settled" — can you specify in advance what the work should produce? Perrow's "variety" corresponds roughly to our "execution settled" — does the same approach work every time?

**Clear** (formerly "obvious") — cause and effect are evident to everyone. Best practice applies. Sense-categorize-respond.

The mapping to our taxonomy:
- Clear → **Process** (meaning and execution settled; just follow the practice)
- Complicated → **Procedure** (meaning settled; execution requires analysis and branching)
- Complex → **Inquiry** (meaning and execution both open; you probe and discover)
- Chaotic → no direct mapping — chaotic situations require immediate action to establish order, which is more about incident response than work type

1. **Novice** — follows context-free rules
2. **Advanced beginner** — recognizes situational aspects
3. **Competent** — chooses among approaches
4. **Proficient** — sees the whole situation intuitively
5. **Expert** — acts from absorbed understanding

1. **Interdependence type** (from Thompson) — whether tasks are independent, sequential, or reciprocal. This affects dispatch and coordination. Add a `dependency-type` frontmatter key.

- [process](../articles/terms/process.md), [procedure](../../glossary/terms/procedure.md), [derivation](../articles/terms/derivation.md), [inquiry](../articles/terms/inquiry.md) — the four work types
- [work](../articles/terms/work.md) — the umbrella term
- [The Ontology of Work Operations](../articles/notes/ontology-of-work-operations.md) — how the ontology applies to work
