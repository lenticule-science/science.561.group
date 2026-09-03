/**
 * @packageDocumentation
 *
 * settling/fixed-point — source- and upper-seeded closures in both orders.
 *
 * For each order (knowledge, truth) the closure is run from two seeds — the
 * posit valuation for the least fixed point, and a top-saturated seed for the
 * greatest — yielding stabilized valuations and their gap on the admitted cell
 * support. The bound names identify these seeds; stabilization witnesses fixedness
 * of the selected closure endomorphism, not global extremality or an enumeration
 * of all fixed points. Least-above-seed conclusions require the closure order
 * assumptions on a fixed state domain. Truth and knowledge remain distinct orders.
 */
import { chargeSide, type ChargeSide } from "../bilattice-charge.mjs";
import { type ClosureCarrier } from "./closure.mjs";
import type { Valuation } from "../fiber.mjs";
import { fixedPointGap, fixedPointGapInput, type FixedPointGapCarrier } from "./fixed-point-gap.mjs";
import {
  closePredicationValuationClosure,
  knowledgeValuationClosureOrder,
  predicationValuationClosureStageOrdinal,
  predicationValuationClosureProcess,
  truthValuationClosureOrder,
  type PredicationValuationClosureOrderCarrier,
  type PredicationValuationClosureStageOrdinalCarrier,
} from "./valuation-closure.mjs";
import { type PositPresheaf, type SheafCarrier } from "./sheaf.mjs";

export type { OrderName } from "../fiber.mjs";
import type { OrderName } from "../fiber.mjs";

/** The two extremal bounds of a fixed-point computation. */
export type BoundName = "least" | "greatest";

/** The order a fixed point is taken in (wraps a valuation closure order). */
export interface FixedPointOrderObject {
  readonly kind: "predication.valuation.fixedPoint.orderObject";
  readonly valuationClosureOrder: PredicationValuationClosureOrderCarrier;
}

/** The bound object selecting which extremal fixed point to compute. */
export interface FixedPointBoundObject {
  readonly kind: "predication.valuation.fixedPoint.boundObject";
  readonly name: BoundName;
}

/** The seed for a fixed-point closure. */
export interface FixedPointSeedCarrier {
  readonly kind: "predication.valuation.fixedPoint.seed";
  readonly order: FixedPointOrderObject;
  readonly bound: FixedPointBoundObject;
  readonly valuation: Valuation;
}

/** A closure result for the selected source or upper seed. */
export interface FixedPointExtremum {
  readonly kind: "predication.valuation.fixedPoint.extremum";
  readonly order: FixedPointOrderObject;
  readonly bound: FixedPointBoundObject;
  readonly seed: FixedPointSeedCarrier;
  readonly closure: ClosureCarrier<Valuation>;
  readonly fixedPoint: FixedPointJudgment;
  readonly sheaf: SheafCarrier;
}

/** Witness that closure stabilized to a fixed point. */
export interface FixedPointWitness {
  readonly kind: "predication.valuation.fixedPoint:witness";
  readonly order: FixedPointOrderObject;
  readonly bound: FixedPointBoundObject;
  readonly stabilizationStage: PredicationValuationClosureStageOrdinalCarrier;
  readonly value: Valuation;
}

/** Obstruction recording that closure did not stabilize. */
export interface FixedPointObstruction {
  readonly kind: "predication.valuation.fixedPoint-obstruction";
  readonly order: FixedPointOrderObject;
  readonly bound: FixedPointBoundObject;
  readonly value: Valuation;
}

/** The outcome of closing toward a fixed point. */
export type FixedPointJudgment = FixedPointWitness | FixedPointObstruction;

/** The least/greatest extrema for one order, plus their gap. */
export interface FixedPointOrderCarrier {
  readonly kind: "predication.valuation.fixedPoint.order";
  readonly order: FixedPointOrderObject;
  readonly least: FixedPointExtremum;
  readonly greatest: FixedPointExtremum;
  readonly gap: FixedPointGapCarrier;
}

/** The four seeded closure results in knowledge and truth orders. */
export interface FixedPointCarrier {
  readonly kind: "predication.valuation.fixedPoint.carrier";
  readonly knowledge: FixedPointOrderCarrier;
  readonly truth: FixedPointOrderCarrier;
}

