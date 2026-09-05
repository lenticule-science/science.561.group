---

name: "nav"
aliases:
  - "nav"
date-created: 2025-12-31
tags: []
---

The ***nav*** configuration in [MkDocs](./mkdocs.md) defines the navigation structure of the generated site. It is specified as a YAML list in `mkdocs.yml`, mapping page titles to Markdown file paths. The nav determines the sidebar menu, page ordering, and hierarchical grouping of documentation sections. Pages omitted from the nav are still built but do not appear in the site navigation unless a [plugin](./plugin.md) adds them.
