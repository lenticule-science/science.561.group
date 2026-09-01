---
title: "State, Time, and Event"
description: "State, time, and event are not three independent concepts but three views of one structure: traces through a state space where states are Markov-sufficient summaries and events are transitions."
date-created: 2026-04-04
text-type: essay
domain: metaphysics
references:
  - McTaggart, J.M.E. (1908). "The Unreality of Time". *Mind*, 17(68), 457–474.
  - Prior, Arthur. (1967). *Past, Present, and Future*. Oxford University Press.
  - Whitehead, Alfred North. (1929). *Process and Reality*. Macmillan.
  - Davidson, Donald. (1969). "The Individuation of Events". In *Essays on Actions and Events*. Oxford University Press.
  - Kim, Jaegwon. (1976). "Events as Property Exemplifications". *The Journal of Philosophy*, 73(19), 589–603.
  - Rutten, Jan. (2000). "Universal Coalgebra: A Theory of Systems". *Theoretical Computer Science*, 249(1), 3–80.
  - Mealy, George. (1955). "A Method for Synthesizing Sequential Circuits". *Bell System Technical Journal*, 34(5), 1045–1079.
  - Moore, Edward. (1956). "Gedanken-Experiments on Sequential Machines". In *Automata Studies*. Princeton University Press.
  - Kemeny, John & Snell, J. Laurie. (1960). *Finite Markov Chains*. Van Nostrand.
  - Bergson, Henri. (1889). *Time and Free Will*. Dover Publications.
---

State, time, and event look like three concepts. They are one structure seen three ways.

A [state](../../../../../terms/state.md) is a configuration — what holds right now. An [event](../../../../../terms/event.md) is a transition — what happens between configurations. [Time](../../../../../terms/time.md) is the ordering that makes "between" meaningful. Philosophy and mathematics have each developed accounts of these concepts independently, but when you lay them side by side a single pattern emerges: a trace through a state space, where the state carries exactly enough information to determine what can happen next, and events are the steps.

## Three philosophical starting points

McTaggart (1908) distinguished two temporal orderings: the A-series (past, present, future — centered on a moving now) and the B-series (earlier-than, later-than — no privileged moment). His point was that the A-series is necessary for time to be real, yet generates contradiction. What matters here is the structural insight: temporal description requires both a sequence of positions (states ordered by the B-series) and a perspective that distinguishes what is settled from what is open (the A-series). A state machine has both — a current node and a history of transitions behind it.

Prior (1967) formalized the A-series as tense logic: operators F ("it will be the case that") and P ("it was the case that") over propositions. A proposition like Fp ("it will rain") is true now if p holds at some future moment. The key move is that Prior treats temporal facts as modal — they concern what is possible or necessary relative to the present state, not what exists timelessly. Tense logic makes the present state the evaluation point for all temporal claims. The state is not just a snapshot; it is a perspective from which past and future are assessed.

Whitehead (1929) rejected the idea that time is a line on which events sit. For Whitehead, [actual occasions](theories/process-philosophy/terms/actual-occasion.md) are the basic units of reality — each one comes into being, achieves definiteness, and perishes, becoming data for the next. Time is the creative advance of occasions, not a container for them. An occasion's "state" is its achieved satisfaction — the result of its becoming. This is closer to the automata-theoretic picture than it first appears: each occasion is a transition that produces a new configuration, and the configuration is exactly what subsequent occasions inherit.

## Three formal accounts

Automata theory provides the clearest formal model. A Mealy machine (1955) is a tuple (S, I, O, δ, λ) — states S, inputs I, outputs O, a transition function δ: S × I → S, and an output function λ: S × I → O. A Moore machine (1956) is similar but the output depends only on the state: λ: S → O. In both, the state is what the machine remembers between transitions. The event is the pair (input, transition). Time is the index over the sequence of transitions.

The state does one specific job: it screens off the past. Given the current state, you do not need the history of how the machine arrived there to determine what happens next. This is the Markov property, named for its probabilistic formulation but present in deterministic automata too. A Markov chain (Kemeny & Snell, 1960) makes this explicit: P(Xₙ₊₁ | Xₙ, Xₙ₋₁, ..., X₀) = P(Xₙ₊₁ | Xₙ). The state is a sufficient summary — it compresses the entire past into whatever structure the future needs.

