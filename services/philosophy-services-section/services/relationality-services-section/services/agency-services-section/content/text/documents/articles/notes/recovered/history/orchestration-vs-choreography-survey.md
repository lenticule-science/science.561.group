---
title: "Orchestration vs. Choreography in Multi-Agent Systems"
description: "How two distinct coordination traditions—centralized orchestration and decentralized choreography—frame the problem of agent coordination, their tradeoffs, and where each fits in system design."
date-created: 2026-04-04
domain: engineering/tech/computing/artificial-intelligence/agents
references:
  wiener_1948:
    title: "Norbert Wiener, *Cybernetics: Or Control and Communication in the Animal and the Machine* (MIT Press, 1948)"
  milner_1999:
    title: "Robin Milner, *Communicating and Mobile Systems: the π-Calculus* (Cambridge University Press, 1999)"
  w3c_2005:
    title: "World Wide Web Consortium Web Services Choreography Working Group, *Web Services Choreography Description Language Version 1.0* (2005)"
  nadareishvili_2015:
    title: "Irakli Nadareishvili, 'Hypermedia-Driven Orchestration in Microservices' (O'Reilly Software Architecture Conference, 2015)"
  reactive_manifesto_2014:
    title: "Reactive Manifesto Signatories, *The Reactive Manifesto* (2014), https://www.reactivemanifesto.org/"
  hayek_1945:
    title: "Friedrich A. Hayek, 'The Use of Knowledge in Society,' *American Economic Review* 35, no. 4 (1945): 519-530"
  mintzberg_1979:
    title: "Henry Mintzberg, *The Structuring of Organizations* (Prentice-Hall, 1979)"
  gerkey_mataric_2004:
    title: "Brian P. Gerkey and Maja J. Matarić, 'A Formal Analysis and Taxonomy of Task Allocation in Multi-Robot Systems,' *International Journal of Robotics Research* 23, no. 9 (2004): 939-954"
  beer_1972:
    title: "Stafford Beer, *Brain of the Firm* (Herder and Herder, 1972)"
---

## The Coordination Problem

When multiple agents must work together, they face a fundamental problem: how do they decide who does what, in what order, and with what information? Two distinct traditions have emerged to solve this problem, each with different assumptions about where authority and information flow.

**Orchestration** places coordination decision-making in a single point: a central coordinator that knows about all participants, directs their actions, receives their results, and decides what happens next. The coordinator is the locus of control. In Mintzberg's terms, this is **direct supervision**—one authority directing the work of others.

**Choreography** distributes coordination across participants: each agent knows its own role and follows a shared protocol. When agent A finishes, it publishes an event; agent B has been programmed to listen for that event and act. No single entity directs the dance; instead, all participants follow the same choreography. In Mintzberg's terms, this is **standardization of output** or **standardization of work processes**—the rules are centralized, but the execution is distributed.

These are not mere engineering preferences. They are rooted in different theories of how complex systems coordinate, different assumptions about where information lives, and different predictions about how systems behave under load and failure.

## Orchestration: Control and Visibility

### The Technical Tradition

The W3C Web Services Choreography Working Group (2005) formalized the distinction. In orchestration, coordination logic is specified from the local point of view of one controlling participant—the orchestrator. The orchestrator is a process that:

1. Receives a high-level goal or request
2. Decomposes it into subtasks
3. Invokes other services or agents in sequence or parallel
4. Monitors their responses
5. Handles failures and retries
6. Decides what happens next based on the results
7. Synthesizes the final response

The orchestrator is the central "brain" of the system. It contains the entire workflow logic. If you want to understand what will happen, you read the orchestrator's code.

Nadareishvili's work on microservices (2015) emphasizes orchestration's advantage: **total visibility**. A DevOps operator can look at the orchestrator and see the entire workflow. If a service fails, the orchestrator's logs show exactly where. If the workflow hangs, you can trace which step is blocked. This visibility is why enterprise workflow engines (Camunda, Temporal, AWS Step Functions) are predominantly orchestration-based—organizations value being able to see what's happening and trace failures deterministically.

Gerkey and Matarić (2004) classify this as **single-task, multi-robot allocation with a centralized scheduler**: one coordinator assigns tasks to multiple agents.

### The Organizational Parallel

Orchestration maps directly to traditional organizational command structure. Mintzberg (1979) calls this **direct supervision**: a manager decides what each subordinate does, monitors their work, and adjusts assignments based on results. A military organization is the archetypal example: a general receives intelligence, formulates a plan, assigns units to execute it, monitors progress, and redirects forces if conditions change.

In this frame, Wiener's *Cybernetics* (1948) provides the theoretical foundation. The orchestrator is the helmsman, continuously sensing and correcting. The work of coordination is localized in the orchestrator's decision-making loop, which is why it can respond quickly to unexpected conditions.

### The Cost: The Bottleneck

The strength of orchestration is also its vulnerability. Orchestration centralizes decision-making in one process. That process becomes a bottleneck.

