/**
 * communicate/morphisms/negate - the polarity involution (Meme -> Meme).
 */
import { action, memeCarrier } from "@red-cup-engineering/relating";
import { negateTerm } from "../expressing.mjs";
export const negateAction = action({
    verb: "negate",
    inputFormat: "json",
    outputFormat: "json",
    options: [],
    summary: "Polarity involution: swap the meme's charge truth and falsity sides.",
    description: "Domain: a meme carrier. Codomain: a meme carrier. The cell is preserved; the charge transform is represented as a CHL term over the carrier.",
    domain: memeCarrier,
    codomain: memeCarrier,
    runTerm: negateTerm,
});
//# sourceMappingURL=negate.mjs.map