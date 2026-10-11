# Survey of the Work-Concept Family in theories/

**Session:** 2026-05-15
**Status:** research output, not settled polity claim. Input to a future proper lift. Source provenance is named at the end; this survey does *not* license `561/*` records to cite into `theories/`.

## Scope

The `theories/.../sociology/theories/work/` subtree contains a developed theoretical treatment of the family of concepts the polity uses to organize its own activity: work, task, plan, project, goal, objective, campaign, milestone, mission, endeavor, captain, and adjacent terms. This survey captures the *content* of that treatment as I read it in session 2026-05-15, so the polity has a written record of what was researched without depending on the cruft staying intact.

The treatment is partially-coherent AI prior art — well-developed in places, with non-trivial citations to Bratman, Locke & Latham, Clausewitz, Cooper, MacIntyre, Carver & Scheier, Miller-Galanter-Pribram, Doran's SMART, Drucker/Grove/Doerr OKRs, Weber, Barnard, Schoenbaum's admiralty doctrine. The math chapter develops a mathematical realization in terms of bilattice-valued predication cells, closure-rule subsystems, and a temporal 2-category of plan execution.

## The family at a glance

The treatment organizes work concepts into a hierarchy with the following primary relations:

- `goal → project → plan → task` is the operational hierarchy. A goal organizes one-to-many projects; a project contains one-to-many plans; a plan contains one-to-many tasks; a task may decompose into subtasks down to atomic operations.
- `objective` is the decidable counterpart to `goal`. SMART-conformant. Serves a goal by translating its direction into a verifiable target.
- `campaign` sits *between* project and what the treatment calls `enterprise` (indefinite aim-generative activity). A campaign is a time-bounded cross-project push toward a strategic intermediate objective.
- `endeavor` is the genus: an organized, sustained, failure-open self-commissioned striving toward an aim. `project`, `mission`, `enterprise`, `attempt`, `venture`, and `duty` are differentiated species or non-species.
- `mission` is `endeavor` with two restrictions: externally commissioned (sender distinct from executor) and defined end-state (specified in the mission order, not discovered).
- `milestone` is a *state* of a plan/project/campaign/mission — not an act, not a task — that marks meaningful progress and triggers a gate review.
- `captain` is the office invested with operational command of a ship (which executes a mission/campaign), bounded by charter, accountable upward to commissioning authority.
- `work` itself is the base concept: an act with a defined output. Four work-types (process / procedure / derivation / inquiry) by whether the output's meaning and the execution path are settled in advance.

## work — the base concept

An act that produces a nameable output. Restricts the general concept of action (act / capacity realization) to episodes with nameable results. An act producing nothing nameable is not work, just time spent.

Four work-types by which qualities are settled:

| work-type | meaning settled | execution settled |
|---|---|---|
| process | yes | yes |
| procedure | yes | no |
| derivation | no | yes |
| inquiry | no | no |

A *work unit* is a concrete instance: domain, affected aspect, operation, parameters. A work unit without parameters is a template, not an instance.

Work composes:
- A *workflow* is a set of work units with the constraint that initial input type equals final output type (it transforms X to X).
- A *task* is a named planning container for work units with a completion condition.
- Workflows are algebraic (they compose); tasks are organizational (they group work for planning and tracking).

Work is what *practice* does and what *method* governs.

## task — goal-directed organization

A task is a unit of work organized around a goal. Three parts:

1. **goal** — what counts as done; defines the task.
2. **subtasks or operations** — what must happen to get there.
3. **plan** — the order and conditions under which subtasks execute (sequential, conditional, concurrent, cyclic; not always fully specified in advance).

Termination: task succeeds when goal achieved, fails when goal becomes impossible, is abandoned when agent releases the goal. Without a goal there is activity but not a task.

Decomposition is hierarchical: task → subtasks → smaller subtasks → atomic operations. The stopping criterion is practical: Annett and Duncan's $p × c$ rule — stop when probability of failure × cost of failure falls below threshold. High-risk operations get decomposed further.

Composite tasks (with declared `subtasks:`) require *dispatch-to-coordinator* — a coordinator agent receives the parent and emits the subtask graph for ordinary dispatch.

`task` ↔ `plan` boundary: a task has a single completion; a plan is a container that gains and loses tasks without ending. A composite task with a fixed subtask list is still a task; a plan with an evolving task list is a plan.

