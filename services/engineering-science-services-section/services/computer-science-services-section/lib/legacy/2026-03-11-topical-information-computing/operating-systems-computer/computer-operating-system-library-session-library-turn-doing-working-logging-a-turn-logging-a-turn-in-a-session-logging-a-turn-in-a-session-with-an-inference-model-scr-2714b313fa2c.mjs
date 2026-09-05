// log-a-turn-in-a-session-with-an-inference-model.mjs
//
// Leaf of the logging specialization chain realized as a Node ESM module.
//
// Transformer contract (per the leaf's schema):
//   input  = { session-id, inference-model, turn }
//   output = { appended: boolean, row?: {e,a,v,t}, error?: string }
//
// The turn is validated against library/turn/turn.schema.json before append.
// The target jsonl is realizing-a-turn-in-a-session-with-an-inference-model/library/<session-id>/<session-id>.jsonl.
// If the session directory does not exist it is created with the recursive-template identity files.
//
// Usage:
//   import logATurnInASessionWithAnInferenceModel from './log-a-turn-in-a-session-with-an-inference-model.mjs';
//   const out = logATurnInASessionWithAnInferenceModel({ 'session-id', 'inference-model', turn });
//
// CLI:
//   node log-a-turn-in-a-session-with-an-inference-model.mjs <session-id> <inference-model> <turn-json>
//   or pipe a JSON object {session-id, inference-model, turn} on stdin.

import { appendFileSync, existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import Ajv2020 from 'ajv/dist/2020.js';
import addFormats from 'ajv-formats';

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
// scripts → leaf → in-a-session → a-turn → logging → working → doing → repo-root  (7 levels)
const REPO_ROOT = resolve(SCRIPT_DIR, '..', '..', '..', '..', '..', '..', '..');

const REALIZING_LEAF_REL = 'doing/working/hacking/doing/working/realizing/realizing-a-turn/realizing-a-turn-in-a-session/realizing-a-turn-in-a-session-with-an-inference-model';
const REALIZING_TRANSFORMER_SLUG = 'realizing-a-turn-in-a-session-with-an-inference-model';

const NAME_PATTERN = /^[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;

let _validateTurn = null;
function getTurnValidator() {
  if (_validateTurn) return _validateTurn;
  const ajv = new Ajv2020.default({ allErrors: true, strict: false });
  addFormats.default(ajv);
  // Register every schema we $ref against, by $id.
  for (const rel of [
    'library/name/name.schema.json',
    'library/object/object.schema.json',
    'library/thing/thing.schema.json',
    'library/turn/turn.schema.json',
  ]) {
    const schema = JSON.parse(readFileSync(join(REPO_ROOT, rel), 'utf8'));
    ajv.addSchema(schema);
  }
  const turnSchema = JSON.parse(readFileSync(join(REPO_ROOT, 'library/turn/turn.schema.json'), 'utf8'));
  _validateTurn = ajv.compile(turnSchema);
  return _validateTurn;
}

function formatAjvErrors(errors) {
  if (!Array.isArray(errors) || errors.length === 0) return 'schema violation (no error detail)';
  return errors.map(e => `${e.instancePath || '(root)'} ${e.message}`).join('; ');
}

function ensureSessionDirectory(sessionId) {
  const sessionDir = join(REPO_ROOT, REALIZING_LEAF_REL, 'library', sessionId);
  if (existsSync(sessionDir)) return sessionDir;
  mkdirSync(sessionDir, { recursive: true });

  const indexBody = `---
name: ${sessionId}
description: Per-session directory minted at session open. Carries this session's EAVT log.
contains:
  - ${sessionId}.md
  - ${sessionId}.schema.json
  - ${sessionId}.jsonl
---

This directory carries the session-instance \`${sessionId}\`. Its EAVT log is [${sessionId}.jsonl](${sessionId}.jsonl); each row records one turn realized in this session.
`;
  const entityBody = `---
name: ${sessionId}
specializing: session
opened-at: ${new Date().toISOString()}
---

A session-instance of [session](../../../../../../library/session/session.md). Turn-records accumulate as EAVT rows in [${sessionId}.jsonl](${sessionId}.jsonl).
`;
  const schemaBody = JSON.stringify({
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$id": `https://561.group/doing/working/realizing/realizing-a-turn/realizing-a-turn-in-a-session/realizing-a-turn-in-a-session-with-an-inference-model/library/${sessionId}/${sessionId}.schema.json`,
    "title": `Session-instance ${sessionId}`,
    "description": `JSON Schema for the session-instance ${sessionId}. Specializes session via allOf with no additional cells; identity is the session-id.`,
    "allOf": [{ "$ref": "https://research-notes.561.group/hacking/library/predication-notes/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/session/session.schema.json" }],
    "type": "object"
  }, null, 2) + '\n';

  writeFileSync(join(sessionDir, '_index.md'), indexBody);
  writeFileSync(join(sessionDir, `${sessionId}.md`), entityBody);
  writeFileSync(join(sessionDir, `${sessionId}.schema.json`), schemaBody);
  writeFileSync(join(sessionDir, `${sessionId}.jsonl`), '');
  return sessionDir;
}

export default function logATurnInASessionWithAnInferenceModel(input) {
  if (!input || typeof input !== 'object') {
    return { appended: false, error: 'input must be an object' };
  }
  const sessionId = input['session-id'];
  const inferenceModel = input['inference-model'];
  const turn = input.turn;

  if (typeof sessionId !== 'string' || !NAME_PATTERN.test(sessionId)) {
    return { appended: false, error: `session-id "${sessionId}" does not match the name pattern` };
  }
  if (typeof inferenceModel !== 'string' || inferenceModel.length === 0) {
    return { appended: false, error: 'inference-model is required' };
  }
  if (!turn || typeof turn !== 'object') {
    return { appended: false, error: 'turn must be an object' };
  }

  const validateTurn = getTurnValidator();
  if (!validateTurn(turn)) {
    return { appended: false, error: `turn violates schema: ${formatAjvErrors(validateTurn.errors)}` };
  }

  const sessionDir = ensureSessionDirectory(sessionId);
  const targetJsonl = join(sessionDir, `${sessionId}.jsonl`);

  const row = {
    e: sessionId,
    a: REALIZING_TRANSFORMER_SLUG,
    v: turn,
    t: new Date().toISOString(),
  };
  appendFileSync(targetJsonl, JSON.stringify(row) + '\n');
  return { appended: true, row };
}

// CLI / stdin mode.
if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  const argv = process.argv.slice(2);
  let payload;
  if (argv.length >= 3) {
    try {
      payload = { 'session-id': argv[0], 'inference-model': argv[1], turn: JSON.parse(argv[2]) };
    } catch (err) {
      console.error(`bad turn JSON: ${err.message}`);
      process.exit(2);
    }
  } else {
    const chunks = [];
    for await (const chunk of process.stdin) chunks.push(chunk);
    const raw = Buffer.concat(chunks).toString('utf8');
    try {
      payload = JSON.parse(raw);
    } catch (err) {
      console.error(`bad stdin JSON: ${err.message}`);
      process.exit(2);
    }
  }
  const out = logATurnInASessionWithAnInferenceModel(payload);
  process.stdout.write(JSON.stringify(out) + '\n');
  process.exit(out.appended ? 0 : 1);
}
