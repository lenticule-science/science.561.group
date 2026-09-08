import { admitStatement, createRelationalField, defineType, makeThing, typeIdentity, } from "@red-cup-engineering/computer-data-type-engine";
const accepted = (value) => Object.freeze({ ok: true, value });
const refused = (kind, message) => Object.freeze({ ok: false, refusal: Object.freeze({ kind, message }) });
const normalized = (text) => text.normalize("NFKC").toLocaleLowerCase("en-US");
/**
 * The shared type declarations for source prompts, actual resources, proposed
 * claims, and the witness carried by each admitted statement. All values
 * cross the data-engine admission boundary before they become Things or rows.
 */
export function definePromptCompilerTypes() {
    const prompt = defineType({
        id: "lenticule.prompt/v1", name: "Prompt", description: "Verbatim source text admitted from a durable journal.", parents: [],
        schema: { type: "object", additionalProperties: false, required: ["journalEntryId", "sourceToken", "text"], properties: { journalEntryId: { type: "string", minLength: 1 }, sourceToken: { type: "string", minLength: 1 }, text: { type: "string", minLength: 1 } } },
    });
    const witness = defineType({
        id: "lenticule.prompt-statement-witness/v1", name: "Prompt statement witness", description: "Parser and source span evidence for a proposed statement.", parents: [],
        schema: { type: "object", additionalProperties: false, required: ["promptId", "parserId", "readingId", "sourceToken", "start", "end"], properties: { promptId: { type: "string", minLength: 1 }, parserId: { type: "string", minLength: 1 }, readingId: { type: "string", minLength: 1 }, sourceToken: { type: "string", minLength: 1 }, start: { type: "integer", minimum: 0 }, end: { type: "integer", minimum: 0 } } },
    });
    if (!prompt.ok || !witness.ok)
        return refused("invalid-types", "the shared prompt compiler type declarations were refused");
    const claim = defineType({
        id: "lenticule.proposed-claim/v1", name: "Proposed claim", description: "A parser-derived, unaccepted claim that identifies its admitted SPO statement.", parents: [],
        schema: { type: "object", additionalProperties: false, required: ["status", "statementId", "promptId", "parserId", "readingId", "sourceToken", "subjectId", "predicate", "objectId", "start", "end", "classification"], properties: { status: { const: "proposed" }, statementId: { type: "string", minLength: 1 }, promptId: { type: "string", minLength: 1 }, parserId: { type: "string", minLength: 1 }, readingId: { type: "string", minLength: 1 }, sourceToken: { type: "string", minLength: 1 }, subjectId: { type: "string", minLength: 1 }, predicate: { type: "string", minLength: 1 }, objectId: { type: "string", minLength: 1 }, start: { type: "integer", minimum: 0 }, end: { type: "integer", minimum: 0 }, classification: { enum: ["proposed-intention", "proposed-directive", "proposed-requirement"] } } },
    });
    if (!claim.ok)
        return refused("invalid-types", "the proposed Claim declaration was refused");
    return accepted(Object.freeze({ prompt: prompt.value, claim: claim.value, statementWitness: witness.value }));
}
/** Admit the exact witness bytes already written by the journal as a Prompt Thing. */
export function admitJournalPrompt(input, types) {
    if (input.journalEntryId.length === 0 || input.sourceToken.length === 0 || input.text.length === 0)
        return refused("invalid-prompt", "journal prompt needs an entry identity, source token, and verbatim text");
    const prompt = makeThing({ type: types.prompt, attributes: { journalEntryId: input.journalEntryId, sourceToken: input.sourceToken, text: input.text } });
    return prompt.ok ? accepted(prompt.value) : refused("invalid-prompt", "journal witness was refused by the declared Prompt type");
}
function namedResources(resources, aliases, label) {
    const needle = normalized(label);
    return resources.filter((resource) => aliases(resource).some((name) => normalized(name) === needle));
}
function word(reading, id) {
    return reading.parse.words.find((candidate) => candidate.id === id)?.text;
}
/**
 * Compile only a dependency pattern explicitly bound to a declared shared
 * Relation.  A missing or multiple resource match is retained as unresolved;
 * this function never fabricates a resource endpoint.
 */