## plan — finite dependency-ordered commitment

Four defining properties:

1. **Finite commitment.** Bounded set of steps. Infinite/open-ended intention is strategy/policy, not plan.
2. **Dependency structure.** Step A before step B because A produces what B needs. DAG; cycles make plans unexecutable.
3. **Goal orientation.** Every step contributes to the plan's goal through means-end relations. A step removable without affecting the goal is padding.
4. **Defeasible stability** (Bratman 1987). Plans resist casual revision but can be abandoned/revised. Reconsideration requires reasons, not preference.

Plans are *partial* — typically specify some aspects, leave others open. Fully specified total-order plans are the exception.

Plans nest. High-level plan → sub-plans → tasks. Hierarchy runs goal → project → plan → task.

Coordination functions: across time (settled plan guides future sessions without re-deliberating from scratch) and across agents (shared plan lets agents work in parallel without continuous negotiation).

Formal grounding: STRIPS (Fikes & Nilsson 1971), partial-order plans (Sacerdoti 1975, McAllester & Rosenblitt 1991), PDDL (Ghallab et al. 1998), plus Bratman's normative account.

## project — single-goal container

Three defining properties:

1. **Stated goal** — names what success looks like; without it the project is just a label on a pile of work.
2. **Bounded set of plans** — plans don't self-assign; each plan belongs to exactly one project.
3. **Completion criteria** — project complete when plans complete and goal satisfied. Rolls up deterministically from leaf-task settlement.

Hierarchy: goal → objective → project → plan → task. Single goal invariant: a project serves *at most one* stated goal. Multiple goals = either multiple projects or a campaign.

Cross-project dependencies are possible but should be explicit and minimized.

Distinction from `campaign`: a project groups plans under one goal; a campaign groups projects under one push.

## goal — directional ambition

Four distinguishing properties:

1. **Direction, not target.** Answers "toward what?", not "how far by when?" The latter is the work of an objective.
2. **Ambitional weight.** What the agent is actually trying to bring about. Abandoning is not a scheduling choice but a revision of commitment.
3. **Undetermined settlement shape.** May be satisfied by many configurations of the world, some only visible as work advances. Goals leave settlement paths open; objectives close specific paths.
4. **Organizes work below.** Sits above at least one project or campaign that serves it. A direction with no work organized under it is aspiration, not goal.

OKR vocabulary maps inverted: OKR's "Objective" (qualitative, aspirational, directional) corresponds to *goal*; OKR's "Key Results" (specific, measurable, time-bounded) correspond to *objectives*. Locke & Latham (1990, 2002) establish that goal specificity and difficulty predict performance — but the specificity that matters is not reducible to numeric thresholds.

Three temporal kinds:

- **Aim-terminated.** Recognizable end-state. Supports backward planning, milestone-gated cadence, coverage-based recognition.
- **Indefinite.** Addresses a persisting condition. No moment at which finished. Not defective for lacking endpoint; differently shaped. Requires artificial cadences (weekly, quarterly) to impose horizons.
- **Aim-open.** The aim itself transforms as work advances. Cannot be served by fixed objectives alone; requires reflective cadences whose function is aim-revision, not checkpointing.

A single goal can be all three at once. The 561 Group's core endeavor (Black Liberation, Indigenous Sovereignty) is simultaneously indefinite, aim-open, and aim-terminated at specific scales.

Hierarchies: terminal goals (pursued for own sake) vs instrumental (advance a terminal goal). Maps to MacIntyre's distinction between goods internal vs external to a practice. Cognitive science complement: Miller-Galanter-Pribram TOTE units (1960), Carver & Scheier (1998) control-theory account, Bratman (1987) plan-anchoring.

Distinction from mission and vision: in the treatment, *mission* is specifically externally-commissioned striving; *vision* is not reserved.

## objective — decidable target

Four parts: target (what counts as achieved), goal it serves, progress metric, deadline.

Defining property: **decidability**. At the deadline, target is met or not — no ambiguity. Distinguishes from goal (directional, may never strictly "achieve"), intent (specifies reconstruction but no deadline), task (completion condition but not necessarily metric or deadline).

States: achieved (target met by deadline), missed (deadline passed without achievement), on-track (metric shows sufficient progress).

SMART criteria (Doran 1981): Specific, Measurable, Achievable, Relevant, Time-bounded.

