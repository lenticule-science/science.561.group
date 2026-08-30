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
import { sectionOf } from "@emsenn/relating";
import { admitSeed, descend, chargeValueOfCarrier, } from "@emsenn/animating";
/** Construct a tȟakúye kin-cell — the kin-relation as substance, held at a charge. */
export function takuye(subject, predicate, object, charge = "potential") {
    return Object.freeze({
        kind: "organizing-as-lakota.takuye",
        subject,
        predicate,
        object,
        charge,
    });
}
/** Read the binding act of wótakuye over a kin-membrane seed. */
export function wotakuye(seed) {
    const section = sectionOf(descend(admitSeed(seed)).readings.knowledgeLeast);
    let bound = 0;
    let unsettled = 0;
    let contested = 0;
    for (const entry of section.entries) {
        const name = chargeValueOfCarrier(entry.charge).name;
        if (name === "potential")
            bound += 1;
        else if (name === "absurd")
            unsettled += 1;
        else if (name === "stable")
            contested += 1;
    }
    return Object.freeze({
        kind: "organizing-as-lakota.wotakuye",
        kinCells: section.entries.length,
        bound,
        unsettled,
        contested,
        binds: true,
    });
}
/** Read the iyúhášni withdrawal of an agent from an engagement — not a severance. */
export function iyuhaSni(agent, engagement) {
    return Object.freeze({
        kind: "organizing-as-lakota.iyuha-sni",
        agent,
        engagement,
        retractsTo: "absurd",
        severs: false,
        binds: false,
    });
}
/** Read the yuhápi witness-act — the invocation of a kin-relation. */
export function yuhapi(witness, relation) {
    return Object.freeze({
        kind: "organizing-as-lakota.yuhapi",
        witness,
        relation,
        bears: "witness",
    });
}
/** Enact huŋkápi between two parties — install the reciprocal kin-cells. */
export function hunkapi(a, b) {
    return Object.freeze({
        kind: "organizing-as-lakota.hunkapi",
        installed: Object.freeze([
            takuye(a, "kin-of", b, "potential"),
            takuye(b, "kin-of", a, "potential"),
        ]),
        mostFormalWotakuye: true,
    });
}
//# sourceMappingURL=kinship.mjs.map