// Entry point of the dispatch chain. Reads workItem.kind and routes to the
// matching kind-dispatcher.

import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');

const KIND_TO_DISPATCHER = {
  process: { slug: 'dispatching-a-process', rel: 'dispatching-a-process/scripts/dispatch-a-process.mjs' },
  procedure: { slug: 'dispatching-a-procedure', rel: 'dispatching-a-procedure/scripts/dispatch-a-procedure.mjs' },
  derivation: { slug: 'dispatching-a-derivation', rel: 'dispatching-a-derivation/scripts/dispatch-a-derivation.mjs' },
  inquiry: { slug: 'dispatching-an-inquiry', rel: 'dispatching-an-inquiry/scripts/dispatch-an-inquiry.mjs' },
};

export default async function dispatchWork({ workItem }) {
  if (!workItem || typeof workItem !== 'object') {
    throw new Error('workItem is required');
  }
  const { kind } = workItem;
  const branch = KIND_TO_DISPATCHER[kind];
  if (!branch) {
    appendDispatchWitness({
      repoRoot: REPO_ROOT,
      skill: 'dispatching-work',
      workItem,
      chosenReceiver: null,
      outcome: 'error',
      error: `unknown workItem.kind ${JSON.stringify(kind)}`,
    });
    throw new Error(`unknown workItem.kind ${JSON.stringify(kind)}; expected one of ${Object.keys(KIND_TO_DISPATCHER).join(', ')}`);
  }

  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'dispatching-work',
    workItem,
    chosenReceiver: branch.slug,
    outcome: 'forwarded',
  });

  const dispatcherUrl = `file://${join(REPO_ROOT, 'doing/working/skills', branch.rel)}`;
  const { default: kindDispatcher } = await import(dispatcherUrl);
  const result = await kindDispatcher({ workItem });
  return {
    ...result,
    'dispatched-as': branch.slug,
  };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const chunks = [];
  process.stdin.on('data', c => chunks.push(c));
  process.stdin.on('end', async () => {
    try {
      const workItem = JSON.parse(Buffer.concat(chunks).toString('utf8'));
      const result = await dispatchWork({ workItem });
      console.log(JSON.stringify(result, null, 2));
    } catch (e) { console.error(e.message); process.exit(1); }
  });
}
