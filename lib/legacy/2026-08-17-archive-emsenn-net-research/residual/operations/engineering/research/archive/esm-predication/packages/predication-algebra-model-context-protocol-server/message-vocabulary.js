/**
 * The message and sender vocabulary.
 *
 * Declares the structural predicates that make "message" and "sender"
 * first-class kinds of substrate entity. The four-element bilattice
 * presupposes multiple sources (without them, ⊤ is unreachable), so
 * sender identity isn't optional — it's a precondition of the
 * algebra. This vocabulary PAM gives the substrate the predicates it
 * needs to talk about messages and senders, and a runtime model that
 * composes it in can query "who told me this", "which messages
 * contradict which other messages", and so on via pam.find.
 *
 * Predicates declared:
 *
 *   sender           the type of a sender entity
 *   message          the type of a reified message entity
 *   from-sender      the sender of a message
 *   sent-at          the ISO timestamp a message was received
 *   asserts-claim    a message's pointer at an asserted claim by
 *                    content address
 *   queries          a message's pointer at a query entity
 *   event-ordinal    a message's position in the dispatch sequence;
 *                    authoritative "after" relation independent of
 *                    wall clock (which skews under replay and DST)
 *   identifying      a predicate a sender uses to assert identity
 *                    (name, role, public-key, etc.)
 *   claim-subject    the subject of a reified claim (claim:hash)
 *   claim-predicate  the predicate of a reified claim (claim:hash)
 *   claim-object     the object of a reified claim (claim:hash)
 *
 * The vocabulary itself is a short list of is-a claims documenting
 * what these predicates mean. It composes into a runtime model as
 * ordinary claim data so downstream queries can ask about the
 * message/sender graph structure directly.
 */

const vocabularyClaims = [
  { subject: "sender",         predicate: "is-a", object: "substrate-entity-kind" },
  { subject: "message",        predicate: "is-a", object: "substrate-entity-kind" },

  { subject: "from-sender",    predicate: "is-a", object: "message-predicate" },
  { subject: "sent-at",        predicate: "is-a", object: "message-predicate" },
  { subject: "asserts-claim",  predicate: "is-a", object: "message-predicate" },
  { subject: "queries-claim",  predicate: "is-a", object: "message-predicate" },
  { subject: "event-ordinal",  predicate: "is-a", object: "message-predicate" },

  { subject: "identifying",    predicate: "is-a", object: "sender-predicate" },

  { subject: "claim-subject",   predicate: "is-a", object: "claim-introspection-predicate" },
  { subject: "claim-predicate", predicate: "is-a", object: "claim-introspection-predicate" },
  { subject: "claim-object",    predicate: "is-a", object: "claim-introspection-predicate" },

  // The sender's identity is computed as a content address over its
  // identifying claims, so two messengers that present the same
  // identifying facts become the same substrate entity automatically.
  { subject: "sender",         predicate: "identity-scheme", object: "content-addressed" },
];

/**
 * Emit the vocabulary claims. Compose these with a runtime substrate
 * via createModel (or by adding them to the substrate's backing
 * object store) to make downstream queries about messages and
 * senders structurally meaningful.
 */
function vocabulary() {
  return [...vocabularyClaims];
}

export {
  vocabulary,
  vocabularyClaims,
};
