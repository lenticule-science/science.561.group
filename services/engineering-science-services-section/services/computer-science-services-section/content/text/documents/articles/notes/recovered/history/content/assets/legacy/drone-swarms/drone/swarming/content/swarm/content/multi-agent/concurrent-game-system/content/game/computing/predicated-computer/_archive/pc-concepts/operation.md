---
type: concept
class: operation
depends-on: [self-representation, identity-by-relations]
see-also: [operator, vocabulary-completeness]
---

# Operation

A generative endofunction on a predicated computer that is *itself* a named entity in the same computer. An operation is what the system uses to produce more of itself: it takes inputs from the substrate, applies a transformation, and writes outputs back to the substrate. The defining engineering content is that the operation is not external to the substrate it acts on; it is *in* the substrate.

An operation that exists only as a fact about the substrate — a transformation an external runtime can apply, with no corresponding entity in the store — is not an operation in this corpus's sense. It is a *function on* the substrate, but the substrate cannot name it, cite it, or invoke it through its own operators. A predicated computer that admits such external functions has them as part of its host runtime, not as part of itself; this is a substrate gap analogous to [vocabulary debt](vocabulary-completeness.md) at the predicate level.

Three commitments characterize an operation:

- **Identity.** The operation has an identity in the substrate — a stable reference, addressable through the substrate's [traversal](../morphisms/traversal.md). Two transformations are the same operation iff they have the same identity; two transformations with the same effect on different carriers are different operations.
- **Reference-ability.** Other entities in the substrate can refer to the operation in their predications. An entity that says "produced by operation $\omega$" cites $\omega$ by its substrate-level reference, not by an out-of-band name.
- **Invocability.** There is a way to apply the operation to its declared carrier within the system. The operation's invocation is itself a substrate event — it produces a [witness](witness.md) entry recording what was invoked, with what input, and what output resulted.

An operation has a declared *carrier* — the kind of substrate region it acts on. The carrier may be a single entity, a region containing certain predicates, the whole substrate, or a sub-substrate. The carrier is part of the operation's identity. Two operations with identical bodies but different carriers are different operations.

The structural consequence is that the predicated computer's own machinery — its closure rules, its constraint checks, its query operators, its persistence operations — are themselves operations in this sense, addressable and modifiable through the substrate. This is the operational content of the substrate being its own metalanguage.
