/**
 * Relation algebras as PAM data — the operations expressible from
 * Theorem 2 of the adjoint paper (specialization, inversion, parallel
 * composition).
 *
 * What's expressible:
 *
 *   - Predicate equivalence (the two predicate names are
 *     interchangeable) via bidirectional specialization.
 *   - Self-inversion: declaring a predicate as its own inverse,
 *     which produces ⊤ ("told both") on every (s, o) pair where
 *     the relation holds asymmetrically. Useful for detecting
 *     inconsistency between asserted claims and the inverse
 *     direction, NOT for symmetry in the value-preserving sense.
 *
 * What is NOT expressible from these morphism classes:
 *
 *   - Transitive closure of a relation between subjects (e.g.,
 *     parent ∘ parent → grandparent). This requires the
 *     bilattice-valued allegory composition operator $\circ$, which
 *     is treated as a parallel structure in
 *     library/domains/science/domains/information/texts/the-bilattice-valued-allegory-of-relational-composition.md
 *     and is NOT one of the fiber-functor morphisms PAM dispatches.
 *     If a vocabulary needs transitive closure, it must assert each
 *     transitive instance directly as input claims.
 *
 *   - Reflexivity (∀x. R(x, x)) — universal quantification over
 *     the domain. The bilattice algebra operates on existing fibers,
 *     not on a separate notion of "the domain". To make a relation
 *     reflexive, the user must assert (X, R, X) for each X they
 *     care about as ordinary input claims.
 *
 *   - Value-preserving symmetry (R(X, Y) → R(Y, X) at the same
 *     value) — inversion swaps subject/object AND negates the
 *     value. The result is the converse-and-negation, not the
 *     converse. Predicates that are their own inverse end up with
 *     ⊤ on the swapped pair, not t.
 *
 *   - Antisymmetry — would require constraint enforcement, which
 *     lives outside the morphism dispatch.
 *
 * Library entries here only encode the expressible part.
 */

/**
 * Predicate equivalence: declare two predicate names as
 * interchangeable via bidirectional specialization.
 *
 * After settlement, every claim under either predicate also holds
 * under the other with the same value. Useful when two vocabularies
 * use different names for the same underlying relation.
 *
 * NOTE: this is equivalence between PREDICATES, not equivalence of
 * entities under a relation.
 */
function predicateEquivalence(a, b) {
  return [
    { subject: a, predicate: "specialization", object: b },
    { subject: b, predicate: "specialization", object: a },
  ];
}

/**
 * Declare a predicate as its own inversion — produces ⊤ ("told
 * both") on every (s, o) pair where the relation is asserted in
 * one direction but not the other.
 *
 * The kernel's inversion morphism transports (X, P, Y) at value t
 * to (Y, P, X) at value f (negation). When (Y, P, X) is also
 * positively asserted, knowledge join produces ⊤. When it isn't,
 * the swap produces a fresh f-valued claim, recording the
 * asymmetry.
 *
 * Used for detecting whether a relation is symmetric in practice:
 * after settlement, examining the ⊤ concentrations identifies the
 * pairs where both directions agreed (true symmetry visible as a
 * contradiction concentration), and the f-valued claims identify
 * the pairs where the inversion was inferred but not asserted.
 *
 * Does NOT make a relation symmetric in the classical sense.
 */
function selfInversion(predicate) {
  return [
    { subject: predicate, predicate: "inversion", object: predicate },
  ];
}

export {
  predicateEquivalence,
  selfInversion,
};
