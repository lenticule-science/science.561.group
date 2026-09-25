---
title: "Action and Change"
description: "Action is change attributed to an agent — requiring both causal structure (something changed) and normative structure (someone is responsible). A survey of philosophical and formal foundations."
date-created: 2026-04-04
text-type: survey
claim: "Action is change attributed to an agent. It requires both a causal structure and a normative structure."
references:
  anscombe1957:
    authors:
      - G. E. M. Anscombe
    title: Intention
    publication: Basil Blackwell
    year: 1957
  davidson1980:
    authors:
      - Donald Davidson
    title: Essays on Actions and Events
    publication: Oxford University Press
    year: 1980
  bratman1987:
    authors:
      - Michael Bratman
    title: Intention, Plans, and Practical Reason
    publication: Harvard University Press
    year: 1987
  whitehead1929:
    authors:
      - Alfred North Whitehead
    title: Process and Reality
    publication: Macmillan
    year: 1929
  harel1984:
    authors:
      - David Harel
      - Dexter Kozen
      - Jerzy Tiuryn
    title: Dynamic Logic
    publication: MIT Press
    year: 2000
    note: Originally Harel 1979; canonical treatment 2000
  mccarthy1969:
    authors:
      - John McCarthy
      - Patrick Hayes
    title: Some Philosophical Problems from the Standpoint of Artificial Intelligence
    publication: Machine Intelligence 4
    year: 1969
  reiter2001:
    authors:
      - Raymond Reiter
    title: "Knowledge in Action: Logical Foundations for Specifying and Implementing Dynamical Systems"
    publication: MIT Press
    year: 2001
  fikes1971:
    authors:
      - Richard Fikes
      - Nils Nilsson
    title: "STRIPS: A New Approach to the Application of Theorem Proving to Problem Solving"
    publication: Artificial Intelligence
    year: 1971
cites:
  - Metaphysics
  - Physics
---

The wind blows a door shut. A person closes the door. In both cases the door changes state. The difference is that only the second is an action. Action is change attributed to an agent — it requires both a causal structure (something changed) and a normative structure (someone is responsible). This text surveys the traditions that built that understanding and the formal systems that encode it.

## Philosophy of action

Anscombe's *Intention* (1957) established that an action is not a special kind of bodily movement but an event under a description. The same arm-raising is a stretch, a vote, or a signal depending on what the agent knows they are doing. An action is intentional under the descriptions the agent could give if asked "why?" — descriptions that reveal practical reasoning, not mere cause. This is why the wind cannot act: not because it lacks force, but because it lacks descriptions under which it does what it does knowingly.

Davidson's *Essays on Actions and Events* (1980) added causation to intention. Reasons — belief-desire pairs — are causes of bodily movements, and those caused movements are actions. Davidson solved the problem of wayward causal chains (a climber's nervousness causes him to loosen his grip, killing his partner — caused by a reason but not done for that reason) by requiring that the causal chain proceed "in the right way." The right way is left unanalyzed, which is the theory's honest gap.

Bratman's *Intention, Plans, and Practical Reason* (1987) extended both accounts to temporally extended agency. Agents do not simply desire and act. They form plans — partial, hierarchical structures that constrain future deliberation. A plan to write a book commits you to writing chapters, which commits you to writing sentences. Plans are not predictions; they are practical commitments that coordinate your future self. This is planning agency: the capacity to bind present action to future structure.

## Theory of change

Aristotle's *Physics* (Books III-IV) distinguishes four types of change (*metabole*): generation (coming to be), corruption (ceasing to be), alteration (change of quality), and locomotion (change of place). His *Metaphysics* (Book IX) grounds change in the act/potency distinction: *dunamis* is what a thing can do or become; *energeia* is its actual doing or being. Change is the actualization of a potentiality qua potential. The acorn becomes the oak not by accident but by realizing what it already was in capacity.

Process philosophy inverts this. For Whitehead (*Process and Reality*, 1929), there are no persistent substances that undergo change. There are actual occasions — momentary acts of becoming that constitute themselves through [prehension](../../../../../../../../../content/text/glossary/terms/prehension.md) and perish into data for their successors. Change is not something that happens to things. Things are patterns that emerge from sustained change. The [event](../domains/process-philosophy/terms/event.md) is ontologically prior to the object.

The event calculus (Kowalski and Sergot, 1986) formalized this for reasoning systems: events initiate and terminate fluents (time-varying properties). A fluent holds from the time an initiating event occurs until a terminating event occurs. Change is the transition between fluent-states, caused by events. This is the formal distillation of what Aristotle described and Whitehead radicalized.

## Formal action theory

Dynamic logic (Harel, 1979) treats actions as program-like operators on states. The formula `[a]φ` means "after every execution of action *a*, φ holds." Actions compose sequentially (*a;b*), branch conditionally (*a ∪ b*), and iterate (*a\**). This gives action the structure of computation: preconditions, postconditions, nondeterminism, termination.

The situation calculus (McCarthy and Hayes, 1969; Reiter, 2001) models the world as a sequence of situations connected by actions. A situation is a complete snapshot. An action transforms one situation into the next. Successor-state axioms specify how each fluent changes (or persists) through an action, solving the frame problem: what does *not* change when something happens?

STRIPS planning (Fikes and Nilsson, 1971) operationalized this for AI. An action has preconditions (what must hold), add effects (what becomes true), and delete effects (what ceases to hold). Planning is search through the space of action sequences that transform an initial state into a goal state. This is the engineering face of the philosophy: action as state transformation with explicit attribution.

## Agency: acting versus merely changing

All three traditions converge on a distinction. Change is ontologically widespread — rocks erode, stars collapse, rivers shift course. Action is change with a particular structure: it is done by someone, for reasons, under descriptions. The formal systems encode this by requiring an agent parameter: `do(agent, action, situation)` in the situation calculus, actor fields in event records. The philosophical traditions explain *why* the parameter matters: without it, you have physics, not ethics; explanation, not responsibility; prediction, not planning.

This is why a system that tracks change needs both events (what happened) and actors (who did it). The event record captures the causal structure — the state transition, the before and after. The actor field captures the normative structure — who is responsible, who can be asked "why?", whose plan this action belongs to. Drop either and you lose something essential. Drop the event and you have intention without effect. Drop the actor and you have effect without accountability.

## See also

- [Act](../../../../../terms/act.md) — the term definition grounding act in energeia and composition
- [Event](../domains/process-philosophy/terms/event.md) — the process-philosophical unit of becoming
- [Process](../domains/process-philosophy/terms/process.md) — becoming as ontologically prior to being
- [Action and Change: A Survey of Substance and Process Accounts](../../../../../../../../../content/text/documents/articles/notes/action-and-change-survey.md) — the longer survey covering both traditions in depth

## Earlier material

- [Act](../../../../../../../../../../../terms/act.md) — the term definition grounding act in energeia and composition
- [Event](../../../../../../../../../content/text/theories/process-philosophy/terms/event.md) — the process-philosophical unit of becoming
- [Process](../../../../../../../../../content/text/theories/process-philosophy/terms/process.md) — becoming as ontologically prior to being
- [Action and Change: A Survey of Substance and Process Accounts](../../../../../../../../../content/text/documents/articles/notes/action-and-change-survey.md) — the longer survey covering both traditions in depth
