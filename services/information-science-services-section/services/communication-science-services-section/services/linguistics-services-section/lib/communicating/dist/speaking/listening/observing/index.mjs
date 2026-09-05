/**
 * observing - parse readings as charged communication observations.
 *
 * This is the communication-specific observation adapter cannibalized from the
 * old animating-experimental doing algebra. It reads a language parse result into
 * charged observations about communication tasks; it does not become a root
 * communicating action because parsing is bundle/codec-bound in this package.
 */
import { articulate, carrierFrom, cell, charge, chargeValue, claim, mark, predicateOfClaim, token, } from "@red-cup-engineering/relating";
import { parseCommunication, } from "../parsing/index.mjs";
const utteranceSlot = { description: "A relating utterance carrier." };
const articulationSlot = { description: "A relating articulation cell." };
const termSlot = { description: "A relating predication term." };
const predicateSlot = { description: "A relating predication predicate." };
const cellSlot = { description: "A relating predication cell." };
const chargeSlot = { description: "A relating bilattice charge carrier." };
const carrierEvidenceSlot = { description: "Relational evidence carried with the observation." };
const parseSlot = { description: "A communicating parse result." };
const sourceSlot = { description: "A communicating carrier." };
export const communicationTaskSchema = {
    $id: "communicating/speaking/listening/observing/task",
    type: "object",
    required: ["kind", "utterance", "articulation", "subject", "predicate", "object", "cell"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.task" },
        utterance: utteranceSlot,
        articulation: articulationSlot,
        subject: termSlot,
        predicate: predicateSlot,
        object: termSlot,
        cell: cellSlot,
    },
};
export const communicationTaskCarrier = carrierFrom(communicationTaskSchema);
export const communicationObservationSchema = {
    $id: "communicating/speaking/listening/observing/observation",
    type: "object",
    required: ["kind", "observer", "task", "charge"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.observation" },
        observer: termSlot,
        task: communicationTaskSchema,
        charge: chargeSlot,
        at: carrierEvidenceSlot,
        note: carrierEvidenceSlot,
    },
};
export const communicationObservationCarrier = carrierFrom(communicationObservationSchema);
export const communicationObservationSetSchema = {
    $id: "communicating/speaking/listening/observing/observations",
    type: "object",
    required: ["kind", "source", "parse", "observations"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.observations" },
        source: sourceSlot,
        parse: parseSlot,
        observations: { type: "array", items: communicationObservationSchema },
    },
};
export const communicationObservationSetCarrier = carrierFrom(communicationObservationSetSchema);
const COMMUNICATION_OBSERVER = token(mark(Object.freeze(["communicating", "listening", "observer"])));
const COMMUNICATION_PREDICATES = Object.freeze({
    wordConnected: communicationPredicate("word-connected"),
    arcStatus: communicationPredicate("arc-status"),
    answerStatus: communicationPredicate("answer-status"),
});
const COMMUNICATION_STATUS_TERMS = Object.freeze({
    decided: token(mark(Object.freeze(["communicating", "listening", "status", "decided"]))),
    ambiguous: token(mark(Object.freeze(["communicating", "listening", "status", "ambiguous"]))),
    void: token(mark(Object.freeze(["communicating", "listening", "status", "void"]))),
});
/** Convert an admitted communication and language bundle into charged parse observations. */
export function communicationObservations(source, bundle) {
    return observationsOfCommunication(source, parseCommunication(source, bundle));
}
/** Convert an existing parse result into charged observations over communicating tasks. */
export function observationsOfCommunication(source, parsed) {
    const sourceNote = source.articulation;
    const observations = Object.freeze([
        ...parsed.words.map((word) => wordObservation(word, sourceNote)),
        ...parsed.arcs.map((arc) => arcObservation(arc, sourceNote)),
        ...parsed.answers.map((answer) => answerObservation(answer, sourceNote)),
    ]);
    return Object.freeze({
        kind: "communicating.observations",
        source,
        parse: parsed,
        observations,
    });
}
export function communicationTask(input) {
    if (isUtteranceCarrier(input)) {
        const subject = input.token;
        const predicate = predicateOfClaim(input.claim);
        return taskFromCell(input, cell(subject, predicate, subject));
    }
    if (isCellCarrier(input))
        return taskFromCell(undefined, input);
    return taskFromCell(undefined, cell(input.subject, input.predicate, input.object ?? input.subject));
}
export function taskCell(taskCarrier) {
    return taskCarrier.cell;
}
export function communicationObservation(input) {
    return Object.freeze({
        kind: "communicating.observation",
        observer: input.observer,
        task: input.task,
        charge: input.charge,
        ...(input.at === undefined ? {} : { at: input.at }),
        ...(input.note === undefined ? {} : { note: input.note }),
    });
}
function taskFromCell(utteranceCarrier, taskCarrier) {
    const taskUtterance = utteranceCarrier ?? Object.freeze({
        kind: "utterance.carrier",
        token: taskCarrier.subject,
        claim: taskCarrier.predicate.claim,
    });
    return Object.freeze({
        kind: "communicating.task",
        utterance: taskUtterance,
        articulation: articulate(taskUtterance),
        subject: taskCarrier.subject,
        predicate: taskCarrier.predicate,
        object: taskCarrier.object,
        cell: taskCarrier,
    });
}
function wordObservation(word, note) {
    return communicationObservation({
        observer: COMMUNICATION_OBSERVER,
        task: communicationTask({
            subject: readingTerm(word),
            predicate: COMMUNICATION_PREDICATES.wordConnected,
            object: statusTerm(word.connected),
        }),
        charge: communicationCharge(word.connected === "decided" ? "potential" : word.connected === "ambiguous" ? "stable" : "absurd", word),
        note,
    });
}
function arcObservation(arc, note) {
    return communicationObservation({
        observer: COMMUNICATION_OBSERVER,
        task: communicationTask({
            subject: readingTerm(arc),
            predicate: COMMUNICATION_PREDICATES.arcStatus,
            object: statusTerm(arc.status),
        }),
        charge: communicationCharge(arc.value, arc),
        note,
    });
}
function answerObservation(answer, note) {
    return communicationObservation({
        observer: COMMUNICATION_OBSERVER,
        task: communicationTask({
            subject: readingTerm(answer),
            predicate: COMMUNICATION_PREDICATES.answerStatus,
            object: statusTerm(answer.status),
        }),
        charge: communicationCharge(answer.value, answer),
        note,
    });
}
function communicationPredicate(label) {
    return predicateOfClaim(claim(mark(Object.freeze(["communicating", "listening", "predicate", label]))));
}
function readingTerm(reading) {
    return token(mark(reading));
}
function statusTerm(status) {
    return COMMUNICATION_STATUS_TERMS[status];
}
function communicationCharge(value, witness) {
    const witnessMark = mark(witness);
    const evidence = value === "potential"
        ? [[witnessMark], []]
        : value === "active"
            ? [[], [witnessMark]]
            : value === "stable"
                ? [[witnessMark], [witnessMark]]
                : [[], []];
    return charge(chargeValue(value), evidence);
}
function isUtteranceCarrier(value) {
    return "kind" in value && value.kind === "utterance.carrier";
}
function isCellCarrier(value) {
    return "subject" in value && "predicate" in value && "object" in value;
}
//# sourceMappingURL=index.mjs.map