/**
 * iyokheya — the articulating/discharging morphism: the cosmogony/discharge reading.
 *
 * lakotaTerm: Iyókheya ("to set apart")
 *
 * Iyókheya is the setting-apart — the articulating act by which the undivided totality
 * is set apart into the determinate four-fold. The cosmogonic self-emptying is the
 * first iyókheya: Íŋyaŋ-in-Haŋhépi (the initial ⊤, power-with-nothing-to-act-on as
 * contradiction) sets itself apart, pouring out into the four superior Wakȟáŋ, and the
 * field that results regenerates ⊤ and ⊥ from its own determinate pair — the discharge
 * is the self-emptying that resolves the contradiction, and what it sets apart it also
 * carries forward in the charge algebra.
 *
 * This module does not posit the cosmogony — it DERIVES it from the substrate it
 * fibers. The four superior Wakȟáŋ are named over @emsenn/relating's four
 * `ChargeValueName`s (in ./tobtob-kin/tobtob-kin.mjs), and the cosmogonic relations the
 * corpus records are checked against the charge algebra:
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
 * corpus node: content/_archive/existence/lakota/discharging/library/tobtob-kin/
 */
import { chargeValue, joinKnowledgeValue, meetKnowledgeValue, negateValue, } from "@emsenn/relating";
import { tobtobKin } from "./tobtob-kin/tobtob-kin.mjs";
import { iyanHanhepi } from "./iyan-hanhepi.mjs";
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
    const seed = iyanHanhepi();
    return Object.freeze({
        kind: "organizing-as-lakota.cosmogony",
        seed: Object.freeze({ name: seed.lakotaTerm, position: seed.position, charge: seed.charge }),
        dischargeOrder: Object.freeze([...tobtobKin].sort((a, b) => a.emergenceRank - b.emergenceRank).map((w) => w.name)),
        fourFold: tobtobKin,
        relations: Object.freeze(relations.map((r) => Object.freeze(r))),
        coherent: relations.every((r) => r.holds),
    });
}
/**
 * Set apart: draw a distinction, its two faces co-primitive. `heldInWotakuye` records
 * whether the distinction is held within the binding kin-relation — if not, the act
 * SEVERS (the boarding-school project was an iyókheya-without-wótakuye: it set children
 * apart from kin, language, ceremony, and place without sustaining the relational bindings
 * that would have made the separation productive; the result was harm, not knowledge).
 */
export function setApart(includes, excludes, heldInWotakuye) {
    return Object.freeze({
        kind: "organizing-as-lakota.distinction",
        includes,
        excludes,
        coPrimitive: true,
        heldInWotakuye,
        severs: !heldInWotakuye,
    });
}
//# sourceMappingURL=iyokheya.mjs.map