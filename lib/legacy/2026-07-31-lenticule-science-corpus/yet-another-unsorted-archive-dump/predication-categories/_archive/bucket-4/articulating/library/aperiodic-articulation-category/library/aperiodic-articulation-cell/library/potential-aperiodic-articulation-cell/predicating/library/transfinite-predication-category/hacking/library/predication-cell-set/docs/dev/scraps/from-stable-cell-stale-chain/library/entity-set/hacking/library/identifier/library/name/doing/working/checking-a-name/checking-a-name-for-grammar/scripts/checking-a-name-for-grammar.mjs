// checking-a-name-for-grammar.mjs
//
// The transformer checking-a-name-for-grammar realized as a Node ESM module
// and invocable through Claude Code's PreToolUse hook protocol.
//
// Transformer contract (per checking-a-name-for-grammar.schema.json):
//   input  = { subject: <name>, predicate: <grammar> }
//   output = { conforms: boolean, diagnostics: [{clause, message}, ...] }
//
// Hook protocol wrapping (per Claude Code's PreToolUse spec):
//   stdin = { tool_name, tool_input: { file_path, ... } }
//   The script extracts a name from tool_input.file_path, treats the
//   project's name-grammar as the predicate (loaded from
//   library/grammar/grammar.md), calls the pure-function check, and emits
//   a hook protocol object on stdout that either permits or denies the
//   tool call. Library structures (name, grammar) and transformer
//   schemas (the parent checking + this leaf) are loaded by their $id so
//   $ref resolution works regardless of file-tree placement.

import { existsSync, readFileSync, readdirSync, statSync } from 'node:fs';
import { basename, dirname, resolve, sep } from 'node:path';
import { fileURLToPath } from 'node:url';
import Ajv2020 from 'ajv/dist/2020.js';

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
// scripts → leaf → checking-a-name → checking → working → doing → repo-root  (6 levels)
const REPO_ROOT = resolve(SCRIPT_DIR, '..', '..', '..', '..', '..', '..');

// Articles per the skill-name grammar at code/structures/skill-name.md.
const ARTICLES = new Set(['a', 'an', 'the']);

// Words that never need to resolve to a record — they classify position
// or stratify the recursive template rather than naming a $thing.
const STRUCTURAL_WORDS = new Set([
  'library', 'doing', 'working', 'governing', 'planning',
  'learning', 'teaching', 'introducing', 'explaining', 'guiding', 'referencing',
  'questioning', 'answering', 'surveying',
  'logging', 'exploring', 'running', 'triaging', 'slopping', 'hacking',
  'scripts', 'examples', 'templates', 'references',
  'endpoints', 'cone-pairs', 'runtime',
]);

// Filenames that are never themselves names of $things — consumer surfaces
// and packaging files exempted by real-world convention. SKILL.md is the
// Claude Code surface convention; the rest are the project's external-standard
// surface set.
const EXEMPT_FILENAMES = new Set([
  '_index.md', 'README.md', 'AGENTS.md', 'SOUL.md', 'MEMORY.md',
  'HEARTBEAT.md', 'DREAMS.md', 'TOOLS.md', 'USER.md', 'CLAUDE.md',
  'IDENTITY.md', 'SKILL.md',
  'Makefile', 'GNUmakefile', 'flake.nix', 'flake.lock', 'package.json',
  'package-lock.json', '.mcp.json', 'LICENSE', 'LICENSE.md', 'COPYING',
]);

// ---------------------------------------------------------------------------
// Schema registration. Load every schema we $ref against, register by $id.
// ---------------------------------------------------------------------------

function loadSchema(relPath) {
  return JSON.parse(readFileSync(resolve(REPO_ROOT, relPath), 'utf8'));
}

