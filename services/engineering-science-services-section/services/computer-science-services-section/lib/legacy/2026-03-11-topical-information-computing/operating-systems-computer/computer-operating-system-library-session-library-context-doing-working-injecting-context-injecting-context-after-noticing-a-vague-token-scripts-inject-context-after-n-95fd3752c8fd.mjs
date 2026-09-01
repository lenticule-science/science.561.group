#!/usr/bin/env node
// inject-context-after-noticing-a-vague-token.mjs
//
// Reads a Claude Code hook payload from stdin, extracts the text-to-scan
// based on --mode, notices vague-token surfaces against ./watchlist.json,
// retrieves nearby glossary descriptions, builds a context body, and
// delegates emission to the general injecting-context skill at
// doing/working/injecting-context/scripts/inject-context.mjs.
//
// Modes:
//   --mode=user-prompt-submit  scan the just-submitted user prompt
//   --mode=pre-tool-use        scan file content from a Write/Edit/MultiEdit call
//   --mode=stop                scan the assistant's last response in the transcript

import { readFileSync, existsSync, readdirSync, statSync } from 'node:fs';
import { resolve, dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { emitContextInjection } from '../../scripts/inject-context.mjs';

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
const SKILL_DIR = dirname(SCRIPT_DIR);
// scripts → leaf → injecting-context → injecting → working → doing → repo-root (6 levels)
const REPO_ROOT = resolve(SCRIPT_DIR, '..', '..', '..', '..', '..', '..');
const WATCHLIST_PATH = join(SKILL_DIR, 'watchlist.json');
const GLOSSARY_DIRS = [
  'code/structures',
  'code/transformers',
];
const LIBRARY_DIR = 'library';

const CONTEXT_WINDOW_CHARS = 400;
const SURROUNDING_CHARS = 200;
const MAX_FLAGS_REPORTED = 8;
const MAX_NEARBY_TERMS = 6;

function parseArgs(argv) {
  const out = { mode: null };
  for (const a of argv.slice(2)) {
    if (a.startsWith('--mode=')) out.mode = a.slice('--mode='.length);
  }
  return out;
}

function readStdin() {
  return new Promise((res) => {
    let buf = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => { buf += chunk; });
    process.stdin.on('end', () => res(buf));
  });
}

function loadWatchlist() {
  const raw = readFileSync(WATCHLIST_PATH, 'utf8');
  return JSON.parse(raw);
}

function loadGlossaryStems() {
  // Map slug -> { path, description }. Description comes from frontmatter
  // `description:` line when present; falls back to '(no description)'.
  const stems = new Map();
  const addFile = (dir, entry) => {
    if (!entry.endsWith('.md')) return;
    if (entry === '_index.md' || entry === 'SKILL.md') return;
    const stem = entry.slice(0, -3);
    if (stems.has(stem)) return;
    const filePath = join(REPO_ROOT, dir, entry);
    try {
      const head = readFileSync(filePath, 'utf8').split('\n').slice(0, 60).join('\n');
      const m = head.match(/^description:\s*"?([^"\n]+)"?$/m);
      const description = m ? m[1].trim() : '(no description)';
      stems.set(stem, { path: `${dir}/${entry}`, description });
    } catch { /* skip unreadable */ }
  };
  for (const dir of GLOSSARY_DIRS) {
    const abs = join(REPO_ROOT, dir);
    if (!existsSync(abs)) continue;
    for (const e of readdirSync(abs)) addFile(dir, e);
  }
  // Library tree: walk one level deep for [$structure]/[$structure].md
  const libAbs = join(REPO_ROOT, LIBRARY_DIR);
  if (existsSync(libAbs)) {
    for (const sub of readdirSync(libAbs)) {
      const subAbs = join(libAbs, sub);
      try { if (!statSync(subAbs).isDirectory()) continue; } catch { continue; }
      const candidate = `${sub}.md`;
      const filePath = join(subAbs, candidate);
      if (!existsSync(filePath)) continue;
      try {
        const head = readFileSync(filePath, 'utf8').split('\n').slice(0, 60).join('\n');
        const m = head.match(/^description:\s*"?([^"\n]+)"?$/m);
        const description = m ? m[1].trim() : '(no description)';
        if (!stems.has(sub)) stems.set(sub, { path: `${LIBRARY_DIR}/${sub}/${candidate}`, description });
      } catch { /* skip */ }
    }
  }
  return stems;
}

