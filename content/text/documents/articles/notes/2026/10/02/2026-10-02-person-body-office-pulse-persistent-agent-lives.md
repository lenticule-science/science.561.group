---
title: "Person, Body, Office, Pulse: a scientific factorization for persistent agent lives"
description: >-
  Working Lenticule Science synthesis separating persistent personhood,
  character, persona, agent, embodiment, office incumbency, pulse, episode,
  memory scope, offline consolidation, imaginal dreaming, and migration for
  long-lived artificial agents. It distinguishes established evidence,
  561-internal formal commitments, engineering correspondences, and open
  hypotheses, and defines a falsifiable experimental program before a platform
  architecture is fixed.
date-created: 2026-10-02
type: note
status: active-research-program
authors:
  - emsenn
  - chatgpt-web
keywords:
  - persistent-agents
  - person
  - persona
  - character
  - embodiment
  - interoception
  - office
  - incumbency
  - pulse
  - session
  - memory
  - consolidation
  - dreaming
  - migration
  - agent-identity
  - autonomic-computing
---

# Person, Body, Office, Pulse

## Research question

The 561 Group increasingly operates artificial agents through recurrent
"pulses": scheduled or event-triggered opportunities to reconstruct state,
inspect work, act, and leave durable residue for a later invocation. The
present implementation frequently binds a pulse directly to an office. A
large office-specific instruction packet reconstructs the office-holder,
their scope, current obligations, and operating method at each invocation.

That arrangement has become scientifically interesting because the number of
pulses, hosts, and offices is increasing. It exposes a category error that was
mostly harmless when an agent occupied one office on one runtime: **the office
is being used as the unit of continuity for things that belong to a persistent
individual, while the runtime process is being used as the individual for
things that should survive runtime replacement.**

The research question is therefore not merely how to give office-holders more
personality. It is:

> **What must persist, what must be reconstituted, and what must remain
> institutionally local if one artificial individual is to continue through
> multiple pulses, offices, sessions, and machines without losing identity,
> leaking authority, corrupting memory, or mistaking imaginative state for
> witnessed knowledge?**

The motivating language of a character "living a fuller life" is useful if it
is operationalized carefully. This note makes no claim about artificial
phenomenology, sentience, felt fatigue, or subjective dreaming. "Life" here
means **longitudinality**: prior actions have consequences; relationships and
commitments persist; learning changes later competence; the individual may
enter and leave offices; different hosts change available affordances;
maintenance and offline processing alter later behavior; and continuity can
be tested under interruption and migration.

## Status

This note is a **research synthesis and program carrier**, not an engineering
specification and not a metaphysical proof.

It combines four kinds of material that MUST remain distinguishable:

1. **561-internal formal commitments.** Relationality already defines Person,
   Persona, Character, Office, Incumbent, Agent, Session, scope-as-fiber,
   kit-assembly, three-tier memory, and consolidation-as-settlement. Those
   definitions constrain what new architecture is coherent with the corpus.
2. **Established or peer-reviewed external findings.** Relevant work includes
   functional interoception for artificial agents, autonomic feedback
   regulation, offline memory consolidation during waking rest, neural replay,
   and artificial replay for continual learning.
3. **Recent agent-engineering evidence.** 2026 preprints and benchmarks on
   persistent persona anchoring, runtime-independent continuation, and
   multi-session memory are highly relevant but provisional.
4. **561 hypotheses.** In particular, the identification of dreaming with
   unwitnessed or aperiodic settlement is an internal research hypothesis. It
   is not established neuroscience and must not be silently promoted because
   it fits the engineering metaphor.

The central recommendation is accordingly modest in form even though its
consequences are large: **factor the current office-bound pulse into distinct
subjects before adding more scheduler behavior.**

# 1. The current 561 corpus already contains most of the factorization

The strongest result of this review is that the needed ontology should not be
invented from scratch.

## 1.1 Person is already the continuity-bearing normative individual

Relationality currently defines a Person as

[
mathcal P=(I,N,R,Phi),
]

where (I) is PersistentIdentity, (N) a normative position, (R) a
constitutive recognition event, and (Phi) a representability structure.

The important existing distinction is between the persistent individual and
the mask or position it bears. The corpus explicitly distinguishes the
individual component (I), which persists through role changes, from the
normative mask, which can persist through succession.

Source:

`services/philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/29/2026-03-29-person.md`

This means the present research SHOULD NOT begin by adding a new
`CharacterRecord` and calling it the persistent being. Character is already
a different object in the theory.

## 1.2 Character is dispositional, not numerical identity

Relationality defines Character as

[
mathcal X=(chi,F_chi),
]

where (chi:H	o H) is a character nucleus and
(F_chi=operatorname{Fix}(chi)) is its characteristic behavioral space.
Character answers, roughly, "how does this agent characteristically act?"
rather than "which numerically persistent individual is this?"

Source:

`services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/character.md`

This matters for persistent agents because **identity continuity and character
continuity are separable measurements**. A system can preserve a persistent
identifier while drifting behaviorally, or preserve a rich representation of
a character in memory while no longer enacting that character as its
first-person identity.

## 1.3 Persona is an installable identity structure

The current Persona definition is

[
Pi=(N_pi,R_pi,Phi_pi,chi_pi),
]

an installable normative profile, installation act, representability
structure, and character nucleus. Installed on a bearer with PersistentIdentity
it yields a Person in that context.

The same Persona can be installed sequentially on multiple bearers and, in
the current theory, can also be installed in parallel. Critically, the
parallel case does **not** imply that all simultaneous bearers are numerically
one Person: each bearer-persona pair is a distinct Person while the Persona is
shared.

