---
id: work-unit
description: "A WorkUnit is a typed, parameterized instance of Work: the most atomic executable thing, characterized by what it acts on, what it changes, how, and with what specific parameters."
---

# WorkUnit

## What it is

A **WorkUnit** is a concrete, typed instance of [Work](work.md). Where Work is the
abstract category ("an episode of doing with a defined output"), a WorkUnit is a
specific instantiation: it names its input type, the aspect of that input it
transforms, the operation it applies, and the specific parameter values that make
this instance distinct from other instances of the same operation.

A WorkUnit is the most atomic executable thing in the system. It cannot be
decomposed further without losing what makes it a unit: a single named output
produced by a single named operation on a named input.

WorkUnits are Units (see [unit](unit.md)). They live wherever work lives — in
Tasks, in Workflows, in execution queues.

## Structure

Every WorkUnit is characterized by four things:

- **domain**: the type of object the work acts on. What goes in.
- **affected**: which aspect or attribute of the domain changes. The work does not
  change everything — it changes this.
- **operation**: how the change is produced. References a skill type
  ([process](process.md), [procedure](procedure.md), [derivation](derivation.md),
  [inquiry](inquiry.md)) or names the operation directly.
- **parameters**: the specific values that instantiate this WorkUnit. Two WorkUnits
  with the same domain, affected, and operation but different parameters are
  different WorkUnits.

A WorkUnit without parameters is a template, not an instance. Templates are not
WorkUnits — they are skill definitions.

## Relationship to Work and Skills

[Work](work.md) is the abstract category: any episode of doing with a named output.
A WorkUnit is the concrete instance: Work with typed domain and explicit parameters.

[Skills](skills.md) define operations — they are the methods, the operation component
of a WorkUnit. A WorkUnit instantiates a skill with specific parameter values:

```
skill:       write-unit        (the operation)
domain:      math/             (what it acts on)
affected:    corpus            (what changes)
parameters:  {id: "fiber-algebra", description: "..."}
```

This means: *apply write-unit to math/, producing a new unit with these specific parameters.*

## MUST

- Have a named output — inherits from [Work](work.md)
- Have explicit parameter values — a WorkUnit without parameters is not yet
  a WorkUnit; it is a potential work item awaiting parameterization
- Name its domain type — "fix something in math/" is not a WorkUnit; "reform the
  frontmatter of math/fiber-algebra.md" is

## Pending

- Whether WorkUnit parameters correspond to the "content" of a Unit in the sense
  of [unit.md](unit.md) — likely yes; WorkUnit IS the Unit kind for executable work
