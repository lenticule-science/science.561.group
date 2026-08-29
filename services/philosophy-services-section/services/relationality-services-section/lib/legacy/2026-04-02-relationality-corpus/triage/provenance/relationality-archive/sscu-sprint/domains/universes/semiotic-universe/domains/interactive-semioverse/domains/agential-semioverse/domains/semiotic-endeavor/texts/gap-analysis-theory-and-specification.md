---

name: gap-analysis-theory-and-specification
date-created: 2026-03-08T00:00:00
keywords:
  - semiotic-endeavor
  - gap-analysis
description: "Analysis of what is missing to complete the theory of a semiotic endeavor (what it IS) and the specification of one (how to implement it)."
---

## The three-level pattern

Per plan 0033 naming convention:

- **endeavor** — primary intension: the thing itself, in its field
  of discourse (organization theory, governance)
- **semiotic-endeavor** — secondary intension map: what it IS within
  the agential semioverse (organizational levels, method/practice,
  aspects, closure)
- **semiotic-endeavor-specification** — conformance requirements: what
  an implementation MUST do (interface templates, lifecycle guards,
  normative scope requirements, shared carrier declarations)

Currently semiotic-endeavor (level 2) contains level 3 content.
There is no level 3 document.

## What exists at level 2 (semiotic-endeavor)

The semiotic-endeavor spec (v0.5.0) describes:

- What an endeavor IS: organized, sustained, intentional effort
- Organizational levels: endeavor, project, operation, plan, repository
- Method and practice: the structuration-interface dual applied to
  how work is governed vs how work is done
- Aspects of method: semiotic-* specs as views of a shared pipeline
- Closure conditions: purpose as immanent, Omega as least upper bound
- Lifecycle phases: formation, active conduct, maintenance, dormancy,
  archival

### Level 2 content that belongs at level 2

- The definition of endeavor and its properties
- Organizational levels and their secondary intensions
- Method and practice as concepts (including the formal relationship
  via j/G operators)
- The idea that aspects of method cohere as a system
- The "no implicit contracts" principle
- Closure conditions as the theory of purpose
- Lifecycle phases of the endeavor itself
- Organizational emergence (Sigma)
- Relationship to the semiotic hierarchy

### Level 3 content currently in level 2

These were added during triage mining and should move to
semiotic-endeavor-specification:

- **Method component interface template** (5-section table): this is
  a conformance requirement for aspect specs, not a description of
  what aspects ARE
- **Normative scope declaration requirement**: a conformance
  requirement for aspect specs
- **Cross-aspect invariant dependency requirement**: a conformance
  requirement
- **Shared carriers subsection**: a conformance requirement for the
  method (declare shared types)
- **Lifecycle transition guards table** (draft/candidate/stable/
  deprecated/superseded with entry conditions): conformance
  requirements for spec maturity
- **Error semantics schema** (severity/fault/retryability):
  conformance requirement for procedures

## What is missing at level 2 (theory)

Per decision 0005, several theory gaps were identified. Current status:

1. **Purpose is immanent** — ADDRESSED in spec (closure conditions
   section). Decision: goals emerge from structure, not from
   external declaration.

2. **Temporality** — ADDRESSED in v0.7.0. New "Temporality" section
   derives time from iteration toward fixed points under closure
   pressure. Four temporal scales (session, cycle, phase, duration),
   two temporal modalities (always/eventually from fixed-point
   structure), time as semantic constraint. Grounded in PM cycle
   specification and platform invariants analysis.

3. **Multi-agent coordination** — ADDRESSED in v0.7.0. New
   "Multi-agent coordination" section. Four subsections: coordination
   as mathematical property (non-interference on disjoint regions),
   governance without hierarchy (method as coordination mechanism),
   shared carriers (repository as communication channel), calibration
   (residuated sufficiency from relationality). Grounded in ASR
   multi-agent-coordination theory and reflexive-calibration-theory.

4. **Method vs habit** — ADDRESSED in v0.7.0. New "Method and habit"
   subsection within Method and practice. Articulates distinction:
   habit is any regularity that has achieved closure (implicit,
   individual, persistent); method is habit that has been codified,
   systematized, made prescriptive, and made revisable. Progressive
   automation (policy 001) is the direction of travel from habit to
   method. Grounded in Peirce's habit concept and j operator
   properties.

5. **Repository is implementation-level** — ADDRESSED. Decision 0005
   is clear: repository belongs at spec level, not theory level.
   The spec's repository section is borderline — it describes what
   a repository IS (level 2) but also what it MUST have (level 3).

6. **Projects/operations formalization** — PARTIALLY ADDRESSED. The
   spec defines them with secondary intensions. Decision 0005 says
   check relationality for guidance, which hasn't been done.

7. **Structuration-interface dual** — ADDRESSED as a concept term.
   Decision 0005 says don't formalize it mathematically.

8. **"Agent" terminology** — NOT ADDRESSED. Decision 0005 flags this
   for the agential semioverse spec rewrite (plan 0027).

### Additional theory gaps identified this session

