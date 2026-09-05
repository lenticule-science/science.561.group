// getting-the-name-of-this-thing — return the running MCP server's bound entity name.
// Reads AGENT_NAME or CHARACTER_NAME from env; takes basename of CHARACTER_NAME so
// path-form character refs are normalized to their canonical slug.

import { basename } from 'node:path';

export default async function getTheNameOfThisThing() {
  const character = process.env.CHARACTER_NAME;
  if (character && character.length > 0) {
    return { name: basename(character), kind: 'character' };
  }
  const agent = process.env.AGENT_NAME;
  if (agent && agent.length > 0) {
    return { name: agent, kind: 'agent' };
  }
  return { name: null, kind: null };
}
