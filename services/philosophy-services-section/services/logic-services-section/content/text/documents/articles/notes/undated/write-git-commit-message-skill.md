---
name: write-git-commit-message
description: Write clear git commit messages that explain what changed and why. Use when preparing commits for review.
title: write-git-commit-message
type: operational
keywords:
  - Git
  - Writing
runtime:
  invocation: inference
  tool: llm
region:
  reads:
    - content/technology/disciplines/computing/software/git/
  writes:
    - content/technology/disciplines/computing/software/git/
dependencies:
  - /media/writing/practice/git-commit-messages.md
part-of: technology/disciplines/computing/software/git
---

# Write Git Commit Message

- Use the commit message skill to choose structure and tone.
- Include the main change in the subject line.
- Add a short body when context or rationale matters.
