/**
 * tobtob-kin — the metaphysical core of organizing-as-lakota.
 *
 * Tóbtób Kiŋ ("the four-times-four") names the wakȟáŋ aspects that constitute
 * Wakȟáŋ Tȟáŋka, headed by the four SUPERIOR Wakȟáŋ — Škáŋ, Wí, Makȟá, Íŋyaŋ. The
 * captain's substantive claim (content/_archive/existence/lakota/discharging/library/
 * tobtob-kin/) is that these four ARE the four values of the relational field's
 * bilattice: not four beings *plus* logic-values, but the four logic positions in
 * cosmogonic form. The Western algebra (Belnap's FOUR, @emsenn/relating's charge) is
 * a re-presentation of what the cosmogony already names — Lakota cosmology is the
 * SOURCE-form of the bilattice, not the other way round.
 *
 * So this module does not posit the cosmogony — it DERIVES it from the substrate it
 * fibers. The four superior Wakȟáŋ are named over @emsenn/relating's four
 * `ChargeValueName`s, and the cosmogonic relations the corpus records are checked
 * against the charge algebra:
 *
 *   - Wí (t) ∨ₖ Makȟá (f) = Íŋyaŋ-residual (⊤): the two determinate truth-values,
 *     joined in KNOWLEDGE, regenerate the over-determination (the contradiction Íŋyaŋ
 *     bears). The spent rock is the knowledge-join of sun and earth.
 *   - Wí (t) ∧ₖ Makȟá (f) = Škáŋ (⊥): their knowledge-MEET is the under-determined
 *     position — the supreme judge holding the undecided, the seat determination
 *     issues from.
 *   - negation swaps Wí ↔ Makȟá (sun and earth are truth-duals) and FIXES Škáŋ and
 *     Íŋyaŋ (the ⊥/⊤ axis — the judge and the totality are self-dual). This is the
 *     corpus's reading that the determinate pair is the moving content while the
 *     judge/contradiction axis is the standing frame.
 *
 * No Lakota datum is admitted here that the corpus does not record; no charge fact is
 * asserted that the algebra does not prove. The mapping is the only free choice, and
 * it is the captain's.
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
/**
 * A cosmogonic relation the corpus records, checked against the charge algebra. The
 * `holds` flag is the proof: it is the algebra's own verdict, not an assertion.
 */
export interface CosmogonicRelation {
    readonly kind: "organizing-as-lakota.cosmogonic-relation";
    readonly statement: string;
    /** The charge-algebra operation, named. */
    readonly operation: string;
    /** The Wakȟáŋ the operation lands on. */
    readonly result: SuperiorWakan;
    /** Whether the algebra confirms it. Always true in a coherent build — the check. */
    readonly holds: boolean;
}
/**
 * The discharge of Íŋyaŋ-in-Haŋhépi — the cosmogony as the internal structure of the
 * four-charge field. Íŋyaŋ-in-Haŋhépi is the INITIAL ⊤ (power-with-nothing-to-act-on
 * is contradiction); discharging is the self-emptying that resolves it into the four
 * superior Wakȟáŋ; and the field that results regenerates ⊤ and ⊥ from its own
 * determinate pair — the cosmogony is not left behind but carried in the algebra.
 *
 * The `relations` are derived: each is computed with @emsenn/relating's value-level
 * lattice ops and its `holds` is the algebra's verdict.
 */
