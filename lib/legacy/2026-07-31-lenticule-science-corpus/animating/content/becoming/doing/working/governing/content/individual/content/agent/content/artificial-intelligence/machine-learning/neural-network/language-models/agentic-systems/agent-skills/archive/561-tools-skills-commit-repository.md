---

description: Stage all changes and commit them with an appropriate message
name: commit-repository
version: [0, 1]
runtime: inference
triggers:
  - "commit"
  - "save changes"
  - "stage and commit"
inputs:
  message: string?
outputs:
  commit_hash: string
region:
  reads: ["content/", ".claude/"]
  writes: []
dependencies: []
scopes: []
part-of: technology/specifications/agential-semioverse-repository
---
Run `git status` now to see what has changed, then:

1. Stage everything except `content/private/`.
2. Write a commit message:
   - Imperative mood, under 72 characters
   - Conceptual, not mechanical
   - Trailer: `Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>`
3. Commit.

$ARGUMENTS
