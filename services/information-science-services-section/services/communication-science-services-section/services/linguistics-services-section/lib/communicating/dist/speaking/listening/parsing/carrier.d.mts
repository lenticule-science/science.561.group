import { type ArticulationCell, type Mark, type UtteranceCarrier } from "@red-cup-engineering/relating";
/**
 * A communicating carrier is not text. It is an admitted utterance from the
 * relating substrate, plus the first articulation opened from that utterance.
 */
export interface CommunicatingCarrier {
    readonly kind: "communicating.carrier";
    readonly utterance: UtteranceCarrier;
    readonly articulation: ArticulationCell;
}
/** A decoded boundary document before admission into Marks. */
export type CommunicationBoundaryDocument = string;
/** A boundary claim carried by the root morphism. */
export type CommunicationClaim = CommunicationBoundaryDocument | Mark | undefined;
/** A boundary token carried by the root morphism. */
export type CommunicationToken = CommunicationBoundaryDocument | Mark;
export declare const isMark: (input: CommunicationToken | CommunicationClaim) => input is Mark;
export declare const communicationMark: (input: CommunicationToken) => Mark;
/**
 * Admit communicating boundary values as a relating utterance.
 *
 * Domain: token Mark/string x optional claim Mark/string.
 * Codomain: communicating carrier.
 * Normalization: boundary document -> Mark -> Utterance -> relating articulate.
 */
export declare function admitCommunication(tokenInput: CommunicationToken, claimInput?: CommunicationClaim): CommunicatingCarrier;
/**
 * Lift an already admitted relating utterance into the communicating category.
 *
 * Domain: UtteranceCarrier.
 * Codomain: communicating carrier.
 * Law: the returned articulation is exactly relating's articulation of the
 * given utterance; no span, parse, charge, or reading is accepted as primitive.
 */
export declare function carrierOfUtterance(carrier: UtteranceCarrier): CommunicatingCarrier;
export declare function communicationDocument(carrier: CommunicatingCarrier): CommunicationBoundaryDocument | null;
//# sourceMappingURL=carrier.d.mts.map