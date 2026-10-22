---
title: "MAPE-K Autonomic Computing Loop: Monitor, Analyze, Plan, Execute and Knowledge"
summary: "MAPE-K is the Monitor-Analyze-Plan-Execute loop over shared Knowledge from autonomic computing; its uses, and a staged-closure reading with open inputs."
date-created: 2026-10-06
type: article
status: active
visibility: public
tags: [mape-k, autonomic-computing, self-adaptive-systems, closure-operators, agent-orchestration]
keywords: [MAPE-K, autonomic computing, self-adaptive systems, feedback loop, closure operator, residue, agent orchestration, runtime models, Kephart and Chess]
references:
  kephart2003:
    type: article-journal
    title: "The vision of autonomic computing"
    author: [{family: Kephart, given: Jeffrey O.}, {family: Chess, given: David M.}]
    issued: {date-parts: [[2003]]}
    container-title: "Computer"
    volume: "36"
    issue: "1"
    page: "41-50"
    DOI: "10.1109/MC.2003.1160055"
  ibm2005:
    type: report
    title: "An architectural blueprint for autonomic computing"
    author: [{literal: "IBM Corporation"}]
    issued: {date-parts: [[2005]]}
    edition: "3"
    publisher: IBM
  wiener1948:
    type: book
    title: "Cybernetics: or control and communication in the animal and the machine"
    author: [{family: Wiener, given: Norbert}]
    issued: {date-parts: [[1948]]}
    publisher: "MIT Press"
  ashby1956:
    type: book
    title: "An introduction to cybernetics"
    author: [{family: Ashby, given: W. Ross}]
    issued: {date-parts: [[1956]]}
    publisher: "Chapman & Hall"
  salehie2009:
    type: article-journal
    title: "Self-adaptive software: landscape and research challenges"
    author: [{family: Salehie, given: Mazeiar}, {family: Tahvildari, given: Ladan}]
    issued: {date-parts: [[2009]]}
    container-title: "ACM Transactions on Autonomous and Adaptive Systems"
    volume: "4"
    issue: "2"
    page: "14:1-14:42"
    DOI: "10.1145/1516533.1516538"
  arcaini2015:
    type: paper-conference
    title: "Modeling and analyzing MAPE-K feedback loops for self-adaptation"
    author: [{family: Arcaini, given: Paolo}, {family: Riccobene, given: Elvinia}, {family: Scandurra, given: Patrizia}]
    issued: {date-parts: [[2015]]}
    container-title: "Proceedings of SEAMS 2015 (IEEE/ACM 10th International Symposium on Software Engineering for Adaptive and Self-Managing Systems)"
    page: "13-23"
    DOI: "10.1109/SEAMS.2015.10"
  weyns2023industry:
    type: article-journal
    title: "Self-adaptation in industry: a survey"
    author: [{family: Weyns, given: Danny}, {family: Gerostathopoulos, given: Ilias}, {family: Abbas, given: Nadeem}, {family: Andersson, given: Jesper}, {family: Biffl, given: Stefan}, {family: Brada, given: Premek}, {family: Bures, given: Tomas}]
    issued: {date-parts: [[2023]]}
    container-title: "ACM Transactions on Autonomous and Adaptive Systems"
    volume: "18"
    page: "5:1-5:44"
    DOI: "10.1145/3589227"
---

# MAPE-K Autonomic Computing Loop: Monitor, Analyze, Plan, Execute and Knowledge

MAPE-K is the reference architecture for self-managing software: a closed loop in which a system Monitors a managed resource, Analyzes what it sees, Plans a change and Executes it, with all four stages sharing a Knowledge base of models, policies and history [@kephart2003; @ibm2005]. It divides regulatory labor; it is not an algorithm. This article, from 561 Group research, explains the architecture and its uses, then describes a proposed reading of the loop as staged closure with residue, including what that reading does not yet prove.

## What is MAPE-K?

