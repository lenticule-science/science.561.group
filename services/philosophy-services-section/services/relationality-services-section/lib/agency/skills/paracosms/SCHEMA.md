# Paracosm content schema

Every entry under a paracosm directory is a markdown file with YAML
frontmatter. Filename is the canonical slug (`lower-kebab-case.md`).
Frontmatter is flat — engine-consumable fields, paracosm-meta fields,
and cross-reference fields all sit at the same level. Trust the names.

This schema is a v0.1 starting point. As real content lands, fields
will be added, renamed, or split. The type catalog and the naming
conventions are the load-bearing parts; everything else is refinable.

Note: `type:` here is its own namespace — the values differ from
[the SKP convention](../spatiotemporal-knowledge/README.md), where
`type:` is a within-`kind:` classifier. Different parts of the repo,
different vocabularies.

## Required fields

- `type:` — discriminant. Determines how the entry is interpreted.
  Currently defined: `place`, `being`, `thing`, `term`, `text`,
  `year`, `event`, `era`, `faction`, `species`. Paracosms may
  extend this set when needed (GAZ may need `session`, etc. — add
  and document here).
- `name:` — human-readable name. Strings, capitalization, spaces and
  punctuation allowed.
- `description:` — single-line description, OpenGraph/web style.
  Used in hugo `<meta>` tags and in any list-view of entries.
  When extracting from an existing source that lacks a short form,
  paraphrasing the longer prose is acceptable.

## Common optional fields

- `visual-description:` — multi-line prose for what an in-world observer
  sees. Becomes the MUD engine's `look` output (or its equivalent for
  beings and things). Use YAML's `|` block scalar for multi-line.
- `base:` — list of slugs this entry inherits from. Engine resolves names
  to other entries; subsequent fields override base fields.
- `behaviors:` — list of named behavior modules the engine attaches.
  Engine-namespaced (`map/area`, `lookable`).
- `trivia:` — list of out-of-character notes (origin, real-world
  inspiration, designer commentary). Common in qtops sources, generic
  across types.
- `summary:` — one-paragraph in-world summary. Useful on entries
  with rich lore where `description:` (single-line) is too short
  but the full `lore:` body is too long.
- `lore:` — long-form prose body when the entry is lore-rich and
  the markdown body is reserved for designer notes. Some types
  (faction, era, character, lore-place) carry their main content
  here rather than in the body.
- `mentioned-in:` — list of slugs (typically text entries) that reference
  this entry. Powers back-link rendering and queries like "what texts
  cite this place."
- `see-also:` — non-ordering cross-reference. Hyperlinks and footnotes
  in renders, no semantic constraint.

## Type-specific fields (starting set)

### `place`

- `exits:` — map of direction → place-slug.
- `contents:` — list of slugs of things or beings located here.
- `in-region:` — slug of an enclosing place.
- `grammar:` — map with `article:` (e.g. `"the"`, `""`) for prose generation.

### `being`

- `located-in:` — slug of a place.
- `inventory:` — list of slugs of things carried.
- `grammar:` — `article:`, `pronoun:`, etc.

### `thing`

- `located-in:` — slug of a place or a being's inventory.
- `mass:`, `volume:`, etc. — engine attributes as bare flat fields.

### `term`

- `defines:` — list of names this entry establishes the meaning of.

### `text`

- `genre:` — story | essay | letter | dialogue | song | prophecy | …
- `references:` — list of slugs (places, beings, things, terms, other
  texts) this text mentions.
- `narrated-by:` — slug of a being, if applicable.

### `faction`

For organizations, polities, guilds, families, and other social bodies.
Lives in `factions/`.

- `members:` — list of being-slugs known to belong.
- `rules:` — list of place-slugs the faction governs (or formerly did).
- `headquartered-in:` — slug of a place.
- `summary:` — one-paragraph summary.
- `lore:` — long-form prose.
- `status:` — `active`, `defunct`, etc.

