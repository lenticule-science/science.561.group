/**
 * Hohfeldian relations and their evidence-valued readings.
 *
 * Definition: personal-services-section/emsenn-services-section/content/text/
 * glossary/terms/jural-relation.md, constituent predications and correlative pairing.
 * A correlative exchanges the parties and kind while preserving scope and evidence.
 * It is an involution, not a grant of authority. FOUR joins use articulating's
 * knowledge order; an observation of absence is not an explicit denial.
 *
 * The governance thesis in lakota-services-section/.../lakotaean-governance/
 * questions/what-is-the-theory-of-governance.md requires attribution, binding,
 * and becoming judgments. None follows from the topology of a jural graph.
 */
import { type ChargeValueName } from '@lenticule-science/articulating/predicating/positing/bilattice-charge';
export declare const JURAL_KINDS: readonly ["claim", "duty", "privilege", "no-right", "power", "liability", "immunity", "disability"];
export type JuralKind = typeof JURAL_KINDS[number];
export interface JuralRelation<Standing = ChargeValueName> {
    readonly kind: JuralKind;
    readonly active: string;
    readonly passive: string;
    readonly scope: string;
    readonly standing: Standing;
}
export declare function correlativeKind(kind: JuralKind): JuralKind;
export declare function correlate<S>(relation: JuralRelation<S>): JuralRelation<S>;
export type JuralAdmission = {
    readonly kind: 'admitted';
    readonly relations: readonly JuralRelation[];
} | {
    readonly kind: 'refused';
    readonly reason: 'expected-array' | 'invalid-relation';
    readonly index?: number;
};
/** Admission validates structure; callers retain responsibility for evidence provenance. */
export declare function admitJuralRelations(input: unknown): JuralAdmission;
export declare function poolJuralRelations(input: readonly JuralRelation[]): readonly JuralRelation[];
export interface JuralReading {
    readonly kind: 'governance.jural-reading';
    readonly relations: readonly JuralRelation[];
    readonly correlatives: readonly JuralRelation[];
    readonly observers: number;
    /** Only uncontested positive power observations contribute. This does not authorize an effect. */
    readonly powers: number;
    readonly dominion: number;
    readonly concentration: number;
    /** Powers lacking a positive duty to the same party about the same scope in this input. */
    readonly accountabilityGap: number;
    /** Directed graph cycle; does not establish temporal rotation or a sheaf cohomology class. */
    readonly directedCycle: boolean;
    readonly contested: number;
}
export declare function readJuralRelations(input: readonly JuralRelation[]): JuralReading;
export interface GovernanceActEvidence {
    readonly attribution: ChargeValueName;
    readonly binding: ChargeValueName;
    readonly becoming: ChargeValueName;
}
export interface GovernanceActReading extends GovernanceActEvidence {
    readonly kind: 'governance.act-reading';
    readonly operativity: ChargeValueName;
}
/** The thesis's knowledge meet evaluates supplied judgments; it does not manufacture them. */
export declare function governanceAct(evidence: GovernanceActEvidence): GovernanceActReading;
