// Sends a prompt to a named inference model's web endpoint and returns the
// structured send result. The actual HTTP I/O is delegated to the provider's
// adapter under doing/working/inferring/adapters/.

import { readFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';
import yaml from 'js-yaml';
import { appendDispatchWitness } from '../../../inferring/_witness.mjs';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);
// scripts/ is 5 levels deep under repo root:
//   doing/working/hacking/doing/working/skills/<this-skill>/scripts/
const REPO_ROOT = join(__dirname, '..', '..', '..', '..', '..', '..');

const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;

function extractFrontmatter(text) {
  const m = text.match(FRONTMATTER_RE);
  if (!m) return {};
  return yaml.load(m[1]) ?? {};
}

export default async function sendAMessageToALogicalInferenceModelOnTheWeb({
  model,
  prompt,
  maxTokens,
  workItem,
}) {
  if (typeof model !== 'string' || model.length === 0) {
    throw new Error('model (slug) is required');
  }
  if (typeof prompt !== 'string' || prompt.length === 0) {
    throw new Error('prompt is required');
  }

  const modelPath = join(REPO_ROOT, 'doing/working/inferring/models', `${model}.md`);
  const modelFm = extractFrontmatter(readFileSync(modelPath, 'utf8'));
  const provider = modelFm.provider;
  const modelName = modelFm['model-name'] || model;
  const adapterRelPath = modelFm.adapter;

  if (typeof adapterRelPath !== 'string' || adapterRelPath.length === 0) {
    throw new Error(`model record ${model}.md is missing required adapter: cell`);
  }
  const adapterUrl = `file://${join(REPO_ROOT, adapterRelPath)}`;
  const adapter = await import(adapterUrl);

  const witnessWorkItem = workItem ?? { skill: null, kind: 'derivation' };
  let responseText;
  try {
    responseText = await adapter.send({
      prompt,
      model: modelName,
      ...(maxTokens != null ? { maxTokens } : {}),
    });
  } catch (e) {
    appendDispatchWitness({
      repoRoot: REPO_ROOT,
      skill: 'sending-a-message-to-a-logical-inference-model-on-the-web',
      workItem: witnessWorkItem,
      chosenReceiver: adapterRelPath,
      outcome: 'error',
      error: e.message,
    });
    throw e;
  }

  appendDispatchWitness({
    repoRoot: REPO_ROOT,
    skill: 'sending-a-message-to-a-logical-inference-model-on-the-web',
    workItem: witnessWorkItem,
    chosenReceiver: adapterRelPath,
    outcome: 'ok',
    length: responseText.length,
  });

  return {
    model,
    provider,
    'response-text': responseText,
    'sent-at': new Date().toISOString(),
  };
}

if (import.meta.url === `file://${process.argv[1]}`) {
  const args = process.argv.slice(2);
  let model, prompt, maxTokens;
  for (let i = 0; i < args.length; i++) {
    if (args[i] === '--model') model = args[++i];
    else if (args[i] === '--prompt') prompt = args[++i];
    else if (args[i] === '--max-tokens') maxTokens = parseInt(args[++i], 10);
  }
  if (!model || !prompt) {
    console.error('Usage: send-a-message-to-a-logical-inference-model-on-the-web.mjs --model <slug> --prompt <text> [--max-tokens <n>]');
    process.exit(2);
  }
  sendAMessageToALogicalInferenceModelOnTheWeb({ model, prompt, maxTokens })
    .then(r => { console.log(JSON.stringify(r, null, 2)); })
    .catch(e => { console.error(e.message); process.exit(1); });
}