Under friction: achieved objectives can regress when conditions change. Achievement assessed at deadline, not earlier. Earlier readings are progress signals, not closure events.

## campaign — bounded cross-project push

Four distinguishing properties:

1. **Strategic intermediate objective.** Not the enterprise's ultimate aim — a waypoint that, once reached, materially changes what is possible. Intermediate because enterprise continues; strategic because reaching it transforms the available action space.
2. **Cross-project coordination.** Coordinates work across multiple projects and their plans. Plans within a campaign may belong to different projects, serve different goals, be owned by different offices — but share the campaign's objective and horizon.
3. **A time horizon.** Bounded. Open-ended campaign is a contradiction. Horizon may shift, but commitment to temporal boundedness is constitutive.
4. **A front.** The campaign pushes against the gap between current state and objective. Advances as plans complete and retreats when plans fail or new blockers emerge. Makes progress visible at a level individual plan status doesn't.

Confederacy pattern: in the Haudenosaunee model, coordinated action — diplomatic mission, military campaign, trade expedition — was commissioned with specific leaders and participants. The campaign IS what confederacies commission *ships* to execute. A ship's charter may encompass multiple campaigns over its lifetime; each is a distinct coordinated push.

Clausewitz (1832) three-level distinction: war (political aim, indefinite) — campaign (strategic aim, seasonal) — engagement (tactical aim, immediate). Maps to: enterprise (the war), campaign (cross-project push), tasks (engagements).

Ontological dependencies: a campaign's objective typically requires concepts to be defined before coordinated work can proceed. Concept-grounding work is part of the campaign whether or not it appears in any individual plan.

## milestone — state of a plan

A milestone is a *recognizable state*, not a task. Specific configuration of task completions / objective achievements / quality assertions whose joint settlement constitutes the state.

Two functions:

1. **Makes progress visible.** A plan with 30 tasks and no milestones gives two data points (0%, 100%). A plan with 5 milestones gives 7 data points.
2. **Serves as a gate** (Cooper 1990). At each milestone, the plan is evaluated: continue, modify, or stop. Structured decision point, not just progress check.

Defined by conditions. "All infrastructure tasks done" is a milestone. "First user can log in" is a milestone. Conditions are verifiable.

Composition follows containment: project milestone may require milestones in multiple plans; campaign milestone may require milestones across projects.

Critically: not an act, not work to be assigned. The substrate distinguishes *reaching* a milestone (derived by inspecting conditions), *recording* that it's been reached (witness predication), and *the gate decision* the milestone triggers (separate decision record).

## mission — externally commissioned endeavor

A mission is an `endeavor` with two restrictions:

1. **Externally commissioned.** Sender distinct from executor.
2. **Defined end-state.** Conditions of fulfillment specified in the mission order, not discovered.

Lifecycle additions over endeavor: `commissioned` → `active` → `fulfilled` / `failed` / `recalled` / `abandoned`. Recall is unique to mission and distinguishes it from endeavor: only an externally-commissioned striving can be recalled by its commissioner.

The treatment names a *founding-time exception* (which appears to be my synthesis, not the source — flagging): a polity's founding work is structurally an endeavor of its founding agents, *not* a mission, until the polity exists to commission missions. This is unsettled; needs emsenn review.

## endeavor — self-commissioned failure-open striving

Five constitutive parts:

1. **Committing agent** — person or unified group who takes up the endeavor. Locus of commitment.
2. **Directed aim** — orientation. Specific enough to distinguish striving from drifting; need not be fully specified in advance.
3. **Self-commitment** — agent places themselves in quasi-positional obligation toward the aim. Self-generated, no external sender. Distinguishes endeavor from mandate or duty.
4. **Sustained exertion** — temporal structure across multiple episodes, attempts, setbacks, adjustments. A single try is an attempt; sustained committed trying is an endeavor.
5. **Failure-openness** — aim not guaranteed by the endeavoring. Endeavor can succeed, fail, or be abandoned. Without this, it's a procedure, not an endeavor.

Properties: self-commissioning, normative weight on the striving (accountable for trying, not just achieving), extended temporal structure, aim-termination, aim-openness.

Three temporal kinds: aim-terminated, indefinite, aim-open. An endeavor toward Black Liberation is indefinite (condition persists), aim-open (what liberation means transforms), and aim-terminated at scale (specific liberatory wins possible).

The charter of a vessel defines the endeavor it pursues. A vessel without a charter is a container. A vessel with a charter is a ship. A ship is a vessel endeavoring.

