---
aliases:
  - inquiries
  - investigation
  - research
description: Work where neither meaning nor execution is settled — open exploration directed by a question, not a specification.
identity: inquiry
name: Inquiry
date-created: 2026-03-29
date-modified: 2026-09-27
relations:
  instance-of: work
  contrasts-with:
    - process
    - procedure
    - derivation
  requires: flatfile-agent-resource-system-skill-result
  properties:
    - meaning-settled=false
    - execution-settled=false
meaning-settled: false
execution-settled: false
resolves-to: procedure, derivation, process
contrasts-with: process, procedure, derivation
traditions: dewey, peirce, hintikka
instance-of: work
---
An inquiry is work where neither the meaning nor the execution is settled. You do not fully know what you are looking for, and you do not know how to find it. The work is directed by a question, not by a specification.

Inquiry is the most open form of work. A [process](./process.md) knows both what and how. A [procedure](./procedure.md) knows what but branches on how. A derivation knows how but not yet what it will produce. An inquiry knows neither — it is exploring.

This does not mean inquiry is aimless. An inquiry has a question: an indeterminate situation that the inquirer is trying to make determinate. The question directs the exploration without determining the answer. "What is causing this system to fail?" is a question that organizes inquiry without specifying what the answer will be or how to reach it.

Three philosophical traditions ground the concept:

**Dewey.** Inquiry is the controlled transformation of an indeterminate situation into a determinate one. It begins with a felt difficulty — something is wrong, unclear, or unresolved. It proceeds through hypothesis generation, reasoning, and experimentation. It terminates when the situation is settled. Inquiry is not mere thinking; it is thinking directed at transforming a real situation.

**Peirce.** Inquiry is a self-correcting method driven by genuine doubt. You do not inquire into what you are not actually uncertain about. Abduction generates candidate hypotheses. Deduction draws out their consequences. Induction tests those consequences against experience. The cycle repeats, each round narrowing the space of viable hypotheses.

**Hintikka.** Inquiry is a game between the Inquirer and Nature. The Inquirer has two moves: deductive steps (drawing conclusions from what is known) and interrogative steps (asking Nature questions and receiving answers). The strategy of inquiry consists in choosing which questions to ask and in what order. The answers are not guaranteed to be helpful — Nature is not cooperative.

Inquiry terminates in one of several ways. The question is answered: the indeterminate situation becomes determinate, and the inquiry has produced either a process (fully specified result), a procedure (conditional result), or a derivation (reasoned judgment). The question is abandoned: the inquirer decides the question is not worth pursuing. The question is transformed: the inquiry reveals that the original question was wrong, and a better question replaces it.

Inquiry composes with other work types. A [workflow](./workflow.md) may contain inquiry nodes alongside process and procedure nodes. An inquiry node has uncertain output — the workflow must accommodate the possibility that the inquiry changes the plan. This is what distinguishes an adaptive workflow from a fixed one: adaptive workflows contain inquiry.

The four types of work:

| | Execution settled | Execution open |
|---|---|---|
| **Meaning settled** | [Process](./process.md) | [Procedure](./procedure.md) |
| **Meaning open** | Derivation | **Inquiry** |

Inquiry sits at the bottom of the lattice — nothing settled. All paths out of inquiry go through settling either meaning or execution, moving the work toward one of the other three types.

## Formal definition

An inquiry is a work element fixed by neither closure,
$W \in H \setminus (\mathrm{Fix}(\sigma) \cup \mathrm{Fix}(\Delta))$: $\sigma(W) \neq W$ and
$\Delta(W) \neq W$ ([process](process.md) sets out all four positions;
[nuclear quartet subalgebra](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/library/relational-hyperverse-repository/math/nuclear-quartet-subalgebra.md)). Every element still has a canonical image
in each settled part, through $\sigma$, $\Delta$ or the joint projection, so
an inquiry always produces something, even if what it produces is another
inquiry at a deeper level.

## As a skill

A skill declared `closure-kind: inquiry` explores. Nothing is fixed going in
and nothing is guaranteed stable coming out, so it is non-deterministic by
design. It is the one kind that both needs a model and cannot be bounded by a
fixed result shape, so the one discipline available is external: a hard fuel
cap of turns, tokens or seconds, past which it stops and reports. The house
skill schema requires an inquiry skill to carry models and a fuel cap. An
inquiry skill:

- names the question or territory it explores;
- produces some output, which may be the report that the territory is empty
  or not yet reachable, or a further inquiry;
- admits that its output type is unknown in advance; fixing it beforehand
  makes the skill a process;
- may loop, backtrack, change direction and call skills of any kind;
- is used only where no more settled kind will do.

Scheduling an inquiry as if it were a process hides real variability behind a
false promise of reproducibility. Declare it an inquiry and bound it by fuel.

## Related

- [Inquiry in philosophy](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/inquiry.md): the directed motion of a claim toward determination, the epistemic sense of which inquiry as work is one kind