In distributed systems, Nadareishvili notes that the orchestrator becomes the critical path. If the orchestrator is slow, the entire system is slow. If the orchestrator fails, the entire workflow stops. Scaling requires replicating the orchestrator or partitioning workflows, both of which complicate the system.

In organizations, direct supervision doesn't scale beyond about 7-10 subordinates per manager. Mintzberg documents that as organizations grow, they must shift to standardization mechanisms (rules, procedures, skill-based work) precisely because one authority cannot directly supervise everyone. The bottleneck is not technical—it is cognitive. One human cannot hold the complexity of hundreds of workers' activities in mind.

This observation applies to AI agents as well. Coordination overhead grows rapidly: token consumption, latency, and error amplification all increase as the number of coordinated agents grows. Practical multi-agent systems show saturation around 4 agents when using orchestration with natural-language handoffs.

## Choreography: Decentralized Protocol Adherence

### The Technical Tradition

In choreography, there is no central orchestrator. Instead, the system is described from a global perspective: what events flow between services, what each service does when it receives an event, what new events it publishes. Each participant independently executes its role.

The W3C (2005) formalized this in the Web Services Choreography Description Language (WS-CDL), which specifies multi-party interactions from a global viewpoint. The language was grounded in Robin Milner's π-calculus (1999), a process algebra that models systems of independently executing processes that communicate by naming. In the π-calculus, there is no orchestrator—only processes that send and receive messages according to a protocol.

Choreography in modern systems is typically event-driven. An order processing system might work like this:

1. **Order Service** receives a new order and publishes "Order Created" event
2. **Inventory Service** listens for "Order Created", reserves stock, publishes "Stock Reserved" or "Stock Unavailable"
3. **Payment Service** listens for "Stock Reserved", charges the card, publishes "Payment Succeeded" or "Payment Failed"
4. **Shipping Service** listens for "Payment Succeeded", creates a shipment, publishes "Shipment Created"

No single process orchestrates this. Each service knows: "When I see X, do Y and publish Z." The protocol—the sequence of events—is implicit in the listeners and publishers.

The Reactive Manifesto (2014) champions this model. Reactive systems respond to events, are loosely coupled (each component knows only about the events it cares about), and are resilient (if one component fails, others continue processing other events). The backbone is a message-driven or event-driven architecture where participants communicate through a broker or event stream rather than direct calls.

### The Organizational Parallel

Choreography maps to market coordination. Hayek's *Use of Knowledge in Society* (1945) is the foundational text. Hayek argued that a central planner cannot efficiently coordinate a complex economy because all the information needed—what each worker is skilled at, what resources are available locally, what customers want today—is dispersed. No planner can gather and process that information fast enough.

Instead, markets coordinate through **price signals**. A price is a summary of information: when tin becomes scarce, its price rises. Consumers see the high price and use less. Producers see the high price and increase supply. Entrepreneurs see the high price and search for substitutes. All of this happens without any central authority directing it. The price signal choreographs economic activity.

Hayek's insight is that decentralized coordination can be more efficient than centralized orchestration when information is dispersed and conditions change rapidly. Each actor responds to signals (prices, in the market case; events, in the systems case) using local knowledge.

Applied to organizations: Beer (1972) and subsequent cybernetics theory describe how organizations use distributed feedback loops to adapt. Rather than waiting for central authority to decide how to respond to a market change, local units see the change in their input signals (orders drop, customer complaints rise, supplier prices change) and respond autonomously. The center sets overall direction; units choreograph their responses to local conditions.

### The Strength: Scaling and Resilience

Choreography avoids the bottleneck because there is no central coordinator. Adding a new service to the system does not require modifying the orchestrator's code—the new service simply listens for the events it cares about and publishes the events others should hear. This makes choreography more loosely coupled and more scalable.

Resilience is another strength. If one service in a choreographed system becomes slow or fails, others continue processing. A slow payment service doesn't block order creation; the order service has already published "Order Created" and the inventory service has already reserved stock. Eventually, the payment service recovers and processes queued events. Orchestration, by contrast, typically blocks: if a service doesn't respond, the orchestrator waits or times out, and the entire workflow halts.

The Reactive Manifesto emphasizes this: message-driven systems with decoupled components handle partial failures gracefully. The system remains responsive even when parts are degraded.

### The Cost: Opacity and Complexity

The weakness of choreography is exactly the inverse of orchestration's weakness. Choreography distributes understanding across the system.

If you want to know what will happen when an order arrives, you must trace through all the services, find the event listeners, understand the implicit protocol. The workflow logic is nowhere in one place. It emerges from the interaction of independently programmed pieces.

This makes choreography harder to reason about, harder to debug, and harder to test. When something goes wrong, determining which service caused the problem requires examining logs across all services and reconstructing the event sequence. The path of information is implicit, not explicit.

The Reactive Manifesto acknowledges this: event-driven systems trade explicit control for responsiveness. Operators lose the ability to see the complete workflow at a glance. They must rely on comprehensive observability—logging, tracing, metrics—to understand what the system is doing.