9. **Endeavor identity** — ADDRESSED in v0.7.0. New "Endeavor identity"
   section. Four continuities (repository, method, closure conditions,
   governance) whose conjunction constitutes identity. Identity as
   fixed point of j applied to continuity predicates. Grounded in
   platform invariants analysis (persistence of history, addressable
   things) and policy 005 (accrete don't replace).

10. **Inter-endeavor relationships**: the spec says multiple endeavors
    can operate in the same agential semioverse but says nothing about
    how they relate. Can endeavors compose, conflict, inherit from
    each other?

11. **Method evolution** — ADDRESSED in v0.7.0. New "Method evolution"
    section. Drivers: method-practice gap (method doesn't fit reality),
    emergent practice patterns, compositional pressure from new aspects.
    Constraints: continuity (versioning), coherence (joint
    satisfiability), closure compatibility, evidence. Dynamics:
    feedback loop converging under monotone satisfaction deficit.
    Grounded in practice term's feedback loop and PM lifecycle
    evidence requirements.

### Cross-domain integrations (v0.8.0)

12. **Trust as coordination precondition** — ADDRESSED in v0.8.0. New
    subsection in Multi-agent coordination. Trust is the interpersonal
    precondition for method-based coordination — without it, shared
    method becomes surveillance rather than coordination. New term file
    at terms/trust.md. Grounded in affinity group research, emergent
    disaster response, and counterinsurgency analysis of trust
    destruction.

13. **Method validation epistemology** — ADDRESSED in v0.8.0. New
    "Method validation" subsection in Method evolution. Distinguishes
    greenfield validation (internal consistency) from constraint-forcing
    validation (testing against resistant reality). Maps to draft →
    candidate lifecycle transition. Grounded in constraint-forcing
    demonstrations text.

14. **Recursive process structure** — ADDRESSED in v0.8.0. New
    subsection in Temporality. Makes explicit the structural parallel
    between the intelligence cycle and the encoding loop as instances
    of recursive processes that converge toward closure through
    iterated phases.

15. **Organic intellectuals** — NOT YET ADDRESSED. The spec's "purpose
    is immanent" claim gestures at knowledge production from within
    practice but doesn't cite the sociological grounding (Gramsci,
    Freire, Hampton).

16. **Long-haul coordination** — NOT YET ADDRESSED. COVID-19 mutual
    aid evidence could enrich the lifecycle section's treatment of
    dormancy and sustained coordination without institutional support.

## What is missing at level 3 (specification)

semiotic-endeavor-specification does not exist. It should contain:

### From current level 2 (to be moved)

- Method component interface template (5-section: state, inputs,
  procedures, invariants, outputs)
- Normative scope declaration requirement
- Cross-aspect invariant dependency tracking
- Shared carrier declarations
- Lifecycle transition guards for method components
- Error semantics schema

### Not yet written

- **Repository conformance**: what a repository MUST provide to be
  operable as the body of an endeavor. Currently partly in the
  repository section (semantics.yaml, kind discriminator, operator
  families) but needs to be a proper conformance specification.

- **Aspect registration**: how a new aspect specification is added
  to an endeavor's method. Currently implicit. The spec should define
  the registration process, compatibility checking, and the shared
  carrier update protocol.

- **Method coherence verification**: how to check that an endeavor's
  method is internally consistent. Currently just "invariants must be
  jointly satisfiable" — needs concrete verification procedures.

- **Governance interface**: what governance structures an endeavor
  MUST have. Currently described in semiotic-project-management but
  not as a conformance requirement of the endeavor itself.

- **Lifecycle transition procedures**: not just guards (when can a
  transition happen) but procedures (what steps must be taken to
  transition).

## What is missing in PM (12 practices)

The semiotic-project-management spec describes 12 PM practices. Status
of each as a recorded work item:

| Practice | Term | Plan | Applied |
|----------|------|------|---------|
| Milestones | milestone.md | 0017 (step 4) | No plans use milestone field |
| WIP limits | wip-limit.md | 0017 | Not enforced |
| Appetites | appetite.md | 0017+0023 | No plans have appetite field |
| Backlog ordering | semantic-gap.md | (0017 partial) | No ordered view |
| Cycles | cycle.md | 0023 | No tracking |
| Retrospectives | (in spec §3.7) | NONE | Never done |
| Roadmap | (in spec §6 table) | NONE | Doesn't exist |
| Hill charts | (in spec §6 table) | NONE | Never mentioned |
| Board visualization | board.md | 0017 | review-plans list only |
| Versions/releases | NONE | NONE | No concept |
| Circuit breaker | circuit-breaker.md | 0023 | Never triggered |
| Definition of Done | (in spec §6 table) | 0022 | Per-plan only |

Missing plans needed:
- Retrospectives plan
- Roadmap/milestone-sequence plan
- Versions/releases concept + plan

Hill charts may not need a plan — they're a visualization technique
that depends on board view existing first (plan 0017).

## Implicit work not in the plan system

The user identified three categories of implicit work:

1. **Predicate graph errors** — 40 MUST errors, 417 SHOULD warnings.
   Per the PM spec, these ARE the backlog. But they aren't in the
   plan system. Plan 0024 (unplanned work intake) would convert
   these, but 0024 is proposed, not active.

2. **TODO.md unplanned items** — 9 items (Lean/Agda formalization,
   interpret-message refinement, ASR rewrite, predicate graph
   completion, GOVERNANCE.md, AI contribution policy, style guide
   compliance, vocabulary audit, scripts cleanup). Plan 0024 covers
   converting these.

3. **Pipeline gap (Goal 005)** — RDF generation not in build, SHACL
   not validated, predicate graph not via MCP, SPARQL not available.
   Goal 005 exists and has key results, but no serving plans are
   active.

## Recommended priority

1. **Create semiotic-endeavor-specification** — move level 3 content
   out of semiotic-endeavor. This fixes the structural confusion.

2. **Create missing PM plans** — retrospectives, roadmap,
   versions/releases. This ensures all 12 practices are tracked.

3. **Activate plan 0017** (board + WIP) — this is the foundation for
   all other PM implementations. Without board view and WIP
   enforcement, the other practices can't be applied.

4. **Activate plan 0024** (unplanned work intake) — convert implicit
   work into plans. This connects the predicate graph errors and
   TODO.md items to goals.

5. **Address theory gaps** (#2 temporality, #3 multi-agent, #9
   identity, #11 method evolution) — research from repo content per
   decision 0005, then write.