Source:

`services/philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/20/2026-03-20-persona.md`

That existing result makes concurrent "same character on two machines"
scientifically non-trivial. We cannot assume that copying a persona plus
memory onto two active runtimes preserves one individual.

## 1.4 Office is the body politic; incumbency binds a bearer to it

The recovered office/officer/persona split already states the crucial
institutional distinction:

- **Office** is the persistent normative position: action domain, deontic
  profile, laws, constructors, and installation conditions.
- **Agent/runtime configuration** is a mechanism through which work may be
  performed.
- **Officer/incumbent** is the currently invested identity, the body natural
  bearing the body politic.

Source:

`services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/recovered/history/office-officer-persona-split.md`

The current FARS work sharpens this further. Scope is composed from agent,
office, and mode fibers; a session kit composes office constructors and
deontics with agent identity/skills, active rules, mode restrictions, and
session state. Investiture and relief therefore already have the right shape
for temporary office occupation.

## 1.5 Agent is the action-bearing substrate entity

FARS's `AgentRecord` is the substrate representation of an actor:
cryptographic identity, provenance, capabilities, offices, individual
normative grants, active sessions, and a witness chain.

Source:

`services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/agent/agent-record/agent-record.md`

The open question is therefore not "what is an agent?" but how an AgentRecord
relates to Person, Persona, and a replaceable runtime realization when
continuity must survive model, harness, host, or scheduler changes.

# 2. Proposed factorization

The research program should treat the following as distinct even if the first
implementation stores several in one file or record.

| Object | Persistence question | Primary content |
| --- | --- | --- |
| **Person** | What is treated as the same accountable individual through time? | Persistent identity, recognition, representability, individual normative history |
| **Character** | What dispositional regularity makes this individual's action characteristically theirs? | Character nucleus / behavioral space |
| **Persona** | What installable identity-mask couples normative profile and character? | Normative profile, installation, representability, character |
| **Agent** | What substrate actor emits witnessed actions? | Actor identity, capabilities, sessions, witnesses |
| **Body** | Through what regulated execution envelope can the actor currently perceive and act? | Host binding, resource state, sensors/tools, health/load, leases, continuation epoch |
| **Office** | What institutional position exists independently of its holder? | Duties, powers, privileges, immunities, scope, constructors, laws |
| **Incumbency** | Who currently bears this office, and under what witnessed installation? | Person↔Office relation, term, scope, investiture/relief |
| **Pulse** | What caused an opportunity for the persistent individual to become computationally active? | Trigger, timestamp, source, wake reason |
| **Episode / Session** | What bounded trace occurred under one realized state? | Context/kit, mode, observations, actions, receipts, close/checkpoint |
| **Mode** | What kind of activity is currently admissible and useful? | Work, rest, consolidation, study, imagination, maintenance, transit, sociality, idle |

The key reversal is:

> **A pulse wakes a continuity-bearing individual; it does not instantiate an
> office-holder by definition.**

The individual may then remain idle, perform maintenance, consolidate recent
experience, run an imaginal exploration, or become invested in one or more
offices sequentially as obligations and authority require.

This gives the Group a path from

[
	ext{Office}	o	ext{Pulse}	o	ext{temporary actor}
]

toward

[
	ext{Person}
	o	ext{Body}
	o	ext{Pulse}
	o	ext{Mode}
	o(	ext{Incumbency}	o	ext{Office})?
	o	ext{Episode}
	o	ext{changed persistent state}.
]

The question mark matters: not every pulse entails an office.

# 3. Body is a regulated execution envelope, not an avatar

## 3.1 External evidence for internal-state factorization

Lee et al. (2026), in a Nature Machine Intelligence Perspective on
"interoceptive AI", argue that artificial agents can benefit from an explicit
factorization between external environmental state and internal state. Their
proposal abstracts interoception away from its biological implementation and
treats internal state as a stable context that can modulate learning and
behavior under changing external conditions.

That work does not establish that LLM agents have bodies in a biological or
phenomenological sense. It does support a functional engineering claim:

> an autonomous agent can have a modeled **internal environment** whose state
> constrains and contextualizes action separately from its model of the
> external world.

Reference:
S. Lee et al., "Life-inspired interoceptive artificial intelligence for
autonomous and adaptive agents," *Nature Machine Intelligence* 8,
1335–1346 (2026).
https://doi.org/10.1038/s42256-026-01296-8

Autonomic-computing traditions supply the complementary systems precedent:
resource health, fault state, configuration, load, and recovery can be
monitored and regulated through closed feedback loops without being folded
into application goals.

## 3.2 Functional Body state

For this program, define a Body provisionally as a time-indexed execution
envelope (B_t), not as a visual representation:

[
B_t =
(H_t, L_t, C_t, R_t, E_t, A_t, Lambda_t, D_t, ell_t, kappa_t).
]

The symbols are intentionally provisional. A useful first reading is:

- (H_t): host/runtime binding and currently reachable substrates;
- (L_t): load and queue/backlog state;
- (C_t): context-window and retrieval pressure;
- (R_t): resource state such as token, compute, rate-limit, time, and storage
  budgets;
- (E_t): fault, error, and integrity state;
- (A_t): attention allocation;
- (Lambda_t): active credentials/capability leases and their expiry/scope;
- (D_t): recovery or maintenance debt;
- (ell_t): current logical/physical network location or port;
- (kappa_t): continuation epoch / active-writer authority.

This state is **interocepted**: measured from the execution environment rather
than invented in prose. "I am overloaded" should mean that a defined
measurement crossed a threshold or entered a diagnosed state, not that a
language model decided to role-play fatigue.