In organizational terms: Hayek's market coordination is more efficient at responding to dispersed information, but it creates a different kind of complexity. A market economy produces outcomes no single planner designed and often no one fully understands. The price system allocates resources efficiently, but if something goes wrong, it is harder to identify and fix because the cause is distributed across many actors' independent decisions.

## The Spectrum Between: Hybrid Systems

Most real systems do not sit at pure endpoints. They occupy a spectrum.

**Orchestration with choreography within.** A main orchestrator coordinates high-level phases (discovery → planning → execution → review). Within each phase, agents follow a choreographed protocol defined by shared norms and event streams. Claude Code follows this pattern: the session orchestrates subagent dispatch while those subagents follow shared conventions in skills and rules.

**Choreography with orchestration for complexity.** A system uses event-driven choreography for routine flows but invokes an orchestrator for complex exception handling. Orders flow choreographed until something fails; then an orchestrator-based recovery process takes over. This mirrors organizational practice: distributed units choreograph routine operations; central authority orchestrates strategic changes and crisis response.

**Hierarchical orchestration.** For very large systems, a single orchestrator becomes infeasible. Instead, there are multiple orchestrators at different scales: one coordinates teams of agents, another coordinates teams of teams. Mintzberg calls this **standardization of skills**—each team is trusted to execute its part, coordinated only at the level of handoffs. This is also how military organizations scale: each unit has an orchestrator (commander) coordinating that unit's work, and units are orchestrated at the next level up.

## The Predication Frame

From the library's predication framework, the distinction maps to **subject and object**:

In **orchestration**, the orchestrator is the **agent** (subject); the other services are the **patients** (objects) on which it acts. The orchestrator decides, delegates, and collects results. The causal flow is from the orchestrator outward.

In **choreography**, all services are equally **agents** and **patients**: each responds to events (is patient to the system's state) and produces events (acts as agent on other services). The causal flow is bidirectional and distributed. No one participant stands outside the system directing it; all are within.

## Mapping to This System

The 561 Group's agent governance structure uses both traditions:

**Orchestration layer**: The session (or the user as principal) is the orchestrator. The session dispatches agents, assigns tasks, monitors progress, and decides when phases complete. This is explicit and visible: you can read the session's decision log and see exactly what was assigned and why. This maps to Mintzberg's direct supervision and to Wiener's helmsman—the session continuously senses conditions and corrects course.

**Choreography layer**: The event stream and shared skills enable choreography. Agents observe events they care about (new tasks, observations, decisions) and respond autonomously within their capability scope. Skills encode standardized work processes; rules encode standardized output specifications. This allows agents to coordinate without explicit orchestration for every interaction. This maps to Hayek's market coordination and to Beer's distributed feedback.

**Hybrid coordination**: A background daemon (when implemented) would be semi-choreographed—it listens for events indicating work is ready and dispatches it without waiting for synchronous orchestration. This is intermediate: event-triggered dispatch rather than direct supervision, but still explicit assignment rather than pure listener registration.

This hybrid structure appears throughout organizational theory: military units execute choreography (standard operating procedures) within orchestration (command structure). Markets show choreography (price signals) at scale with orchestration at the level of individual firms or strategic industries. Biological systems use both: cells follow chemical signals (choreography) while nervous systems orchestrate complex responses.

## Open Problems

Three tensions remain unresolved:

**1. Visibility vs. Scalability.** Orchestration provides visibility; choreography scales. As systems grow, the choice to maintain visibility often sacrifices scale, or the choice to maintain scale sacrifices visibility. Nadareishvili's hypermedia approach attempts to find a middle ground through protocol-driven design: choreography that is implicit but still partially visible because the protocol is published. This remains an active research area.

**2. Determinism vs. Resilience.** Orchestration makes system behavior deterministic—given a goal and inputs, the orchestrator will execute a specific sequence of steps. Choreography makes behavior emergent—the same input might flow through services in different orders depending on timing and load. For safety-critical systems, determinism is required. For high-availability systems, resilience to partial failures is required. Few systems achieve both.

**3. Distributed Accountability.** When a choreographed system produces a wrong result, determining responsibility is hard. Each service executed correctly in isolation, but the interaction of their independent decisions produced the error. Orchestration preserves accountability: the orchestrator is responsible for the workflow. Choreography distributes responsibility—which is more resilient but harder to audit.

---

## See Also

- [agent-orchestration](../terms/agent-orchestration.md) — the coordination layer definition and formal framework
- [multi-agent-system](../terms/multi-agent-system.md) — system architecture patterns
- [multi-agent-orchestration-in-practice](./multi-agent-orchestration-in-practice.md) — concrete patterns (dispatch, handoffs, worktree isolation)
- [dispatch-and-delegation-survey](../../../../../../../../../../humanities/theories/sociology/theories/work/texts/dispatch-and-delegation-survey.md) — organizational theory foundations
- [cybernetics-and-governance-survey](../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/texts/cybernetics-and-governance-survey.md) — feedback and adaptation in systems
