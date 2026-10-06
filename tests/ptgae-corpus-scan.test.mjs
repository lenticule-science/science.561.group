import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import os from 'node:os';
import path from 'node:path';
import { scanPTGAE, summarizeScan } from '../tools/ptgae-corpus-scan.mjs';

const root = await fs.mkdtemp(path.join(os.tmpdir(), 'ptgae-scan-'));
try {
  await fs.mkdir(path.join(root, 'docs'));
  await fs.mkdir(path.join(root, 'node_modules'));
  await fs.writeFile(path.join(root, 'docs', 'clean.md'), 'The parser preserves provenance.\n');
  await fs.writeFile(path.join(root, 'docs', 'poison.md'), 'The Music Services Section maintains knowledge and practices for this service domain.\n');
  await fs.writeFile(path.join(root, 'docs', 'study.md'), 'The Sociology Services Section maintains knowledge and practices for the study of social structure.\n');
  await fs.writeFile(path.join(root, 'node_modules', 'ignored.md'), 'It is important to note that this file must be ignored.\n');
  await fs.writeFile(path.join(root, 'docs', 'ignored.js'), 'It is important to note that this extension must be ignored.\n');

  let symlinkCreated = false;
  try {
    await fs.symlink(path.join(root, 'docs', 'poison.md'), path.join(root, 'docs', 'linked-poison.md'));
    symlinkCreated = true;
  } catch (error) {
    if (!['EPERM', 'EACCES', 'ENOTSUP'].includes(error?.code)) throw error;
  }

  const results = await scanPTGAE([root]);
  assert.deepEqual(results.map(x => path.basename(x.file)), ['poison.md', 'study.md']);
  const summary = summarizeScan(results);
  assert.equal(summary.files, 2);
  assert.equal(summary.error, 2);
  assert.equal(summary.findings, 2);
  assert.equal(summary.byCode.PTG013, 1);
  assert.equal(summary.byCode.PTG041, 1);
  if (symlinkCreated) assert.ok(!results.some(x => path.basename(x.file) === 'linked-poison.md'));
} finally {
  await fs.rm(root, { recursive: true, force: true });
}

console.log('ok corpus scanner finds text defects and skips excluded sources and symlinks');
