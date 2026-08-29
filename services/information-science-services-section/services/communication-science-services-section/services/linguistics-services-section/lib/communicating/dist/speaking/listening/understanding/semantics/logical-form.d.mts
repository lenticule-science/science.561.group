import type { ParseResult } from "../../parsing/index.mjs";
export type LogicalFormNode = {
    readonly kind: "pred";
    readonly predicate: string;
    readonly args: readonly string[];
} | {
    readonly kind: "not";
    readonly body: LogicalFormNode;
} | {
    readonly kind: "quant";
    readonly quantifier: "forall" | "exists" | "definite";
    readonly variable: string;
    readonly restrictor: LogicalFormNode;
    readonly body: LogicalFormNode;
};
export interface LogicalFormReading {
    readonly label: "∀∃" | "∃∀";
    readonly form: LogicalFormNode;
    readonly render: string;
}
export interface LogicalFormResult {
    readonly clauses: readonly LogicalFormNode[];
    readonly readings: readonly LogicalFormReading[] | null;
    readonly scopeAmbiguous: boolean;
    readonly render: string;
}
/** Derive logical form from a parse result. */
export declare function logicalForm(result: ParseResult): LogicalFormResult;
//# sourceMappingURL=logical-form.d.mts.map