---
title: Condition
description: "A specific quality of a thing at a given moment — a quality indexed by time."
defines: condition
aliases: [conditions]
component-of: [state]
date-created: "2026-03-04"
date-modified: "2026-04-03"
references:
  - id: aristotle-categories
    type: document
    title: Categories
    note: Chapter 8; quality as inhering in substances at moments
    author:
      - literal: Aristotle
  - id: barwise-perry-situations
    type: document
    title: Situations and Attitudes
    note: Chapter 2; infons and conditions in situations
    author:
      - literal: Jon Barwise
      - literal: John Perry
    issued:
      - year: 1983
  - id: bergson-duration
    type: document
    title: Time and Free Will: An Essay on the Immediate Data of Consciousness
    note: Chapter I; the qualitative heterogeneity of duration
    author:
      - literal: Henri Bergson
    issued:
      - year: 1889
  - id: whitehead-process-reality
    type: document
    title: Process and Reality
    note: Part III; actual occasions and their achieved satisfactions
    author:
      - literal: Alfred North Whitehead
    issued:
      - year: 1929
---

A condition is a specific [quality](./quality.md) of a [thing](./thing.md) at a given moment.
It is [quality](./quality.md) indexed by time.
A patient's temperature at 3pm is a condition.
A bridge's structural integrity after the earthquake is a condition.
A task's status right now is a condition.
A condition is not the quality itself (which a thing can have timelessly) and not [state](./state.md) (which is the composite of all conditions at once).
A condition is one quality, at one moment.

## What a condition is

A condition answers: what is the state of one specific aspect of this thing, right now?

Compare three concepts: - **Quality** is timeless: redness, hardness, being-circular.
A thing *can have* a quality; the quality itself persists across time and across different things.
The concept of redness does not change when a ball repaints itself. - **Condition** is temporalized quality: the temperature of this patient right now, the color of this car today, the alertness of this guard at midnight.
Conditions are tied to moments.
The same thing can have different conditions at different moments while maintaining the same underlying quality-capacity.
A person's temperature is 98.6°F right now; it was 99.2°F yesterday.
Both are conditions.
The underlying capacity-to-have-temperature is a quality; the actual temperature at this moment is a condition. - **State** is the composite of all conditions at once.
The state of a chess game is the position of all pieces at a single moment.
The state of a patient is the complete clinical profile: temperature, blood pressure, alertness, digestion, immune status, all indexed to now.
A thing's state is the bundle of all its conditions at a single time.

Change one condition — a person's mood shifts — and you change the state.
But the underlying qualities remain: the person's capacity-for-mood is unchanged; only the condition (what mood right now?) shifts.
Similarly, a cup remains a cup (its quality) whether it is full of water or empty or full of milk (its conditions).

## Conditions as prerequisites

In logic and practical reasoning, a "condition" means something must be true for something else to follow.
This is the conditional sense: "if P is a condition for Q, then Q cannot obtain unless P is satisfied."

These are preconditions, postconditions, and guard conditions.

A **precondition** is a condition that must hold before an action can proceed.
Before you can graduate (Q), you must have passed all required courses (P).
P is a precondition.
The state of being-having-passed-courses is a condition — it is the holding of a certain quality (having satisfied the degree requirement) at a moment in time.

A **postcondition** is a condition that must hold after an action completes.
After surgery (action), the patient's vital signs must stabilize (postcondition).
The state of having-stabilized-vital-signs is a condition.

A **guard condition** is a condition that, if it holds, permits or forbids a transition.
In a state machine, a transition from "waiting" to "processing" might be guarded by the condition "queue-is-not-empty."
If the queue is empty, the condition fails and the transition is blocked.

These are all instances of the same pattern: a condition is a quality-at-a-moment that acts as a constraint on what can happen next.
The "condition of the roads" (quality-indexed-to-now) determines whether you can proceed.
The "condition of your finances" (assets, debts, income, all at this moment) determines what you can afford.

## Conditions compose into states

A thing's state is the composite of all its conditions at a single moment.

