declare module "@red-cup-engineering/relation-model-notation/types" {
  export type Tm = readonly [string, ...readonly unknown[]];
}
declare module "@red-cup-engineering/relation-model-notation" {
  import type { Tm } from "@red-cup-engineering/relation-model-notation/types";
  export const tm: {
    readonly var: (index: number) => Tm; readonly lam: (body: Tm) => Tm;
    readonly app: (fn: Tm, argument: Tm) => Tm; readonly pair: (left: Tm, right: Tm) => Tm;
    readonly fst: (value: Tm) => Tm; readonly snd: (value: Tm) => Tm; readonly star: () => Tm;
    readonly mark: (surface: string) => Tm; readonly charge: (name: string) => Tm; readonly bool: (value: boolean) => Tm;
    readonly field: (key: string, value: Tm) => Tm; readonly append: (left: Tm, right: Tm) => Tm;
    readonly coincide: (left: Tm, right: Tm) => Tm; readonly cond: (test: Tm, then: Tm, otherwise: Tm) => Tm;
    readonly fold: (combine: Tm, initial: Tm, list: Tm) => Tm;
  };
}
declare module "@red-cup-engineering/relation-model-notation-eval" {
  import type { JsonValue } from "@red-cup-engineering/json-codec-service";
  import type { Tm } from "@red-cup-engineering/relation-model-notation/types";
  export function evaluateRunTerm(term: Tm, input: JsonValue): JsonValue;
}
declare module "@red-cup-engineering/relation-model-notation-json-codec" {
  import type { JsonValue } from "@red-cup-engineering/json-codec-service";
  import type { Tm } from "@red-cup-engineering/relation-model-notation/types";
  export function arrayTerm(items: readonly Tm[]): Tm;
  export function objectTerm(entries: ReadonlyArray<readonly [string, Tm]>): Tm;
  export function stringTerm(value: string): Tm;
  export function jsonToTerm(value: JsonValue): Tm;
}
