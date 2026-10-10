import type { JsonRecord } from "@red-cup-engineering/json-codec-service";

export interface Carrier<T = unknown> {
  readonly kind: "relating.carrier";
  readonly id: string;
  readonly schema: JsonRecord & { readonly $id: string };
  readonly validate: (value: unknown) => value is T;
  readonly assert: (value: unknown, context?: string) => T;
  readonly errors: (value: unknown) => readonly string[];
}

type Simplify<T> = { readonly [K in keyof T]: T[K] } & {};
type FromTypeName<T> = T extends "string" ? string : T extends "integer" | "number" ? number : T extends "boolean" ? boolean : T extends "null" ? null : T extends "array" ? readonly unknown[] : unknown;
type RequiredKey<P, R> = R extends readonly (infer K extends keyof P)[] ? K : never;
type FromObject<S, Root> = S extends { readonly properties: infer P }
  ? S extends { readonly required: infer R }
    ? Simplify<{ readonly [K in RequiredKey<P, R>]: FromSchema<P[K], Root> } & { readonly [K in Exclude<keyof P, RequiredKey<P, R>>]?: FromSchema<P[K], Root> }>
    : { readonly [K in keyof P]?: FromSchema<P[K], Root> }
  : Record<string, unknown>;
type ResolveRef<Ref, Root> = Ref extends `#/$defs/${infer Name}`
  ? Root extends { readonly $defs: infer D } ? Name extends keyof D ? FromSchema<D[Name], Root> : unknown : unknown
  : unknown;
export type FromSchema<S, Root = S> =
  S extends { readonly $ref: infer R } ? ResolveRef<R, Root> :
  S extends { readonly const: infer C } ? C :
  S extends { readonly enum: readonly (infer E)[] } ? E :
  S extends { readonly anyOf: readonly (infer U)[] } ? FromSchema<U, Root> :
  S extends { readonly oneOf: readonly (infer U)[] } ? FromSchema<U, Root> :
  S extends { readonly type: "object" } ? FromObject<S, Root> :
  S extends { readonly type: "array"; readonly items: infer I } ? readonly FromSchema<I, Root>[] :
  S extends { readonly type: readonly (infer T)[] } ? FromTypeName<T> :
  S extends { readonly type: infer T } ? FromTypeName<T> : unknown;

type Schema = Readonly<Record<string, unknown>>;
const registry = new Map<string, Carrier>();
function typeMatches(type: string, value: unknown): boolean {
  if (type === "object") return value !== null && typeof value === "object" && !Array.isArray(value);
  if (type === "array") return Array.isArray(value);
  if (type === "integer") return typeof value === "number" && Number.isInteger(value);
  if (type === "number") return typeof value === "number" && Number.isFinite(value);
  if (type === "null") return value === null;
  return typeof value === type;
}
function validate(schema: Schema, value: unknown, path: string, errors: string[], root: Schema): boolean {
  const at = path || "/";
  const ref = schema.$ref;
  if (typeof ref === "string") {
    if (ref.startsWith("#/$defs/")) {
      const member = (root.$defs as Record<string, Schema> | undefined)?.[ref.slice(8)];
      return member === undefined || validate(member, value, path, errors, root);
    }
    return registry.get(ref)?.validate(value) ?? true;
  }
  if (Object.hasOwn(schema, "const")) {
    if (value === schema.const) return true;
    errors.push(`${at} must equal ${JSON.stringify(schema.const)}`); return false;
  }
  if (Array.isArray(schema.enum)) {
    if (schema.enum.includes(value)) return true;
    errors.push(`${at} must be an admitted enum member`); return false;
  }
  const alternatives = (schema.anyOf ?? schema.oneOf) as readonly Schema[] | undefined;
  if (alternatives !== undefined) {
    if (alternatives.some((member) => validate(member, value, path, [], root))) return true;
    errors.push(`${at} matches no alternative`); return false;
  }
  const types = schema.type === undefined ? [] : Array.isArray(schema.type) ? schema.type as string[] : [schema.type as string];
  if (types.length > 0 && !types.some((type) => typeMatches(type, value))) {
    errors.push(`${at} must be ${types.join(" | ")}`); return false;
  }
  if (typeof value === "string" && typeof schema.minLength === "number" && value.length < schema.minLength) {
    errors.push(`${at} is too short`); return false;
  }
  if (typeof value === "number" && typeof schema.minimum === "number" && value < schema.minimum) {
    errors.push(`${at} is below its minimum`); return false;
  }
  if (Array.isArray(value) && schema.items !== undefined) {
    return value.every((member, index) => validate(schema.items as Schema, member, `${path}/${index}`, errors, root));
  }
  if (value !== null && typeof value === "object" && !Array.isArray(value)) {
    const record = value as Record<string, unknown>;
    const properties = (schema.properties ?? {}) as Record<string, Schema>;
    let okay = true;
    for (const key of (schema.required ?? []) as string[]) if (!Object.hasOwn(record, key)) { errors.push(`${at}/${key} is required`); okay = false; }
    for (const [key, member] of Object.entries(properties)) if (Object.hasOwn(record, key) && !validate(member, record[key], `${path}/${key}`, errors, root)) okay = false;
    if (schema.additionalProperties === false) for (const key of Object.keys(record)) if (!Object.hasOwn(properties, key)) { errors.push(`${at}/${key} is not allowed`); okay = false; }
    return okay;
  }
  return true;
}

export function carrierFrom<const S extends { readonly $id: string }>(schema: S): Carrier<FromSchema<S>> {
  const root = schema as unknown as Schema;
  const carrier: Carrier<FromSchema<S>> = Object.freeze({
    kind: "relating.carrier",
    id: schema.$id,
    schema: schema as unknown as JsonRecord & { readonly $id: string },
    validate: (value: unknown): value is FromSchema<S> => validate(root, value, "", [], root),
    assert: (value: unknown, context = schema.$id): FromSchema<S> => {
      const errors: string[] = [];
      if (validate(root, value, "", errors, root)) return value as FromSchema<S>;
      throw new TypeError(`${context}: ${errors.join("; ")}`);
    },
    errors: (value: unknown): readonly string[] => { const errors: string[] = []; validate(root, value, "", errors, root); return Object.freeze(errors); },
  });
  registry.set(carrier.id, carrier as Carrier);
  return carrier;
}
