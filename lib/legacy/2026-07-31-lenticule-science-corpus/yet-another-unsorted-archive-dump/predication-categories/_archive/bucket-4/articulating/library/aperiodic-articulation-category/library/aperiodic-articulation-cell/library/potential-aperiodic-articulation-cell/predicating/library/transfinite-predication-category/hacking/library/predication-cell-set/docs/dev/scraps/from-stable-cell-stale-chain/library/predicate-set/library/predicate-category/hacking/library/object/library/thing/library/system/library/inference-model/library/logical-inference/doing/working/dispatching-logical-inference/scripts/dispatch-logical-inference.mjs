// Takes a work item needing LLM consultation and routes it through the model
// picker. Returns the response cell from the picked model.

import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');

export default async function dispatchLogicalInference({ workItem }) {
  if (!workItem || typeof workItem !== 'object') {
    throw new Error('workItem is required');
  }
  const { skill, prompt, maxTokens, target } = workItem;
  if (typeof skill !== 'string' || skill.length === 0) {
    throw new Error('workItem.skill is required');
  }
  if (typeof prompt !== 'string' || prompt.length === 0) {
    throw new Error('workItem.prompt is required');
  }

  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'dispatching-logical-inference',
    workItem,
    chosenReceiver: 'dispatching-to-a-logical-inference-model',
    outcome: 'forwarded',
  });

  const pickerUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/inference-model/doing/working/dispatching-to-a-logical-inference-model/scripts/dispatch-to-a-logical-inference-model.mjs')}`;
  const { default: dispatchToModel } = await import(pickerUrl);

  const responseCell = await dispatchToModel({ skill, prompt, maxTokens, workItem });
  return {
    ...responseCell,
    target: target || null,
  };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const chunks = [];
  process.stdin.on('data', c => chunks.push(c));
  process.stdin.on('end', async () => {
    try {
      const workItem = JSON.parse(Buffer.concat(chunks).toString('utf8'));
      const result = await dispatchLogicalInference({ workItem });
      console.log(JSON.stringify(result, null, 2));
    } catch (e) {
      console.error(e.message);
      process.exit(1);
    }
  });
}
