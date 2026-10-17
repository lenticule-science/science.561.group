// charge.mjs — the carrier, bound to the one Charge/FOUR bilattice.
//
// NO ALGEBRA LIVES HERE. Every join, meet, involution and order below is
// `@lenticule-science/articulating/predicating/positing/bilattice-charge`'s — the single
// implementation of Obsmetrologia's Charge/FOUR, which enumerates and self-verifies its own
// bilattice laws (`chargeBilatticeLawReceipt`) and ties its Klein-four gauge to the Lean theorem
// `RelMath.KleinFour.K4.isGroup`. This module is only the REPRESENTATION BINDING between that
// carrier and the wire shape this package's descent/cone/void and its consumers read.

import {
  joinKnowledge as joinKnowledgeCarrier,
  meetKnowledge as meetKnowledgeCarrier,
  joinTruth as joinTruthCarrier,
  meetTruth as meetTruthCarrier,
  negate as negateCarrier,
  conflate as conflateCarrier,
  leqKnowledge as leqKnowledgeCarrier,
  compareKnowledge as compareKnowledgeCarrier,
  isTop as isTopCarrier,
  chargeSide,
} from "@lenticule-science/articulating/predicating/positing/bilattice-charge";

/**
 * A charge: a four-valued `value` over a lossless `evidence` carrier. The `value` is the bilattice
 * pair ⟨a₊, a₋⟩ ∈ FOUR — `[F,F]` absurd, `[T,F]` potential, `[F,T]` active, `[T,T]` stable — which
 * the Klein gauge (`negate`, `conflate`) reflects; the `evidence` is the lossless carrier every op
 * ACCUMULATES on, so ⊤ ("told both") is reachable and a bit reads given (witnessed) or free (open).
 * @typedef {{ value: [boolean, boolean], evidence: [unknown[], unknown[]] }} Charge
 */

// The binding: two coordinate changes, and nothing else. A side bit ⇄ the owner's named
// `ChargeSide`; a bare witness ⇄ the mark payload the owner's carrier bears (its evidence merges by
// structural content coincidence on `.value`, so the payload is what a witness must ride in). No
// dedup, no ordering, no lattice decision is taken here — all of that is the owner's.

const side = (bit) => chargeSide(bit ? "present" : "absent");
const bit = (coordinate) => coordinate.name === "present";

const marks = (witnesses) => witnesses.map((value) => ({ kind: "utterance.mark", value }));
const witnesses = (evidence) => evidence.map((witness) => witness.value);

/** @param {Charge} charge */
const toCarrier = (charge) => ({
  kind: "bilattice-charge.carrier",
  value: [side(charge.value[0]), side(charge.value[1])],
  evidence: [marks(charge.evidence[0]), marks(charge.evidence[1])],
});

/** @returns {Charge} */
const fromCarrier = (carrier) => ({
  value: [bit(carrier.value[0]), bit(carrier.value[1])],
  evidence: [witnesses(carrier.evidence[0]), witnesses(carrier.evidence[1])],
});

const binary = (operation) => ({ left, right }) => fromCarrier(operation(toCarrier(left), toCarrier(right)));
const unary = (operation) => (charge) => fromCarrier(operation(toCarrier(charge)));

/**
 * The FOUR-place reading of a charge: its value bits `[pos, neg]`, whether each side is ASSERTED in
 * the current reading. Deliberately distinct from whether evidence EXISTS — a charge may be valued ⊥
 * on a side while its carrier holds witnesses there (a meet lowered the value but kept the evidence).
 * @param {Charge} charge @returns {[boolean, boolean]}
 */
export const present = (charge) => charge.value;

/**
 * Is a charge valued ⊤ (told both)? Both value bits set. Reads the value, not the evidence.
 * @param {Charge} charge @returns {boolean}
 */
export const isTop = (charge) => isTopCarrier(toCarrier(charge));

/**
 * The truth involution: swap the positive and negative sides, value AND evidence together (reverses
 * truth, preserves knowledge). Nothing is discarded — the witnesses ride along to their new side.
 * @param {Charge} charge @returns {Charge}
 */
export const negate = unary(negateCarrier);

/**
 * The knowledge involution (the Klein gauge's other unary): reflect the knowledge axis. On the VALUE
 * `[pos, neg] → [¬neg, ¬pos]` — swaps ⊥↔⊤, fixes t and f. The evidence stays where it is. Because it
 * complements the value without backing evidence, it is the one op that can raise a value above its
 * evidence (`conflate(⊥) = ⊤` with no witnesses) — which is how `brim` seeds its ceiling.
 * @param {Charge} charge @returns {Charge}
 */
export const conflate = unary(conflateCarrier);

/**
 * Knowledge-order join (lub in ≤_k): value bits OR'd componentwise, evidence accumulated. Both value
 * slots rise if either source asserts; evidence on both sides unions (never discards).
 * @param {{ left: Charge, right: Charge }} pair @returns {Charge}
 */
export const joinKnowledge = binary(joinKnowledgeCarrier);

/**
 * Knowledge-order meet (glb in ≤_k): value bits AND'd componentwise, evidence accumulated. The VALUE
 * can fall to ⊥ where the sources disagree, but the EVIDENCE still unions — the witnesses that drove
 * the disagreement are kept (that retention is what lets ⊤ exist and what `gap` reads).
 * @param {{ left: Charge, right: Charge }} pair @returns {Charge}
 */
export const meetKnowledge = binary(meetKnowledgeCarrier);

/**
 * Truth-order join (lub in ≤_t): value positive OR'd, value negative AND'd (truth reverses the
 * negative axis), evidence accumulated on both sides.
 * @param {{ left: Charge, right: Charge }} pair @returns {Charge}
 */
export const joinTruth = binary(joinTruthCarrier);

/**
 * Truth-order meet (glb in ≤_t): value positive AND'd, value negative OR'd, evidence accumulated.
 * @param {{ left: Charge, right: Charge }} pair @returns {Charge}
 */
export const meetTruth = binary(meetTruthCarrier);

/**
 * The knowledge order ≤_k on the VALUE: information only grows, componentwise (each side may gain
 * assertion, never lose it).
 * @param {Charge} a @param {Charge} b @returns {boolean}
 */
export const leqKnowledge = (a, b) => leqKnowledgeCarrier(toCarrier(a), toCarrier(b));

/**
 * The ≤_k witness: returns `right` when `left ≤_k right` (knowledge only grows); throws otherwise.
 * The judgment and its refusal are the owner's; only the returned carrier is this package's shape.
 * @param {{ left: Charge, right: Charge }} pair @returns {Charge}
 */
export function compareKnowledge({ left, right }) {
  compareKnowledgeCarrier({ left: toCarrier(left), right: toCarrier(right) });
  return right;
}

/**
 * The evidence-aggregation join. On the lossless carrier this is exactly `joinKnowledge`: union the
 * evidence on both sides, OR the value. Kept as a named morphism — "combine the evidence from two
 * sources" is its own reading even though the code is `joinKnowledge`.
 * @param {{ left: Charge, right: Charge }} pair @returns {Charge}
 */
export function aggregate(pair) {
  return joinKnowledge(pair);
}
