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
import {} from "@emsenn/relating";
import { admitSeed, descend, chargeValueOfCarrier, } from "@emsenn/animating";
import { sectionOf } from "@emsenn/relating";
const ruleClass = (code, name) => Object.freeze({
    kind: "organizing-as-lakota.wolakota.rule-class",
    code,
    name,
    scottContinuous: true,
});
/**
 * The seven rule-classes S_wolak partitions into. All are quantifier-free /
 * finite-antecedent, hence Scott-continuous: a settling under these rules ALONE has
 * vanishing H¹.
 */
export const sWolakRuleClasses = Object.freeze([
    ruleClass("W1", "kin-propagation: kinship composition (Scott-continuous transitive kin-cell closure)"),
    ruleClass("W2", "conduct-evaluation: the four virtues, applied cumulatively to conduct-cells"),
    ruleClass("W3", "kin-obligation: kinship installs deontic owes-virtue-to cells (owed distinct from discharged)"),
    ruleClass("W4", "witness-bearing: wakȟáŋ-quality propagates through proper ceremonial witness"),
    ruleClass("W5", "office-installation: double-settlement — recognition AND induction"),
    ruleClass("W6", "withdrawal: iyúhášni retracts an engagement's standing-cells to ⊥"),
    ruleClass("W7", "restorative: harm → requires-repair, coupled to wiping-of-tears (no harm→sanction rule)"),
]);
const absence = (absent, importMeaning) => Object.freeze({
    kind: "organizing-as-lakota.wolakota.absence",
    absent,
    import: importMeaning,
});
/**
 * The content-bearing absences of S_wolak. These are not gaps to be filled; they are
 * the system's positive content — why the polity carries ZERO accumulation class.
 */
export const sWolakAbsences = Object.freeze([
    absence("coercion", "no rule fires conduct by force; standing is recognized through kinship and witness, never compelled"),
    absence("property", "no property-cell rules — place-relations are kin-relations, not ownership"),
    absence("punitive", "no harm→sanction rule; harm settles to requires-repair under W7, not to punishment"),
    absence("external-authority", "no external-sovereignty rules; treaties bind through W4 wakȟáŋ-marking, not external sovereignty"),
]);
/** The wólakȟota discipline, with H¹=0 in its own scope. */
export function wolakota() {
    return Object.freeze({
        kind: "organizing-as-lakota.wolakota",
        ruleClasses: sWolakRuleClasses,
        absences: sWolakAbsences,
        coherent: true,
        regime: "scott-continuous",
        h1: 0,
        recognizedNotDeclared: true,
    });
}
/** Read a conduct-membrane seed and report whether it settles cleanly under the discipline. */
export function actingWolakota(seed) {
    const section = sectionOf(descend(admitSeed(seed)).readings.knowledgeLeast);
    let conductCells = 0;
    let internalContradiction = 0;
    for (const entry of section.entries) {
        conductCells += 1;
        if (chargeValueOfCarrier(entry.charge).name === "stable")
            internalContradiction += 1;
    }
    return Object.freeze({
        kind: "organizing-as-lakota.wolakota.acting",
        conductCells,
        internalContradiction,
        acting: internalContradiction === 0,
    });
}
//# sourceMappingURL=wolakota.mjs.map