Etymology: "endeavor" from Middle English *endeveren*, from Old French *se mettre en devoir* — "to put oneself in duty." Self-commissioning is the original semantic structure.

Adjacency table from the source:

| concept | self-commissioned | weight on striving | extended | aim-terminated | aim-open | risk required |
|---|---|---|---|---|---|---|
| endeavor | yes | yes | yes | variable | variable | no |
| attempt | yes | no | no (single try) | yes | no | no |
| project | often external | contractual | yes (defined timeframe) | yes (deliverables) | no | no |
| mission | no — requires sender | external mandate | yes | yes (end-state) | no | no |
| enterprise | yes | institutional | indefinite | no (aim-generative) | yes | no |
| venture | yes | risk-weighted | variable | variable | yes | yes |
| duty | no — positional | external, categorical | position-duration | yes | no | no |

## captain — operational command office

The person invested with operational command of a ship — the holder of the ship's command office, bearing absolute authority aboard within charter bounds. Authority is delegated, bounded, revocable.

Three constituents:

1. **Operational authority.** Power to make binding decisions about operations. What Barnard (1938) calls the executive function.
2. **Accountability upward.** Obligation to answer to the commissioning authority. Weber's (1922) analysis of bureaucratic authority — officeholder exercises authority within defined jurisdiction subject to review.
3. **Responsibility for the venture.** Duty to prosecute the ship's purpose as declared in the charter. Authority granted for the purpose, not for the person. Admiralty doctrine: master who deviates without necessity is personally liable (Schoenbaum 2011).

Captain as office: position exists independently of holder. When relieved, authority transfers intact. Kantorowicz's *dignitas non moritur*. Installation is constitutive; relieving doesn't dissolve the office.

Bounds: by the charter (orders contradicting charter are void), by directives from commissioning authority (which constrain the charter), by the venture (authority dissolves when ship decommissioned).

Captain vs manager: manager coordinates ongoing operations within a perpetual institution; captain commands a bounded venture under a specific charter. Selznick (1957) — institutional leadership infuses an organization with value beyond its technical requirements; captain doesn't do this — the ship is instrumental, not preserved for its own sake.

## Mathematical realization (predicated-work)

Found at `theories/.../sociology/theories/work/theories/predicated-work/`. Objects include:

- **task-cell-system** — $T = (G_T, \mathcal{S}_T, v^T_0)$: a set of goal cells, a task-local closure-rule subsystem, and an initial valuation. Task succeeds when goal cells settle to target valuation.
- **plan** — quadruple $P = (T_P, \preceq_P, M_P, \mathcal{S}_P)$ where $T_P$ is a finite set of task cell systems, $\preceq_P$ is a dependency partial order on $T_P$, $M_P$ is the set of milestone cells, $\mathcal{S}_P$ is the coordination rule subsystem (union of per-task subsystems plus dependency-ordering rules plus milestone-aggregation rules).
- **dependency-ordering rules.** For each $T_i \prec_P T_j$, a rule that gates $T_j$'s closure rules on completion of $T_i$ via a gate cell $\langle T_j, \texttt{depends-on-completed}, T_i\rangle$ at $\mathbf{t}$.
- **defeasible stability as substrate operations.** Plan abandonment is an increment $\langle P, \texttt{abandoned-by}, A\rangle = \mathbf{t}$ that propagates. Plan revision is addition or removal of a task with justification cell $\langle \texttt{revision-witness}, \texttt{justified-by}, J\rangle$.
- **normative residue** — at plan completion, duty cells settled at $\mathbf{t}$ without corresponding duty-discharge are the plan's normative residue. Optional normative-cleanup milestone requires this be empty for operational + normative completeness.
- **regime-of-task / regime-of-plan** — plan is in the strict regime if all $\mathcal{S}_{T_i}$ are strict and ordering/aggregation rules are finitary. Plans with inquiry-typed subtasks can lift to higher regimes.
- **CALM stability** — active-frontier query (which tasks are dispatch-ready) is $\leq_k$-monotone positive and coordination-free; exit-frontier (completion, abandonment) is anti-monotone and requires coordination.
- **temporal 2-category $\mathbf{T}(\mathcal{C}_{\rm op}, \lambda)$** — each task completion is a 1-cell; plan execution is the composite 1-cell from plan-init stage to final milestone's quiescence stage. Parallel tasks are pseudo-pullback branches; temporal Beck-Chevalley holds iff their settling fibers commute (= "parallel tasks are genuinely independent"). BC failure signals hidden dependency.

