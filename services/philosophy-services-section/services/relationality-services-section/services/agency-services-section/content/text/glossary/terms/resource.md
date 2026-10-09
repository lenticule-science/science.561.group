---
name: "Resource"
type: "page"
date-created: 2026-03-18
description: A Resource is an Entity whose content makes claims about something — defining, describing, or characterizing an object — and is read for understanding rather than invoked for execution.
---

A Resource is an Entity whose content makes claims about something — defining, describing, or characterizing an object — and is read for understanding rather than invoked for execution.

Table of contents

- [Formal definition](#formal-definition)

- [What this is](#what-this-is)

- [Content](#content)

- [Relation to the four entity kinds](#relation-to-the-four-entity-kinds)

- [Open questions](#open-questions)


## Formal definition

A **Resource** is a local section of the propositional sheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$ at a specific history $t$:

Resource=(t∈T,  x∈Ht,  claims⊆Ht)\text{Resource} = (t \in T,\; x \in H_t,\; \mathrm{claims} \subseteq H_t)

where:

- $t$ is the **history** at which the resource is defined — the point in $T$ at which its content is accessible

- $x \in H_t$ is the **content** — an element of the fiber (the resource&rsquo;s propositional body)

- $\mathrm{claims} \subseteq H_t$ is the **claim set** — the propositions the resource asserts; a resource with empty claims is not a resource

**Read semantics.** A Resource is the object agents *read*: $x$ is retrieved and its claims are consulted. Reading is a morphism $\mathrm{read} : 1 \to H_t$ — selecting $x$ from the fiber. No side effect occurs. The resource is not consumed.

**Restriction.** For $s \leq t$, the restriction map $H(s \leq t) : H_t \to H_s$ sends the resource at $t$ to its restriction at $s$. A resource at $t$ is visible at all earlier histories via restriction — content accumulates monotonically.

**Contrast with Observation.** A [Resource](../../../../../../../../../information-science-services-section/content/text/glossary/terms/resource.md) is an element of HtH_t that makes claims. An [Observation](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/observation.md) is a local section of an [Accord](../../../../../../../../../social-science-services-section/content/text/glossary/terms/accord.md) $F(t)$— raw evidence. Resources are built from Observations: when nucleus evaluation settles $\mathrm{claims}$, the resource&rsquo;s content becomes a stable part of Ht∗H^*_t.

**Contrast with Skill.** A [Skill](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/skills.md) is a morphism $f : A \to B$ — it transforms. A Resource is a named element — it is read.

## What this is

A **Resource** is an identifiable unit of information that can be retrieved and read — something with stable identity and content that makes claims about something else.
This is the sense the term carries across the fields that converge here:

- **URI theory** (RFC 2396): a resource is &ldquo;anything that has identity&rdquo; — any named, addressable thing.

- **Agential systems** (MCP): a Resource is &ldquo;a data source that provides contextual information — read-only, application-controlled, retrieved to inform responses.&rdquo; MCP&rsquo;s Resource/Tool distinction maps directly onto this system&rsquo;s Resource/Skill distinction: Resources are read; Tools (Skills) are invoked.

- **Information science** (IAO/BFO): an Information Content Entity has *aboutness* — it is about something, can be copied, and can be read and referenced freely.

- **Sheaf theory**: the settled sections of R = Sh(T, J) are the Resources — content established at a given history and available for reading.

The linear logic sense of &ldquo;resource&rdquo; (consumed exactly once) does not apply: Resources here are freely copyable and repeatedly readable.

In this system, a Resource is an [Entity](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/entity.md) whose content makes claims about something — defining a type or concept, stating what is true of it, or characterizing its structure.
A Resource is read to understand a domain.
It does not execute, sequence, or implement; those roles belong to [Skills](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/skills.md), [Runbooks](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/runbook.md), and [Scripts](../../documents/articles/research/predicated-agentic-orchestration-platform/flatfile-agentic-resource-system/governance/rules/specifications/script.md).
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

The four kinds of [Entity](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/entity.md) are mutually exclusive:

Kind
Content
Role

**Resource**
Claims about something
Read for understanding

Skill
Judgment instructions
Invoked for agent reasoning

Runbook
Sequences operations
Orchestrates work

Script
Implements one step
Executes atomically

A Resource is the noun of the system.
Skills, Runbooks, and Scripts are the verbs — [Operations](../../documents/articles/research/2026/07/31/lenticule-import/animating/content/becoming/doing/working/governing/knowing/content/knowledge-science/archive/operation.md) encoded as entities.

## Open questions

- Whether the four kinds (Resource, Skill, Runbook, Script) are exhaustive at the abstract level, or whether the FARS encoding introduces distinctions that collapse under abstraction.
Resolution needs: `relational-system-resource.md` (not yet written).

- Whether locale context files (AGENTS.md, PLANS.md, INBOX.md, MEMORY.md, SOUL.md, IDEAS.md) are Resources with a special shape, or a distinct fifth kind.
Currently treated as Resources.
