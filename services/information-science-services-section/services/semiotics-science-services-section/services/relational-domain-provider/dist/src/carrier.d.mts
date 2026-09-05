import type { JsonRecord } from "@red-cup-engineering/json-codec-service";
export interface Carrier<T = unknown> {
    readonly kind: "relating.carrier";
    readonly id: string;
    readonly schema: JsonRecord & {
        readonly $id: string;
    };
    readonly validate: (value: unknown) => value is T;
    readonly assert: (value: unknown, context?: string) => T;
    readonly errors: (value: unknown) => readonly string[];
}
type Simplify<T> = {
    readonly [K in keyof T]: T[K];
} & {};
type FromTypeName<T> = T extends "string" ? string : T extends "integer" | "number" ? number : T extends "boolean" ? boolean : T extends "null" ? null : T extends "array" ? readonly unknown[] : unknown;
type RequiredKey<P, R> = R extends readonly (infer K extends keyof P)[] ? K : never;
type FromObject<S, Root> = S extends {
    readonly properties: infer P;
} ? S extends {
    readonly required: infer R;
} ? Simplify<{
    readonly [K in RequiredKey<P, R>]: FromSchema<P[K], Root>;
} & {
    readonly [K in Exclude<keyof P, RequiredKey<P, R>>]?: FromSchema<P[K], Root>;
}> : {
    readonly [K in keyof P]?: FromSchema<P[K], Root>;
} : Record<string, unknown>;
type ResolveRef<Ref, Root> = Ref extends `#/$defs/${infer Name}` ? Root extends {
    readonly $defs: infer D;
} ? Name extends keyof D ? FromSchema<D[Name], Root> : unknown : unknown : unknown;
export type FromSchema<S, Root = S> = S extends {
    readonly $ref: infer R;
} ? ResolveRef<R, Root> : S extends {
    readonly const: infer C;
} ? C : S extends {
    readonly enum: readonly (infer E)[];
} ? E : S extends {
    readonly anyOf: readonly (infer U)[];
} ? FromSchema<U, Root> : S extends {
    readonly oneOf: readonly (infer U)[];
} ? FromSchema<U, Root> : S extends {
    readonly type: "object";
} ? FromObject<S, Root> : S extends {
    readonly type: "array";
    readonly items: infer I;
} ? readonly FromSchema<I, Root>[] : S extends {
    readonly type: readonly (infer T)[];
} ? FromTypeName<T> : S extends {
    readonly type: infer T;
} ? FromTypeName<T> : unknown;
export declare function carrierFrom<const S extends {
    readonly $id: string;
}>(schema: S): Carrier<FromSchema<S>>;
export {};
//# sourceMappingURL=carrier.d.mts.map