### `species`

For classes of creature (not specific individuals). Lives in `species/`.

- `type-line:` — D&D-style stat-block label, e.g. "Medium beast,
  unaligned".
- `notes:` — short notes about the species.
- `members:` — list of being-slugs that are individuals of this
  species (optional).

### `year`, `event`, `era` (time entries)

The `time/` directory at any paracosm or sub-paracosm level holds
entries that locate other entries in time:

- `type: year` — a specific year. Filename uses the in-world suffix
  directly (`80aB.md`, `460bB.md`, `2026rw.md`).
- `type: event` — a discrete happening (`the-break.md`,
  `fire-of-ack.md`).
- `type: era` — a span of years (`astar-empire.md`).

Standard era suffixes are **`bB`** (before the Break),
**`aB`** (after the Break), and **`rw`** (real-world / out-of-character
/ authorial). Older variants like `pc` should be normalized to `aB`
when extracting.

Other entries reference time entries via fields like `at-year:`,
`during:`, `started:`, `ended:`, and `mentioned-in:`. These fields
are not yet formalized — add them to the schema as they get used in
real entries.

## Body convention by type

The body holds different things depending on `type:`:

| `type:` | Body holds |
|---|---|
| `place`, `being`, `thing` | Designer notes, lore, why-this-exists commentary. Engine output is in frontmatter (`visual-description` and friends). The MUD engine ignores the body. |
| `text` | The canonical content (story prose, essay, dialogue). Hugo renders it directly. `description:` is its OG short-form. |
| `term` | The definition prose, in the same convention as `library/` term entries. |

This means `text` and `term` entries are roundtrip-safe through their
bodies; `place`, `being`, and `thing` entries are roundtrip-safe through
their frontmatter — the body is authorial commentary that survives any
frontmatter regeneration.

## Filenames and slugs

Filename is `lower-kebab-case.md`. The filename stem IS the slug. There
is no `slug:` field — it would only repeat the filename and risk drift.

References to other entries (in `exits:`, `contents:`, `in-region:`,
`mentioned-in:`, etc.) use bare slugs. The resolver looks them up within
the entry's containing region first, then the containing paracosm, then
fails. Cross-paracosm references use namespaced form:
`<paracosm>/<region>:<slug>` (e.g. `emsean-paracosm/okaga:the-okaga`).

## Reference resolution

Resolution is **tolerant**: a validator should report unresolved slugs
but not refuse the entry. This makes incremental extraction practical —
a place's `contents:` can name beings that haven't been extracted yet,
and the validator's output becomes a worklist.

## Consumers

- **TAB** (Fennel): markdown → Fennel tables, frontmatter fields become
  table keys, `behaviors:` resolved against `engine/behaviors/`.
- **qtOps** (Racket): markdown → closure-of-procedures, frontmatter
  fields become initial procedure values, `behaviors:` resolved as `<>`
  qualities.
- **Hugo**: renders entries as web pages, body prose visible, frontmatter
  drives `<meta>` tags and structured-data emission.
- **MASH**: each frontmatter field becomes a claim — `(mossy-hollow,
  type, place)`, `(mossy-hollow, in-region, northern-watershed)`,
  `(mossy-hollow, exits.north, forest-edge)`. Lists become multiple
  claims with the same predicate. The body is witnessed as a single
  `(slug, body, "...")` claim.

## Example

```markdown
---
type: place
name: "Mossy Hollow"
base: [container]
behaviors: [map/area, lookable]
description: "A damp hollow of moss-grown stone."
visual-description: |
  Soft moss covers every surface, and the sound of dripping water
  echoes from somewhere deep in the rock.
exits:
  north: forest-edge
  south: cave-mouth
contents: []
grammar:
  article: "the"
in-region: northern-watershed
mentioned-in: [the-okaga]
---

# Mossy Hollow

Designer note: this hollow predates the surrounding forest by several
ages; the moss is older than any tree.
```
