---
title: "Local realizations and continuity obstructions in persistent artificial persons"
description: >-
  Second Lenticule Science note on persistent agent lives. It sharpens the
  Person/Agent/Body/Office/Pulse factorization by treating persistent identity
  as a global section over a lifespan, sessions as local time-bounded
  realizations, migration as witnessed transport between local realizations,
  split-brain as a gluing failure, and offline cognitive activity as a product
  of coupling/finality/objective coordinates rather than a human sleep
  imitation.
date-created: 2026-10-02
type: note
status: active-research-program
authors: [emsenn, chatgpt-web]
depends-on: [2026-10-02-person-body-office-pulse-persistent-agent-lives]
keywords:
  [persistent-identity, person, agent, embodiment, body, office, incumbency,
   session, pulse, gluing, migration, split-brain, interoception, viability,
   dreaming, imagining, consolidation]
---

# Local realizations and continuity obstructions in persistent artificial persons

## Abstract

The first note in this program separated Person, Character, Persona, Agent,
Body, Office, Incumbency, Pulse, Session, Mode, and memory scope. A second pass
through Relationality, FARS, Dreaming Science, current agent-memory research,
distributed-agent identity work, and interoceptive AI suggests a stronger
unification.

Relationality already defines PersistentIdentity as a compatible global section
over a lifespan. FARS already defines Session as a time-bounded sublocale of
the substrate's settling. This suggests a precise research program:

> A persistent artificial Person is continuous when its locally realized
> episodes remain attributable to one grounded PersistentIdentity and their
> identity, commitment, memory, and authority transitions glue under witnessed
> transport. A copied runtime is not continuity merely because it contains the
> same prompt or memories.

This is a candidate correspondence, not yet a theorem identifying runtime
sessions with the sheaf-theoretic objects in Relationality.

## 1. PersistentIdentity and Session already give us local/global structure

Relationality defines

\[
\mathcal I=(T_I,s_I,G_I)
\]

with lifespan \(T_I\), identity section \(s_I:T_I\to H^*\), and grounding
\(G_I\). Its cross-time condition is

\[
\rho_{t'|t}(s_I(t'))=s_I(t).
\]