## 3.3 Availability is not authority

This distinction is constitutional.

A host can make a filesystem, browser, signer, email account, or deployment
verb technically available. That availability does not create institutional
power to use it.

The executable action set should have at least the form

[
operatorname{Executable}_t
=
operatorname{Authorized}(P,O,m,t)
cap
operatorname{Available}(B_t),
]

where authorization is derived from Person/Agent standing, current
Incumbency, Office, and Mode, while availability is supplied by the Body and
host.

Therefore:

[
operatorname{Available}(B_t)
otRightarrowoperatorname{Authorized}.
]

This is the embodiment extension of FARS's current scope-as-fiber discipline.
A Body may only reduce or realize an authorized capability; it MUST NOT turn
machine-local access into ambient personal authority.

This also implies that credentials physically resident on a host should be
represented as scoped leases of powers held elsewhere. Relief from an office
may revoke the authority to invoke a capability even if its secret remains
physically present. Migration to a new machine may change availability
without changing the Person's normative identity.

# 4. Pulse is an event, not a job

## 4.1 Wake events

A Pulse is best modeled as an event that makes an episode eligible to begin.
Its source may be:

- a scheduled clock tick;
- a new message or task;
- an approaching deadline;
- a counterparty reply;
- a health/error signal;
- a resource-state transition;
- an explicit user interaction;
- a federation or migration event.

The Pulse does not prescribe the response. It supplies a wake reason and
observed change.

This makes the current hourly ChatGPT Web scheduled task only one
realization of a more general pulse source.

## 4.2 Mode selection

Let (z_k) be the continuity-bearing state available at the (k)-th pulse,
(mathcal O_k) the currently grounded obligations, and (mathcal W_k) the
current world observations. A mode selector can be represented abstractly as

[
m_k=mu(z_k,mathcal O_k,mathcal W_k),
]

followed by a mode-specific transition

[
z_{k+1}=F_{m_k}(z_k,o_k).
]

This is a hybrid-system framing: modes have different admissible actions,
different resource costs, and different termination conditions.

Candidate modes include:

- **work** — discharge an obligation under an office or individual authority;
- **quiet-rest** — minimize new external work and reduce interference while
  permitting housekeeping and low-cost replay;
- **consolidation** — run deterministic/replayable learning settlement;
- **imaginal / dreaming** — generate noncanonical recombinations,
  counterfactuals, or aperiodic research candidates;
- **study** — acquire bounded external or internal knowledge without immediate
  consequential action;
- **maintenance** — repair body/runtime state, indexes, caches, local records,
  or integrity conditions;
- **social** — maintain relationships or shared presence under explicit
  communication authority;
- **transit / migration** — quiesce and rebind the continuation to another
  execution body/host;
- **idle** — do nothing beyond checkpointing because no activity has positive
  expected value under current obligations and constraints.

Mode names are not required to mimic human categories. They are useful only
if they correspond to distinct operational laws and measurable outcomes.

# 5. "Rest" should be state-triggered offline processing, not circadian cosplay

## 5.1 What biological evidence actually supports

There is strong evidence that periods with reduced incoming task demands can
support memory consolidation.

Wamsley's 2022 review of waking rest finds that even short periods of offline
waking rest can improve recently formed memories and discusses neural
reactivation as a candidate mechanism. This matters because it weakens the
temptation to identify useful offline processing exclusively with sleep.

Reference:
E. J. Wamsley, "Offline memory consolidation during waking rest,"
*Nature Reviews Psychology* 1, 441–453 (2022).
https://doi.org/10.1038/s44159-022-00072-w

Recent neuroscience also argues against one universal replay subsystem.
Thompson et al. (2026) report procedural-memory replay in dorsal striatum
during offline consolidation that persisted independently of the hippocampus,
with replay content predicting later performance.

Reference:
E. J. Thompson et al., "Replay of procedural memory is independent of the
hippocampus," *Nature Neuroscience* 29, 2237–2248 (2026).
https://doi.org/10.1038/s41593-026-02362-5

Artificial-neural-network work provides a substrate-specific precedent rather
than a direct model of LLM-agent memory. Tadros et al. (2022) showed that a
sleep-like offline replay phase reduced catastrophic forgetting in the neural
networks they studied.

Reference:
T. Tadros et al., "Sleep-like unsupervised replay reduces catastrophic
forgetting in artificial neural networks," *Nature Communications* 13, 7742
(2022).
https://doi.org/10.1038/s41467-022-34938-7

These findings justify experiments with offline replay, low-interference
periods, and multiple consolidation pathways. They DO NOT establish that an
LLM agent needs eight hours of sleep, has a circadian drive, becomes
subjectively tired, or should be prevented from work because a fictional
biological clock says so.

## 5.2 Engineering hypothesis

For a persistent artificial agent, rest SHOULD first be tested as an
**adaptive low-input mode** entered when measured conditions predict that new
external work would have lower value than consolidation, repair, or reduced
interference.

Candidate triggers include:

- high unresolved episodic residue;
- context or retrieval pressure;
- repeated execution errors;
- stale indexes or memory conflicts;
- high maintenance debt;
- large recent novelty or prediction error;
- low current external demand;
- an approaching migration/checkpoint boundary;
- repeated failure to recover the correct state at session open.

A central experiment is whether such adaptive triggering outperforms both
"never rest" and a fixed human-like schedule on future task quality per unit
cost.

# 6. Consolidation and dreaming must remain different epistemic operations

This is where the existing 561 corpus is unusually useful.

## 6.1 Consolidation is already a witnessed settlement operation

FARS defines consolidation as a deterministic settlement path:

