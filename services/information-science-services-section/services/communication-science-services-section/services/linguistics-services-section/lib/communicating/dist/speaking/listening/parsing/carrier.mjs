import { articulate as articulateUtterance, mark, utterance, } from "@red-cup-engineering/relating";
export const isMark = (input) => typeof input === "object" && input !== null && input.kind === "utterance.mark";
export const communicationMark = (input) => isMark(input) ? input : mark({ boundary: "communicating.document", text: input });
const communicationClaimMark = (input) => input === undefined
    ? mark({ boundary: "communicating.claim", claim: "uttered" })
    : isMark(input)
        ? input
        : mark({ boundary: "communicating.claim", claim: input });
/**
 * Admit communicating boundary values as a relating utterance.
 *
 * Domain: token Mark/string x optional claim Mark/string.
 * Codomain: communicating carrier.
 * Normalization: boundary document -> Mark -> Utterance -> relating articulate.
 */
export function admitCommunication(tokenInput, claimInput) {
    const carrier = utterance(communicationMark(tokenInput), communicationClaimMark(claimInput));
    return carrierOfUtterance(carrier);
}
/**
 * Lift an already admitted relating utterance into the communicating category.
 *
 * Domain: UtteranceCarrier.
 * Codomain: communicating carrier.
 * Law: the returned articulation is exactly relating's articulation of the
 * given utterance; no span, parse, charge, or reading is accepted as primitive.
 */
export function carrierOfUtterance(carrier) {
    return Object.freeze({
        kind: "communicating.carrier",
        utterance: carrier,
        articulation: articulateUtterance(carrier),
    });
}
export function communicationDocument(carrier) {
    const value = carrier.utterance.token.mark.value;
    if (typeof value === "object"
        && value !== null
        && "boundary" in value
        && value.boundary === "communicating.document"
        && "text" in value
        && typeof value.text === "string") {
        return value.text;
    }
    return null;
}
//# sourceMappingURL=carrier.mjs.map