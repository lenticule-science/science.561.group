/**
 * wolakota — wólakȟota as a closure-rule discipline, the POSITING morphism (the way)
 * of the Lakota becoming descent, sited under wótakuye (kin-relating) in
 * organizing-as-lakota.
 *
 * lakotaTerm: Wólakȟota — the Lakota way; being-Lakota as PRACTICE, not possession.
 *
 * Wólakȟota is realized here as a CLOSURE-RULE DISCIPLINE S_wolak (corpus:
 * lakota/.../wolakota-as-closure-discipline and
 * .../lakotaean-governance/.../wolakhota-closure-system): a coherent subsystem of
 * closure rules whose settlings of conduct-cells are consistent with the four virtues,
 * mitakuye oyasin, and ceremony. COHERENT means the rules do not contradict one
 * another — no ⊤ ("stable") cell arises from INTERNAL rule conflict (external witness
 * conflict is a different matter, living in an intersection with a competing system).
 * Membership is RECOGNIZED, not declared: the historical accumulation the tradition
 * recognizes as wólakȟota.
 *
 * S_wolak partitions into SEVEN rule-classes (W1 kin-propagation, W2
 * conduct-evaluation, W3 kin-obligation, W4 witness-bearing, W5 office-installation,
 * W6 withdrawal, W7 restorative), all quantifier-free / finite-antecedent and so
 * Scott-continuous (κ ≤ ω): a settling under S_wolak ALONE lives in the strict /
 * Scott-continuous regime and H¹ vanishes — a clean settling. Cohomological residue
 * arises only where S_wolak meets a competing system (the settler-state S_settler) on
 * overlapping cells; the residue is in the INTERSECTION, never in S_wolak. The system's
 * content-bearing ABSENCES (no coercion, no property, no punitive, no
 * external-authority rules) are why the polity carries ZERO accumulation class.
 *
 * This module does not posit the discipline — it DERIVES the clean-settling claim from
 * the substrate it fibers. `actingWolakota` settles a conduct-membrane through
 * @emsenn/animating's descent and reads the resulting charges off @emsenn/relating's
 * section algebra: an agent is acting wólakȟota when its conduct-cells settled with NO
 * internal contradiction (no ⊤ / "stable" cell), the algebra's own verdict on H¹=0 for
 * a settling internal to the discipline. No Lakota datum is admitted that the corpus
 * does not record.
 *
 * As the positing tier of the descent, this file is ALSO the hub that posits the way's
 * concrete content: the four virtues (wówačhaŋtognaka / wóksape / wóohitika /
 * wówačhiŋtȟaŋka — the standing-as-wólakȟota fold over them), and the seven rites
 * (witness-bearing morphisms). The Virtue / VirtueCarrier types and the Rite /
 * RiteCarrier / performRite / compose machinery are declared here; each virtue and each
 * rite carrier lives in its own sibling file and is gathered into `fourVirtues` and
 * `sevenRites` here (the seventh rite, huŋkápi, lives at the kin tier ../hunkapi.mjs).
 *
 * This is an Indigenous knowledge project under the captain's vested authority; the
 * Lakota terms are quoted faithfully and respectfully.
 */
import { type JsonValue } from "@emsenn/relating";
import { type ChargeValueName } from "@emsenn/relating";
import { type WakhanMark } from "../../wakhan.mjs";
/** The seven rule-class codes that partition S_wolak. */
export type WolakotaRuleCode = "W1" | "W2" | "W3" | "W4" | "W5" | "W6" | "W7";
/** One of the seven closure-rule classes of the wólakȟota discipline. */
export interface WolakotaRuleClass {
    readonly kind: "organizing-as-lakota.wolakota.rule-class";
    /** The class code, W1..W7. */
    readonly code: WolakotaRuleCode;
    /** The name of the rule-class. */
    readonly name: string;
    /** Quantifier-free / finite-antecedent — so the class is Scott-continuous (κ ≤ ω). */
    readonly scottContinuous: true;
}
/**
 * The seven rule-classes S_wolak partitions into. All are quantifier-free /
 * finite-antecedent, hence Scott-continuous: a settling under these rules ALONE has
 * vanishing H¹.
 */
export declare const sWolakRuleClasses: readonly WolakotaRuleClass[];
/** A rule-shape S_wolak does NOT contain — a content-bearing absence. */
export type WolakotaAbsent = "coercion" | "property" | "punitive" | "external-authority";
/** One of the discipline's content-bearing absences and the import it carries. */
export interface WolakotaAbsence {
    readonly kind: "organizing-as-lakota.wolakota.absence";
    /** The rule-shape that is absent. */
    readonly absent: WolakotaAbsent;
    /** What the absence means — the absences are why the polity has zero accumulation class. */
    readonly import: string;
}
/**
 * The content-bearing absences of S_wolak. These are not gaps to be filled; they are
 * the system's positive content — why the polity carries ZERO accumulation class.
 */