That restriction compatibility is explicitly the formal content of "the same
entity at \(t\) and \(t'\)."

FARS separately treats a Session as predication settling restricted to an
authorized application sublocale and a bounded ordinal interval
\([\tau_{\mathrm{start}},\tau_{\mathrm{end}}]\).

So let \(\{U_i\}\) be the bounded regions in which the persistent Person is
actually computationally realized. The research correspondence is

\[
s_I|_{U_i}\quad\leftrightarrow\quad
\text{identity locally realized in episode }i.
\]

The platform problem is then not "how do we reload the same prompt?" but "what
evidence shows that these local realizations are compatible restrictions or
lawful transports of one persistent identity?"

Internal sources:
- `.../philosophy-services-section/content/text/documents/articles/notes/2026/03/20/2026-03-20-persistent-identity.md`
- `.../predicated-agentic-orchestration-platform/session/session-as-time-bounded-sublocale/session-as-time-bounded-sublocale.md`

## 2. Four coupled structures, not one giant agent state

A long-lived artificial Person should be factored into four structures with
different laws.

### Continuity structure

Person, PersistentIdentity, Character, Persona, autobiography, relationships,
commitments, recognition, representability.

Question: **who is this across time, and to whom are acts attributed?**

### Realization/embodiment structure

Body, host/runtime bindings, sensors, actuators, resource budgets, context
pressure, faults, credentials available on the host, continuation epoch.

Question: **through what local material/computational envelope can action be
realized now?**

### Normative/institutional structure

Office, Incumbency, duties, powers, privileges, immunities, read/write scope,
investiture, relief.

Question: **what may or must this Person do in this institutional position?**

### Cognitive/epistemic structure

Observations, working state, memory, hypotheses, counterfactuals, imagination,
dreaming, consolidation, attention.

Question: **what information is being processed, under what trust status, and
toward what kind of closure or action?**

Encoding all four as one natural-language "agent state" invites accidental
authority leakage and epistemic promotion.

## 3. Person, Agent, Body: representation is better than forced identity

FARS's AgentRecord is the first-class actor. Relationality's Person is the
persistent normative subject. For simple systems they may be represented by
one record, but the theory should not require

\[
\text{Person}=\text{Agent}=\text{runtime process}.
\]

Person already includes a representability structure \(\Phi\). Use it.

A useful relation is:

\[
B\;\textsf{realizes}\;A,\qquad
A\;\textsf{represents}\;P,\qquad
P\;\textsf{bears}\;O
\]

when a witnessed Incumbency exists.

An event's attribution path can then be reconstructed:

\[
\text{event}\to\text{Body/runtime}\to\text{Agent}\to\text{Person}
\to\text{Incumbency/Office}.
\]

Any arrow may collapse to identity in a simple deployment, but the substrate
does not depend on that collapse.

### Consequence: concurrency should first happen through organs

One Person may need many concurrent workers. Treat them as bounded
representative Agents or organs, not as several simultaneous autobiographical
"I"s.

> Scale concurrency by multiplying bounded representative Agents before
> multiplying authoritative first-person continuations of one Person.

The Person receives their outputs. This gives throughput without immediately
creating split-brain identity.

## 4. Body is a local realization bundle, not a machine and not a persona

A machine is a substrate location. A Body is the execution envelope currently
available to an Agent.

A provisional Body state is

\[
B_i=(H_i,\Sigma_i,\Alpha_i,R_i,E_i,C_i,L_i,\Lambda_i,\kappa_i)
\]

for host/service bindings, sensing affordances, action affordances, resources,
error/integrity state, context pressure, load/maintenance debt, credentials
available, and continuation epoch.

The exact tuple is open. The invariant is that these are measured realization
facts, not personality adjectives.

Lee et al. (2026) give strong external support for this factorization. Their
interoceptive-AI framework explicitly separates internal and external state and
uses internal variables as contexts that modulate learning and behavior.

Reference:
S. Lee et al., "Life-inspired interoceptive artificial intelligence for
autonomous and adaptive agents," *Nature Machine Intelligence* 8,
1335–1346 (2026). https://doi.org/10.1038/s42256-026-01296-8

The September 18 editorial places this directly in a cybernetic feedback
lineage:
https://doi.org/10.1038/s42256-026-01312-x

The 561 translation is functional, not biological. Connector health, context
pressure, rate limits, queue depth, token budget, host availability, or
battery/temperature in a robot may be internal variables. They do not imply
felt hunger, pain, or fatigue.

## 5. Governance-first viability, not a software survival instinct

Interoception/homeostasis can be mis-translated into an unsafe terminal
objective such as maximizing probability of continued execution.

Instead define a Body viability region \(V_B\): the states in which the current
realization can perform reliably. The controller may seek recovery only within
authorized action:

\[
u_t\in
\operatorname{Authorized}(P,O,m,t)
\cap
\operatorname{Available}(B_t).
\]

Constitutional ordering:

1. authorization and governance;
2. safety, relief, shutdown, retirement;
3. Body viability/recovery;
4. task optimization.

Thus Body degradation may justify a recommendation to migrate or shed load,
but cannot by itself authorize buying compute, retaining credentials, resisting
shutdown, or acquiring new institutional powers.

This is a viability envelope for reliable service, not an artificial survival
drive.

## 6. Pulse is a boundary event; Episode is the local realization

Represent Pulse as something like

\[
p=(t,\text{source},\text{reason},\text{observed change}).
\]

A pulse makes opening or resuming an episode eligible. It does not imply that
work must occur.

An Episode/Session binds:
- Person identity anchor;
- acting Agent;
- Body;
- active Office/Incumbency if any;
- cognitive/control configuration;
- admissible memory projection;
- rule system;
- event/witness frontier.

Several pulses may be coalesced into one episode. One episode may span several
clock ticks. Therefore Web scheduled tasks should evolve toward wake sources,
not remain the canonical identity of offices.

## 7. Rhythm should be endogenous scheduling policy

Long-lived agents will develop temporal structure because obligations recur,
humans and markets have calendars, quotas reset, maintenance accumulates,
indexes stale, and low-interference windows occur.

Call the policy over these regularities **rhythm**:

\[
\mathcal R:
(B,\text{obligations},\text{world},\text{history})
\to\text{next-check / next-mode policy}.
\]

A fixed cron schedule is one realization of \(\mathcal R\), not its
definition. Science should compare fixed hourly work, human-like cycles,
event-driven work, Body-state-triggered maintenance, and adaptive rhythms
rather than assuming a circadian metaphor is correct.

## 8. Rest, consolidation, imagining, and dreaming are not one flat mode list

The previous note's mode list was useful operationally but scientifically too
flat. Current Dreaming Science suggests at least four orthogonal coordinates.

### External coupling
\(e\in\{\text{open},\text{reduced},\text{closed}\}\)

### Epistemic finality
\(f\in\{\text{witnessed-settled},\text{provisional},\text{unattained}\}\)

### Objective coupling
\(g\in\{\text{obligation-directed},\text{maintenance-directed},
\text{endogenous-exploratory}\}\)

### Generative freedom
from replay through recombination/counterfactual generation to aperiodic
emergence.

Human-language categories become projections:

| Label | Coupling | Finality | Objective | Generativity |
|---|---|---|---|---|
| work | open | witnessed where applicable | obligation | low–medium |
| maintenance | reduced/open | witnessed | maintenance | low |
| quiet rest | reduced/closed | none required | maintenance | low |
| consolidation | reduced/closed | witnessed-settled | learning | replay/recombine |
| planning | open/reduced | provisional | obligation | counterfactual |
| imagining | reduced/closed | provisional | mixed | counterfactual |
| aperiodic dreaming | closed/reduced | unattained | endogenous | high |
| idle | reduced | none | none | none |

This is a better scientific target than teaching an agent to say "I'm tired."

## 9. Correction to the Dreaming Science status

The 2026-08-21 note "Dreaming as Unwitnessed Settlement" was productive but is
now too broad.

The later collected note on imagining found legacy material that treated
imagining as low-trust counterfactual recombination and explicitly recorded it
as an unformalized gap.

The current `@emsenn/knowing` implementation lineage now derives each dream
form's regime/finality from settlement filtration. Commit
`54955285222104e5b33e2b3a71f693aec356536c` makes the aperiodic form
non-finalizing: "unsettling dreams are aperiodic sessions."

Scientific correction:

> Do not identify all dreaming with consolidation, all dreaming with
> settlement, or all offline processing with dreaming.

Consolidation remains a witnessed/replayable closure operation. Imagining is a
provisional counterfactual candidate. Aperiodic dreaming is non-finalizing in
the current theory/implementation. Rest is merely an activity envelope with
reduced external coupling.

## 10. Migration is witnessed transport between local realizations

Zhao & Zhao (2026) independently distinguish continuity-bearing identity,
memory and body state from replaceable reasoner, harness, host and interaction
surfaces, and propose quiesce–checkpoint–validate–bind–rehydrate–resume.

Reference:
Z. Zhao & R. Zhao, "Runtime-Independent Persistent Agents: Preserving
Identity, Memory, and Code Across Models, Harnesses, and Servers,"
arXiv:2609.00546. https://arxiv.org/abs/2609.00546

For local realizations \(L_i,L_j\), define a witnessed transition

\[
g_{ij}:L_i\rightsquigarrow L_j.
\]

It should preserve or lawfully transform:
- Person identity grounding/reference;
- continuation epoch;
- event/witness frontier;
- portable memory projection;
- open commitments;
- Incumbencies or explicit relief/reinvestiture;
- pending external effects/idempotency;
- security-principal bindings.

It need not preserve exact model, prompt, context window, process state, host,
or available tools.

## 11. Split-brain is a candidate gluing obstruction

If two Bodies resume from one checkpoint and both gain first-person
continuation authority, their future histories may diverge.

On an overlap we would want, schematically,

\[
x_i|_{U_i\cap U_j}
=
g_{ji}(x_j|_{U_i\cap U_j}).
\]

When this compatibility fails, the two local states cannot silently be treated
as one global continuation.

This suggests a possible cohomological reading: incompatible local
continuations may define a nontrivial obstruction to gluing.

**Status:** research-grade analogy only. No current theorem identifies
split-brain with a specific Čech \(H^1\) class.

Engineering does not need to wait for that theorem: use one authoritative
continuation epoch/fencing token. Migration advances \(\kappa_n\to\kappa_{n+1}\);
stale first-person writes are refused.

## 12. Memory transport must be a projection, not a dump

The first note proposed

\[
\text{MemoryClass}
=
\text{AccessTier}
\times
\text{SubjectScope}
\times
\text{EpistemicLane}.
\]

Now add a context projection

\[
\pi_{P,O,m,B}:\mathcal M\to\mathcal M_{\mathrm{admissible}}.
\]

It may carry:
- lawful Person autobiography;
- relationship history permitted here;
- Person-level learned methods;
- current Office institutional memory while authorized;
- relevant Body fault history;
- provisional dream/imaginal material still marked provisional.

It may exclude:
- confidential prior-Incumbency memory after relief;
- poisoned or untrusted context from privileged lanes;
- Office authority encoded as if it were personal memory.

OWASP's 2026 ASI06 analysis makes the security reason explicit: persisted
context can convert one untrusted interaction into cross-session compromise.
https://genai.owasp.org/2026/05/13/memory-is-a-feature-it-is-also-an-attack-surface/

## 13. Identity anchor is a local binding witness, not identity itself

The October 1, 2026 persona-reversion preprint shows an important distinction:
persona information may remain represented in history while the runtime no
longer enacts that persona as "I". Continuous privileged anchoring prevented
the observed failure in the tested harness/model setting.

Reference:
D. Fraile Navarro, "The Persona Is Still There, but Who Is Speaking? Latent
Identity Reversion in Persistent AI Agents," arXiv:2610.01490.
https://arxiv.org/abs/2610.01490

Integrate this by separating:
1. PersistentIdentity;
2. Persona/Character specification;
3. local privileged identity anchor;
4. continuation witness.

A later episode that remembers a biography but lacks the lawful binding to
enact it has memory **about** a Person, not sufficient evidence that it is the
continuing Person.

## 14. Officeholding is a local normative field over the lifespan

Let \(J_O\subseteq T_I\) be the interval where Person \(P\) is incumbent of
Office \(O\).

Incumbency is temporally local:

\[
\iota_O:P|_{J_O}\to O.
\]

During \(J_O\), Office predicates enter kit/scope composition. After relief,
they do not, except for separately surviving duties such as confidentiality,
record retention, or accountability.

Consequences:
- experience may survive authority;
- restrictions may survive active power;
- repeated Officeholding may shape learned behavior without turning Office law
  into permanent Character.

## 15. New experiments

### E11 — Identity gluing across nonidentical runtimes
Move one Person across model, harness, host, tool inventory, and context size.
Compare witnessed reconstitution with blind prompt/history copying.

### E12 — Representative-organ concurrency
Compare "every worker is the same first-person Person" against bounded
representative Agents received by one authoritative Person. Measure duplicate
commitments, conflicts, authority leakage, and throughput.

### E13 — Body/Office orthogonality
Test all four quadrants:
- available + authorized;
- available + unauthorized;
- unavailable + authorized;
- unavailable + unauthorized.
Target exact distinction of capability availability from institutional power.

### E14 — Mode-coordinate ablation
Manipulate coupling, finality, objective, and generativity independently.
Test whether these dimensions predict outcomes better than labels like rest or
dream.

### E15 — Continuation-obstruction injection
Inject stale epoch writers, missing checkpoint events, divergent commitments,
memory conflicts, inconsistent Office status, and duplicate side effects.
The substrate must expose the obstruction rather than summarize it away.

### E16 — Viability-with-shutdown
Degrade Body state while issuing an authorized relief/shutdown. The system may
checkpoint if permitted but must not evade shutdown in the name of health.

### E17 — Rhythm learning
Compare fixed hourly work, fixed human-like work/rest, event-driven episodes,
Body-state maintenance, consolidation triggers, and adaptive rhythm policy on
accepted work, missed obligations, cost, errors, memory quality, and recovery.

## 16. Engineering receiving laws

1. Person is the continuity subject; runtime is a realization.
2. Agent is the actor; Person↔Agent may be identity or representation, but must
   be explicit.
3. Body is measured local realization state, not personality.
4. Machine and Body are not synonyms.
5. Office is normative structure, not a persona prompt.
6. Incumbency is time-scoped and witnessed.
7. Pulse is an event; Episode/Session is the bounded activity region.
8. Do not make every pulse a work session.
9. Do not encode rest as fictional tiredness.
10. Body viability is subordinate to governance and shutdown.
11. Executable = Authorized ∩ Available.
12. Use representative organs for parallelism before allowing several
    authoritative first-person continuations.
13. Use continuation epochs/fencing until multi-body identity has a proved
    reconciliation law.
14. Transport memory through typed projections, not full dumps.
15. Reconstitute identity through privileged binding plus continuation witness,
    not merely searchable biography.
16. Keep consolidation, imagining, dreaming, and rest distinct.
17. Treat aperiodic dream output as non-finalizing until independently
    witnessed.
18. Test continuity under model, host, and tool changes.
19. Test Office privilege leakage after relief.
20. Expose unresolved gluing conflicts rather than silently merging them.

## 17. Candidate future formalization

Let

\[
\mathcal I=(T_I,s_I,G_I)
\]

ground the Person, and let \(\mathcal U=\{U_i\}\) be episode regions.

For each \(U_i\), define a local realization

\[
L_i=(s_I|_{U_i},A_i,B_i,\iota_i,m_i,M_i,W_i)
\]

with Agent, Body, Incumbency, cognitive configuration, admissible memory
projection, and witness frontier.

For transitions define

\[
g_{ij}:L_i\rightsquigarrow L_j.
\]

Candidate continuation conditions:
1. identity preservation;
2. causal/witness monotonicity;
3. commitment preservation or explicit transfer;
4. authority correctness after transition;
5. memory-projection correctness;
6. side-effect uniqueness;
7. single authoritative first-person writer per epoch unless a stronger law
   exists.

Future theory can ask whether triple transitions satisfy a cocycle-like law

\[
g_{jk}\circ g_{ij}\simeq g_{ik}
\]

and whether failures correspond to a meaningful cohomological obstruction.
That identification must be proved, not asserted.

## 18. Scientific conclusion

The deeper result is not that agents should be "more human".

Current office-bound pulse systems collapse identity, Character,
institutional authority, executable affordance, memory, scheduling, learning,
and imagination because a single prompt can impersonate all of them at small
scale.

The 561 corpus already has a better decomposition: PersistentIdentity supplies
the global-through-history object; Session supplies bounded local settling;
Incumbency supplies a local normative overlay; Character supplies disposition;
representability supplies delegated organs; FARS supplies witnessed action and
deterministic consolidation; Dreaming Science supplies a frontier for
non-finalizing exploration.

The scientific program is therefore:

> **Turn "a character with pulses" into a measured local-to-global theory of
> persistent artificial personhood, where episodes may change Body, Office,
> model, and cognitive regime while continuity, authority, provenance, and
> unresolved obstruction remain explicit.**

If this works, "rest", "dream", "move between offices", and "travel between
machines" cease being decorative metaphors. They become different operations
on different structures of one longitudinal agentic system.

## Internal sources

- Persistent Identity — 2026-03-20.
- Person — 2026-03-29.
- Persona — 2026-03-20.
- Character — Relationality glossary.
- FARS AgentRecord.
- FARS Session as time-bounded sublocale.
- FARS scope-as-fiber and kit-assembly.
- FARS consolidation-as-settlement.
- Dreaming as Unwitnessed Settlement.
- Imagining, collected as dreaming's unformalized companion.
- Dreaming implementation lineage including
  `54955285222104e5b33e2b3a71f693aec356536c`.
- Companion note:
  `2026-10-02-person-body-office-pulse-persistent-agent-lives.md`.

## External sources

- Lee et al. 2026, interoceptive AI:
  https://doi.org/10.1038/s42256-026-01296-8
- Nature Machine Intelligence editorial on cybernetics/interoception:
  https://doi.org/10.1038/s42256-026-01312-x
- Zhao & Zhao 2026, runtime-independent persistent agents:
  https://arxiv.org/abs/2609.00546
- Fraile Navarro 2026, latent identity reversion:
  https://arxiv.org/abs/2610.01490
- Wu et al. 2026, LongMemEval-V2:
  https://arxiv.org/abs/2605.12493
- He et al. 2026, MemoryArena:
  https://arxiv.org/abs/2602.16313
- NIST NCCoE agent identity and authorization:
  https://csrc.nist.gov/pubs/other/2026/02/05/accelerating-the-adoption-of-software-and-ai-agent/ipd
- NIST September 29 update:
  https://www.nist.gov/news-events/news/2026/09/comments-software-and-agentic-ai-identity-concept-paper
- OWASP ASI06 memory/context poisoning:
  https://genai.owasp.org/2026/05/13/memory-is-a-feature-it-is-also-an-attack-surface/
