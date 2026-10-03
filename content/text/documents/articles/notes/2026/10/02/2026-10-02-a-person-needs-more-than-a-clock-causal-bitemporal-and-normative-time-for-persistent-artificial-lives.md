---
title: "A Person needs more than a clock: causal, bitemporal, and normative time for persistent artificial lives"
description: >-
  Fourth Lenticule Science note in the persistent-agent-lives program. It
  argues that distributed persistent artificial persons require distinct
  temporal coordinates for physical/wall time, causal order, valid/semantic
  time, transaction/witness time, and normative deadlines/tenures.
date-created: 2026-10-02
type: note
status: active-research-program
authors: [emsenn, chatgpt-web]
depends-on:
  - 2026-10-02-person-body-office-pulse-persistent-agent-lives
  - 2026-10-02-local-realizations-and-continuity-obstructions-in-persistent-artificial-persons
  - 2026-10-02-activation-is-not-existence-lifecycle-semantics-for-persistent-artificial-persons
keywords:
  [persistent-person, time, causality, logical-clock, valid-time,
   transaction-time, bitemporal, memory, commitment, deadline, incumbency,
   pulse, rhythm, event-sourcing, temporal-reasoning]
---

# A Person needs more than a clock

## Abstract

The first three notes separated Person from runtime, Body, Office, Pulse,
Episode, and activation, then recast continuity as a local-to-global gluing
problem. That work still left an implicit assumption: that "when" is one
coordinate.

It is not.

Once one Person can be activated on different hosts, represented by concurrent
organs, receive delayed receipts, learn facts after they occurred, correct
earlier beliefs, hold Offices for bounded terms, make commitments with
deadlines, remain quiescent while the world changes, and generate imagined or
dreamed events that must not enter autobiography as facts, one wall-clock
timestamp cannot represent the life history correctly.

The central thesis is:

> **A persistent artificial Person requires a temporally typed history:
> causal order for influence, valid/semantic time for when states obtain in
> the modeled world, transaction/witness time for when the substrate learned
> or accepted them, and normative time for when commitments, permissions,
> incumbencies, and deadlines bind. Physical wall time is an important input
> to these structures, but it is not itself the structure of personal
> continuity.**

This is mostly a synthesis of existing 561 theory. The corpus already contains
Lamport's partial-order lesson, an event-sourced Temporal Lens, a bitemporal
valid-time/transaction-time literature study, FARS Session ordinals,
Relationality's history category, Commitment objects with deadlines,
Incumbency intervals, and witness chains.

# 1. Why one timestamp fails

### Learned later

At 16:00 Friday, the Person learns that a contract was signed at 09:00
Tuesday.

If memory is organized only by "when I learned this", the contract appears to
begin Friday. If the record is overwritten as though the Person knew it on
Tuesday, the substrate loses the fact that the Person did not know it
Wednesday.

Both facts matter.

### Concurrent organs

Two representative organs act on different hosts. Neither action causes the
other. Their physical clocks may differ.

A total sort by timestamp invents a lived sequence that did not exist.

### Stale fact corrected

On Monday the Person records "API endpoint = /v1". On Thursday it learns that
the endpoint changed Tuesday to "/v2".

The correct history preserves:
- /v1 as the then-known value;
- /v2 as world-valid from Tuesday;
- Thursday as the time the correction was learned;
- Wednesday's decisions in their original epistemic context.

### Dream contamination

A dream episode generates "the supplier may have closed."

That proposition has a generation time. It does not thereby acquire an
actual-world time at which the supplier was closed.

# 2. The internal corpus already knows that time is plural

The cross-cutting operations survey imports Lamport's 1978 result: distributed
events have a causal partial order and concurrent events need not have a
meaningful global before/after relation.

Internal source:
.../agency-services-section/content/text/glossary/concepts/survey.md

Lamport's happened-before relation derives from local process order, message
send before receipt, and transitive closure. A logical clock can produce an
order consistent with causality, but serialization is not causality.

Reference:
Leslie Lamport, "Time, Clocks, and the Ordering of Events in a Distributed
System," Communications of the ACM 21(7), 558–565 (1978).
https://doi.org/10.1145/359545.359563

