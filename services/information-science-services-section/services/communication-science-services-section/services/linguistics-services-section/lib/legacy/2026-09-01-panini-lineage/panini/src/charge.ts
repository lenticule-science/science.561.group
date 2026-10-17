// charge.ts — panini's charge vocabulary: re-exports from MPU + syntaxis-specific
// constructors and readers. The four bilattice values and their epistemic status.
import type { Charge } from "@561-group/meme";
export type { Charge };
export {
  joinKnowledge, meetKnowledge, joinTruth, meetTruth,
  negate, conflate, isTop, isBottom, leqKnowledge,
  present, potential as potentialCharge,
} from "@561-group/memetic-processing-unit";
import { isTop, isBottom } from "@561-group/memetic-processing-unit";
import type { ChargeValue, ChargeStatus } from "./types.ts";

// ── Constants ─────────────────────────────────────────────────────────────────

/** ⊥ — absurd: told neither. The default for any unmentioned cell. */
export const BOTTOM: Charge = Object.freeze({ value: [false, false] as const, evidence: [[], []] as const });

/** t — potential: told positive only. A genuine positive finding. */
export const TRUE: Charge = Object.freeze({ value: [true, false] as const, evidence: [[], []] as const });

/** f — active: told negative only. A genuine negative finding. */
export const FALSE: Charge = Object.freeze({ value: [false, true] as const, evidence: [[], []] as const });

/** ⊤ — stable: told both. Genuine contradiction held, not discarded. */
export const TOP: Charge = Object.freeze({ value: [true, true] as const, evidence: [[], []] as const });

// ── Constructors ──────────────────────────────────────────────────────────────

/** A FALSE charge carrying a negative witness — a linting violation, a failed rule. */
export function violation(witness: unknown): Charge {
  return { value: [false, true], evidence: [[], [witness]] };
}

/** A TRUE charge carrying a positive witness — a linting compliance, a satisfied rule. */
export function compliant(witness: unknown): Charge {
  return { value: [true, false], evidence: [[witness], []] };
}

/** ⊥ — the absurd charge with no witnesses. */
export function bottom(): Charge {
  return { value: [false, false], evidence: [[], []] };
}

// ── Readers ───────────────────────────────────────────────────────────────────

/** Read the glyph of a charge: "t" | "f" | "⊤" | "⊥". */
export function value(charge: Charge): ChargeValue {
  const [p, n] = charge.value;
  if (p && n) return "⊤";
  if (p) return "t";
  if (n) return "f";
  return "⊥";
}

/** Read the epistemic status of a charge: decided (one side), ambiguous (⊤), void (⊥). */
export function status(charge: Charge): ChargeStatus {
  if (isTop(charge)) return "ambiguous";
  if (isBottom(charge)) return "void";
  return "decided";
}
