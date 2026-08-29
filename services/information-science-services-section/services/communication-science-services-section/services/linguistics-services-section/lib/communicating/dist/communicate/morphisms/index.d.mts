/**
 * communicate/morphisms - the generating meme morphisms.
 *
 * Argument-free morphisms are Meme -> Meme. Option-bearing morphisms consume one
 * product carrier whose formerly-option fields live beside a `meme` field, and
 * all morphisms return a meme carrier.
 */
import type { Action } from "@red-cup-engineering/relating";
export { speakAction } from "./speak.mjs";
export { listenAction } from "./listen.mjs";
export { illocuteAction } from "./illocute.mjs";
export { groundAction } from "./ground.mjs";
export { translateAction } from "./translate.mjs";
export { negateAction } from "./negate.mjs";
export { conflateAction } from "./conflate.mjs";
export { referAction } from "./refer.mjs";
export { modalizeAction } from "./modalize.mjs";
export { presupposeAction } from "./presuppose.mjs";
export { quoteAction } from "./quote.mjs";
export { composeAction } from "./compose.mjs";
export declare const morphismActions: readonly Action[];
//# sourceMappingURL=index.d.mts.map