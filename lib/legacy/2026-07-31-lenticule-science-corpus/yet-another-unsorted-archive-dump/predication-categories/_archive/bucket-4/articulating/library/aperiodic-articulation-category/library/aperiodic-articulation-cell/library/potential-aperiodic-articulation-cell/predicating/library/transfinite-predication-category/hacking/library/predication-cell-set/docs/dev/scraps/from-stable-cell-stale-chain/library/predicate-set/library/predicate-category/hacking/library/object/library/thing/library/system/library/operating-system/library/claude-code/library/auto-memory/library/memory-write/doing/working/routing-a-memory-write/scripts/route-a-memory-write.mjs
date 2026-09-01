#!/usr/bin/env node

import { resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const AUTO_MEMORY_RE = /[/\\]\.claude[/\\]projects[/\\][^/\\]+[/\\]memory[/\\]([^/\\]+)$/;
const TYPE_PREFIX_RE = /^(feedback|reference|user|project)_(.+)\.md$/;

export default async function routeAMemoryWrite(input = {}) {
  const toolName = input?.tool_name ?? '';
  const filePath = input?.tool_input?.file_path ?? '';

  if (!filePath || !['Write', 'Edit', 'MultiEdit'].includes(toolName)) {
    return { decision: 'permit' };
  }

  const match = filePath.match(AUTO_MEMORY_RE);
  if (!match) return { decision: 'permit' };

  const filename = match[1];
  if (filename === 'MEMORY.md') return { decision: 'permit' };

  const typeMatch = filename.match(TYPE_PREFIX_RE);
  if (!typeMatch) {
    return {
      decision: 'block',
      message:
        `Memory write to ${filePath} blocked: filename does not match <type>_<slug>.md. ` +
        `Use one of: feedback_X.md, reference_X.md, user_X.md, project_X.md.`,
    };
  }

  const [, type, slugWithUnderscores] = typeMatch;
  const slug = slugWithUnderscores.replace(/_/g, '-');
  const repoTarget = `doing/working/journaling/library/memory/library/${type}/${slug}.md`;

  return {
    decision: 'block',
    message:
      `Memory write to ${filePath} blocked. ` +
      `Write to ${repoTarget} instead. ` +
      `Frontmatter must include \`name: ${slug}\` (matching the filename stem) and \`has-kind: ${type}\`. ` +
      `loading-the-memories will mirror it to the auto-memory location at next session start.`,
  };
}

// Hook-mode entry point: only runs when the file is invoked directly as a
// Claude Code PreToolUse hook script. Guarded so that MCP-time dynamic-import
// does NOT trigger a top-level stdin read (which would block the server
// startup forever — stdin is the MCP transport and never closes).
if (resolve(fileURLToPath(import.meta.url)) === resolve(process.argv[1] ?? '')) {
  const chunks = [];
  for await (const chunk of process.stdin) chunks.push(chunk);

  let input;
  try {
    input = JSON.parse(Buffer.concat(chunks).toString('utf8'));
  } catch {
    process.exit(0);
  }

  const result = await routeAMemoryWrite(input);
  if (result.decision === 'block') {
    process.stderr.write(result.message + '\n');
    process.exit(2);
  }
  process.exit(0);
}
