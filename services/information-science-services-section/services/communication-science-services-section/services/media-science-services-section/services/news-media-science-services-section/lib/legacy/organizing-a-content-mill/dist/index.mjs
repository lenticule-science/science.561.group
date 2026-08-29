/**
 * @emsenn/organizing-a-content-mill
 *
 * A content mill is a distribution specialization: it serves, syndicates,
 * audits, and measures cultivated content after a farm has grown it.
 */
import { appendFileSync, existsSync, mkdirSync, readFileSync } from "node:fs";
import { dirname } from "node:path";
import { carrierFrom, carrierToTerm } from "@emsenn/relating";
import { isJsonRecord, jsonResource, parseLines, requireJsonValue, serializeLines } from "@emsenn/relating/writing";
import { ContentViewCountsSchema, contentViewCounts, contentViewEventFromRecord, publicItems, } from "@emsenn/producing-content/content-mill";
export * from "@emsenn/producing-content/content-mill";
export const ContentMillPublicationSchema = {
    $id: "organizing/content-mill/publication",
    title: "ContentMillPublication",
    type: "object",
    required: ["kind", "title", "siteUrl", "feedUrl", "itemPath", "language", "itemCount", "publicItemCount"],
    properties: {
        kind: { const: "organizing.content-mill.publication" },
        title: { minLength: 1, type: "string" },
        siteUrl: { minLength: 1, type: "string" },
        feedUrl: { minLength: 1, type: "string" },
        itemPath: { minLength: 1, type: "string" },
        language: { minLength: 1, type: "string" },
        itemCount: { minimum: 0, type: "integer" },
        publicItemCount: { minimum: 0, type: "integer" },
    },
    additionalProperties: false,
};
export const contentMillPublicationCarrier = carrierFrom(ContentMillPublicationSchema);
export function contentMillPublication(input) {
    return contentMillPublicationCarrier.assert({
        kind: "organizing.content-mill.publication",
        title: input.masthead.title,
        siteUrl: input.masthead.siteUrl,
        feedUrl: input.masthead.feedUrl,
        itemPath: input.masthead.itemPath,
        language: input.masthead.language,
        itemCount: input.items.length,
        publicItemCount: publicItems(input.items).length,
    }, "content mill publication");
}
export function contentMillPublicationTerm(input) {
    return carrierToTerm(jsonResource(contentMillPublicationCarrier.assert(input), "content mill publication"));
}
export const ContentMillPublicationCandidateStatusSchema = {
    anyOf: [
        { const: "ready-to-publish" },
        { const: "editorial-hold" },
        { const: "one-click-repair" },
        { const: "copy-edit-required" },
    ],
};
export const ContentMillPublicationCandidateSchema = {
    $id: "organizing/content-mill/publication-candidate",
    title: "ContentMillPublicationCandidate",
    type: "object",
    required: ["slug", "title", "status", "publicationDistance", "nextAction", "nextActionLabel", "nextActionHref", "standardsHref", "standardsJsonHref", "publicHref", "editorialHold", "sourceCycleWarnings", "wordCount", "missingWords", "referenceCount", "errorCount", "warningCount", "findingCodes", "note"],
    properties: {
        slug: { minLength: 1, type: "string" },
        title: { minLength: 1, type: "string" },
        status: ContentMillPublicationCandidateStatusSchema,
        publicationDistance: { minimum: 0, type: "number" },
        nextAction: { minLength: 1, type: "string" },
        nextActionLabel: { minLength: 1, type: "string" },
        nextActionHref: { minLength: 1, type: "string" },
        standardsHref: { minLength: 1, type: "string" },
        standardsJsonHref: { minLength: 1, type: "string" },
        publicHref: { minLength: 1, type: "string" },
        editorialHold: { type: "boolean" },
        sourceCycleRepairHref: { minLength: 1, type: "string" },
        sourceCycleRepairJsonHref: { minLength: 1, type: "string" },
        sourceCycleTaskCount: { minimum: 0, type: "integer" },
        sourceCycleHighestPriority: { minimum: 0, type: "number" },
        sourceCycleWarnings: { type: "array", items: { type: "string" } },
        wordCount: { minimum: 0, type: "integer" },
        missingWords: { minimum: 0, type: "integer" },
        referenceCount: { minimum: 0, type: "integer" },
        errorCount: { minimum: 0, type: "integer" },
        warningCount: { minimum: 0, type: "integer" },
        findingCodes: { type: "array", items: { type: "string" } },
        note: { type: "string" },
    },
    additionalProperties: false,
};
export const ContentMillPublicationCandidatesReadingSchema = {
    $id: "organizing/content-mill/publication-candidates",
    title: "ContentMillPublicationCandidatesReading",
    type: "object",
    required: ["kind", "generatedAt", "draftCount", "publishableDraftCount", "editorialHoldCount", "oneClickRepairCount", "copyEditRequiredCount", "candidates", "policy"],
    properties: {
        kind: { const: "organizing.content-mill.publication-candidates" },
        generatedAt: { minLength: 1, type: "string" },
        draftCount: { minimum: 0, type: "integer" },
        publishableDraftCount: { minimum: 0, type: "integer" },
        editorialHoldCount: { minimum: 0, type: "integer" },
        oneClickRepairCount: { minimum: 0, type: "integer" },
        copyEditRequiredCount: { minimum: 0, type: "integer" },
        candidates: { type: "array", items: ContentMillPublicationCandidateSchema },
        policy: { type: "array", items: { minLength: 1, type: "string" } },
    },
    additionalProperties: false,
};
export const contentMillPublicationCandidateCarrier = carrierFrom(ContentMillPublicationCandidateSchema);
export const contentMillPublicationCandidatesReadingCarrier = carrierFrom(ContentMillPublicationCandidatesReadingSchema);
export function contentMillPublicationCandidate(input) {
    return contentMillPublicationCandidateCarrier.assert({
        ...input,
        sourceCycleWarnings: [...input.sourceCycleWarnings],
        findingCodes: [...input.findingCodes],
    }, "content mill publication candidate");
}
export function contentMillPublicationCandidatesReading(input) {
    return contentMillPublicationCandidatesReadingCarrier.assert({
        kind: "organizing.content-mill.publication-candidates",
        ...input,
        candidates: input.candidates.map((candidate) => contentMillPublicationCandidate(candidate)),
        policy: [...input.policy],
    }, "content mill publication candidates reading");
}
export function contentMillPublicationCandidateTerm(input) {
    return carrierToTerm(jsonResource(contentMillPublicationCandidateCarrier.assert(input), "content mill publication candidate"));
}
export function contentMillPublicationCandidatesReadingTerm(input) {
    return carrierToTerm(jsonResource(contentMillPublicationCandidatesReadingCarrier.assert(input), "content mill publication candidates reading"));
}
export const ContentMillRunGateSchema = {
    $id: "organizing/content-mill/run/gate",
    title: "ContentMillRunGate",
    type: "object",
    properties: {
        gate: { minLength: 1, type: "string" },
        charge: { minLength: 1, type: "string" },
        evidence: { minLength: 1, type: "string" },
    },
    additionalProperties: false,
};
export const ContentMillRunUsageSchema = {
    $id: "organizing/content-mill/run/usage",
    title: "ContentMillRunUsage",
    type: "object",
    properties: {
        calls: { minimum: 0, type: "integer" },
        tokens: { minimum: 0, type: "integer" },
    },
    additionalProperties: false,
};
export const ContentMillRunStorySchema = {
    $id: "organizing/content-mill/run/story",
    title: "ContentMillRunStory",
    type: "object",
    properties: {
        title: { minLength: 1, type: "string" },
        url: { minLength: 1, type: "string" },
    },
    additionalProperties: false,
};
export const ContentMillRunRecordSchema = {
    $id: "organizing/content-mill/run/record",
    title: "ContentMillRunRecord",
    type: "object",
    properties: {
        term: { minLength: 1, type: "string" },
        beat: { minLength: 1, type: "string" },
        slug: { minLength: 1, type: "string" },
        shipped: { type: "boolean" },
        gates: { type: "array", items: ContentMillRunGateSchema },
        usage: ContentMillRunUsageSchema,
        t: { minLength: 1, type: "string" },
        obstruction: { minLength: 1, type: "string" },
        evidence: { minLength: 1, type: "string" },
        story: ContentMillRunStorySchema,
    },
    additionalProperties: true,
};
export const ContentMillRunTraceReadingSchema = {
    $id: "organizing/content-mill/run/trace-reading",
    title: "ContentMillRunTraceReading",
    type: "object",
    required: ["kind", "path", "runCount", "runs"],
    properties: {
        kind: { const: "organizing.content-mill.run-trace" },
        path: { minLength: 1, type: "string" },
        runCount: { minimum: 0, type: "integer" },
        runs: { type: "array", items: ContentMillRunRecordSchema },
    },
    additionalProperties: false,
};
export const contentMillRunRecordCarrier = carrierFrom(ContentMillRunRecordSchema);
export const contentMillRunTraceReadingCarrier = carrierFrom(ContentMillRunTraceReadingSchema);
function asRecord(value) {
    return value !== null && typeof value === "object" && !Array.isArray(value) ? { ...value } : {};
}
export function contentMillRunRecord(input) {
    const record = asRecord(input);
    return contentMillRunRecordCarrier.assert({
        ...record,
        ...(Array.isArray(record["gates"]) ? { gates: record["gates"].map((gate) => asRecord(gate)) } : {}),
        ...(record["usage"] === undefined ? {} : { usage: asRecord(record["usage"]) }),
        ...(record["story"] === undefined ? {} : { story: asRecord(record["story"]) }),
    }, "content mill run record");
}
export function contentMillRunTraceReading(input) {
    const runs = input.runs.map((run) => contentMillRunRecord(run));
    return contentMillRunTraceReadingCarrier.assert({
        kind: "organizing.content-mill.run-trace",
        path: input.path,
        runCount: runs.length,
        runs,
    }, "content mill run trace reading");
}
export function replayContentMillRuns(path) {
    if (!existsSync(path))
        return Object.freeze([]);
    const runs = [];
    for (const parsed of parseLines(readFileSync(path, "utf8"))) {
        if (isJsonRecord(parsed))
            runs.push(contentMillRunRecord(parsed));
    }
    return Object.freeze(runs);
}
export function contentMillRunTraceReadingTerm(input) {
    return carrierToTerm(jsonResource(contentMillRunTraceReadingCarrier.assert(input), "content mill run trace reading"));
}
export const ContentMillViewTraceReadingSchema = {
    $id: "organizing/content-mill/view-trace-reading",
    title: "ContentMillViewTraceReading",
    type: "object",
    required: ["kind", "path", "eventCount", "counts"],
    properties: {
        kind: { const: "organizing.content-mill.view-trace" },
        path: { minLength: 1, type: "string" },
        eventCount: { minimum: 0, type: "integer" },
        counts: ContentViewCountsSchema,
    },
    additionalProperties: false,
};
export const contentMillViewTraceReadingCarrier = carrierFrom(ContentMillViewTraceReadingSchema);
export function replayContentViewEvents(path) {
    if (!existsSync(path))
        return Object.freeze([]);
    const events = [];
    for (const parsed of parseLines(readFileSync(path, "utf8"))) {
        if (!isJsonRecord(parsed))
            continue;
        const event = contentViewEventFromRecord(parsed);
        if (event !== undefined)
            events.push(event);
    }
    return Object.freeze(events);
}
export function appendContentViewEvent(path, event) {
    mkdirSync(dirname(path), { recursive: true });
    appendFileSync(path, serializeLines([requireJsonValue(event, "content view event")]), "utf8");
}
export function contentMillViewTraceReading(input) {
    return contentMillViewTraceReadingCarrier.assert({
        kind: "organizing.content-mill.view-trace",
        path: input.path,
        eventCount: input.events.length,
        counts: contentViewCounts({ events: input.events }),
    }, "content mill view trace reading");
}
export function readContentMillViewTrace(path) {
    return contentMillViewTraceReading({
        path,
        events: replayContentViewEvents(path),
    });
}
export function contentMillViewTraceReadingTerm(input) {
    return carrierToTerm(jsonResource(contentMillViewTraceReadingCarrier.assert(input), "content mill view trace reading"));
}
export class ContentMillViewTrace {
    path;
    constructor(path) {
        this.path = path;
    }
    append(view) {
        appendContentViewEvent(this.path, view);
    }
    replay() {
        return replayContentViewEvents(this.path);
    }
    counts() {
        return readContentMillViewTrace(this.path).counts;
    }
    reading() {
        return readContentMillViewTrace(this.path);
    }
}
//# sourceMappingURL=index.mjs.map