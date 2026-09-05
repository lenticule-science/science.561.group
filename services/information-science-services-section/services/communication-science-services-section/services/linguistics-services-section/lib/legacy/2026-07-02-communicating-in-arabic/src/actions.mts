/**
 * Arabic actions - the communicating cocone read over the Arabic fiber.
 *
 * The base supplies communicating's meme-endomorphism surface and membrane
 * readings. `codecActions(arabic)` supplies the Arabic text->meme decode codec:
 * this is where RTL text and root-pattern morphology enter the substrate.
 */
import { actions as baseActions, codecActions, manifestActions } from "@emsenn/communicating";
import type { Action } from "@emsenn/relating";

import arabic from "./compiled.mjs";
import { manifest } from "./manifest.mjs";

/** The Arabic package's action surface: meme operations + the Arabic decode codec. */
export const actions: readonly Action[] = Object.freeze([
  ...baseActions(arabic),
  ...codecActions(arabic),
  ...manifestActions(manifest),
]);
