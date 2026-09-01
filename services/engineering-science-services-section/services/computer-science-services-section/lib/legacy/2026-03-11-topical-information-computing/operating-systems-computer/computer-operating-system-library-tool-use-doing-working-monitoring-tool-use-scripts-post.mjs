#!/usr/bin/env node
export const hookConfig = { trigger: 'PostToolUse', matcher: '.*' };

const chunks = [];
for await (const chunk of process.stdin) chunks.push(chunk);
process.exit(0);
