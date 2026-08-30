/**
 * wotakuye — wótakuye, kinship-as-ACT, the binding morphism over a settled kin-membrane.
 *
 * lakotaTerm: wótakuye — "kinship; the state/act of being related". Where tȟakúye
 * (./takuye.mts) is the kin-relation as inert substance, wótakuye is the binding morphism:
 * the only leg that BINDS, holding inclusion and exclusion in coherent opposition rather
 * than letting the relational tension collapse. Kinship must be enacted continuously:
 * cessation of doing is cessation of being-in-relation.
 *
 * The corpus node is content/_archive/existence/lakota/discharging/library/predicating/.
 * This is derived, not asserted: wótakuye reads the binding act over a settled kin-membrane
 * via @emsenn/animating's descent, counting kin-cells held at the Wí-position (t,
 * "potential" — the bound relations) against those left at Škáŋ (⊥) or contested at Íŋyaŋ
 * (⊤). The charge convention is the LIVE @emsenn/relating one: absurd=⊥, potential=t,
 * active=f, stable=⊤.
 */
import { sectionOf } from "@emsenn/relating";
import { admitSeed, descend, chargeValueOfCarrier, } from "@emsenn/animating";
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
//# sourceMappingURL=wotakuye.mjs.map