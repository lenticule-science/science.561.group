---
title: "Knowing Semioverse Specification"
date-created: 2026-03-09T00:00:00
authors:
  - emsenn
  - claude
type: specification
stability: draft
version: [0, 1, 0]
keywords:
  - KnowingSemioverse
  - AgentialSemioverse
  - KnowledgeSystems
  - DirectoryOrganization
description: "Conformance requirements for implementing a knowing semioverse — an agential semioverse enriched with knowledge-systems directory conventions."
requires:
  - ../index.md
  - information/disciplines/knowledge-systems/texts/research/directory-organization-for-knowledge-systems.md
  - mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository/directory-organization/index.md
part-of: information/disciplines/knowledge-systems/standards/knowing-semioverse
---

This specification defines conformance requirements for implementing a
knowing semioverse. A knowing semioverse is an agential semioverse
(already conforming to the base agential semioverse specifications)
that additionally implements the four-group directory organization
described in the knowing-semioverse index.

## 1. Normative scope

This specification IS normative about:
- Which twelve directory types are standard cross-cutting subdirectories
- What content belongs in each type
- The grouping of those twelve into four functional groups

This specification IS NOT normative about:
- The base agential semioverse conventions (plans, decisions, skills,
  etc.) — see the agential semioverse directory-organization spec
- Domain-specific additional directory types (e.g., `proofs/` in
  mathematics) — those are governed by domain-specific standards
- Internal organization within each directory type

## 2. Required directory types

A conforming knowing semioverse MUST recognize the following twelve
directory types as valid standard subdirectories within any Thing:

### 2.1 Governing group

| Directory | Contains |
|-----------|----------|
| `methods/` | Documents describing how knowledge is produced in this context: inquiry procedures, analytical approaches, methodological traditions |
| `practices/` | Documents of situated doing: how work is actually conducted, concrete operational procedures. Also the location of `practices/specification.md` for any Thing that has conformance requirements. |
| `standards/` | Conventions created or used by this Thing: named formats, protocols, or norms that implementations must follow |

### 2.2 Engaging group

| Directory | Contains |
|-----------|----------|
| `learning/` | Knowledge output in accessible form: exposition, practical guidance, curricula, materials for transmission to others |
| `researching/` | Knowledge intake from external sources: literature engagement, source analysis, annotated bibliography, evidence review |
| `applying/` | Knowledge use in concrete situations: case analyses, implementations, worked examples, domain-specific applications |

### 2.3 Situating group

| Directory | Contains |
|-----------|----------|
| `disciplines/` | Institutional or subject-based subdivisions of this Thing's scope |
| `schools/` | Epistemic and methodological traditions within this Thing's scope |
| `lineages/` | Derivational and transmissive subdivisions: intellectual descent, derived works, apprenticeship chains |

### 2.4 Defining group

| Directory | Contains |
|-----------|----------|
| `topics/` | Broad regions of concern: aboutness-classes that gather many concepts and terms |
| `concepts/` | Units of knowledge: named patterns that emerge from and generalize across terms |
| `terms/` | Specific referents: the linguistic handles for particular objects, processes, or states |

## 3. Placement obligations

A conforming knowing semioverse MUST follow the placement procedure
from the semiotic-directory-layout specification when deciding which
directory type to use. Specifically:

1. Content goes with the most specific Thing it relates to.
2. Within that Thing, content goes in the directory type that best
   matches its function (what it does, not what it is about).
3. When content could fit multiple directory types, the primary
   function determines placement; secondary functions may be noted
   in frontmatter.

## 4. Absent directories

The absence of a directory type signals undevelopment, not
inapplicability. A Thing that has no `methods/` directory either has
not yet developed its methodological documentation or has no
methodological content to organize. Both are valid. The absence MUST
NOT be read as "this Thing has no methods" — only as "this Thing's
methods have not been written down here."

## 5. Relationship to texts/

The `texts/` directory type predates the four-group structure and
remains common in the repository. Under this specification:

- Content that is primarily knowledge output (accessible exposition)
  SHOULD migrate to `learning/` over time.
- Content that is primarily external source engagement SHOULD migrate
  to `researching/` over time.
- `texts/` MAY remain for content that is genuinely neither: theoretical
  compositions, analytical essays, or writings that do not fit the
  intake/output distinction.
- Migration is not required immediately. The four-group types are
  preferred for new content.

## 6. Pressure on domain-specific types

Some disciplines require directory types beyond the twelve standard
ones. Mathematics needs `proofs/` or `formalization/`. Formal systems
need verification infrastructure. These domain-specific types are
governed by the standards of those domains, not by this specification.
A knowing semioverse MUST NOT prohibit domain-specific additions; it
only specifies the twelve standard types that all Things share.
