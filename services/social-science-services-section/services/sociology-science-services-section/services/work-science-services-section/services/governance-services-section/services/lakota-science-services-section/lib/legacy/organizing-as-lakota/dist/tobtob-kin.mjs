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
import { chargeValue, chargeValueNames, joinKnowledgeValue, meetKnowledgeValue, negateValue, } from "@emsenn/relating";
const wakan = (w) => Object.freeze(w);
/**
 * The four superior Wakȟáŋ as the four charges. The charge identities are the
 * load-bearing claim — they are the LIVE @emsenn/relating value names (absurd=⊥,
 * potential=t, active=f, stable=⊤), the convention organizing already reads
 * (`open: absurd`, `contested: stable`). NOT the Lean ArticulationCell corner names.
 */
export const skan = wakan({
    kind: "organizing-as-lakota.wakan",
    name: "Škáŋ",
    gloss: "Sky / Motion — the moving-principle, giver of naǧí, supreme judge",
    charge: "absurd",
    position: "⊥",
    logicRole: "under-determined: nothing yet pronounced; the seat determination issues from",
    cosmogonicRole: "the power that rose from Íŋyaŋ's blood — the engine of the field; supreme in present rank",
    emergenceRank: 2,
});
export const wi = wakan({
    kind: "organizing-as-lakota.wakan",
    name: "Wí",
    gloss: "Sun — the luminous affirmation, the ceremonial chief, warmth-and-life",
    charge: "potential",
    position: "t",
    logicRole: "true: positive determination; the lit-up assertion",
    cosmogonicRole: "created to warm Makȟá when she complained of the cold — the sun-as-yes",
    emergenceRank: 3,
});
export const makha = wakan({
    kind: "organizing-as-lakota.wakan",
    name: "Makȟá",
    gloss: "Earth — the grounded complement, the receiving-mother, the dense substrate",
    charge: "active",
    position: "f",
    logicRole: "false: negative determination; the not-yet-light ground",
    cosmogonicRole: "Íŋyaŋ's blood became Earth and water — the material that receives",
    emergenceRank: 1,
});
export const inyan = wakan({
    kind: "organizing-as-lakota.wakan",
    name: "Íŋyaŋ",
    gloss: "Rock — first in origin, last in present rank; the spent-source-as-totality",
    charge: "stable",
    position: "⊤",
    logicRole: "over-determined: both true and false at once; the contradiction-bearer",
    cosmogonicRole: "the self-emptied one who shrivelled to hard rock — his pouring-out IS the field",
    emergenceRank: 4,
});
/** The four superior Wakȟáŋ, in the canonical charge order ⊥, t, f, ⊤. */
export const tobtobKin = Object.freeze([skan, wi, makha, inyan]);
const byCharge = Object.freeze({
    absurd: skan,
    potential: wi,
    active: makha,
    stable: inyan,
});
const byName = Object.freeze({
    "Škáŋ": skan,
    "Wí": wi,
    "Makȟá": makha,
    "Íŋyaŋ": inyan,
});
/** The superior Wakȟáŋ a charge value IS — the captain's bijection charge ≅ Wakȟáŋ. */
export const wakanOfCharge = (charge) => byCharge[charge];
/** The charge value a superior Wakȟáŋ IS. */
export const chargeOfWakan = (name) => byName[name].charge;
const sameValue = (a, b) => a.name === b.name;
/** Derive the cosmogony from the charge algebra. */
export function discharge() {
    const t = chargeValue("potential"); // Wí
    const f = chargeValue("active"); // Makȟá
    const join = joinKnowledgeValue(t, f); // Wí ∨ₖ Makȟá
    const meet = meetKnowledgeValue(t, f); // Wí ∧ₖ Makȟá
    const negWi = negateValue(t); // ∼Wí
    const negSkan = negateValue(chargeValue("absurd")); // ∼Škáŋ
    const negInyan = negateValue(chargeValue("stable")); // ∼Íŋyaŋ
    const relations = [
        {
            kind: "organizing-as-lakota.cosmogonic-relation",
            statement: "Wí (t) ∨ₖ Makȟá (f) = Íŋyaŋ-residual (⊤): sun joined to earth in knowledge regenerates the contradiction",
            operation: "joinKnowledgeValue(potential, active)",
            result: "Íŋyaŋ",
            holds: sameValue(join, chargeValue("stable")),
        },
        {
            kind: "organizing-as-lakota.cosmogonic-relation",
            statement: "Wí (t) ∧ₖ Makȟá (f) = Škáŋ (⊥): sun met with earth in knowledge is the under-determined seat of judgement",
            operation: "meetKnowledgeValue(potential, active)",
            result: "Škáŋ",
            holds: sameValue(meet, chargeValue("absurd")),
        },
        {
            kind: "organizing-as-lakota.cosmogonic-relation",
            statement: "∼Wí = Makȟá: sun and earth are truth-duals (negation swaps the determinate pair)",
            operation: "negateValue(potential)",
            result: "Makȟá",
            holds: sameValue(negWi, chargeValue("active")),
        },
        {
            kind: "organizing-as-lakota.cosmogonic-relation",
            statement: "∼Škáŋ = Škáŋ: the moving-judge at ⊥ is self-dual — the standing frame, not moving content",
            operation: "negateValue(absurd)",
            result: "Škáŋ",
            holds: sameValue(negSkan, chargeValue("absurd")),
        },
        {
            kind: "organizing-as-lakota.cosmogonic-relation",
            statement: "∼Íŋyaŋ = Íŋyaŋ: the contradiction-bearer at ⊤ is self-dual — the totality, not moving content",
            operation: "negateValue(stable)",
            result: "Íŋyaŋ",
            holds: sameValue(negInyan, chargeValue("stable")),
        },
    ];
    return Object.freeze({
        kind: "organizing-as-lakota.cosmogony",
        seed: Object.freeze({ name: "Íŋyaŋ-in-Haŋhépi", position: "⊤", charge: "stable" }),
        dischargeOrder: Object.freeze([...tobtobKin].sort((a, b) => a.emergenceRank - b.emergenceRank).map((w) => w.name)),
        fourFold: tobtobKin,
        relations: Object.freeze(relations.map((r) => Object.freeze(r))),
        coherent: relations.every((r) => r.holds),
    });
}
/** Mark a bearer wakȟáŋ at a charge — the quality, read through its Wakȟáŋ aspect. */
export function markWakhan(bearer, atCharge) {
    return Object.freeze({
        kind: "organizing-as-lakota.wakhan-mark",
        bearer,
        atCharge,
        aspect: wakanOfCharge(atCharge).name,
    });
}
/** Read the global wakȟáŋ pattern of a marked field as Wakȟáŋ Tȟáŋka. */
export function wakanTanka(marks) {
    const aspects = [];
    for (const mark of marks)
        if (!aspects.includes(mark.aspect))
            aspects.push(mark.aspect);
    return Object.freeze({
        kind: "organizing-as-lakota.wakan-tanka",
        marked: marks.length,
        aspects: Object.freeze(aspects),
        wholeIsWakhan: true,
    });
}
/** The mitakuye oyasin invariant over the four-charge field. */
export function mitakuyeOyasin() {
    return Object.freeze({
        kind: "organizing-as-lakota.mitakuye-oyasin",
        claim: "all my relatives: reality is a kinship-cosmos; every being stands in kin-relation with every other",
        field: Object.freeze([...chargeValueNames]),
        selfSimilar: true,
        relationalWhole: true,
    });
}
//# sourceMappingURL=tobtob-kin.mjs.map