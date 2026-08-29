---
title: praxis-driven development
aliases:
- praxis-driven development
- praxis-first development
date-created: 2026-04-04
description: "A development methodology where the practices necessary to advance the endeavor determine what gets built, discovered through iterative cycles of action and reflection."
defines:
- praxis-driven development
- praxis-first development
enables:
- emergent-architecture
- adaptive-planning
contrasts-with:
- specification-driven-development
- documentation-first-development
- test-driven-development
traditions:
- pragmatism
- situated-cognition
- action-research
- agile-development
references:
  peirce1878:
    authors:
    - Charles S. Peirce
    title: How to Make Our Ideas Clear
    publication: Popular Science Monthly
    year: 1878
  dewey1938:
    authors:
    - John Dewey
    title: 'Logic: The Theory of Inquiry'
    publication: Henry Holt and Company
    year: 1938
  laveWenger1991:
    authors:
    - Jean Lave
    - Etienne Wenger
    title: 'Situated Learning: Legitimate Peripheral Participation'
    publication: Cambridge University Press
    year: 1991
  schon1983:
    authors:
    - Donald A. Schön
    title: 'The Reflective Practitioner: How Professionals Think in Action'
    publication: Basic Books
    year: 1983
  lewin1946:
    authors:
    - Kurt Lewin
    title: Action Research and Minority Problems
    publication: Journal of Social Issues
    year: 1946
  fowler2006:
    authors:
    - Martin Fowler
    title: The New Methodology
    publication: martinfowler.com
    year: 2006
---

Praxis-driven development is a methodology that inverts the typical relationship between planning and building. Rather than specifying requirements, designing architecture, writing tests, or documenting specifications first, this approach asks: what must we build to do the next thing? The answer emerges from practice, not prediction.

The method is rooted in pragmatism, specifically Charles S. Peirce's pragmatic maxim: a concept's meaning is exhausted by its practical consequences [@peirce1878]. Under this frame, abstract designs have no meaning until they meet reality. John Dewey extended this into pedagogy — learning happens not from instruction but from "learning by doing," where experience and reflection cycle together [@dewey1938]. You build, you reflect on what the building revealed, you build again.

Praxis-driven development operationalizes this cycle. Work proceeds in tight loops: identify the minimum capability needed to advance, build it, use it, observe what it revealed about the next capability. This differs fundamentally from specification-first approaches, which assume you can predict what you need before encountering the work. It differs from test-first approaches, which pre-specify correctness criteria. Instead, the practices demanded by the actual endeavor become the specification.

The theoretical grounding comes from situated cognition — the claim that knowledge emerges from practice, not from abstract instruction [@laveWenger1991]. Jean Lave and Etienne Wenger showed that apprentices learn by legitimate peripheral participation in a community of practice, not by studying decontextualized theory first. Similarly, development teams learn what they need to build by participating in the actual work. Meaning accretes from doing.

Donald A. Schön's concept of "reflection-in-action" and "reflection-on-action" captures this precisely [@schon1983]. The practitioner simultaneously acts and monitors, adjusting based on immediate feedback. When a design assumption breaks against reality, the practitioner reflects, revises, and resumes. This is distinct from pure iteration (which can be mindless repetition) and from pure planning (which cannot account for what you do not yet know).

Kurt Lewin's action research methodology formalizes the cycle: plan a small action, act, observe the results, reflect, plan the next action [@lewin1946]. This became the foundation for what is now called Agile development, though Agile often reduces it to mechanical sprints rather than genuine reflection. Praxis-driven development recovers Lewin's emphasis on genuine learning at each cycle.

Agile development's successful practices align with praxis-driven thinking: user stories emerge from actual usage patterns; pair programming surfaces design problems as they arise; retrospectives institutionalize reflection; continuous integration exposes architectural assumptions. But many Agile implementations suffer from shallow iteration — checking boxes in sprints rather than learning what the work requires. Praxis-driven development insists on the learning.

The practical consequence: architecture grows from necessity, not imagination. Tools are built to support the next action, not to implement a pre-drawn diagram. APIs emerge from actual use, not from abstract interface design. Documentation captures what the work revealed, not what planners predicted. This does not mean chaotic or directionless development — the endeavor provides direction. It means the path unfolds through doing.

---

See also: [reflection-in-action](../../../humanities/domains/philosophy/terms/reflection-in-action.md), [situated-cognition](../../../humanities/domains/philosophy/terms/situated-cognition.md), agile-development.
