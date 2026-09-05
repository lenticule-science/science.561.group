/**
 * speaking/illocuting — speech acts as locution, illocution, and perlocution.
 *
 * The surface names saying-as-doing directly: a locution carries form, sense,
 * and reference; an illocution gives force to propositional content; a
 * perlocution records the effected interpretant or common-ground movement.
 */
import { articulateCommunication, communicationDocument } from "../listening/parsing/index.mjs";
/** Read an admitted communication carrier as a locutionary act. */
export function locute(carrier, bundle) {
    const form = communicationDocument(carrier);
    if (form === null)
        throw new TypeError("locute: carrier token is not a communicating.document mark");
    return Object.freeze({
        kind: "communicating.speaking.illocuting.locution",
        form,
        sense: articulateCommunication(carrier, bundle),
        reference: carrier,
    });
}
/** Give illocutionary force to a locution. */
export const illocute = (locution, force, proposition) => Object.freeze({
    kind: "communicating.speaking.illocuting.illocution",
    locution,
    force,
    proposition,
});
/** Record the perlocutionary effect of an illocution. */
export const perlocute = (illocution, effect) => Object.freeze({
    kind: "communicating.speaking.illocuting.perlocution",
    illocution,
    effect,
});
/** Compose locution, illocution, and perlocution into one speech-act carrier. */
export function speechAct(locution, force, proposition, effect) {
    const illocution = illocute(locution, force, proposition);
    return Object.freeze({
        kind: "communicating.speaking.illocuting.speechAct",
        locution,
        illocution,
        perlocution: perlocute(illocution, effect),
    });
}
/** Admit a communicating carrier directly into a complete speech act. */
export function performSpeechAct(carrier, force, proposition, effect, bundle) {
    return speechAct(locute(carrier, bundle), force, proposition, effect);
}
//# sourceMappingURL=index.mjs.map