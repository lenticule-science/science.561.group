// Generated from object.schema.json by realize: Sub(J) → StructuralTypes.
// Refinements (minLength, pattern, format, …) are forgotten here and remain
// the schema's runtime law. Do not edit by hand.

export interface Mark { readonly kind: "utterance.mark"; readonly value: unknown; }

export interface Token { readonly hand: "left"; readonly kind: "utterance.token"; readonly mark: Mark; }

export interface Claim { readonly hand: "right"; readonly kind: "utterance.claim"; readonly mark: Mark; }

export interface Predicate { readonly claim: Claim; readonly kind: "predication.predicate"; readonly mark: Mark; }

export interface Cell { readonly object: Token; readonly predicate: Predicate; readonly subject: Token; }

export interface ChargeSide { readonly kind: "bilattice-charge.side"; readonly name: "absent" | "present"; }

export interface ChargeCarrier { readonly evidence: readonly [ReadonlyArray<Mark>, ReadonlyArray<Mark>]; readonly kind: "bilattice-charge.carrier"; readonly value: readonly [ChargeSide, ChargeSide]; }

export interface Meme { readonly cell: Cell; readonly charge: ChargeCarrier; readonly kind: "predication.fiber.meme"; }