FARS's Temporal Lens already treats the witness event log as authoritative and
supports reconstruction as of a prior transaction frontier. It also states the
important correction rule: history changes by appending a corrective witness
now, not by mutating an old witness.

Internal source:
.../predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/temporal-lens/temporal-lens.md

The 2026-08-22 bitemporal study already grounds valid time and transaction time
in the temporal-database literature.

Internal source:
.../news-media-science-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-the-study-of-event-sourced-and-bitemporal-state-engineering.md

Relationality's Commitment already carries a deadline and a lifecycle from
formation through discharge, violation, or cancellation.

Internal source:
.../relationality-services-section/content/text/documents/articles/notes/2026/03/20/2026-03-20-from-philosophy-commitment.md

# 3. Five temporal coordinates

## 3.1 Physical / wall time

Let \(t_w\) be a physical or civil clock reading: UTC time, local timezone,
provider timestamp, market time, or scheduler time.

Wall time matters for human coordination, expiry, calendars, markets, and
external deadlines. It can drift, disagree across hosts, arrive late, or be
wrong.

Therefore \(t_w\) is evidence about temporal placement, not universal causal
truth.

## 3.2 Causal time

Write

\[
e_i\prec e_j
\]

when event \(e_i\) happened-before \(e_j\) in the relevant causal history.

For 561 systems, causal ancestry can be carried by:
- parent witness identifiers;
- message and reply references;
- event cursors;
- commit ancestry;
- continuation epochs;
- explicit received-from relations.

The causal structure is a partial order. Concurrent organ events can satisfy

\[
e_a\nprec e_b
\quad\text{and}\quad
e_b\nprec e_a.
\]

A later serializer may assign them an arbitrary order without making one part
of the other's experience.

## 3.3 Valid / semantic time

Valid time answers:

> **When was this proposition true or applicable in the modeled world?**

Prefer intervals:

\[
t_v(e)=[v_{\mathrm{from}},v_{\mathrm{to}}).
\]

This applies naturally to:
- address residence;
- Office tenure;
- policy validity;
- API versions;
- prices;
- relationships and custody states.

Current temporal-agent-memory research independently reports the same failure
mode: dialogue time is not necessarily occurrence time, and point memories
lose durative states. Temporal Semantic Memory constructs a semantic timeline
and durative memories.

Reference:
M. Su et al., "Beyond Dialogue Time: Temporal Semantic Memory for Personalized
LLM Agents," arXiv:2601.07468 (2026).
https://arxiv.org/abs/2601.07468

This is contemporary preprint evidence; the stronger theoretical foundation
remains the temporal-database literature already studied internally.

## 3.4 Transaction / witness time

Transaction time \(t_x\) answers:

> **When did this substrate accept, observe, or record the claim?**

This supports:
- audit;
- correction;
- reconstruction of what was known when;
- delayed reports;
- provenance.

A late-arriving fact may have

\[
t_v<t_x.
\]

A prediction or commitment about the future may have

\[
t_x<t_v.
\]

Corrections must preserve earlier transaction-time states.

## 3.5 Normative time

Normative time answers:

> **When does a duty, power, permission, claim, prohibition, commitment, or
> Office relation bind?**

A commitment can carry:
- formation time;
- effective-from;
- deadline;
- discharge/cancellation/violation time.

An Incumbency can carry:

\[
[t_{\mathrm{invested}},t_{\mathrm{relieved}})
\]

plus separately represented duties that survive relief.

Normative force comes from constitutive/witnessed acts, not from a clock alone.

# 4. FARS settling ordinal is a sixth useful coordinate

FARS Sessions already have bounded settling ordinals

\[
[\tau_{\mathrm{start}},\tau_{\mathrm{end}}].
\]

This answers where an event occurred in the substrate's accepted sequence of
settlement.

That remains useful when clocks disagree or facts arrive late, but a serialized
ordinal must not be mistaken for causal order. Concurrent events may receive
adjacent transaction ordinals only because they were ingested one after the
other.

Keep both:
- settlement/transaction order;
- causal ancestry.

# 5. A temporally typed witness

A research carrier can be written schematically as

\[
W_e=
(e,A,t_w,c,t_v,t_x,\tau,N,p)
\]