MAPE-K names a control architecture for systems that modify their own operation while running. The letters expand to **Monitor, Analyze, Plan, Execute and Knowledge**. In the canonical formulation, sensors expose the condition of a managed resource; monitoring turns signals into observations; analysis decides whether adaptation is needed; planning constructs a change; execution applies it through effectors; and a shared knowledge base supplies the models, policies, goals and history the loop needs [@ibm2005].

The architecture came out of IBM's autonomic-computing program. Jeffrey Kephart and David Chess proposed that computing systems should manage themselves according to high-level objectives set by administrators, borrowing the word "autonomic" from the autonomic nervous system, and organized self-management around four properties: self-configuration, self-optimization, self-healing and self-protection [@kephart2003]. MAPE-K then escaped that program and became a general reference point for self-adaptive software, cloud management, cyber-physical systems and assurance research [@salehie2009].

### What does MAPE-K not say?

Three common mistakes are worth naming.

1. It is not an adaptation algorithm. Analysis may be rules, statistics, model checking or learned prediction; planning may be search, optimization or a fixed response table.
2. The letters need not be five separate services. A system may fuse monitoring with analysis, combine planning with execution, or run the whole loop in one controller.
3. The K is not a database bolted onto the end. It is the operational memory that lets stages coordinate: models, goals, beliefs, histories and records of prior interventions.

### Where does it come from?

The deeper ancestry is cybernetics. Wiener defined cybernetics through control and communication in animals and machines, with feedback as the general principle [@wiener1948]. Ashby contributed requisite variety: a regulator must have as much variety in its responses as the disturbances it must absorb [@ashby1956]. A controller needs a controlled variable, a manipulated variable, a target, a model sufficient for its design, and an account of delay and disturbance. Software can contain a loop without having any of these properties.

## How is the loop described mathematically?

Let the managed process have state x, an environment disturbance w, an intervention u and an observation y. A minimal discrete-time description is

$$
x_{t+1}=f(x_t,u_t,w_t), \qquad y_t=h(x_t,w_t)+\nu_t,
$$

where ν is measurement error. With K the loop's operational knowledge, the stages are transformations

$$
o_t=M(y_{0:t},K_t), \quad a_t=A(o_t,K_t), \quad p_t=P(a_t,K_t), \quad u_t=E(p_t,K_t),
$$

followed by a knowledge update. The mathematical object is not a chain of boxes but a closed system of coupled transformations.

The research identifies the central open problem as compositional assurance. Local correctness does not compose: a monitor can be well calibrated, an analyzer sound, a planner optimal and an executor correct, while the closed loop remains unsafe because inputs are delayed, the model is wrong, or the goals are inconsistent. Formal work has modeled MAPE-K loops as abstract state machines [@arcaini2015]; other frontiers include partial observability (reasoning over a belief distribution rather than a known state), timing, hybrid dynamics, and keeping four kinds of state distinct: operational, observed, belief and normative. Conflating them produces the characteristic failure of treating a measurement as reality, a prediction as an observation, or an objective as a fact.

## Where is MAPE-K used today?

In two senses. Explicitly, designers label components as monitors, analyzers, planners and executors. Implicitly, systems realize the same functions under other names: telemetry, policy evaluation, reconciliation, scheduling, deployment, state store, control plane. The second category is much larger.

| Domain | How the loop appears |
|---|---|
| Cloud orchestration | Controllers compare actual with desired state and act to reduce the difference; knowledge is specifications, inventories, policies and history |
| Autoscaling | Monitor demand, estimate whether an objective is or will be violated, choose an allocation, add or remove resources; cooldown state lives in K |
| Cyber-physical and IoT | Actions have physical consequences, so planning must respect safety envelopes and real-time deadlines |
| Robotics | Loops are nested: fast stabilizing controllers beneath slower task and mission loops |
| Adaptive security | Correlate signals, estimate risk, isolate components or change credentials |
| Digital twins | The twin occupies much of K but also participates in monitoring, analysis and planning |
| Human-machine teaming | Humans supply observations, revise goals and approve high-impact plans |

