import { existsSync, readFileSync, readdirSync } from 'node:fs';
import { basename, dirname, join, resolve } from 'node:path';
import Ajv2020 from 'ajv/dist/2020.js';
import addFormats from 'ajv-formats';
import send from '../../../parameters/sending-parameters-to-a-script/scripts/send-parameters-to-a-script.mjs';
import receive from '../../../message/receiving-a-message-from-a-script/scripts/receive-a-message-from-a-script.mjs';

const schema = JSON.parse(
  readFileSync(new URL('../dispatching-a-script.schema.json', import.meta.url), 'utf8'),
);

const ajv = new Ajv2020({ allErrors: true, strict: false });
addFormats(ajv);
const validateInput = ajv.compile(schema.properties.input);
const validateOutput = ajv.compile(schema.properties.output);

const PRUNE_DIRS = new Set(['.git', 'node_modules', 'theories', 'old-archive']);

export default async function dispatchAScript(input) {
  if (!validateInput(input)) {
    throw new TypeError(
      'dispatching-a-script: input violates schema: ' + ajv.errorsText(validateInput.errors),
    );
  }
  const { workItem } = input;
  const { skill, parameters } = workItem;
  const scriptPath = resolveScriptPath(input, skill);

  const sendResult = await send({ scriptPath, parameters: parameters || {} });
  const responseCell = await receive({ sendResult });
  const output = {
    ...responseCell,
    skill,
  };
  if (!validateOutput(output)) {
    throw new Error(
      'dispatching-a-script: output violates schema: ' + ajv.errorsText(validateOutput.errors),
    );
  }
  return output;
}

function resolveScriptPath(input, skill) {
  if (input.scriptPath) return resolve(input.scriptPath);
  const realizations = input.skillRealizations ?? buildSkillRealizations(input.repoRoot);
  const matches = realizations.filter(realization => realization.skill === skill);
  if (matches.length === 0) {
    throw new Error(`dispatching-a-script: no script realization found for skill ${skill}`);
  }
  if (matches.length > 1) {
    throw new Error(
      `dispatching-a-script: multiple script realizations found for skill ${skill}: ` +
        matches.map(match => match.scriptPath).join(', '),
    );
  }
  return resolve(matches[0].scriptPath);
}

function buildSkillRealizations(repoRoot) {
  const root = resolve(repoRoot);
  const skillDirs = findSkillDirs(root);
  return skillDirs.flatMap(dir => {
    const scriptsDir = join(dir, 'scripts');
    if (!existsSync(scriptsDir)) return [];
    const scripts = readdirSync(scriptsDir)
      .filter(name => name.endsWith('.mjs') && !name.startsWith('_'))
      .sort();
    if (scripts.length !== 1) return [];
    return [{ skill: basename(dir), scriptPath: join(scriptsDir, scripts[0]) }];
  });
}

function findSkillDirs(dir, matches = []) {
  for (const entry of readdirSync(dir, { withFileTypes: true })) {
    if (entry.isDirectory()) {
      if (PRUNE_DIRS.has(entry.name)) continue;
      findSkillDirs(join(dir, entry.name), matches);
      continue;
    }
    if (entry.isFile() && entry.name === 'SKILL.md') matches.push(dirname(join(dir, entry.name)));
  }
  return matches;
}

export { buildSkillRealizations };
