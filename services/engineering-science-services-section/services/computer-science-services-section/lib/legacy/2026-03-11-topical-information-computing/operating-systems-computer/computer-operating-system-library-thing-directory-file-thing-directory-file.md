---
name: thing-directory-file
description: A POSIX directory file that holds a $thing per the SPEC's recursive template — the on-disk bytes-stratum realization the SPEC specifies as the shape every directory in the OS conforms to.
kind-of: posix-file
schema: thing-directory-file.schema.json
witness-log: thing-directory-file.jsonl
having-required-files: [_index.md, '${name}.md', '${name}.schema.json', '${name}.jsonl']
having-optional-surface-files: [README.md, AGENTS.md, SOUL.md, HEARTBEAT.md, CLAUDE.md, MEMORY.md, DREAMS.md, TOOLS.md, USER.md, SKILL.md]
having-known-subdirs: [library, scripts, examples, templates, references, teaching, doing, learning]
---

A **thing-directory-file** is a POSIX 1003.1 directory file whose contents realize a $thing per the SPEC's recursive template.
The basename of the directory determines the basename of its four identity files; subdirectories are either one of the known kinds (library, scripts, examples, templates, references, teaching, doing, learning) or are gerund-named transformer specializations.

## Rules

The SPEC's directory shape decomposes into three rules the validator enforces:

1. **Basename rule.** Identity files match the directory basename.
  If the directory is `cell-record`, the identity files are `_index.md`, `cell-record.md`, `cell-record.schema.json`, `cell-record.jsonl`.
  Off-pattern files like `wrong-name.md` or `bad-name.schema.json` are violations.
2. **All-identity-files-or-none rule.** Once any one of the four identity files appears, all four must appear.
  A directory with only `cell-record.schema.json` and nothing else is a violation: either complete the thing or remove the schema.
3. **Subdir-naming rule.** Subdirectories must be one of the known kinds (library, scripts, examples, templates, references, teaching, doing, learning, plus `.git` / `.claude` / `.github` / `node_modules` / `old-archive` as POSIX-toolchain exceptions) or a gerund-noun slug naming a transformer specialization.
  Noun-named subdirectories are admissible only directly inside a [library directory](../), where they name structure specializations.

## Validator and blocker

[The thing-directory-file validator script](validating-a-thing-directory-file/scripts/validating-a-thing-directory-file.mjs) compiles [the thing-directory-file JSON Schema](thing-directory-file.schema.json) with Ajv 2020 plus ajv-formats, exposes `validateThingDirectoryFile(dirPath)`, `validateAuditObject(audit)`, and `projectAuditForWrite(parentDirPath, fileBasename, toolName)` as a module, and runs as a CLI: `node validating-a-thing-directory-file/scripts/validating-a-thing-directory-file.mjs <directory-path>` exits 0 on conformant, 1 on violations with per-rule error reporting.

[The paired write-blocker hook](blocking-a-write-that-breaks-the-thing-directory-file-schema/scripts/block-a-write-that-breaks-the-thing-directory-file-schema.mjs) — a sibling transformer in the same `thing-directory-file/` tree — is a `PreToolUse` hook on `Write|Edit|MultiEdit` that reads the tool input, projects the post-write directory state via `projectAuditForWrite`, validates it via `validateAuditObject`, and exits 2 with the violation summary if non-conformant.
The hook is wired in [the hook configuration](../../../../../../../../../.claude/settings.json) and imports the validator by relative path within the tree (no hardcoded repo-root walk).
