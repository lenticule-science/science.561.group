import type { ParseResult } from "../../parsing/index.mjs";
export interface SemanticFrame {
    readonly verb: string;
    readonly agent: string | null;
    readonly patient: string | null;
    readonly instrument: string | null;
    readonly recipient: string | null;
    readonly location: string | null;
}
/** Extract semantic role frames from a parse result. */
export declare function roles(result: ParseResult): readonly SemanticFrame[];
//# sourceMappingURL=roles.d.mts.map