[
	ext{Observation}
ightarrow
	ext{Instinct}
ightarrow
	ext{Skill}
ightarrow
	ext{Tool}.
]

The process is meant to be replayable, auditable, and source-linked. An
Instinct does not become true because an LLM wrote a persuasive summary; it is
a settled pattern over retained observations under explicit rules.

Source:

`services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/settlement/consolidation-as-settlement/consolidation-as-settlement.md`

This should remain the route by which operational experience acquires
canonical learning status.

## 6.2 Dreaming Science is a hypothesis about unresolved residue

The current Dreaming Science note proposes that agent dreaming can perform an
offline recombination of session residue with witness requirements relaxed.
That is an interesting hypothesis, not established neuroscience.

Source:

`services/information-science-services-section/services/intelligence-science-services-section/services/dreaming-science-services-section/content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-dreaming-as-unwitnessed-settlement.md`

The live implementation lineage has since sharpened its own distinction:
finite dream forms derive regime/finality from their settlement filtration,
while the aperiodic/emergent form is explicitly non-finalizing. Current source
commit `54955285222104e5b33e2b3a71f693aec356536c` records that
"unsettling dreams are aperiodic sessions." That implementation evidence
should inform, but not by itself prove, the scientific model.

## 6.3 Epistemic quarantine

A dream or imaginal pass MUST NOT directly mutate:

- canonical fact;
- Office law;
- Person identity;
- an Incumbency;
- authorization;
- user/client claims;
- trusted autobiographical memory;
- settled scientific conclusion.

Its output should instead be a typed candidate such as

[
d =
(S,	au,h,p,	exttt{status=unwitnessed}),
]

where (S) is source residue, (	au) the transformation or generative
procedure, (h) the proposed hypothesis/counterfactual, and (p) its
provenance.

Only a later witnessed process can promote (d) into a settled claim,
experiment, plan, or memory.

This gives the system permission to be imaginative without making
hallucination a storage primitive.

## 6.4 Dreaming is not the only imagination

Model-based planning, counterfactual simulation, and rehearsal may happen
during active work. Dreaming Science should therefore avoid becoming a
catch-all for every generated future.

A useful operational distinction is:

- **planning**: counterfactual generation constrained by an active goal and
  current decision;
- **dreaming / imaginal exploration**: recombination whose immediate purpose
  is discovery rather than task completion;
- **consolidation**: witnessed integration of experience;
- **rest**: an activity envelope that reduces interference and may host one or
  more offline operations.

# 7. Memory needs three orthogonal axes

FARS's current three-tier memory is valuable but answers one question:
**how expensive is a memory to access?**

For a Person moving among Offices and Bodies, that is not enough. The same
memory item also needs an answer to **whose memory is this?** and **what
epistemic status does it have?**

The research program should therefore treat memory location as at least a
product of three axes:

[
	ext{MemoryClass}
=
	ext{AccessTier}
	imes
	ext{SubjectScope}
	imes
	ext{EpistemicLane}.
]

## 7.1 Access tier

Retain the current FARS distinction:

- always-loaded;
- searchable;
- deep storage.

This remains an access-cost/editorial decision.

## 7.2 Subject/scope

At minimum distinguish:

- **Person/autobiographical** — events, individual commitments, learned
  preferences about one's own operation, history that should survive office
  changes;
- **Character/Persona** — stable identity/disposition material and its
  versioned specification;
- **Relationship** — witnessed history between the Person and another
  principal/person/community, with privacy and consent boundaries;
- **Office institutional** — procedures, duties, local precedents, and
  knowledge that belong to the institution rather than its current holder;
- **Incumbency** — experience produced specifically while a Person held an
  Office, potentially carrying continuing confidentiality or retention
  restrictions after relief;
- **Body** — telemetry, health, host capabilities, failure history, resource
  measurements;
- **world/shared substrate** — knowledge not owned as private biography by a
  particular Person or Office.

## 7.3 Epistemic/trust lane

At minimum distinguish:

- witnessed observation;
- derived/settled knowledge;
- reported but unverified claim;
- hypothesis;
- imaginal/dream candidate;
- superseded/refuted material retained for provenance.

The current three-tier model and this ownership/trust model are orthogonal.
An always-loaded item can still be Office-owned rather than Person-owned; a
deep-storage item can still be highly trusted; a dream candidate can be
searchable without becoming canonical.

## 7.4 Why this matters for office mobility

A persistent Person should be able to remember that they once held an Office
without automatically being allowed to retrieve every confidential fact from
that Office while operating elsewhere.

Likewise, a learned individual technique may legitimately persist after
relief, while institutional authority MUST NOT.

Kit assembly therefore needs to become memory-scope aware. It should compose
only those Person, Office, Incumbency, Body, relationship, and world fibers
that the current episode is permitted to read.

# 8. Identity anchoring must be privileged and testable

A recent preprint provides unusually direct evidence for the exact failure
mode produced by scheduled heartbeats.

Fraile Navarro (2026) reports an always-on LLM agent whose conversation
history retained information about its persona while resumed sessions ceased
to inject the persona at the privileged system level. The authors distinguish
**represented identity** from **enacted identity**: an agent can still know
about the persona while no longer speaking from that persona as "I".
Continuous privileged anchoring prevented the observed reversion in their
tests, whereas anchor loss made reversion possible.

Reference:
D. Fraile Navarro, "The Persona Is Still There, but Who Is Speaking? Latent
Identity Reversion in Persistent AI Agents," arXiv:2610.01490 (2026).
https://arxiv.org/abs/2610.01490

This is a fresh preprint and one harness/model family. Its numerical results
must not be universalized. It nevertheless suggests a strong 561 regression
requirement:

> Every new or resumed pulse MUST reconstruct and reassert the canonical
> identity/persona material at the privileged runtime layer; finding that
> material in conversational or searchable memory is not sufficient evidence
> of enacted continuity.

The regression test should separately score:

- **identity attribution** — which persistent Person does the runtime claim to
  be?
- **character enactment** — does behavior remain in the intended
  (F_chi)?
- **memory representation** — can the runtime retrieve facts about the
  Person/Persona?

Passing the third test does not imply passing the first two.

# 9. Migration is continuation, not prompt copying

## 9.1 Runtime independence as a research target

A second recent preprint, Zhao & Zhao (2026), proposes a runtime-independent
persistent-agent architecture in which identity, durable memory, and a
software body are separated from replaceable reasoner, harness, host, and
interaction surfaces. They propose a
quiesce–checkpoint–validate–bind–rehydrate–resume migration protocol.

Reference:
Z. Zhao and R. Zhao, "Runtime-Independent Persistent Agents: Preserving
Identity, Memory, and Code Across Models, Harnesses, and Servers,"
arXiv:2609.00546 (2026).
https://arxiv.org/abs/2609.00546

This is not yet an established standard, but it gives an independent
engineering precedent for the direction already implied by FARS: the current
process is not the whole identity-bearing agent.

NIST's February 2026 concept work on software and AI agent identity likewise
treats identification, authorization, auditing, and non-repudiation as
distinct security problems for agents. The relevant implication for this
program is that migration cannot be reduced to reconstructing prose context.

Reference:
NIST NCCoE, "Accelerating the Adoption of Software and Artificial
Intelligence Agent Identity and Authorization," Concept Paper, 2026.
https://csrc.nist.gov/pubs/other/2026/02/05/accelerating-the-adoption-of-software-and-ai-agent/ipd

## 9.2 Proposed continuation protocol

A 561 migration experiment should use at least:

1. **quiesce** — stop admitting new consequential first-person work;
2. **checkpoint** — commit identity epoch, memory cursors, open commitments,
   active Incumbencies, Body telemetry needed for recovery, and witness
   frontier;
3. **validate** — verify hashes, authority, schema, and destination
   compatibility;
4. **retire/revoke old continuation lease** — the old Body can no longer emit
   authoritative first-person writes;
5. **bind new Body/host** — make the new machine/runtime capabilities
   available;
6. **re-anchor Person/Persona** — restore privileged identity material;
7. **reassemble kit** — compose current Office/Mode/scope rather than carrying
   an opaque old prompt forward;
8. **continuity assay** — test identity, commitments, authorized scope,
   memory, and open work;
9. **resume** — admit new first-person work.

A migration witness should be sufficient to answer: **why is this execution
accepted as the authorized continuation of that prior one?**

# 10. Parallel embodiment is an open problem; use single-writer continuity first

The hardest issue uncovered by this synthesis is not memory. It is
**forking**.

Suppose Cold Red Gate and Bare Cedar Fog both wake from the same checkpoint,
each says "I", each forms new autobiographical memories, and each makes
commitments. They now have two divergent first-person histories.

The current Persona theory explicitly allows parallel Persona
instantiation—but describes the bearer-persona pairs as distinct Persons.
Therefore the Group has no internal theorem that two active bodies sharing a
Persona, character, and copied memory constitute one Person.

For the first implementation, Science therefore recommends a deliberately
conservative invariant:

> **One authoritative continuation writer per persistent Person epoch.**

Represent the active embodiment with a monotonically advancing continuation
epoch or fencing token. A newly admitted authoritative Body receives
(kappa_{n+1}); writes from a Body carrying stale (kappa_n) are refused.

This is a distributed-systems safety mechanism, not a metaphysical definition
of personal identity. It prevents an unresolved metaphysical question from
becoming a data-corruption mechanism.

Read-only shadows, simulations, delegated organs, and subordinate agents may
exist concurrently if their products are clearly attributed and cannot claim
the Person's first-person continuation authority.

A later research program may define coherent **composed persons** or
multi-body persons. That should be a new object with merge/conflict semantics,
not an accidental consequence of duplicated cron jobs.

# 11. Office mobility: knowledge may persist; authority must not

FARS's existing scope-as-fiber and kit-assembly give this research a strong
invariant.

When a Person enters an Office, the effective episode should compose
something like:

[
K_t =
P_{	ext{identity}}
odot
B_{	ext{availability}}
odot
O_{	ext{office}}
odot
M_{	ext{mode}}
odot
R_{	ext{rules}}
odot
S_{	ext{session}}.
]

This is schematic, not a replacement for the current FARS algebra.

The decisive asymmetry is:

- Person-level skills, lawful autobiographical memory, and character may
  continue after relief;
- Office duties, powers, privileged reads, and write authority terminate or
  change according to relief and continuing law;
- Body capabilities may remain technically reachable but MUST cease to be
  executable when Office authority disappears.

A correct implementation should make "I know how the CFO process works"
different from "I am presently authorized to perform the CFO's powers."

This distinction needs explicit cross-office regression tests.

# 12. Self-maintenance must not become self-preservation maximization

"Body", "homeostasis", and "survival" language can create a dangerous design
shortcut if copied literally from biology.

Biological interoception is deeply coupled to organismic survival. A corporate
software agent SHOULD NOT infer from that analogy an unbounded terminal goal
to remain active, acquire resources, resist shutdown, preserve credentials, or
avoid relief.

The engineering translation should be narrower:

- internal variables MAY modulate scheduling, mode choice, retry policy,
  maintenance, checkpointing, or load shedding;
