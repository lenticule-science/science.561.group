// scratch, not math: random tokens/claims and the charges they build, so tests run on real witnessed evidence
// instead of fabricated atoms — and so a test never gets hung up on told-none / "empty" sets.
// Ported unchanged from @561/development.active.math-kernel's tests/_construct-utterance.mjs — this file has
// no dependency on the kernel's scripts/, only on node:crypto, so nothing needed to change when it moved.
import { randomBytes } from "node:crypto";

// an atom: a random hashed id — a token or a claim.
export const id = () => randomBytes(3).toString("hex");

// a witness term — itself an utterance (something on the left, something on the right), the only way to build a
// term from atoms at hand. Nest it for a deeper ast.
export const witness = () => [id(), id()];

// the default: a bare utterance [token, claim].
export default () => [id(), id()];

// a told slot carries one witness; told-none keeps NONE of a real telling — derived, never a typed [].
export const told = (w = witness()) => [w];
export const toldNone = () => witness().slice(0, 0);

// a charge at a chosen FOUR place: a value pair (the order-reading) over an evidence carrier (real witnesses, no
// fabricated marks, no typed empties). value and evidence agree for a freshly-built charge; meets can later lower
// the value below the evidence (which is never discarded).
export const charge = (place) => ({
  t:   { value: [true, false],  evidence: [told(),     toldNone()] },
  f:   { value: [false, true],  evidence: [toldNone(), told()]     },
  top: { value: [true, true],   evidence: [told(),     told()]     },
  bot: { value: [false, false], evidence: [toldNone(), toldNone()] },
}[place]);
