---
title: "Paracosm content schema"
authors: [emsenn]
date-created: 2026-08-15
type: specification
description: "How a paracosm is kept as files: one Markdown entry per place, being, thing, term, text, faction, species, year, event or era, with flat YAML frontmatter that engines read as world claims and a body that holds prose or designer notes; the layout of a paracosm and its regions, slug and reference rules, and the consumers that read the same entries."
---

# Paracosm content schema

A paracosm is kept as a structured corpus: Markdown bodies for prose, YAML
frontmatter for engine-consumable structure. It is both a paracosm in the
psychological sense, a sustained imaginative engagement, and a secondary world
in the literary sense, a self-consistent fictional reality that generates
narratives. The directory layout makes that reality navigable; this schema
makes it parseable. Its entries are the finite data a
[reproducible paracosm specification](reproducible-paracosm-specification.md)
configuration is built from.

## Layout

Every paracosm follows the same layout:

    <paracosm>/
      README.md
      terms/   — paracosm-wide vocabulary
      texts/   — paracosm-wide narratives, lore, cosmology
      <region>/                       (optional, for paracosms with regions)
        places/   beings/   things/   terms/   texts/

`terms/` and `texts/` appear at both paracosm and region levels. Paracosm-wide
material (cosmology, language families, cross-region lore) lives at the outer
level; region-local glossary and prose at the inner. Leaf directories
(`places/`, `beings/`, `things/`, and so on) come into being when their first
entry is written; empty ones are not created.

## Entries

Every entry under a paracosm directory is a markdown file with YAML
frontmatter. Filename is the canonical slug (`lower-kebab-case.md`).
Frontmatter is flat — engine-consumable fields, paracosm-meta fields,
and cross-reference fields all sit at the same level. Trust the names.

This is version 0.2 of the schema. Version 0.1 set the type catalog and the
naming conventions, which are the load-bearing parts. Version 0.2
(2026-09-28) adds what a canon needs to hold several works and be checked by
the [Reproducible Paracosm Specification](reproducible-paracosm-specification.md):

- the types `work`, `novum`, `dynamic` and `modality`;
- the fields `canons`, `retired-names`, `pronunciation`, `voice`, `foreign`, `written-at`, `concerns` and `contradicts`;
- formal time fields.