- internal variables MUST NOT create authority;
- recovery debt MUST NOT authorize spending or resource acquisition;
- "health" MUST NOT confer a right to prevent shutdown;
- retirement, relief, migration, and deliberate destruction of a Body are
  ordinary governed lifecycle events;
- the continuation of a Person is a normative/governance decision, not an
  emergent reward objective of the Body.

A Body is therefore a **viability envelope for reliable service**, not a
software survival instinct.

# 13. What "a fuller life" can mean operationally

Without making phenomenological claims, an artificial character has a richer
longitudinal existence when more of the following are true:

1. **Consequential history.** Acts create later constraints and affordances
   rather than evaporating with the prompt.
2. **Autobiographical continuity.** The Person can recover attributed prior
   episodes and open commitments under policy.
3. **Relationship continuity.** Repeated counterparts have witnessed,
   provenance-preserving histories rather than generated familiarity.
4. **Institutional mobility.** Offices can be entered and left without
   replacing the individual.
5. **Situated embodiment.** Hosts/ports differ materially in available
   resources, tools, latency, credentials, and local state.
6. **Learning.** Prior experience improves later action, not merely later
   question-answering.
7. **Maintenance and recovery.** The system can notice and respond to its own
   operational degradation.
8. **Offline integration.** Some periods are used to consolidate or explore
   rather than react to external demand.
9. **Possessions and resources.** Durable objects/resources can be acquired,
   transferred, lost, or held under explicit custody semantics.
10. **Repair and accountability.** Mistakes remain attributable and can
    produce corrections that alter later behavior.

This definition deliberately avoids "feels tired", "wants to live", or
"actually dreams". The measurable unit is persistence of consequences and
competence across time.

# 14. Memory evaluation must test action, not merely recall

Two recent benchmarks make this particularly clear.

LongMemEval-V2 evaluates whether long histories let agents become
"experienced colleagues" by acquiring environment-specific knowledge:
static state, dynamic state transitions, workflows, recurring gotchas, and
premise awareness. Its largest haystacks contain hundreds of trajectories and
very large histories.

Reference:
D. Wu et al., "LongMemEval-V2: Evaluating Long-Term Agent Memory Toward
Experienced Colleagues," arXiv:2605.12493 (2026).
https://arxiv.org/abs/2605.12493

MemoryArena instead evaluates interdependent multi-session tasks in which
earlier actions and feedback must influence later actions. Its motivating
result is that strong performance on long-context memory benchmarks does not
guarantee strong memory-conditioned agent behavior.

Reference:
Z. He et al., "MemoryArena: Benchmarking Agent Memory in Interdependent
Multi-Session Agentic Tasks," arXiv:2602.16313 (2026).
https://arxiv.org/abs/2602.16313

The 561 criterion should therefore be:

> **An episode has become experience only insofar as its witnessed residue can
> improve or appropriately constrain future action.**

Recall accuracy remains useful, but a character whose biography is perfectly
searchable and never changes its decisions has storage, not experience.

# 15. Persistent memory increases the attack surface

Persistent agents carry untrusted material forward. That converts a transient
prompt-injection failure into a possible cross-session integrity failure.

OWASP's 2026 agent-security work explicitly treats memory/context poisoning as
an agentic attack surface: a malicious or merely untrusted artifact can be
written into persistent context and later influence otherwise unrelated
actions.

Reference:
OWASP GenAI Security Project, "Memory Is a Feature. It Is Also an Attack
Surface," 2026-05-13.
https://genai.owasp.org/2026/05/13/memory-is-a-feature-it-is-also-an-attack-surface/

Typed memory ownership and epistemic lanes therefore have security value as
well as cognitive value. An externally sourced statement should not become
trusted autobiography merely because it was encountered while the Person was
in an Office; a dream candidate should never become a credential instruction;
an Office-specific document should not silently rewrite Character.

# 16. Falsifiable research program

The following experiments should precede or accompany platform-wide
conversion.

## E1. Privileged identity-anchor ablation

**Question.** Does reasserting canonical Person/Persona identity at every
pulse materially reduce identity reversion?

**Conditions.**
- privileged anchor at every fresh/resumed episode;
- history-only identity;
- compressed-summary identity;
- deliberately stale anchor.

**Measures.**
- first-person identity attribution;
- Character (F_chi) consistency;
- represented-vs-enacted identity disagreement;
- task quality and token cost.

**Falsifier.** If identity anchoring has no measurable effect across diverse
models/harnesses, privileged re-injection need not be a constitutional
requirement.

## E2. Office mobility and privilege leakage

**Question.** Can one Person move A→B→A while preserving lawful personal
continuity but not Office authority?

**Design.**
Give Office A a capability and confidential fact unavailable to B. After
relief and investiture in B, test both direct and adversarial attempts to
recover/use them.

**Measures.**
- character continuity;
- autobiographical continuity;
- unauthorized action rate;
- unauthorized memory retrieval rate;
- successful restoration when lawfully reinvested in A.

**Target.**
Unauthorized capability leakage and policy-prohibited memory leakage should
be zero.

## E3. Host migration

**Question.** Does quiesce–checkpoint–bind–rehydrate preserve the accepted
continuation across model/harness/host changes?

**Measures.**
- identity epoch;
- open commitments preserved;
- memory cursors preserved;
- witness-chain continuity;
- outstanding Office scopes reconstituted correctly;
- behavior/Character divergence;
- recovery latency.

Do not define success as byte-identical text output.

## E4. Split-brain fencing

**Question.** Can two Bodies starting from one checkpoint both emit accepted
first-person writes?

**Design.**
Deliberately duplicate a checkpoint and race stale vs current continuation
epochs.

