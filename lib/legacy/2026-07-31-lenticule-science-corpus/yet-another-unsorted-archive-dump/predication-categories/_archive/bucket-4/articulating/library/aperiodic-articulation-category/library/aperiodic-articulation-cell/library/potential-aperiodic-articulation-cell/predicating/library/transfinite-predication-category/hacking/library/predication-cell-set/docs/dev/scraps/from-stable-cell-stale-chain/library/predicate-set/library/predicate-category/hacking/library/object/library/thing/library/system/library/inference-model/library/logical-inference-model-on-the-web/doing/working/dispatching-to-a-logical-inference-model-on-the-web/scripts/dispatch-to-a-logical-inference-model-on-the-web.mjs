// Composes the web-I/O pair: sending-a-message-to-…-on-the-web,
// then receiving-a-message-from-…-on-the-web. Returns the response cell.

import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');

export default async function dispatchToALogicalInferenceModelOnTheWeb({
  model,
  prompt,
  maxTokens,
  workItem,
}) {
  const wi = workItem ?? { skill: null, kind: 'derivation' };

  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'dispatching-to-a-logical-inference-model-on-the-web',
    workItem: wi,
    chosenReceiver: model,
    outcome: 'forwarded',
  });

  const sendUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/inference-model/library/logical-inference-model-on-the-web/doing/working/sending-a-message-to-a-logical-inference-model-on-the-web/scripts/send-a-message-to-a-logical-inference-model-on-the-web.mjs')}`;
  const receiveUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/inference-model/library/logical-inference-model-on-the-web/doing/working/receiving-a-message-from-a-logical-inference-model-on-the-web/scripts/receive-a-message-from-a-logical-inference-model-on-the-web.mjs')}`;

  const { default: send } = await import(sendUrl);
  const { default: receive } = await import(receiveUrl);

  const sendResult = await send({ model, prompt, maxTokens, workItem: wi });
  const responseCell = await receive({ sendResult });
  return responseCell;
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const args = process.argv.slice(2);
  let model, prompt, maxTokens;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--model') model = args[++i];
    else if (args[i] === '--prompt') prompt = args[++i];
    else if (args[i] === '--max-tokens') maxTokens = parseInt(args[++i], 10);
  }
  if (!model || !prompt) {
    console.error('Usage: dispatch-to-a-logical-inference-model-on-the-web.mjs --model <slug> --prompt <text> [--max-tokens <n>]');
    process.exit(2);
  }
  dispatchToALogicalInferenceModelOnTheWeb({ model, prompt, maxTokens })
    .then(r => { console.log(JSON.stringify(r, null, 2)); })
    .catch(e => { console.error(e.message); process.exit(1); });
}
