---
name: incumbent of
type: morphism
class: agent-form-relation
source: persona
target: office
produces: officer
status: open
---

`incumbent-of(officer, persona, office, t-from, t-to?)
` — over interval `[t-from, t-to]` (open-ended if `t-to` absent), the named persona holds the named office; the relation itself is reified as an [officer](../structures/officer.md) object.

## Shape

A reified-relation morphism: the relation `(persona, office, t-from, t-to)` is addressable as an officer-object, which carries its own predications (acts-as-officer, installed-by-witness, etc.).

## Step-induction role

Time-bounded role-occupancy.
The dispatcher queries "who is currently incumbent of office:X?" by traversing to the potential officer, then to the persona.
Audit decomposes "by-office" attribution through the officer to ultimate persona-attribution while preserving the office-context.

Multiple officers can co-exist for the same office over disjoint intervals (the office's incumbency-history).
Multiple offices can be co-incumbent on the same persona (emsenn holds multiple offices simultaneously, each as its own officer-relation).