const greatestSeedValuation = (freeFalsity: ChargeSide) => (valuation: Valuation): Valuation => Object.freeze({
  ...valuation,
  fibers: Object.freeze(valuation.fibers.map((fiber) => Object.freeze({
    ...fiber,
    assignments: Object.freeze(fiber.assignments.map((assignment) => Object.freeze({
      ...assignment,
      charge: Object.freeze({
        kind: "bilattice-charge.carrier" as const,
        value: Object.freeze([
          assignment.charge.evidence[0].length ? assignment.charge.value[0] : chargeSide("present"),
          assignment.charge.evidence[1].length ? assignment.charge.value[1] : freeFalsity,
        ] as const),
        evidence: assignment.charge.evidence,
      }),
    }))),
  }))),
});

const fixedPointSeed = (order: FixedPointOrderObject, bound: FixedPointBoundObject, valuation: Valuation): FixedPointSeedCarrier =>
  Object.freeze({ kind: "predication.valuation.fixedPoint.seed" as const, order, bound, valuation });

const sheafOfClosure = (closure: ClosureCarrier<Valuation>): SheafCarrier =>
  Object.freeze({ kind: "predication.valuation.sheaf.carrier" as const, section: closure.value });

const valuationClosureOrderOf = (name: OrderName): PredicationValuationClosureOrderCarrier =>
  name === "knowledge" ? knowledgeValuationClosureOrder : truthValuationClosureOrder;

const greatestFreeFalsity = (name: OrderName): ChargeSide =>
  name === "knowledge" ? chargeSide("present") : chargeSide("absent");

const fixedPointOrderObject = (valuationClosureOrder: PredicationValuationClosureOrderCarrier): FixedPointOrderObject =>
  Object.freeze({ kind: "predication.valuation.fixedPoint.orderObject" as const, valuationClosureOrder });

const fixedPointBoundObject = (name: BoundName): FixedPointBoundObject =>
  Object.freeze({ kind: "predication.valuation.fixedPoint.boundObject" as const, name });

class FixedPointComputation {
  readonly positCarrier: PositPresheaf;

  constructor(positCarrier: PositPresheaf) {
    this.positCarrier = positCarrier;
  }

  order(name: OrderName): FixedPointOrderObject {
    return fixedPointOrderObject(valuationClosureOrderOf(name));
  }

  seed(order: FixedPointOrderObject, bound: FixedPointBoundObject): FixedPointSeedCarrier {
    const source = this.positCarrier.traces[0]!;
    const valuation = bound.name === "least"
      ? source
      : greatestSeedValuation(greatestFreeFalsity(order.valuationClosureOrder.name))(source);
    return fixedPointSeed(order, bound, valuation);
  }

  extremum(order: FixedPointOrderObject, boundName: BoundName): FixedPointExtremum {
    const bound = fixedPointBoundObject(boundName);
    const seed = this.seed(order, bound);
    const closure = closePredicationValuationClosure(predicationValuationClosureProcess(order.valuationClosureOrder, seed.valuation)).closure;
    const fixedPoint = closure.stabilization.kind === "ordinal.closure.stabilization:witness"
      ? Object.freeze({
        kind: "predication.valuation.fixedPoint:witness" as const,
        order,
        bound,
        stabilizationStage: predicationValuationClosureStageOrdinal(closure.stabilization.ordinal),
        value: closure.stabilization.value,
      })
      : Object.freeze({ kind: "predication.valuation.fixedPoint-obstruction" as const, order, bound, value: closure.stabilization.value });
    return Object.freeze({
      kind: "predication.valuation.fixedPoint.extremum" as const,
      order,
      bound,
      seed,
      closure,
      fixedPoint,
      sheaf: sheafOfClosure(closure),
    });
  }

  orderCarrier(name: OrderName): FixedPointOrderCarrier {
    const order = this.order(name);
    const least = this.extremum(order, "least");
    const greatest = this.extremum(order, "greatest");
    return Object.freeze({
      kind: "predication.valuation.fixedPoint.order" as const,
      order,
      least,
      greatest,
      gap: fixedPointGap(fixedPointGapInput(order, least, greatest)),
    });
  }

  carrier(): FixedPointCarrier {
    return Object.freeze({
      kind: "predication.valuation.fixedPoint.carrier" as const,
      knowledge: this.orderCarrier("knowledge"),
      truth: this.orderCarrier("truth"),
    });
  }
}

/** Close a posit presheaf from its source and upper seeds in each order. */
export function fixedPoints(p: PositPresheaf): FixedPointCarrier {
  return new FixedPointComputation(p).carrier();
}
