#!/usr/bin/env node
export const hookConfig = { trigger: 'PreToolUse', matcher: 'Skill' };

const chunks = [];
for await (const chunk of process.stdin) chunks.push(chunk);
process.exit(0);
