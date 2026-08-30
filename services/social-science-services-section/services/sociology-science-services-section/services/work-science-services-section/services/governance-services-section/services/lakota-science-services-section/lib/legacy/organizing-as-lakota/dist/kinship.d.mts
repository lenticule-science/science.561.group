/**
 * kinship — the predicating-tier kin-morphisms of organizing-as-lakota.
 *
 * Where tobtob-kin builds the metaphysical core (the four superior Wakȟáŋ AS the four
 * charges) and mitakuye oyasin states the standing invariant that reality is a
 * kinship-cosmos, THIS module builds the morphisms that ENACT that invariant — the
 * kin-relations and the acts that bind them. The corpus node is
 * content/_archive/existence/lakota/discharging/library/predicating/.
 *
 * The captain's reading (Ella Deloria): "Being Dakota is being related" — and the being
 * is ACTIVE. tȟakúye is the kin-relation as SUBSTANCE (the kin-cell, relation as object,
 * "something they have in common"); wótakuye is kinship-as-ACT, the binding morphism that
 * holds inclusion and exclusion in coherent opposition rather than letting them collapse.
 * Kinship must be enacted continuously: cessation of doing is cessation of being-in-
 * relation. iyúhášni is the ASYMMETRIC withdrawal — it can retract an agent's standing FOR
 * AN ENGAGEMENT to ⊥, but it cannot do binding work and it does NOT sever kin-cells; only
 * active wótakuye-conduct maintains the polity. yuhápi/wóčhekiye is the witness-act (to
 * invoke, to call-on-relation), and huŋkápi is the most-formal wótakuye — the ceremony that
 * INSTALLS new kin-cells, constitutive and not decorative.
 *
 * These are derived, not asserted: wótakuye reads the binding act over a settled kin-
 * membrane via @emsenn/animating's descent, counting kin-cells held at the Wí-position (t,
 * "potential" — the bound relations) against those left at Škáŋ (⊥) or contested at Íŋyaŋ
 * (⊤). The charge convention is the LIVE @emsenn/relating one: absurd=⊥, potential=t,
 * active=f, stable=⊤. No Lakota datum is admitted that the corpus does not record.
 */
import { type ChargeValueName, type JsonValue } from "@emsenn/relating";
/**
 * A tȟakúye cell — kin-relation as SUBSTANCE, the relation-as-object ("something they
 * have in common"). It is the kin-cell itself: a subject standing in a named kin-relation
 * to an object, carrying the charge at which that relation is held.
 */
export interface TakuyeCell {
    readonly kind: "organizing-as-lakota.takuye";
    /** The relating subject. */
    readonly subject: string;
    /** The kin-predicate (e.g. "kin-of"). */
    readonly predicate: string;
    /** The related object. */
    readonly object: string;
    /** The charge at which the kin-relation is held (default t = bound). */
    readonly charge: ChargeValueName;
}
/** Construct a tȟakúye kin-cell — the kin-relation as substance, held at a charge. */
export declare function takuye(subject: string, predicate: string, object: string, charge?: ChargeValueName): TakuyeCell;
/**
 * A wótakuye reading — kinship enacted as the binding morphism over a kin-membrane. The
 * seed is settled through @emsenn/animating's descent and the resulting kin-cells are
 * tallied by the charge at which they settle: those at the Wí-position (t, "potential")
 * are the BOUND relations, those left at Škáŋ (⊥, "absurd") are unsettled, and those at
 * Íŋyaŋ (⊤, "stable") are contested. wótakuye is the only leg that BINDS — it holds the
 * relational tension in coherent opposition rather than letting it collapse.
 */
export interface Wotakuye {
    readonly kind: "organizing-as-lakota.wotakuye";
    /** Total kin-cells in the settled membrane. */
    readonly kinCells: number;
    /** Kin-cells held at t (Wí) — the bound relations. */
    readonly bound: number;
    /** Kin-cells left at ⊥ (Škáŋ) — unsettled. */
    readonly unsettled: number;
    /** Kin-cells at ⊤ (Íŋyaŋ) — contested. */
    readonly contested: number;
    /** wótakuye is the binding leg. */
    readonly binds: true;
}
/** Read the binding act of wótakuye over a kin-membrane seed. */
export declare function wotakuye(seed: string | JsonValue): Wotakuye;
/**
 * An iyúhášni reading — the WITHDRAWAL act, the asymmetric complement of wótakuye. It
 * retracts an agent's standing-cells FOR AN ENGAGEMENT to ⊥ (under-determined, "absurd"),
 * but it does NOT sever kin-cells and it cannot do binding work. This asymmetry is
 * structurally load-bearing: polity-maintenance requires ACTIVE kinship-conduct, not
 * passive non-violation — withdrawal only sustains its own pole of the relational tension.
 */
export interface IyuhaSni {
    readonly kind: "organizing-as-lakota.iyuha-sni";
    /** The withdrawing agent. */
    readonly agent: string;
    /** The engagement whose standing-cells are retracted. */
    readonly engagement: string;
    /** Standing-cells retract to ⊥ (under-determined). */
    readonly retractsTo: "absurd";
    /** It does NOT sever kin-cells. */
    readonly severs: false;
    /** It cannot bind — the asymmetry with wótakuye. */
    readonly binds: false;
}
/** Read the iyúhášni withdrawal of an agent from an engagement — not a severance. */
export declare function iyuhaSni(agent: string, engagement: string): IyuhaSni;
/**
 * A yuhápi reading — the WITNESS-act (yuhápi / wóčhekiye): to invoke kinship, to call-on-
 * relation. Prayer is the verbal invocation of kinship with a spirit; the act produces a
 * witness-bearing cell.
 */
export interface Yuhapi {
    readonly kind: "organizing-as-lakota.yuhapi";
    /** The one who witnesses / invokes. */
    readonly witness: string;
    /** The relation called upon. */
    readonly relation: string;
    /** The cell produced bears witness. */
    readonly bears: "witness";
}
/** Read the yuhápi witness-act — the invocation of a kin-relation. */
export declare function yuhapi(witness: string, relation: string): Yuhapi;
/**
 * A huŋkápi reading — the making-of-relatives, the most-formal wótakuye. The ceremony
 * INSTALLS new kin-cells in the substrate: after huŋkápi the parties ARE kin in the same
 * structural way descent-kin are. Ceremony is constitutive, not decorative. The two
 * installed tȟakúye cells (a kin-of b, b kin-of a) enter at t (Wí, "potential") — bound.
 */
export interface Hunkapi {
    readonly kind: "organizing-as-lakota.hunkapi";
    /** The two new kin-cells the ceremony installs, held at t. */
    readonly installed: readonly TakuyeCell[];
    /** It is the most-formal form of wótakuye. */
    readonly mostFormalWotakuye: true;
}
/** Enact huŋkápi between two parties — install the reciprocal kin-cells. */
export declare function hunkapi(a: string, b: string): Hunkapi;
//# sourceMappingURL=kinship.d.mts.map