Coalgebra (Rutten, 2000) generalizes this. A coalgebra for a functor F is a pair (S, c: S → F(S)). The state space S is observed through the structure map c, which tells you what you can see from a state and where you can go. Two states are bisimilar if no sequence of observations can distinguish them. This is the deepest formulation of what a state is: not a list of properties, not a node in a graph, but an equivalence class under observational indistinguishability. Two systems with completely different internal structures can have the same states, coalgebraically, if they behave identically from the outside.

## The convergence

These traditions — philosophical and formal — converge on a single picture:

**State** is a Markov-sufficient summary. It carries exactly enough information to determine what transitions are possible and what observations can be made. It screens off the past. In McTaggart's terms, the state is the B-series position from which the A-series (settled past, open future) is evaluated. In Whitehead's terms, it is the achieved satisfaction of the perished occasion — the data inherited by what comes next.

**Event** is a transition between states. Kim (1976) defined an event as [object, property, time] — a property exemplification. Davidson (1969) individuated events by their causes and effects. Both reduce to the same thing when formalized: an event is a step in the trace, a pair (state-before, state-after), possibly triggered by an input. What Kim calls "property exemplification" is the state-after. What Davidson calls "causes and effects" are the predecessor and successor transitions in the trace.

**Time** is the ordering over the trace. The B-series is the total order of transitions. The A-series is the partition of the trace into the settled prefix (past), the current state (present), and the open suffix (future). Prior's tense logic evaluates temporal propositions relative to the current state — exactly the evaluation semantics of a state machine.

## The state/event distinction

States persist; events happen. This is the folk distinction, and it holds up formally. A state is a node — the machine stays in it until an input arrives. An event is an edge — it occurs and is done. But the distinction is relative to granularity. What looks like a persisting state at one level (a chess game "in progress") is a sequence of events at a finer level (individual moves). What looks like an instantaneous event at one level (a legal ruling) is a persisting process at a finer level (deliberation, drafting, announcement).

Bergson (1889) argued that states are cognitive acts — freezings of continuous duration that we perform in order to reason. Real time is qualitative flow, not a sequence of snapshots. This is not wrong, but it is compatible with the formal picture. The Markov-sufficient summary is exactly the cognitive act Bergson describes: a compression of the flow into a structure we can reason about. The question is whether this compression loses something essential. In a deterministic automaton, it loses nothing — the state is informationally complete. In lived experience, as Bergson insists, something is always lost: the qualitative character of duration, the interpenetration of moments. The formal model captures the structure; it does not capture the experience.

## One structure, three aspects

The claim is not that philosophy reduces to automata theory. It is that the same structural pattern — traces through a state space with Markov-sufficient summaries — appears wherever state, time, and event appear together. McTaggart's time series, Prior's tense logic, Whitehead's actual occasions, Mealy machines, Markov chains, and coalgebras are all instances of this pattern. They differ in what they take the state space to be (physical configurations, propositions, occasions, abstract sets) and in what they take transitions to be (causal influence, logical entailment, creative advance, input-driven steps). But the architecture is the same: states summarize, events transition, time orders.

This matters because it means you cannot have any one of the three without the others. A state with no possible transitions is not a state — it is a fixed point, outside time. An event with no states to connect is not an event — it is an ungrounded happening. Time with no states or events is an empty parameter with nothing to order. The three concepts are co-constituted. They are aspects of a single structure: the trace.


---

<!-- source: archive/library/metaphysics/archive/relationality-repo/western/texts/state-time-and-event.md -->

## Imported source: archive/library/metaphysics/archive/relationality-repo/western/texts/state-time-and-event.md

