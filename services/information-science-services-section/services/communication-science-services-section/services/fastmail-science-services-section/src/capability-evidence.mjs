export const EVIDENCE_AT = '2026-10-05T23:53:40-05:00';

const observations = Object.freeze({
  'email.draft.create': Object.freeze({
    connectorExposure: 'HELD',
    providerSupport: 'UNKNOWN',
    harnessCallability: 'HELD',
    verifiedEffect: 'HELD',
    readback: 'HELD',
    evidence: 'ChatGPT Fastmail draft_email synthetic unsent draft assay; read_email and search_email confirmed Drafts placement, isDraft=true, exact subject/body readback; no external recipient bound'
  }),
  'email.draft.update': Object.freeze({
    connectorExposure: 'REFUTED',
    providerSupport: 'HELD',
    harnessCallability: 'REFUTED',
    verifiedEffect: 'UNKNOWN',
    readback: 'UNKNOWN',
    evidence: 'RFC 8621 Email/set supports draft revision by create replacement + destroy prior draft; Fastmail documents JMAP mail support; current ChatGPT update_email only changes read/flag/folder state'
  }),
  'email.draft.trash': Object.freeze({
    connectorExposure: 'HELD',
    providerSupport: 'UNKNOWN',
    harnessCallability: 'REFUTED',
    verifiedEffect: 'UNKNOWN',
    readback: 'HELD_NO_EFFECT',
    evidence: 'delete_email advertises move-to-Trash for email IDs, but live synthetic draft deletion was blocked by the current safety layer; post-attempt readback confirmed the draft remained in Drafts'
  }),
  'email.compose.send': Object.freeze({
    connectorExposure: 'HELD',
    providerSupport: 'UNKNOWN',
    harnessCallability: 'UNKNOWN',
    verifiedEffect: 'UNKNOWN',
    readback: 'UNKNOWN',
    evidence: 'ChatGPT Fastmail send_email tool; authority remains separate and no send assay was performed'
  }),
  'note.append': Object.freeze({ connectorExposure: 'HELD', providerSupport: 'UNKNOWN', harnessCallability: 'UNKNOWN', verifiedEffect: 'UNKNOWN', readback: 'UNKNOWN', evidence: 'ChatGPT Fastmail add_to_note tool' }),
  'calendar.event.update': Object.freeze({ connectorExposure: 'HELD', providerSupport: 'UNKNOWN', harnessCallability: 'UNKNOWN', verifiedEffect: 'UNKNOWN', readback: 'UNKNOWN', evidence: 'ChatGPT Fastmail update_event tool with notification side effects for invitees' })
});

export function evidenceFor(capabilityId) {
  return observations[capabilityId] ?? Object.freeze({
    connectorExposure: 'UNKNOWN', providerSupport: 'UNKNOWN', harnessCallability: 'UNKNOWN', verifiedEffect: 'UNKNOWN', readback: 'UNKNOWN', evidence: 'no current observation'
  });
}

export function inferenceFor(capabilityId) {
  const observation = evidenceFor(capabilityId);
  if (observation.connectorExposure === 'REFUTED' && observation.providerSupport === 'HELD') {
    return 'PROVIDER_SUPPORTED_CONNECTOR_GAP';
  }
  if (observation.connectorExposure === 'REFUTED' && observation.providerSupport !== 'REFUTED') {
    return 'CONNECTOR_GAP_PROVIDER_UNRESOLVED';
  }
  if (observation.connectorExposure === 'HELD' && observation.harnessCallability === 'REFUTED') {
    return 'CONNECTOR_EXPOSED_HARNESS_BLOCKED';
  }
  if (observation.connectorExposure === 'HELD' && observation.harnessCallability === 'HELD' && observation.verifiedEffect === 'HELD' && observation.readback === 'HELD') {
    return 'CONNECTOR_EFFECT_VERIFIED';
  }
  if (observation.connectorExposure === 'HELD') return 'CONNECTOR_EXPOSED_PROVIDER_SEMANTICS_REQUIRE_SEPARATE_EVIDENCE';
  return 'UNKNOWN';
}