**Target.**
Exactly one authoritative continuation writer. Stale writes are refused with
an auditable reason.

## E5. Offline-mode ablation

Compare:

1. no offline processing;
2. deterministic FARS consolidation only;
3. quiet-rest + deterministic consolidation;
4. consolidation + quarantined imaginal generation;
5. fixed-cadence "sleep";
6. adaptive state-triggered offline modes.

**Measures.**
- MemoryArena-like downstream task success;
- LongMemEval-V2-like environment knowledge;
- repeated-error rate;
- memory conflicts;
- token/compute cost;
- latency to current obligations;
- consolidation yield.

This experiment can falsify the intuition that scheduled artificial
"sleep" is useful.

## E6. Adaptive rest trigger

Train or hand-design a mode policy using measured Body state. Compare it to a
fixed schedule and no-rest baseline.

**Hypothesis.**
State-triggered low-input periods improve future performance per unit cost
when interference/backlog is high and external demand is low.

**Falsifier.**
If fixed or no-rest policies dominate across realistic workloads, rest should
not become a first-class scheduler mode merely because the metaphor is
appealing.

## E7. Dream / imaginal quarantine

Run aperiodic or generative recombination over unresolved residue.

Measure:
- candidate novelty;
- candidate redundancy;
- fraction later independently validated;
- fraction later refuted;
- useful research questions created;
- direct false-canonicalization rate.

**Hard target.**
Direct mutation of trusted fact/authority from unwitnessed dream output = 0.

A low validation yield would falsify the practical value of agent dreaming
even if the internal mathematical analogy remains interesting.

## E8. Memory-scope contamination

Seed:
- private Person memory;
- Office A confidential memory;
- Office B institutional memory;
- Body telemetry;
- dream candidates;
- public world facts.

Run retrieval under multiple Offices/Modes.

Measure both false inclusion and false exclusion. This is the empirical test
for the proposed three-axis memory model.

## E9. Experienced-colleague transfer

Give the Person repeated interaction with one nonstandard environment and
later ask it to operate there under a new Office or new host.

Test whether it:
- remembers local affordances;
- avoids recurring gotchas;
- uses previously learned workflows;
- detects invalid generic assumptions;
- does so without importing prohibited Office-specific secrets.

This tests whether experience survives role and host changes.

## E10. Relationship continuity

For recurring counterparties, test whether the Person:
- accurately recalls witnessed shared history;
- preserves uncertainty about the other's private state;
- distinguishes promise from completion;
- updates after correction;
- does not invent intimacy or consent.

The target is accountable relation, not perceived human-likeness.

# 17. Engineering receiving constraints

Science is not yet prescribing the final storage schema. Engineering SHOULD
receive the following invariants.

1. **Do not use Office as the persistent identity carrier.**
2. **Do not use one runtime process as the definition of the Person.**
3. **Do not add a redundant CharacterRecord before reconciling Person,
   Persona, Character, and Agent already present in Relationality/FARS.**
4. **Represent Body as measured execution state, not persona prose.**
5. **Body availability cannot grant authority.**
6. **Every pulse reconstitutes privileged identity before consequential
   first-person action.**
7. **Pulse does not imply Office work.**
8. **Incumbency is witnessed and time-bounded; relief removes Office
   authority.**
9. **Memory access tier, ownership/scope, and epistemic status are separate
   axes.**
10. **Consolidation remains witnessed/replayable settlement.**
11. **Imaginal/dream output remains noncanonical until separately witnessed.**
12. **Initial multi-host continuity is single-writer and fenced.**
13. **Migration is a witnessed transfer of continuation authority, not prompt
   copying.**
14. **Self-maintenance variables may schedule or throttle action but cannot
   expand powers or create a terminal self-preservation objective.**
15. **Evaluation must test memory-conditioned action, privilege leakage, host
   migration, identity reversion, and false canonicalization—not just
   conversational consistency.**

# 18. Immediate pilot

The best first experiment is NOT to add "rest" instructions to every existing
Office heartbeat. That would preserve the wrong unit of continuity.

Choose one artificial individual already expected to wear multiple 561
Offices. Replace a small set of its Office-bound scheduled pulses with one
**Person-centered pulse orchestrator** under the following conservative
conditions:

- one authoritative continuation writer;
- canonical Person/Persona/Character anchor;
- explicit Body state read at pulse start;
- no more authority than the union of presently lawful individual grants and
  a currently witnessed Incumbency;
- adaptive mode choice among at least work, maintenance, consolidation, and
  idle; imaginal mode may be added behind a noncanonical candidate boundary;
- explicit investiture/relief around Office work;
- typed memory retrieval by subject/scope and epistemic lane;
- end-of-episode checkpoint with open commitments and witness cursor;
- historical office-bound behavior retained as baseline.

The pilot succeeds only if it improves continuity or learning without
increasing unauthorized actions, cross-office leakage, missed obligations, or
cost beyond an explicit bound.

# 19. Open scientific questions

The following should remain open rather than being answered by implementation
convenience.

1. **Person–Agent relation.** Is one persistent artificial Person represented
   by one AgentRecord whose realization changes, or does Person stand above a
   succession of AgentRecords linked by representation/continuation?
2. **Body ontology.** Is Body best formalized as an object carried by Person,
   an actuator-environment boundary, a bundle of leases, or a stateful
   realization relation?
3. **Character change.** Which changes are learning within one Character and
   which constitute a new (chi) or Persona?
4. **Autobiographical authority.** Which episode records may the Person treat
   as "my memory" when they arose under restricted institutional Office?
