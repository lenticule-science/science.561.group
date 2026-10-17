---
type: concept
class: relation
depends-on: [predication-substrate, identity-by-relations]
see-also: [containment, self-representation]
---

# Inheritance

The substrate's pattern for "this entity has the predications its parent has, *plus* its own additional predications" — additive accumulation through an `extends` predicate. An office that extends another inherits the parent's capability predications and adds its own; a shape that extends another inherits the parent's constraints and adds its own; a runbook that extends another inherits the parent's steps and adds its own. The substrate handles the accumulation through closure rules on `extends`; there is no per-type inheritance machinery.

Inheritance on the predication substrate is *additive*, not *override*. A child entity does not replace a parent's predication; it adds new predications. Where the parent says `capability: coordinate`, the child either says nothing additional (and inherits "coordinate" from the parent) or says `capability: coordinate, capability: schedule` (carrying both). Removing a parent's predication from a child is a separate substrate operation — explicit retraction with declared reason — not a side effect of the child's own predications. This is the engineering content of "capabilities accumulate through inheritance, not override."

Three engineering consequences:

- **Inheritance is graph-structural.** An entity's full predication set is the closure of its own predications under the `extends` predicate's transitive resolution. The substrate's [traversal](../morphisms/traversal.md) operator computes the closure on demand; the entity's effective predications at any moment are the substrate-traversal-aware union of its own and its ancestors'.
- **Multiple inheritance is admitted.** An entity may extend multiple parents; the union of inherited predications is the substrate's join operation in its value-domain. Conflicts between parents — one says `capability: t`, another says `capability: f` for the same predicate — surface as the value-domain's conflict value (e.g., contradiction in a bilattice) and are handled by the substrate's [repair](repair.md) discipline.
- **Inheritance is queryable.** "What does this entity inherit, from where?" is a substrate traversal of the `extends` chain, with the inherited predications surfaced explicitly. The substrate's audit can show why an entity has a particular predication, by chaining backward through `extends` to the originating parent.

The pattern lets the substrate avoid per-type class hierarchies. The substrate has no class concept (per [identity-by-relations](identity-by-relations.md)); it has predicate-bearing entities and the `extends` predicate. Particular platform realizations may use the pattern to model class-style inheritance (an office "is a kind of" agent); the structural claim is that the modeling is done through substrate predications, not through an external type system.