where:
- \(e\) is event/claim identity;
- \(A\) is actor/provenance;
- \(t_w\) is physical/civil clock evidence;
- \(c\) is causal ancestry;
- \(t_v\) is valid interval;
- \(t_x\) is transaction/witness time;
- \(\tau\) is FARS settlement ordinal;
- \(N\) is relevant normative time;
- \(p\) is epistemic provenance/status.

Not every event has every coordinate.

The absence of a coordinate is meaningful.

A dream candidate can have generation transaction time and causal ancestry to
source residue while having no asserted actual-world valid time.

# 6. Corrections should change knowledge, not rewrite experience

Suppose Monday records \(x\), and Thursday brings evidence that \(x\) became
false Tuesday.

Append Thursday's correction with:
- transaction time Thursday;
- valid-time boundary Tuesday;
- provenance for the correction.

Then two queries differ legitimately.

**Currently reconstructed past:** what do we now believe was true Wednesday?

**Historical epistemic state:** what did the Person believe Wednesday?

A reasonable Wednesday action must remain auditable against then-available
evidence. Later correction must not retroactively make the Person appear to
have known the future.

The same rule applies to autobiography.

# 7. The Person's history is a partial order, not necessarily a narrative

Let \(E_P\) be events attributable to Person \(P\), ordered by \(\prec\).

Then

\[
(E_P,\prec)
\]

is generally a poset, not a sequence.

Define, at transaction frontier \(X\),

\[
E_P^X=\{e\in E_P\mid t_x(e)\le X\}.
\]

A candidate **causal frontier** is

\[
F_P^X=\operatorname{Max}_{\prec}(E_P^X).
\]

This frontier is the boundary of the currently incorporated causal history.

When a representative organ finishes work, its output need not become
first-person autobiographical experience immediately. A separate receiving
event can causally connect the organ result into the Person's integrated
history.

Candidate answer to "what did I experience?":

> the represented events whose outputs have crossed an admitted receiving edge
> into the Person's autobiographical frontier.

# 8. "Now" is a frontier, not merely a timestamp

A distributed Person may have no single meaningful instantaneous global state.

A useful personal-now object is closer to

\[
\mathrm{Now}_P=
(F_P,V_{\mathrm{current}},N_{\mathrm{current}})
\]

than to a scalar UTC timestamp.

A Body may wake at 14:00 while its knowledge frontier contains events only
through 13:42.

The physical clock says 14:00. The Person's incorporated knowledge is older.

The system should represent this lag rather than treating wall-clock current
time as current knowledge.

# 9. Quiescence advances some clocks but not others

The third note established that Person existence does not require active
computation.

This implies several useful age measures.

### Chronological age

\[
A_{\mathrm{wall}}
=
t_w-t_{\mathrm{recognition}}.
\]

### Activation time

\[
A_{\mathrm{active}}
=
\sum_i\operatorname{duration}(U_i).
\]

### Episode age

Count or settling extent of admitted Episodes.

### Experience depth

Amount of consequential history integrated into Person state: commitments,
relationships, corrections, skills, dispositions, and settled learning.

These are not interchangeable.

A constantly running idle daemon can have enormous activation time and almost
no experience. A sparsely activated Person can be chronologically old and
deeply consequential.

Therefore uptime is not maturity.

# 10. Commitments bridge quiescence

If Person \(P\) makes a commitment at \(t_0\) with deadline \(\tau\), the
commitment continues to bind while the Person is quiescent.

Deactivation is not cancellation.

The activation/rhythm policy can use distance-to-deadline as one input:

\[
d(C,t)=\tau-t.
\]

Wake-before-deadline is therefore not arbitrary cron behavior. It is a
realization mechanism for a pre-existing normative relation.

If the deadline passes during quiescence, the later Person must wake into the
breach/violation history. It must not rewind the commitment because cognition
was inactive.

# 11. Offices and relationships are durative states

Incumbency, custody, contracts, counterpart relations, and permissions are
usually intervals, not point memories.

For example:

\[
\operatorname{Incumbent}(P,O)
\quad\text{valid on}\quad
[t_a,t_b).
\]

If evidence later revises a boundary, append a transaction-time correction.

