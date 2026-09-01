#!/usr/bin/env node
export const hookConfig = { trigger: 'PreToolUse', matcher: '.*' };

// Stub: monitoring extension point. Read stdin so the parent doesn't block, then exit.
const chunks = [];
for await (const chunk of process.stdin) chunks.push(chunk);
process.exit(0);