The [source-owned FeltOS paracosm implementation](https://github.com/red-cup-engineering/feltos/blob/main/src/paracosm.mjs) defines the executable reader for the currently admitted types. The former monorepo-relative link to an "engineering note" no longer resolved from this standalone Science repository; it is replaced here with the verified Engineering source instead of inventing a mirrored document. Fields may change only when Science and existing Engineering consumers receive compatible changes.

## Research extension: scoped observations and non-linear time (2026-10-17)

**Version/status:** v0.2 remains the current interface. This is a **proposed v0.3 research profile**, not a claim that the FeltOS, TAB, MASH or Hugo consumers implement its features. The motivating source-anchored study is [Alice as a paracosmic stress test](../notes/2026/10/17/2026-10-17-note-on-alice-as-a-paracosmic-stress-test.md).

**Known v0.2 assumptions and their limits:**

1. One universally comparable timeline is a **modeling choice**, not a necessary property of reproducible fictional worlds. Distinguish narrative presentation order, partial event order, dream and remembrance frames, and local clock readings. The Hatter's clock may display six through several different events; the White Queen may report remembering future happenings. The clock reading alone is not an event identity.
2. \`contradicts:\` indexes **disagreement between texts**. FOUR values apply to the **same typed proposition under a specified source, canon and interpretation scope**, not to any two disputed texts. Speaker claims, character beliefs and narrator reports need distinct authority and evidence.
3. \`canons:\` distinguishes sets of possible-world assertions but does not establish cross-work character identity or a bridge between a dream, its narrator and its enclosing frame. Candidate bridges need their own provenance and observation-preservation conditions.
4. Minimal departure is a reader's inference strategy, not a license to promote every unstated real-world assumption to an established fictional-world fact. Inferred default, source-established event, contrary testimony and unknown have different evidence.
5. Consumers must name the distinctions they preserve. Body visibility alone does not determine grin visibility in all Cheshire Cat states. Projection fidelity is relative to declared observations, and not identical to bitwise reproducibility of generated media.

**Compatibility:** Existing required keys, types, slug resolution, time syntax, and current engine behavior remain **unchanged**. It is admissible to describe partial order, spoken testimony and subjective clock frames in existing text bodies or designer notes with explicit sources; that does not mean a v0.2 engine checks their deeper semantics. Implement none of these candidate fields by unilateral schema extension.

**Types to research before adopting a new schema version:** source edition and span; speaker and assertion polarity; scoped typed claim; event-to-event partial order; local clock and reading; world/dream/narration frame; explicit canon bridge; consumer observation family and information-loss witness; finite-test versus mechanized-proof versus receiving status.

### Proposed multiworld compatibility profile: Narnia

The complementary [Narnia source study](../notes/2026/10/17/2026-10-17-note-on-narnia-as-a-multiworld-paracosmic-stress-test.md) exposes additional information the existing source entries cannot yet convey mechanically without convention.

- **World versus region:** the polity named Narnia, the historical world containing it, the Wood Between the Worlds, Charn, England and Aslan's Country are not automatically regions of one Euclidean place or entries on one clock. Retain the source's distinction when referring to a location, its world and a possible counterpart.
- **Event-indexed portal:** a transit has a source event, destination event, origin world, destination world, actor/object provenance, portal medium, and source statement. A portal is neither an always-on \`exits:\` edge nor a function sending every source-world clock reading to one target time.
- **At least four clocks/orders:** publication order, reader encounter or narrated disclosure order, *local* world event order, and local clock reading. Overlapping Golden Age works and a prequel published later must be representable without inventing a single monotone numeric sort.
- **Epoch and survival:** a world's creation, state changes under governments, terminal event, and a narrator-described real counterpart have different semantic relations. A character's identity persists through world-specific appearances without requiring globally monotone body age.
- **Law and authority:** a reported law, its actual triggering condition, who knows it and what the story narrates happening are different records. Deeper Magic known to Aslan but unknown to the Witch is not automatically a contradiction cell.
- **Narrative/ecological evidence:** "Old Narnia" denied by one government can be attested by ruins, survivors and the narrated past; damaged landscapes are consequences rather than lore decoration. Speaker and regime claims do not gain truth from power.
- **Source authority:** external copyrighted novels and their adaptations remain distinct works with distinct canons and rights. This science corpus only stores analysis and attributed source locators, not a republished Lewis fiction database.

**No new public keys are defined here.** In the existing v0.2 body, a research annotator may record these facts as sourced prose and flags. Acceptance of a machine-readable next version requires Science-owned type definitions, conflict/identity rules, bounded negative controls, an existing Engineering consumer, and separate compatibility and receiving evidence. Do not treat future source fields as features already implemented by FeltOS.

## Required fields

- `type:` — discriminant. Determines how the entry is interpreted.
  Currently defined: `place`, `being`, `thing`, `term`, `text`,
  `year`, `event`, `era`, `faction`, `species`, `work`, `novum`,
  `dynamic`, `modality`. Paracosms may extend this set when needed
  (GAZ may need `session`, etc. — add and document here).
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
- `aliases:` — other names the entry goes by.
- `retired-names:` — names the entry no longer goes by. A work set after
  the change must not use them.
- `canons:` — the canons (possible worlds of this paracosm) the entry holds
  in. An entry without it holds in every canon. Two canons are two models of
  one signature: they may disagree about facts, never about which types and
  fields exist.
- `pronunciation:` — how the name is said, for narration (IPA or a
  respelling).

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
- `started:`, `ended:` — the being's lifetime, as time values.
- `voice:` — the narration voice for the being's point-of-view chapters.
- `embodied:` — `false` for a being with no body or place, such as the web itself or
  a network mind. A work's observation check does not ask to locate it.

### `thing`

- `located-in:` — slug of a place or a being's inventory.
- `mass:`, `volume:`, etc. — engine attributes as bare flat fields.

### `term`

- `defines:` — list of names this entry establishes the meaning of.
- `foreign:` — `true` when the term is not English in the world's
  telling. A foreign term needs a `pronunciation:`.

### `text`

- `genre:` — story | essay | letter | dialogue | song | prophecy | …
- `references:` — list of slugs (places, beings, things, terms, other
  texts) this text mentions.
- `narrated-by:` — slug of a being, if applicable.
- `written-at:` — time value at which the text was written in the world.
- `concerns:` — list of event or era slugs the text is about. A text
  written after what it concerns is a document from a later era: the
  epic's distance.
- `contradicts:` — list of text slugs this text disputes. This
  records a declared disagreement, **not by itself** a FOUR ⊤ world claim.
  A both-valued claim requires positive and negative evidence for the
  same typed, canon- and context-scoped proposition. Opposed testimony
  can remain without becoming a continuity error.

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

Every time entry carries `index:`, its number on the paracosm's one
timeline (a year number on the paracosm's calendar; negative before its
epoch). Eras carry `started:` and `ended:`; events carry `at:` and may
carry `during:` (an era) and `after:` (events it follows).

A **time value** is the slug of a time entry, an integer on the paracosm's
timeline, or, when the paracosm's README declares `calendar: gregorian`, an
ISO date (`YYYY-MM-DD`). Under **v0.2**, every time value can be compared with every other on
its one declared timeline. This is an implemented source-format assumption,
**not** a scientific requirement that every fictional world has a globally
comparable clock. The proposed research profile above treats temporal order
and local clock readings separately.
The fields that take time values are `at:`, `during:`, `started:`,
`ended:`, `after:` and `written-at:`; `at-year:` in older entries means
`at:`.

### `work`

A work set in the paracosm: a novel, serial, audiobook, graphic novel, game
or in-world document published as such. A work is a locale of the canon:
a window with its own observation. Lives in `works/`.

- `canon:` — the canon it is set in.
- `from:`, `to:` — its window, as time values.
- `places:` — slugs of the places it shows (their `in-region` places are
  included).
- `pov:` — slugs of its point-of-view beings.
- `genre:`, `medium:` — its observation.
- `manuscript:` — path of its ebook manifest, relative to the entry.
- `arc:` — its beats, in order.
- `reveals:` — the secrets it reveals, each `{id, subject, predicate}`,
  each revealed in exactly one chapter.
- `refusals:` — patterns the prose must not contain, each
  `{id, pattern, reason}`.
- `pov-alternates:` — `true` when no two chapters in a row share a point
  of view.
- `line:` — the slug of the line (a series with a promise to readers, such
  as a romance line) the work belongs to, when the paracosm has several.
- `number:` — its place in that line.
- `status:` — `planned`, `drafting` or `published`. A planned work may
  leave its manuscript and arc unset.

A work's story bible is derived from the canon and this entry; it is never
written by hand.

### `novum`

A departure from the actual world. Everything a paracosm does not declare
is the actual world (minimal departure). Lives in `nova/`.

- `departs-from:` — the actual-world fact departed from, with `source:`
  (a citation).
- `consequences:` — slugs of the dynamics, events, factions or things the
  novum drives. A novum without recorded consequences needs editorial review; do not treat
its lack of an explicit consequence link as a proof that the fictional fact
or the source author's intention is false.

### `dynamic`

A load-bearing system of the world: an ecology, economy, belief, technology
or war that the engine can run. Lives in `dynamics/`.

- `couples:` — slugs of the other dynamics it moves or is moved by.
- `capability:` — the FeltOS capability or field that runs it.
- `drives:` — slugs of the events it causes.

### `modality`

A mode of access to the world that characters use and are used by:
knowledge, prescience, memory, secrecy, time. Lives in `modalities/`.

- `kind:` — knowledge | prescience | memory | secrecy | time | …
- `held-by:` — slugs of the beings or factions that hold it.

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

- **FeltOS**: the flatfile resource graph's Markdown provider reads each
  frontmatter field as a claim with the entry as its witness, and FeltOS
  holds the claims as a four-valued world. A place is a room, `exits` are
  its exits, and a being `located-in` it is present. The paracosm module
  checks the canon and derives each work's story bible.
- **TAB** (Fennel): markdown → Fennel tables, frontmatter fields become
  table keys, `behaviors:` resolved against `engine/behaviors/`. Teraum's
  and Okaga's MUD worlds.
- **qtOps** (Racket), earlier: markdown → closure-of-procedures, frontmatter
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
