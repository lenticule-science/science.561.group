// getting-the-heartbeat — reads HEARTBEAT.md at the repository root.
// Module: default-exports async ({ path? }) → { path, content }
// CLI:    node get-the-heartbeat.mjs [path]  — prints content to stdout.

import { readFileSync, existsSync } from 'node:fs';
import { resolve, isAbsolute, join } from 'node:path';
import { fileURLToPath } from 'node:url';

export default async function getTheHeartbeat({ path } = {}) {
  const resolved = path
    ? (isAbsolute(path) ? path : resolve(process.cwd(), path))
    : resolve(process.cwd(), 'HEARTBEAT.md');
  if (!existsSync(resolved)) {
    throw new Error(`HEARTBEAT.md not found at ${resolved}`);
  }
  const content = readFileSync(resolved, 'utf8');
  return { path: resolved, content };
}

if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  const [,, pathArg] = process.argv;
  try {
    const { content } = await getTheHeartbeat(pathArg ? { path: pathArg } : {});
    process.stdout.write(content);
  } catch (err) {
    process.stderr.write(`[get-the-heartbeat] ${err.message}\n`);
    process.exit(1);
  }
}
