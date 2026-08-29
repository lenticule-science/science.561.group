/**
 * @emsenn/communicating-in-arabic - the Arabic fiber over @emsenn/communicating.
 *
 * This package supplies an RTL, root-pattern morphology bundle and binds the
 * base communicating readings to it. It intentionally owns only Arabic language
 * facts and package transport; the parsing, carrier, action, and witness law
 * stay in @emsenn/communicating and @emsenn/relating.
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

import arabic from "./compiled.mjs";

export { arabic, default } from "./compiled.mjs";
export { rawBundle } from "./bundle.mjs";
export { manifest, receipts } from "./manifest.mjs";

/** Read a sentence at every layer at once, over the Arabic bundle. */
export const read = (text: string): Reading => readOver(text, arabic);

/** Settle a sentence through the engine, over the Arabic bundle. */
export const settle = (text: string): ParseResult => settleOver(text, arabic);

/** Articulate admitted Arabic text into its articulation carrier. */
export const articulate = (text: string): ArticulateResult =>
  articulateCommunication(admitCommunication(text), arabic);

export { actions } from "./actions.mjs";
