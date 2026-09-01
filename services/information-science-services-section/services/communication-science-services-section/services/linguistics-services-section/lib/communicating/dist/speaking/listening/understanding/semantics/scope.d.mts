import type { ParseResult } from "../../parsing/index.mjs";
import type { ChargeStatus } from "../../parsing/index.mjs";
export interface Quantifier {
    readonly text: string;
    readonly type: "universal" | "existential";
    readonly position: "subject" | "object" | "unknown";
}
export interface ScopeReading {
    readonly label: "∀∃" | "∃∀";
    readonly description: string;
    readonly wide: "universal" | "existential";
}
export interface ScopeResult {
    readonly quantifiers: readonly Quantifier[];
    readonly scopeAmbiguous: boolean;
    readonly status: ChargeStatus;
    readonly readings: readonly ScopeReading[];
}
/** Extract quantifier scope from a parse result. */
export declare function scope(result: ParseResult): ScopeResult;
//# sourceMappingURL=scope.d.mts.map