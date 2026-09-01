/**
 * positing/dihedral-gauge — the order-swap σ and the dihedral gauge D₄ of FOUR.
 *
 * `bilattice-charge` carries the Klein-four gauge K₄ = ⟨negation ∼, conflation −⟩:
 * the symmetries that act WITHIN the two orders. Each K₄ element preserves or
 * reverses the knowledge order and the truth order, but it carries ≤knowledge to
 * ≤knowledge and ≤truth to ≤truth — it never leaves an order. K₄ is missing the one
 * symmetry of FOUR that EXCHANGES the two orders.
 *
 * The order-swap σ⟨truth, falsity⟩ = ⟨truth, ¬falsity⟩ is that symmetry: keep the
 * truth side, complement the falsity side. It is the order-isomorphism
 * (FOUR, ≤knowledge) ≅ (FOUR, ≤truth), swapping `absurd ↔ active` and
 * `potential ↔ stable`. σ belongs to NEITHER order's automorphism group precisely
 * because it exchanges them.
 *
 * Adjoining σ to K₄ yields the dihedral group D₄ (order 8): the full symmetry group
 * of FOUR as a doubly-ordered set — the bilattice square. The order-PRESERVING coset
 * is K₄ = {id, negation, conflation, double}; the order-SWAPPING coset is
 * K₄·σ = {order-swap, order-swap-negation, order-swap-conflation, order-swap-double},
 * each acting as `gauge(k, σ value)`. The defining dihedral relation is σ∼σ = −
 * (conjugating negation by the order-swap yields conflation); the σ-coset holds the
 * two diagonal reflections (`order-swap`, `order-swap-double`) and the two quarter
 * rotations (`order-swap-negation`, `order-swap-conflation`).
 *
 * Mirrors lean/RelMath `OrderSwapDuality` (σ) and the dihedral extension deferred in
 * `KleinFourGauge`. Defined at the value level, as the K₄ gauge is: σ complements a
 * side, which accumulated evidence cannot track, so the order-swapping coset acts on
 * charge VALUES, not on evidence.
 */
import { charge, chargeSideName, chargeValue, chargeValueNames, chargeValues, conflateValue, gauge, gaugeElementNames, leqKnowledge, leqTruth, negateValue, sameChargeValue, } from "./bilattice-charge.mjs";
const flipSide = (name) => (name === "present" ? "absent" : "present");
/** The charge value at the given side coordinates — the reverse of a value's
 * `coordinates`, resolved over the four values (no posited table). */
function valueAtCoordinates(truth, falsity) {
    const found = chargeValues.find((value) => chargeSideName(value.coordinates[0]) === truth && chargeSideName(value.coordinates[1]) === falsity);
    if (!found)
        throw new TypeError(`valueAtCoordinates: no charge value at [${truth}, ${falsity}]`);
    return found;
}
/**
 * The order-swap involution σ: ⟨truth, falsity⟩ ↦ ⟨truth, ¬falsity⟩ — keep the
 * truth side, complement the falsity side. The cross-order iso
 * (FOUR, ≤knowledge) ≅ (FOUR, ≤truth); it swaps `absurd ↔ active` and
 * `potential ↔ stable`, and belongs to neither order's automorphism group.
 */
export function orderSwapValue(value) {
    return valueAtCoordinates(chargeSideName(value.coordinates[0]), flipSide(chargeSideName(value.coordinates[1])));
}
const orderSwapCoset = ["order-swap", "order-swap-negation", "order-swap-conflation", "order-swap-double"];
/** All eight D₄ element names: the order-preserving K₄ coset, then the order-swapping
 * K₄·σ coset. */
export const dihedralElementNames = Object.freeze([...gaugeElementNames, ...orderSwapCoset]);
const isGaugeElementName = (element) => gaugeElementNames.includes(element);
/**
 * Apply a D₄ element to a charge value. The order-preserving coset K₄ acts by
 * `gauge`; the order-swapping coset K₄·σ acts by `gauge(k, σ value)` — σ first, then
 * the Klein-four part.
 */
