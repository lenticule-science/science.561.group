/**
 * tobtob-kin — the metaphysical core of organizing-as-lakota.
 *
 * lakotaTerm: Tóbtób Kiŋ ("the four-times-four")
 *
 * Tóbtób Kiŋ names the wakȟáŋ aspects that constitute Wakȟáŋ Tȟáŋka, headed by the four
 * SUPERIOR Wakȟáŋ — Škáŋ, Wí, Makȟá, Íŋyaŋ. The captain's substantive claim
 * (content/_archive/existence/lakota/discharging/library/tobtob-kin/) is that these
 * four ARE the four values of the relational field's bilattice: not four beings *plus*
 * logic-values, but the four logic positions in cosmogonic form. The Western algebra
 * (Belnap's FOUR, @emsenn/relating's charge) is a re-presentation of what the cosmogony
 * already names — Lakota cosmology is the SOURCE-form of the bilattice, not the other
 * way round.
 *
 * So this module does not posit the cosmogony — it names the four superior Wakȟáŋ over
 * @emsenn/relating's four `ChargeValueName`s and exposes the bijection charge ≅ Wakȟáŋ.
 * The discharge-derived cosmogony itself (the self-emptying that resolves the initial ⊤
 * into the four-fold, checked against the charge algebra) lives at the iyókheya reading
 * (./iyokheya.mjs); this is the shared four-fold core it fibers over.
 *
 * No Lakota datum is admitted here that the corpus does not record; no charge fact is
 * asserted that the algebra does not prove. The mapping is the only free choice, and
 * it is the captain's. This file imports nothing from siblings.
 */
import { type ChargeValueName } from "@emsenn/relating";
/** The four superior Wakȟáŋ — the heads of the Tóbtób Kiŋ. */
export type SuperiorWakan = "Škáŋ" | "Wí" | "Makȟá" | "Íŋyaŋ";
/** One superior Wakȟáŋ, named over a charge value with its cosmogonic and logic roles. */
export interface Wakan {
    readonly kind: "organizing-as-lakota.wakan";
    /** The Lakota name. */
    readonly name: SuperiorWakan;
    /** The English gloss of the being. */
    readonly gloss: string;
    /** The charge value this Wakȟáŋ IS (the captain's substantive identity). */
    readonly charge: ChargeValueName;
    /** The bilattice position, in the corpus's notation. */
    readonly position: "⊥" | "t" | "f" | "⊤";
    /** The logic role of the position in the relational field. */
    readonly logicRole: string;
    /** The cosmogonic role — what this Wakȟáŋ is in the discharge of Íŋyaŋ-in-Haŋhépi. */
    readonly cosmogonicRole: string;
    /** The rank in the cosmogonic emergence order (1 = first to emerge from the emptying). */
    readonly emergenceRank: 1 | 2 | 3 | 4;
}
/**
 * The four superior Wakȟáŋ as the four charges. The charge identities are the
 * load-bearing claim — they are the LIVE @emsenn/relating value names (absurd=⊥,
 * potential=t, active=f, stable=⊤), the convention organizing already reads
 * (`open: absurd`, `contested: stable`). NOT the Lean ArticulationCell corner names.
 */
export declare const skan: Wakan;
export declare const wi: Wakan;
export declare const makha: Wakan;
export declare const inyan: Wakan;
/** The four superior Wakȟáŋ, in the canonical charge order ⊥, t, f, ⊤. */
export declare const tobtobKin: readonly Wakan[];
/** The superior Wakȟáŋ a charge value IS — the captain's bijection charge ≅ Wakȟáŋ. */
export declare const wakanOfCharge: (charge: ChargeValueName) => Wakan;
/** The charge value a superior Wakȟáŋ IS. */
export declare const chargeOfWakan: (name: SuperiorWakan) => ChargeValueName;
//# sourceMappingURL=tobtob-kin.d.mts.map