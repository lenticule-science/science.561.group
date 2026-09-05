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
import { type JsonValue } from "@emsenn/relating";
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
//# sourceMappingURL=wotakuye.d.mts.map