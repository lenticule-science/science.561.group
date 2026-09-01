// Routes a procedure work item to dispatching-a-script.

import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');

export default async function dispatchAProcedure({ workItem }) {
  if (!workItem || typeof workItem !== 'object') {
    throw new Error('workItem is required');
  }
  if (workItem.kind !== 'procedure') {
    throw new Error(`workItem.kind must be 'procedure'; got ${workItem.kind}`);
  }

  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'dispatching-a-procedure',
    workItem,
    chosenReceiver: 'dispatching-a-script',
    outcome: 'forwarded',
  });

  const scriptDispatcherUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/dispatching-a-script/scripts/dispatch-a-script.mjs')}`;
  const { default: dispatchAScript } = await import(scriptDispatcherUrl);
  return dispatchAScript({ workItem });
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const chunks = [];
  process.stdin.on('data', c => chunks.push(c));
  process.stdin.on('end', async () => {
    try {
      const workItem = JSON.parse(Buffer.concat(chunks).toString('utf8'));
      const result = await dispatchAProcedure({ workItem });
      console.log(JSON.stringify(result, null, 2));
    } catch (e) { console.error(e.message); process.exit(1); }
  });
}