export interface Cosmogony {
    readonly kind: "organizing-as-lakota.cosmogony";
    /** Íŋyaŋ-in-Haŋhépi, the initial contradiction the discharge empties. */
    readonly seed: {
        readonly name: string;
        readonly position: "⊤";
        readonly charge: ChargeValueName;
    };
    /** The discharge order — the cosmogonic emergence sequence (Makȟá, Škáŋ, Wí, Íŋyaŋ-residual). */
    readonly dischargeOrder: readonly SuperiorWakan[];
    /** The four superior Wakȟáŋ the discharge produces. */
    readonly fourFold: readonly Wakan[];
    /** The recorded relations, each checked against the charge algebra. */
    readonly relations: readonly CosmogonicRelation[];
    /** Whether every recorded relation holds — the cosmogony is coherent in the substrate. */
    readonly coherent: boolean;
}
/** Derive the cosmogony from the charge algebra. */
export declare function discharge(): Cosmogony;
/**
 * Wakȟáŋ is a QUALITY a cell or rule carries when properly attended — not a separate
 * region or entity (translating Wakȟáŋ Tȟáŋka as a Christian-style God was always a
 * mistranslation). It is a marking w : Cells → {0,1}; a cell may be wakȟáŋ at any of
 * the four charges (a sacred relation held t, negated f, unsettled ⊥, or under
 * contradiction ⊤ — the signature of an attack on the sacred). The substrate enforces
 * a purity discipline: ordinary rules cannot fire on wakȟáŋ-marked cells.
 *
 * Modeled here as a predicate over a carrier of any kind, plus the charge it is
 * wakȟáŋ-at. The full closure-rule purity discipline is built at the lifeway tier
 * (wólakȟota); this is the quality itself.
 */
export interface WakhanMark<C> {
    readonly kind: "organizing-as-lakota.wakhan-mark";
    /** The cell or rule the quality attaches to. */
    readonly bearer: C;
    /** The charge it is wakȟáŋ-at. */
    readonly atCharge: ChargeValueName;
    /** The Wakȟáŋ whose position this is — the aspect of the sacred the cell bears. */
    readonly aspect: SuperiorWakan;
}
/** Mark a bearer wakȟáŋ at a charge — the quality, read through its Wakȟáŋ aspect. */
export declare function markWakhan<C>(bearer: C, atCharge: ChargeValueName): WakhanMark<C>;
/**
 * Wakȟáŋ Tȟáŋka — the encompassing sacredness of the relational whole: the GLOBAL
 * pattern of wakȟáŋ-markings taken together, the substrate-property that the sacred is
 * the structure of relation itself. Not a primitive entity; the whole-is-wakȟáŋ
 * reading of a marked field.
 */
export interface WakanTanka {
    readonly kind: "organizing-as-lakota.wakan-tanka";
    /** How many cells carry the quality. */
    readonly marked: number;
    /** The distinct Wakȟáŋ aspects present across the field. */
    readonly aspects: readonly SuperiorWakan[];
    /** The reading: the whole bears the quality (the sacred is the structure of relation). */
    readonly wholeIsWakhan: true;
}
/** Read the global wakȟáŋ pattern of a marked field as Wakȟáŋ Tȟáŋka. */
export declare function wakanTanka<C>(marks: readonly WakhanMark<C>[]): WakanTanka;
/**
 * Mitakuye oyasin ("all my relatives") — the metaphysics: reality is a kinship-cosmos,
 * a relational whole in which every being stands in kin-relation with every other.
 * This is not generalized interconnection; it is the global theorem on the relational
 * field — its content is that the field is ONE (the four-fold is fractal and
 * self-similar at every scale: cosmos = polity = kin = individual run the same FOUR).
 *
 * At this metaphysical tier it is the standing invariant the rest of the library reads
 * under; the kinship MORPHISMS that enact it (wótakuye binding, tȟakúye the kin-cell)
 * are built at the predicating tier above this core.
 */
export interface MitakuyeOyasin {
    readonly kind: "organizing-as-lakota.mitakuye-oyasin";
    /** The standing claim. */
    readonly claim: string;
    /** The four charges over which the field is read — every scale runs these. */
    readonly field: readonly ChargeValueName[];
    /** The self-similarity: the FOUR recurs at every scale of relational complexity. */
    readonly selfSimilar: true;
    /** The invariant carried: the relational whole is one. */
    readonly relationalWhole: true;
}
/** The mitakuye oyasin invariant over the four-charge field. */
export declare function mitakuyeOyasin(): MitakuyeOyasin;
//# sourceMappingURL=tobtob-kin.d.mts.map