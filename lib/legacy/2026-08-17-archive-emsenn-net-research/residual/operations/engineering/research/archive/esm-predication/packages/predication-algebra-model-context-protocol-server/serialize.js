/**
 * Response serialization.
 *
 * Turns the internal result of a dispatch cycle (acceptance result +
 * query results + message metadata) into the JSON shape the MCP wire
 * protocol carries. Per `docs/architecture/principles.md` principles 4 and 7,
 * the wire shape is a witnessing configuration: every claim returned
 * carries its content-addressed structure (and optional provenance);
 * any new contradictions are reported as part of the witnessing
 * rather than as failures.
 *
 * Wire fields:
 *
 *   senderId            content-addressed sender subject
 *   messageId           content-addressed message subject
 *   sentAt              ISO timestamp the message was processed
 *   accepted            array of accepted claims (always all of them
 *                       under the always-accept regime)
 *   newConcentrations   cell-level ⊤ contradictions introduced by
 *                       this batch (single content-addressed claims
 *                       joined to "both")
 *   newAggregates       aggregate-level (s, p) channel conflicts
 *                       introduced by this batch (the projection
 *                       π_{s,p} is "both" because two channels
 *                       disagree)
 *   claims              query results — a flat list of claim records
 *                       the receiver can feed back into pam.createModel
 *                       to operate on locally as a sub-PAM
 */

function serializeClaim(claim, options = {}) {
  const out = {
    subject:   claim.subject,
    predicate: claim.predicate,
    object:    claim.object,
  };
  const value = claim.closedValue || claim.value;
  if (value) out.value = value;
  if (options.includeProvenance && claim.address) {
    out.address = claim.address;
  }
  return out;
}

function serializeResponse({
  messageId,
  senderId,
  sentAt,
  acceptance,
  queryResults,
  includeProvenance = false,
}) {
  const response = {
    senderId,
  };
  if (messageId) response.messageId = messageId;
  if (sentAt)    response.sentAt    = sentAt;

  if (acceptance) {
    response.accepted = acceptance.accepted.map((a) =>
      serializeClaim(a.claim, { includeProvenance })
    );
    if (acceptance.newConcentrations && acceptance.newConcentrations.length > 0) {
      response.newConcentrations = acceptance.newConcentrations;
    }
    if (acceptance.newAggregates && acceptance.newAggregates.length > 0) {
      response.newAggregates = acceptance.newAggregates;
    }
  }

  if (queryResults && queryResults.length > 0) {
    response.claims = queryResults.map((c) => serializeClaim(c, { includeProvenance }));
  }

  return response;
}

export {
  serializeClaim,
  serializeResponse,
};
