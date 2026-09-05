---
name: publishing-emsenn-net
description: Deploys the built emsenn-net site to production. Use only after a successful build and with explicit confirmation.
---

## Requirements

- A successfully built `<site>/public/` directory.
- The production target configured in the site's `publish.toml`.
- Explicit `--confirm` flag (captain-approval gate — do not add without being asked).

## Steps

1. Verify `<site>/public/` exists and was built recently (check `.build-history.jsonl`).
2. Run `node ${CLAUDE_SKILL_DIR}/scripts/publish-emsenn-net.js --site <path> --confirm [--dry-run]`.
3. In dry-run mode: report what would be uploaded without writing to the remote.
4. In live mode: sync `public/` to the configured production target (rsync, S3, or other transport per `publish.toml`).

## Outcomes

- In dry-run: a report of files that would be uploaded.
- In live mode: the production site is updated; uploaded file count and bytes transferred are reported.
- Without `--confirm`: skill refuses to run.
