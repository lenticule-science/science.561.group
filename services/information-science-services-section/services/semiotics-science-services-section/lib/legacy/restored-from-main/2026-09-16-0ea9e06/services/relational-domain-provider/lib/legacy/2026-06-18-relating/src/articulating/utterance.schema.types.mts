// Generated from object.schema.json by realize: Sub(J) → StructuralTypes.
// Refinements (minLength, pattern, format, …) are forgotten here and remain
// the schema's runtime law. Do not edit by hand.

export interface Mark { readonly kind: "utterance.mark"; readonly value: unknown; }

export interface Token { readonly hand: "left"; readonly kind: "utterance.token"; readonly mark: Mark; }

export interface Claim { readonly hand: "right"; readonly kind: "utterance.claim"; readonly mark: Mark; }

export interface UtteranceCarrier { readonly claim: Claim; readonly kind: "utterance.carrier"; readonly token: Token; }
