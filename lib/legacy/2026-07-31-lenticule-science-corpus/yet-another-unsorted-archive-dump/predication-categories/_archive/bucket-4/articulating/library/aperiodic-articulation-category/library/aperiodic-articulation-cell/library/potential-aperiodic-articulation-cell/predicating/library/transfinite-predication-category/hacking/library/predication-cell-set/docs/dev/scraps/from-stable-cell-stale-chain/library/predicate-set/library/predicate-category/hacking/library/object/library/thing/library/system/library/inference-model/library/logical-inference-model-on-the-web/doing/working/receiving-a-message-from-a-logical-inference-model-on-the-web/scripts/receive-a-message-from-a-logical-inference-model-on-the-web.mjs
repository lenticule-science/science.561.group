// Parses the raw send result into a structured response cell. Dual of
// send-a-message-to-a-logical-inference-model-on-the-web.mjs.

import { fileURLToPath } from 'node:url';

export default async function receiveAMessageFromALogicalInferenceModelOnTheWeb({
  sendResult,
}) {
  if (!sendResult || typeof sendResult !== 'object') {
    throw new Error('sendResult is required (the object returned by sending-a-message-to-a-logical-inference-model-on-the-web)');
  }
  const { model, provider, 'response-text': text, 'sent-at': sentAt } = sendResult;
  if (typeof model !== 'string' || model.length === 0) {
    throw new Error('sendResult.model missing');
  }
  if (typeof text !== 'string') {
    throw new Error('sendResult.response-text missing');
  }

  return {
    model,
    provider: provider || null,
    text,
    'sent-at': sentAt || null,
    'received-at': new Date().toISOString(),
  };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  // Read send-result JSON from stdin.
  const chunks = [];
  process.stdin.on('data', c => chunks.push(c));
  process.stdin.on('end', async () => {
    try {
      const sendResult = JSON.parse(Buffer.concat(chunks).toString('utf8'));
      const result = await receiveAMessageFromALogicalInferenceModelOnTheWeb({ sendResult });
      console.log(JSON.stringify(result, null, 2));
    } catch (e) {
      console.error(e.message);
      process.exit(1);
    }
  });
}
