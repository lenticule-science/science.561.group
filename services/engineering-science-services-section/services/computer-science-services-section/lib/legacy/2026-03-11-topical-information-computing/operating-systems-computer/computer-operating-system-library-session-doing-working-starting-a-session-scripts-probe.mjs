// Programmatic smoke-test for the 561 MCP harness.
// Spawns scripts/serve.mjs over stdio, performs an MCP handshake,
// lists tools, calls each tool with empty args, and prints results.
// Exits non-zero on any failure.
//
// Usage: AGENT_NAME=smoke-test node .../probe.mjs

import { Client } from '@modelcontextprotocol/sdk/client/index.js';
import { StdioClientTransport } from '@modelcontextprotocol/sdk/client/stdio.js';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const AGENT_NAME = process.env.AGENT_NAME;
if (!AGENT_NAME) {
  console.error('probe.mjs: set AGENT_NAME=<agent> in env');
  process.exit(2);
}

// This script sits 16 levels deep under the repo root.
const here = dirname(fileURLToPath(import.meta.url));
const repoRoot = resolve(here, '../../../../../../../../../../../../../../../..');
const servePath = resolve(repoRoot, 'library/object/library/thing/library/system/library/operating-system/library/computer-operating-system/library/mcp/doing/working/serving-a-stdio-mcp-server-to-a-claude-session-running-locally/scripts/serve-a-stdio-mcp-server-to-a-claude-session-running-locally.mjs');

const transport = new StdioClientTransport({
  command: 'node',
  args: [servePath],
  env: { ...process.env, AGENT_NAME },
  cwd: repoRoot,
});

const client = new Client({ name: 'probe', version: '0.0.1' }, { capabilities: {} });
await client.connect(transport);

const tools = await client.listTools();
console.log(`[probe] tools/list returned ${tools.tools.length} tool(s):`);
for (const t of tools.tools) console.log(`  - ${t.name}: ${t.description}`);

for (const t of tools.tools) {
  console.log(`[probe] calling tools/call name=${t.name} args={}`);
  const res = await client.callTool({ name: t.name, arguments: {} });
  console.log(`  result:`, JSON.stringify(res));
  if (res.isError) {
    console.error(`[probe] tool ${t.name} returned isError; failing.`);
    await client.close();
    process.exit(1);
  }
}

await client.close();
console.log(`[probe] OK`);