const ajv = new Ajv2020({ allErrors: true, strict: false });
// ajv.compile() registers its argument by $id as a side effect. Pre-register
// only the schemas referenced via $ref from the leaf, not the leaf itself.
for (const relPath of [
  'library/grammar/grammar.schema.json',
  'doing/working/hacking/doing/working/checking/checking.schema.json',
  'doing/working/hacking/doing/working/checking/checking-a-name/checking-a-name.schema.json',
]) {
  const schema = loadSchema(relPath);
  if (!ajv.getSchema(schema.$id)) ajv.addSchema(schema, schema.$id);
}
const nameSchema = loadSchema('library/name/name.schema.json');
const validateName = ajv.compile(nameSchema);
// The transformer's own schema describes the full envelope {input, output}
// as documentation of the contract; at call time the script constructs
// the input itself, so validate only the subject (the name) against the
// name schema. The predicate (the project's name-grammar) is loaded from
// disk by loadProjectGrammar() and trusted by construction.

// ---------------------------------------------------------------------------
// Resolution: given a token, does a transformer or structure record exist?
// ---------------------------------------------------------------------------

// Skip these top-level directories when walking the lawful tree.
const SKIP_TOP_LEVEL = new Set([
  'node_modules', '.git', '.claude', '.openclaw', '.codex', '.agents',
  'old-archive',
]);

// Cache the lawful-record index so repeated calls don't re-walk the tree.
let lawfulRecords = null;

function buildLawfulRecordIndex() {
  // A lawful $thing record is a directory <D> containing <D>/<D>.md.
  // Walk the repository (skipping out-of-scope top-level subdirs) and collect
  // a map from directory-name to a list of paths where a lawful record lives.
  const records = new Map();
  function walk(dir) {
    let entries;
    try { entries = readdirSync(dir, { withFileTypes: true }); } catch { return; }
    for (const entry of entries) {
      if (!entry.isDirectory()) continue;
      const name = entry.name;
      if (dir === REPO_ROOT && SKIP_TOP_LEVEL.has(name)) continue;
      const subDir = resolve(dir, name);
      const entityFile = resolve(subDir, `${name}.md`);
      if (existsSync(entityFile)) {
        const list = records.get(name) || [];
        list.push(entityFile);
        records.set(name, list);
      }
      walk(subDir);
    }
  }
  walk(REPO_ROOT);
  return records;
}

function recordsForName(token) {
  if (lawfulRecords === null) lawfulRecords = buildLawfulRecordIndex();
  return lawfulRecords.get(token) ?? [];
}

function isGerundForm(token) {
  // The grammar terminal for a gerund: ends in `-ing` or `-ing-<something>`.
  // The head of a gerund-form name is the longest `-ing`-terminated prefix.
  return /^[a-z0-9]+ing(?:-|$)/.test(token);
}

function gerundHeadOf(name) {
  // Per the skill-name spec, the gerund head is the first kebab-case
  // component of the slug, single English verb in -ing form. Phrasal verbs
  // are not admissible.
  const first = name.split('-')[0];
  return /[a-z0-9]ing$/.test(first) ? first : null;
}

// ---------------------------------------------------------------------------
// The pure transformer: name × grammar → check-decision
// ---------------------------------------------------------------------------

