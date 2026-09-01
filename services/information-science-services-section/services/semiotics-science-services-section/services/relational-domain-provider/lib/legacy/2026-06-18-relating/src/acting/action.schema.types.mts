// Generated from object.schema.json by realize: Sub(J) → StructuralTypes.
// Refinements (minLength, pattern, format, …) are forgotten here and remain
// the schema's runtime law. Do not edit by hand.

export interface ActionCarrier { readonly codomainSchema?: unknown; readonly description?: string; readonly domainSchema?: unknown; readonly inputFormat: string; readonly kind: "relating.action"; readonly options: ReadonlyArray<string>; readonly outputFormat: string; readonly summary?: string; readonly verb: string; }
