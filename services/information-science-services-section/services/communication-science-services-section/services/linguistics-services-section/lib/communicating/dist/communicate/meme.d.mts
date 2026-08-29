/**
 * communicate/meme - the meme-transforming morphisms of communicating.
 *
 * The argument-free generators here are CHL run terms over the meme carrier.
 * Option-bearing generators in `./morphisms/` consume one explicit input carrier
 * whose formerly-option fields live beside the `meme` field.
 */
import { type Action } from "@red-cup-engineering/relating";
/** The carrier `$id` for the Meme carrier these morphisms read and produce. */
export declare const MEME_CARRIER_ID = "relating/articulating/predicating/positing/meme";
/** communicate - the monoid unit: faithful transmission as the identity proof. */
export declare const communicateAction: Action;
/** semiose - the iteration primitive (Meme -> Meme), represented as a CHL term. */
export declare const semioseAction: Action;
export declare const memeActions: readonly Action[];
//# sourceMappingURL=meme.d.mts.map