---
name: building-emsenn-net
description: Runs the local Hugo build for the emsenn-net site and captures the log and timing. Use before publishing or auditing rendered output.
---

## Requirements

- The emsenn-net site root directory.
- `hugo` available in the environment (or a `Makefile` with a `build` target).

## Steps

1. Run `node ${CLAUDE_SKILL_DIR}/scripts/build-emsenn-net.js [--site <path>] [--destination <path>] [--minify]`.
2. The script invokes `hugo --minify` (or `make build`) in the site root, capturing stdout/stderr, duration, and page count.
3. If the build fails, print the relevant log lines and recommend `diagnose-hugo-build-failure`.
4. On success, append a build record `{timestamp, duration_seconds, page_count}` to `<site>/.build-history.jsonl`.

## Outcomes

- `<site>/public/` is populated with the built site.
- A build record is appended to `.build-history.jsonl`.
- On failure: relevant error lines are reported; `diagnose-hugo-build-failure` is recommended.
