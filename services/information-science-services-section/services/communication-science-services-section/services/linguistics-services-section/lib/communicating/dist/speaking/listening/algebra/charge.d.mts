import { type ChargeCarrier } from "@red-cup-engineering/relating";
export type ChargeStatus = "decided" | "ambiguous" | "void";
export declare const chargeStatus: (carrier: ChargeCarrier) => ChargeStatus;
/** Lambek fusion: combine a grammatical predicate and argument in the truth order. */
export declare const fuse: (left: ChargeCarrier, right: ChargeCarrier) => ChargeCarrier;
/** Right residual of fusion: largest a in truth order such that a * b <= c. */
export declare const implies: (b: ChargeCarrier, c: ChargeCarrier) => ChargeCarrier;
//# sourceMappingURL=charge.d.mts.map