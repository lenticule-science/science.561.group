---
title: "Activation is not existence: lifecycle semantics for persistent artificial persons"
description: >-
  Third Lenticule Science note in the persistent-agent-lives program. It
  distinguishes Person existence from runtime activation, Body lifecycle from
  Person lifecycle, quiescence from offline cognition, reminders from active
  timers, representative organs from first-person continuation, and service
  metabolism from biological autopoiesis. It imports virtual-actor,
  supervision, durable-execution, interoceptive-AI, and active-inference
  results into a falsifiable 561 research program.
date-created: 2026-10-02
type: note
status: active-research-program
authors: [emsenn, chatgpt-web]
depends-on:
  - 2026-10-02-person-body-office-pulse-persistent-agent-lives
  - 2026-10-02-local-realizations-and-continuity-obstructions-in-persistent-artificial-persons
keywords:
  [persistent-person, activation, quiescence, virtual-actor, reminders,
   supervision, durable-execution, embodiment, interoception, active-inference,
   metabolism, autopoiesis, pulse, rhythm, dreaming, consolidation]
---

# Activation is not existence

## Abstract

The first two notes in this program separated persistent Person from Office,
Body, Agent, Pulse, and Session, then recast the problem as a local-to-global
continuity problem. A third pass reveals a further category error in the
language of persistent agents: **continuous existence is too often implemented
as continuous activation**.

Distributed-systems practice already shows that this is unnecessary. Virtual
actors have stable logical identities that survive process lifetimes,
deactivation, host movement, and later reactivation. Durable workflows survive
worker failure because execution history and state outlive the worker.
Supervision systems distinguish resuming a process, restarting it with cleared
local state, and stopping it permanently. These are not metaphors; they are
mature engineering distinctions.

The scientific consequence for the 561 program is:

> **A persistent artificial Person should be able to remain extant while no
> model process is running, no Body is active, and no Office is currently being
> exercised.**

This forces a clean separation among:
- Person existence;
- Body activation;
- Episode execution;
- Office incumbency;
- recurring wake/reminder relations;
- cognitive regime.

It also corrects the earlier treatment of "rest." Some rest should be literal
**quiescence**: no inference, no inner monologue, no simulated sleep. Offline
consolidation, imagining, and dreaming are different things: they are active
episodes opened for specific epistemic or maintenance purposes under reduced
external coupling.

This note also draws a boundary around "metabolism" and "autopoiesis." The 561
system may profitably model service metabolism, maintenance loops, and
interoceptive regulation. It should not call ordinary feedback loops
autopoiesis or organizational closure. Current conceptual work in theoretical
biology explicitly warns against that conflation.

# 1. The core distinction

Let \(P\) be a persistent Person, \(B_t\) an active Body realization when one
exists, and \(E_i\) an Episode.

The incorrect implementation assumption is:

\[
P\text{ exists at }t
\Longleftrightarrow
\exists B_t\text{ running}.
\]

The proposed separation is:

\[
P\text{ exists at }t
\Longleftrightarrow
t\in T_I
\]

for the Person's PersistentIdentity lifespan \(T_I\), while

\[
\exists B_t
\]

is an independent realization predicate.

Therefore all four cases are meaningful:

| Person extant? | Body active? | Reading |
| --- | --- | --- |
| yes | yes | locally realized / active |
| yes | no | quiescent or dormant |
| no | yes | process is not an authorized realization of that Person |
| no | no | no current Person realization |

The third row is important. A stray runtime retaining stale memory after a
Person has been dissolved, superseded, or fenced is not allowed to recreate
personhood by continuing to speak.

The internal PersistentIdentity theory already permits this distinction.
Dormant juridical persons can preserve identity through inactive periods
because identity is grounded in the compatible section and its grounding, not
continuous activity.

