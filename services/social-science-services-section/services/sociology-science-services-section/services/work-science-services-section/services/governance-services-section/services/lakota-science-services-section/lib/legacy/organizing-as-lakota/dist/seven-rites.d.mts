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
import { type WakhanMark } from "./tobtob-kin.mjs";
/** The seven rites, by their Lakota names. */
export type Rite = "iníkağapi" | "haŋbléčheyapi" | "wanáǧi yuhápi" | "wiwáŋyaŋg wačhípi" | "huŋkápi" | "išnáthi awíčhalowaŋpi" | "tȟapá wakȟáyap";
/** One rite as a witness-bearing morphism, with its gloss and the cells it witnesses. */
export interface RiteCarrier {
    readonly kind: "organizing-as-lakota.rite";
    /** The Lakota name. */
    readonly lakota: Rite;
    /** The English gloss. */
    readonly gloss: string;
    /** The witness-effect on the substrate — the cells the rite-morphism increments. */
    readonly effect: string;
}
/** The seven rites, in the order the corpus enumerates them. */
export declare const sevenRites: readonly RiteCarrier[];
/**
 * The outcome of attempting a rite. A rite performed WITHOUT proper conditions is not
 * the rite-morphism, and fires nothing (the form is not the rite). A rite performed
 * UNDER proper conditions fires a wakȟáŋ-bearing witness on its cells.
 */
export type RitePerformance = {
    readonly kind: "organizing-as-lakota.rite-performance";
    readonly rite: Rite;
    readonly fired: false;
    /** Why the form did not become the rite-morphism. */
    readonly reason: string;
} | {
    readonly kind: "organizing-as-lakota.rite-performance";
    readonly rite: Rite;
    readonly fired: true;
    /** The wakȟáŋ-marked settled cell — the witness-increment, at t (Wí). */
    readonly witness: WakhanMark<string>;
    /** The rite fired wakȟáŋ-bearing closure rules. */
    readonly wakhanBearing: true;
};
/**
 * Perform a rite on a bearer. Without proper conditions the form is not the
 * rite-morphism and nothing fires. With proper conditions the rite settles a witnessed
 * cell at t (potential) AND marks it wakȟáŋ; the witness aspect is Wí by the algebra.
 */
export declare function performRite(rite: Rite, properConditions: boolean, bearer: string): RitePerformance;
/**
 * The rites compose: the witnessed cell one rite settles participates in another's
 * morphism (a vision from haŋbléčheyapi becomes the dancer's offering in wiwáŋyaŋg
 * wačhípi; a relation from huŋkápi participates in the wičhózani the sun dance
 * maintains). This records that composition `a ; b`.
 */
export interface RiteComposition {
    readonly kind: "organizing-as-lakota.rite-composition";
    /** The rite whose witness is carried forward. */
    readonly from: Rite;
    /** The rite that consumes it. */
    readonly to: Rite;
}
/** Compose two rite-morphisms — the witness of `a` participates in `b`. */
export declare function compose(a: Rite, b: Rite): RiteComposition;
//# sourceMappingURL=seven-rites.d.mts.map