---

name: project_charter-as-ast-root
description: The emerging system shape has the charter at the top of an abstract syntax tree and work units (tasks, procedures) as leaves. Plans carry their own normalization rules derived from their parent project.
udc-id: ["004.8"]
arxiv-id: ["cs.MA"]
---

The system is converging toward a shape where the charter is the root of an abstract syntax tree:

- **Charter** — top node, defines what the organization IS and DOES
- **Projects/Plans** — branches, each carrying normalization rules derived from the charter
- **Work units** (tasks, procedures, processes) — leaves, the concrete operations that prevent "normalization" (they're where the actual settlement happens)

Plans come with their own normalization rules based on the project they belong to. This means plan structure isn't one-size-fits-all — a research plan normalizes differently than an engineering plan because the settlement paths differ.

**Why:** This emerged from the 2026-04-01 session while consolidating the plan system. The user described seeing this shape "like a magic eye picture."

**How to apply:** When designing plan/task infrastructure, design for this tree shape. Don't flatten plans into a homogeneous list. The charter constrains what plans can exist; plans constrain what tasks can exist; tasks are where work actually happens.
