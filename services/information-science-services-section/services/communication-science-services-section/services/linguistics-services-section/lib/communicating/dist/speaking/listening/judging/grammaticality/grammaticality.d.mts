import type { ParseResult } from "../../parsing/index.mjs";
/** A single well-formedness failure: a constraint a grammatical string broke. */
export interface GrammaticalityViolation {
    readonly kind: string;
    readonly detail: string;
    readonly relation?: string;
    readonly head?: string;
    readonly dependent?: string;
}
/** The grammaticality verdict over a parse: a status and the violations found. */
export interface GrammaticalityResult {
    readonly status: "grammatical" | "ungrammatical" | "unknown";
    readonly violations: readonly GrammaticalityViolation[];
}
export declare function grammaticality(result: ParseResult): GrammaticalityResult;
//# sourceMappingURL=grammaticality.d.mts.map