---
name: use-git-basics
description: Use basic git commands for status, staging, committing, and syncing. Use when making changes in a git repository.
title: use-git-basics
type: operational
keywords:
  - Git
  - VersionControl
runtime:
  invocation: inference
  tool: llm
region:
  reads:
    - content/technology/disciplines/computing/software/git/
  writes:
    - content/technology/disciplines/computing/software/git/
dependencies:
  - /technology/computing/software/git/curricula/index.md
part-of: technology/disciplines/computing/software/git
---

# Use Git Basics

- Check status with `git status` before and after changes.
- Stage relevant files with `git add`.
- Commit changes with a descriptive message.
- Pull before pushing when collaborating.
