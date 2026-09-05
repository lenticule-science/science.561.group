// Orders the list of inference-model candidates a picker has matched by a
// declared scoring rule. The picker iterates the returned list and tries each
// in turn; the first successful response wins.
//
// Today's rule is cost-first (sum of cost-per-token-in + cost-per-token-out,
// lower wins) with alphabetical tiebreak. Free models (0 cost) sort ahead of
// paid models; equal-cost models sort alphabetically.
//
// The rule lives in this helper so it can evolve without touching the picker's
// iteration logic. Future axes worth adding: rate-limit headroom (deprioritize
// models that hit their RPM cap recently per the witness log), context-window
// adequacy (drop candidates whose context window cannot hold the prompt),
// adapter health (skip candidates whose adapter recently errored).

import { readFileSync, existsSync } from 'node:fs';
import { join } from 'node:path';
import yaml from 'js-yaml';

const FRONTMATTER_RE = /^---\r?\n([\s\S]*?)\r?\n---\r?\n?/;

function readModelFrontmatter(repoRoot, slug) {
  const path = join(repoRoot, 'doing/working/inferring/models', `${slug}.md`);
  if (!existsSync(path)) return {};
  const text = readFileSync(path, 'utf8');
  const m = text.match(FRONTMATTER_RE);
  if (!m) return {};
  return yaml.load(m[1]) ?? {};
}

function totalCost(fm) {
  const inCost = Number(fm['cost-per-token-in'] ?? 0);
  const outCost = Number(fm['cost-per-token-out'] ?? 0);
  return (Number.isFinite(inCost) ? inCost : 0) + (Number.isFinite(outCost) ? outCost : 0);
}

// `candidates` is an array of model slugs (strings). Returns the same array
// re-ordered by the ranking rule. Does not mutate the input.
export function rankCandidates(repoRoot, candidates) {
  const scored = candidates.map(slug => {
    const fm = readModelFrontmatter(repoRoot, slug);
    return { slug, cost: totalCost(fm) };
  });
  scored.sort((a, b) => {
    if (a.cost !== b.cost) return a.cost - b.cost;
    return a.slug.localeCompare(b.slug);
  });
  return scored.map(s => s.slug);
}
