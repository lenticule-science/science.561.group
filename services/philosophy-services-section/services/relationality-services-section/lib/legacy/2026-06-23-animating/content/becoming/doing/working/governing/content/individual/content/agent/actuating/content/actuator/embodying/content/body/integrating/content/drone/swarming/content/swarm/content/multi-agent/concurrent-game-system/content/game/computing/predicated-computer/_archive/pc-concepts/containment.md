---
type: concept
class: relation
depends-on: [predication-substrate]
see-also: [inheritance, scope]
---

# Containment

The substrate's pattern for "this entity *contains* these entities" — handled by a single, generic predicate (typically named `contains`) rather than per-container-type relations. A plan contains tasks; a department contains offices; a ship contains departments; a room contains items. The same predicate, the same primitive operators on it, the same closure-rule patterns governing it. There is no per-type containment API.

The discipline is what makes container-related operations *uniform across container types*. Moving a task between plans is removing it from one `contains` predication and adding it to another; moving an office between departments is the same operation; moving an item between rooms is the same operation. The substrate's [traversal](../morphisms/traversal.md) operator answers "what does this contain?" or "what contains this?" by following `contains` predications in either direction, regardless of what kind of containment is at play.

Three engineering consequences:

- **Containment-related work is generic code.** A "move" operation, a "find by contained predicate" query, a "validate contents against a shape" check — each is implemented once against the `contains` predicate, and works at every level of the substrate.
- **Containment is recursive without special handling.** A plan that contains a sub-plan that contains tasks is just nested `contains` predications. The substrate's traversal handles depth; there is no special "compound container" abstraction.
- **Container behaviors are closure rules on `contains` events.** When an entity is added to or removed from a container's `contains` predication, applicable closure rules fire — validation rules check that the addition is admissible, propagation rules update derived predications, lifecycle rules trigger entry/exit behaviors. The container's behavior is the closure rules' aggregate effect, not a hardcoded callback.

The pattern is one of the substrate's *deep primitives*: a single relation that, with the right closure rules, expresses every containment-flavored relation the substrate needs. Particular platform realizations may carry additional, more specialized containment-flavored predicates (`part-of`, `serves`, `has-member`) for cases where additional structure is needed; the structural claim is that all of them ultimately compose with `contains` and the substrate's primitive operators.

The mereology of work — part-whole relations between work items and the procedures that produce them — uses two predicate families: synchronic containment (`contains`, `part-of`) recording structural composition, and diachronic dependency (`depends-on`, `serves`) recording temporal succession. Both are substrate-level patterns; both are visible to the substrate's traversal and dispatch operators; both follow the same primitive-operators discipline.
