/**
 * @emsenn/communicating-in-tokipona — the Tokipona fiber over @emsenn/communicating.
 *
 * The base package is language-neutral machinery whose every reading morphism is
 * parameterized over a `CompiledBundle`. This package is one such bundle made
 * concrete: it supplies the compiled Tokipona vocabulary and binds the base reading
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

import tokipona from "./compiled.mjs";

export { tokipona, default } from "./compiled.mjs";
export { rawBundle } from "./bundle.mjs";
export { manifest, receipts } from "./manifest.mjs";

/** Read a sentence at every layer at once, over the Tokipona bundle. */
export const read = (text: string): Reading => readOver(text, tokipona);

/** Settle a sentence through the engine, over the Tokipona bundle. */
export const settle = (text: string): ParseResult => settleOver(text, tokipona);

/** Articulate admitted Tokipona text into its articulation carrier. */
export const articulate = (text: string): ArticulateResult =>
  articulateCommunication(admitCommunication(text), tokipona);

export { actions } from "./actions.mjs";
