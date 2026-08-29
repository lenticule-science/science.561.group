---
id: emits
description: "Emission is a relation O emits R — operation O emits resource R — asserting that O sends a new instance of R to a channel or recipient other than its caller: R exists as O's output but is not returned to the invoker. The defining structure: emission is directed output — the resource is created and dispatched to a target channel, queue, subscriber, or actor address, bypassing the call stack. Emission is the counterpart to returns: (which gives a value to the caller) and distinct from produces: (which creates a persistent resource without specifying the dispatch target). Emission corresponds to the output action ā.P in CCS (Milner 1980), to channel send in the π-calculus, and to message send in the actor model (Hewitt 1973)."
defines: Emits
related: Returns, Produces, Consumes, Takes, CCS, ActorModel, PublishSubscribe
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  operation: relational-universe-morphism
  emitted-type: relational-universe
  channel: relational-universe
output: relational-universe-morphism
ast:
  directed-side-output:
    - operation
    - emitted-type:
        - channel:
            - operation
            - emitted-type
---

# Emits

## Formal definition

**Emission** is a relation $O \text{ emits } R$:

$$(O : \mathrm{Operation},\; R : \mathrm{EmittedType},\; C : \mathrm{Channel})$$

holding when $O$ creates a new instance $r : R$ and dispatches $r$ to channel $C$ — $r$ is $O$'s output but is not available to $O$'s caller; it enters $C$'s message queue or subscriber set.

**One invariant.** $O \text{ emits } R$ iff:

1. **Non-returnability**: The emitted instance $r : R$ is not placed on $O$'s return stack and is not accessible to $O$'s caller after $O$ completes. The dispatched resource travels through a side channel — a queue, inbox, topic, actor mailbox, or event stream — that is decoupled from the invoker. This is the distinguishing condition: whatever $O$ returns to its caller is separate from what $O$ emits. An operation may simultaneously emit $R$ (to a channel) and return $S$ (to its caller) when $R$ and $S$ are distinct.

## Milner: CCS output actions

Robin Milner (*A Calculus of Communicating Systems*, 1980; *Communication and Concurrency*, 1989): in CCS, a process $P$ can perform an **output action** $\bar{a}.P'$, which sends a signal on channel $a$ and then behaves as $P'$. The output $\bar{a}$ is an emission: it is not a return value from $P$ to its invoker but a synchronization offer placed on channel $a$ for any complementary input $a$ in a parallel process.

$$P \mid Q \xrightarrow{\tau} P' \mid Q' \quad \text{when } P \xrightarrow{\bar{a}} P',\; Q \xrightarrow{a} Q'$$

The $\tau$ (silent) transition results from the synchronization between $P$'s emission and $Q$'s reception. The emitted value is consumed by $Q$; $P$'s caller sees only the $\tau$ transition.

**The π-calculus** (Milner, Parrow, Walker, *The Polyadic π-Calculus*, 1992): extends CCS to channel-passing. $\bar{a}\langle b \rangle.P$ emits channel name $b$ on channel $a$. The emitted payload is a channel reference — emission can reconfigure the communication topology. This is the formal model of dynamic service binding: emitting an endpoint creates a new connection possibility without returning the endpoint to the caller.

## Hewitt: the actor model

Carl Hewitt, Peter Bishop, Richard Steiger (*A Universal Modular ACTOR Formalism for Artificial Intelligence*, 1973): an **actor** is a computational entity with a mailbox address. An actor's only means of output is **sending messages** to addresses it knows. Sending is an emission: the message enters the recipient's mailbox; the sender does not wait for a response (asynchronous, non-blocking). The actor model formalizes emission as the primary communication primitive — there is no shared state and no return stack; all output is emission.

The **actor replacement behavior**: after sending messages, an actor specifies its next behavior. The sent messages are emitted; the next behavior is the local continuation. This separates emission (sent to others) from internal state (the replacement behavior).

## Hoare: CSP events and channels

C.A.R. Hoare (*Communicating Sequential Processes*, 1978, 1985): in CSP, the event $c!v$ denotes process $P$ emitting value $v$ on channel $c$. The output event $c!v$ is a synchronization barrier: $P$ blocks until a complementary input $c?x$ in parallel process $Q$ is ready. Upon synchronization, $v$ flows from $P$ to $Q$ through channel $c$, and both proceed.

CSP channels are **typed**: $c : T$ means only values of type $T$ may be emitted on $c$. This gives emission a static type discipline: the emitted type $R$ must match the channel's declared type. The **refinement** relation $P \sqsubseteq Q$ (traces-refinement) is compatible with emission: $Q$ refines $P$ only if $Q$'s emissions are a subset of $P$'s (fewer or equal emissions are acceptable refinements).

## Publish-subscribe and reactive streams

The publish-subscribe pattern (Eugster, Felber, Guerraoui, Kermarrec, *The Many Faces of Publish/Subscribe*, 2003): a **publisher** emits events to a **topic**; **subscribers** registered on that topic receive them. The publisher does not know the subscribers; the subscriber does not know the publisher. Emission is decoupled in both time and identity — the publisher's action of emitting an event is independent of when and by whom it is consumed.

**Reactive streams** (Meijer et al., Rx: Reactive Extensions, 2010): formalize this as a cold/hot observable distinction. A **hot observable** emits regardless of subscribers; a **cold observable** emits only when subscribed. In both cases, emission is directed at a subscription channel, not at a calling frame.

## Open questions

- Whether emission and return are formally dual in some categorical sense — whether a category of operations where morphisms are return-channels and a category where morphisms are emission-channels are related by a duality functor, and whether this duality corresponds to the CCS duality between input $a$ and output $\bar{a}$.
- Whether the distinction between emission (to a channel) and return (to the caller) breaks down in continuation-passing style — where every operation is transformed to take its "return channel" as an explicit continuation argument, making all outputs emissions to explicit continuations.