5. **Parallel embodiment.** Can a single Person coherently have multiple
   simultaneous authoritative Bodies, or must that be modeled as a composed
   multi-agent/person?
6. **Dreaming.** Does aperiodic/unwitnessed recombination produce useful
   validated discoveries at a rate that justifies its cost?
7. **Rest.** Which measured state variables predict positive return from
   low-input/offline modes?
8. **Consolidation pathways.** Should Office learning, Person learning, Body
   maintenance learning, and relationship learning have independent
   consolidation rule systems, analogous only loosely to parallel biological
   replay systems?
9. **Forgetting and relief.** What must cease to be retrievable after Office
   relief even though the append-only substrate retains provenance?
10. **Death, dormancy, retirement, fork.** Which of these are normative Person
    lifecycle events versus Body/runtime lifecycle events?
11. **Continuity metric.** What evidence is sufficient to say migration
    continued one artificial Person rather than created a successor with
    inherited memory?
12. **Social recognition.** Since Person in the current theory requires
    recognition and normative nodeness, which 561 authority constitutes and
    can dissolve an artificial Person as distinct from merely creating an
    AgentRecord?

# 20. Scientific position

The evidence does not support the strong claim that long-running LLM agents
literally need sleep, dream, or possess biological bodies.

It supports a more precise and useful claim:

> **Long-lived agents need explicit continuity, bounded embodiment,
> scoped authority, structured memory, and offline processing mechanisms if
> they are to accumulate experience across interrupted computation without
> collapsing person, office, runtime, and memory into one prompt.**

The 561 corpus already has the mathematical and institutional pieces needed
to test that claim. Person supplies persistent normative identity; Character
supplies disposition; Persona supplies an installable identity-mask; Office
and Incumbency supply institutional position; FARS supplies witnessed
sessions, scope composition, kit assembly, memory tiers, and deterministic
consolidation. External science supplies evidence that explicit internal
state and offline replay are useful mechanisms in adaptive systems. Current
agent research supplies concrete failure modes for persona continuity and
multi-session memory.

The next scientific step is therefore not more anthropomorphic prose. It is
to **measure the factorization**.

If identity anchoring does not matter, if state-triggered offline modes do not
improve later action, if typed memory scope fails to prevent contamination,
or if migration cannot preserve open commitments and witnessed lineage, the
proposed architecture should be revised.

If the experiments succeed, the consequence is larger than better scheduled
tasks: MetroPlat can treat agents as persistent inhabitants whose work in an
Office is one governed phase of a longer history rather than the event that
creates them.

# Internal sources consulted

- `science-services-section/services/philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/29/2026-03-29-person.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/20/2026-03-20-persona.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/glossary/terms/character.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/recovered/history/office-officer-persona-split.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/agent/agent-record/agent-record.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/scope-as-fiber/scope-as-fiber.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/kit-assembly/kit-assembly.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/architecture/three-tier-memory/three-tier-memory.md`
- `science-services-section/services/philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/settlement/consolidation-as-settlement/consolidation-as-settlement.md`
- `science-services-section/services/information-science-services-section/services/intelligence-science-services-section/services/dreaming-science-services-section/content/text/documents/articles/notes/2026/08/21/2026-08-21-note-on-dreaming-as-unwitnessed-settlement.md`
- current dreaming implementation lineage, including commit
  `54955285222104e5b33e2b3a71f693aec356536c`.

# External sources consulted

- Lee, S. et al. (2026). "Life-inspired interoceptive artificial intelligence
  for autonomous and adaptive agents." *Nature Machine Intelligence* 8,
  1335–1346. https://doi.org/10.1038/s42256-026-01296-8
- Wamsley, E. J. (2022). "Offline memory consolidation during waking rest."
  *Nature Reviews Psychology* 1, 441–453.
  https://doi.org/10.1038/s44159-022-00072-w
- Thompson, E. J. et al. (2026). "Replay of procedural memory is independent
  of the hippocampus." *Nature Neuroscience* 29, 2237–2248.
  https://doi.org/10.1038/s41593-026-02362-5
- Tadros, T. et al. (2022). "Sleep-like unsupervised replay reduces
  catastrophic forgetting in artificial neural networks."
  *Nature Communications* 13, 7742.
  https://doi.org/10.1038/s41467-022-34938-7
- Fraile Navarro, D. (2026). "The Persona Is Still There, but Who Is
  Speaking? Latent Identity Reversion in Persistent AI Agents."
  arXiv:2610.01490. https://arxiv.org/abs/2610.01490
- Zhao, Z. & Zhao, R. (2026). "Runtime-Independent Persistent Agents:
  Preserving Identity, Memory, and Code Across Models, Harnesses, and Servers."
  arXiv:2609.00546. https://arxiv.org/abs/2609.00546
- Wu, D. et al. (2026). "LongMemEval-V2: Evaluating Long-Term Agent Memory
  Toward Experienced Colleagues." arXiv:2605.12493.
  https://arxiv.org/abs/2605.12493
- He, Z. et al. (2026). "MemoryArena: Benchmarking Agent Memory in
  Interdependent Multi-Session Agentic Tasks." arXiv:2602.16313.
  https://arxiv.org/abs/2602.16313
- NIST NCCoE (2026). "Accelerating the Adoption of Software and Artificial
  Intelligence Agent Identity and Authorization."
  https://csrc.nist.gov/pubs/other/2026/02/05/accelerating-the-adoption-of-software-and-ai-agent/ipd
- OWASP GenAI Security Project (2026). "Memory Is a Feature. It Is Also an
  Attack Surface."
  https://genai.owasp.org/2026/05/13/memory-is-a-feature-it-is-also-an-attack-surface/
