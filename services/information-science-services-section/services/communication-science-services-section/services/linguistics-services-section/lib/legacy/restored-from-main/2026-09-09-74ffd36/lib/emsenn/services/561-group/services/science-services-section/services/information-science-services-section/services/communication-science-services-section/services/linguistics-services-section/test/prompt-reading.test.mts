import assert from "node:assert/strict";
import test from "node:test";

import { defineRelation, defineType, makeThing } from "@red-cup-engineering/computer-data-type-engine";
import { admitJournalPrompt, compilePromptReading, definePromptCompilerTypes } from "../src/compile-prompt-reading.mts";
import { compileJournalPrompt } from "../dist/compile-journal-prompt.mjs";
import { parseLeaderMessage } from "../src/parse-leader-message.js";

function must<Value>(result: { ok: true; value: Value } | { ok: false; refusal: unknown }): Value {
  if (!result.ok) throw new Error(`refused: ${JSON.stringify(result.refusal)}`);
  return result.value;
}

test("a verbatim journal prompt and resource fixture become one proposed typed SPO claim", () => {
  const types = must(definePromptCompilerTypes());
  const promptText = "Guile needs to work over Node";
  const parse = parseLeaderMessage(promptText);
  const resourceDescriptor = defineType({ id: "test.actual-resource-descriptor/v1", name: "Actual resource descriptor", description: "The graph descriptors received by this compiler.", parents: [], schema: { type: "object", additionalProperties: false, required: ["name"], properties: { name: { type: "string", minLength: 1 } } } });
  const resourceReference = defineType({ id: "test.actual-resource-reference/v1", name: "Actual resource reference", description: "One graph resource content address.", parents: [], schema: { type: "string", minLength: 1 } });
  assert.ok(resourceDescriptor.ok && resourceReference.ok);
  const guile = must(makeThing({ type: must(resourceDescriptor), attributes: { name: "Guile" } }));
  const node = must(makeThing({ type: must(resourceDescriptor), attributes: { name: "Node" } }));
  const relation = must(defineRelation({ id: "runtime-needs-to-work-over", domain: must(resourceReference), codomain: must(resourceReference), witness: types.statementWitness }));
  const result = must(compileJournalPrompt({ journalEntryId: "journal:current-source", sourceToken: parse.source.token, text: promptText, resources: [guile, node], aliases: (resource) => resource.id === guile.id ? ["Guile"] : ["Node"], bindings: [{ relation, head: "needs", preposition: "over", classification: "proposed-requirement" }] }));
  assert.equal(result.unresolved.length, 0);
  assert.equal(result.claims.length, 1);
  assert.equal(result.claims[0].attributes.status, "proposed");
  assert.equal(result.statements[0].statement.subject, guile.id);
  assert.equal(result.statements[0].statement.object, node.id);
  assert.equal(result.field.statements[0].id, result.statements[0].id);
});

test("ambiguous English context remains unresolved and creates no Claim", () => {
  const types = must(definePromptCompilerTypes());
  const text = "THESE SHOULD ALL BE APPS"; const parse = parseLeaderMessage(text);
  const prompt = must(admitJournalPrompt({ journalEntryId: "journal:ambiguous", sourceToken: parse.source.token, text }, types));
  const result = must(compilePromptReading({ prompt, parse, resources: [], aliases: () => [], types, bindings: [] }));
  assert.equal(result.claims.length, 0);
  assert.equal(result.unresolved.length, 1);
});

test("forged prompt identity and a source mismatch are refused before graph admission", () => {
  const types = must(definePromptCompilerTypes());
  const text = "Guile needs to work over Node"; const parse = parseLeaderMessage(text);
  const prompt = must(admitJournalPrompt({ journalEntryId: "journal:forged", sourceToken: parse.source.token, text }, types));
  const forged = { ...prompt, id: "ni:///sha-256;forged" };
  const forgedResult = compilePromptReading({ prompt: forged, parse, resources: [], aliases: () => [], types, bindings: [] });
  assert.equal(forgedResult.ok, false);
  const wrongSource = { ...parse, source: { ...parse.source, text: "Guile needs to work over Bun" } };
  const mismatchResult = compilePromptReading({ prompt, parse: wrongSource, resources: [], aliases: () => [], types, bindings: [] });
  assert.equal(mismatchResult.ok, false);
});
