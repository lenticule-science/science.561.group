---
name: "Coverage"
description: "The invariant that all required time intervals are staffed — what shifts, watches, and rosters exist to maintain."
defines: coverage
date-created: 2026-04-04
instance-of: constraint
applies-to: [shift, watch, roster, operations]
constrains: [assignment, roster, handoff]
part-of-stage: planning
references:
  - id: mintzberg1979
    type: document
    title: The Structuring of Organizations
    author:
      - literal: Henry Mintzberg
    container-title: Prentice-Hall
    issued:
      - year: 1979
  - id: dittman2016
    type: document
    title: "Continuous Operations: Organizational Models and Staffing Strategies"
    author:
      - literal: Jeremy P. Dittman
      - literal: Lara Khaldi
      - literal: Ruben D. Ortega
    container-title: Journal of Organizational Design
    issued:
      - year: 2016
---

Coverage is the organizational invariant that ensures every required [interval](interval.md) has at least one assigned agent responsible for a function.
It answers the question: "Is someone responsible for this right now?"
If the answer is ever "no" for a critical function, coverage has failed.
Coverage is the constraint; [shifts](shift.md), [watches](watch.md), and [rosters](roster.md) are the mechanisms that satisfy it.

Coverage requirements vary by function. **Continuous coverage** means 24/7 staffing with no gaps — hospital ICU, ship's bridge, network operations centers.
Continuous coverage requires a watch-like structure with explicit [handoffs](handoff.md) and no moment where the position is vacant. **Business-hours coverage** staffs only specific intervals — 9am to 5pm, weekdays only.
Gaps outside covered hours are acceptable and expected. **On-call coverage** means not actively staffed, but someone is reachable and can respond within a defined window: cheaper than continuous but slower to respond. **Surge coverage** adds temporary capacity during peaks — normal staffing plus the ability to scale up during incidents or demand spikes.

Coverage gaps are a specific failure mode: the moment between an outgoing shift and an incoming shift where neither has assumed responsibility.
No one is watching; no one is accountable.
The [handoff](handoff.md) protocol exists to prevent this — the [watch](watch.md) continuity invariant states that at no moment is a critical position vacant.
The [investiture](../../../../services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/investiture.md) process in governance mirrors this: a role must never be unoccupied during a valid investiture chain.
When one officer is relieved, the next immediately assumes authority; there is no gap.

The [roster](roster.md) is the operational instrument that achieves coverage.
Where coverage is the requirement ("the ICU must always have a nurse"), the roster is the assignment ("RN Smith has ICU Monday 7am-7pm; RN Johnson has 7pm-7am").
Mintzberg (1979) observes that coverage requirements shape organizational design: if you must cover 24/7, you need shift-based coordination; if business-hours coverage suffices, you can use hierarchy with a single daily briefing.

Coverage has a cost.
More coverage means more personnel hours, more payroll, more coordination overhead.
The design question is: which functions require which level of coverage?
Critical functions (safety, security, life support, command) require continuous coverage or near-continuous on-call.
Administrative functions tolerate gaps.
Strategic functions may require only periodic presence.
Dittman et al. (2016) show that over-staffing for coverage (covering functions that don't need it) produces idle time and erodes morale; under-staffing creates gaps that cascade into failures.

In multi-agent systems, coverage becomes a scheduling constraint.
The dispatch stage must check not only whether an agent has [availability](availability.md) and [capacity](capacity.md), but also whether assigning that agent leaves other critical functions covered.
If two critical functions need staffing in the same interval and only one agent can do each, both must be assigned — the dispatch cannot leave one uncovered.
This is why [capacity](capacity.md) limits alone are insufficient; coverage constraints gate what *can* be dispatched.

See [Shift](shift.md), [Watch](watch.md), [Roster](roster.md), and [Dispatch and Delegation Survey](../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2026/04/03/2026-04-03-dispatch-and-delegation-survey.md) for how coverage shapes scheduling and staffing decisions.