Morphisms include `decompose-task`, `dispatch`, `lift-task-to-plan`, `settle-cycle`, `witness-as-increment`, `adjudicate-witness-conflict`, `retrospect-via-cosettling`, `project-fiber-to-capability`.

Concepts include `aim-generativity`, `audit-conflation`, `cadence`, `cadence-as-modal-frame`, `capability-matching`, `closure-driven-coordination`, `dispatch-readiness`, `enacted-capability-staleness`, `normative-operational-layering`, `operational-evidence`, `shared-closure-rule-vocabulary`, `work-regime`.

## Notable theory-internal pointers I noticed but didn't pursue

- **`operations-loop`** and **`operations-base`** objects — likely the mathematical home for the workflow itself (proposed action → closure-rule consultation → settling → witness). Worth investigating whether the polity's tool-use governance can be modeled as an instance of this loop.
- **`operations-settling`** and **`operations-causal-settling`** — settling semantics for operations.
- **`enterprise`** object — the indefinite aim-generative activity that campaigns sit under.
- **`workflow`** object — directed graph of tasks with dependency edges; itself a task at a higher level.
- **`recurrent-practice`** object — distinct from plan (which has a single completion); periodic firing without single completion.
- **`work-symmetry-group`**, **`capability-fiber-bundle`**, **`handoff-cobordism`**, **`quantifier-adjoints-on-work-fibers`** — math-heavy structures I didn't read.

## What I synthesized this session that may not be in the source

These are claims I made earlier in writing 8 structures and 2 specs that may not actually appear in the source. They are flagged here so future lift work can check.

- The "founding-time exception" in mission (a polity's founding is endeavor not mission until the polity exists) — does not appear to be in the source endeavor.md or mission-adjacent material I read; appears to be my synthesis.
- The four-fibers-equals-four-responsibilities mapping (auth=gating, history=witnessing, attention=pedagogy, history-mined=learning) for tool-use governance — entirely my synthesis from this session, not in source.
- The decomposition of milestone status as derived-not-asserted (computed from conditions, not written by an agent) — present in source spirit but I may have hardened the framing.
- Specific lifecycle states added for mission (`commissioned` / `active` / `fulfilled` / `failed` / `recalled` / `abandoned`) — generally consistent with source but enumeration is mine.

## Provenance — where the source lives in theories/

These are the source files I read in session 2026-05-15. Listed for historical record; `561/*` records do not cite these per the closed-DAG discipline.

- `theories/humanities/theories/sociology/theories/work/_index.md`
- `theories/humanities/theories/sociology/theories/work/terms/work.md`
- `theories/humanities/theories/sociology/theories/work/terms/task.md`
- `theories/humanities/theories/sociology/theories/work/terms/plan.md`
- `theories/humanities/theories/sociology/theories/work/terms/project.md`
- `theories/humanities/theories/sociology/theories/work/terms/goal.md`
- `theories/humanities/theories/sociology/theories/work/terms/objective.md`
- `theories/humanities/theories/sociology/theories/work/terms/campaign.md`
- `theories/humanities/theories/sociology/theories/work/terms/milestone.md`
- `theories/humanities/theories/sociology/theories/work/terms/endeavor.md`
- `theories/humanities/theories/sociology/theories/work/terms/captain.md`
- `theories/humanities/theories/sociology/theories/work/theories/predicated-work/objects/plan.md`
- Index listings of `predicated-work/concepts/`, `predicated-work/morphisms/`, `predicated-work/objects/`

The source treatment cites Bratman, Locke & Latham, Doran, Drucker/Grove/Doerr, Cooper, MacIntyre, Carver & Scheier, Miller-Galanter-Pribram, Clausewitz, Weber, Barnard, Selznick, Kantorowicz, Schoenbaum, plus formal AI-planning literature (STRIPS, NOAH, PDDL).

### Downstream records derived from this survey without write-time provenance

The 8 structures and 2 specs from session 2026-05-15 at `code/structures/{goal,objective,plan,project,campaign,milestone,endeavor,mission}.md` and `work/governance/rules/specifications/{mission,milestone}.md` were derived from this material and should be audited against this survey per task `audit-this-session-rushed-structures`.
