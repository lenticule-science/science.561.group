---
type: narrative
status: current
recaps: [agent, skill, runbook, dispatch, inbox, governance]
introduces: []
discusses: [agent, dispatch, inbox, runbook, governance]
title: "Upstream stream: classical multi-agent systems"
description: This narrative situates the agential-orchestration-platform against the upstream stream of classical multi-agent systems (MAS) — the lineage that ran from the late-1980s blackboard architectures through the 1990s BDI agent theories and…
---

# Upstream stream: classical multi-agent systems

This narrative situates the agential-orchestration-platform against the upstream stream of *classical multi-agent systems* (MAS) — the lineage that ran from the late-1980s blackboard architectures through the 1990s BDI agent theories and FIPA standardization, consolidated in the Wooldridge–Jennings surveys and the Wooldridge textbook.
The platform inherits the field's vocabulary and engineering catalog and reformulates each load-bearing structure as substrate content per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md).

## What the stream consists of

Five sub-currents:

- **The agent abstraction itself.** [Wooldridge–Jennings (1995)](../wooldridge-jennings1995/wooldridge-jennings1995.md) characterizes the *weak* and *strong* notions of agency that organize the field; [Wooldridge (2009)](../wooldridge2009/wooldridge2009.md) is the consolidated textbook.
  The platform's [agent](../teaching/explanations/agent.md) concept satisfies the weak notion (autonomy, social ability, reactivity, pro-activeness) by substrate construction.
- **Practical-reasoning architectures.** [Bratman (1987)](../goal/bratman1987/bratman1987.md) supplies the philosophical analysis of intention; [Rao–Georgeff (1995)](../goal/rao-georgeff1995/rao-georgeff1995.md) lifts BDI from formal theory to practical agent architectures (PRS, dMARS, JACK).
  The platform's correspondences live in [intention-as-scope-bounded-commitment](../goal/intention-as-scope-bounded-commitment/intention-as-scope-bounded-commitment.md), [belief-base-as-fiber-restriction](../memory/belief-base-as-fiber-restriction/belief-base-as-fiber-restriction.md), and [practical-reasoning-as-runbook-execution](../runbook/practical-reasoning-as-runbook-execution/practical-reasoning-as-runbook-execution.md).
- **The actor model.** [Hewitt–Bishop–Steiger (1973)](../agent/hewitt-bishop-steiger1973/hewitt-bishop-steiger1973.md) introduces the actor model; [Agha (1986)](../agent/agha1986/agha1986.md) develops the mature mathematical treatment.
  The platform's no-shared-state-at-the-agent-level discipline is the actor model's encapsulation discipline; the platform's [inbox](../teaching/explanations/inbox.md) is the actor's mailbox.
- **Tuple-space coordination.** [Gelernter (1985)](../memory/blackboard-as-substrate-projection/gelernter1985/gelernter1985.md) introduces Linda.
  The platform's substrate-as-coordination-medium shape inherits Linda's associative-retrieval discipline; the substrate's [predication-graph store](../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/terms/predication-graph-store.md) plays Linda's tuple-space role.
- **Blackboard systems.** [Engelmore–Morgan (1988)](../memory/blackboard-as-substrate-projection/engelmore-morgan1988/engelmore-morgan1988.md) consolidates the blackboard-architecture lineage from HEARSAY-II onward.
  The platform's [dispatch](../teaching/explanations/dispatch.md) is structurally the blackboard's control component; the [blackboard-as-substrate-projection](../memory/blackboard-as-substrate-projection/blackboard-as-substrate-projection.md) concept names the relationship.
- **Agent communication languages.** [Finin et al. (1994)](../agent/federation/finin-et-al1994/finin-et-al1994.md) introduces KQML; [FIPA-ACL (2002)](../agent/federation/fipa-acl2002/fipa-acl2002.md) is the mature standardized successor.
  The platform's [speech-act-as-witnessed-predication](../settlement/speech-act-as-witnessed-predication/speech-act-as-witnessed-predication.md) concept names the substrate-side reformulation.

## What the platform borrows

