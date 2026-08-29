---
title: "Observation"
description: "A witnessed, empirically grounded fact: a local section of an Accord type at some history t. Observations provide the backing that allows a Proposition to nucleate toward a fixed point."
defines: Observation
instance-of: act
produces: evidence
acts-on: entity
enables: grounding
supports: Proposition
uses: Accord
describes: Entity
component-of: accord
fiber-of: accord
base: t
element-of: accord
date-created: 2026-03-18
date-modified: 2026-03-19
---


## Formal definition

An **Observation** is a triple $(F, t, x)$:

$$\text{Observation} = (F : T^{\mathrm{op}} \to \mathbf{Set},\; t \in T,\; x \in F(t))$$

where:
- $F$ is the **Accord** — the sheaf type of which this observation is an instance
- $t \in T$ is the **history** at which the observation was witnessed
- $x \in F(t)$ is the **section** — the concrete witnessed datum

**Monotonicity.** Observations accumulate: once $x \in F(t)$ is witnessed, it restricts to $F(f)(x) \in F(s)$ for all $f : s \to t$ ($s \leq t$) and is never retracted. The history $T$ grows monotonically; observations do too.

**Grounding a Proposition.** An Observation $(F, t, x)$ backs a Proposition $P \in H_t$ when $x$ is a witness that $P$ is the correct nuclear evaluation of the claim. Formally: the Accord $F$ is the evidence type for $P$, and $x \in F(t)$ certifies that the grounding condition $\sigma_t(P) = P$ is warranted. Without an Observation, $P$ can only be inferred from other settled propositions; with one, it has direct contact with the system's state at $t$.

**Sheaf condition.** A family of observations $\{(F, t_i, x_i)\}$ **coheres** iff the family is a matching family for $F$: $F(f)(x_j) = x_i$ for all $f : t_i \to t_j$. A matching family has a unique amalgamation $x \in F(t)$ — the global observation that all local observations collectively witness.

## What this is

An **Observation** is a witnessed fact — a local section $F(t)$ of an Accord type $F$ at some history $t$.

An Observation is not a claim about what is true.
It is evidence: something that was witnessed, measured, or recorded — something that grounds a Proposition by providing backing in the actual structure of the system.

An Observation is to a Proposition what a local section is to a sheaf element: the concrete, history-specific datum that the nucleus can evaluate against the fiber's global structure.

## The four primitives

Observation is one of four ontological primitives:

| Primitive | What it is | Role in R |
|---|---|---|
| [Entity](entity.md) | Named, addressable individual | Node |
| Relation | Named connection | Edge label — itself a node |
| Proposition | Truth-evaluable claim in H_t | Element acted on by nuclei |
| Observation | Witnessed fact — local section F(t) | Backing that nucleates a Proposition |

Observations are what the system accumulates as history grows.
Every step $t \to t'$ adds new Observations to the fiber.
The nucleus evaluates whether those Observations settle into stable Propositions.

## How Observations differ from Propositions

A **Proposition** says: "P is the case" — it is a claim with truth conditions.
An **Observation** says: "this was witnessed at $t$" — it is a grounded record with no normative force by itself.

The connection: an Observation provides content-backing for a Proposition.
When a Proposition P has an Observation O such that O is a local section of P's Accord type, the content-backing condition of [grounding](grounding.md) is met.
The nucleus can then evaluate whether $\sigma(P) = P$ — whether P settles to a fixed point.

Without Observation backing, a Proposition can only be inferred from existing settled Propositions.
With Observation backing, a Proposition has direct contact with the actual state of the system at history $t$.

An Observation MUST be grounded at a specific history $t$ — an Observation without a history is not an Observation.
An Observation MUST NOT be confused with a Proposition — an Observation does not claim; it records.
Observations MUST accumulate monotonically — they are never retracted once witnessed.

## In the FARS

In a FlatfileAgentialResourceSystem, Observations appear as:

- **MEMORY.md entries**: things witnessed during a session — not claims about what should be true, but records of what was found to be true
- **Settled GroundingClaim records**: the completed evaluation of a grounding Proposition; the claim has been witnessed to hold
- **Body content in math/ or spec/ files**: descriptions of mathematical constructions that have been verified to behave as claimed
- **Test results, run outputs**: empirical records of what a system did under specific conditions

Observations accumulate; they are never retracted (history is monotone).
A Proposition backed by an Observation at history $t$ retains that backing at all $t' \geq t$.

## In the distributed machine

In the DistributedRelationalMachineRuntime, an Observation is a row in the `accord_sections` table: a concrete `(accord_id, history_id, section_data)` triple.
The Engine reads these rows; the nucleus evaluates whether the section participates in a compatible family (a global section).
A section that participates in a global section is a settled Observation — the accord condition holds.

## Open questions

