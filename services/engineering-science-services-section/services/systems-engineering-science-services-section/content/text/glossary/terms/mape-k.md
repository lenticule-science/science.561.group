---
name: "MAPE-K"
date-created: 2026-08-27T00:00:00
aliases:
  - "MAPE-K"
  - "MAPE-K loop"
  - "autonomic computing loop"
date-updated: 2026-08-27
part-of: engineering/disciplines/systems-engineering/terms
---

MAPE-K names a control architecture for systems that modify their own
operation while running. The acronym expands to Monitor, Analyze, Plan,
Execute, and Knowledge: sensors expose the condition of a managed resource;
monitoring converts those signals into observations; analysis determines
whether adaptation is required; planning constructs a change; execution
applies that change through effectors; and a shared knowledge base supplies
the models, policies, and history required across the loop. It originates
in IBM's autonomic-computing program (Kephart & Chess 2003; IBM's 2005
*Architectural Blueprint for Autonomic Computing*) as a translation of
[cybernetic feedback](../../../../../../../information-science-services-section/services/cybernetics-services-section/content/text/glossary/terms/cybernetic-feedback.md)
into a software-architecture idiom.

MAPE-K is not itself an adaptation algorithm and does not fix how many
services realize its five elements — a realization may fuse stages, split
Knowledge across several stores, or run the whole loop as one controller.
What it fixes is a division of regulatory labor and a claim that the
loop's four transformations are only as trustworthy as the operational
knowledge that couples them: without a coherent shared account of goals,
observations, admissible actions, and uncertainty, a loop can react but
cannot reliably regulate. This is [requisite
variety](../../../../../../../information-science-services-section/services/cybernetics-services-section/content/text/glossary/terms/requisite-variety.md)
restated as an architecture: a regulator's Analyze and Plan stages must
have at least as much discriminative and interventive variety as the
disturbances the Monitor stage can report.

## Practice

A live MAPE-K loop already runs beneath `561-group-services-section`, in
[bare-cedar-fog-codex's agent
skills](../../../../../../../../../561-group-services-section/services/561-group-engineering-services-section/services/561-group-computer-engineering-services-section/services/computer-machine-services-section/services/persistent-computer-machine-services-section/services/bare-cedar-fog-services-section/services/bare-cedar-fog-inference-services-section/services/bare-cedar-fog-codex-services-section/agents/skills):
`monitor-*`, `analyze-*`, `plan-*`, and `execute-*` skills, projected from a
JSON registry of typed knowledge classes and stage dependencies. That loop
governs the Codex actuation office's work — evaluating evidence, planning
architecture, executing repository mutations — which is, functionally, a
code-fabrication process: it hires providers, treats their output as
non-authoritative until assayed, and only then accepts it, in language that
runs strikingly parallel to the [Central Dogma of Code
Fabrication](../../../../../../../../content/text/documents/articles/notes/2026/07/24/2026-07-24-research-on-the-central-dogma-of-code-fabrication.md).
No document currently names that correspondence explicitly; this term
records the observation as an open connection to establish, not a settled
identity between the two.

This section's own engineering practice, under
`engineering-services-section/services/systems-engineering-services-section/`,
does not yet contain that loop or any other — it is a new, currently empty
sibling. Before anything is built there, the bare-cedar-fog-codex loop
above should be assessed as a candidate instance rather than duplicated.

## Related terms

- [Cybernetic feedback](../../../../../../../information-science-services-section/services/cybernetics-services-section/content/text/glossary/terms/cybernetic-feedback.md) — the regulatory mechanism MAPE-K organizes into an architecture
- [Requisite variety](../../../../../../../information-science-services-section/services/cybernetics-services-section/content/text/glossary/terms/requisite-variety.md) — the constraint MAPE-K's Analyze/Plan stages must satisfy
- [Cybernetics](../../../../../../../information-science-services-section/services/cybernetics-services-section/content/text/glossary/terms/cybernetics.md) — the broader field