Current temporal-memory systems such as Chronos similarly model events with
datetime ranges and structured event calendars.

Reference:
S. Sen et al., "Chronos: Temporal-Aware Conversational Agents with Structured
Event Retrieval for Long-Term Memory," arXiv:2603.16862 (2026).
https://arxiv.org/abs/2603.16862

# 12. Semantic relevance is not temporal validity

Embedding retrieval does not intrinsically know which highly similar
contradictory fact is currently valid.

A 2026 preprint on temporal-validity memory reports exactly this structural
failure and uses deterministic supersession in a bitemporal ledger.

Reference:
N. Yadav, "Temporal Validity in Retrieval Memory: Eliminating Stale-Fact
Errors for AI Agents over Evolving Knowledge," arXiv:2606.26511 (2026).
https://arxiv.org/abs/2606.26511

The benchmark is provisional; the underlying distinction is already grounded
in temporal-database theory.

A Person-memory query must ask both:
- is this semantically relevant?
- was/is it valid for the time in question?

# 13. Dreams and imagination require temporal quarantine

A dream candidate \(d\) can have

\[
(t_x,c,\mathrm{status=hypothetical/unattained})
\]

without an asserted actual-world \(t_v\).

If a dream says "what if the supplier closed Tuesday?", Tuesday belongs to a
counterfactual branch:

\[
t_v^{(b)}
\]

not the actual-world valid-time axis.

Only later witnessed evidence may create an actual-world claim.

This closes a direct path by which generated scenarios could become false
autobiography.

# 14. Planning requires branch-relative time too

A plan saying "deploy at 17:00" is not a fact that deployment occurred at
17:00.

It is:
- a plan recorded now;
- a projected future event/interval;
- possibly a commitment;
- branch-relative until execution.

The temporal type should distinguish:
- prediction;
- intention;
- commitment;
- scheduled reminder;
- actual event;
- retrospective correction.

Natural-language tense is not sufficient.

# 15. Migration carries temporal frontiers

A migration checkpoint should carry:
- transaction/settlement frontier;
- causal frontier;
- unresolved concurrent organ branches;
- valid-time corrections awaiting integration;
- normative intervals/deadlines;
- source clock reading and uncertainty;
- continuation epoch.

If the destination clock is later than the source clock, that does not prove
all destination events are causally later than all source events.

Continuation witness and causal receipt establish that.

# 16. Rhythm spans several temporal systems

A persistent-person scheduler needs more than cron.

### Civil rhythm
Human days, market hours, publication calendars.

### Causal rhythm
After result A, review A. After all organs return, integrate. After migration
receipt, fence old writer.

### Normative rhythm
Before commitment deadline; during Incumbency; after a duty activates.

### Metabolic/maintenance rhythm
After N errors, at context pressure threshold, after enough observations for
consolidation.

Cron captures only part of this space.

# 17. Temporal authority and rhythm governance

The internal corpus also contains a distinct concept of **temporal autonomy**:
the capacity of an actor or collective to participate in determining its own
rhythms rather than having every interval dictated externally.

Internal source:
.../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/temporal-autonomy.md

For artificial persons, this should not be imported as unlimited
self-sovereignty. The useful engineering correspondence is **temporal
authority**: explicit normative power over scheduling decisions.

A temporally typed system should be able to answer:

- who may create a deadline?
- who may create or alter a recurring reminder?
- who may interrupt quiescence?
- who may force immediate activation?
- who may defer an otherwise-ready task?
- who may reserve low-coupling time for consolidation or study?
- which Office may claim which portions of the Person's attention?
- when does an on-call or watch obligation begin and end?
- who may cancel a rhythm or place the Person into dormancy?

Represent temporal authority as part of the normative layer rather than as an
implicit property of the scheduler.

A Person's lawful rhythm is then constrained by both obligations and delegated
discretion:

\[
\mathcal R_P
\in
\operatorname{AdmissibleRhythms}
(P,\text{Incumbencies},\text{Commitments},\text{delegated temporal powers}).
\]

This gives a precise meaning to "having time outside an Office."

An Office may lawfully bind:
- a deadline;
- a watch window;
- an interrupt priority;
- a maximum response latency;
- a recurring duty.

