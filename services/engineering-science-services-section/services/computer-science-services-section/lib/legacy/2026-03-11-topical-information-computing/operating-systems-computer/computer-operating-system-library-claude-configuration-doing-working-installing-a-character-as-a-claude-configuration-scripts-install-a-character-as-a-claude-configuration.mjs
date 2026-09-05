// install-a-character-as-a-claude-configuration.mjs
//
// Installs a character as the root Claude Code configuration: writes
// .mcp.json, .claude/settings.json, CLAUDE.md, and copies the character's
// surface files (HEARTBEAT.md, MEMORY.md, etc.) to the repository root.

import { writeFileSync, readFileSync, existsSync, copyFileSync, mkdirSync } from 'node:fs';
import { join, resolve, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import nunjucks from 'nunjucks';
import yaml from 'js-yaml';
import locateSkillBySlug from '../../../../../../../../../../../../../../../../doing/working/hacking/doing/working/researching/locating/locating-skills/scripts/locate-skills.mjs';

const SERVE_PATH = 'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/mcp/doing/working/serving-a-stdio-mcp-server-to-a-claude-session-running-locally/scripts/serve-a-stdio-mcp-server-to-a-claude-session-running-locally.mjs';
const TEMPLATES_DIR = resolve(dirname(fileURLToPath(import.meta.url)), '..', 'templates');
const SURFACE_FILES = ['HEARTBEAT.md', 'MEMORY.md', 'SOUL.md', 'DREAMS.md', 'TOOLS.md', 'USER.md', 'AGENTS.md'];
const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;

const njk = nunjucks.configure(TEMPLATES_DIR, { autoescape: false, throwOnUndefined: false });

function parseFrontmatter(text) {
  const m = text.match(FRONTMATTER_RE);
  return m ? (yaml.load(m[1]) ?? {}) : {};
}

function refuseIfInstalled(repoRoot) {
  const mcpPath = join(repoRoot, '.mcp.json');
  if (existsSync(mcpPath)) {
    throw new Error(
      `refusing to install: ${mcpPath} already exists. ` +
      `Remove .mcp.json (and .claude/settings.json, if present) before installing another character.`
    );
  }
}

function characterDir(repoRoot, name) {
  return join(repoRoot, 'doing/working/hacking/library/characters', name);
}

function loadCharacter(repoRoot, name) {
  const dir = characterDir(repoRoot, name);
  const path = join(dir, `${name}.md`);
  if (!existsSync(path)) throw new Error(`character record not found at ${path}`);
  const fm = parseFrontmatter(readFileSync(path, 'utf8'));
  if (!Array.isArray(fm.skills) || fm.skills.length === 0) {
    throw new Error(`character ${name} has no skills: array in frontmatter`);
  }
  return { dir, name, description: fm.description ?? '', skills: fm.skills };
}

function loadSkillHooks(dir) {
  const indexPath = join(dir, '_index.md');
  if (!existsSync(indexPath)) return [];
  const fm = parseFrontmatter(readFileSync(indexPath, 'utf8'));
  if (!Array.isArray(fm.hooks)) return [];
  return fm.hooks.map(h => ({
    event: h.event,
    command: h.command,
    matcher: h.matcher ?? null,
  }));
}

function writeMcpJson(repoRoot) {
  const config = {
    mcpServers: {
      '561': {
        command: 'node',
        args: [SERVE_PATH],
      },
    },
  };
  writeFileSync(join(repoRoot, '.mcp.json'), JSON.stringify(config, null, 2) + '\n');
}

function writeSettingsJson(repoRoot, hookDecls) {
  if (hookDecls.length === 0) return null;
  const byEvent = {};
  for (const h of hookDecls) {
    if (!byEvent[h.event]) byEvent[h.event] = [];
    const entry = { hooks: [{ type: 'command', command: h.command }] };
    if (h.matcher) entry.matcher = h.matcher;
    byEvent[h.event].push(entry);
  }
  const dir = join(repoRoot, '.claude');
  mkdirSync(dir, { recursive: true });
  const dest = join(dir, 'settings.json');
  writeFileSync(dest, JSON.stringify({ hooks: byEvent }, null, 2) + '\n');
  return dest;
}

function copySurfaceFiles(charDir, repoRoot) {
  const copied = [];
  for (const file of SURFACE_FILES) {
    const src = join(charDir, file);
    if (!existsSync(src)) continue;
    copyFileSync(src, join(repoRoot, file));
    copied.push(file);
  }
  return copied;
}

function writeClaudeMd(repoRoot, char, registered) {
  const generated = njk.render('character-claude-md.njk', {
    characterName: char.name,
    skills: registered.map(r => ({ name: r.name, description: r.description, defaultsList: '' })),
    discoveryErrors: [],
  });
  const charClaude = join(char.dir, 'CLAUDE.md');
  let prefix;
  if (existsSync(charClaude)) {
    prefix = readFileSync(charClaude, 'utf8').replace(/\n+$/, '');
  } else {
    prefix = njk.render('default-character-claude-md.njk', {
      characterName: char.name,
      description: char.description,
    }).replace(/\n+$/, '');
  }
  writeFileSync(join(repoRoot, 'CLAUDE.md'), prefix + '\n\n---\n\n' + generated + '\n');
}

export async function installCharacterConfig({ characterName, repoRoot }) {
  refuseIfInstalled(repoRoot);
  const char = loadCharacter(repoRoot, characterName);

  const registered = [];
  const errors = [];
  const hookDecls = [];
  for (const entry of char.skills) {
    const slug = typeof entry === 'string' ? entry : entry?.skill;
    if (typeof slug !== 'string') { errors.push({ name: String(entry), reason: 'malformed skill entry' }); continue; }
    const { dir, reason } = locateSkillBySlug(slug, repoRoot);
    if (!dir) { errors.push({ name: slug, reason }); continue; }
    const skillMdPath = join(dir, 'SKILL.md');
    const fm = parseFrontmatter(readFileSync(skillMdPath, 'utf8'));
    registered.push({ name: slug, description: fm.description ?? slug, dir });
    for (const h of loadSkillHooks(dir)) hookDecls.push({ ...h, fromSkill: slug });
  }

  writeMcpJson(repoRoot);
  const copiedSurface = copySurfaceFiles(char.dir, repoRoot);
  const settingsPath = writeSettingsJson(repoRoot, hookDecls);
  writeClaudeMd(repoRoot, char, registered);

  return {
    characterName,
    skills: registered.map(r => r.name),
    errors,
    copiedSurface,
    hookCount: hookDecls.length,
    settingsPath,
  };
}

export default async function installACharacterAsAClaudeConfiguration(args = {}) {
  const { character, repoRoot } = args;
  if (typeof character !== 'string' || character.trim().length === 0) {
    throw new Error('character: required non-empty string (bare slug or path to character dir)');
  }
  const root = repoRoot ?? process.cwd();
  return installCharacterConfig({ characterName: character, repoRoot: root });
}

if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  const arg = process.argv.find(a => a.startsWith('--character='));
  if (!arg) { console.error('Usage: install-a-character-as-a-claude-configuration.mjs --character=<slug-or-path>'); process.exit(2); }
  const character = arg.slice('--character='.length);
  try {
    const r = await installACharacterAsAClaudeConfiguration({ character, repoRoot: process.cwd() });
    console.error(`[install] character=${r.characterName}; ${r.skills.length} skill(s), ${r.hookCount} hook(s), ${r.copiedSurface.length} surface file(s) copied.`);
  } catch (err) {
    console.error(`[install] ${err.message}`);
    process.exit(2);
  }
}
