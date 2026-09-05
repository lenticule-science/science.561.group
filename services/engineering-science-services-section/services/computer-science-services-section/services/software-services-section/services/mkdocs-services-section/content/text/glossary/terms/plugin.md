---
name: "plugin"
aliases:
  - "plugin"
date-created: 2025-12-31
tags: []
---

An ***MkDocs plugin*** is a Python module that hooks into the [MkDocs](./mkdocs.md) build process to extend or modify its behavior. Plugins can add features (search indexing, social cards, version selectors), transform content during build, or generate additional output files. They are installed as Python packages and activated by listing them under the `plugins:` key in `mkdocs.yml`. Each plugin receives build events at defined stages, allowing it to read, modify, or inject pages and assets.
