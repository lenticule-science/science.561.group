#!/usr/bin/env node
export const hookConfig = { trigger: 'PreToolUse', matcher: '.*' };

import { readdirSync, readFileSync, existsSync, statSync } from 'node:fs';
import { join, dirname, resolve, relative, sep } from 'node:path';
import { fileURLToPath } from 'node:url';

const chunks = [];
for await (const chunk of process.stdin) chunks.push(chunk);
const raw = Buffer.concat(chunks).toString('utf8');

let input;
try { input = JSON.parse(raw); } catch { process.exit(0); }

const toolName = input?.tool_name;
if (!toolName) process.exit(0);

const filePath = input?.tool_input?.file_path
  ?? input?.tool_input?.path
  ?? input?.tool_input?.notebook_path;

const __dirname = dirname(fileURLToPath(import.meta.url));
const skillsDir = resolve(__dirname, '..', '..');
const theoryRoot = resolve(skillsDir, '..', '..');

function parseIndexFm(content) {
  const m = content.replace(/\r\n/g, '\n').match(/^---\n([\s\S]*?)\n---/);
  if (!m) return null;
  const lines = m[1].split('\n');
  const result = {};
  let i = 0;
  const strip = s => s.trim().replace(/^["']|["']$/g, '');
  while (i < lines.length) {
    const line = lines[i];
    if (!line.trim()) { i++; continue; }
    const top = line.match(/^(\w[\w-]*):\s*(.*)$/);
    if (!top) { i++; continue; }
    const key = top[1];
    const val = top[2];
    if (val.trim() !== '') { result[key] = strip(val); i++; continue; }
    const items = [];
    let cur = null;
    i++;
    while (i < lines.length) {
      const sub = lines[i];
      if (!sub.trim()) { i++; continue; }
      const itemFirst = sub.match(/^\s*-\s+(\w[\w-]*):\s*(.*)$/);
      const prop = sub.match(/^\s{2,}(\w[\w-]*):\s*(.*)$/);
      if (itemFirst) {
        if (cur) items.push(cur);
        cur = {};
        cur[itemFirst[1]] = strip(itemFirst[2]);
        i++;
      } else if (prop && cur) {
        cur[prop[1]] = strip(prop[2]);
        i++;
      } else {
        break;
      }
    }
    if (cur) items.push(cur);
    result[key] = items;
  }
  return result;
}

function globToRegex(glob) {
  let re = '^';
  for (let k = 0; k < glob.length; k++) {
    const c = glob[k];
    if (c === '*' && glob[k + 1] === '*') { re += '.*'; k++; }
    else if (c === '*') re += '[^/]*';
    else if (c === '?') re += '[^/]';
    else if ('.+^$()|[]{}\\'.includes(c)) re += '\\' + c;
    else re += c;
  }
  return new RegExp(re + '$');
}

function matchesRule(rule, toolName, relPath) {
  if (rule.tool) {
    try { if (!new RegExp('^(' + rule.tool + ')$').test(toolName)) return false; }
    catch { return false; }
  }
  if (rule.path) {
    if (!relPath) return false;
    if (!globToRegex(rule.path).test(relPath)) return false;
  }
  return true;
}

const relPath = filePath
  ? relative(theoryRoot, resolve(filePath)).split(sep).join('/')
  : null;

const messages = [];
let skillNames;
try { skillNames = readdirSync(skillsDir).sort(); } catch { process.exit(0); }

for (const skillName of skillNames) {
  const indexPath = join(skillsDir, skillName, '_index.md');
  if (!existsSync(indexPath)) continue;
  let fm;
  try { fm = parseIndexFm(readFileSync(indexPath, 'utf8')); } catch { continue; }
  if (!fm || !Array.isArray(fm['suggests-for'])) continue;
  for (const rule of fm['suggests-for']) {
    if (!rule.say) continue;
    if (matchesRule(rule, toolName, relPath)) {
      messages.push(`- ${skillName}: ${rule.say}`);
      break;
    }
  }
}

if (messages.length === 0) process.exit(0);

const additionalContext = `Skill suggestions for this tool call:\n${messages.join('\n')}`;
process.stdout.write(JSON.stringify({
  hookSpecificOutput: { hookEventName: 'PreToolUse', additionalContext }
}));
process.exit(0);