---
title: "State, Time, and Event"
description: "State, time, and event are not three independent concepts but three views of one structure: traces through a state space where states are Markov-sufficient summaries and events are transitions."
date-created: 2026-04-04
text-type: essay
domain: metaphysics
references:
  - McTaggart, J.M.E. (1908). "The Unreality of Time". *Mind*, 17(68), 457–474.
  - Prior, Arthur. (1967). *Past, Present, and Future*. Oxford University Press.
  - Whitehead, Alfred North. (1929). *Process and Reality*. Macmillan.
  - Davidson, Donald. (1969). "The Individuation of Events". In *Essays on Actions and Events*. Oxford University Press.
  - Kim, Jaegwon. (1976). "Events as Property Exemplifications". *The Journal of Philosophy*, 73(19), 589–603.
  - Rutten, Jan. (2000). "Universal Coalgebra: A Theory of Systems". *Theoretical Computer Science*, 249(1), 3–80.
  - Mealy, George. (1955). "A Method for Synthesizing Sequential Circuits". *Bell System Technical Journal*, 34(5), 1045–1079.
  - Moore, Edward. (1956). "Gedanken-Experiments on Sequential Machines". In *Automata Studies*. Princeton University Press.
  - Kemeny, John & Snell, J. Laurie. (1960). *Finite Markov Chains*. Van Nostrand.
  - Bergson, Henri. (1889). *Time and Free Will*. Dover Publications.
related:
  - ../../../texts/state-time-and-event-survey.md
  - ../../../texts/action-and-change-survey.md
  - ../../../../terms/state.md
  - ../../../../terms/event.md
  - ../../../../terms/time.md
---

State, time, and event look like three concepts. They are one structure seen three ways.

A [state](../../../../../terms/state.md) is a configuration — what holds right now. An [event](../../../../../terms/event.md) is a transition — what happens between configurations. [Time](../../../../../terms/time.md) is the ordering that makes "between" meaningful. Philosophy and mathematics have each developed accounts of these concepts independently, but when you lay them side by side a single pattern emerges: a trace through a state space, where the state carries exactly enough information to determine what can happen next, and events are the steps.

## Three philosophical starting points

McTaggart (1908) distinguished two temporal orderings: the A-series (past, present, future — centered on a moving now) and the B-series (earlier-than, later-than — no privileged moment). His point was that the A-series is necessary for time to be real, yet generates contradiction. What matters here is the structural insight: temporal description requires both a sequence of positions (states ordered by the B-series) and a perspective that distinguishes what is settled from what is open (the A-series). A state machine has both — a current node and a history of transitions behind it.

Prior (1967) formalized the A-series as tense logic: operators F ("it will be the case that") and P ("it was the case that") over propositions. A proposition like Fp ("it will rain") is true now if p holds at some future moment. The key move is that Prior treats temporal facts as modal — they concern what is possible or necessary relative to the present state, not what exists timelessly. Tense logic makes the present state the evaluation point for all temporal claims. The state is not just a snapshot; it is a perspective from which past and future are assessed.

Whitehead (1929) rejected the idea that time is a line on which events sit. For Whitehead, [actual occasions](../theories/process-philosophy/terms/actual-occasion.md) are the basic units of reality — each one comes into being, achieves definiteness, and perishes, becoming data for the next. Time is the creative advance of occasions, not a container for them. An occasion's "state" is its achieved satisfaction — the result of its becoming. This is closer to the automata-theoretic picture than it first appears: each occasion is a transition that produces a new configuration, and the configuration is exactly what subsequent occasions inherit.

## Three formal accounts

Automata theory provides the clearest formal model. A Mealy machine (1955) is a tuple (S, I, O, δ, λ) — states S, inputs I, outputs O, a transition function δ: S × I → S, and an output function λ: S × I → O. A Moore machine (1956) is similar but the output depends only on the state: λ: S → O. In both, the state is what the machine remembers between transitions. The event is the pair (input, transition). Time is the index over the sequence of transitions.

The state does one specific job: it screens off the past. Given the current state, you do not need the history of how the machine arrived there to determine what happens next. This is the Markov property, named for its probabilistic formulation but present in deterministic automata too. A Markov chain (Kemeny & Snell, 1960) makes this explicit: P(Xₙ₊₁ | Xₙ, Xₙ₋₁, ..., X₀) = P(Xₙ₊₁ | Xₙ). The state is a sufficient summary — it compresses the entire past into whatever structure the future needs.

