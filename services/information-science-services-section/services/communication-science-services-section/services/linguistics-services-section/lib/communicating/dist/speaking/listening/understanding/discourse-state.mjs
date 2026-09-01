/**
 * understanding/discourse-state - dynamic discourse state over parse forests.
 *
 * This layer lifts local parse readings into a finite discourse state: entities,
 * references, presuppositions, topics, commitments, and repairs. It consumes the
 * parse forest and Lambek proof carriers; it does not parse text again and it
 * does not add a dependency beyond @red-cup-engineering/relating.
 */
import { carrierFrom } from "@red-cup-engineering/relating";
import { lambekProofOfForest, } from "../parsing/index.mjs";
import { presuppositions } from "./semantics/index.mjs";
const chargeSchema = { enum: ["absurd", "potential", "active", "stable"] };
const entitySchema = {
    type: "object",
    required: ["id", "label", "mentions", "charge"],
    additionalProperties: false,
    properties: {
        id: { type: "string", minLength: 1 },
        label: { type: "string", minLength: 1 },
        mentions: { type: "array", items: { type: "string" } },
        charge: chargeSchema,
    },
};
const referenceSchema = {
    type: "object",
    required: ["anaphor", "status", "antecedent", "candidates", "readingId"],
    additionalProperties: false,
    properties: {
        anaphor: { type: "string", minLength: 1 },
        status: { enum: ["resolved", "ambiguous", "void"] },
        antecedent: { anyOf: [{ type: "string" }, { type: "null" }] },
        candidates: { type: "array", items: { type: "string" } },
        readingId: { type: "string", minLength: 1 },
    },
};
const presuppositionSchema = {
    type: "object",
    required: ["trigger", "presupposed", "status", "readingId"],
    additionalProperties: false,
    properties: {
        trigger: { type: "string", minLength: 1 },
        presupposed: { type: "string", minLength: 1 },
        status: chargeSchema,
        readingId: { type: "string", minLength: 1 },
    },
};
const commitmentSchema = {
    type: "object",
    required: ["id", "proposition", "readingId", "charge", "basis"],
    additionalProperties: false,
    properties: {
        id: { type: "string", minLength: 1 },
        proposition: { type: "string" },
        readingId: { type: "string", minLength: 1 },
        charge: chargeSchema,
        basis: { enum: ["assertion", "denial", "ambiguous", "unproved"] },
    },
};
const repairSchema = {
    type: "object",
    required: ["kind", "target", "readingId", "charge", "note"],
    additionalProperties: false,
    properties: {
        kind: {
            enum: [
                "unresolved-reference",
                "ambiguous-reference",
                "presupposition-accommodation",
                "parse-obstruction",
                "grammar-obstruction",
            ],
        },
        target: { type: "string", minLength: 1 },
        readingId: { type: "string", minLength: 1 },
        charge: chargeSchema,
        note: { type: "string" },
    },
};
export const discourseStateSchema = {
    $id: "communicating/understanding/discourse-state",
    type: "object",
    required: ["kind", "text", "entities", "references", "presuppositions", "topics", "commitments", "repairs", "charge"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.discourse-state" },
        text: { type: "string" },
        entities: { type: "array", items: entitySchema },
        references: { type: "array", items: referenceSchema },
        presuppositions: { type: "array", items: presuppositionSchema },
        topics: { type: "array", items: entitySchema },
        commitments: { type: "array", items: commitmentSchema },
        repairs: { type: "array", items: repairSchema },
        charge: chargeSchema,
    },
};
export const discourseStateCarrier = carrierFrom(discourseStateSchema);
const THIRD_PERSON = new Set(["he", "him", "his", "she", "her", "hers", "it", "its", "they", "them", "their", "theirs"]);
function entityLabel(text) {
    return text.toLowerCase();
}
function isMention(word) {
    return word.tags.includes("noun") || word.tags.includes("pron");
}
function isPronoun(word) {
    return word.tags.includes("pron") || THIRD_PERSON.has(word.text.toLowerCase());
}
function isEntityMention(word) {
    return isMention(word) && !isPronoun(word);
}
function repair(kind, target, readingId, charge, note) {
    return Object.freeze({ kind, target, readingId, charge, note });
}
function addEntity(entities, word, reading) {
    const label = entityLabel(word.text);
    const prior = entities.get(label);
    const mention = `${reading.id}:${word.id}`;
    if (prior === undefined) {
        entities.set(label, Object.freeze({
            id: `entity:${label}`,
            label,
            mentions: Object.freeze([mention]),
            charge: reading.charge,
        }));
        return;
    }
    entities.set(label, Object.freeze({
        ...prior,
        mentions: Object.freeze([...prior.mentions, mention]),
        charge: prior.charge === reading.charge ? prior.charge : "stable",
    }));
}
function resolveDynamicReference(word, reading, entities) {
    const candidates = [...entities.values()].map((entity) => entity.label).reverse();
    const status = candidates.length === 0 ? "void" : candidates.length === 1 ? "resolved" : "ambiguous";
    return Object.freeze({
        anaphor: word.text,
        status,
        antecedent: status === "resolved" ? candidates[0] : null,
        candidates: Object.freeze(candidates),
        readingId: reading.id,
    });
}
function definitePresuppositions(reading) {
    const out = [];
    for (const arc of reading.parse.arcs) {
        if (arc.rel !== "det" || arc.depText.toLowerCase() !== "the")
            continue;
        out.push(Object.freeze({
            trigger: `the ${arc.headText}`,
            presupposed: `exists(${arc.headText.toLowerCase()})`,
            status: "absurd",
            readingId: reading.id,
        }));
    }
    return Object.freeze(out);
}
function readingPresuppositions(reading) {
    return Object.freeze([
        ...presuppositions(reading.parse).map((item) => Object.freeze({
            trigger: item.trigger.text,
            presupposed: item.presupposed,
            status: item.status,
            readingId: reading.id,
        })),
        ...definitePresuppositions(reading),
    ]);
}
function isDenial(text) {
    return /^(not|no|never)\b/i.test(text.trim()) || /^[!-]/.test(text.trim());
}
function commitment(reading, proof) {
    const readingProof = proof.proofs.find((candidate) => candidate.readingId === reading.id);
    const denied = isDenial(reading.span.text);
    const basis = reading.charge === "stable"
        ? "ambiguous"
        : readingProof?.proven === false
            ? "unproved"
            : denied ? "denial" : "assertion";
    return Object.freeze({
        id: `commitment:${reading.id}`,
        proposition: reading.span.text,
        readingId: reading.id,
        charge: basis === "denial" ? "active" : basis === "assertion" ? "potential" : reading.charge,
        basis,
    });
}
function topicFromEntity(entity) {
    return Object.freeze({
        id: `topic:${entity.label}`,
        label: entity.label,
        mentions: entity.mentions,
        charge: entity.charge,
    });
}
export function discourseStateOfForest(forest, proof = lambekProofOfForest(forest)) {
    const entities = new Map();
    const references = [];
    const presups = [];
    const commitments = [];
    const repairs = [];
    for (const reading of forest.readings) {
        for (const word of reading.parse.words.filter((candidate) => isPronoun(candidate) && THIRD_PERSON.has(candidate.text.toLowerCase()))) {
            const reference = resolveDynamicReference(word, reading, entities);
            references.push(reference);
            if (reference.status !== "resolved") {
                repairs.push(repair(reference.status === "ambiguous" ? "ambiguous-reference" : "unresolved-reference", reference.anaphor, reading.id, reference.status === "ambiguous" ? "stable" : "absurd", "dynamic reference could not settle to one antecedent"));
            }
        }
        for (const word of reading.parse.words.filter(isEntityMention))
            addEntity(entities, word, reading);
        for (const item of readingPresuppositions(reading)) {
            presups.push(item);
            repairs.push(repair("presupposition-accommodation", item.trigger, reading.id, item.status, item.presupposed));
        }
        commitments.push(commitment(reading, proof));
        for (const obstruction of reading.obstructions) {
            repairs.push(repair("parse-obstruction", obstruction.label, reading.id, obstruction.value, obstruction.kind));
        }
        const readingProof = proof.proofs.find((candidate) => candidate.readingId === reading.id);
        if (readingProof !== undefined && !readingProof.proven) {
            repairs.push(repair("grammar-obstruction", reading.id, reading.id, readingProof.charge, "Lambek sequent not proven"));
        }
    }
    const entityList = Object.freeze([...entities.values()]);
    const state = Object.freeze({
        kind: "communicating.discourse-state",
        text: forest.text,
        entities: entityList,
        references: Object.freeze(references),
        presuppositions: Object.freeze(presups),
        topics: Object.freeze(entityList.map(topicFromEntity)),
        commitments: Object.freeze(commitments),
        repairs: Object.freeze(repairs),
        charge: repairs.some((item) => item.charge === "stable") ? "stable" : forest.charge,
    });
    discourseStateCarrier.assert(state, "discourse state");
    return state;
}
//# sourceMappingURL=discourse-state.mjs.map