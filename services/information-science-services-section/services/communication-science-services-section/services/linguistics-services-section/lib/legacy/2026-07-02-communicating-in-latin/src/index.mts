/**
 * @emsenn/communicating-in-latin — the Latin fiber over @emsenn/communicating.
 *
 * The base package is language-neutral machinery whose every reading morphism is
 * parameterized over a `CompiledBundle`. This package is one such bundle made
 * concrete: it supplies the compiled Latin vocabulary and binds the base reading
 * morphisms to it. The runnable `communicate` / `communicate-serve` bins project
 * this package's actions.
 */
import {
  read as readOver,
  settle as settleOver,
  articulateCommunication,
  admitCommunication,
  type Reading,
  type ParseResult,
  type ArticulateResult,
} from "@emsenn/communicating";

import latin from "./compiled.mjs";

export { latin, default } from "./compiled.mjs";
export { rawBundle } from "./bundle.mjs";
export { manifest, receipts } from "./manifest.mjs";

/** Read a sentence at every layer at once, over the Latin bundle. */
export const read = (text: string): Reading => readOver(text, latin);

/** Settle a sentence through the engine, over the Latin bundle. */
export const settle = (text: string): ParseResult => settleOver(text, latin);

/** Articulate admitted Latin text into its articulation carrier. */
export const articulate = (text: string): ArticulateResult =>
  articulateCommunication(admitCommunication(text), latin);

export { actions } from "./actions.mjs";