export function dihedral(element, value) {
    switch (element) {
        case "order-swap":
            return orderSwapValue(value);
        case "order-swap-negation":
            return gauge("negation", orderSwapValue(value));
        case "order-swap-conflation":
            return gauge("conflation", orderSwapValue(value));
        case "order-swap-double":
            return gauge("double", orderSwapValue(value));
        default:
            return gauge(element, value);
    }
}
const permutationOf = (element) => chargeValueNames.map((name) => dihedral(element, chargeValue(name)).name);
const elementForPermutation = (permutation) => dihedralElementNames.find((element) => permutationOf(element).every((image, index) => image === permutation[index]));
/**
 * The dihedral multiplication g·h, DERIVED from the action: the unique element whose
 * action equals `dihedral(g, dihedral(h, ·))`. Throws if the composite leaves D₄ —
 * which it cannot, so a successful return also witnesses closure.
 */
export function dihedralMul(left, right) {
    const composite = chargeValueNames.map((name) => dihedral(left, dihedral(right, chargeValue(name))).name);
    const found = elementForPermutation(composite);
    if (!found)
        throw new TypeError(`dihedralMul: ${left}·${right} left D₄ — the gauge is not closed`);
    return found;
}
/** The charge values fixed by a D₄ element. */
export const dihedralFixedSet = (element) => Object.freeze(chargeValues.filter((value) => sameChargeValue(dihedral(element, value), value)));
/** The order effect of a D₄ element: K₄ preserves each order, K₄·σ swaps them. */
export const dihedralOrderEffect = (element) => isGaugeElementName(element) ? "order-preserving" : "order-swapping";
const leqKnowledgeValue = (left, right) => leqKnowledge(charge(left), charge(right));
const leqTruthValue = (left, right) => leqTruth(charge(left), charge(right));
/**
 * Witness that σ is the cross-order isomorphism at `(left, right)`:
 * `left ≤knowledge right ⟺ σ left ≤truth σ right`.
 */
export function orderSwapIso(left, right) {
    const swappedLeft = orderSwapValue(left);
    const swappedRight = orderSwapValue(right);
    const knowledgeLeq = leqKnowledgeValue(left, right);
    const truthLeqSwapped = leqTruthValue(swappedLeft, swappedRight);
    return knowledgeLeq === truthLeqSwapped
        ? Object.freeze({
            kind: "dihedral-gauge.orderSwapIso:witness",
            left,
            right,
            swappedLeft,
            swappedRight,
            knowledgeLeq,
        })
        : Object.freeze({
            kind: "dihedral-gauge.orderSwapIso-obstruction",
            left,
            right,
            swappedLeft,
            swappedRight,
            knowledgeLeq,
            truthLeqSwapped,
        });
}
/**
 * Witness the defining dihedral relation σ∼σ = − at a value: conjugating negation by
 * the order-swap yields conflation. This is the relation that makes ⟨K₄, σ⟩ the
 * dihedral group D₄ rather than an abelian extension.
 */
export function dihedralConjugation(value) {
    const conjugate = orderSwapValue(negateValue(orderSwapValue(value)));
    const conflation = conflateValue(value);
    return sameChargeValue(conjugate, conflation)
        ? Object.freeze({ kind: "dihedral-gauge.conjugation:witness", value, conjugate, conflation })
        : Object.freeze({ kind: "dihedral-gauge.conjugation-obstruction", value, conjugate, conflation });
}
const knowledgeComparable = (left, right) => leqKnowledgeValue(left, right) || leqKnowledgeValue(right, left);
const truthComparable = (left, right) => leqTruthValue(left, right) || leqTruthValue(right, left);
/**
 * Witness that a D₄ element is in the order-swapping coset K₄·σ — the non-trivial
 * class of `D₄/K₄ ≅ ℤ/2`. Direction-agnostically: for every pair, `a, b` are
 * knowledge-comparable ⟺ `g a, g b` are truth-comparable (so `g` carries the
 * ≤knowledge-incomparable pair {potential, active} onto the ≤truth-incomparable pair
 * {absurd, stable}). The first failing pair is the obstruction, which every
 * order-preserving K₄ element produces.
 */
export function dihedralSwapsOrders(element) {
    for (const left of chargeValues) {
        for (const right of chargeValues) {
            if (knowledgeComparable(left, right) !== truthComparable(dihedral(element, left), dihedral(element, right))) {
                return Object.freeze({ kind: "dihedral-gauge.swapsOrders-obstruction", element, left, right });
            }
        }
    }
    return Object.freeze({ kind: "dihedral-gauge.swapsOrders:witness", element });
}
//# sourceMappingURL=dihedral-gauge.mjs.map