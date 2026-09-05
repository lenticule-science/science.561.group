---
name: agentic-to-fars-refactor
specialization: plan
date-created: 2026-04-06
project: flatfile-system
department: engineering
serves: [system-architecture-refactor]
enabled-by:
  - constraint-design
  - migrate-to-systems
serves-system: fars
work-type: procedure
horizon: quarter
owner: first-officer
priority: 2
depends-on:
  - rewrite-fars-as-fams
  - constraint-design
soft-depends-on: [foah-self-install]
dependency-note: "Previously listed foah-self-install as a hard dependency, creating a cycle (this plan depends on foah-self-install, foah-self-install depended on this plan). Corrected 2026-04-07: foah-self-install is a soft dependency — the refactor benefits from FOAH being live but can begin with classification and single-hook pilots before FOAH self-installs. constraint-design remains a hard dependency for the guard hook refactoring specifically."
also-serves:
  - pws-core-systems-design: "The refactored hooks ARE the world sim's event handlers"
  - sunday-funday-sprint: "The refactored hooks ARE the gamification event system"
  - cl-pipeline: "The refactored learning tools ARE the CL pipeline's core"
  - plaintext-accounting-operations: "The refactored accounting hooks ARE the ledger"
---

The agentic/ directory has 44 hooks and 83 tools — 127 JS files totaling thousands of lines.
Most do ad-hoc string matching over files, reimplementing logic that respond() handles in one call.
The refactor replaces scripts with algebra.

## Hooks are interfacers (2026-04-06 captain directive)

**Zero exceptions.** ALL hooks become messages to FARS.
The constraint logic lives in entity fibers, not in JavaScript.
The hook is always a thin adapter: parse input → message(entity, payload) → read settlement → exit code.
Even boundary guards (safety-guard, detect-secrets) — the LOGIC is predicates on constraint entities, the JS is just plumbing.

This follows from the same principle as "verbs are fibers, not code" (Zork). safety-guard.js currently has 50+ regex patterns in JavaScript arrays.
In the FARS model, each constraint is an entity with predicates (pattern, applies-to, blocks, severity, reason).
The hook sends message(safety-constraints, {tool, command}) and settlement composes the command against constraint fibers to produce t (allow) or f (block).

**Performance for hot-path hooks:** Loading the full graph (47K entities) for a PreToolUse hook is too slow.
Solution: constraint fibers are precompiled into a fast-check cache during graph generation — a lightweight representation that hooks can read without loading the full EAVT store.
This is the same pattern as the knowledge graph being a cache of the cold store.
The constraint cache is a derived artifact, regenerated when constraint entities change.

**What this means for each hook category:** - Guard hooks → constraint-fiber composition via precompiled cache - Observation hooks → message(session, {channel: observe, payload}) — fire-and-forget - Accounting hooks → message(event, {channel: transaction}) — the σ/Δ pair is computed - All hook logic moves to entity fibers.
All hooks shrink to ~10-15 lines of adapter code.

## Open design question: algebra vs imperative boundary

The vision says "logic in fibers, not in JavaScript."
But fibers carry predicates with bilattice values.
A predicate like `pattern: \brm\s+-rf\b` is a string — settle() can tell you it's `t` (the predicate exists) but it can't EVALUATE the regex against a bash command.
Something imperative has to do that.
The algebra composes, routes, and checks consistency.
The imperative code evaluates.

Questions that must be answered before implementation:

1. **Where does regex evaluation happen?** The constraint entity carries the pattern as a predicate.
  But who runs the regex?
  The hook?
  A function referenced by the entity?
  A precompiled module generated from constraint entities?

2. **What does the precompiled cache actually contain?** Is it compiled regexes?
  A decision tree?
  A lookup table?
  How is it generated from entity fibers?
  How does it stay in sync with entity changes?

3. **What does settlement mean for constraints?** When we say message(constraints, {command: "rm -rf /"}) → settlement → f (block), what is settle() actually DOING?
  It can compose the command string against constraint predicates, but the composition doesn't evaluate the regex — it produces bilattice values on shared predicates.
  The matching logic is OUTSIDE the bilattice.

4. **What's the interfacer's role?** Per the interfacer mathematical grounding, the stepping map γ_t advances state.
  For a constraint interfacer, advancing state means: take a tool-call event, evaluate it against constraint entities, produce allow/block.
  The EVALUATION is the stepping map — it's the interfacer's apply(), not settle()'s composition.
  This may mean: constraint evaluation is an interfacer operation, not a settlement operation.

