---
name: State
date-created: 2026-03-04
type: definition
aliases:
  - states
extends: thing
belongs-to: thing
composed-of:
  - condition
condition-is: quality
contrasts-with:
  - change
  - process
changes-via: act
transitions-to: state
references:
  harel1987:
    authors:
      - David Harel
    title: "Statecharts: A Visual Formalism for Complex Systems"
    year: 1987
    publication: Science of Computer Programming, 8(3)
  bergson1889:
    authors:
      - Henri Bergson
    title: "Time and Free Will: An Essay on the Immediate Data of Consciousness"
    year: 1889
  barwise-perry1983:
    authors:
      - Jon Barwise
      - John Perry
    title: Situations and Attitudes
    year: 1983
    publication: MIT Press
description: "The composite of all conditions defining a thing at a given moment — from static snapshots through Harel's state machines to Bergson's duration."
date-modified: 2026-04-06
visibility: public
---


A ***state*** is (definition:: the composite of all [condition|conditions](condition|conditions), or specific [quality|qualities](quality|qualities), that define a [thing](thing) at any given [moment](moment) in [time](time))

A state is the composite of all [conditions](./condition.md) that define a [thing](./thing.md) at a given moment. It is what you would know about something if you had a complete, instantaneous snapshot of it right now.

A patient's state includes their blood pressure, body temperature, recent symptoms, current location, and every other measurable fact about them at that moment. A chess game's state is the position of every piece on the board plus whose turn it is. A trial's state is its position in procedure: discovery phase, trial, appeal, concluded. The state is the whole picture of a thing as it is now.

## Snapshot and configuration

The most straightforward account of state treats it as a snapshot: a specification of all [qualities](./quality.md) a thing has at a single moment. This works well when systems are simple or when you care only about a narrow set of properties. In chess, you do not describe the ambient temperature or the players' thoughts — you describe the board. The state is complete-for-its-purpose, though incomplete in absolute terms.

But a snapshot is not the only way to understand state. David Harel's statecharts (1987) offer a more powerful account: a state is a node in a graph, defined not by the qualities present at a moment but by which transitions are possible. A traffic light's state is "green" not because of properties you can observe, but because green lights transition to yellow and only yellow. A chess game in "white to move" is that state precisely because the next legal transition will leave it in the state "black to move." The state is defined by its neighbors.

This distinction matters. A snapshot tells you what is. A state machine tells you what can happen next. In statecharts, states can be nested (a trial can be "in progress, awaiting testimony, pre-verdict" simultaneously) and can have orthogonal regions (a player's physical condition and the game state can evolve independently). A state machine is a structured configuration of possibilities, not just a list of current properties.

## Partial states and incomplete knowledge

Barwise and Perry's situation theory recognizes a deep fact about real knowledge: you almost never have complete information. A doctor examining a patient does not know everything about them. The clinical assessment is genuinely complete-as-a-situation: "Blood pressure elevated; white count normal; cardiac markers not yet tested." This is not a defective snapshot. It is a partial specification that adequately answers the questions being asked.

A partial state is not a failure of knowledge. It is a genuine and sufficient description with acknowledged gaps. You can reason perfectly well from partial information. The chess player does not know what moves the opponent is considering; the current board position is still a complete state-for-playing. The lawyer preparing a case does not know all the facts that will emerge at trial; the pre-trial legal state is still actionable.

## State and duration

Henri Bergson reverses the picture. In *Time and Free Will* (1889), he argues that states are not natural units of reality. They are cognitive acts — freezings of continuous time that we perform to examine things. Real time is duration (*durée*), qualitative and irreversible. To divide it into discrete timestamped states (opening arguments at 10:00, witness at 11:30, closing at 14:00) is to spatialize time, to treat it as if it were space.

In real duration, the trial is not a sequence of discrete states. It is an unfolding momentum in which past and present are inseparable. The witness's testimony, once given, becomes part of the living past that shapes what comes next. You cannot unmake the words. The trial moves forward in real time; it does not merely fill a sequence of temporal points.

This does not invalidate the snapshot account. Rather, it clarifies what snapshots are: useful abstractions from an underlying flow. When you freeze the trial at 11:30 to say "the witness has just testified," you have carved a state from the flow. The state is a legitimate thing to identify — it lets you reason about logical transitions and evidence. But it is not the whole story. The state is real; the duration is also real. They answer different questions.

## Composition and connections

A state is composed of [conditions](./condition.md). Each condition is a [quality](./quality.md) at a given moment. A person in the state "healthy" has the condition of normal blood pressure, the condition of normal temperature, and dozens of other conditions. An object in the state "broken" has the condition of fracture, the condition of immobility, the condition of non-functionality.

Conditions change. A [change](./change.md) is a transition from one state to another. A [process](../../business/terms/process.md) is a directed sequence of states linked by causes. An [event](./event.md) is a state transition marked at a specific [time](./time.md). Time makes all of this possible — without moments, there can be no snapshot; without flow, there can be no change between states.
