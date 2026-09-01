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
import { type ChargeValueName } from "@emsenn/relating";
/** The four cardinal virtues, by their Lakota names. */
export type Virtue = "wówačhaŋtognaka" | "wóksape" | "wóohitika" | "wówačhiŋtȟaŋka";
/** One virtue as an evaluation predicate over conduct cells. */
export interface VirtueCarrier {
    readonly kind: "organizing-as-lakota.virtue";
    /** The Lakota name. */
    readonly lakota: Virtue;
    /** The English gloss of the virtue. */
    readonly gloss: string;
}
/** The four virtues, in the corpus's canonical order. */
export declare const fourVirtues: readonly VirtueCarrier[];
/**
 * Standing-as-wólakȟota — the cumulative settling of an agent's virtue-evaluation
 * cells. `standing` is the MEET (∧) over the four virtue profiles, as the charge
 * algebra pronounces it; an unevaluated virtue enters the meet at ⊥/absurd.
 */
export interface StandingAsWolakota {
    readonly kind: "organizing-as-lakota.standing-as-wolakota";
    /** The submitted per-virtue evaluation profiles (missing = not-yet-evaluated). */
    readonly profiles: Partial<Record<Virtue, ChargeValueName>>;
    /** The folded standing — the meet of the four virtue charges. */
    readonly standing: ChargeValueName;
}
/**
 * Fold the four virtue profiles into a single standing by `meetTruthValue` (the
 * truth-order meet). A virtue absent from `profiles` enters at "absurd" (⊥), the
 * not-yet-evaluated position. The returned `standing` is the algebra's verdict, not an
 * assertion.
 */
export declare function evaluate(profiles: Partial<Record<Virtue, ChargeValueName>>): StandingAsWolakota;
/**
 * Naca-standing — standing read as a FUNCTION of the virtue-profile, not of office or
 * descent. `isNaca` holds only when the standing settles at t (all four virtues at
 * potential); a naca whose conduct fails a virtue is no longer a naca.
 */
export interface NacaStanding {
    readonly kind: "organizing-as-lakota.naca-standing";
    /** The folded standing — the same meet `evaluate` computes. */
    readonly standing: ChargeValueName;
    /** True iff standing settles at t (all four virtues exhibited). */
    readonly isNaca: boolean;
}
/** Derive naca-standing from a virtue-profile via the standing meet. */
export declare function nacaStanding(profiles: Partial<Record<Virtue, ChargeValueName>>): NacaStanding;
/**
 * Story-rule installation — Marshall's story-pedagogy as closure-rule INSTALLATION. A
 * story embeds a virtue in a relational situation; the listener's substrate absorbs a
 * closure rule. This is dispositional ethics (closure-rules in the substrate), not
 * propositional ethics — only the installed form produces virtue-aligned conduct in
 * NOVEL situations.
 */
export interface StoryRuleInstallation {
    readonly kind: "organizing-as-lakota.story-rule-installation";
    /** The story that embeds the virtue. */
    readonly story: string;
    /** The virtue the story installs a closure-rule for. */
    readonly virtue: Virtue;
    /** The pedagogy is dispositional, not propositional. */
    readonly dispositional: true;
}
/** Read a story as the installation of a virtue's closure-rule. */
export declare function storyInstallsRule(story: string, virtue: Virtue): StoryRuleInstallation;
//# sourceMappingURL=four-virtues.d.mts.map