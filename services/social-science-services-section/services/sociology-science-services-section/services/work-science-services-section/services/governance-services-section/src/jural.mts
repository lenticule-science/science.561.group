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
import {
  chargeValue, isChargeValueName, joinKnowledgeValue, meetKnowledgeValue,
  type ChargeValueName,
} from '@lenticule-science/articulating/predicating/positing/bilattice-charge';

export const JURAL_KINDS = Object.freeze([
  'claim', 'duty', 'privilege', 'no-right', 'power', 'liability', 'immunity', 'disability',
] as const);
export type JuralKind = typeof JURAL_KINDS[number];
export interface JuralRelation<Standing = ChargeValueName> {
  readonly kind: JuralKind;
  readonly active: string;
  readonly passive: string;
  readonly scope: string;
  readonly standing: Standing;
}
const CORRELATIVE: Readonly<Record<JuralKind, JuralKind>> = Object.freeze({
  claim: 'duty', duty: 'claim', privilege: 'no-right', 'no-right': 'privilege',
  power: 'liability', liability: 'power', immunity: 'disability', disability: 'immunity',
});
export function correlativeKind(kind: JuralKind): JuralKind { return CORRELATIVE[kind]; }
export function correlate<S>(relation: JuralRelation<S>): JuralRelation<S> {
  return Object.freeze({ ...relation, kind: correlativeKind(relation.kind), active: relation.passive, passive: relation.active });
}

export type JuralAdmission =
  | { readonly kind: 'admitted'; readonly relations: readonly JuralRelation[] }
  | { readonly kind: 'refused'; readonly reason: 'expected-array' | 'invalid-relation'; readonly index?: number };
/** Admission validates structure; callers retain responsibility for evidence provenance. */
export function admitJuralRelations(input: unknown): JuralAdmission {
  if (!Array.isArray(input)) return Object.freeze({ kind: 'refused', reason: 'expected-array' });
  const relations: JuralRelation[] = [];
  for (const [index, candidate] of input.entries()) {
    if (candidate === null || typeof candidate !== 'object' || Array.isArray(candidate)
      || !JURAL_KINDS.includes(candidate.kind)
      || typeof candidate.active !== 'string' || candidate.active.length === 0
      || typeof candidate.passive !== 'string' || candidate.passive.length === 0
      || typeof candidate.scope !== 'string'
      || typeof candidate.standing !== 'string' || !isChargeValueName(candidate.standing)) {
      return Object.freeze({ kind: 'refused', reason: 'invalid-relation', index });
    }
    relations.push(Object.freeze({ kind: candidate.kind, active: candidate.active, passive: candidate.passive,
      scope: candidate.scope, standing: candidate.standing }));
  }
  return Object.freeze({ kind: 'admitted', relations: Object.freeze(relations) });
}
/** Tuple encoding preserves component boundaries even when identifiers contain delimiters. */
function key(relation: Omit<JuralRelation, 'standing'>): string {
  return JSON.stringify([relation.kind, relation.active, relation.passive, relation.scope]);
}
export function poolJuralRelations(input: readonly JuralRelation[]): readonly JuralRelation[] {
  const pooled = new Map<string, JuralRelation>();
  for (const relation of input) {
    const identity = key(relation);
    const prior = pooled.get(identity);
    pooled.set(identity, Object.freeze({ ...relation, standing: prior === undefined ? relation.standing
      : joinKnowledgeValue(chargeValue(prior.standing), chargeValue(relation.standing)).name }));
  }
  return Object.freeze([...pooled.values()].sort((a, b) => key(a) < key(b) ? -1 : key(a) > key(b) ? 1 : 0));
}

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
function hasDirectedCycle(nodes: ReadonlySet<string>, edges: ReadonlyMap<string, ReadonlySet<string>>): boolean {
  const degree = new Map([...nodes].map(node => [node, 0]));
  for (const targets of edges.values()) for (const target of targets) degree.set(target, degree.get(target)! + 1);
  const ready = [...nodes].filter(node => degree.get(node) === 0);
  let visited = 0;
  for (let cursor = 0; cursor < ready.length; cursor += 1) {
    const node = ready[cursor]!;
    visited += 1;
    for (const target of edges.get(node) ?? []) {
      const remaining = degree.get(target)! - 1;
      degree.set(target, remaining);
      if (remaining === 0) ready.push(target);
    }
  }
  return visited !== nodes.size;
}
export function readJuralRelations(input: readonly JuralRelation[]): JuralReading {
  const relations = poolJuralRelations(input);
  const observers = new Set(relations.flatMap(relation => [relation.active, relation.passive]));
  const powers = relations.filter(relation => relation.kind === 'power' && relation.standing === 'potential');
  const duties = new Set(relations.filter(relation => relation.kind === 'duty' && relation.standing === 'potential').map(key));
  const edges = new Map<string, Set<string>>();
  for (const power of powers) {
    const targets = edges.get(power.active) ?? new Set<string>();
    targets.add(power.passive);
    edges.set(power.active, targets);
  }
  // Self-relations are representable but do not increase dominion over other parties.
  const dominion = Math.max(0, ...[...edges].map(([holder, targets]) => targets.size - Number(targets.has(holder))));
  return Object.freeze({
    kind: 'governance.jural-reading', relations, correlatives: Object.freeze(relations.map(correlate)),
    observers: observers.size, powers: powers.length, dominion,
    concentration: observers.size > 1 ? dominion / (observers.size - 1) : 0,
    accountabilityGap: powers.filter(power => !duties.has(key({ ...power, kind: 'duty' }))).length,
    directedCycle: hasDirectedCycle(observers, edges),
    contested: relations.filter(relation => relation.standing === 'stable').length,
  });
}

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
export function governanceAct(evidence: GovernanceActEvidence): GovernanceActReading {
  return Object.freeze({ kind: 'governance.act-reading', ...evidence,
    operativity: meetKnowledgeValue(meetKnowledgeValue(chargeValue(evidence.attribution),
      chargeValue(evidence.binding)), chargeValue(evidence.becoming)).name });
}
