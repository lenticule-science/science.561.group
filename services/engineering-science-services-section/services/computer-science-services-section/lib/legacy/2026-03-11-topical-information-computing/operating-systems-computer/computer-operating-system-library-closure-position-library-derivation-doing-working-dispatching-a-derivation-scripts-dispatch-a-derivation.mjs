// Routes a derivation work item to logical inference.

import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');

export default async function dispatchADerivation({ workItem }) {
  if (!workItem || typeof workItem !== 'object') {
    throw new Error('workItem is required');
  }
  if (workItem.kind !== 'derivation') {
    throw new Error(`workItem.kind must be 'derivation'; got ${workItem.kind}`);
  }

  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'dispatching-a-derivation',
    workItem,
    chosenReceiver: 'dispatching-logical-inference',
    outcome: 'forwarded',
  });

  const inferenceUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/inference-model/library/logical-inference/doing/working/dispatching-logical-inference/scripts/dispatch-logical-inference.mjs')}`;
  const { default: dispatchLogicalInference } = await import(inferenceUrl);
  return dispatchLogicalInference({ workItem });
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const chunks = [];
  process.stdin.on('data', c => chunks.push(c));
  process.stdin.on('end', async () => {
    try {
      const workItem = JSON.parse(Buffer.concat(chunks).toString('utf8'));
      const result = await dispatchADerivation({ workItem });
      console.log(JSON.stringify(result, null, 2));
    } catch (e) { console.error(e.message); process.exit(1); }
  });
}
