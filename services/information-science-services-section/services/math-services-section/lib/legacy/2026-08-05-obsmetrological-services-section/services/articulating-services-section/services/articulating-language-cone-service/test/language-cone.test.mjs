import assert from "node:assert/strict";
import { readFileSync } from "node:fs";
import test from "node:test";
import { Message, Role } from "@a2a-js/sdk";
import { discoverSignedAgentCard } from "@red-cup-engineering/a2a-agent-card-discovery-service";
import { ephemeralAgentCardSigning } from "@red-cup-engineering/a2a-agent-card-key-service/testing";
import { extractRmnPart, rmnPart } from "@red-cup-engineering/a2a-rmn-part-service";
import {
  ARTICULATE_OPERATION,
  ARTICULATING_APEX,
  ARTICULATING_LANGUAGE_IDENTIFIERS,
  articulatingRmnProtocol,
  decodeCanonicalArticulatingRmn,
  encodeArticulatingRequestRmn,
  executeArticulateUtterance,
  executeArticulatingA2aMove,
  handleArticulatingMcp,
  projectSignedArticulatingAgentCard,
  serveArticulatingActivityPub,
} from "../src/index.mjs";
import { extractRmnActivity, projectRmnActivity } from "@red-cup-engineering/activitypub-services-section/rmn-activity";

const input = Object.freeze({ tokenMark: { source: "test" }, claimMark: "alive" });

test("one apex executes the canonical Node articulation and names its Lean and Solidity readings", () => {
  const receipt = executeArticulateUtterance(input);
  assert.equal(receipt.apex, ARTICULATING_APEX);
  assert.equal(receipt.operation, ARTICULATE_OPERATION);
  assert.deepEqual(receipt.identifiers, ARTICULATING_LANGUAGE_IDENTIFIERS);
  assert.equal(receipt.identifiers.node, "@lenticule-science/articulating#articulate");
  assert.equal(receipt.identifiers.lean, "Obsmetrologia.Articulating.Cell.initial");
  assert.equal(receipt.identifiers.solidity, "ArticulationCell.seat");
  assert.equal(receipt.cell.kind, "utterance.articulation.cell");
  assert.equal(receipt.cell.potentialAperiodicArticulationCell[0].token.mark.value.source, "test");
  const [, [tokenSlot, claimSlot]] = receipt.cell.potentialAperiodicArticulationCell;
  assert.deepEqual(tokenSlot[0].mark.value, input.tokenMark);
  assert.equal(claimSlot.length, 0);
  const nodeLaw = readFileSync(new URL("../../../lib/articulating/utterance.mts", import.meta.url), "utf8");
  const leanLaw = readFileSync(new URL("../../../../../lib/obsmetrologia/Obsmetrologia/Articulation/Articulating/Cell.lean", import.meta.url), "utf8");
  const solidityLaw = readFileSync(new URL("../../../src/ArticulationCell.sol", import.meta.url), "utf8");
  assert.match(nodeLaw, /export function articulate\(carrier: UtteranceCarrier\)/u);
  assert.match(leanLaw, /def initial \(u : Utterance\) : Articulating\.Cell/u);
  assert.match(solidityLaw, /function seat\(bytes32 utteranceId\) external/u);
});

test("RMN face is a reversible canonical CBOR ascription of that operation", () => {
  const projected = encodeArticulatingRequestRmn(input);
  assert.equal(projected.mediaType, "application/rmn+cbor");
  const decoded = decodeCanonicalArticulatingRmn(projected.bytes);
  assert.equal(decoded.semanticId, projected.semanticId);
  assert.equal(decoded.request.operation, ARTICULATE_OPERATION);
  assert.deepEqual(decoded.request.input, input);
  assert.throws(() => decodeCanonicalArticulatingRmn(Buffer.concat([projected.bytes, Buffer.from([0])])), /canonical|trailing bytes/u);
});

test("MCP lists and calls the exact action apex without a resident server", async () => {
  const listed = await handleArticulatingMcp({ jsonrpc: "2.0", id: 1, method: "tools/list", params: {} });
  assert.deepEqual(listed.result.tools.map((tool) => tool.name), [ARTICULATE_OPERATION]);
  const called = await handleArticulatingMcp({
    jsonrpc: "2.0", id: 2, method: "tools/call",
    params: { name: ARTICULATE_OPERATION, arguments: { input } },
  });
  assert.equal(called.result.isError, undefined);
  const receipt = JSON.parse(called.result.content[0].text);
  assert.equal(receipt.apex, ARTICULATING_APEX);
  assert.equal(receipt.cell.kind, "utterance.articulation.cell");
});