function tokenRegex(token) {
  const esc = token.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  return new RegExp(`\\b${esc}\\b`, 'gi');
}

function surroundingWindow(text, start, end) {
  const lo = Math.max(0, start - SURROUNDING_CHARS);
  const hi = Math.min(text.length, end + SURROUNDING_CHARS);
  return text.slice(lo, hi);
}

function sentenceContaining(text, idx) {
  const before = text.slice(0, idx).split(/[.\n!?]\s+/).pop() ?? '';
  const after = text.slice(idx).split(/[.\n!?](?:\s+|$)/).shift() ?? '';
  return (before + after).trim();
}

function isExempt(window, exemptCues) {
  if (!exemptCues || exemptCues.length === 0) return false;
  const lower = window.toLowerCase();
  return exemptCues.some((cue) => lower.includes(cue.toLowerCase()));
}

function findNearbyTerms(window, stems) {
  const found = [];
  const seen = new Set();
  for (const [slug, info] of stems) {
    if (seen.has(slug)) continue;
    const re = new RegExp(`\\b${slug.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}\\b`, 'i');
    if (re.test(window)) {
      found.push({ slug, ...info });
      seen.add(slug);
      if (found.length >= MAX_NEARBY_TERMS) break;
    }
  }
  return found;
}

function detect(text, watchlist, stems) {
  const flags = [];
  if (!text || typeof text !== 'string') return flags;
  const seen = new Set();
  for (const trig of watchlist.triggers ?? []) {
    const re = tokenRegex(trig.token);
    let m;
    while ((m = re.exec(text)) !== null) {
      const idx = m.index;
      const end = idx + m[0].length;
      const window = surroundingWindow(text, idx, end);
      if (isExempt(window, trig.exemptCues)) continue;
      const key = `${trig.token}::${idx}`;
      if (seen.has(key)) continue;
      seen.add(key);
      const sentence = sentenceContaining(text, idx);
      const nearby = findNearbyTerms(window, stems);
      flags.push({ kind: 'token', token: trig.token, reason: trig.reason, sentence, nearby });
      if (flags.length >= MAX_FLAGS_REPORTED) return flags;
    }
  }
  for (const pat of watchlist.hedgePatterns ?? []) {
    const re = new RegExp(pat.pattern, 'gi');
    let m;
    while ((m = re.exec(text)) !== null) {
      const idx = m.index;
      const end = idx + m[0].length;
      const window = surroundingWindow(text, idx, end);
      const sentence = sentenceContaining(text, idx);
      const nearby = findNearbyTerms(window, stems);
      flags.push({ kind: 'hedge', token: m[0], reason: pat.reason, sentence, nearby });
      if (flags.length >= MAX_FLAGS_REPORTED) return flags;
    }
  }
  return flags;
}

function formatReminder(flags) {
  const header = `FLAG: ${flags.length} vague-token use(s) detected. These are red flags for an AI-stretch — using a generic word because precise context is missing. Each is an opportunity to commit to a precise term, not a substitution chance.`;
  const items = flags.map((f, i) => {
    const head = f.kind === 'hedge'
      ? `(${i + 1}) Hedge phrase "${f.token}" in: "${truncate(f.sentence, 200)}"`
      : `(${i + 1}) Token "${f.token}" in: "${truncate(f.sentence, 200)}"`;
    const reason = `    why-flagged: ${f.reason}`;
    let near = '    precise vocabulary nearby:';
    if (f.nearby.length === 0) {
      near += ' (no glossary terms found in the surrounding paragraph; the surrounding text itself lacks specificity — write specifically about what is at this location, or remove the claim)';
    } else {
      near += '\n' + f.nearby.map((n) => `      - ${n.slug}: ${truncate(n.description, 160)}`).join('\n');
    }
    return [head, reason, near].join('\n');
  }).join('\n\n');
  const footer = `Action: commit to one of the precise terms above (and use it consistently), or rewrite to drop the imprecise claim. Do NOT substitute another vague word — that is what this hook is here to interrupt.`;
  return `${header}\n\n${items}\n\n${footer}`;
}

