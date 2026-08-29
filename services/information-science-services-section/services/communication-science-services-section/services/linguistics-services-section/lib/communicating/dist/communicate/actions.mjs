import { memeActions } from "./meme.mjs";
import { cohereAction, spacetimeAction, channelAction } from "./cohesion.mjs";
/** communicating's READING operations — operations that project a membrane into another carrier
 *  (not a meme). `cohere` reads a membrane's discourse cohesion as a graph-Laplacian invariant.
 *  Many communicating morphisms happen to transform memes; that is a description of those morphisms,
 *  never a requirement on the surface. */
export const readingActions = Object.freeze([cohereAction, spacetimeAction, channelAction]);
/**
 * communicating's operation surface over a chosen bundle: the meme-transforming morphisms together
 * with the membrane readings. Language packages compose this with their own codec surface
 * (decode/encode) and language-specific operations (e.g. prose conformance).
 */
export const actions = (_bundle) => Object.freeze([...memeActions, ...readingActions]);
//# sourceMappingURL=actions.mjs.map