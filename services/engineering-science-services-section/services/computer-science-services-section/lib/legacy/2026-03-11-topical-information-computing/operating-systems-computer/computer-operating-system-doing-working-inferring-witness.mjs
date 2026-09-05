// Appends one dispatch-witness-record line per dispatch-layer hop to the
// inferring transformer's own cell log. Single point where the witness
// shape spec'd at code/structures/dispatch-witness-record.md is enforced.
// Validates the assembled witness against
// code/structures/dispatch-witness-record.schema.json before appending.
//
// Lives next to model records and adapters as a helper module imported by
// every dispatching-* script.

import { appendFileSync, mkdirSync, readFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import Ajv2020 from 'ajv/dist/2020.js';
import addFormats from 'ajv-formats';

const ALLOWED_OUTCOMES = new Set(['ok', 'error', 'forwarded']);

const __dirname = dirname(fileURLToPath(import.meta.url));
const SCHEMA_PATH = join(__dirname, '..', '..', '..', 'code/structures/dispatch-witness-record.schema.json');

let _validator = null;
function getValidator() {
  if (_validator) return _validator;
  const ajv = new Ajv2020.default({ allErrors: true, strict: false });
  addFormats.default(ajv);
  const schema = JSON.parse(readFileSync(SCHEMA_PATH, 'utf8'));
  _validator = ajv.compile(schema);
  return _validator;
}

export function appendDispatchWitness({
  repoRoot,
  skill,
  workItem,
  chosenReceiver,
  outcome,
  error,
  attempts,
  length,
}) {
  if (typeof repoRoot !== 'string' || repoRoot.length === 0) {
    throw new Error('appendDispatchWitness: repoRoot is required');
  }
  if (typeof skill !== 'string' || skill.length === 0) {
    throw new Error('appendDispatchWitness: skill is required');
  }
  if (!ALLOWED_OUTCOMES.has(outcome)) {
    throw new Error(`appendDispatchWitness: outcome must be one of ${[...ALLOWED_OUTCOMES].join(', ')}`);
  }
  if (outcome === 'error' && typeof error !== 'string') {
    throw new Error('appendDispatchWitness: error string required when outcome is error');
  }

  const ts = new Date().toISOString();
  const logDir = join(repoRoot, 'doing/working/inferring');
  mkdirSync(logDir, { recursive: true });
  // Dispatch-witness rows accumulate at the inferring transformer's own
  // cell log — separate from the turn logging path.
  const logPath = join(logDir, 'inferring.jsonl');

  const witness = {
    ts,
    skill,
    'workitem-skill': workItem?.skill ?? null,
    'workitem-kind': workItem?.kind ?? null,
    'chosen-receiver': chosenReceiver ?? null,
    outcome,
  };
  if (error) witness.error = error;
  if (Array.isArray(attempts) && attempts.length) witness.attempts = attempts;
  if (typeof length === 'number') witness.length = length;

  const validate = getValidator();
  if (!validate(witness)) {
    const errs = (validate.errors ?? []).map(e => `${e.instancePath} ${e.message}`).join('; ');
    throw new Error(`appendDispatchWitness: witness fails schema: ${errs}`);
  }

  appendFileSync(logPath, JSON.stringify(witness) + '\n');
}
