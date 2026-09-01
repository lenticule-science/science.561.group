// english-die.mjs — placement-independent logic die. No filesystem, no
// process.argv, no network, no ambient IO of any kind: pure functions from
// ActivityStreams request values to ActivityStreams response values. The
// CLI/subprocess transport lives in english-enterprise.mjs, which mounts this
// die behind the process face.

import { jsonId } from "./semantic-identity.mjs";

import { tagText } from "./tag.mjs";

const CONTEXT = "https://www.w3.org/ns/activitystreams";
const NODE_ID = "english-language-algebra";
const ACTOR = `urn:ame:${NODE_ID}`;
const LMT_ACTOR = "urn:ame:leader-movement-team";

// The ActivityStreams face preserves the established SCIS v2 semantic token:
// explicit object kind, JSON value and empty witness root.
function response(type, source, object) {
  return { "@context": CONTEXT, id: jsonId({ actor: ACTOR, type, inReplyTo: source?.id ?? null, object }, "lenticule.english-language-algebra.activity"), type, actor: ACTOR, target: source?.actor ?? LMT_ACTOR, inReplyTo: source?.id ?? "urn:activity:unidentified", object };
}
function reject(source, reason, details = {}) {
  return { value: response("Reject", source, { type: "Refusal", reason, ...details }), code: 2 };
}
function ok(value) { return { value, code: 0 }; }

/** Pull the text to tag out of the original Leader activity, if present.
 *  Accepts an explicit `EnglishTaggingRequest` attachment ({ text }), or
 *  falls back to the activity's own Note content when it is a nonempty
 *  string — same permissive shape corpus-management-team's provider uses. */
function attachments(note) { return Array.isArray(note?.attachment) ? note.attachment : note?.attachment === undefined ? [] : [note.attachment]; }
function requestedText(sourceActivity) {
  const explicit = attachments(sourceActivity?.object).find((item) => item?.type === "EnglishTaggingRequest");
  if (typeof explicit?.text === "string" && explicit.text.length > 0) return explicit.text;
  if (typeof sourceActivity?.object?.content === "string" && sourceActivity.object.content.length > 0) return sourceActivity.object.content;
  return null;
}

export function solicit(activity) {
  if (activity?.["@context"] !== CONTEXT || activity.type !== "Offer" || activity.target !== ACTOR || activity.object?.type !== "ServiceSolicitation") {
    return reject(activity, "solicitation must be an ActivityStreams Offer<ServiceSolicitation> addressed to this provider");
  }
  const sourceActivity = activity.object.sourceActivity;
  const text = requestedText(sourceActivity);
  if (text === null) {
    return ok(response("Question", activity, { type: "ServiceTermsRequired", sourceActivity: sourceActivity?.id, missing: ["text(nonempty string, as an EnglishTaggingRequest attachment or Note content)"] }));
  }
  const request = { text };
  const requestDigest = jsonId(request, "lenticule.english-language-algebra.tagging-request");
  const object = {
    type: "ExecutableServiceOffer",
    sourceActivity: sourceActivity.id,
    requestDigest,
    request,
    operation: "invoke-service",
    effects: [],
    requirements: [],
    intentSignature: "urn:service-intent:tag-english-text",
    scope: { textDigest: requestDigest },
  };
  return ok(response("Offer", activity, object));
}

function validateInvocation(activity) {
  if (activity?.["@context"] !== CONTEXT || activity.type !== "Accept" || activity.target !== ACTOR) return "invocation must be an ActivityStreams Accept addressed to this provider";
  const contract = activity.object;
  if (contract?.type !== "ServiceContract") return "invocation must accept a ServiceContract";
  const offer = contract.offer;
  if (offer?.type !== "Offer" || offer.actor !== ACTOR || offer.object?.type !== "ExecutableServiceOffer") return "ServiceContract must carry this provider's executable Offer";
  if (offer.object.requestDigest !== jsonId(offer.object.request, "lenticule.english-language-algebra.tagging-request")) return "accepted request does not match the provider offer digest";
  const capability = contract.capability;
  if (capability?.type !== "Capability" || capability.holder !== ACTOR || capability.invocationTarget !== ACTOR) return "accepted contract requires a capability held by this provider";
  if (capability.parentOffer !== offer.id || capability.attenuation?.requestDigest !== offer.object.requestDigest) return "capability is not attenuated to the accepted offer and request";
  if (!Array.isArray(capability.allowedActions) || !capability.allowedActions.includes("invoke-service")) return "capability does not grant invoke-service";
  return null;
}

/** The postcondition this die previously never checked: tagText() already
 *  computes a real per-sentence cohomology reading (glued/h0/h1/obstructions)
 *  from the settlement engine's own conflicts/voids — it was computed and
 *  then discarded on the way out. A tagging that produced conflicting
 *  (overdetermined) analysis for a sentence is not the same postcondition as
 *  one that settled cleanly, and treating them identically was exactly the
 *  "call the function, trust the result" gap. This does not refuse an
 *  unsettled parse — real language is often genuinely ambiguous, and the
 *  corpus's own doctrine is to price obstruction, not hide it — but the
 *  postcondition is now checked and reported, not silently dropped. */
function checkedPostcondition(result) {
  const perSentence = result.sentences.map((sentence) => sentence.cohomology);
  const settled = perSentence.every((c) => c.glued);
  const totalH1 = perSentence.reduce((sum, c) => sum + c.h1, 0);
  return { settled, totalObstructionBits: totalH1 };
}

export function invoke(activity, instant) {
  const invalid = validateInvocation(activity);
  if (invalid) return reject(activity, invalid);
  const offer = activity.object.offer;
  const request = offer.object.request;
  let result;
  try { result = tagText(request.text); }
  catch (error) { return reject(activity, "tagging failed before producing a result", { diagnostic: error.message }); }
  const postcondition = checkedPostcondition(result);
  const resultBody = {
    type: "EnglishTaggingResult",
    taggedAt: instant,
    requestDigest: offer.object.requestDigest,
    sourceActivity: offer.object.sourceActivity,
    ...result,
    settled: postcondition.settled,
    totalObstructionBits: postcondition.totalObstructionBits,
    customerTerritoryMutation: false,
  };
  return ok(response("Accept", activity, { ...resultBody, id: jsonId(resultBody, "lenticule.english-language-algebra.tagging-result") }));
}
