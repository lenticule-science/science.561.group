---
name: "Informational Resource"
description: "An informational resource is an entity whose content makes claims about something and is read for understanding rather than invoked for execution."
extends: Entity
date-created: 2026-03-18
date-modified: 2026-09-09
---


This term names the information-content sense of resource used in this
information-science section. It does not define the engineering term
[Resource](resource.md),
which covers addressable things available for use or transformation.

## Formal definition

An **Informational Resource** is a local section of the propositional sheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$ at a specific history $t$:

$$\text{Resource} = (t \in T,\; x \in H_t,\; \mathrm{claims} \subseteq H_t)$$

where:
- $t$ is the **history** at which the resource is defined — the point in $T$ at which its content is accessible
- $x \in H_t$ is the **content** — an element of the fiber (the resource's propositional body)
- $\mathrm{claims} \subseteq H_t$ is the **claim set** — the propositions the resource asserts; a resource with empty claims is not a resource

**Read semantics.** A Resource is the object agents *read*: $x$ is retrieved and its claims are consulted. Reading is a morphism $\mathrm{read} : 1 \to H_t$ — selecting $x$ from the fiber. No side effect occurs. The resource is not consumed.

**Restriction.** For $s \leq t$, the restriction map $H(s \leq t) : H_t \to H_s$ sends the resource at $t$ to its restriction at $s$. A resource at $t$ is visible at all earlier histories via restriction — content accumulates monotonically.

**Contrast with Observation.** An Informational Resource is an element of $H_t$ that makes claims. An [Observation](observation.md) is a local section of an [Accord](../../../../../social-science-services-section/content/text/glossary/terms/accord.md) $F(t)$ — raw evidence. Informational Resources are built from Observations: when nucleus evaluation settles $\mathrm{claims}$, the resource's content becomes a stable part of $H^*_t$.

**Contrast with Skill.** A [Skill](../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/skills.md) is a morphism $f : A \to B$ — it transforms. A Resource is a named element — it is read.

## What this is

A **Resource** is an identifiable unit of information that can be retrieved and read — something with stable identity and content that makes claims about something else.
This is the sense the term carries across the fields that converge here:

- **URI theory** (RFC 2396): a resource is "anything that has identity" — any named, addressable thing.
- **Agential systems** (MCP): a Resource is "a data source that provides contextual information — read-only, application-controlled, retrieved to inform responses." MCP's Resource/Tool distinction maps directly onto this system's Resource/Skill distinction: Resources are read; Tools (Skills) are invoked.
- **Information science** (IAO/BFO): an Information Content Entity has *aboutness* — it is about something, can be copied, and can be read and referenced freely.
- **Sheaf theory**: the settled sections of R = Sh(T, J) are the Resources — content established at a given history and available for reading.

The linear logic sense of "resource" (consumed exactly once) does not apply: Resources here are freely copyable and repeatedly readable.

In this system, a Resource is an [Entity](../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/entity.md) whose content makes claims about something — defining a type or concept, stating what is true of it, or characterizing its structure.
A Resource is read to understand a domain.
It does not execute, sequence, or implement; those roles belong to [Skills](../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/skills.md), [Runbooks](../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/runbook.md), and [Scripts](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/governance/rules/specifications/script.md).
A Resource MUST carry content that makes claims — a Resource with no claims content is not a Resource.
It CANNOT execute operations or produce side effects.

## Content

A Resource makes one or more of the following kinds of claims:

- **Definitional** — states what a type or concept is
- **Descriptive** — characterizes an object without fully defining it
- **Normative** — states what must, should, or may be true of something
- **Declarative** — asserts a fact, relationship, or predicate value

A Resource MAY cross-reference other entities via markdown links.
A Resource MUST NOT contain executable logic, control flow, or step sequencing — those belong in Skills and Runbooks.

## Relation to the four entity kinds

The four kinds of [Entity](../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/from-philosophy/entity.md) are mutually exclusive:

| Kind | Content | Role |
|---|---|---|
| **Resource** | Claims about something | Read for understanding |
| Skill | Judgment instructions | Invoked for agent reasoning |
| Runbook | Sequences operations | Orchestrates work |
| Script | Implements one step | Executes atomically |

A Resource is the noun of the system.
Skills, Runbooks, and Scripts are the verbs — [Operations](operation.md) encoded as entities.

## Open questions

- Whether the four kinds (Resource, Skill, Runbook, Script) are exhaustive at the abstract level, or whether the FARS encoding introduces distinctions that collapse under abstraction.
  Resolution needs: `relational-system-resource.md` (not yet written).
- Whether locale context files (AGENTS.md, PLANS.md, INBOX.md, MEMORY.md, SOUL.md, IDEAS.md) are Resources with a special shape, or a distinct fifth kind.
  Currently treated as Resources.
