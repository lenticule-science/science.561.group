import assert from "node:assert/strict";
import test from "node:test";
import { bytesNi, qualifyChangeBundle, semanticDigest } from "../src/contract-change-bundle-qualification.mjs";
import { ACTIVITYSTREAMS_CONTEXT } from "@red-cup-engineering/activitypub-services-section/activitystreams";

const PROVIDER = "urn:ame:oml";
const BUYER = "urn:ame:obsmetrologia";
const AT = "2026-07-18T17:00:00.000Z";
const patchContent = "diff --git a/Obsmetrologia/Algebra/NewLemma.lean b/Obsmetrologia/Algebra/NewLemma.lean\nnew file mode 100644\n--- /dev/null\n+++ b/Obsmetrologia/Algebra/NewLemma.lean\n@@ -0,0 +1 @@\n+theorem newLemma : True := by trivial\n";
const EVIDENCE_A = `ni:///sha-256;${"A".repeat(43)}`;
const EVIDENCE_B = `ni:///sha-256;${"B".repeat(43)}`;
const EVIDENCE_C = `ni:///sha-256;${"C".repeat(43)}`;
const EVIDENCE_D = `ni:///sha-256;${"D".repeat(43)}`;

function request(overrides = {}) {
  return { bundleId: "new-lemma-bundle",
    baseline: { repository: "https://github.com/emsenn/obsmetrologia.git", revision: "1".repeat(40) },
    patch: { content: patchContent, ni: bytesNi(patchContent), changedPaths: ["Obsmetrologia/Algebra/NewLemma.lean"] },
    claim: { id: "new-lemma", kind: "pure-mathematics", statement: "True has a proof",
      corpusSources: [{ path: "content/mathematics/new-lemma.md", ni: EVIDENCE_A }] },
    verification: [{ id: "obsmetrologia-scope-audit", outcome: "passed", evidence: EVIDENCE_B },
      { id: "obsmetrologia-lake-build", outcome: "passed", evidence: EVIDENCE_C },
      { id: "obsmetrologia-axiom-law", outcome: "passed", evidence: EVIDENCE_D }],
    applicationDependencies: [],
    authority: { controller: PROVIDER, basis: "OML prepared bundle offered for customer admission", mayAdmitToObsmetrologia: false },
    ...overrides };
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

function singleFilePatch(path, addedLine) {
  const content = `diff --git a/${path} b/${path}\nnew file mode 100644\n--- /dev/null\n+++ b/${path}\n@@ -0,0 +1 @@\n+${addedLine}\n`;
  return { content, ni: bytesNi(content), changedPaths: [path] };
}

test("a bundle missing the obsmetrologia-axiom-law verification is refused", () => {
  const missing = request();
  missing.verification = missing.verification.filter((item) => item.id !== "obsmetrologia-axiom-law");
  assert.throws(() => qualifyChangeBundle(missing), /obsmetrologia-axiom-law/);
});

test("a diff adding an axiom declaration under the Obsmetrologia Lean library is refused", () => {
  const patch = singleFilePatch("Obsmetrologia/Algebra/NewAxiom.lean", "axiom newAxiom : True");
  assert.throws(() => qualifyChangeBundle(request({ patch })), /diff adds an axiom under/);
});

test("a diff stating a frontier theorem with sorry under the Obsmetrologia Lean library is not refused by the textual gate", () => {
  const patch = singleFilePatch("Obsmetrologia/Algebra/NewLemma.lean", "theorem newLemma : True := by sorry");
  assert.doesNotThrow(() => qualifyChangeBundle(request({ patch })));
});

test("an axiom line outside the Obsmetrologia Lean library, or fully commented out within it, is not refused by the textual gate", () => {
  const outsideLibrary = singleFilePatch("content/mathematics/notes/new-lemma.md", "axiom newAxiom : True");
  assert.doesNotThrow(() => qualifyChangeBundle(request({ patch: outsideLibrary })));
  const commentedOut = singleFilePatch("Obsmetrologia/Algebra/NewLemma.lean", "-- axiom newAxiom : True");
  assert.doesNotThrow(() => qualifyChangeBundle(request({ patch: commentedOut })));
});

