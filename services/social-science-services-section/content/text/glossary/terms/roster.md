---
name: "Roster"
description: "The assignment of personnel to shifts — a mapping from time slots to people that instantiates coverage and makes a schedule executable."
date-created: 2026-04-04
instance-of: relation
aliases:
  - rota
  - watch-bill
part-of-stage: dispatch
enables: [coverage, handoff, rotation]
requires: [shift, availability, competency]
relates: [schedule, assignment, coverage, shift]
references:
  ernst2004:
    authors:
      - Andreas T. Ernst
      - Houyuan Jiang
      - Mohan Krishnamoorthy
      - David Sier
    title: "Staff Scheduling and Rostering: A Review of Applications, Methods and Models"
    year: 2004
    publication: European Journal of Operational Research
  burke2010:
    authors:
      - Edmund K. Burke
      - Patrick De Causmaecker
    title: The Practice and Theory of Automated Timetabling
    year: 2010
    publication: Operations Research Quarterly
---

A roster is a mapping from [shifts](shift.md) to people.
Where a [schedule](schedule.md) specifies *when* work must happen (8am–4pm Monday), a roster specifies *who*.
The schedule is abstract — it names the temporal structure.
The roster is concrete — it names the person accountable in that interval.
A roster turns the schedule into human commitment.

A roster must satisfy five simultaneous constraints. **Coverage** — every shift is filled by at least one qualified person.
A night shift cannot start without someone assigned to it. **Availability** — no one is scheduled when they cannot work.
Vacation days, school hours, sleep needs, and legal time-off all forbid assignment. **Fairness** — undesirable shifts (nights, weekends, holidays) are distributed equitably across the staff.
One person absorbs all night shifts; the organization experiences rebellion. **Competency** — each shift has people qualified for the role.
Assigning an untrained operator to a critical system violates this constraint. **Legal** — labor laws and collective agreements constrain consecutive hours, mandate rest periods, and regulate shift transitions.
A 7-day, 16-hour stretch may be operationally tempting; it is often legally forbidden.

Roster construction is NP-hard in the general case (Ernst et al. 2004).
The nurse rostering problem is one of the most studied scheduling problems in operations research, precisely because it is hard and its failure is visible — uncovered shifts create immediate patient safety hazards.
Real organizations use heuristics, negotiation, software solvers, and human expertise.
Most rostering is not automated; it is collaborative.

A roster has a planning horizon (typically one to four weeks ahead), a publication date (when personnel learn their assignments), and a freeze date (after which changes require negotiated swaps, not reassignment from above).
In incident management, the roster is called a watch bill — the formal list of who stands watch when.
In military operations, the battle roster tracks section assignments.
In hospitals, the rota determines staffing in each department for each shift.
The roster is the linchpin that makes continuous operations possible: without it, no one knows who is responsible when.

See also: [Shift](shift.md) · [Schedule](schedule.md) · [Assignment](assignment.md) · [Coverage](coverage.md) · [Availability](availability.md) · [Handoff](handoff.md)