5. **Does this mean the hook IS the interfacer?** The hook translates between Claude Code events and FARS.
  It extracts the tool-call event, applies constraint evaluation (the stepping map), and returns the result.
  The entity fibers carry the RULES (what to check, what to block, what to allow).
  The hook carries the MECHANISM (how to evaluate a regex, how to check a path prefix).
  Rules = predicates.
  Mechanism = code.
  Both are needed.

This separation — rules in fibers, mechanism in interfacer code — may be the right answer.
It means hooks don't shrink to 10 lines of pure plumbing.
They shrink to ~30 lines: plumbing + mechanism.
But the RULES (which patterns to check, what severity, what to do on match) live in entities and are modifiable without code changes.
The mechanism (how to evaluate a regex against a string) is stable and doesn't need to change when rules change.

## Answer: four-layer architecture (from game engine + RelationalMachine research)

The algebra/imperative boundary is resolved by the same pattern found in DF raws, LPMud driver/mudlib, and Discworld skill trees: **the evaluation mechanism is stable and generic; the rules are specific and changeable.**

Three game engines, same pattern: - **DF Raws**: Text files define creatures/materials/reactions (DATA).
C++ engine evaluates them (CODE).
Adding a creature = adding a text file. - **LPMud**: Driver provides primitives (MECHANISM).
Mudlib builds behavior (RULES).
Adding a room = writing LPC, not modifying the driver. - **Discworld skills**: Skill tree is DATA (names, XP thresholds). query_skill_bonus() is CODE that evaluates the data.
Adding a skill = adding a tree node.

The RelationalMachine spec confirms: the stepping map γ_t (carrier coalgebra) IS the evaluation mechanism.
It advances state when a step is received.
For constraints: γ_t takes (current constraints, incoming tool call) → (allow/block/redirect).

**The four layers:**

```
Entity fibers:     WHAT to check (patterns, severities, alternatives)
                   ↓ (loaded at generate time into precompiled cache)
Interfacer γ_t:    HOW to check (regex eval, path matching, string comparison)
                   ↓ (the hook's ~30 lines of stable mechanism code)
Hook adapter:      WHERE to check (stdin/stdout, exit codes, protocol translation)
                   ↓ (the hook's ~10 lines of plumbing)
Claude Code:       WHEN to check (PreToolUse:Bash, PostToolUse:Edit, etc.)
```

- Adding a new safety rule = creating an entity file (top layer changes)
- The mechanism (γ_t) and protocol (adapter) layers DON'T change
- The precompiled cache bridges the gap: entity fibers → fast-lookup format at generate time
- The algebra handles composition and routing.
  The imperative code handles evaluation and I/O.
- This IS the DF raws pattern: data-driven rules, generic engine

The hook IS the interfacer.
The interfacer HAS a stepping map.
The stepping map IS the evaluation mechanism.
The entities carry the rules the mechanism evaluates.
Rules change; mechanism doesn't.

## The unification insight

The world-sim work proved that messaging, accounting, gamification, governance, and learning are the SAME algebra.
The 127 files in agentic/ are currently SEPARATE implementations of these concerns:

| Current concern | Example files | Algebraic unification |
|----------------|--------------|----------------------|
| **Observation** (what happened?) | observe.js, tool-call-logger.js, bash-audit-log.js, session-end.js, edit-accumulator.js | respond(session, {channel: observation}) — every tool call IS a predication entering the event stream |
| **Guard** (should this happen?) | safety-guard.js, detect-secrets.js, pre-bash-git-push.js, mcp-privilege.js, stop-budget.js, drift-detector.js | respond(action, {channel: constraint}) — the lusory attitude. Guards are constraint-fibers that produce ⊥ (block) or t (allow). Cheating detection = ⊤. |
| **Accounting** (what did it cost?) | cost-tracker.js, ledger-tool.js, finance-report.js, budget-router.js, seed-chart-of-accounts.js | respond(event, {channel: σ/Δ}) — every event IS a transaction. σ face = what stays (debit). Δ face = what flows (credit). The ledger IS the event log with a σ/Δ lens. |
| **Query** (what's the state?) | plan-status.js, tracking-status.js, project-status.js, overdue.js, burndown.js, capacity.js, critical-path.js, query-library-graph.js, resource-report.js | respond(entity, {channel: query-type}) — each query tool is ONE respond() call with a channel name |
| **Mutation** (change something) | create-record.js, graph-patcher.js, propagate-dependencies.js, auto-dispatch.js, canonicalize-status.js, work-state-machine.js | respond(entity, mutation-message) → settlement → event log entry. The bypass structure handles cascading updates. |
| **Analysis** (what does it mean?) | harness-audit.js, record-hygiene.js, verify-plan-consistency.js, scope-tracker.js, plan-variance.js, week-plan.js | respond(entity-set, {channel: analysis-type}) — batch-respond over collections with an analysis lens |
| **Learning** (what should change?) | pattern-detector.js, diagnosis-to-instinct.js, instinct-decay.js, instinct-cli.js, skill-tracker.js, reflect-on-failure.js, evaluate-session.js | respond(observations, {channel: pattern}) = dreams (self-composition). respond(pattern, {channel: promotion}) = tower/fold. Instinct decay = new input creating bypass adjacencies in settled instincts. |

## What the refactor actually does

### Phase 1: Classify (2 tasks)

Read every hook and tool.
For each, determine: - **What concern?** (observation/guard/accounting/query/mutation/analysis/learning) - **What respond() call replaces it?** (entity, message, channel) - **Target state:** respond-composition (≤30 lines) / bypass-handled (delete — the tick handles it) / adapter (thin wrapper between agent runtime and respond()) / keep-as-is (genuinely needs imperative logic)

### Phase 2: Refactor hooks (3 task groups)

**Observation hooks → event predications.** observe.js, tool-call-logger.js, bash-audit-log.js, edit-accumulator.js currently parse stdin and append to JSONL.
Refactored: respond(tool-call-event, {channel: observe}) computes what to record.
The hook is a 5-line adapter that calls respond() and appends the result.

Each observation IS a predication: ⟨subject=agent, predicate=used-tool, object=tool-name⟩.
The observation hook doesn't decide what to observe — the fiber's observation predicates determine what produces non-⊥.
An agent with rich observation predicates produces rich observations.
A thin agent produces thin ones.
The observer agent (currently a separate LLM invocation) becomes respond(observations, observations) — the dream state, self-composition that detects patterns without inference.

**Guard hooks → constraint-fiber composition.** safety-guard.js (200+ lines of pattern matching) becomes respond(action, safety-constraints-fiber).
The constraint fiber has predicates for each safety rule. respond() produces t (allow), f (block with reason), or ⊤ (contradiction — the action is both allowed and forbidden, needs escalation).
The 200 lines of if/else become a fiber file with predicates.

This IS the lusory attitude made operational: the guard hooks are the game rules.
The agent voluntarily composes with the constraint fiber (accepts the lusory attitude).
Cheating = the agent using a constrained predicate (produces ⊤ in respond(rules, action) — algebraically detectable).

Budget enforcement (stop-budget.js) becomes respond(session, {channel: budget}).
The budget IS a constraint-fiber with a spending-limit predicate.
Exceeding the limit produces f.
The accounting hooks (cost-tracker.js) record the σ/Δ pair for each API call.
The budget check composes the running total (σ face) with the limit (constraint fiber).
One respond() call replaces the entire budget system.

**Accounting hooks → σ/Δ event pairs.** cost-tracker.js records token usage.
In the algebra: every API call IS a transaction. σ (what stays) = the model's response. Δ (what flows) = the tokens consumed.
The accounting hook doesn't compute — respond(event, {channel: transaction}) computes the σ/Δ pair.
The hook writes it to the ledger.

### Phase 3: Refactor tools (4 task groups)

**Query tools → respond() one-liners.** plan-status.js (currently 300+ lines) becomes:
```js
function run(input) {
  const { graph } = require('../../systems/fars');
  const db = graph.load();
  return JSON.stringify(graph.respond(db, planId, {channel: 'status'}));
}
```
Same for tracking-status, project-status, overdue, burndown, capacity, critical-path.
Each is respond() with a different channel.
The 300-line scripts become ≤30-line respond() adapters.

**Mutation tools → message-sending + settlement.** create-record.js currently does frontmatter validation, graph patching, and file writing.
Refactored: respond(entity-type, creation-message) → the algebra validates (constraint-fiber produces t/f/⊤) → settlement writes the file → event log records the σ/Δ.
The mutation tool becomes a message sender, not a file manipulator.

propagate-dependencies.js (currently walks the graph manually) becomes: the tick runs respond() on every entity with a dependency predicate.
When a dependency settles, the bypass structure propagates to dependent entities.
The tool is DELETED — the tick handles it.

**Analysis tools → batch-respond.** harness-audit.js (currently 300+ lines scanning for unused components) becomes respond(all-components, {channel: usage-analysis}). record-hygiene.js becomes respond(all-records, {channel: hygiene}).
Each analysis is a fiber that, composed with entities, produces the analysis result.
The 300-line scripts become ≤30-line batch-respond calls.

**Learning tools → dream-state compositions.** pattern-detector.js = respond(observations, observations) — self-composition producing new bypass adjacencies from entangled pairs. diagnosis-to-instinct.js = respond(diagnosis, {channel: promote}) — the tower/fold: a structured diagnosis at F1 folding into an instinct at F2. instinct-decay.js = new input creating bypass adjacencies in settled instincts — the mathematical reality that new information reopens closed questions (Rimworld's skill-decay replaced by settlement regression). skill-tracker.js = the character sheet updated via respond(office, {channel: xp-compute}).

### Phase 4: Delete redundant (1 task)

After refactoring, many files become redundant because the bypass structure handles them natively: - propagate-dependencies.js → the tick propagates - work-state-machine.js → shadow class transitions ARE the state machine - canonicalize-status.js → respond(entity, {channel: canonical-status}) - compute-age.js → respond(entity, {channel: age}) from creation-date predicate - heartbeat-runner.js → self-bypass entity (F4.4) in the daemon IS the heartbeat

Target: >60% reduction in file count.
The remaining files are thin adapters between the agent runtime (which needs stdin/stdout) and respond() (which computes).

## How the gaming/accounting/messaging unification helps

The key insight: these 127 files are currently maintaining SEPARATE infrastructure for concerns that are the SAME algebra:

- **Observation hooks** record events → but events ARE messages → and messages ARE transactions → and transactions ARE game events.
  One write to the event log serves all four.
- **Guard hooks** check constraints → but constraints ARE game rules (lusory attitude) → and game rules ARE governance (charter) → and governance IS authorization (Hohfeldian positions).
  One constraint-fiber composition checks all four.
- **Cost tracking** records expenses → but expenses ARE the Δ face of every respond() call → and every respond() IS already a transaction → and the transaction already records the σ/Δ pair.
  Cost tracking is FREE — it's the Δ face of what the system already computes.
- **Learning tools** detect patterns → but patterns ARE dream-state self-compositions → and self-compositions ARE internal settlement → and settlement produces vocabulary (tower/fold).
  Learning IS the system doing what it already does (settle) on its own observations instead of on external input.

After the refactor, the agentic/ directory doesn't contain 127 separate files doing 127 separate things.
It contains ~40 thin adapters that connect the agent runtime to ONE algebra, which handles observation, guarding, accounting, querying, mutation, analysis, and learning as different CHANNELS of the same respond() primitive.

## The context spacesuit = officer kit = RPG loadout (2026-04-06 captain insight)

The deepest refactor insight: the harness installation pipeline (generate-root-agentic-files.js → install.js → .claude/) isn't building a system prompt.
It's a QUARTERMASTER assembling a kit for an officer going on a mission.

| Harness component | Officer kit analog | RPG loadout analog | Algebraic meaning |
|-------------------|-------------------|-------------------|-------------------|
| rules/ | Standing orders, ROE | Class restrictions | Constraint-fiber (what predicates are suppressed — the lusory attitude) |
| skills/ | Training certifications | Skill tree | Action-vocabulary fiber (what messages can be sent to what channels) |
| commands/ | Equipment manifest | Item inventory | Tool-fiber (what respond() compositions are pre-built) |
| agents/ | Unit roster | Party members | Settlement-partner fiber (who can be dispatched) |
| hooks/ | Protocols, SOPs | Passive abilities | Observation/guard fibers (what fires automatically on events) |
| session state | Intelligence briefing | Quest log | Entangled pairs (F8) — history carried forward |
| character sheet | Performance record | Stat block | Shadow-class barcode (settlement status per duty) |

The install.js refactor target isn't "generate files faster."
It's: **respond(office, {channel: kit-assembly, payload: {mission: task-type}})** — the quartermaster computes the optimal kit for this officer on this mission.
Different offices get different kits.
Different missions for the SAME office get different kits.
The kit IS the fiber that determines the agent's Umwelt for the session.

This means hooks become PASSIVE ABILITIES in the RPG sense — they fire automatically when conditions are met, just like passive class features.
Guards become RESTRICTIONS — they suppress predicates (the lusory attitude).
Tools become ITEMS — pre-composed respond() chains the agent can invoke.
Skills become ABILITIES — patterns the agent can apply.
The entire harness IS a character build.

The agentic-to-fars-refactor and the gamification (sunday-funday-sprint) are therefore the SAME work from different angles: refactoring the harness IS building the character-equipment system.
Every hook that becomes a respond() composition IS a passive ability being formalized.
Every tool that becomes a respond() one-liner IS an inventory item being standardized.
The refactor IS the gamification IS the kit assembly system.