test("A2A executes one bounded canonical-RMN move through the sovereign operation boundary", async () => {
  const projected = encodeArticulatingRequestRmn(input);
  const request = Message.toJSON({
    messageId: "00000000-0000-4000-8000-000000000561",
    contextId: "", taskId: "", role: Role.ROLE_USER,
    parts: [rmnPart(projected.bytes, "articulating-request.rmn.cbor")],
    metadata: {}, extensions: [], referenceTaskIds: [],
  });
  const response = await executeArticulatingA2aMove(request);
  assert.equal(Message.fromJSON(response).role, Role.ROLE_AGENT);
  const part = extractRmnPart(Message.fromJSON(response).parts);
  const receipt = articulatingRmnProtocol.admitResponse(part.bytes, part.ni);
  assert.equal(receipt.disposition, "accepted");
  assert.equal(receipt.result.apex, ARTICULATING_APEX);
  assert.equal(receipt.result.operation, ARTICULATE_OPERATION);
});

test("A2A discovery projects one independently verifiable signed Agent Card", async () => {
  const baseUrl = "https://articulating.actions.561.group";
  const signing = ephemeralAgentCardSigning(baseUrl, "articulating-test");
  const projection = await projectSignedArticulatingAgentCard({ baseUrl, signing });
  assert.equal(projection.card.skills[0].id, ARTICULATE_OPERATION);
  assert.equal(projection.card.signatures.length, 1);
  const fetch = async (url) => {
    if (String(url) === `${baseUrl}/.well-known/agent-card.json`) return new Response(JSON.stringify(projection.card));
    if (String(url) === `${baseUrl}/.well-known/jwks.json`) return new Response(JSON.stringify(projection.jwks));
    return new Response("missing", { status: 404 });
  };
  const discovered = await discoverSignedAgentCard({
    agentUrl: `${baseUrl}/.well-known/agent-card.json`, fetch,
  });
  assert.equal(discovered.skills[0].id, ARTICULATE_OPERATION);
});

test("the operation boundary refuses displacement and unbounded matter", () => {
  assert.throws(() => executeArticulateUtterance({ ...input, apex: "urn:wrong" }), /different apex/u);
  assert.throws(() => executeArticulateUtterance({ tokenMark: "x".repeat(70_000), claimMark: "y" }), /exceeds/u);
});

test("ActivityPub is the public face: it extracts the exact request, invokes the existing A2A move, and delivers its projected response", async () => {
  const origin = "https://articulating.example";
  const identifier = "articulating-language-cone-service";
  const actor = `${origin}/actors/${identifier}`;
  const sender = "https://requester.example/actors/tester";
  const requestBytes = encodeArticulatingRequestRmn(input).bytes;
  const requestMessage = Message.toJSON({
    messageId: "00000000-0000-4000-8000-000000000561", contextId: "", taskId: "", role: Role.ROLE_USER,
    parts: [rmnPart(requestBytes, "articulating-request.rmn.cbor")], metadata: {}, extensions: [], referenceTaskIds: [],
  });
  const activity = projectRmnActivity({
    type: "Offer", origin: "https://requester.example", identifier: "tester", recipient: actor,
    objectBytes: requestBytes, a2aMessage: requestMessage, a2aRole: "ROLE_USER",
    agentCard: "https://requester.example/.well-known/agent-card.json", eventTime: "2026-07-29T00:00:00.000Z",
  });
  const signing = ephemeralAgentCardSigning(origin, "articulating-activitypub-test");
  const agentCardDocuments = await projectSignedArticulatingAgentCard({ baseUrl: origin, signing });
  let admitted;
  let delivered;
  const running = await serveArticulatingActivityPub({
    origin, identifier, custody: { kv: {}, inbox: {}, queue: {} }, agentCardDocuments,
    serve: async (options) => { admitted = options; return { provider: { federation: { startQueue: async () => {} } } }; },
    fetch: async (url) => new Response(JSON.stringify({ inbox: `${url}/inbox` })),
    deliver: async (_provider, delivery) => { delivered = delivery; },
  });
  assert.ok(running.provider);
  assert.equal(admitted.identifier, identifier);
  assert.equal(Object.hasOwn(admitted.wellKnownResources, "/a2a/jsonrpc"), false);
  await admitted.onActivity({ jsonLd: activity });
  assert.equal(delivered.recipient, sender);
  const response = extractRmnPart(Message.fromJSON(extractRmnActivity(delivered.activity, {
    expectedActor: actor, expectedRecipient: sender, expectedAgentCard: `${origin}${agentCardDocuments.path}`,
  }).a2aMessage).parts);
  const receipt = articulatingRmnProtocol.admitResponse(response.bytes, response.ni);
  assert.equal(receipt.result.operation, ARTICULATE_OPERATION);
});
