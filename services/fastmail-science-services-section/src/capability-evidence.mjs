export const EVIDENCE_AT = '2026-10-05T22:45:00-05:00';

const observations = Object.freeze({
  'email.draft.create': Object.freeze({ connectorExposure: 'HELD', providerSupport: 'UNKNOWN', evidence: 'ChatGPT Fastmail draft_email tool' }),
  'email.draft.update': Object.freeze({ connectorExposure: 'REFUTED', providerSupport: 'UNKNOWN', evidence: 'no current ChatGPT Fastmail update-existing-draft verb observed' }),
  'email.compose.send': Object.freeze({ connectorExposure: 'HELD', providerSupport: 'UNKNOWN', evidence: 'ChatGPT Fastmail send_email tool; authority remains separate' }),
  'note.append': Object.freeze({ connectorExposure: 'HELD', providerSupport: 'UNKNOWN', evidence: 'ChatGPT Fastmail add_to_note tool' }),
  'calendar.event.update': Object.freeze({ connectorExposure: 'HELD', providerSupport: 'UNKNOWN', evidence: 'ChatGPT Fastmail update_event tool with notification side effects for invitees' })
});

export function evidenceFor(capabilityId) {
  return observations[capabilityId] ?? Object.freeze({ connectorExposure: 'UNKNOWN', providerSupport: 'UNKNOWN', evidence: 'no current observation' });
}

export function inferenceFor(capabilityId) {
  const observation = evidenceFor(capabilityId);
  if (observation.connectorExposure === 'REFUTED' && observation.providerSupport !== 'REFUTED') {
    return 'CONNECTOR_GAP_PROVIDER_UNRESOLVED';
  }
  if (observation.connectorExposure === 'HELD') return 'CONNECTOR_EXPOSED_PROVIDER_SEMANTICS_REQUIRE_SEPARATE_EVIDENCE';
  return 'UNKNOWN';
}
