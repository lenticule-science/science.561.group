#!/usr/bin/env node
// Transitions a work-item's has-status cell after validating against the
// lifecycle-state-machine. A contesting positing on (target, has-status, *).

import { readFileSync, writeFileSync, appendFileSync } from 'node:fs';
import { resolve, dirname, basename } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = process.env.REPO_ROOT || process.cwd();

const LSM_PATH = resolve(REPO_ROOT,
  'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/library/lifecycle-state-machine/lifecycle-state-machine.md'
);
const WI_JSONL = resolve(REPO_ROOT,
  'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/work-item/work-item.jsonl'
);

function parseArgs(argv) {
  const args = {};
  for (const a of argv.slice(2)) {
    const m = a.match(/^--([a-z-]+)=(.*)$/);
    if (m) args[m[1]] = m[2];
  }
  return args;
}

function loadTransitions() {
  // Parse the transitions: block from lifecycle-state-machine.md frontmatter.
  const md = readFileSync(LSM_PATH, 'utf-8');
  const fm = md.match(/^---\n([\s\S]*?)\n---/);
  if (!fm) throw new Error('lifecycle-state-machine: no frontmatter');
  // Naive YAML block parse for transitions:
  const tx = {};
  let in_tx = false;
  for (const line of fm[1].split('\n')) {
    if (line === 'transitions:') { in_tx = true; continue; }
    if (in_tx) {
      const m = line.match(/^  ([a-z-]+):\s*\[(.*)\]$/);
      if (m) {
        tx[m[1]] = m[2].split(',').map(s => s.trim().replace(/^["']|["']$/g, ''));
      } else if (line.match(/^[a-z]/)) {
        // Next top-level key — done with transitions block
        break;
      }
    }
  }
  return tx;
}

function readTargetStatus(targetPath) {
  const md = readFileSync(targetPath, 'utf-8');
  const fm = md.match(/^---\n([\s\S]*?)\n---/);
  if (!fm) return null;
  const m = fm[1].match(/^has-status:\s*(.+)$/m);
  return m ? m[1].trim().replace(/^["']|["']$/g, '') : null;
}

function updateTargetStatus(targetPath, newStatus, blockedByReason) {
  let md = readFileSync(targetPath, 'utf-8');
  md = md.replace(/^(has-status:\s*).*$/m, `$1${newStatus}`);
  if (newStatus === 'blocked' && blockedByReason) {
    if (md.match(/^blocked-by:/m)) {
      md = md.replace(/^(blocked-by:\s*).*$/m, `$1${JSON.stringify(blockedByReason)}`);
    } else {
      md = md.replace(/^(has-status:.*)$/m, `$1\nblocked-by: ${JSON.stringify(blockedByReason)}`);
    }
  } else if (newStatus !== 'blocked') {
    md = md.replace(/^blocked-by:.*\n/m, '');
  }
  writeFileSync(targetPath, md);
}

function appendWitness(slug, from, to, reason) {
  const row = {
    e: slug,
    a: 'transitioning-a-work-items-state',
    v: reason ? { from, to, reason } : { from, to },
    t: new Date().toISOString(),
  };
  appendFileSync(WI_JSONL, JSON.stringify(row) + '\n');
}

function main() {
  const args = parseArgs(process.argv);
  if (!args.target || !args.from || !args.to) {
    console.log(JSON.stringify({
      status: 'rejected',
      reason: 'no-target',
      details: 'Usage: --target=<path> --from=<state> --to=<state> [--reason=<text>]'
    }, null, 2));
    process.exit(1);
  }

  const targetPath = resolve(args.target);
  const slug = basename(args.target, '.md');

  const actualStatus = readTargetStatus(targetPath);
  if (actualStatus === null) {
    console.log(JSON.stringify({ status: 'rejected', reason: 'no-status-in-target', details: targetPath }, null, 2));
    process.exit(1);
  }
  if (actualStatus !== args.from) {
    console.log(JSON.stringify({
      status: 'rejected', reason: 'stale-observation',
      details: `current has-status is "${actualStatus}", caller observed "${args.from}"`
    }, null, 2));
    process.exit(1);
  }

  const transitions = loadTransitions();
  const valid = transitions[args.from] || [];
  if (!valid.includes(args.to)) {
    console.log(JSON.stringify({
      status: 'rejected', reason: 'invalid-transition',
      details: `from "${args.from}" valid targets are [${valid.join(', ')}]; "${args.to}" not in list`
    }, null, 2));
    process.exit(1);
  }

  if (args.to === 'blocked' && !args.reason) {
    console.log(JSON.stringify({
      status: 'rejected', reason: 'missing-blocked-by-reason',
      details: 'transitioning to blocked requires --reason=<text>'
    }, null, 2));
    process.exit(1);
  }

  updateTargetStatus(targetPath, args.to, args.reason);
  appendWitness(slug, args.from, args.to, args.reason);

  console.log(JSON.stringify({
    status: 'transitioned',
    target: args.target,
    from: args.from,
    to: args.to,
    witnessAppendedTo: WI_JSONL.replace(REPO_ROOT + '/', ''),
  }, null, 2));
}

main();