export declare const sWolakAbsences: readonly WolakotaAbsence[];
/**
 * The wólakȟota discipline S_wolak — the coherent closure-rule subsystem. In its own
 * scope (no competing system) it is internally consistent (no ⊤ from rule conflict) and
 * Scott-continuous, so H¹ vanishes: a clean settling. Membership is recognized, not
 * declared.
 */
export interface Wolakota {
    readonly kind: "organizing-as-lakota.wolakota";
    /** The seven rule-classes the discipline partitions into. */
    readonly ruleClasses: readonly WolakotaRuleClass[];
    /** The content-bearing absences (no coercion / property / punitive / external-authority). */
    readonly absences: readonly WolakotaAbsence[];
    /** The rules do not contradict one another — no ⊤ from internal conflict. */
    readonly coherent: true;
    /** All classes are quantifier-free, so the regime is Scott-continuous (κ ≤ ω). */
    readonly regime: "scott-continuous";
    /** H¹ in the discipline's OWN scope — residue lives only in the intersection with S_settler. */
    readonly h1: 0;
    /** Membership is recognized, not declared. */
    readonly recognizedNotDeclared: true;
}
/** The wólakȟota discipline, with H¹=0 in its own scope. */
export declare function wolakota(): Wolakota;
/**
 * The reading of a conduct-membrane against the discipline: whether the membrane
 * settles cleanly. An agent is acting wólakȟota when its conduct-cells were settled by
 * rules IN S_wolak — i.e. with NO internal contradiction. We test that by settling the
 * seed and counting ⊤ ("stable") cells: a settling internal to S_wolak alone has
 * vanishing H¹, so any ⊤ is the signature of contact with a competing system, not of
 * the discipline.
 */
export interface ActingWolakota {
    readonly kind: "organizing-as-lakota.wolakota.acting";
    /** How many conduct-cells the membrane settled. */
    readonly conductCells: number;
    /** How many of them are ⊤ ("stable") — internal contradiction. */
    readonly internalContradiction: number;
    /** Acting wólakȟota iff the settling carries no internal contradiction. */
    readonly acting: boolean;
}
/** Read a conduct-membrane seed and report whether it settles cleanly under the discipline. */
export declare function actingWolakota(seed: string | JsonValue): ActingWolakota;
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
/** Construct a frozen virtue carrier. */
export declare const virtue: (lakota: Virtue, gloss: string) => VirtueCarrier;
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
/** The seven rites, by their Lakota names. */
export type Rite = "iníkağapi" | "haŋbléčheyapi" | "wanáǧi yuhápi" | "wiwáŋyaŋg wačhípi" | "huŋkápi" | "išnáthi awíčhalowaŋpi" | "tȟapá wakȟáyap";
/** One rite as a witness-bearing morphism, with its gloss and the cells it witnesses. */
export interface RiteCarrier {
    readonly kind: "organizing-as-lakota.rite";
    /** The Lakota name. */
    readonly lakota: Rite;
    /** The English gloss. */
    readonly gloss: string;
    /** The witness-effect on the substrate — the cells the rite-morphism increments. */
    readonly effect: string;
}
/** The seven rites, in the order the corpus enumerates them. */
export declare const sevenRites: readonly RiteCarrier[];
/**
 * The outcome of attempting a rite. A rite performed WITHOUT proper conditions is not
 * the rite-morphism, and fires nothing (the form is not the rite). A rite performed
 * UNDER proper conditions fires a wakȟáŋ-bearing witness on its cells.
 */
export type RitePerformance = {
    readonly kind: "organizing-as-lakota.rite-performance";
    readonly rite: Rite;
    readonly fired: false;
    /** Why the form did not become the rite-morphism. */
    readonly reason: string;
} | {
    readonly kind: "organizing-as-lakota.rite-performance";
    readonly rite: Rite;
    readonly fired: true;
    /** The wakȟáŋ-marked settled cell — the witness-increment, at t (Wí). */
    readonly witness: WakhanMark<string>;
    /** The rite fired wakȟáŋ-bearing closure rules. */
    readonly wakhanBearing: true;
};
/**
 * Perform a rite on a bearer. Without proper conditions the form is not the
 * rite-morphism and nothing fires. With proper conditions the rite settles a witnessed
 * cell at t (potential) AND marks it wakȟáŋ; the witness aspect is Wí by the algebra.
 */
export declare function performRite(rite: Rite, properConditions: boolean, bearer: string): RitePerformance;
/**
 * The rites compose: the witnessed cell one rite settles participates in another's
 * morphism (a vision from haŋbléčheyapi becomes the dancer's offering in wiwáŋyaŋg
 * wačhípi; a relation from huŋkápi participates in the wičhózani the sun dance
 * maintains). This records that composition `a ; b`.
 */
export interface RiteComposition {
    readonly kind: "organizing-as-lakota.rite-composition";
    /** The rite whose witness is carried forward. */
    readonly from: Rite;
    /** The rite that consumes it. */
    readonly to: Rite;
}
/** Compose two rite-morphisms — the witness of `a` participates in `b`. */
export declare function compose(a: Rite, b: Rite): RiteComposition;
//# sourceMappingURL=wolakota.d.mts.map