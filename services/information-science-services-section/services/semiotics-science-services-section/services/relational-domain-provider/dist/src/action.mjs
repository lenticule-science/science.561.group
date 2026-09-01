import { evaluateRunTerm } from "@red-cup-engineering/relation-model-notation-eval";
const promiseLike = (value) => value !== null && typeof value === "object" && "then" in value;
export function action(spec) {
    if (spec.verb.trim() === "")
        throw new TypeError("action: verb is required");
    if (spec.run === undefined && spec.runTerm === undefined)
        throw new TypeError(`action ${spec.verb}: run or runTerm is required`);
    const body = spec.run ?? ((input) => evaluateRunTerm(spec.runTerm, input));
    const run = (input, args) => {
        const admitted = spec.domain?.assert(input, `action ${spec.verb} input`) ?? input;
        const result = body(admitted, args);
        const finish = (value) => spec.codomain?.assert(value, `action ${spec.verb} output`) ?? value;
        return promiseLike(result) ? result.then(finish) : finish(result);
    };
    return Object.freeze({
        ...spec,
        kind: "relating.action",
        inputFormat: spec.inputFormat ?? "json",
        outputFormat: spec.outputFormat ?? "json",
        options: Object.freeze([...(spec.options ?? [])]),
        run,
    });
}
//# sourceMappingURL=action.mjs.map