---
name: use-github-pull-requests
description: Open, review, and merge GitHub pull requests with clear context. Use
  when collaborating on git-based changes.
title: use-github-pull-requests
type: operational
keywords:
  - Github
  - Collaboration
runtime:
  invocation: inference
  tool: llm
region:
  reads:
    - content/technology/disciplines/computing/software/github/
  writes:
    - content/technology/disciplines/computing/software/github/
dependencies:
  - /technology/computing/software/github/curricula/index.md
part-of: technology/disciplines/computing/software/github
---

# Use GitHub Pull Requests

- Keep pull requests small and focused.
- Summarize the change and the rationale.
- Request reviews from relevant collaborators.
- Merge after checks pass and feedback is addressed.
