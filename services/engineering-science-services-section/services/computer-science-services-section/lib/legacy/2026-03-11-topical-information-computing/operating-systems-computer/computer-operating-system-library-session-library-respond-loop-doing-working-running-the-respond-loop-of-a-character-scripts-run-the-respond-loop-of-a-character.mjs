// Runs a character's respond loop. Tails code/queues/incoming-messages.jsonl,
// dispatches each new line as a work item through dispatching-work, writes
// response cells to disk, appends witnesses, loops until SIGINT.

import { readFileSync, writeFileSync, appendFileSync, existsSync, mkdirSync, statSync, openSync, closeSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'js-yaml';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');
const SKILL_DIR = join(REPO_ROOT, 'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/session/library/respond-loop/doing/working/running-the-respond-loop-of-a-character');
const QUEUE_PATH = join(SKILL_DIR, 'incoming-messages.jsonl');
const ITERATIONS_DIR = join(SKILL_DIR, 'iterations');
const TOOL_USES_DIR = join(SKILL_DIR, 'tool-uses');

const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;

function extractFrontmatter(text) {
  const m = text.match(FRONTMATTER_RE);
  if (!m) return {};
  return yaml.load(m[1]) ?? {};
}

function ensureDir(d) {
  if (!existsSync(d)) mkdirSync(d, { recursive: true });
}

function ensureFile(p) {
  ensureDir(dirname(p));
  if (!existsSync(p)) closeSync(openSync(p, 'a'));
}

function todayDate() {
  return new Date().toISOString().slice(0, 10);
}

async function readCursor(cursorPath) {
  if (!existsSync(cursorPath)) return 0;
  const v = parseInt(readFileSync(cursorPath, 'utf8').trim(), 10);
  return Number.isFinite(v) ? v : 0;
}

function writeCursor(cursorPath, offset) {
  writeFileSync(cursorPath, String(offset), 'utf8');
}

function readNewLines(queuePath, fromOffset) {
  const stats = statSync(queuePath);
  if (stats.size <= fromOffset) return { lines: [], nextOffset: fromOffset };
  const full = readFileSync(queuePath, 'utf8');
  const tail = full.slice(fromOffset);
  const lines = tail.split('\n').filter(l => l.length > 0);
  return { lines, nextOffset: stats.size };
}

function appendJsonl(path, obj) {
  ensureFile(path);
  appendFileSync(path, JSON.stringify(obj) + '\n', 'utf8');
}

function sleep(ms) {
  return new Promise(r => setTimeout(r, ms));
}

export default async function runTheRespondLoopOfACharacter({ character, tickMs = 1000 }) {
  if (typeof character !== 'string' || character.length === 0) {
    throw new Error('character (slug) is required');
  }

  // Verify the character record exists.
  const characterPath = join(REPO_ROOT, 'doing/governing/characters', character, `${character}.md`);
  if (!existsSync(characterPath)) {
    throw new Error(`character record not found at ${characterPath}`);
  }
  extractFrontmatter(readFileSync(characterPath, 'utf8'));

  // Set up the queue and the per-character cursor.
  ensureDir(dirname(QUEUE_PATH));
  ensureFile(QUEUE_PATH);
  const cursorPath = `${QUEUE_PATH}.${character}.cursor`;

  // Load the dispatch entry.
  const dispatcherUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work/doing/working/dispatching-work/scripts/dispatch-work.mjs')}`;
  const { default: dispatchWork } = await import(dispatcherUrl);

  let running = true;
  process.on('SIGINT', () => { running = false; });
  process.on('SIGTERM', () => { running = false; });

  const iterationsLog = join(ITERATIONS_DIR, `${todayDate()}.jsonl`);
  const toolUsesLog = join(TOOL_USES_DIR, `${todayDate()}.jsonl`);

  appendJsonl(iterationsLog, {
    ts: new Date().toISOString(),
    character,
    event: 'started',
    'tick-ms': tickMs,
    queue: QUEUE_PATH,
    cursor: cursorPath,
  });
  console.log(`respond loop running for character=${character}; tailing ${QUEUE_PATH}; cursor=${cursorPath}`);

  let iterationN = 0;
  while (running) {
    iterationN++;
    let offset = await readCursor(cursorPath);
    const { lines, nextOffset } = readNewLines(QUEUE_PATH, offset);
    if (lines.length === 0) {
      appendJsonl(iterationsLog, {
        ts: new Date().toISOString(),
        character,
        iteration: iterationN,
        event: 'tick',
        'new-messages': 0,
      });
    } else {
      for (const line of lines) {
        let workItem;
        try {
          workItem = JSON.parse(line);
        } catch (e) {
          appendJsonl(iterationsLog, {
            ts: new Date().toISOString(),
            character,
            iteration: iterationN,
            event: 'parse-error',
            line,
            error: e.message,
          });
          continue;
        }
        const startedAt = new Date().toISOString();
        try {
          const result = await dispatchWork({ workItem });
          appendJsonl(toolUsesLog, {
            ts: startedAt,
            character,
            tool: 'running-the-respond-loop-of-a-character',
            'work-item': workItem,
            result,
          });
          // If the result names a target and text, write the text to the target path.
          const target = workItem.target;
          const text = result && typeof result.text === 'string' ? result.text : null;
          if (target && text) {
            const absTarget = target.startsWith('/') ? target : join(REPO_ROOT, target);
            ensureDir(dirname(absTarget));
            writeFileSync(absTarget, text, 'utf8');
          }
          appendJsonl(iterationsLog, {
            ts: new Date().toISOString(),
            character,
            iteration: iterationN,
            event: 'dispatched',
            'work-item-kind': workItem.kind,
            'work-item-target': workItem.target,
            'matched-skill': result && result['matched-skill'] || null,
          });
        } catch (e) {
          appendJsonl(iterationsLog, {
            ts: new Date().toISOString(),
            character,
            iteration: iterationN,
            event: 'dispatch-error',
            'work-item': workItem,
            error: e.message,
          });
        }
      }
      writeCursor(cursorPath, nextOffset);
    }
    await sleep(tickMs);
  }

  appendJsonl(iterationsLog, {
    ts: new Date().toISOString(),
    character,
    event: 'stopped',
  });
  console.log(`respond loop halted for character=${character}; stop-witness appended.`);
  return { character, 'iterations-completed': iterationN };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const args = process.argv.slice(2);
  let character, tickMs;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--character') character = args[++i];
    else if (args[i] === '--tick-ms') tickMs = parseInt(args[++i], 10);
  }
  if (!character) {
    console.error('Usage: run-the-respond-loop-of-a-character.mjs --character <slug> [--tick-ms <n>]');
    process.exit(2);
  }
  runTheRespondLoopOfACharacter({ character, tickMs })
    .then(r => { console.log(JSON.stringify(r, null, 2)); })
    .catch(e => { console.error(e.message); process.exit(1); });
}
