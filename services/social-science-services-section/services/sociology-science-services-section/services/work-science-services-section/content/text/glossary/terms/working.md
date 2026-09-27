---
name: Working
identity: working
description: "Executing the next available work unit from a queue without selection bias. The base mode of an agent's activity; the target need not have a written method."
date-created: 2026-03-18
date-modified: 2026-09-27
contrasts-with: improving
---
**Working** is executing the next available [work unit](work-unit.md) from a
queue. It has no selection bias: it takes what is next. The target need not be
skillful work; ad hoc work is worked the same way. Working is the base mode of
an agent's activity. It gets things done, and does not ask whether doing this
work enables more work; that question belongs to [improving](improving.md).

A working pass consumes one work unit and produces its named output, which may
be an artifact, a judgment, a changed state, or a report that nothing was found.
It produces the unit's [skill](skill.md) result, the declared output or a
structured error, and leaves the queue consistent: the unit is marked done
whether it ended in success or error. It does not reorder the queue by what
would enable more work, and it does not discard an error without recording it,
since an error that vanishes is not a completed work unit. Working may also be
invoked directly on one unit, with no queue at all.

Every improving pass is a working pass; not every working pass is an improving
pass.

## Related

- [Improving](improving.md), [Work unit](work-unit.md), [Skill](skill.md), [Work item](work-item.md)