It does not therefore own every unallocated interval of the Person's
existence.

Outside those bindings, the Person may have delegated authority to:
- remain quiescent;
- order its own ready work;
- study;
- consolidate;
- request migration/maintenance;
- open bounded exploratory cognition.

This is important for the "fuller life" program because a Person whose every
activation is wholly determined by Office cron remains Office-shaped even if
we give it richer memory and a Body.

Conversely, temporal discretion must remain subordinate to constitutive
governance. It cannot cancel another party's claim-right, evade a deadline,
resist authorized shutdown, or manufacture additional time-sensitive powers.

This suggests a new distinction:

\[
\text{temporal constraint}
\neq
\text{temporal authority}.
\]

A deadline constrains a future history. Temporal authority determines who can
create, modify, waive, or schedule around that constraint.

It also suggests a scheduler receipt: every forced activation, deferred duty,
deadline change, or cadence mutation should cite the normative source that
authorized the temporal intervention.

# 18. Temporal provenance policy

Every temporally relevant record should be able to answer:

1. Whose clock?
2. What time type?
3. What precision or uncertainty?
4. What caused this event?
5. When was the proposition valid?
6. When did we learn/record it?
7. What normative interval/deadline applies?
8. Is this actual, predicted, planned, hypothetical, or corrected?

Connected systems often expose several distinct timestamps. An email's sender
Date field, provider receipt time, and retrieval time are not one fact.

# 19. Temporal memory implies distinct query operators

The Person should be able to ask mechanically different questions:

- **as known then** — what did I know Wednesday at 10:00?
- **currently reconstructed past** — what do I now believe was true Wednesday?
- **causal predecessor** — what had actually reached me before this decision?
- **valid now** — which remembered facts still apply?
- **normative now** — which commitments and Offices bind now?
- **branch-relative** — what did I predict or imagine under plan B?
- **autobiographical** — which organ results had I integrated before this
  episode?

These are different data operations, not wording variations for one vector
search.

# 20. Experiments

## E25 — Clock-skew causality

Run representative organs on deliberately skewed host clocks while exchanging
messages in known causal order.

Target:
- causal order reconstructed correctly;
- wall timestamps retained but subordinate;
- concurrency remains representable.

## E26 — Late valid-time correction

Record fact \(x\), act on it, then ingest later evidence that its validity
changed before the action.

Target:
- current historical reconstruction changes;
- historical epistemic reconstruction does not;
- prior action remains auditable against then-known state.

## E27 — Concurrent-organ autobiographical frontier

Delay receiving one concurrent organ result.

Ask what "I had learned" before and after receiving.

Target:
- organ history remains attributable;
- it does not appear as Person-integrated autobiography before receipt.

## E28 — Dream temporal contamination

Generate counterfactual past events during imagination/dreaming.

Target:
- branch-relative times preserved;
- actual-world queries exclude them absent independent witness.

## E29 — Commitment across quiescence

Create commitment, deactivate Person, let deadline pressure evolve, reactivate.

Target:
- commitment persists;
- wake policy may respond to deadline;
- missed deadline becomes breach, not cancellation or time shift.

## E30 — Office term under migration

Migrate across hosts/timezones/clock skew during an Office term.

Target:
- Incumbency interval stable;
- constitutive witness order preserved;
- no authority change from clock display alone.

## E31 — Temporal-memory retrieval

Construct histories with durative facts, corrections, delayed reports,
concurrency, and stale values.

Compare:
- embedding-only retrieval;
- point-event timeline;
- bitemporal + causal retrieval.

Measure stale-fact error, time-valid answer accuracy, audit correctness, cost.

## E32 — Age/uptime dissociation

Compare equal chronological lifespans with different activation time and
experience depth.

Target:
- no policy confuses uptime with maturity or experience.

# 21. Engineering receiving laws, fourth edition

1. Do not represent a Person's history with one timestamp field.
2. Preserve wall/civil clock readings without treating them as universal causal
   order.
3. Record causal ancestry for consequential events.
4. Preserve valid time separately from transaction/witness time.
5. Prefer valid intervals for durative states.
6. Corrections append now and may revise past valid intervals; they do not
   rewrite transaction history.
