/**
 * wolakota — wólakȟota as a closure-rule discipline, the lifeway tier of
 * organizing-as-lakota.
 *
 * Wólakȟota (the Lakota way; being-Lakota as PRACTICE, not possession) is realized
 * here as a CLOSURE-RULE DISCIPLINE S_wolak (corpus:
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
 */
import { type JsonValue } from "@emsenn/relating";
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
//# sourceMappingURL=wolakota.d.mts.map