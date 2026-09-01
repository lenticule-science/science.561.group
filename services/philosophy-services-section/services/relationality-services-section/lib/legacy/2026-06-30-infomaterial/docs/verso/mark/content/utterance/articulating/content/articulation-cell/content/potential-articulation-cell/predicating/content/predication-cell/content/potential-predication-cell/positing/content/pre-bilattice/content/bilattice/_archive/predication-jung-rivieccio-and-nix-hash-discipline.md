---
type: question
status: open
explores:
  - ../../../../../../predicated-computing/concepts/hash-discipline.md
---

# Jung-Rivieccio duality and Nix hash discipline

Per [hash-discipline](../../../../../../predicated-computing/concepts/hash-discipline.md) (line 18), the substrate's hash discipline is structurally correct because:

> *"The chain value → Priestley dual → canonical form → hash is injective at every step. ... per [jung-rivieccio-duality](../theorems/jung-rivieccio-duality.md), the duality is a contravariant equivalence of categories — distinct fiber-algebra values have distinct duals."*

Nix uses SHA-256 over a canonical form (the `.drv` serialization for input-addressed derivations, or the NAR-serialized output bytes for content-addressed derivations). Same canonical form → same hash → same store path. The byte-level commitment matches the substrate's hash discipline.

But the substrate's argument for *why* the hash discipline is correct goes through Jung-Rivieccio duality — a contravariant categorical equivalence between fiber-algebra values and paired Priestley spaces. The author of the opening mapping pass has not read the duality theorem, has not located its statement in predication-categories, and cannot verify whether the duality applies to Nix's value-domain.

## What is unverified

- **What "value" is, in Jung-Rivieccio terms, for Nix.** Predication-categories' fiber-algebra values are elements of $\mathbf{L}^{\bowtie\, E \times E}$ — bilattice-valued functions on entity-pairs. Nix's "values" at a store-path cell are roughly $\{\bot, \text{recipe-known}, \text{realized}\}$ as discussed in [thin-value-domain](teaching/explanations/thin-value-domain.md). What is the Priestley dual of a thin three-element partial order? Does the duality even apply to non-bilattice value-domains?
- **What "canonical form" is, in the duality's sense.** The substrate says canonical form *is* the substrate-side enumeration of points in the value's Priestley dual. Nix's canonical `.drv` serialization is a syntactic byte-encoding of the recipe, not (visibly) an enumeration of points in a dual space. Does the substrate's hash-discipline claim assume the canonical form has the dual-enumeration structure? If so, Nix's hash discipline matches at the *byte level* but is not grounded in duality.
- **Whether hash injectivity holds for Nix.** SHA-256 is collision-resistant in the cryptographic sense, but per the substrate's `hash-injectivity-under-canonical-form.md` theorem (not read), injectivity is up to the duality — meaning two values with the same hash are *dual-equivalent*, hence cellwise-equal in the fiber algebra. For Nix, two `.drv`s with the same hash are byte-identical recipes, hence (by hermeticity) produce the same outputs. The byte-identity claim holds; the dual-equivalence claim is not yet checked because the duality has not been instantiated for Nix's value-domain.

## What would resolve the question

Read Jung-Rivieccio duality's statement and proof in predication-categories. Determine whether the duality applies to thin lattices like Nix's, or whether it requires the bilattice structure that Nix lacks (per [thin-value-domain](teaching/explanations/thin-value-domain.md)).

If the duality requires bilattice structure: the substrate's structural argument for hash discipline does not apply to Nix, and Nix's byte-level hash discipline is "merely" cryptographic injectivity rather than the substrate's duality-grounded discipline. The claim in the opening mapping that hash discipline matches at the byte level remains, but the deeper structural match does not.

If the duality applies to thin lattices: Nix's hash discipline is grounded in the substrate's structural argument, and the match is deeper than byte-level. This would also resolve [thin-value-domain](teaching/explanations/thin-value-domain.md)'s claim that Nix's value-domain "is not residuated in any useful sense" — at least, the question of whether residuated-lattice structure is required for the duality's applicability would have an answer.
