/**
 * heyokha — the ⊤-bearer of the polity.
 *
 * corpus node: content/_archive/existence/lakota/.../heyokha and
 * .../lakotaean-governance/.../heyokha-bearing-preserves-lax-idempotence.
 *
 * Heyókȟa is the ⊤-bearer: the lived-bearer who continues the cosmogonic
 * contradiction (Íŋyaŋ-in-Haŋhépi, the initial ⊤) in perpetuity. Heyókȟa-conduct is
 * wakȟáŋ-marked CONTRARY conduct — cells the polity HOLDS AT ⊤ DELIBERATELY rather
 * than letting closure resolve them (the rider going one way, the polity-direction
 * another). The exemption rule: the wólakȟota discipline does NOT fire
 * virtue-evaluation on Heyókȟa-marked conduct-cells, so closure does not drive them
 * toward truth-resolution; the cell persists at ⊤. Wakíŋyaŋ (the Thunder-beings) are
 * the ⊤-bearing source of the heyókȟa vocation.
 *
 * THEOREM (heyokha-bearing-preserves-lax-idempotence): the polity's closure-2-monad
 * has NON-TRIVIAL lax-idempotence — the 2-cell μ : Cl² ⇒ Cl is a genuine non-identity
 * 2-cell — IF AND ONLY IF the polity has incumbent Heyókȟa-vocations. With heyókȟa,
 * cl² = cl on VALUES (both stop at ⊤) but the 2-cell tracking the route through the
 * heyókȟa-cells is non-trivial. Without heyókȟa, every conduct-cell is
 * virtue-evaluated, closure drives cells to truth-resolution, the 2-cell collapses to
 * identity (strict idempotence), and the polity LOSES its paraconsistency-feature.
 * So: Heyókȟa-presence ⟺ paraconsistency (the capacity to HOLD contradictions
 * productively rather than resolve them).
 *
 * Derivation from the substrate: the ⊤ position is Íŋyaŋ's cosmogonic location, so a
 * heyókȟa-mark is grounded by `markWakhan(bearer, "stable")` from tobtob-kin — the
 * aspect is read off the Wakȟáŋ-of-charge bijection (stable ⊤ = Íŋyaŋ), not asserted.
 */
import {} from "@emsenn/relating";
import { markWakhan } from "./tobtob-kin.mjs";
/**
 * Mark a conduct-cell as heyókȟa-conduct: held at ⊤ deliberately, virtue-exempt. The
 * stable (⊤) charge grounds the mark through tobtob-kin's `markWakhan`, so the aspect
 * Íŋyaŋ is the substrate's verdict on which Wakȟáŋ the ⊤ position is, not a free claim.
 */
export function markHeyokha(bearer) {
    const wakhan = markWakhan(bearer, "stable");
    return Object.freeze({
        kind: "organizing-as-lakota.heyokha-mark",
        bearer,
        heldAt: "stable",
        aspect: "Íŋyaŋ",
        virtueExempt: true,
        wakhan,
    });
}
/** How many cells of a marked field are deliberately held at ⊤ (heyókȟa-conduct). */
export function heldAtTop(marks) {
    let n = 0;
    for (const mark of marks)
        if (mark.heldAt === "stable")
            n += 1;
    return n;
}
/**
 * Read the lax-idempotence regime from the count of incumbent Heyókȟa-vocations. The
 * iff is enforced structurally: nonTrivialTwoCell, paraconsistent, and the aperiodic
 * regime all track `incumbent > 0` together.
 */
export function laxIdempotence(incumbentVocations) {
    const nonTrivialTwoCell = incumbentVocations > 0;
    return Object.freeze({
        kind: "organizing-as-lakota.lax-idempotence",
        incumbent: incumbentVocations,
        nonTrivialTwoCell,
        paraconsistent: nonTrivialTwoCell,
        regime: nonTrivialTwoCell ? "aperiodic" : "strict",
    });
}
//# sourceMappingURL=heyokha.mjs.map