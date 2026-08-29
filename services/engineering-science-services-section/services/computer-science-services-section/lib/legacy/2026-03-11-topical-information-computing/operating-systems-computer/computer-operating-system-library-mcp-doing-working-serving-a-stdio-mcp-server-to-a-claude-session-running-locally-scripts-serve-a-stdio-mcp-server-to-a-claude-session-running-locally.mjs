#!/usr/bin/env node
// serve-a-stdio-mcp-server-to-a-claude-session-running-locally.mjs
//
// The 561 MCP stdio server. Reads the root `561.md` character surface, then
// exposes exactly its `skills:` generator set as MCP tools. Each skill
// resolves by globbing for a unique `*/<slug>/SKILL.md` surface under the
// repository root.

import { appendFileSync, mkdirSync, readFileSync, readdirSync, existsSync } from 'node:fs';
import { join, dirname, resolve } from 'node:path';
import { pathToFileURL, fileURLToPath } from 'node:url';
import Ajv2020 from 'ajv/dist/2020.js';
import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { StdioServerTransport } from '@modelcontextprotocol/sdk/server/stdio.js';
import { CallToolRequestSchema, ListToolsRequestSchema } from '@modelcontextprotocol/sdk/types.js';
import yaml from 'js-yaml';
import { buildSkillSurfaceMap } from '../../../../../../../../../../../../../../../../doing/working/hacking/doing/working/researching/locating/locating-skills/scripts/locate-skills.mjs';

const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;
const ajv = new Ajv2020({ allErrors: true, strict: false });

function parseFrontmatter(text) {
  const m = text.match(FRONTMATTER_RE);
  return m ? (yaml.load(m[1]) ?? {}) : {};
}

function stripFrontmatter(text) {
  return text.replace(FRONTMATTER_RE, '').trim();
}

function summarizeResult(result) {
  const text = typeof result === 'string' ? result : JSON.stringify(result);
  if (text.length <= 500) return text;
  return `${text.slice(0, 497)}...`;
}

function appendToolUseWitness({ tool, args, result, error, durationMs }) {
  const ts = new Date().toISOString();
  const day = ts.slice(0, 10);
  const dir = join(repoRoot, 'code', 'logs', 'tool-uses');
  mkdirSync(dir, { recursive: true });
  const row = {
    ts,
    character: characterName,
    tool,
    args,
    result_summary: error ? error.message : summarizeResult(result),
    duration_ms: durationMs,
    ok: !error,
  };
  appendFileSync(join(dir, `${day}.jsonl`), JSON.stringify(row) + '\n');
}

// This script sits 16 levels deep under the repo root:
// library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/mcp/doing/working/serving-a-stdio-mcp-server-to-a-claude-session-running-locally/scripts/
const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../../../../../../../../../../../../../../../..');

const characterPath = join(repoRoot, '561.md');
if (!existsSync(characterPath)) {
  console.error(`[serve] character record not found at ${characterPath}`);
  process.exit(2);
}
const characterFm = parseFrontmatter(readFileSync(characterPath, 'utf8'));
const characterName = characterFm.name ?? '561';
const skillSlugs = Array.isArray(characterFm.skills) ? characterFm.skills : null;
if (!skillSlugs) {
  console.error(`[serve] character ${characterName} has no skills: array in frontmatter`);
  process.exit(2);
}

const SESSION_ID = `${characterName}-${new Date().toISOString().replace(/[:.]/g, '-').toLowerCase()}`;
console.error(`[serve] character "${characterName}" — generator set has ${skillSlugs.length} skill(s); session-id ${SESSION_ID}`);

const skillSurfaces = skillSlugs.length === 0 ? new Map() : buildSkillSurfaceMap(repoRoot);

function resolveSkillDir(slug) {
  const matches = skillSurfaces.get(slug) ?? [];
  if (matches.length === 0) throw new Error(`no */${slug}/SKILL.md found under ${repoRoot}`);
  if (matches.length > 1) throw new Error(`multiple */${slug}/SKILL.md matches:\n${matches.join('\n')}`);
  return matches[0];
}

const tools = [];
for (const slug of skillSlugs) {
  const slugStr = typeof slug === 'string' ? slug : slug?.skill;
  if (typeof slugStr !== 'string' || slugStr.length === 0) {
    console.error(`[serve] skill entry malformed: ${JSON.stringify(slug)}; skipping`);
    continue;
  }
  let dir;
  try {
    dir = resolveSkillDir(slugStr);
  } catch (err) {
    console.error(`[serve] skill "${slugStr}": ${err.message}`);
    process.exit(2);
  }
  const skillMdPath = join(dir, 'SKILL.md');
  const skillMd = readFileSync(skillMdPath, 'utf8');
  const fm = parseFrontmatter(skillMd);
  if (typeof fm.description !== 'string' || fm.description.length === 0) {
    console.error(`[serve] skill "${slugStr}": SKILL.md has no description`);
    process.exit(2);
  }
  const scriptsDir = join(dir, 'scripts');
  if (!existsSync(scriptsDir)) {
    console.error(`[serve] skill "${slugStr}": no scripts/ dir; registering manual SKILL.md procedure`);
    tools.push({
      name: slugStr,
      description: fm.description,
      inputSchema: { type: 'object' },
      runFn: async () => stripFrontmatter(skillMd),
    });
    continue;
  }
  const mjs = readdirSync(scriptsDir).filter(f => f.endsWith('.mjs') && !f.startsWith('_'));
  if (mjs.length !== 1) {
    console.error(`[serve] skill "${slugStr}": scripts/ has ${mjs.length} non-helper .mjs files; registering manual SKILL.md procedure`);
    tools.push({
      name: slugStr,
      description: fm.description,
      inputSchema: { type: 'object' },
      runFn: async () => stripFrontmatter(skillMd),
    });
    continue;
  }
  const runPath = join(scriptsDir, mjs[0]);
  tools.push({
    name: slugStr,
    description: fm.description,
    inputSchema: { type: 'object' },
    runFn: async (args) => {
      const mod = await import(pathToFileURL(runPath).href);
      if (typeof mod.default !== 'function') {
        throw new Error(`${runPath} does not default-export a function`);
      }
      return mod.default(args);
    },
  });
}
console.error(`[serve] registered ${tools.length}/${skillSlugs.length} skill(s) as MCP tools`);

const server = new Server({ name: '561', version: '0.0.1' }, { capabilities: { tools: {} } });
server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: tools.map(t => ({ name: t.name, description: t.description, inputSchema: t.inputSchema })),
}));
server.setRequestHandler(CallToolRequestSchema, async (req) => {
  const tool = tools.find(t => t.name === req.params.name);
  if (!tool) throw new Error(`tool not found: ${req.params.name}`);
  const args = req.params.arguments ?? {};
  const start = Date.now();
  try {
    const result = await tool.runFn(args);
    appendToolUseWitness({ tool: tool.name, args, result, durationMs: Date.now() - start });
    return { content: [{ type: 'text', text: typeof result === 'string' ? result : JSON.stringify(result) }] };
  } catch (error) {
    appendToolUseWitness({ tool: tool.name, args, error, durationMs: Date.now() - start });
    throw error;
  }
});

const transport = new StdioServerTransport();
await server.connect(transport);