export default function checkingANameForGrammar({ subject, predicate }) {
  const diagnostics = [];

  // Clause 1: lexical conformance — kebab-case shape.
  if (!validateName(subject)) {
    diagnostics.push({
      clause: 'lexical-conformance',
      message: `name "${subject}" does not match the kebab-case pattern: ${ajv.errorsText(validateName.errors)}`,
    });
    return { conforms: false, diagnostics };
  }

  // Clause 2: resolution conformance — every parsed component resolves.
  const parts = subject.split('-');
  const head = parts[0];
  const isGerundHeaded = isGerundForm(subject);

  if (isGerundHeaded) {
    // Gerund-headed name: gerund (longest -ing prefix) + optional article + noun + modifiers.
    const gerund = gerundHeadOf(subject);
    if (!gerund) {
      diagnostics.push({
        clause: 'resolution-conformance',
        message: `name "${subject}" looks gerund-headed but no -ing prefix could be extracted`,
      });
    } else if (recordsForName(gerund).length === 0) {
      diagnostics.push({
        clause: 'resolution-conformance',
        message: `gerund head "${gerund}" does not resolve to any transformer record (no directory ${gerund}/${gerund}.md exists in the lawful tree)`,
      });
    }
    let tail = subject.slice(gerund ? gerund.length + 1 : head.length + 1).split('-');
    if (tail.length > 0 && ARTICLES.has(tail[0])) tail = tail.slice(1);
    if (tail.length > 0 && tail[0] !== '') {
      // The noun is the longest tail-prefix that resolves; remaining components are modifiers.
      let resolved = null;
      for (let len = tail.length; len > 0; len--) {
        const candidate = tail.slice(0, len).join('-');
        if (recordsForName(candidate).length > 0 || STRUCTURAL_WORDS.has(candidate)) {
          resolved = { noun: candidate, modifiers: tail.slice(len) };
          break;
        }
      }
      if (!resolved) {
        diagnostics.push({
          clause: 'resolution-conformance',
          message: `noun tail "${tail.join('-')}" does not resolve to any structure record (no library/<noun>/<noun>.md exists for any prefix)`,
        });
      } else {
        for (const modifier of resolved.modifiers) {
          if (STRUCTURAL_WORDS.has(modifier)) continue;
          if (recordsForName(modifier).length === 0) {
            diagnostics.push({
              clause: 'resolution-conformance',
              message: `modifier "${modifier}" does not resolve to any structure or concept record`,
            });
          }
        }
      }
    }
  } else {
    // Structure-form name: noun + optional modifiers, with the whole name resolving.
    if (recordsForName(subject).length === 0 && !STRUCTURAL_WORDS.has(subject)) {
      // Try partial: longest-prefix noun + remaining modifiers.
      let resolved = false;
      for (let len = parts.length - 1; len > 0; len--) {
        const candidate = parts.slice(0, len).join('-');
        if (recordsForName(candidate).length > 0) {
          resolved = true;
          for (const modifier of parts.slice(len)) {
            if (STRUCTURAL_WORDS.has(modifier)) continue;
            if (recordsForName(modifier).length === 0) {
              diagnostics.push({
                clause: 'resolution-conformance',
                message: `modifier "${modifier}" does not resolve to any structure or concept record`,
              });
            }
          }
          break;
        }
      }
      if (!resolved) {
        diagnostics.push({
          clause: 'resolution-conformance',
          message: `structure name "${subject}" does not resolve to any structure record (no library/<noun>/<noun>.md exists)`,
        });
      }
    }
  }

  return { conforms: diagnostics.length === 0, diagnostics };
}

// ---------------------------------------------------------------------------
// Hook-protocol wrapper: extract a name from the PreToolUse payload, call
// the pure transformer, emit the hook protocol response.
// ---------------------------------------------------------------------------

function extractNameFromFilePath(filePath) {
  if (typeof filePath !== 'string' || !filePath) return null;
  const rel = filePath.startsWith(REPO_ROOT) ? filePath.slice(REPO_ROOT.length + 1) : filePath;
  const segments = rel.split(sep).filter(Boolean);
  if (segments.length === 0) return null;
  const last = segments[segments.length - 1];
  if (EXEMPT_FILENAMES.has(last)) return null;
  // For a directory <D>/<D>.md or a structure record <D>.md, the name is the stem.
  if (last.endsWith('.md')) return last.slice(0, -3);
  // For a directory itself being created (rare via Write), the basename is the name.
  if (!last.includes('.')) return last;
  // Files with extensions other than .md aren't names directly; the parent directory is.
  return segments.length >= 2 ? segments[segments.length - 2] : null;
}

function loadProjectGrammar() {
  // The project's name-grammar at library/grammar/grammar.md is the
  // predicate this hook uses. The .md carries the human-readable rules;
  // the .schema.json carries the data shape. The script's behavior is
  // determined by the rules encoded in this script, anchored to those
  // records; expand here if the grammar is later promoted to data.
  return {
    variables: ['name', 'gerund-name', 'structure-name', 'gerund', 'noun', 'modifier', 'article'],
    terminals: ['kebab-segment', 'hyphen', '-ing-suffix'],
    productions: [
      { lhs: 'name', rhs: ['gerund-name', '|', 'structure-name'] },
      { lhs: 'gerund-name', rhs: ['gerund', '(article)?', 'noun', '(modifier)*'] },
      { lhs: 'structure-name', rhs: ['noun', '(modifier)*'] },
      { lhs: 'article', rhs: ['a', '|', 'an', '|', 'the'] },
    ],
    start: 'name',
    'resolution-rules': [
      { terminal: 'gerund', predicate: 'a directory <gerund>/<gerund>.md exists in the lawful tree' },
      { terminal: 'noun', predicate: 'a directory library/<noun>/<noun>.md exists' },
      { terminal: 'modifier', predicate: 'resolves as a structure or concept record' },
    ],
  };
}

