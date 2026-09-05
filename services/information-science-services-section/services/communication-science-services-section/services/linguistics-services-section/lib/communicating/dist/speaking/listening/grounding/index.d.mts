/**
 * speaking/listening/grounding — common-ground carriers and update morphisms.
 *
 * A common ground is the communicative state participants treat as shared. It
 * grows by accepted assertions and refuses or removes propositions by challenge.
 */
export { CommonGroundBasisSchema, commonGroundCarrier, commonGroundPropositionCarrier, commonGroundUpdateCarrier, } from "./carriers.mjs";
export type { CommonGroundBasis, CommonGroundCarrier, CommonGroundProposition, CommonGroundUpdate, } from "./carriers.mjs";
import type { CommonGroundBasis, CommonGroundCarrier, CommonGroundProposition, CommonGroundUpdate } from "./carriers.mjs";
/** Construct a common-ground carrier from propositions already treated as shared. */
export declare const commonGround: <Proposition>(propositions?: readonly CommonGroundProposition<Proposition>[]) => CommonGroundCarrier<Proposition>;
/** Construct a proposition with the basis by which it enters common ground. */
export declare const commonGroundProposition: <Proposition>(proposition: Proposition, basis: CommonGroundBasis) => CommonGroundProposition<Proposition>;
/** Add a proposition to common ground when it is not already present. */
export declare function assertIntoCommonGround<Proposition>(carrier: CommonGroundCarrier<Proposition>, proposition: CommonGroundProposition<Proposition>): CommonGroundUpdate<Proposition>;
/** Add a proposition by accommodation rather than prior explicit assertion. */
export declare function accommodateCommonGround<Proposition>(carrier: CommonGroundCarrier<Proposition>, proposition: Proposition): CommonGroundUpdate<Proposition>;
/** Remove a proposition from common ground by challenge. */
export declare function challengeCommonGround<Proposition>(carrier: CommonGroundCarrier<Proposition>, proposition: CommonGroundProposition<Proposition>): CommonGroundUpdate<Proposition>;
//# sourceMappingURL=index.d.mts.map