- **Agent vocabulary.** Autonomy, social ability, reactivity, pro-activeness, capability, role, organization, message, performative, conversation — the field's vocabulary is the platform's vocabulary, with the platform's specific commitment that every term names a substrate predication or substrate entity.
- **Practical reasoning shape.** The BDI-style deliberate-then-execute loop — read beliefs, consider options, commit to intentions, execute selected steps — is structurally the platform's tick / heartbeat / dispatch / runbook-execution cycle.
  The [practical-reasoning-as-runbook-execution](../runbook/practical-reasoning-as-runbook-execution/practical-reasoning-as-runbook-execution.md) concept names the correspondence.
- **Actor encapsulation.** Each agent operates within its own scope; cross-agent coordination is explicit messaging through inboxes, not shared mutable state.
  The actor model's no-shared-state discipline is the platform's discipline at the agent layer.
- **Tuple-space coordination.** The platform's predication-graph store is associative (retrieval by content, not address), generative (a predication's lifetime is independent of its producer), and persistent (predications remain until explicitly retracted).
  Linda's three coordination properties are properties of the substrate.
- **Blackboard opportunism.** Agents act when their preconditions match substrate state, not in a pre-determined sequence.
  The opportunistic-contribution discipline of blackboard systems is the platform's dispatch discipline.
- **Speech-act-typed messages.** The KQML / FIPA-ACL insight that agent messages need explicit performatives (the message *intends* to assert / request / propose) is built into the platform's communication discipline.
  The platform inherits the FIPA performative library as a starting vocabulary.
- **Standard interaction protocols.** Contract-net, English auction, subscribe, query-if — the FIPA interaction-protocol catalog supplies a starting set of canonical multi-agent runbooks for the platform.

## Where the platform diverges

- **Everything is a substrate predication, not an external message or external state.** The classical MAS tradition treats agents, messages, and coordination state as *external* to a substrate (typically the agents are processes, the messages are wire bytes, the coordination state is a separate database or message bus).
  The platform makes all three substrate content.
  An agent is an entity with capability predications; a message is a predication on a message entity; coordination state is the predication-graph store itself.
  Per [agential self-generation](../agent/agential-self-generation/agential-self-generation.md), this is the platform's defining commitment.
- **No category-based agent typology.** The classical-MAS field organizes agents by *kind* (deliberative, reactive, hybrid; BDI vs. subsumption; collaborative vs. self-interested).
  The platform's [dispatch-from-properties](../dispatch/dispatch-from-properties/dispatch-from-properties.md) discipline rejects category-based typology in favor of property-based dispatch: an agent is what its capability predications say, and dispatch is composition of capability fibers, not lookup against an agent-type catalog.
- **Mentalism replaced by witness.** FIPA-ACL takes the *mentalistic* semantics of communicative acts (a `request` is grounded in the sender's mental state about the receiver).
  The platform reformulates the semantics as substrate-witness — a `request` predication exists iff the substrate records a witness for the request having been performed.
  The semantics is checkable by traversal rather than by appeal to internal mental states the substrate cannot inspect.
- **Coordination through value-domain join, not through orchestration glue.** Blackboard control components and Linda transaction discipline are implementation-side glue layered over the shared store.
  The platform's coordination is the substrate's value-domain join: federation, conflict resolution, partition tolerance all fall out of the bilattice $\vee_k$ rather than being separately engineered.
- **Provenance and federation are first-class.** Classical-MAS systems typically have no built-in provenance for agent actions and no built-in federation across MAS instances.
  The platform's [witness](../../../teaching/explanations/witness.md) chain and [federation-as-substrate-join](../../../narratives/federation-as-substrate-join.md) supply both as substrate primitives.

## What the stream lacks that the platform supplies

The classical MAS tradition has each load-bearing structure separately — actors, blackboards, tuple spaces, BDI architectures, FIPA-ACL, Wooldridge's surveys — but no published work in the tradition commits to *all of them simultaneously at the substrate level* with a paraconsistent value domain and full witnessing.
The platform's contribution is the substrate-content-everywhere reformulation: actors are substrate entities, blackboard partitions are substrate scopes, tuple-space tuples are substrate predications, BDI mental states are substrate predications, FIPA performatives are substrate predicates, and all five inherit the substrate's federation, witness, and bilattice value-domain disciplines without re-engineering.

The composite narrative at [predicated-agentic-computing](../predicated-agentic-computing/predicated-agentic-computing.md) returns to this point: classical MAS is one of the upstream streams whose substrate-content reformulation produces the predicated-agentic-computing composite.