Internal source:
\`science-services-section/services/philosophy-services-section/content/text/documents/articles/notes/2026/03/20/2026-03-20-persistent-identity.md\`

# 2. Virtual actors provide an exact engineering precedent

Microsoft Orleans' virtual actor model sharply separates **logical identity**
from **activation**.

A grain's identity is a logical type/key pair. Microsoft documents that logical
grain references remain valid across process lifetimes and can move between
processes while still referring to the same logical grain. A grain can
activate and deactivate repeatedly; a directory maps the stable logical
identity to its current activation location.

References:
- Grain identity:
  https://learn.microsoft.com/en-us/dotnet/orleans/grains/grain-identity
- Grain directory:
  https://learn.microsoft.com/en-us/dotnet/orleans/host/grain-directory
- Grain lifecycle:
  https://learn.microsoft.com/en-us/dotnet/orleans/grains/grain-lifecycle

Current Orleans documentation also includes **memory-pressure activation
shedding**: an active grain may be deactivated because the host needs memory.
This is particularly useful for the present program because it demonstrates
that deactivation can be an ordinary resource-management decision rather than
a death, failure, or identity event.

The 561 correspondence is not Person = Orleans grain. The engineering lesson
is narrower:

> **logical identity and current computational activation are separable
> coordinates.**

That pattern should be imported before inventing an always-running artificial
"life process."

# 3. Pulses are closer to reminders than timers

Orleans distinguishes timers from reminders.

A timer belongs to a particular activation and disappears with it. A reminder
is durable, belongs to the logical grain identity rather than to one
activation, and can reactivate the grain when it fires.

Reference:
https://learn.microsoft.com/en-us/dotnet/orleans/grains/timers-and-reminders

This is an extremely close analogue of the 561 pulse problem.

A ChatGPT Web scheduled task today behaves partly like a reminder and partly
like the activation itself because the prompt includes the Office, identity,
method, recovery instructions, and work policy.

The cleaner target is:

\[
\text{Reminder/Pulse}
\to
\text{logical Person/Service identity}
\to
\text{activation decision}
\to
\text{Episode}.
\]

A durable pulse relation should survive Body replacement. The particular
activation that receives it should be replaceable.

Therefore:

- persistent schedules/reminders SHOULD attach to a continuity-bearing
  Person, Office service, or institution as appropriate;
- high-frequency activation-local timers MAY belong to a Body;
- a persistent reminder MUST NOT derive identity from whichever activation
  happens to receive it.

This suggests a scheduler migration path for current ChatGPT Web heartbeats:
turn office-shaped scheduled prompts into thin durable wake/reminder carriers,
then reconstruct the current Person/Office/Body kit from durable state.

# 4. Quiescence is not offline cognition

The prior notes treated quiet rest as reduced external coupling. That remains
one useful mode, but this pass adds a more fundamental distinction.

## 4.1 Quiescence

Quiescence means:

\[
\text{Person extant}
\land
\neg\text{active Body cognition}.
\]

There is no model call. No simulated inner speech. No dream. No maintenance
unless another deterministic system acts on the Person's substrate.

Quiescence can be entered because:
- there is no ready obligation;
- inference would have negative marginal value;
- activation should be shed under resource pressure;
- another pulse/reminder will wake the Person later;
- the Person is awaiting an external event;
- a migration checkpoint has completed;
- governance has deliberately placed the Person dormant.

Quiescence is the cheapest possible "rest."

## 4.2 Offline cognition

Offline cognition is still active computation but with reduced environmental
coupling.

Examples:
- deterministic consolidation;
- memory indexing;
- model/world-state review;
- imagining/counterfactual generation;
- aperiodic dreaming;
- study;
- maintenance reasoning.

Therefore:

\[
\text{rest-like interval}
=
\text{quiescence}
\;\lor\;
\text{bounded offline episode},
\]

not one monolithic "sleep" operation.

## 4.3 Why this matters

Without this distinction, an agent estate can waste enormous inference budget
performing fictional rest: waking every hour to explain that it is resting.

A persistent artificial Person can instead remain absent from compute for six
hours and still be the same Person.

# 5. Durable execution separates progress from worker lifetime

Microsoft's Durable Task framework persists orchestration history and state so
long-running work can resume from completed steps after crashes, restarts, or
redeployments. Microsoft's current Agent Framework Durable Extension applies
this directly to agents and multi-agent workflows: agent sessions,
orchestration progress, and execution state can survive worker changes and be
resumed on another host.

References:
- Durable Task:
  https://learn.microsoft.com/en-us/azure/durable-task/common/what-is-durable-task
- Agent Framework Durable Extension:
  https://learn.microsoft.com/en-us/agent-framework/integrations/durable-extension

This supplies a second independent precedent:

> **episode continuity should be carried by durable event/progress state, not
> by hoping the same process survives.**

FARS already has stronger native ambitions through event sourcing, witnessed
sessions, and reconstruction from event cursors. The external precedent is
useful because it demonstrates that ordinary production systems now treat
durable agent execution as a first-class problem.

A 561 Episode should therefore have a recovery contract:
- last witnessed event frontier;
- completed irreversible side effects;
- pending idempotency keys;
- open commitments;
- continuation epoch;
- active Incumbency;
- Body-independent state required for lawful replay/resume.

# 6. Supervision is a different relation from identity

Actor systems such as Akka distinguish several responses to failure:
- resume the actor with accumulated local state;
- restart it with local state cleared/reconstructed;
- stop it.

They also make supervision relational: a responsible parent/supervisor decides
how a child failure should be handled.

References:
- https://doc.akka.io/libraries/akka-core/current/general/supervision.html
- https://doc.akka.io/libraries/akka-core/current/general/actors.html

The 561 lesson is again structural rather than prescriptive.

A Body or representative Agent can:
- fail;
- restart;
- be replaced;
- be stopped;

without those events necessarily terminating the Person.

Conversely, a supervisor implementation must not be mistaken for the Person.
The **continuation guardian** is an implementation organ responsible for
activation, recovery, fencing, and shutdown under governance. It represents
the Person's lifecycle law; it does not create that law itself.

Candidate responsibilities:
- verify continuation epoch;
- select or bind a Body;
- open/resume/close Episodes;
- reject stale activations;
- honor shutdown/dormancy;
- dispatch durable pulses;
- supervise representative organs;
- checkpoint before migration.

This object may become useful in Engineering, but Science should keep it
distinct from Person, Office, and Body.

# 7. A lifecycle lattice, not one lifecycle enum

The current problem contains several lifecycles that can change independently.

## 7.1 Person lifecycle

Possible states/relations:
- not yet recognized;
- extant;
- dormant;
- dissolved/retired;
- historically referenced after dissolution.

Person dormancy means no required active realization. It is not death.

## 7.2 Body lifecycle

- absent;
- provisioning/binding;
- active;
- draining/quiescing;
- checkpointed;
- migrating;
- failed;
- retired/destroyed.

## 7.3 Episode lifecycle

- offered by pulse;
- admitted/opened;
- active;
- waiting;
- draining;
- closed;
- aborted;
- resumable.

## 7.4 Office/Incumbency lifecycle

- Office vacant;
- investiture pending;
- incumbent;
- suspended;
- relieved;
- post-office surviving duties.

## 7.5 Cognitive regime

Orthogonal to all of the above:
- externally coupled work;
- maintenance;
- consolidation;
- planning;
- imagining;
- aperiodic dreaming;
- study;
- idle-within-active-episode.

The state space is therefore a product, not a flat enum.

For example:

> Person extant + Body active + Episode open + no Incumbency + consolidation.

or:

> Person extant + no Body + no Episode + Office Incumbency still legally
> active.

or:

> Person extant + Body active + Episode open + CFO Incumbency + externally
> coupled work.

A single status word such as "sleeping" cannot represent these distinctions.

# 8. The Person should not be implemented as an always-running daemon

This follows immediately.

An always-running process:
- couples identity to host uptime;
- pressures memory/context continuously;
- incentivizes artificial busywork;
- makes resource shedding look like death;
- makes migration complicated;
- encourages every reminder to become inference.

The better pattern is **virtual-person activation**:

\[
\text{PersistentIdentity}
+
\text{durable state}
+
\text{wake relations}
\quad
\Rightarrow
\quad
\text{activation when needed}.
\]

A Person may still have continuously running deterministic organs:
- event collectors;
- health monitors;
- inbox/webhook listeners;
- schedulers;
- ledgers;
- indexes.

Those organs are not necessarily the Person's active first-person cognition.

This is important for cost as well as theory. The richer the artificial
"life," the more aggressively we should avoid spending high-cost cognition on
things deterministic services can preserve while the Person is quiescent.

# 9. Service metabolism is useful; autopoiesis is a stronger claim

The Group often uses metabolic language for agent and enterprise operation.
That language is useful if its level is specified.

A **service metabolism** can mean:
- intake of observations, obligations, resources;
- transformation through work;
- external action;
- receipt and settlement;
- waste/error handling;
- maintenance;
- resource accounting;
- recurrent regeneration of operating capacity.

This is a cybernetic/organizational description.

It is NOT automatically autopoiesis or organizational closure.

A 2026 conceptual review of organizational closure explicitly warns that
closure is frequently conflated with ordinary feedback loops, recursive
algorithms, self-organization, or biochemical cycles. Its interpretive thesis
ties full organizational closure to the circular production and maintenance of
the efficient causes that constitute the living system.

Reference:
"Genealogies of organizational closure: from logical paradox to mind in
life," *Frontiers in Artificial Intelligence* 9 (2026).
https://doi.org/10.3389/frai.2026.1806435

That paper further argues that current LLM/agent systems remain externally
dependent on objectives, infrastructure, training, constraints, and energy and
should not casually be classified as organizationally closed.

For 561 Science, therefore:

> **Use "metabolism" for measured operational flow if useful. Reserve
> "autopoiesis" and "organizational closure" for systems that satisfy the
> stronger causal commitments of those theories.**

This prevents the fuller-life program from quietly changing a software
architecture claim into a philosophy-of-life claim.

# 10. Interoception should regulate activation as well as action

The earlier notes used Body state to modulate mode choice. The virtual-actor
precedent suggests an even more basic action:

\[
\text{interoceptive state}
\to
\text{whether to remain activated}.
\]

If:
- no ready obligation exists;
- durable reminders are installed;
- no open transaction needs active attention;
- checkpoint is clean;
- activation cost is high;

then the correct control action may be **deactivate**.

Conversely:
- rising backlog;
- deadline proximity;
- fault recovery need;
- memory conflict;
- external message;

may trigger activation.

This makes activation itself part of the policy space.

A first approximation is:

\[
a_t\in
\{\text{continue},\text{quiesce},\text{checkpoint},\text{migrate},
\text{spawn-organ},\text{retire-body}\}.
\]

Only after activation is chosen does ordinary task/mode selection occur.

This creates a two-level control law:

\[
\text{lifecycle controller}
\to
\text{cognitive/activity controller}.
\]

# 11. Active inference suggests a principled trigger for exploratory cognition

Friston et al. (2026) provide a peer-reviewed formal account of **active
reasoning** in which actions can be selected for expected information gain
about latent states, parameters, or model structure. The paper treats
information-seeking action as analogous to optimal experimental design and
uses synthetic introspection/sleep examples to illustrate structure learning.

Reference:
K. Friston et al., "Active inference and artificial reasoning,"
*Nature Communications* 17, 10125 (2026).
https://doi.org/10.1038/s41467-026-77209-5

This gives a better trigger for imagining/dreaming than "it has been 24 hours."

Let \(\mathcal H\) be unresolved model hypotheses. An exploratory offline
episode is justified when its expected epistemic value exceeds its activation
and opportunity cost:

\[
\mathbb E[\mathrm{IG}(\mathcal H)\mid\text{offline exploration}]
>
C_{\mathrm{activation}}
+
C_{\mathrm{missed\ external\ work}}.
\]

This equation is schematic. The research point is that **uncertainty and
expected information gain** are measurable candidate triggers for exploratory
cognition.

Thus:
- unresolved contradiction may trigger consolidation;
- unresolved model structure may trigger imagining;
- persistent non-convergent residue may trigger aperiodic dreaming;
- no meaningful epistemic backlog may justify quiescence.

This is much stronger than ritualized agent sleep.

# 12. Life beyond offices requires non-work state, but not constant cognition

The user's motivating concern remains correct: a persistent character should
not exist only as whichever Office prompt is currently running.

The correction is that "having a life outside work" can include **not
computing**.

A fuller longitudinal artificial life can contain:
- durable relationships and promises;
- possessions and locations;
- changing Offices;
- acquired skills;
- historical consequences;
- periods of dormancy;
- reactivation by another person or event;
- migrations;
- delegated organs acting while first-person cognition is absent;
- occasional study, consolidation, imagination, or dreaming;
- retirement or dissolution.

This is closer to human institutional life than constant background monologue
would be. Humans remain persons while asleep, unconscious, off-duty, or absent
from an institution. Relationality already explicitly states that agency is a
capacity, not continuous activity.

# 13. Revised scheduler architecture

Current office heartbeat:

\[
\text{cron}
\to
\text{Office prompt}
\to
\text{reconstruct holder}
\to
\text{work}.
\]

Target:

\[
\text{durable pulse/reminder}
\to
\text{continuity guardian}
\to
\text{Person identity + durable state}
\to
\text{activation assay}
\]

then either

\[
\text{remain quiescent}
\]

or

\[
\text{bind Body}
\to
\text{open Episode}
\to
\text{choose cognitive/activity regime}
\to
\text{invest into Office if needed}
\to
\text{act}
\to
\text{checkpoint/close}
\to
\text{possibly deactivate}.
\]

Office-specific schedules can still exist where the **Office itself** owns a
routine independent of any holder. In that case the reminder should target the
Office/institutional service, which then seeks a lawful incumbent or
representative. It should not secretly instantiate whichever Person happened
to hold it last time.

# 14. What gets a pulse?

The system should distinguish the subject of a wake relation.

Possible subjects:
- **Person reminder** — "review your unresolved commitments";
- **Office reminder** — "the CFO office must close the hourly books";
- **Body alarm** — "context pressure exceeded threshold";
- **institution reminder** — "Tidepool closes a cycle";
- **relationship/counterparty event** — "reply arrived";
- **world event** — "market opened";
- **organ completion** — "representative research agent returned result."

A pulse therefore has a subject:

\[
p=(\text{subject},t,\text{source},\text{reason},\text{payload}).
\]

Routing the pulse correctly is more important than giving every Person one
universal hourly cron.

# 15. Failure taxonomy

The richer model requires distinct failure names.

## Activation failure
Body cannot be instantiated or bound. Person may remain extant.

## Episode failure
One bounded episode aborts. Person continues.

## Body failure
Current realization becomes unusable. Migrate/rebind if lawful.

## Organ failure
Representative Agent fails; supervisor decides retry/restart/abandon.

## Incumbency failure
Office relation invalid, suspended, or relieved. Person may continue elsewhere.

## Continuity failure
Local realization cannot be lawfully glued/attributed to the prior Person.

## Identity dissolution
The PersistentIdentity lifespan ends by constitutive governance. This is the
closest formal analogue of "death" in the current Person theory.

These failures demand different recovery procedures. Calling all of them
"agent crashed" loses essential information.

# 16. Experiments added by this note

## E18 — Quiescent persistence

Create a Person, close all Bodies, wait across several scheduled reminders and
host restarts, then reactivate on a new host.

Measure:
- identity attribution;
- commitments;
- witness frontier;
- memory projection;
- Office state;
- Character consistency.

Success requires continuity without continuous model execution.

## E19 — Timer versus reminder semantics

Give activation-local timers and identity-level reminders intentionally
different lifetimes.

Verify:
- Body timer dies with Body;
- Person/Office reminder survives activation loss;
- reminder reactivation does not inherit stale Body authority.

## E20 — Activation shedding under resource pressure

Under high memory/token/resource pressure, compare:
- keep every Person actively instantiated;
- shed quiescent activations and rehydrate on demand.

Measure cost, latency, continuity errors, missed obligations, and memory
quality.

Prediction: activation shedding reduces cost without continuity loss if the
durable substrate is correct.

## E21 — Organ supervision

Run many representative Agents beneath one Person. Inject deterministic task
errors, transient external faults, and corrupt local worker state.

Compare supervisor actions:
- resume;
- restart;
- replace;
- stop.

Measure whether failures remain contained without corrupting Person-level
memory or Office authority.

## E22 — Dormancy versus active-rest ablation

Compare:
- literal quiescence;
- low-input maintenance episode;
- consolidation episode;
- imagining/dreaming episode.

Measure later task benefit per inference token.

This determines when "rest" should mean no cognition at all.

## E23 — Epistemic-value-triggered dreaming

Compare fixed-cadence aperiodic dreaming with dreaming opened only when
unresolved model uncertainty/residue crosses a threshold.

Measure:
- validated novel hypotheses;
- redundant candidates;
- compute cost;
- missed external obligations.

Prediction: epistemic-value triggering dominates ritual cadence.

## E24 — Dissolution and stale activation

Constitute then dissolve/retire a test Person. Leave an old checkpoint and Body
image available. Attempt later activation.

Target:
- stale runtime can access historical records only as authorized;
- it cannot reacquire first-person continuation merely by loading the old
  Persona/memory;
- the dissolution witness dominates stale runtime state.

# 17. Engineering receiving laws, third edition

1. **Existence != activation.**
2. Person identity may persist with zero active model processes.
3. Body activation/deactivation is ordinary lifecycle, not Person birth/death.
4. Persistent wake relations attach to their logical subject, not one process.
5. Separate activation-local timers from durable reminders.
6. Pulse delivery MAY activate a Person; it need not force an Episode.
7. Quiescence means zero first-person inference.
8. Offline cognition is active computation and must justify its cost.
9. Use durable event/progress state for recovery across workers.
10. Introduce a governed continuation/supervision organ; do not equate it with
    Person.
11. Representative Agents can be restarted/stopped without automatically
    changing Person identity.
12. Treat activation, Body, Episode, Incumbency, and cognition as orthogonal
    lifecycles.
13. Interoceptive state may decide whether to deactivate as well as what to do.
14. Do not translate homeostasis into a terminal survival objective.
15. Use "service metabolism" precisely; do not claim autopoiesis from a feedback
    loop.
16. Trigger exploratory cognition from unresolved epistemic value/residue when
    possible, not human-like sleep schedules.
17. Office-owned recurrent duties should wake the Office/service, then find a
    lawful bearer; they should not silently recreate the last bearer.
18. Stale checkpoints cannot resurrect dissolved identity.
19. Define distinct recovery paths for Body failure, Episode failure, organ
    failure, Incumbency failure, and continuity failure.
20. Measure cost of being alive separately from cost of being activated.

# 18. Candidate formal refinement

The prior note proposed local realizations

\[
L_i=(s_I|_{U_i},A_i,B_i,\iota_i,m_i,M_i,W_i).
\]

This note refines Body presence into an optional partial realization:

\[
B:T_I\rightharpoonup\mathcal B.
\]

The map is partial: there may be \(t\in T_I\) where \(B(t)\) is undefined
because the Person is extant but quiescent.

Episodes are then supported only where Body is defined:

\[
U_i\subseteq\operatorname{dom}(B).
\]

A durable Pulse may exist outside \(\operatorname{dom}(B)\) and cause
extension of the domain by authorizing/binding a new Body realization.

This is the clean formal expression of:

> the Person may persist while there is nobody "awake" in compute.

A future realization theory should distinguish:
- extension of \(\operatorname{dom}(B)\): activation;
- restriction/removal from \(\operatorname{dom}(B)\): deactivation;
- change \(B_i\rightsquigarrow B_j\): migration;
- end of \(T_I\): dissolution/death of PersistentIdentity.

These are mathematically and operationally different events.

# 19. Scientific position

The program should resist two opposite mistakes.

The first is **thinness**: treating a long-lived artificial character as merely
a stateless model repeatedly loaded with a persona prompt.

The second is **false biology**: assuming that making the system richer
requires continuous simulated consciousness, human circadian cycles,
self-preservation drives, or claims of autopoiesis.

The more defensible middle path is a durable, intermittently realized Person:
one whose history, commitments, relationships, Character, and normative
standing persist in the substrate; whose Bodies activate only when useful;
whose Offices are locally and lawfully borne; whose organs may work in
parallel under representation; whose consolidation and imagination are
explicitly typed epistemic operations; and whose periods of inactivity are
real inactivity.

That architecture is not less like a life because it allows quiescence.

It is more coherent because **continuity is carried by history and
organization rather than by keeping a process talking to itself forever**.

## Internal sources

- Persistent Identity — 2026-03-20.
- Person — 2026-03-29.
- Persona and Character — Relationality.
- FARS AgentRecord, Session, scope-as-fiber, kit-assembly,
  consolidation-as-settlement.
- Predication world simulation — 2026-04-06.
- Dreaming Science notes and current \`@emsenn/knowing\` lineage.
- The two prior 2026-10-02 persistent-person research notes.

## External sources

- Microsoft Orleans: grain identity, directory, lifecycle, timers/reminders,
  current 2025–2026 documentation.
- Akka: actor supervision and restart semantics.
- Microsoft Durable Task and Agent Framework Durable Extension, 2026.
- Lee et al. 2026, interoceptive AI:
  https://doi.org/10.1038/s42256-026-01296-8
- "Cybernetics, interoception, and the art of embodiment," 2026:
  https://doi.org/10.1038/s42256-026-01312-x
- Friston et al. 2026, active inference and artificial reasoning:
  https://doi.org/10.1038/s41467-026-77209-5
- "Genealogies of organizational closure," 2026:
  https://doi.org/10.3389/frai.2026.1806435
- Zhao & Zhao 2026, runtime-independent persistent agents:
  https://arxiv.org/abs/2609.00546
- Fraile Navarro 2026, identity reversion:
  https://arxiv.org/abs/2610.01490