Coalgebra (Rutten, 2000) generalizes this. A coalgebra for a functor F is a pair (S, c: S → F(S)). The state space S is observed through the structure map c, which tells you what you can see from a state and where you can go. Two states are bisimilar if no sequence of observations can distinguish them. This is the deepest formulation of what a state is: not a list of properties, not a node in a graph, but an equivalence class under observational indistinguishability. Two systems with completely different internal structures can have the same states, coalgebraically, if they behave identically from the outside.

## The convergence

These traditions — philosophical and formal — converge on a single picture:

**State** is a Markov-sufficient summary. It carries exactly enough information to determine what transitions are possible and what observations can be made. It screens off the past. In McTaggart's terms, the state is the B-series position from which the A-series (settled past, open future) is evaluated. In Whitehead's terms, it is the achieved satisfaction of the perished occasion — the data inherited by what comes next.

**Event** is a transition between states. Kim (1976) defined an event as [object, property, time] — a property exemplification. Davidson (1969) individuated events by their causes and effects. Both reduce to the same thing when formalized: an event is a step in the trace, a pair (state-before, state-after), possibly triggered by an input. What Kim calls "property exemplification" is the state-after. What Davidson calls "causes and effects" are the predecessor and successor transitions in the trace.

**Time** is the ordering over the trace. The B-series is the total order of transitions. The A-series is the partition of the trace into the settled prefix (past), the current state (present), and the open suffix (future). Prior's tense logic evaluates temporal propositions relative to the current state — exactly the evaluation semantics of a state machine.

## The state/event distinction

States persist; events happen. This is the folk distinction, and it holds up formally. A state is a node — the machine stays in it until an input arrives. An event is an edge — it occurs and is done. But the distinction is relative to granularity. What looks like a persisting state at one level (a chess game "in progress") is a sequence of events at a finer level (individual moves). What looks like an instantaneous event at one level (a legal ruling) is a persisting process at a finer level (deliberation, drafting, announcement).

Bergson (1889) argued that states are cognitive acts — freezings of continuous duration that we perform in order to reason. Real time is qualitative flow, not a sequence of snapshots. This is not wrong, but it is compatible with the formal picture. The Markov-sufficient summary is exactly the cognitive act Bergson describes: a compression of the flow into a structure we can reason about. The question is whether this compression loses something essential. In a deterministic automaton, it loses nothing — the state is informationally complete. In lived experience, as Bergson insists, something is always lost: the qualitative character of duration, the interpenetration of moments. The formal model captures the structure; it does not capture the experience.

## One structure, three aspects

The claim is not that philosophy reduces to automata theory. It is that the same structural pattern — traces through a state space with Markov-sufficient summaries — appears wherever state, time, and event appear together. McTaggart's time series, Prior's tense logic, Whitehead's actual occasions, Mealy machines, Markov chains, and coalgebras are all instances of this pattern. They differ in what they take the state space to be (physical configurations, propositions, occasions, abstract sets) and in what they take transitions to be (causal influence, logical entailment, creative advance, input-driven steps). But the architecture is the same: states summarize, events transition, time orders.

This matters because it means you cannot have any one of the three without the others. A state with no possible transitions is not a state — it is a fixed point, outside time. An event with no states to connect is not an event — it is an ungrounded happening. Time with no states or events is an empty parameter with nothing to order. The three concepts are co-constituted. They are aspects of a single structure: the trace.

## See also

- [State, Time, and Event: A Survey of Substance and Process Accounts](../../../../../texts/state-time-and-event-survey.md) — broader survey covering more traditions
- [Action and Change](../../../../../texts/action-and-change-survey.md) — the substance/process debate on what is more fundamental
- [State](../../../../../terms/state.md) — term definition
- [Event](../../../../../terms/event.md) — term definition
- [Time](../../../../../terms/time.md) — term definition
- [Actual Occasion](../theories/process-philosophy/terms/actual-occasion.md) — Whitehead's fundamental unit
