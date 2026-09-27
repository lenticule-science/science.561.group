---
id: work
description: "An episode of doing with a defined output — the base concept of which all work types are specializations."
aliases: [ work-unit, Work, work ]
characterized-by: output
types: process, procedure, derivation, inquiry
organized-by: task
composed-in: workflow
governed-by: method
performed-as: practice
date-created: 2026-03-29
restricts: act
extends: thing
params:
  agent: relational-universe
  capacity: relational-universe-morphism
  situation: relational-universe
output: relational-universe
ast:
  capacity-actualization:
    - agent
    - capacity:
        - agent
        - situation
    - result:
        - capacity
        - situation
defines: Work
related: Process, Application, Procedure, Inquiry, Derivation, Activity, Operation
date-modified: 2026-09-27
---

Work is an episode of doing with a defined output: an [act](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/act.md) restricted to episodes with a nameable result. Work is characterized entirely by what it produces, not by what happens inside it. The output may be an artifact, a judgment, a transformed state, or a report that nothing was found — but it must be something nameable. An episode of doing that produces nothing nameable is not work; it is time spent.

This is the base concept. All organized activity is work when it has a defined output. The four types of work — process, procedure, derivation and inquiry — are specializations based on what is known going in: whether the *meaning* of the output is settled and whether the *execution path* to it is settled.

| Work type | Meaning settled | Execution settled |
|-----------|----------------|-------------------|
| [Process](./process.md) | yes | yes |
| [Procedure](./procedure.md) | yes | no |
| [Derivation](./derivation.md) | no | yes |
| [Inquiry](./inquiry.md) | no | no |

 Work that has a documented, repeatable [method](../../../../../../../../content/text/glossary/terms/method.md) is skillful work. Work that does not yet have a method is ad-hoc — it may become skillful when someone writes down how to do it.

A work unit is a concrete instance of work: it names what it acts on (domain), which aspect changes (affected), how the change is produced (operation), and the specific values that make this instance distinct from other instances of the same operation (parameters). A work unit without parameters is a template, not an instance.

Work composes. A [workflow](./workflow.md) is a set of work units with the constraint that the initial input type equals the final output type — the workflow takes something of type X and produces something of type X. A [task](./task.md) is a named planning container for work units with a completion condition. Workflows are algebraic (they compose); tasks are organizational (they group work for planning and tracking).

Work is the thing that [practice](../../../../../../../../content/text/glossary/terms/practice.md) does and [method](../../../../../../../../content/text/glossary/terms/method.md) governs. Practice without work is idle; method without work is shelfware; work without method is improvisation; work without practice is a plan that never executes.

An earlier house definition, from 2020, reads work more broadly: an action that is some sort of craft or study, taken to result in one's survival or growth. The definition here narrows it to episodes with a nameable output, which is what lets work be typed, composed and assessed.

## Formal definition

**Work** is a triple $(a, \kappa, r)$:

$$(a : \mathrm{Agent},\; \kappa : a \vdash \mathrm{Capacity},\; r : \mathrm{Situation})$$

together with a **result** $w = \kappa(a, r) \in \mathrm{Results}$, where:
- $a$ is the **agent** — the entity that works; the agent possesses the capacity $\kappa$ and exercises it; without an agent, there is transformation but not work; the agent is what makes work an act, not merely a change
- $\kappa$ is the **capacity** (or **capability**, or **power**) — what the agent is able to do; $\kappa$ is the agent's potential, the general power that the work actualizes; a capacity that is never exercised is a dormant power; work is the exercise of $\kappa$ in situation $r$
- $r$ is the **situation** — the circumstances in which the capacity is exercised; the situation provides the material, the context, and the occasion for work; work is always situated — there is no work in a vacuum, only capacities waiting for situations to actualize them
- $w = \kappa(a, r)$ is the **result** — what the work produces; the result is the work's contribution to the world; it may be a transformed artifact, a judgment, a service rendered, a message sent, or a state changed; the result is what distinguishes a completed work from an abandoned or blocked attempt

**Two invariants.** $(a, \kappa, r)$ constitutes work iff:

1. **Actualization**: the capacity $\kappa$ is actually exercised in situation $r$ — not merely present, not merely applicable, but enacted. The work is the event of actualization, not the capacity's existence. This distinguishes a completed work from a capability: the capability "can paint" exists before and after the painting; the work is the specific act of painting. Actualization is the passage from potentiality ($\kappa$ possessed) to actuality ($\kappa$ exercised in $r$).

2. **Agent attribution**: the work is attributable to $a$. The result $w$ comes from $a$'s exercise of $\kappa$, not from the situation $r$ acting on itself or from $\kappa$ acting without $a$. Attribution is what makes work different from mere process: a process (in the automata/coalgebra sense) can proceed without an agent; work requires one. Attribution is the condition that makes work assessable — one can ask whether $a$ did good work, whether $a$ applied $\kappa$ skillfully, whether $a$ was responsible for the result.

## Aristotle: ergon, poiesis, and praxis

Aristotle distinguishes three forms of activity (*Nicomachean Ethics* I.1, VI.4-5; *Metaphysics* IX.6-8):

**Poiesis** (ποίησις) — **production**: activity whose end is external to itself. Poiesis aims at a product (ἔργον, ergon): a work that exists independently of the activity that produced it. The carpenter's activity ends when the house is built; the house is the ergon. Poiesis is the archetype of what is called "work" in the productive sense: the actuation of a skill (τέχνη, technē) to produce an artifact.

**Praxis** (πρᾶξις) — **action**: activity whose end is internal to itself, in the activity. The virtuous person acts virtuously for the sake of virtuous activity; the act does not terminate in an external product. Praxis is not less "work" than poiesis — it is a different kind of activity, one that constitutes the agent rather than producing a separate artifact.

