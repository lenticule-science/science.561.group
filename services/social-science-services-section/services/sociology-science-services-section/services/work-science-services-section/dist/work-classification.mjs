export const WORK_KINDS = Object.freeze([
    "inquiry",
    "derivation",
    "procedure",
    "process",
]);
export const DETERMINATION_OF_WORK_KIND = Object.freeze({
    inquiry: Object.freeze({ operation: "open", inputsAndPath: "open" }),
    derivation: Object.freeze({ operation: "settled", inputsAndPath: "open" }),
    procedure: Object.freeze({ operation: "open", inputsAndPath: "settled" }),
    process: Object.freeze({ operation: "settled", inputsAndPath: "settled" }),
});
export function classifyWork({ operation, inputsAndPath }) {
    if (operation === "settled")
        return inputsAndPath === "settled" ? "process" : "derivation";
    return inputsAndPath === "settled" ? "procedure" : "inquiry";
}
export function settleOperation(work) {
    return Object.freeze({ operation: "settled", inputsAndPath: work.inputsAndPath });
}
export function settleInputsAndPath(work) {
    return Object.freeze({ operation: work.operation, inputsAndPath: "settled" });
}
//# sourceMappingURL=work-classification.mjs.map