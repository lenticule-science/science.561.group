/**
 * four-virtues — the four Lakota virtues as evaluation predicates over conduct.
 *
 * Corpus: lakota/.../four-virtues-as-evaluation-predicates. The four virtues —
 * wówačhaŋtognaka (generosity), wóksape (wisdom), wóohitika (bravery),
 * wówačhiŋtȟaŋka (fortitude) — are EVALUATION PREDICATES on conduct cells. For each
 * conduct cell there are four evaluation cells (exhibits-virtue), each carrying a
 * bilattice value: t when the conduct exhibits the virtue (potential), f when it fails
 * (active), ⊥ when not-yet-evaluated (absurd), ⊤ when witnesses contradict — one sees
 * generosity, another performance (stable). Standing-as-wólakȟota is the CUMULATIVE
 * settling of an agent's virtue-evaluation cells: the MEET (∧) over the four virtues.
 *
 * This derives from the substrate rather than asserting: standing is computed by
 * folding @emsenn/relating's `meetTruthValue` — the TRUTH-order meet — across the four
 * present virtue profiles (a missing virtue defaulting to ⊥/absurd = not-yet-evaluated).
 * The truth order (f ≤ ⊥,⊤ ≤ t) is the one that reproduces the corpus's four-case table
 * exactly: the settled standing is at t only when all four are t, at f if ANY is f (a
 * single failed virtue pulls standing to f — the knowledge-meet would wrongly give ⊥
 * here), at ⊥ where incomplete, at ⊤ where conduct contradicts on a virtue (generous to
 * outsiders but stingy to relatives → ⊤ on wówačhaŋtognaka).
 * Naca-standing is then a FUNCTION of that profile, not of office or descent: a naca
 * who fails a virtue loses standing ("a naca who fails his relatives is no longer a
 * naca"). Story-pedagogy is closure-rule INSTALLATION — dispositional, not
 * propositional, ethics.
 *
 * This is an Indigenous knowledge project under the captain's vested authority; the
 * Lakota terms are quoted faithfully and respectfully.
 */
import { chargeValue, meetTruthValue, } from "@emsenn/relating";
const virtue = (lakota, gloss) => Object.freeze({ kind: "organizing-as-lakota.virtue", lakota, gloss });
/** The four virtues, in the corpus's canonical order. */
export const fourVirtues = Object.freeze([
    virtue("wówačhaŋtognaka", "generosity — giving from one's substance to the relatives"),
    virtue("wóksape", "wisdom — knowing the right relation and the right time"),
    virtue("wóohitika", "bravery — standing in danger for the people"),
    virtue("wówačhiŋtȟaŋka", "fortitude — enduring hardship without complaint"),
]);
/** The four virtues as a tuple, fixing the fold order of the meet. */
const VIRTUE_ORDER = Object.freeze([
    "wówačhaŋtognaka",
    "wóksape",
    "wóohitika",
    "wówačhiŋtȟaŋka",
]);
/**
 * Fold the four virtue profiles into a single standing by `meetTruthValue` (the
 * truth-order meet). A virtue absent from `profiles` enters at "absurd" (⊥), the
 * not-yet-evaluated position. The returned `standing` is the algebra's verdict, not an
 * assertion.
 */
export function evaluate(profiles) {
    let folded;
    for (const v of VIRTUE_ORDER) {
        const name = profiles[v] ?? "absurd";
        const value = chargeValue(name);
        folded = folded === undefined ? value : meetTruthValue(folded, value);
    }
    // VIRTUE_ORDER is non-empty, so `folded` is always set; guard for strictness.
    const standing = folded === undefined ? "absurd" : folded.name;
    return Object.freeze({
        kind: "organizing-as-lakota.standing-as-wolakota",
        profiles: Object.freeze({ ...profiles }),
        standing,
    });
}
/** Derive naca-standing from a virtue-profile via the standing meet. */
export function nacaStanding(profiles) {
    const standing = evaluate(profiles).standing;
    return Object.freeze({
        kind: "organizing-as-lakota.naca-standing",
        standing,
        isNaca: standing === "potential",
    });
}
/** Read a story as the installation of a virtue's closure-rule. */
export function storyInstallsRule(story, virtue) {
    return Object.freeze({
        kind: "organizing-as-lakota.story-rule-installation",
        story,
        virtue,
        dispositional: true,
    });
}
//# sourceMappingURL=four-virtues.mjs.map