**Energeia** (ἐνέργεια) — **actuality**: the state of being fully at work, as opposed to potentiality (δύναμις). Aristotle's analysis: a capacity is a δύναμις; an exercise of the capacity is an ἐνέργεια. Work (in the formal sense) is ἐνέργεια — the actualization of a δύναμις.

The **ergon** (ἔργον) of an entity is its proper function or characteristic activity — what the entity does by virtue of what it is. The ergon of a knife is to cut; the ergon of a physician is to promote health; the ergon of a human (for Aristotle) is rational activity in accordance with virtue. The ergon argument (*Nicomachean Ethics* I.7) infers the good of an entity from its characteristic activity: the good of a knife is sharp cutting; the good of a physician is health promotion.

The concept of work in this formal framework inherits the Aristotelian structure: every work is the exercise of an ergon — an agent exercising its characteristic capacity in a situation. The result of the work is the ergon's product.

## Goldman: act individuation

Alvin Goldman (*A Theory of Human Action*, 1970) addresses the **individuation problem** for acts: when are two act-descriptions descriptions of the same act, and when are they descriptions of different acts?

Goldman's answer: acts are property exemplifications — an agent $a$ performing act $A$ is $a$'s exemplifying the action property $A$ at a time $t$. Two act-descriptions "raising my arm" and "signaling for a turn" may describe the same act-token (the same event) or different act-tokens (if the arm-raise and the signal are temporally separate). Goldman's **level-generation** relation: act $B$ is level-generated by act $A$ (in context $C$) iff doing $A$ in $C$ constitutes doing $B$. Signing a check (at the right time, in the right context) level-generates paying a debt.

Level-generation is not causation: it is a constitutive relation. The signing does not cause the paying; it is the paying, given the context. Goldman's account makes work individuation context-dependent: whether an exercise of a capacity is one work or many depends on the contextual relations that generate higher-level descriptions from lower-level ones.

## Davidson: the causal structure of action

Donald Davidson (*Actions, Reasons, and Causes*, 1963; *Essays on Actions and Events*, 1980) argues that actions are **events** — spatiotemporally located particulars — and that reasons are causes of actions. An agent's reason for acting (the combination of a pro-attitude toward a type of action and a belief that the action to perform is of that type) causes the action event.

For work: the causal structure means that work is not merely an event with the right output; it must be caused in the right way by the agent's intentions. A work that produces the right result accidentally (by luck or misdirection) is not the same work as one that produces it intentionally. The agent's reasons — why they exercised the capacity, what they were trying to achieve — are part of the work's causal history and part of its evaluation.

Davidson's **anomalous monism**: mental events (intentions, beliefs, desires) and physical events (bodily movements, computational state changes) are the same events, but described in different vocabularies. This means the "capacity" $\kappa$ in the formal definition can be understood both as a computational/physical capacity (what the agent can do) and as an intentional capacity (what the agent can mean to do).

## Work in physics and computation

**Physical work** (Carnot, Joule, Helmholtz, 19th century): in classical mechanics, work is the transfer of energy by force. If a force $F$ acts on an object displaced by $\vec{d}$, the work done is $W = \vec{F} \cdot \vec{d}$ (the dot product). Work is a scalar quantity measuring energy transfer. The **work-energy theorem**: the net work done on an object equals the change in its kinetic energy $\Delta KE = W_\mathrm{net}$.

Physical work formalizes the intuition that effort applied in a direction produces change in that direction. Effort applied perpendicular to the displacement does zero work — the force is there, but the direction doesn't match, and no energy is transferred. This gives a rigorous meaning to "doing useful work": the component of effort aligned with the desired change.

**Computational work**: in distributed systems and operating systems, a **work unit** (job, task, computation) is a self-contained piece of computation: it has defined inputs, a defined operation to perform, and produces a defined output. Job scheduling is the allocation of computation resources to work units. Work in this sense is the instantiation of an operation with actual inputs in an actual execution environment — exactly the actuation structure of the formal definition.

**Kleisli morphisms and effectful work**: in category theory, a **Kleisli morphism** $f : A \to TB$ in the Kleisli category of a monad $T$ represents a computation that produces a value of type $B$ from an input of type $A$, with possible effects encoded in $T$ (non-determinism, state, I/O, exceptions). Kleisli morphisms compose: $(g \circ_T f)(a) = \mu(T g(f(a)))$ where $\mu$ is the monad multiplication. Work as a Kleisli morphism is the formal treatment of effectful computation: not just pure function application, but application with side effects — transformations that consume resources, produce effects, and may fail.

## Open questions

- Whether the level-generation relation (Goldman) is an order on the works that can be performed from a given capacity in a given situation — whether level-generated acts form a partial order (level generation is transitive and antisymmetric) and whether this order corresponds to the fiber order in the relational history.
- Whether Davidson's causal requirement (the right causal history from intention to action) is formalizable in the nuclear framework — whether "caused in the right way by the agent's intention" corresponds to the work's proposition being meaning-settled ($\sigma_t$-fixed) as well as execution-settled ($\Delta_t$-fixed), so that accidental results are those in $\mathrm{Fix}(\Delta_t) \setminus \mathrm{Fix}(\sigma_t)$.
- Whether there is a category of works — with works as morphisms (an agent applying a capacity to a situation) and situations as objects — and whether composition of works (sequential work, then work on the output) forms a proper category (with associativity and identity).
- Whether physical work ($W = \vec{F} \cdot \vec{d}$) and computational work (Kleisli morphism execution) can be unified under the formal definition — whether both are instances of the same abstract structure and whether the work-energy theorem has an analogue in the category of Kleisli morphisms.
