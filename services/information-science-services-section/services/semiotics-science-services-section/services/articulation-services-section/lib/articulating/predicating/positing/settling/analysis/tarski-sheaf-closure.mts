/**
 * Finite FOUR-valued specialization of Obsmetrologia/Calculus/Order/
 * TarskiSheafClosure.lean: Edge, IsCompatible, driveFn, settle_le_of_compatible.
 *
 * For monotone rho, join{rho(q) | q <= x} = rho(x): every summand is <= rho(x)
 * and q=x occurs. Thus four positive threshold rules per directed edge compile
 * its restriction exactly into the existing immediate-consequence operator.
 * The finite closure is the least compatible assignment above its seed. This
 * binding neither implements arbitrary transfinite iteration nor computes H1.
 */
import {
  chargeValue, chargeValueNames, isChargeValueName, joinKnowledgeValue,
  type ChargeValueName,
} from '../../bilattice-charge.mjs';
import { readValuationFiber, type ValuationFiberCarrier } from '../../valuation-fiber-algebra.mjs';
import { closureRule, closureRuleSystem, eventualClosure, valuation,
  type ClosureRuleSystemCarrier } from './closure-rule-system.mjs';

export interface TarskiRestriction {
  readonly src: string;
  readonly tgt: string;
  readonly restrict: Readonly<Record<ChargeValueName, ChargeValueName>>;
}
export interface TarskiSheafComplex {
  readonly kind: 'tarski.four-complex';
  readonly vertices: readonly string[];
  readonly edges: readonly TarskiRestriction[];
}
export type TarskiComplexAdmission =
  | { readonly kind: 'admitted'; readonly complex: TarskiSheafComplex }
  | { readonly kind: 'refused'; readonly reason: 'invalid-carrier' | 'invalid-edge' | 'nonmonotone-restriction'; readonly edge?: number };
const leq = (a: ChargeValueName, b: ChargeValueName): boolean =>
  joinKnowledgeValue(chargeValue(a), chargeValue(b)).name === b;

/** Validate the complete finite restriction tables and the theorem's monotonicity premise. */
export function admitTarskiSheafComplex(input: unknown): TarskiComplexAdmission {
  if (input === null || typeof input !== 'object') return Object.freeze({ kind: 'refused', reason: 'invalid-carrier' });
  const value = input as Partial<TarskiSheafComplex>;
  if (!Array.isArray(value.vertices) || value.vertices.length === 0
    || value.vertices.some(v => typeof v !== 'string' || v.length === 0)
    || new Set(value.vertices).size !== value.vertices.length || !Array.isArray(value.edges)) {
    return Object.freeze({ kind: 'refused', reason: 'invalid-carrier' });
  }
  const edges: TarskiRestriction[] = [];
  for (const [edge, e] of value.edges.entries()) {
    if (e === null || typeof e !== 'object' || !value.vertices.includes(e.src)
      || !value.vertices.includes(e.tgt) || e.restrict === null || typeof e.restrict !== 'object'
      || chargeValueNames.some(q => typeof e.restrict[q] !== 'string' || !isChargeValueName(e.restrict[q]))) {
      return Object.freeze({ kind: 'refused', reason: 'invalid-edge', edge });
    }
    if (chargeValueNames.some(a => chargeValueNames.some(b => leq(a,b) && !leq(e.restrict[a],e.restrict[b])))) {
      return Object.freeze({ kind: 'refused', reason: 'nonmonotone-restriction', edge });
    }
    edges.push(Object.freeze({src:e.src, tgt:e.tgt, restrict:Object.freeze({
      absurd:e.restrict.absurd, potential:e.restrict.potential, active:e.restrict.active, stable:e.restrict.stable,
    })}));
  }
  return Object.freeze({ kind:'admitted', complex:Object.freeze({ kind:'tarski.four-complex',
    vertices:Object.freeze([...value.vertices]), edges:Object.freeze(edges) }) });
}

/** Representation compilation, with no second fixed-point solver. */
export function compileTarskiSheaf(complex: TarskiSheafComplex): ClosureRuleSystemCarrier {
  const admission = admitTarskiSheafComplex(complex);
  if (admission.kind === 'refused') throw new TypeError(`compileTarskiSheaf: ${admission.reason}`);
  return closureRuleSystem(complex.vertices, complex.edges.flatMap((edge,index) =>
    chargeValueNames.map(q => closureRule(`restriction:${index}:${q}`, [{cell:edge.src,atLeast:q}],
      {cell:edge.tgt,charge:edge.restrict[q]}))));
}
export interface TarskiSheafSettlement {
  readonly kind: 'tarski.four-settlement';
  readonly section: ValuationFiberCarrier;
  readonly compatible: boolean;
}
export function isTarskiCompatible(complex: TarskiSheafComplex, section: ValuationFiberCarrier): boolean {
  return complex.edges.every(edge => leq(edge.restrict[readValuationFiber(section,edge.src)],readValuationFiber(section,edge.tgt)));
}
export function settleTarskiSheaf(complex: TarskiSheafComplex,
  seed: Readonly<Record<string,ChargeValueName>>): TarskiSheafSettlement {
  const system = compileTarskiSheaf(complex);
  const section = eventualClosure(system,valuation(complex.vertices,seed));
  return Object.freeze({ kind:'tarski.four-settlement', section, compatible:isTarskiCompatible(complex,section) });
}
