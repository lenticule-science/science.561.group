---

title: "Domain-Driven Design"
date-created: 2026-03-07T00:00:00
keywords:
  - domain-driven-design
  - strategic-design
  - bounded-context
  - software-architecture
description: "Research summary of Domain-Driven Design's strategic patterns for organizing large software projects around domain models."
references:
  - id: ref1
    type: document
    title: Evans, Eric. Domain-Driven Design: Tackling Complexity in the Heart of Software. Addison-Wesley, 2003.
  - id: ref2
    type: document
    title: Vernon, Vaughn. Implementing Domain-Driven Design. Addison-Wesley, 2013.
---

Domain-Driven Design (DDD) is an approach to software development
that organizes code and teams around a model of the business domain.
Eric Evans introduced the approach in *Domain-Driven Design: Tackling
Complexity in the Heart of Software* (Addison-Wesley, 2003). Evans
argued that the primary complexity in most software projects is not
technical but conceptual --- it lies in the domain the software serves.
DDD addresses this by making the domain model the central artifact
around which development is organized.

## Strategic design patterns

Evans divided DDD into tactical patterns (for structuring code within
a single model) and strategic patterns (for organizing multiple models
across a large system). The strategic patterns are the planning
mechanisms relevant to long-term project organization.

**Ubiquitous Language** is a shared vocabulary that the development
team and domain experts build together. The language appears in
conversations, code, tests, and documentation. When the language
changes, the model changes with it. The ubiquitous language is not a
glossary imposed after the fact; it develops through ongoing
collaboration between developers and domain practitioners.

**Bounded Context** defines a boundary within which a particular
domain model applies. Different parts of a large system may use the
same term to mean different things; a bounded context makes these
differences explicit. Each bounded context has its own ubiquitous
language, its own model, and (often) its own team. Evans defined a
bounded context as an operational delimiter where a model is
well-defined and applicable.

**Context Map** is a representation of the relationships between
bounded contexts in a system. A context map shows how models interact
at their boundaries: which contexts share data, which translate
between models, and which operate independently. Evans identified
several relationship patterns, including Shared Kernel (two contexts
share a subset of their model), Customer-Supplier (one context
provides what another needs), and Anticorruption Layer (a translation
layer that prevents one context's model from leaking into another).

## Core planning mechanism

DDD's planning mechanism operates through model alignment. Rather
than planning work as a sequence of features or tasks, DDD organizes
work around the question: does the code reflect the domain model,
and does the domain model reflect the domain? When the model drifts
from reality --- when the code says one thing and the domain experts
say another --- that misalignment is itself the work to be done.

At the strategic level, bounded contexts serve as organizational
units for planning. Each context can evolve at its own pace, with
its own team, its own release schedule, and its own internal
architecture. The context map provides a system-level view that
makes inter-team dependencies visible and negotiable.

Vaughn Vernon extended Evans' work in *Implementing Domain-Driven
Design* (Addison-Wesley, 2013), presenting the strategic patterns
before the tactical patterns and providing worked examples of bounded
context integration. Vernon also connected DDD's strategic patterns
to concrete architectural styles, particularly event-driven
architectures and what later became known as microservices.

Martin Fowler's writing on DDD (martinfowler.com) has served as an
accessible introduction to the patterns. The Open Group's
Architecture Standard includes DDD strategic patterns as a reference
for enterprise architecture practice.

## Key citations

- Evans, Eric. *Domain-Driven Design: Tackling Complexity in the
  Heart of Software.* Addison-Wesley, 2003.
- Evans, Eric. *Domain-Driven Design Reference.* Domain Language,
  Inc., 2015.
- Vernon, Vaughn. *Implementing Domain-Driven Design.*
  Addison-Wesley, 2013.
- Fowler, Martin. "Domain Driven Design." martinfowler.com/bliki.
