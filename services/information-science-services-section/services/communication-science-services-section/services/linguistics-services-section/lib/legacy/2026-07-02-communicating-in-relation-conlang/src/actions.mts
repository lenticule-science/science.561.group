import { actions as baseActions, codecActions, manifestActions } from "@emsenn/communicating";
import type { Action } from "@emsenn/relating";

import relationConlang from "./compiled.mjs";
import { manifest } from "./manifest.mjs";

export const actions: readonly Action[] = Object.freeze([
  ...baseActions(relationConlang),
  ...codecActions(relationConlang),
  ...manifestActions(manifest),
]);
