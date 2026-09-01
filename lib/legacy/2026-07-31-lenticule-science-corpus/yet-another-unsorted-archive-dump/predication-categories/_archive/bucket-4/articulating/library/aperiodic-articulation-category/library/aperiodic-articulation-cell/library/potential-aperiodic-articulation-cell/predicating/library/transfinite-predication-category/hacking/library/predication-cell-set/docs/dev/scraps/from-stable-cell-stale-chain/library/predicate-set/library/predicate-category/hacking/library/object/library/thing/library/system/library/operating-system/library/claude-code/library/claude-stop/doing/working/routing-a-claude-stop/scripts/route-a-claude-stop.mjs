#!/usr/bin/env node

import { readFileSync, existsSync } from 'node:fs';
import { resolve } from 'node:path';

const BLOCK_REASON = [
  "End-of-turn diary entry has not been written for this turn.",
  "Before stopping, call the `mcp__561__writing-a-diary-entry` tool with:",
  "  - `character`: \"the 561 Group's computer\"",
  "  - `retrospective`: a backward-looking paragraph (\"this turn I did X but looking back I could have done Y\"),",
  "  - `prospective`: a forward-facing paragraph (\"when you do X, you should Y\").",
  "Keep each half to a few sentences, specific to this turn — not a session summary.",
  "The tool appends two EAVT rows to the session's diary log at",
  "doing/working/hacking/doing/working/logging/journaling/library/diary/library/<YYYY-MM-DD>-<session-id>/<same>.jsonl.",
  "After it returns, end the turn normally.",
].join('\n');

const DIARY_BASE = 'doing/working/hacking/doing/working/logging/journaling/library/diary/library';

function readStdin() {
  return new Promise((resolveStdin) => {
    let data = '';
    process.stdin.setEncoding('utf8');
    process.stdin.on('data', (chunk) => { data += chunk; });
    process.stdin.on('end', () => resolveStdin(data));
  });
}

function findLastUserPromptTs(transcriptPath) {
  const text = readFileSync(transcriptPath, 'utf8');
  const lines = text.split('\n');
  for (let i = lines.length - 1; i >= 0; i--) {
    const line = lines[i];
    if (!line) continue;
    let entry;
    try { entry = JSON.parse(line); } catch { continue; }
    if (entry?.type !== 'user') continue;
    if (typeof entry?.message?.content !== 'string') continue;
    if (!entry.timestamp) continue;
    const t = Date.parse(entry.timestamp);
    if (Number.isNaN(t)) continue;
    return t;
  }
  return null;
}

function localTodayString(now) {
  const y = now.getFullYear();
  const m = String(now.getMonth() + 1).padStart(2, '0');
  const d = String(now.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}

function latestDiaryEntryTs(diaryPath) {
  if (!existsSync(diaryPath)) return null;
  const text = readFileSync(diaryPath, 'utf8');
  let latest = null;
  for (const line of text.split('\n')) {
    if (!line.trim()) continue;
    let row;
    try { row = JSON.parse(line); } catch { continue; }
    if (typeof row?.t !== 'string') continue;
    const t = Date.parse(row.t);
    if (Number.isNaN(t)) continue;
    if (latest === null || t > latest) latest = t;
  }
  return latest;
}

async function main() {
  let input;
  try {
    const raw = await readStdin();
    input = raw ? JSON.parse(raw) : {};
  } catch (err) {
    process.stderr.write(`[routing-a-claude-stop] stdin parse failed: ${err.message}\n`);
    process.exit(0);
  }

  if (input.stop_hook_active) process.exit(0);

  const transcriptPath = input.transcript_path;
  if (!transcriptPath || !existsSync(transcriptPath)) process.exit(0);

  let userPromptTs;
  try {
    userPromptTs = findLastUserPromptTs(transcriptPath);
  } catch (err) {
    process.stderr.write(`[routing-a-claude-stop] transcript read failed: ${err.message}\n`);
    process.exit(0);
  }
  if (userPromptTs === null) process.exit(0);

  const repoRoot = resolve(process.cwd());
  const todayStr = localTodayString(new Date());
  const sessionId = input.session_id || process.env.CLAUDE_SESSION_ID;

  // The current session's per-session jsonl is the sole lawful diary file
  // for the check. Without a session-id the check is silently permissive.
  const candidates = [];
  if (sessionId) {
    const slug = `${todayStr}-${sessionId}`;
    candidates.push(resolve(repoRoot, DIARY_BASE, slug, `${slug}.jsonl`));
  } else {
    process.exit(0);
  }

  let diaryTs = null;
  for (const p of candidates) {
    let t;
    try { t = latestDiaryEntryTs(p); }
    catch (err) {
      process.stderr.write(`[routing-a-claude-stop] diary read failed at ${p}: ${err.message}\n`);
      continue;
    }
    if (t !== null && (diaryTs === null || t > diaryTs)) diaryTs = t;
  }

  if (diaryTs !== null && diaryTs > userPromptTs) process.exit(0);

  process.stdout.write(JSON.stringify({ decision: 'block', reason: BLOCK_REASON }));
  process.exit(0);
}

main();