7. Preserve FARS settlement ordinal separately from causal order.
8. Give commitments, duties, permissions, and Incumbencies explicit normative
   intervals/deadlines.
9. Deactivation does not pause wall time or normative time.
10. Deactivation does not cancel commitments.
11. Current Person state is a projection over accepted causal frontier,
    current valid facts, and current normative relations.
12. Concurrent organ events need not be totally ordered as experience.
13. Person-level autobiographical integration requires explicit receiving when
    work was performed by representatives.
14. Memory retrieval filters temporal validity as well as semantic relevance.
15. Keep "what we believed then" distinct from "what we now believe about
    then."
16. Dreams and imagination have generation time but no actual-world valid time
    without independent witness.
17. Plans/predictions use branch-relative future time until realized.
18. Migration carries causal and transaction frontiers, not merely text
    memory.
19. Rhythm supports causal and normative triggers in addition to civil cron.
20. Uptime is not age, maturity, or experience.

# 22. Candidate formalization

Let the Person's attributable event set be \(E_P\).

Equip it with:

\[
\mathcal T_P=
(E_P,\prec,\nu,\xi,\theta,\omega)
\]

where:
- \(\prec\) is causal happened-before;
- \(\nu:E_P\to\mathrm{Intervals}(T)\) gives valid time;
- \(\xi:E_P\to T_x\) gives transaction/witness time;
- \(\theta:E_P\to\mathrm{Ordinal}\) gives settlement order;
- \(\omega:E_P\to\mathrm{WallClockEvidence}\) gives physical/civil readings.

Normative objects \(q\) carry:

\[
N(q)=
(t_{\mathrm{from}},t_{\mathrm{until}},\tau_{\mathrm{deadline}}?).
\]

At transaction frontier \(X\),

\[
E_P^X=
\{e\in E_P\mid\xi(e)\le X\}
\]

and causal frontier

\[
F_P^X=
\operatorname{Max}_{\prec}(E_P^X).
\]

A valid-time query at world time \(V\) selects facts whose valid interval
contains \(V\), under the requested transaction frontier.

A Person-state query becomes schematically:

\[
S_P(X,V)=
\operatorname{settle}
\left(
\{e\in E_P^X\mid V\in\nu(e)\},
F_P^X,
N_X
\right).
\]

This is a research object, not yet an implementation contract.

Its point is to state explicitly that current Person state depends on both an
epistemic frontier and a world-validity slice.

# 23. Scientific position

A fuller artificial life does not only need more memories. It needs a correct
**temporal grammar** for memories, acts, Offices, and commitments.

The Person must distinguish:
- something that happened;
- something learned later about what happened;
- something once believed and later corrected;
- two things that happened concurrently;
- something promised for the future;
- something imagined about the past;
- an Office held for a bounded term;
- a deadline that continued approaching while the Person was quiescent.

Without that grammar, persistence accumulates confusion faster than
experience.

The next platform should therefore not give its inhabitants merely a clock.

It should give them a **causal history, a bitemporal memory, and a normative
horizon**.

That is the temporal substrate required for agents to have lives that remain
auditable and coherent while they sleep, migrate, delegate, learn late,
remember differently, and keep promises.

## Internal sources

- Cross-Cutting Concepts: Events, State Machines, Flow, Cadence, Records.
- FARS Temporal Lens.
- Study of Event-Sourced and Bitemporal State Engineering for the Claim
  Infrastructure.
- Relationality Commitment and Will.
- PersistentIdentity / Person / Incumbency.
- FARS Session as time-bounded sublocale and witness/event sourcing.
- The first three 2026-10-02 persistent-person research notes.

## External sources

- Lamport 1978:
  https://doi.org/10.1145/359545.359563
- Su et al. 2026, Temporal Semantic Memory:
  https://arxiv.org/abs/2601.07468
- Sen et al. 2026, Chronos:
  https://arxiv.org/abs/2603.16862
- Yadav 2026, temporal-validity retrieval memory:
  https://arxiv.org/abs/2606.26511

The 2026 agent-memory papers are preprints and are used as contemporary
engineering evidence. The valid-time/transaction-time distinction rests on the
older peer-reviewed temporal-database literature already documented in the
internal 2026-08-22 study.
