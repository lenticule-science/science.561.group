---
name: Process
identity: process
description: Work whose meaning and execution are both settled — a fully determined transformation that gives the same output for the same input, with no decisions, conditions or judgment.
aliases:
  - processes
date-created: 2026-03-19
date-modified: 2026-09-27
meaning-settled: true
execution-settled: true
instance-of: work
contrasts-with: procedure, derivation, inquiry
composes-into: workflow
relations:
  instance-of: work
  contrasts-with:
    - procedure
    - derivation
    - inquiry
  properties:
    - meaning-settled=true
    - execution-settled=true
---
A process is work whose meaning and execution are both settled: a fully
determined transformation. Given the same input it always produces the same
output. There are no decisions to make, no conditions to evaluate and no
branches to take. This is what "process" means in business process
management (ISO 9000), formal methods and manufacturing: a transformation
whose whole behaviour is fixed by its specification before it runs.

In the everyday sense a process is a sequence of acts, usually on the same
things and toward the same result, that brings about a change one can
qualify. The work sense narrows that to the sequences whose every step is
already fixed.

A process knows what it is producing (its meaning is settled) and how to
produce it (its execution is settled). That double settlement distinguishes
it from every other kind of work. A [procedure](procedure.md) knows what it
produces but evaluates conditions to choose its path. A
[derivation](derivation.md) knows its path but not what the path will
produce. An [inquiry](inquiry.md) knows neither.

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | **Process** | [Procedure](procedure.md) |
| **Meaning open** | [Derivation](derivation.md) | [Inquiry](inquiry.md) |

Baking with exact measurements and timings, running a build script,
executing a SQL query and multiplying two matrices are processes: in each the
input and the specification together determine the output.

## Properties

**Repeatable.** Running a process twice on the same input gives the same
result. That is what makes processes automatable: anything fully determined
can be handed to a machine without loss. A process needs correct execution,
not judgment, discretion or interpretation.

**Composable.** If process A produces what process B takes as input, A then B
is a process, because the composition of two fully determined transformations
is fully determined. Manufacturing lines, data pipelines and compilation
toolchains work for this reason. Processes compose into
[workflows](workflow.md).

**Failure is a wrong specification.** A process can fail on malformed input,
a broken environment or a missing resource. It cannot produce an unexpected
output from a valid input. If it does, its specification was wrong and it was
never a process.

## Formal definition

The four kinds of work are the four positions of a nuclear quartet: two
commuting closure operators on the algebra of work, meaning-closure $\sigma$
and execution-closure $\Delta$, split it into four canonical parts
([nuclear quartet subalgebra](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nuclear-quartet-subalgebra.md)).
A process is a work element $W$ fixed by both:

$$W \in H^* = \mathrm{Fix}(\sigma) \cap \mathrm{Fix}(\Delta), \qquad \sigma(W) = W,\ \Delta(W) = W.$$

| Kind | Condition | Set |
|---|---|---|
| Process | $\sigma(W) = W$, $\Delta(W) = W$ | $H^*$ |
| Procedure | $\sigma(W) = W$, $\Delta(W) \neq W$ | $\mathrm{Fix}(\sigma) \setminus H^*$ |
| Derivation | $\sigma(W) \neq W$, $\Delta(W) = W$ | $\mathrm{Fix}(\Delta) \setminus H^*$ |
| Inquiry | $\sigma(W) \neq W$, $\Delta(W) \neq W$ | $H \setminus (\mathrm{Fix}(\sigma) \cup \mathrm{Fix}(\Delta))$ |

Because the two closures commute, the joint projection $\pi = \sigma \circ
\Delta$ sends every work element into $H^*$, closing every open question of
meaning and execution: each of the other three kinds becomes a process once
its open questions are answered. A process is a fixed point of $\pi$. The
same positions are sometimes read with $\sigma$ as closure against the past
(what accumulated history forces) and $\Delta$ as closure against the future
(what every forward extension commits to).

## As a skill

A skill declared `closure-kind: process` is a script's contract: identical
output for identical input and no conditional. The house skill schema
requires a process skill to carry a script and refuses it if it also carries
a model or a fuel cap, since nothing in it is open for a model to settle or a
budget to bound. A process skill:

- contains no condition (`if`, `unless`, `when`); a condition means execution
  is not yet settled, and the skill is a procedure;
- may dispatch on a table keyed by an explicit input field, since no
  inference picks the key;
- asks for no inference or judgment; a step that needs one is a derivation
  and is extracted into its own skill;
- terminates in finitely many steps and may call other processes.

Before the other three kinds were named, every seated flat skill script was
a process; naming procedure, derivation and inquiry is what made process a
choice rather than the unmarked default.

## Open questions

- Whether meaning-settled and execution-settled are the right two axes for
  classifying work, or whether another decomposition (novelty and
  repetition, autonomy and direction) serves better in practice.
- Whether the boundary between process and procedure is sharp in practice,
  or whether most real work sits on a continuum between the cells.
- A formal proof that $\sigma$- and $\Delta$-closure together imply
  determinism for skill work waits on constructing the algebra of skill work
  itself.

## Related

- [Procedure](procedure.md), [Derivation](derivation.md), [Inquiry](inquiry.md): the other three kinds
- [Work](work.md), [Workflow](workflow.md)
- [Process in Whitehead's metaphysics](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/process.md): becoming rather than being, a different sense of the word
