---

title: Git repository
aliases:
  - "Git repository"
  - "git repository"
date-created: 2026-02-28T00:00:00
tags: []
---
A git repository is a directory tree whose history is tracked by git. It contains a `.git` directory holding the complete history of all files, including every [commit](./git-commit.md), [branch](./git-branch.md), and tag. Repositories can be cloned, creating full copies of the entire history on a different machine. A repository may include submodules: references to other repositories pinned at specific commits. In this vault, there are two repositories: the parent repository (`emsenn/emsenn-net`, containing Quartz framework code and site configuration) and the content submodule (`emsenn/content`, containing the Obsidian vault). The content submodule is the [Agential Semioverse Repository](../../../../../specifications/agential-semioverse-repository/index.md) proper: the directory structure, frontmatter conventions, and linking patterns all instantiate the formal ASR model.