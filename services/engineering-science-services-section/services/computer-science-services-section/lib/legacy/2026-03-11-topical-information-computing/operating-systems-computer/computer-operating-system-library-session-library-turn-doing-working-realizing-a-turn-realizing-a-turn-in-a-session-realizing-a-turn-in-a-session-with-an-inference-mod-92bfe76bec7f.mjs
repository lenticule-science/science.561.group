// realize-a-turn-in-a-session-with-an-inference-model.mjs
//
// Leaf of the realizing specialization chain realized as a Node ESM module.
// Dispatches the logging leaf to append the turn-record to the session's jsonl.
//
// Transformer contract:
//   input  = { session-id, inference-model, turn }
//   output = { realized: boolean, row?: {e,a,v,t}, error?: string }

import { dirname, join, resolve } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
// scripts → leaf → in-a-session → a-turn → realizing → working → doing → repo-root
const REPO_ROOT = resolve(SCRIPT_DIR, '..', '..', '..', '..', '..', '..', '..');

const LOGGING_LEAF_SCRIPT = join(
  REPO_ROOT,
  'doing/working/hacking/doing/working/logging/logging-a-turn/logging-a-turn-in-a-session/logging-a-turn-in-a-session-with-an-inference-model/scripts/log-a-turn-in-a-session-with-an-inference-model.mjs',
);

let _logger = null;
async function getLogger() {
  if (_logger) return _logger;
  const mod = await import(pathToFileURL(LOGGING_LEAF_SCRIPT).href);
  _logger = mod.default;
  return _logger;
}

export default async function realizeATurnInASessionWithAnInferenceModel(input) {
  if (!input || typeof input !== 'object') {
    return { realized: false, error: 'input must be an object' };
  }
  const log = await getLogger();
  const logResult = log(input);
  if (!logResult.appended) {
    return { realized: false, error: logResult.error };
  }
  return { realized: true, row: logResult.row };
}

// CLI / stdin mode.
if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  const chunks = [];
  for await (const chunk of process.stdin) chunks.push(chunk);
  const raw = Buffer.concat(chunks).toString('utf8');
  let payload;
  try { payload = JSON.parse(raw); } catch (err) {
    console.error(`bad stdin JSON: ${err.message}`);
    process.exit(2);
  }
  const out = await realizeATurnInASessionWithAnInferenceModel(payload);
  process.stdout.write(JSON.stringify(out) + '\n');
  process.exit(out.realized ? 0 : 1);
}