A 2023 survey of practitioners found self-adaptation deployed across application domains, motivated by resilience, performance, resource efficiency and reduced operational effort, but usually through custom mechanisms and partial loops rather than end-to-end formal methods [@weyns2023industry]. The practical strength of MAPE-K is as a design and audit discipline: a telemetry stack is not a monitor unless its outputs relate to adaptation goals, an anomaly detector is not an analyzer unless its claims carry known uncertainty, and a recommendation is not a plan unless it states an executable transition and its preconditions. The present practical limit is coordination among many loops: two controllers can chase the same metric, cancel each other's actions, or adapt on incompatible timescales.

## What does the 561 Group's research add?

A later research note (2026-10-06) proposes reading MAPE-K as a **finite-first spiral of staged closure with residue**, where each stage tries to close the preceding stage's residue while new knowledge and material enter from outside. Its status is deliberately modest: a construction proposal that is not formalized, changing no existing theorem, runbook or runtime behavior.

### What is the work-kind correction?

The proposal associates Monitor with Process, Analyze with Inquiry, Plan with Derivation and Execute with Procedure, four kinds of work that differ in how meaning and execution are settled. A correction to an early reading is explicit: each of the four kinds can itself be a workflow and can have a runbook, so having a runbook does not classify work as a process or procedure. The note also insists that no equality or isomorphism follows from several lists each having four entries (the MAPE-K stages, Reality/Imagination/Possibility/Necessity, absurd/potential/active/stable, and a family of data-structure levels). Those associations stay named hypotheses until the maps and the structures they preserve are constructed.

### What are closure and residue?

For each stage and fixed context version, the note separates three operations:

1. A **local inference step**, an endomap on an ordered carrier of stage information.
2. A **local saturation**, obtained by iterating the step to its least fixed point; this is the closure operator.
3. A **cross-stage translation** from one stage's output and residue into the next stage's input. Its domain and codomain differ, so it is not a closure operator merely because it helps settle the next stage.

**Residue** is what a downstream stage or later cycle still needs: unmet obligations, uncertainty, conflicts and unavailable observations. On a powerset carrier a closure gap is C(x) minus x, empty exactly when x is fixed. The note stresses that a local closure gap and a goal residue are different: C(x) = x says only that the selected rules add no information within the chosen context. It does not say that the goal is true, evidence is complete, contradictions are absent or a recipient is satisfied. Calling residue "entropy" would additionally require a defined measure; no entropy identity is asserted.

### What is actually proved?

One elementary result, independent of the proposed semantic correspondences. Let H be a finite-height poset and C₁,…,Cₘ monotone, extensive endomaps, with T their composite. Iterating T from any x increases and stabilizes after finitely many strict increases, at the least common fixed point above x; the resulting saturation is monotone, extensive and idempotent. The proof is short: at a fixed point of T the chain y ≤ C₁(y) ≤ … ≤ T(y) = y is all equalities, so every Cᵢ fixes y.

Two caveats are part of the result. A full sweep applies every map; an asynchronous implementation needs a fairness argument, since skipping a stage indefinitely is not covered. And one sweep need not be idempotent even when every Cᵢ is a closure operator: on the powerset of {a, b, c}, with C₁ adding b when a is present and C₂ adding c when b is present, T = C₁ ∘ C₂ sends {a} to {a, b}, and applying T again gives {a, b, c}. A composed step must be distinguished from its saturation. For an ω-complete carrier with an ω-continuous map, the iteration is bounded by ω, but equality with ω requires proving no finite stage is fixed, and transfinite claims need explicit limit-stage rules.

### Why a spiral and not a single closed loop?

