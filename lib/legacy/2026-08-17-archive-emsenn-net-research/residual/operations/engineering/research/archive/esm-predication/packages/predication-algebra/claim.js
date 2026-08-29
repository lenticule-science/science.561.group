/**
 * Claims — bilattice-valued subject-predicate-object triples.
 *
 * A claim is an SPO triple. That is the input shape. Bilattice values
 * are properties of fiber geometry, not of input claims. They arise
 * from settlement: positive evidence accumulating, inversion morphisms
 * transporting, fibers composing, knowledge-joins resolving.
 *
 * Internally an encoded claim has a `value` slot because the algebra
 * needs somewhere to put bilattice values for derived claims (the
 * inversion morphism produces a "false"-valued claim by negate during
 * transport; rule inference computes values via fiber operations).
 * Raw claims from message() always start as positive evidence ("true"),
 * which encodes the input act itself: the messenger asserts the triple
 * as evidence. Internal callers (functor.js, the morphism modules)
 * set the value field on the encoded record after encoding via
 * encodeDerivedClaim.
 */


function normalizeTerm(value, role) {
  if (typeof value === "string" && value.length > 0) return value;
  if (value && typeof value === "object") return value;
  throw new TypeError(`claim.${role} must be a non-empty string or object`);
}

/**
 * Encode an input claim into an algebra-ready triple.
 *
 * The algebra needs {sid, pid, oid, value}. The intern table is
 * required — terms are interned on input, and the triple stores only
 * integer IDs. String values are recoverable via strings.value(id).
 */
function encodeClaim(input, internTable) {
  if (input && Object.prototype.hasOwnProperty.call(input, "value")) {
    throw new TypeError(
      "claims do not carry values on input. A claim is an SPO triple. " +
      "Bilattice values arise from fiber geometry, not from input."
    );
  }

  const subject = normalizeTerm(input.subject, "subject");
  const predicate = normalizeTerm(input.predicate, "predicate");
  const object = normalizeTerm(input.object, "object");

  return {
    sid: internTable.intern(subject),
    pid: internTable.intern(predicate),
    oid: internTable.intern(object),
    value: "true",
  };
}

/**
 * Encode a derived claim with a pre-computed bilattice value.
 */
function encodeDerivedClaim(input, internTable) {
  const { value, ...spo } = input;
  const claim = encodeClaim(spo, internTable);
  if (value != null) claim.value = value;
  return claim;
}

/**
 * Hydrate a stored triple back to string form for serialization
 * or external consumption.
 */
function hydrateClaim(strings, triple) {
  return {
    subject: strings.value(triple.sid),
    predicate: strings.value(triple.pid),
    object: strings.value(triple.oid),
    value: triple.value,
  };
}

export { normalizeTerm, encodeClaim, encodeDerivedClaim, hydrateClaim };
