/**
 * parsing/forest - charged parse forests over surface language.
 *
 * The legacy parser gives one settled reading of one sentence. A parse forest is
 * the carrier the rest of communicating should depend on: every sentence span is
 * read as a charged local parse, and ambiguity/void/conflict evidence is held in
 * the carrier instead of being collapsed into a single classical parse choice.
 */
import { carrierFrom, chargeValue, joinKnowledgeValue, } from "@red-cup-engineering/relating";
import { articulateCommunication } from "./articulating.mjs";
import { cohomology } from "./cohomology.mjs";
import { parse } from "./parsing.mjs";
import { spansInSentenceOfTier, wordsInSentence } from "./construing.mjs";
const spanSchema = {
    type: "object",
    required: ["tier", "start", "end", "text"],
    additionalProperties: false,
    properties: {
        tier: { enum: ["document", "block", "sentence", "clause", "word", "quote", "rule"] },
        start: { anyOf: [{ type: "integer", minimum: 0 }, { type: "null" }] },
        end: { anyOf: [{ type: "integer", minimum: 0 }, { type: "null" }] },
        text: { type: "string" },
        numeric: { type: "boolean" },
    },
};
const obstructionSchema = {
    type: "object",
    required: ["kind", "label", "on", "value"],
    additionalProperties: false,
    properties: {
        kind: { enum: ["conflict", "void"] },
        label: { type: "string" },
        on: { type: "string" },
        value: { enum: ["absurd", "potential", "active", "stable"] },
    },
};
const chargeSchema = { enum: ["absurd", "potential", "active", "stable"] };
export const parseForestReadingSchema = {
    $id: "communicating/parsing/parse-forest-reading",
    type: "object",
    required: ["kind", "id", "span", "parse", "charge", "glued", "complete", "ambiguity", "obstructions"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.parse-forest.reading" },
        id: { type: "string", minLength: 1 },
        span: spanSchema,
        parse: { type: "object", additionalProperties: true },
        charge: chargeSchema,
        glued: { type: "boolean" },
        complete: { type: "boolean" },
        ambiguity: { type: "integer", minimum: 0 },
        obstructions: { type: "array", items: obstructionSchema },
        quotes: { type: "array", items: spanSchema },
        numericTokens: { type: "array", items: spanSchema },
    },
};
export const parseForestSchema = {
    $id: "communicating/parsing/parse-forest",
    type: "object",
    required: ["kind", "text", "readings", "charge", "glued", "complete", "ambiguity", "obstructions"],
    additionalProperties: false,
    properties: {
        kind: { const: "communicating.parse-forest" },
        text: { type: "string" },
        readings: { type: "array", items: parseForestReadingSchema },
        charge: chargeSchema,
        glued: { type: "boolean" },
        complete: { type: "boolean" },
        ambiguity: { type: "integer", minimum: 0 },
        obstructions: { type: "array", items: obstructionSchema },
    },
};
export const parseForestReadingCarrier = carrierFrom(parseForestReadingSchema);
export const parseForestCarrier = carrierFrom(parseForestSchema);
function aggregateCharges(values) {
    return values
        .map((name) => chargeValue(name))
        .reduce((prior, next) => joinKnowledgeValue(prior, next), chargeValue("absurd"))
        .name;
}
function parseCharge(result) {
    return aggregateCharges(result.answers.map((answer) => answer.value));
}
function readingId(span, index) {
    return `reading@${span.start ?? "?"}-${span.end ?? "?"}:${index}`;
}
/** Build one reading, including the quote spans and numeric word-tokens that fall
 * within `span` (read off `allSpans`, the full articulation's span set) so a
 * consumer gets both through the reading without re-deriving them. */
function readingFromParse(span, result, index, allSpans) {
    const coh = cohomology(result);
    const reading = Object.freeze({
        kind: "communicating.parse-forest.reading",
        id: readingId(span, index),
        span,
        parse: result,
        charge: parseCharge(result),
        glued: coh.glued,
        complete: result.voids.length === 0,
        ambiguity: coh.obstructions.length,
        obstructions: Object.freeze([...coh.obstructions]),
        quotes: Object.freeze(spansInSentenceOfTier(span, allSpans, "quote")),
        numericTokens: Object.freeze(wordsInSentence(span, allSpans).filter((s) => s.numeric === true)),
    });
    parseForestReadingCarrier.assert(reading, "parse forest reading");
    return reading;
}
function sentenceSpans(base) {
    const sentences = base.spans.filter((span) => span.tier === "sentence");
    return sentences.length === 0 ? [base.document] : sentences;
}
export function parseForestFromArticulation(base, bundle) {
    const readings = sentenceSpans(base).map((sentence, index) => readingFromParse(sentence, parse(sentence, base, bundle), index, base.spans));
    const obstructions = Object.freeze(readings.flatMap((reading) => reading.obstructions));
    const forest = Object.freeze({
        kind: "communicating.parse-forest",
        text: base.text,
        readings: Object.freeze(readings),
        charge: aggregateCharges(readings.map((reading) => reading.charge)),
        glued: readings.every((reading) => reading.glued),
        complete: readings.every((reading) => reading.complete),
        ambiguity: obstructions.length,
        obstructions,
    });
    parseForestCarrier.assert(forest, "parse forest");
    return forest;
}
export function parseForest(sentenceSpan, base, bundle) {
    const wordSpans = wordsInSentence(sentenceSpan, base.spans);
    const quoteSpans = spansInSentenceOfTier(sentenceSpan, base.spans, "quote");
    const localBase = Object.freeze({
        ...base,
        document: sentenceSpan,
        spans: Object.freeze([sentenceSpan, ...wordSpans, ...quoteSpans]),
    });
    return parseForestFromArticulation(localBase, bundle);
}
export function parseCommunicationForest(carrier, bundle) {
    return parseForestFromArticulation(articulateCommunication(carrier, bundle), bundle);
}
//# sourceMappingURL=forest.mjs.map