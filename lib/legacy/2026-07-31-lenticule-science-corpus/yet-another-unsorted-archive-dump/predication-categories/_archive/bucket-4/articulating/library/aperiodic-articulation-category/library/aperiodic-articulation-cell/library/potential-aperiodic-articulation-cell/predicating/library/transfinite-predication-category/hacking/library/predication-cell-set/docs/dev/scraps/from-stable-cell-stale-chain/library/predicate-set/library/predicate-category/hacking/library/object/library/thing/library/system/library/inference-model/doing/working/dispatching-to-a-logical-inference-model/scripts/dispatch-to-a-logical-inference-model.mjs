// Picks the first model whose skills: list contains the requested skill,
// then dispatches to the right sub-dispatcher (web or local; only web is wired
// in v1). Returns the response cell, augmented with the matched skill.

import { readFileSync, readdirSync } from 'node:fs';
import { join, dirname, basename } from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'js-yaml';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';
import { rankCandidates } from '../../../inferring/_rank-candidates.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');
const MODELS_DIR = join(REPO_ROOT, 'doing/working/inferring/models');

const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;

function extractFrontmatter(text) {
  const m = text.match(FRONTMATTER_RE);
  if (!m) return {};
  return yaml.load(m[1]) ?? {};
}

export default async function dispatchToALogicalInferenceModel({
  skill,
  prompt,
  maxTokens,
  workItem,
}) {
  if (typeof skill !== 'string' || skill.length === 0) {
    throw new Error('skill (slug) is required');
  }
  if (typeof prompt !== 'string' || prompt.length === 0) {
    throw new Error('prompt is required');
  }
  // Fall back to a constructed witness-workItem when the caller didn't pass one
  // (e.g. direct CLI invocation). Direct callers should pass the full workItem
  // through so witnesses carry the real workitem-skill and workitem-kind.
  const wi = workItem ?? { skill, kind: 'derivation' };

  // Walk models alphabetically. Collect every model whose skills list advertises
  // the requested skill; try them in order, falling through on adapter errors
  // (auth missing, rate-limit, network failure). First successful response wins.
  const entries = readdirSync(MODELS_DIR)
    .filter(n => n.endsWith('.md') && n !== '_index.md')
    .sort();

  const matched = [];
  for (const entry of entries) {
    const fm = extractFrontmatter(readFileSync(join(MODELS_DIR, entry), 'utf8'));
    const skills = Array.isArray(fm.skills) ? fm.skills : [];
    if (skills.includes(skill)) {
      matched.push(basename(entry, '.md'));
    }
  }

  // Order the matched candidates by the ranking rule (cost-first today; the
  // rule lives in _rank-candidates.mjs so it can evolve without this script).
  const candidates = rankCandidates(REPO_ROOT, matched);

  const witnessWorkItem = wi;

  if (candidates.length === 0) {
    appendDispatchWitness({
      repoRoot: REPO_ROOT,
      skill: 'dispatching-to-a-logical-inference-model',
      workItem: witnessWorkItem,
      chosenReceiver: null,
      outcome: 'error',
      error: `no model advertises skill ${skill}`,
    });
    throw new Error(`no model advertises skill ${skill}`);
  }

  // v1: only web sub-dispatcher is wired. A future local-model sub-dispatcher
  // would be selected here based on the model record's wire-reachability.
  const webDispatcherUrl = `file://${join(REPO_ROOT, 'library/object/library/thing/library/system/library/inference-model/doing/working/dispatching-to-a-logical-inference-model-on-the-web/scripts/dispatch-to-a-logical-inference-model-on-the-web.mjs')}`;
  const { default: dispatchToWeb } = await import(webDispatcherUrl);

  const attempts = [];
  for (const matchedModel of candidates) {
    try {
      const responseCell = await dispatchToWeb({ model: matchedModel, prompt, maxTokens, workItem: wi });
      appendDispatchWitness({
        repoRoot: REPO_ROOT,
        skill: 'dispatching-to-a-logical-inference-model',
        workItem: witnessWorkItem,
        chosenReceiver: matchedModel,
        outcome: 'ok',
        attempts: attempts.concat({ receiver: matchedModel, outcome: 'ok' }),
      });
      return {
        ...responseCell,
        'matched-skill': skill,
        'attempts': attempts.concat({ model: matchedModel, outcome: 'ok' }),
      };
    } catch (e) {
      attempts.push({ receiver: matchedModel, outcome: 'error', error: e.message });
    }
  }

  const tried = candidates.join(', ');
  const detail = attempts.map(a => `${a.receiver}: ${a.error}`).join(' | ');
  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'dispatching-to-a-logical-inference-model',
    workItem: witnessWorkItem,
    chosenReceiver: null,
    outcome: 'error',
    error: `all ${candidates.length} model(s) advertising skill ${skill} failed (${tried})`,
    attempts,
  });
  throw new Error(`all ${candidates.length} model(s) advertising skill ${skill} failed (${tried}). Detail: ${detail}`);
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const args = process.argv.slice(2);
  let skill, prompt, maxTokens;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--skill') skill = args[++i];
    else if (args[i] === '--prompt') prompt = args[++i];
    else if (args[i] === '--max-tokens') maxTokens = parseInt(args[++i], 10);
  }
  if (!skill || !prompt) {
    console.error('Usage: dispatch-to-a-logical-inference-model.mjs --skill <slug> --prompt <text> [--max-tokens <n>]');
    process.exit(2);
  }
  dispatchToALogicalInferenceModel({ skill, prompt, maxTokens })
    .then(r => { console.log(JSON.stringify(r, null, 2)); })
    .catch(e => { console.error(e.message); process.exit(1); });
}
