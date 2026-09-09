/**
 * The free-algebra classification of work by its settled operation and
 * settled inputs/path. These are determination coordinates, not evidence
 * values: a settled pair is a process, never a contradiction.
 */
export type Settlement = "open" | "settled";
export interface WorkDetermination {
    readonly operation: Settlement;
    readonly inputsAndPath: Settlement;
}
export type WorkKind = "inquiry" | "derivation" | "procedure" | "process";
export declare const WORK_KINDS: readonly WorkKind[];
export declare const DETERMINATION_OF_WORK_KIND: Readonly<Record<WorkKind, WorkDetermination>>;
export declare function classifyWork({ operation, inputsAndPath }: WorkDetermination): WorkKind;
export declare function settleOperation(work: WorkDetermination): WorkDetermination;
export declare function settleInputsAndPath(work: WorkDetermination): WorkDetermination;
//# sourceMappingURL=work-classification.d.mts.map