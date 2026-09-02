import assert from "node:assert/strict";
import { mkdtempSync, readFileSync, readdirSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import test, { after, before } from "node:test";

import { startWitnessJournalProviderProcess } from "@red-cup-engineering/witness-journal-rdf-projection-service/test-provider";

import { bytesNi, qualifyChangeBundle, run, semanticDigest } from "../src/contract-change-bundle-qualification.mjs";

const CONTEXT = "https://www.w3.org/ns/activitystreams";
const PROVIDER = "urn:ame:oml";
const BUYER = "urn:ame:obsmetrologia";
const AT = "2026-07-18T17:00:00.000Z";
const patchContent = "diff --git a/Obsmetrologia/Algebra/NewLemma.lean b/Obsmetrologia/Algebra/NewLemma.lean\nnew file mode 100644\n--- /dev/null\n+++ b/Obsmetrologia/Algebra/NewLemma.lean\n@@ -0,0 +1 @@\n+theorem newLemma : True := by trivial\n";
const EVIDENCE_A = `ni:///sha-256;${"A".repeat(43)}`;
const EVIDENCE_B = `ni:///sha-256;${"B".repeat(43)}`;
const EVIDENCE_C = `ni:///sha-256;${"C".repeat(43)}`;
let witnessJournal;

before(async () => { witnessJournal = await startWitnessJournalProviderProcess(); });
after(async () => { await witnessJournal?.close(); });

function request(overrides = {}) {
  return { bundleId: "new-lemma-bundle",
    baseline: { repository: "https://github.com/emsenn/obsmetrologia.git", revision: "1".repeat(40) },
    patch: { content: patchContent, ni: bytesNi(patchContent), changedPaths: ["Obsmetrologia/Algebra/NewLemma.lean"] },
    claim: { id: "new-lemma", kind: "pure-mathematics", statement: "True has a proof",
      corpusSources: [{ path: "content/mathematics/new-lemma.md", ni: EVIDENCE_A }] },
    verification: [{ id: "obsmetrologia-scope-audit", outcome: "passed", evidence: EVIDENCE_B },
      { id: "obsmetrologia-lake-build", outcome: "passed", evidence: EVIDENCE_C }],
    applicationDependencies: [],
    authority: { controller: PROVIDER, basis: "OML prepared bundle offered for customer admission", mayAdmitToObsmetrologia: false },
    ...overrides };
}
function solicitation(bundle = request()) {
  return { "@context": CONTEXT, id: "urn:test:oml-solicitation", type: "Offer", actor: BUYER, target: PROVIDER,
    object: { type: "ServiceSolicitation", request: bundle } };
}
function acceptance(offer, overrides = {}) {
  return { "@context": CONTEXT, id: "urn:test:oml-acceptance", type: "Accept", actor: BUYER, target: PROVIDER,
    object: { type: "ServiceContract", offer,
      termsAcceptance: { termDigest: offer.object.termsDigest },
      capability: { type: "Capability", holder: PROVIDER, invocationTarget: PROVIDER, parentOffer: offer.id,
        attenuation: { requestDigest: offer.object.requestDigest }, capTP: { target: PROVIDER, method: "invoke-service" },
        allowedActions: ["invoke-service", "provider-local-witness-journal-evidence"] }, ...overrides } };
}
async function execute(activity, operation, root) {
  return run(activity, operation, AT, { dataRoot: root, agentUrl: witnessJournal.agentCardUrl });
}

test("bundle qualification verifies bytes and envelope but reserves mathematical truth and admission", () => {
  const result = qualifyChangeBundle(request());
  assert.equal(result.qualification.contentAddressVerified, true); assert.equal(result.qualification.mathematicalTruthVerified, false);
  assert.equal(result.qualification.customerAdmissionRequired, true); assert.equal(result.customerMutation, false);
  assert.equal(result.requestDigest, semanticDigest(request())); assert.equal(result.patchIdentity, bytesNi(patchContent));
});

test("application-shaped paths, dependencies, and old digest forms are refused", () => {
  assert.throws(() => qualifyChangeBundle(request({ applicationDependencies: ["customer-runtime"] })), /applicationDependencies/);
  const applicationPatch = patchContent.replaceAll("Obsmetrologia/Algebra/NewLemma.lean", "apps/HoareProgram.lean");
  assert.throws(() => qualifyChangeBundle(request({ patch: { content: applicationPatch, ni: bytesNi(applicationPatch), changedPaths: ["apps/HoareProgram.lean"] } })), /application-shaped paths/);
  const old = request(); old.patch = { content: patchContent, sha256: "sha256:obsolete", changedPaths: old.patch.changedPaths };
  assert.throws(() => qualifyChangeBundle(old), /RFC6920/);
});

test("the exact RMN law closes with qualification and WitnessJournal evidence", async (t) => {
  const root = mkdtempSync(join(tmpdir(), "oml-contract-test-")); t.after(() => rmSync(root, { recursive: true, force: true }));
  const offer = await execute(solicitation(), "solicit-service", root);
  assert.equal(offer.type, "Offer"); assert.equal(offer.object.requestDigest, semanticDigest(offer.object.request));
  assert.equal(offer.object.terms.assetPaymentRequired, false);
  const result = await execute(acceptance(offer), "invoke-service", root);
  assert.equal(result.type, "Accept"); assert.equal(result.object.record.qualification.qualification.customerAdmissionRequired, true);
  assert.equal(result.object.receipt.assetSettlementClaimed, false); assert.equal(result.object.customerMutation, false);
  const graphDirectory = join(root, "witnessJournal", "2026", "07", "18");
  assert.equal(readdirSync(graphDirectory).length >= 3, true);
  assert.equal(readFileSync(join(graphDirectory, readdirSync(graphDirectory)[0]), "utf8").includes("urn:emsenn:witness-journal:category"), true);
});

test("altered terms and overbroad capability refuse before qualification", async (t) => {
  const root = mkdtempSync(join(tmpdir(), "oml-altered-test-")); t.after(() => rmSync(root, { recursive: true, force: true }));
  const offer = await execute(solicitation(), "solicit-service", root);
  const changed = await execute(acceptance(offer, { termsAcceptance: { termDigest: "ni:///sha-256;changed" } }), "invoke-service", root);
  assert.equal(changed.type, "Reject"); assert.equal(changed.object.prohibitedEffectsPerformed, false);
  const overbroad = acceptance(offer); overbroad.object.capability.allowedActions.push("customer-write");
  const refused = await execute(overbroad, "invoke-service", root); assert.equal(refused.type, "Reject");
});

test("absence of the hired WitnessJournal provider fails closed", async () => {
  await assert.rejects(run(solicitation(), "solicit-service", AT, { dataRoot: mkdtempSync(join(tmpdir(), "oml-no-witness-journal-")) }), /WITNESS_JOURNAL_RDF_AGENT/u);
});