Consider a patient in a hospital.
At 10:00am Wednesday: - Temperature is 98.6°F (a condition) - Blood pressure is 120/80 (a condition) - White blood cell count is normal (a condition) - Reported pain level is 3 (a condition) - Alertness is clear (a condition)

The patient's *state* at 10:00am is the integration of all these conditions: {temp 98.6, BP 120/80, WBC normal, pain 3, alert}.
This is complete-as-a-state.
It describes the patient's situation fully for clinical purposes.

Change one condition — temperature rises to 101°F at 2:00pm — and the state changes.
It is now {temp 101, BP 128/82, WBC elevated, pain 5, lethargic}.
Same patient, different state.
The state is the snapshot of all conditions at a given moment.

Conditions compose because they are *dimensions* of state.
A thing's state is multidimensional: its position, its motion, its internal energy, its relations to nearby things.
Each dimension (each quality being instantiated at this moment) is a condition.
The full state is the configuration of all conditions.

This is why Whitehead calls the achieved definiteness of an actual occasion its "satisfaction": an occasion comes into being, realizes a particular bundle of conditions (achieves definiteness), and then perishes.
The satisfaction *is* the set of conditions that the occasion actualizes.
Change what conditions are realized, and you change what the occasion *is*.

## Process view: conditions as freeze-frames

Henri Bergson distinguishes real time (durée) from spatialized time.
Real time is continuous, qualitative, flowing, irreversible.
When you represent time as a sequence of moments, you spatialize it: you treat time like a line marked with points.

A condition is a freeze-frame.
It is real time arrested at a moment, asking: what is the configuration right now?

From this view, conditions are *abstractions from becoming*.
A person is in a continuous process of change: their emotions flow, their thoughts develop, their body regenerates.
At any moment you slice through this flow, you find a condition — a configuration of qualities at that instant.
But the condition is not what is *really happening*.
The condition is a snapshot of an ongoing process.

This matters because it means conditions are never complete descriptions of actual change.
To understand real change, you must understand the flow of conditions — the continuous transformation from one condition to the next.
A person's emotional condition might shift from sadness to relief, but the *real change* is the continuous becoming between those states, the qualitative transformation that cannot be captured in snapshots alone.

Conversely, Whitehead says each actual occasion *comes into being* by integrating influences from prior occasions and realizing a definite set of conditions.
The occasion does not sit on time like a snapshot; it *creates* time.
The condition (the satisfied actualization) is not a freeze-frame of something more real; it is the most real thing there is — it is the occasion's achievement.
Conditions, in Whitehead's account, are the basic data of reality.
They are not abstractions from something deeper; they are the fundamentals from which persistent things are constructed.

Both views agree on the same point: a condition is a quality instantiated at a moment, indexed by time.
They disagree on whether the moment is primary (Whitehead) or the flow between moments is primary (Bergson).
But in either case, conditions matter: they are how we describe what is real at a given moment.

## Conditions and infons in situation theory

Jon Barwise and John Perry's situation theory, developed in *Situations and Attitudes* (1983), uses conditions to formalize what is true in a situation.

A situation is a partial specification of how things are at a location and time.
A situation consists of infons — basic units of information.
An infon is a condition: "the board is in stalemate," "the patient's oxygen saturation is 95%," "the trial is awaiting the judge's ruling."

An infon is true in a situation if that condition actually obtains.
The situation at the chess club at 6:00pm Tuesday might support the infon "White is in check" (true in that situation) and also support "Black's king is on e4" (true).
It might not support "The game is checkmate" (false in that situation; it is only check).

Infons are explicitly indexed by location-time parameters.
"The situation at location-L and time-T supports the infon X" means: at L and T, the condition specified by X actually holds.
This is more precise than propositional logic, which treats propositions as globally true or false.
In situation theory, a condition can be true in one situation (at 10am) and false in another (at 4pm), and both are fully accurate descriptions.

The power of this framework is that it formalizes what is already implicit in practical reasoning: we describe situations in terms of conditions (what holds right now, here), not in terms of eternal truths.
The condition "the patient's fever is breaking" is true in the situation of 2pm Tuesday but not in the situation of 8am Tuesday.
Both descriptions are complete and accurate; they describe different situations.