function readStdin() {
  return new Promise((res) => {
    let buf = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => { buf += chunk; });
    process.stdin.on('end', () => res(buf));
  });
}

function isSelfRegistration(filePath, name) {
  // A write to <parent>/<name>/<name>.md or <parent>/<name>/<name>.schema.json
  // or <parent>/<name>/<name>.jsonl is the registration act for the name <name>.
  // The resolution check would tautologically fail (the file isn't on disk yet)
  // so we exempt these. Lexical conformance still applies.
  if (typeof filePath !== 'string') return false;
  const segments = filePath.split(sep).filter(Boolean);
  if (segments.length < 2) return false;
  const last = segments[segments.length - 1];
  const parent = segments[segments.length - 2];
  if (parent !== name) return false;
  return last === `${name}.md` || last === `${name}.schema.json` || last === `${name}.jsonl`;
}

// Instance-state and gitignored subtrees whose internal naming follows
// each tool's own convention, not the project's name-grammar.
const INSTANCE_STATE_PREFIXES = ['.claude/', '.openclaw/', '.codex/', '.agents/', '.git/', 'node_modules/', 'old-archive/'];
const INSTANCE_STATE_FILES = new Set(['.mcp.json']);

async function main() {
  let payload = {};
  try {
    const raw = await readStdin();
    if (raw && raw.trim()) payload = JSON.parse(raw);
  } catch { /* swallow; treat as non-blocking */ }

  const filePath = payload?.tool_input?.file_path;
  if (typeof filePath !== 'string') process.exit(0);

  const rel = filePath.startsWith(REPO_ROOT) ? filePath.slice(REPO_ROOT.length + 1) : filePath;
  if (INSTANCE_STATE_PREFIXES.some((p) => rel.startsWith(p))) process.exit(0);
  if (INSTANCE_STATE_FILES.has(rel)) process.exit(0);

  const name = extractNameFromFilePath(filePath);
  if (!name) process.exit(0);
  if (EXEMPT_FILENAMES.has(`${name}.md`)) process.exit(0);

  // Bootstrap exemption: a write of the entity record / schema / jsonl at the
  // canonical position <name>/<name>.* IS the registration of <name>. Check
  // lexical conformance only; the file doesn't exist yet, so the resolution
  // check would tautologically fail.
  if (isSelfRegistration(filePath, name)) {
    if (!validateName(name)) {
      const reason = [
        `Name-grammar conformance check failed for ${filePath}:`,
        `  name: "${name}"`,
        `  - [lexical-conformance] name does not match kebab-case pattern: ${ajv.errorsText(validateName.errors)}`,
      ].join('\n');
      process.stdout.write(JSON.stringify({
        hookSpecificOutput: {
          hookEventName: 'PreToolUse',
          permissionDecision: 'deny',
          permissionDecisionReason: reason,
        },
      }));
    }
    process.exit(0);
  }

  const input = { subject: name, predicate: loadProjectGrammar() };
  const decision = checkingANameForGrammar(input);
  if (decision.conforms) process.exit(0);

  const lines = [
    `Name-grammar conformance check failed for ${filePath}:`,
    `  name: "${name}"`,
    ...decision.diagnostics.map((d) => `  - [${d.clause}] ${d.message}`),
    'Fix the path so the name parses against the grammar and each component resolves.',
  ];
  process.stdout.write(JSON.stringify({
    hookSpecificOutput: {
      hookEventName: 'PreToolUse',
      permissionDecision: 'deny',
      permissionDecisionReason: lines.join('\n'),
    },
  }));
  process.exit(0);
}

if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  main();
}
