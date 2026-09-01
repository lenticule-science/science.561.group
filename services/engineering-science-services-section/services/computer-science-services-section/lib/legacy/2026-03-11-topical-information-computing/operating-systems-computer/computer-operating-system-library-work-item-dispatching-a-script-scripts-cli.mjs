#!/usr/bin/env node
import dispatchAScript from './dispatch-a-script.mjs';

const chunks = [];
process.stdin.on('data', c => chunks.push(c));
process.stdin.on('end', async () => {
  try {
    const input = JSON.parse(Buffer.concat(chunks).toString('utf8'));
    const result = await dispatchAScript({
      repoRoot: process.cwd(),
      ...input,
    });
    console.log(JSON.stringify(result, null, 2));
  } catch (error) {
    console.error(error.message);
    process.exit(1);
  }
});
