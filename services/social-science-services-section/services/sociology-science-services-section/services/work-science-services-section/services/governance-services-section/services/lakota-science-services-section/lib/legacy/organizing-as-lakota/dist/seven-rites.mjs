/**
 * seven-rites — the seven rites as witness-bearing morphisms.
 *
 * The seven rites (corpus: lakota/discharging/library/seven-rites-as-witness-morphisms)
 * are not symbolic accompaniments to social life but OPERATIONS on the substrate. Each
 * rite, performed under PROPER CONDITIONS (wičháša wakȟáŋ standing, proper preparation,
 * place, time, and participants), produces a witness-increment on specific cells. A
 * rite-FORM performed WITHOUT those conditions is not the rite-morphism at all: the
 * substrate distinguishes the form from the rite, and the form fires nothing.
 *
 * Each genuine rite fires WAKHAN-BEARING closure rules, so its effect is not merely a
 * settled cell but a WAKHAN-MARKED settled cell. The corpus reading is that the rite
 * settles a witnessed cell at t (potential — the lit-up affirmation, Wí) AND marks it
 * wakȟáŋ. We therefore do not posit the witness: we derive it from the metaphysical
 * core, producing the increment through `markWakhan(bearer, "potential")` so that its
 * aspect IS Wí by the captain's charge ≅ Wakȟáŋ bijection — the algebra's verdict, not
 * an assertion of this module.
 *
 * The rites COMPOSE: a vision given in haŋbléčheyapi becomes the dancer's offering in
 * wiwáŋyaŋg wačhípi; a relation installed by huŋkápi participates in the wičhózani the
 * sun dance maintains. `compose` records that morphism composition.
 */
import { markWakhan } from "./tobtob-kin.mjs";
const rite = (r) => Object.freeze(r);
/** The seven rites, in the order the corpus enumerates them. */
export const sevenRites = Object.freeze([
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "iníkağapi",
        gloss: "sweat lodge / inípi — purification",
        effect: "witness-increment on the purification cells",
    }),
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "haŋbléčheyapi",
        gloss: "vision quest — crying for a vision",
        effect: "witness-increment on the vision cells, only if the vision is given",
    }),
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "wanáǧi yuhápi",
        gloss: "keeping of the soul",
        effect: "maintains the ancestor-relation cells, then releases them",
    }),
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "wiwáŋyaŋg wačhípi",
        gloss: "sun dance",
        effect: "witnesses the people standing-as-people; moves polity wičhózani toward quiescence",
    }),
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "huŋkápi",
        gloss: "making-of-relatives",
        effect: "installs kin-cells",
    }),
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "išnáthi awíčhalowaŋpi",
        gloss: "preparing-of-a-young-woman",
        effect: "witness-increment on the standing-as-woman cells",
    }),
    rite({
        kind: "organizing-as-lakota.rite",
        lakota: "tȟapá wakȟáyap",
        gloss: "throwing of the ball",
        effect: "witness-increment on the wisdom-coming cells",
    }),
]);
/**
 * Perform a rite on a bearer. Without proper conditions the form is not the
 * rite-morphism and nothing fires. With proper conditions the rite settles a witnessed
 * cell at t (potential) AND marks it wakȟáŋ; the witness aspect is Wí by the algebra.
 */
export function performRite(rite, properConditions, bearer) {
    if (!properConditions) {
        return Object.freeze({
            kind: "organizing-as-lakota.rite-performance",
            rite,
            fired: false,
            reason: "not the rite-morphism: proper conditions absent",
        });
    }
    return Object.freeze({
        kind: "organizing-as-lakota.rite-performance",
        rite,
        fired: true,
        witness: markWakhan(bearer, "potential"),
        wakhanBearing: true,
    });
}
/** Compose two rite-morphisms — the witness of `a` participates in `b`. */
export function compose(a, b) {
    return Object.freeze({
        kind: "organizing-as-lakota.rite-composition",
        from: a,
        to: b,
    });
}
//# sourceMappingURL=seven-rites.mjs.map