With a fixed context, saturation is a map on one carrier. New input changes the context, so the note introduces a separate admission map that carries ingestion, provenance and deduplication into the next context, followed by that context's own saturation. Model or policy revision can invalidate old conclusions, so monotone growth should usually concern retained provenance, not the truth of every earlier conclusion. Material inputs and executions belong to an environmental transition relation, which need not be monotone: a monotone log of observed transitions is not a monotone world. A theorem that increments eventually reach zero cannot establish quiescence while fresh inputs keep arriving. Meaningful receiving conditions are local instead: saturation for a named snapshot, discharge of a particular goal, a witnessed execution result, or stability under a stated class of future inputs.

Execution gets its own distinction: a command being issued, an effect being observed and a receiver accepting the outcome are three different facts. Knowledge may grow when an attempted effect fails, but that growth must not turn the failed effect into success.

### What about large streams of heterogeneous input?

An October 2026 extension, labeled a proposed operational interpretation and not a new proof or deployed service, applies the loop to very large quantities of heterogeneous channel input (code changes, feeds, documents, telemetry, sensor samples, agent moves). Its starting point is a queue conservation law per channel: backlog next step equals max(0, backlog + admitted arrivals - service). A uniformly bounded queue under sustained arrival load above available service contradicts this law, so bursts force an explicit policy: add resources within granted budgets, defer a derived view, combine redundant presentations, reduce sampling, or admit incomplete coverage. Success is measured as a legitimate consequence at an independently receiving boundary, such as a new scientific possibility learned, a timely owner disposition or an informative refusal, and not as counts of raw events, summaries or tokens. Source capture, interpretation, agent uptake, authorized action and recipient acknowledgment have distinct identities and distinct failure modes. A native receiving experiment is specified as falsifiable.

## Limits and open problems

The research note states its open inputs plainly.

- **Hypotheses, not theorems.** The correspondences among work kinds, MAPE-K stages and other quartets are hypotheses. No closure ordinal is assigned to any individual stage.
- **Construction obligations.** Before a runtime claims to implement the theory, the note requires: carriers with orders and result families for each stage; local laws (monotonicity, extensivity, idempotent saturation, and finite-meet preservation if closures are called nuclei); semantic linkage showing how meaning and execution settlement are represented; cross-stage pre- and postconditions; a proof of the whole-cycle result or counterexamples and a weaker valid contract; open-input handling that distinguishes snapshot closure from all-future invariance; exercised behavior for all four work kinds; independent authority checks by the executor; a verified realization chain to the actual consumer; and retention of failed obligations as evidence for revising the theory.
- **No claim of passing tests.** The first useful implementation is specified to include the noncommuting-closure counterexample, a changing-input example that reopens residue, and a blocked-execution example where knowledge grows but the effect stays unmet. These are receiving requirements, not evidence that tests have passed.
- **Authority.** Scientific possibility and mathematical necessity do not grant authority to act.
- **Literature scope.** The survey side is a conceptual reconstruction; industrial self-adaptation is real but unevenly formalized [@weyns2023industry].

## Related

- [Dispatching concurrent AI agents at scale](/dispatching-concurrent-ai-agents-at-scale/) covers the integration and landing step of an agent loop.
- [Paraconsistent, transfinite, linear logic for agent integration](/paraconsistent-transfinite-linear-agent-integration/) develops the monotone versus non-monotone partition that also governs when a loop needs a single owner.
- [Paraconsistent settling and comprehension](/paraconsistent-settling-and-comprehension/) and [Belnap's four-valued logic](/belnap-four-valued-logic/) for the settling vocabulary.
- [Rendanheyi and the living union](/rendanheyi-living-union-organizational-science/) for the organizational model of agentic nodes.
- Sibling sites: [561.group](https://561.group/), [engineering.561.group](https://engineering.561.group/), [operations.561.group](https://operations.561.group/), [services.561.group](https://services.561.group/), [market.561.group](https://market.561.group/).