export function compilePromptReading(input) {
    const reAdmittedPrompt = makeThing({ type: input.types.prompt, attributes: input.prompt.attributes });
    if (!reAdmittedPrompt.ok || input.prompt.type !== typeIdentity(input.types.prompt) || input.prompt.id !== (reAdmittedPrompt.ok ? reAdmittedPrompt.value.id : ""))
        return refused("invalid-prompt", "prompt did not re-admit as the declared Prompt Thing");
    const promptAttributes = reAdmittedPrompt.value.attributes;
    if (promptAttributes.text !== input.parse.source.text || promptAttributes.sourceToken !== input.parse.source.token)
        return refused("invalid-prompt", "prompt witness text or source token does not equal the parser source");
    const statements = [];
    const claims = [];
    const unresolved = [];
    for (const reading of input.parse.forest.readings) {
        if (reading.span.start < 0 || reading.span.end < reading.span.start || reading.span.end > input.parse.source.text.length || input.parse.source.text.slice(reading.span.start, reading.span.end) !== reading.span.text) {
            unresolved.push(Object.freeze({ readingId: reading.id, span: reading.span, reason: "source-mismatch" }));
            continue;
        }
        const subjectArc = reading.parse.arcs.find((arc) => arc.rel === "nsubj");
        const relations = subjectArc ? input.bindings.filter((binding) => normalized(word(reading, subjectArc.head) ?? "") === normalized(binding.head)) : [];
        if (relations.length > 1) {
            unresolved.push(Object.freeze({ readingId: reading.id, span: reading.span, reason: "ambiguous-relation" }));
            continue;
        }
        const relation = relations[0];
        const prepArc = relation && subjectArc ? reading.parse.arcs.find((arc) => arc.rel === "prep" && arc.head === subjectArc.head && normalized(word(reading, arc.dependent) ?? "") === normalized(relation.preposition)) : undefined;
        const objectArc = prepArc ? reading.parse.arcs.find((arc) => arc.rel === "pobj" && arc.head === prepArc.dependent) : undefined;
        if (!subjectArc || !relation || !objectArc) {
            unresolved.push(Object.freeze({ readingId: reading.id, span: reading.span, reason: "unbound-relation" }));
            continue;
        }
        const subjects = namedResources(input.resources, input.aliases, word(reading, subjectArc.dependent) ?? "");
        const objects = namedResources(input.resources, input.aliases, word(reading, objectArc.dependent) ?? "");
        if (subjects.length !== 1) {
            unresolved.push(Object.freeze({ readingId: reading.id, span: reading.span, reason: subjects.length === 0 ? "unresolved-subject" : "ambiguous-subject" }));
            continue;
        }
        if (objects.length !== 1) {
            unresolved.push(Object.freeze({ readingId: reading.id, span: reading.span, reason: objects.length === 0 ? "unresolved-object" : "ambiguous-object" }));
            continue;
        }
        const admitted = admitStatement(relation.relation, { subject: subjects[0].id, predicate: relation.relation.id, object: objects[0].id, witness: { promptId: input.prompt.id, parserId: input.parse.id, readingId: reading.id, sourceToken: input.parse.source.token, start: reading.span.start, end: reading.span.end } });
        if (!admitted.ok) {
            unresolved.push(Object.freeze({ readingId: reading.id, span: reading.span, reason: "relation-refusal" }));
            continue;
        }
        const claim = makeThing({ type: input.types.claim, attributes: { status: "proposed", statementId: admitted.value.id, promptId: input.prompt.id, parserId: input.parse.id, readingId: reading.id, sourceToken: input.parse.source.token, subjectId: subjects[0].id, predicate: relation.relation.id, objectId: objects[0].id, start: reading.span.start, end: reading.span.end, classification: relation.classification } });
        if (!claim.ok)
            return refused("claim-refusal", "the declared Proposed Claim type refused the admitted statement carrier");
        statements.push(admitted.value);
        claims.push(claim.value);
    }
    const field = createRelationalField(input.bindings.map((binding) => binding.relation), statements.map((entry) => entry.statement));
    if (field.ok === false)
        return refused("field-refusal", field.refusal.message);
    return accepted(Object.freeze({ claims: Object.freeze(claims), statements: Object.freeze(statements), field: field.value, unresolved: Object.freeze(unresolved) }));
}