function truncate(s, n) {
  if (!s) return '';
  return s.length <= n ? s : s.slice(0, n - 1) + '…';
}

function extractTextForMode(mode, payload) {
  if (mode === 'user-prompt-submit') {
    return payload?.prompt ?? payload?.user_prompt ?? '';
  }
  if (mode === 'pre-tool-use') {
    const ti = payload?.tool_input ?? {};
    if (typeof ti.content === 'string') return ti.content;
    if (typeof ti.new_string === 'string') return ti.new_string;
    if (Array.isArray(ti.edits)) {
      return ti.edits.map((e) => e?.new_string ?? '').join('\n');
    }
    return '';
  }
  if (mode === 'stop') {
    const tp = payload?.transcript_path;
    if (!tp || !existsSync(tp)) return '';
    try {
      const lines = readFileSync(tp, 'utf8').split('\n');
      for (let i = lines.length - 1; i >= 0; i--) {
        if (!lines[i]) continue;
        let entry;
        try { entry = JSON.parse(lines[i]); } catch { continue; }
        if (entry?.type !== 'assistant') continue;
        const content = entry?.message?.content;
        if (Array.isArray(content)) {
          const texts = content.filter((c) => c?.type === 'text').map((c) => c.text ?? '');
          if (texts.length) return texts.join('\n');
        } else if (typeof content === 'string') {
          return content;
        }
      }
    } catch { /* fall through */ }
    return '';
  }
  return '';
}

async function main() {
  const { mode } = parseArgs(process.argv);
  if (!mode || !['user-prompt-submit', 'pre-tool-use', 'stop'].includes(mode)) {
    process.stderr.write('[inject-context-on-a-vague-token] --mode required: user-prompt-submit | pre-tool-use | stop\n');
    process.exit(0);
  }

  let payload = {};
  try {
    const raw = await readStdin();
    if (raw && raw.trim()) payload = JSON.parse(raw);
  } catch (err) {
    process.stderr.write(`[inject-context-on-a-vague-token] stdin parse failed: ${err.message}\n`);
    process.exit(0);
  }

  if (mode === 'stop' && payload?.stop_hook_active) process.exit(0);

  const text = extractTextForMode(mode, payload);
  if (!text) process.exit(0);

  // Skip writes targeting this skill's own files, the library/token/vague-token
  // structure records, and the watchlist — all of them name the trigger tokens
  // as the things being watched. Also skip the general injecting-context skill
  // for the same reason.
  if (mode === 'pre-tool-use') {
    const fp = payload?.tool_input?.file_path ?? '';
    if (fp.includes('/injecting-context-after-noticing-a-vague-token/')) process.exit(0);
    if (fp.includes('/injecting-context/')) process.exit(0);
    if (fp.includes('/library/token/library/vague-token/')) process.exit(0);
    if (fp.endsWith('/watchlist.json')) process.exit(0);
  }

  let watchlist, stems;
  try {
    watchlist = loadWatchlist();
    stems = loadGlossaryStems();
  } catch (err) {
    process.stderr.write(`[inject-context-after-noticing-a-vague-token] init failed: ${err.message}\n`);
    process.exit(0);
  }

  const flags = detect(text, watchlist, stems);
  if (flags.length === 0) process.exit(0);

  const reminder = formatReminder(flags);

  const modeToEvent = {
    'user-prompt-submit': 'UserPromptSubmit',
    'pre-tool-use': 'PreToolUse',
    'stop': 'Stop',
  };
  emitContextInjection({ body: reminder, hookEventName: modeToEvent[mode] });
  process.exit(0);
}

main();
