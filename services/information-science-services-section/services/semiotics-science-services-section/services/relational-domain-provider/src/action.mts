import type { JsonValue } from "@red-cup-engineering/json-codec-service";
import { evaluateRunTerm } from "@red-cup-engineering/relation-model-notation-eval";
import type { Tm } from "@red-cup-engineering/relation-model-notation/types";
import type { Carrier } from "./carrier.mjs";

export interface ActionSpec {
  readonly verb: string;
  readonly inputFormat?: string;
  readonly outputFormat?: string;
  readonly summary?: string;
  readonly description?: string;
  readonly options?: readonly string[];
  readonly domain?: Carrier;
  readonly codomain?: Carrier;
  readonly runTerm?: Tm;
  readonly run?: (input: unknown, args: Record<string, unknown>) => unknown | Promise<unknown>;
}
export interface Action extends Readonly<Omit<ActionSpec, "run">> {
  readonly kind: "relating.action";
  readonly inputFormat: string;
  readonly outputFormat: string;
  readonly options: readonly string[];
  readonly run: (input: unknown, args: Record<string, unknown>) => unknown | Promise<unknown>;
}
const promiseLike = (value: unknown): value is Promise<unknown> => value !== null && typeof value === "object" && "then" in value;
export function action(spec: ActionSpec): Action {
  if (spec.verb.trim() === "") throw new TypeError("action: verb is required");
  if (spec.run === undefined && spec.runTerm === undefined) throw new TypeError(`action ${spec.verb}: run or runTerm is required`);
  const body = spec.run ?? ((input: unknown): JsonValue => evaluateRunTerm(spec.runTerm!, input as JsonValue));
  const run = (input: unknown, args: Record<string, unknown>): unknown | Promise<unknown> => {
    const admitted = spec.domain?.assert(input, `action ${spec.verb} input`) ?? input;
    const result = body(admitted, args);
    const finish = (value: unknown): unknown => spec.codomain?.assert(value, `action ${spec.verb} output`) ?? value;
    return promiseLike(result) ? result.then(finish) : finish(result);
  };
  return Object.freeze({
    ...spec,
    kind: "relating.action",
    inputFormat: spec.inputFormat ?? "json",
    outputFormat: spec.outputFormat ?? "json",
    options: Object.freeze([...(spec.options ?? [])]),
    run,
  });
}
