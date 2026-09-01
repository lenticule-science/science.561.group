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
import { type ChargeValue, type GaugeElementName } from "./bilattice-charge.mjs";
/**
 * The order-swap involution σ: ⟨truth, falsity⟩ ↦ ⟨truth, ¬falsity⟩ — keep the
 * truth side, complement the falsity side. The cross-order iso
 * (FOUR, ≤knowledge) ≅ (FOUR, ≤truth); it swaps `absurd ↔ active` and
 * `potential ↔ stable`, and belongs to neither order's automorphism group.
 */
export declare function orderSwapValue(value: ChargeValue): ChargeValue;
/** A D₄ gauge element: the Klein-four coset `GaugeElementName` plus the order-swap
 * coset `order-swap · K₄`. */
export type DihedralElementName = GaugeElementName | "order-swap" | "order-swap-negation" | "order-swap-conflation" | "order-swap-double";
/** All eight D₄ element names: the order-preserving K₄ coset, then the order-swapping
 * K₄·σ coset. */
export declare const dihedralElementNames: readonly DihedralElementName[];
/**
 * Apply a D₄ element to a charge value. The order-preserving coset K₄ acts by
 * `gauge`; the order-swapping coset K₄·σ acts by `gauge(k, σ value)` — σ first, then
 * the Klein-four part.
 */
export declare function dihedral(element: DihedralElementName, value: ChargeValue): ChargeValue;
/**
 * The dihedral multiplication g·h, DERIVED from the action: the unique element whose
 * action equals `dihedral(g, dihedral(h, ·))`. Throws if the composite leaves D₄ —
 * which it cannot, so a successful return also witnesses closure.
 */
export declare function dihedralMul(left: DihedralElementName, right: DihedralElementName): DihedralElementName;
/** The charge values fixed by a D₄ element. */
export declare const dihedralFixedSet: (element: DihedralElementName) => readonly ChargeValue[];
/** Whether a D₄ element preserves each order or exchanges the two orders. */
export type DihedralOrderEffectName = "order-preserving" | "order-swapping";
/** The order effect of a D₄ element: K₄ preserves each order, K₄·σ swaps them. */
export declare const dihedralOrderEffect: (element: DihedralElementName) => DihedralOrderEffectName;
/** A witness that σ carries the knowledge order to the truth order at a pair. */
export interface OrderSwapIsoWitness {
    readonly kind: "dihedral-gauge.orderSwapIso:witness";
    readonly left: ChargeValue;
    readonly right: ChargeValue;
    readonly swappedLeft: ChargeValue;
    readonly swappedRight: ChargeValue;
    readonly knowledgeLeq: boolean;
}
/** An obstruction: σ fails to carry the knowledge order to the truth order at a pair. */
export interface OrderSwapIsoObstruction {
    readonly kind: "dihedral-gauge.orderSwapIso-obstruction";
    readonly left: ChargeValue;
    readonly right: ChargeValue;
    readonly swappedLeft: ChargeValue;
    readonly swappedRight: ChargeValue;
    readonly knowledgeLeq: boolean;
    readonly truthLeqSwapped: boolean;
}
/** The result of testing σ's cross-order iso at a pair. */
export type OrderSwapIsoJudgment = OrderSwapIsoWitness | OrderSwapIsoObstruction;
/**
 * Witness that σ is the cross-order isomorphism at `(left, right)`:
 * `left ≤knowledge right ⟺ σ left ≤truth σ right`.
 */
export declare function orderSwapIso(left: ChargeValue, right: ChargeValue): OrderSwapIsoJudgment;
/** A witness of the defining dihedral relation σ∼σ = − at a value. */
export interface DihedralConjugationWitness {
    readonly kind: "dihedral-gauge.conjugation:witness";
    readonly value: ChargeValue;
    readonly conjugate: ChargeValue;
    readonly conflation: ChargeValue;
}
/** An obstruction: σ∼σ disagrees with − at a value. */
export interface DihedralConjugationObstruction {
    readonly kind: "dihedral-gauge.conjugation-obstruction";
    readonly value: ChargeValue;
    readonly conjugate: ChargeValue;
    readonly conflation: ChargeValue;
}
/** The result of testing the dihedral relation σ∼σ = − at a value. */
export type DihedralConjugationJudgment = DihedralConjugationWitness | DihedralConjugationObstruction;
/**
 * Witness the defining dihedral relation σ∼σ = − at a value: conjugating negation by
 * the order-swap yields conflation. This is the relation that makes ⟨K₄, σ⟩ the
 * dihedral group D₄ rather than an abelian extension.
 */
export declare function dihedralConjugation(value: ChargeValue): DihedralConjugationJudgment;
/** A witness that a D₄ element exchanges the two orders (it lies in the coset K₄·σ). */
export interface DihedralSwapsOrdersWitness {
    readonly kind: "dihedral-gauge.swapsOrders:witness";
    readonly element: DihedralElementName;
}
/** An obstruction: a D₄ element preserves each order (it lies in K₄), shown by the
 * first pair whose knowledge-comparability it does not send to truth-comparability. */
export interface DihedralSwapsOrdersObstruction {
    readonly kind: "dihedral-gauge.swapsOrders-obstruction";
    readonly element: DihedralElementName;
    readonly left: ChargeValue;
    readonly right: ChargeValue;
}
/** The result of testing whether a D₄ element exchanges the two orders. */
export type DihedralSwapsOrdersJudgment = DihedralSwapsOrdersWitness | DihedralSwapsOrdersObstruction;
/**
 * Witness that a D₄ element is in the order-swapping coset K₄·σ — the non-trivial
 * class of `D₄/K₄ ≅ ℤ/2`. Direction-agnostically: for every pair, `a, b` are
 * knowledge-comparable ⟺ `g a, g b` are truth-comparable (so `g` carries the
 * ≤knowledge-incomparable pair {potential, active} onto the ≤truth-incomparable pair
 * {absurd, stable}). The first failing pair is the obstruction, which every
 * order-preserving K₄ element produces.
 */
export declare function dihedralSwapsOrders(element: DihedralElementName): DihedralSwapsOrdersJudgment;
//# sourceMappingURL=dihedral-gauge.d.mts.map