/**
 * @emsenn/communicating-in-relation-conlang - a manifest-first conlang over
 * @emsenn/communicating.
 *
 * The language facts live in data/manifest.json. This package supplies only the
 * loader, compiled bundle, receipts, and runnable action surface.
 */
import {
  admitCommunication,
  articulateCommunication,
  parseCommunication,
  read as readOver,
  type ArticulateResult,
  type ParseResult,
  type Reading,
} from "@emsenn/communicating";

import relationConlang from "./compiled.mjs";

export { actions } from "./actions.mjs";
export { relationConlang, default } from "./compiled.mjs";
export { manifest, receipts } from "./manifest.mjs";

export const read = (text: string): Reading => readOver(text, relationConlang);

export const settle = (text: string): ParseResult =>
  parseCommunication(admitCommunication(text), relationConlang);

export const articulate = (text: string): ArticulateResult =>
  articulateCommunication(admitCommunication(text), relationConlang);
