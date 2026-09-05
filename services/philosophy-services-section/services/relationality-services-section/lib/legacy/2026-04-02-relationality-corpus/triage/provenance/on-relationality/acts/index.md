---
name: index
---

The **acts** are the atoms of the relational calculus.  Each page in this
directory captures one act in the same format:

- a short **Story** describing the recognition that forced the act,
- the formal **top** and **bottom** witnesses (replacing the trace string), and
- a concise **Proof Sketch**.

Each act lives on its own page named by the slug of the earned recognition.
The YAML front matter on each page exposes the important metadata:

- `title` / `slug` / `act` — how the recognition is presented here.
- `top` / `bottom` — which previously earned acts participate in the new act.
- `summary` — a short reminder of the recognition that forced the act.
- `tags` — used to distinguish acts from future story documents.

Use these fields when cross-referencing acts or building new texts on top of
them.

### Reading suggestions

1. **Start from any act and expand outward.**  Each recognition introduces the
   precise witnesses that force its neighbours.
2. **Follow the `top`/`bottom` chain.**  When an act references earlier ones,
   open those pages and read their histories to understand the dependency.
3. **Use search and tags.**  MkDocs Material will surface the summaries and
   tags, making it easy to jump between related acts once more metadata is
   assigned.

Future automation (via the configured `macros` plugin) can use this metadata to
render dependency tables, but this page provides the minimum context needed to
explore the catalogue manually today.
