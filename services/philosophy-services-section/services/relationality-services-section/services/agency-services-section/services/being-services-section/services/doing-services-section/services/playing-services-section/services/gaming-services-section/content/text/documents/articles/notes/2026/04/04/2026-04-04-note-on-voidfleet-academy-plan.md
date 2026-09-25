---
title: Voidfleet Academy Closure-Operator Training Plan
description: Unified training system using closure operators and cognitive theory to formalize duty cells and competency progression.
date-created: 2026-04-04
type: note
name: voidfleet-academy-plan
keywords:
  - closure-operator
  - duty-cells
  - formality-progression
  - competency-gates
  - cognitive-scaffolding
specialization: plan
application: learning
serves-system: cross-cutting
project: charter-and-governance
department: science
cross-cuts: [engineering, command]
depends-on: [voidfleet-academy-plan-context, session-lifecycle-infrastructure, cl-pipeline, transactional-record-infrastructure]
enabled-by:
  - cannibalize-pm-systems
  - lens-entity-system
  - session-lifecycle-infrastructure
  - system-infrastructure
in-service-of: lib/emsenn/services/561-group/services/561-group-services-section
---

Voidfleet Academy is the unified training and continuous-improvement system for all crew, human and AI. The key insight (captain, 2026-04-04): a duty definition IS a cell, but fuzzy — site/fibers/constructors/laws present but prose-specified rather than algebraic. Training is sharpening: applying a closure operator until a fixed point (idempotence replaces confidence thresholds). Formality progression F0→F1→F2→F3 IS the curriculum — raw observation, prose pattern, parameterized procedure, algebraic specification. PQS-style competency gates replace observation-count thresholds; situated-learning scoping by community-of-practice grounds in Lave & Wenger; training is a transaction on the operational ledger. The plan moves through four phases: Phase 1 research (education theory, naval/maritime crew training, model continuous-learning-as-closure); Phase 2 map existing duty/office/role onto the cell algebra; Phase 3 design curriculum and certification; Phase 4 build AI infrastructure (integrates with cl-pipeline and plaintext-accounting-operations) and human onboarding. Full fuzzy-cell mapping table, algebraic-learning-calculus detail, and phase rationale live in `analyses/voidfleet-academy-plan-context.md`.

Open: what demonstrations of competency are acceptable per duty (PQS gates need concrete criteria); how office-scoped vs. community-of-practice-scoped instincts interact; whether fine-tuning is in-scope or deferred; what human-crew onboarding looks like when no humans have been onboarded yet.

## World-sim math enrichment (from predication-world-sim, 2026-04-06)

The cognitive tradition mappings give the Academy a precise algebraic grounding:

**Training IS Vygotskian scaffolding.** Co-composition with a richer fiber IS scaffolding. A trainee composing alongside an expert acquires predicates through co-composition that they couldn't acquire alone. The scaffolding BECOMES part of the trainee's fiber. When they can compose independently, training is complete. This means: training is not "transferring knowledge" — it's co-composing until the trainee's fiber is rich enough to produce non-⊥ independently.

**The ZPD IS the flow zone IS the potential bilattice.** respond(trainee, challenge) should produce a MIX of t, f, ⊤, and ⊥. All t = already mastered. All ⊥ = too hard. Mixed = optimal training zone. The character sheet's value distribution IS the ZPD detector for each duty.

**Piaget's stages ARE tower levels.** F0→F3 formality progression IS Piaget's developmental stages: each level is a more complex fiber that assimilates what the previous level couldn't. Accommodation (respond() producing ⊤ = contradiction requiring restructuring) IS where real learning happens.

**Certification IS settlement at F5.3.** A certified officer has reached F5.3 on the relevant duty predicates — settled AND partnered. The partnership requirement means certification isn't solo achievement: it requires witnesses (other officers, completed tasks, captain observation).

**The entanglement communication complexity theorem** gives training a cost metric: ent(M) = the number of R7 coordination steps needed to settle a predicate. Training that involves high-entanglement predicates (where Saturate and Transfer nest deeply) costs more coordination than training on low-entanglement predicates. Classical predicates (zero Transfer interaction) are free to train — they settle without communication overhead.

**Retirement-as-vocabulary-fold** (retirement-as-vocabulary-fold idea): when a specialist is retired, proper documentation ensures F5.3 (the specialist becomes vocabulary). This IS the Academy's output: trained capabilities that, when they reach F3, FOLD into deterministic tools. The Academy trains; progressive automation retires; the fold preserves.
