// semantics/polarity.ts — extract negation, modality, and polarity from a parse.
// Uses bilattice: affirmative → t, negated → f, modalized → ⊥ (potential, not asserted).
import type { ParseResult } from "../types.ts";
import type { ChargeValue } from "../types.ts";

export interface PolarityFrame {
  readonly verb: string;
  readonly negated: boolean;
  readonly modal: string | null;
  readonly asserted: ChargeValue;
}

const NEGATORS = new Set(["not", "n't", "never", "no", "neither", "nor"]);
const MODALS = new Set(["can", "could", "may", "might", "must", "shall", "should", "will", "would"]);

/** Extract polarity and modality from a parse result. */
export function polarity(result: ParseResult): readonly PolarityFrame[] {
  const frames: PolarityFrame[] = [];
  const verbs = result.words.filter((w) => w.tags.includes("verb"));

  for (const verb of verbs) {
    // Check for negation in same clause (within sentence)
    const negated = result.words.some(
      (w) => NEGATORS.has(w.text.toLowerCase()) && Math.abs(w.i - verb.i) <= 3,
    );

    // Check for modal auxiliary in same clause
    const modalWord = result.words.find(
      (w) => MODALS.has(w.text.toLowerCase()) && Math.abs(w.i - verb.i) <= 2,
    );
    const modal = modalWord?.text.toLowerCase() ?? null;

    // Compute asserted charge
    let asserted: ChargeValue;
    if (modal !== null) {
      asserted = "⊥"; // potential, not yet asserted
    } else if (negated) {
      asserted = "f"; // false — denied
    } else {
      asserted = "t"; // true — asserted
    }

    frames.push({ verb: verb.text, negated, modal, asserted });
  }

  return frames;
}
