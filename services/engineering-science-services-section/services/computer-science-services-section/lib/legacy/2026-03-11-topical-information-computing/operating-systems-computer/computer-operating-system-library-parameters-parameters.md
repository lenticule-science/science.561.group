---
name: parameters
description: A tuple-form record carrying the input of a script or skill invocation. The categorical product used as carrier when a transformer wants multiple inputs.
specializing: computer-operating-system
realizes: categorical-product
---

A **parameters** record is a tuple of named values forming the input to one invocation of a [script](../script/script.md) or a skill.
Mathematically it is an instance of the categorical product in the appropriate fiber — per [transformer.md:25–27](../../../../../transformer/transformer.md), a $\mathcal{P}$-morphism has exactly one domain entity, and a transformer that wants multiple inputs decomposes into a constructor transformer that builds a product carrier from the inputs followed by a unary transformer on the carrier.
Parameters is the recurring shape of that product carrier when the inputs are heterogeneous named values.

## Tuple shape

A parameters record is a finite mapping from parameter-name slugs to values.
The value's type per parameter is fixed by the consuming script's `has-parameters-shape` cell; mismatches at runtime are precondition-check failures.
The empty tuple () is admissible — a script with no required input still consumes a parameters record (empty).

## Distinguishing predication-shape

- `for-script(parameters, script)` — the script consuming this parameters record.
- `has-binding(parameters, parameter-name, value)` — one cell per named parameter.
- `is-product-of(parameters, structure-list)` — declares the parameter types as a product factorization.
- `received-at(parameters, iso8601)` — timestamp.

## Not synonymous with

- **Message** — a message crosses a wire boundary with an envelope.
  Parameters is an in-process invocation input; it stays on this side of the boundary.
- **Workitem** — a workitem is a dispatch request naming a required skill.
  Parameters is the bound input to one execution of that skill once dispatch has succeeded.
