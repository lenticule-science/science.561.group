/**
 * Type hierarchies and uniform property inheritance, encoded with
 * the predicate-as-type pattern over the fiber functor's three
 * morphism classes (specialization is the only one used by this
 * module).
 *
 * The encoding: every type is a predicate. Membership in a type is
 * the claim `(subject, type-predicate, true)`. Subtype relationships
 * are specialization declarations between type predicates. Uniform
 * property inheritance is also a specialization declaration, from
 * the type predicate to the property predicate.
 *
 * Why this is correct via the morphisms (no relational composition
 * needed):
 *
 *   Specialization fires on a 1-claim declaration
 *   `(source, specialization, target)` and copies every claim under
 *   `source` to a claim under `target` at the same (s, o) point,
 *   preserving the value. So:
 *
 *     (human, specialization, mammal)
 *     (socrates, human, true)
 *
 *   derives
 *
 *     (socrates, mammal, true)
 *
 *   Add (mammal, specialization, animal) and the wavefront chains:
 *   (socrates, mammal, true) → (socrates, animal, true). Transitive
 *   closure of the hierarchy is the chain itself; the wavefront
 *   recursively asserts each derivation. Property inheritance works
 *   the same way:
 *
 *     (mammal, specialization, warm-blooded)
 *     (socrates, mammal, true)
 *
 *   derives
 *
 *     (socrates, warm-blooded, true)
 *
 * What this encoding does NOT support:
 *
 *   Per-instance properties whose object differs across instances
 *   (e.g., "this dog has four legs, that dog has three"). Specialization
 *   preserves the (s, o) point; there is no parent value to inherit.
 *   Per-instance properties stay as plain claims and are not
 *   inherited through the type hierarchy. They are not class-uniform
 *   anyway, so this is correct.
 *
 *   Negative type membership cascading: if someone asserts
 *   (socrates, mammal, false), specialization will derive
 *   (socrates, animal, false), which is "socrates is not an animal
 *   because not a mammal" — logically incorrect. Type-as-predicate
 *   encoding only handles positive-membership cleanly. In practice,
 *   ontology assertions are positive; negative claims require a
 *   different encoding.
 */

/**
 * Subtype relationship: declare `subtype` as a specialization of
 * `supertype` in the predicate-as-type encoding. Every claim under
 * `subtype` (i.e., positive membership in `subtype`) derives the
 * corresponding claim under `supertype`.
 */
function isASubtypeOf(subtype, supertype) {
  return [
    { subject: subtype, predicate: "specialization", object: supertype }
  ];
}

/**
 * Uniform property inheritance: declare that every member of
 * `typeName` has `propertyName` (with the same value as their
 * membership claim — typically `true` for boolean type membership).
 *
 * Implemented as a specialization declaration. Asserting
 * (X, typeName, true) derives (X, propertyName, true).
 */
function inheritProperty(typeName, propertyName) {
  return [
    { subject: typeName, predicate: "specialization", object: propertyName }
  ];
}

/**
 * Bundle: declare a complete type hierarchy in one call.
 *
 * Argument shape:
 *
 *   {
 *     human:  { extends: ["mammal"],  properties: ["warm-blooded", "has-heart"] },
 *     mammal: { extends: ["animal"],  properties: ["warm-blooded"] },
 *     animal: { properties: ["has-cells"] },
 *   }
 *
 * Returns the array of specialization declarations that, when
 * composed into a runtime PAM via createModel, makes the wavefront
 * propagate type membership and uniform properties through the
 * hierarchy.
 */
function ontology(hierarchy) {
  const claims = [];
  if (!hierarchy || typeof hierarchy !== "object") return claims;
  for (const [typeName, def] of Object.entries(hierarchy)) {
    if (!def) continue;
    for (const parent of def.extends || []) {
      claims.push(...isASubtypeOf(typeName, parent));
    }
    for (const prop of def.properties || []) {
      claims.push(...inheritProperty(typeName, prop));
    }
  }
  return claims;
}

export {
  isASubtypeOf,
  inheritProperty,
  ontology,
};
