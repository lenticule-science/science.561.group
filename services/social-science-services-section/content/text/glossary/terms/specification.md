---
name: "Specification"
aliases:
  - "Specification"
  - "specification"
  - "spec"
  - "specifications"
date-created: 2026-03-06
tags: []
---

A ***specification*** is a document that states precisely how a system, component, or process should behave. Specifications prioritize completeness and unambiguity over readability — every edge case, condition, and requirement must be addressed, because the specification's readers (engineers, testers, legal reviewers) will use it as the authoritative reference for what the system is supposed to do.

Specifications differ from other technical documents in their relationship to truth. [Procedural documentation](procedural-documentation.md) describes how to do something; a specification describes how something *should* work. The specification is normative — it defines correctness. If the system doesn't match the specification, the system is wrong (or the specification needs updating).

Effective specifications share several structural features:

- **Numbered requirements** — each requirement is a discrete, testable statement. "The system shall respond within 500 milliseconds" is testable; "the system should be fast" is not.
- **Consistent modal verbs** — "shall" indicates a requirement; "should" indicates a recommendation; "may" indicates an option. This convention (from standards bodies like IEEE and IETF) prevents ambiguity about what is mandatory and what is optional.
- **Defined terms** — key terms are defined once and used consistently. Synonyms are enemies of specifications: if "user," "customer," and "account holder" mean different things, define all three; if they mean the same thing, pick one.
- **Scope statement** — what the specification covers and, critically, what it doesn't.

The hardest part of writing a specification is completeness — accounting for every case, including the ones the writer hasn't thought of. This is why specifications are reviewed, tested, and revised iteratively. A specification that hasn't been tested against real implementation is a draft.

## Related terms

- [procedural documentation](procedural-documentation.md) — describes how to do something; the specification describes what the system should do
- [API documentation](api-documentation.md) — often a form of specification for software interfaces
- [usability testing](usability-testing.md) — specifications themselves need to be usable by their readers

---

## Supplementary formulation

```yaml
---

name: "Specification"
aliases:
  - "Specification"
  - "specification"
  - "spec"
  - "specifications"
date-created: 2026-03-06
tags: []
---
```

A ***specification*** is a document that states precisely how a system, component, or process should behave. Specifications prioritize completeness and unambiguity over readability — every edge case, condition, and requirement must be addressed, because the specification's readers (engineers, testers, legal reviewers) will use it as the authoritative reference for what the system is supposed to do.

Specifications differ from other technical documents in their relationship to truth. [Procedural documentation](procedural-documentation.md) describes how to do something; a specification describes how something *should* work. The specification is normative — it defines correctness. If the system doesn't match the specification, the system is wrong (or the specification needs updating).

Effective specifications share several structural features:

- **Numbered requirements** — each requirement is a discrete, testable statement. "The system shall respond within 500 milliseconds" is testable; "the system should be fast" is not.
- **Consistent modal verbs** — "shall" indicates a requirement; "should" indicates a recommendation; "may" indicates an option. This convention (from standards bodies like IEEE and IETF) prevents ambiguity about what is mandatory and what is optional.
- **Defined terms** — key terms are defined once and used consistently. Synonyms are enemies of specifications: if "user," "customer," and "account holder" mean different things, define all three; if they mean the same thing, pick one.
- **Scope statement** — what the specification covers and, critically, what it doesn't.

The hardest part of writing a specification is completeness — accounting for every case, including the ones the writer hasn't thought of. This is why specifications are reviewed, tested, and revised iteratively. A specification that hasn't been tested against real implementation is a draft.
