---
title: "The Path Codec and Canonicalization Laws"
description: "Authoritative reference for the term ⇄ filepath codec, the restriction/entailment laws, the enumerated normalization rules, and the glossary for POSIX-filepathing read as Curry–Howard proof coordinates by Yoneda embedding."
date-created: 2026-06-18
date-modified: 2026-06-18
keywords: ["category-theory", "curry-howard", "directionality", "filepath", "knowledge-organization", "library-science", "posix", "presheaf", "taxonomy", "yoneda-embedding"]
---

# The Path Codec and Canonicalization Laws

Information-oriented reference. This document enumerates symbols, signatures,
laws, normalization rules, and terms. It does not teach or motivate; for the
distinction between object-oriented and categorical taxonomy see
`../explanations/categorical-versus-object-oriented-taxonomy.md`, and for the
operational procedure see `../guides/organizing-a-node-categorically.md`.

The substrate is `lib/relating` (`@emsenn/relating`); `lib/animating` and
`lib/communicating` evaluate the same fibration at concrete bases.

## 1. The term ⇄ filepath codec

Module: `/home/emsenn/561-group/lib/relating/src/codecs/index.mts`. The codec is
the one genuine morphism between a term and a typed POSIX filepath.

### 1.1 Symbols

| Symbol | Signature | Role |
| --- | --- | --- |
| `termKey` | `(term: JsonValue) => string` | Canonical key for a term. Plain strings pass through (escaped when they collide with the reserved prefixes `~json:` / `~string:`); non-strings serialize to stable JSON with object keys sorted via `canonicalTermValue`. |
| `sanitizeSegment` | `(value: string) => string` | Encodes a string as one filesystem-safe POSIX segment. Keeps `[A-Za-z0-9._-]`; percent-style `~hh` hex-escapes everything else; special-cases `""` → `~e`, `"."` → `~2e`, `".."` → `~2e~2e`, and a leading `.`. |
| `desanitizeSegment` | `(segmentText: string) => string` | Inverse of `sanitizeSegment`. Reverses `~hh` escapes; throws on malformed escapes or disallowed raw bytes. |
| `segment` | `(term: JsonValue) => string` | `sanitizeSegment(termKey(term))`. |
| `address` | `(root: string, term: AddressTerm, type: string) => string` | The typed filepath for a term: `join(root, ...segments, ` `${leaf}.${type}` `)`. Throws on the empty term (`address: the empty term has no address`) or missing type (`address: a typed filepath needs a type`). |
| `termOf` | `(root: string, path: string) => string` | Strips the root prefix and leaf filename, desanitizes the remaining segments, joins with `/`. Inverse of `address` for the directory portion. |
| `addressNested` | `(root: string, parts: JsonValue \| readonly JsonValue[], type: string) => string` | As `address` but with pre-split parts. |
| `termOfNested` | `(root: string, path: string) => string[]` | Recovers the desanitized segment array without joining. Inverse of `addressNested`. |
| `logPath` | `(root: string, term: AddressTerm) => string` | `address(root, term, "jsonl")` — a term's append-only log. |
| `eavtLogPaths` | `(root: string, row: EAVT \| EAVTRecord) => readonly string[]` | The deduplicated subject (`e`) and predicate (`a`) log paths for an EAVT row; pure dual-filing projection, no filesystem effect. |
| `composeTerm` / `decomposeTerm` / `namespaceOf` / `withinNamespace` | see source | Namespace algebra over slash-separated terms. |

`AddressTerm = JsonValue | readonly JsonValue[]`. The reserved prefixes are
`JSON_TERM_PREFIX = "~json:"` and `STRING_TERM_PREFIX = "~string:"`; the escape
character is `~`; the safe class is `/[A-Za-z0-9._-]/`.

### 1.2 The codec chain (path codec lattice)

The descending lattice of path codecs, each a `restrict`-ed child of its parent
(see §2), is the entailment chain. Modules under
`/home/emsenn/561-group/lib/relating/src/codecs/path/`:

```
path → object → attribute → file → flatfile → serialization → json → jsonl → eavt
```

- `path` — `pathProjector`, defined in `codecs/path/projector.mts`,
  `recognize: (resource) => isPathname(resource.path)`.
- `eavt` (leaf) —
  `codecs/path/object/attribute/file/flatfile/serialization/json/jsonl/eavt/index.mts`.
  The leaf "carries no polarity and no operation": it is an
  `[entity, attribute, value, time]` witness only, evidence, never an
  assert/retract.

Descending one segment is one entailment edge (§2).

## 2. The holography kernel and its laws

Module: `/home/emsenn/561-group/lib/relating/src/holography/index.mts`. A type
is "DEFINED BY these morphisms (Yoneda), not by a folder or a spec."

### 2.1 Symbols

| Symbol | Signature |
| --- | --- |
| `Resource` | `interface { readonly path: string; readonly content: string }` |
| `Projector<T>` | `interface { type: string; parent: Projector<T> \| null; recognize(r: Resource): boolean; read?; write? }` |
| `define<T>` | `(spec: RootSpec<T>) => Projector<T>` — root projector, `parent = null`. |
| `restrict<T>` | `(parent: Projector<T>, spec: RestrictSpec<T>) => Projector<T>` |
| `entails<T>` | `(projector: Projector<T>) => Projector<T>[]` — itself, then everything it restricts, root last. |
| `classify<T>` | `(resource: Resource, catalog: readonly Projector<T>[]) => Projector<T> \| null` — the deepest recognizing projector. |

`read`/`write` are optional: absent where a type is not carrier-bearing; a
restriction inherits them unless it overrides (`read: spec.read ?? parent.read`).

### 2.2 Laws

The kernel's laws are exact statements, not heuristics.

1. **Codec round-trip (path-as-term).** For any term `t` and type `ty`:

   ```
   termOf(root, address(root, t, ty)) = canonical(t)
   ```

   where `canonical(t)` is the slash-join of `termKey`-canonicalized,
   `sanitizeSegment`/`desanitizeSegment`-stable segments. Equivalently
   `desanitizeSegment ∘ sanitizeSegment = id` on canonical keys, and the leaf
   file is named after the last segment with `type` as extension. A path that
   does not round-trip is non-canonical.

2. **Recognition entailment (Curry–Howard directionality).** For a `restrict`-ed
   child:

   ```
   recognize_child(r) = recognize_parent(r) ∧ local(r)
   ```

   Hence `recognize_child ⊢ recognize_parent`: "you cannot be a `json` without
   being a `flatfile`." The `parent` edge IS the Curry–Howard entailment edge.

3. **Entailment chain.** `entails(p)` returns `[p, p.parent, …, root]`. The chain
   is the proof structure the address structure realizes.

4. **Deepest-projector classification.** `classify(r, catalog)` returns the
   projector of maximal `entails(p).length` among those whose `recognize(r)` is
   true (`null` if none). The canonical type is the deepest true proposition, not
   a chosen bucket.

### 2.3 The settling descent

Module:
`/home/emsenn/561-group/lib/relating/src/articulating/predicating/positing/settling/filtration.mts`.
`settlementFiltration(stages, cofinality)` builds the directed sequence
articulating → predicating → positing → settling. It throws when there are no
stages, when stage 0 is not `predication.settling.stage.initial`, or when any
stage drops cells designated by its predecessor — the **monotonicity law**:

```
relativeCellComplement(previous.cells, designated.cells) = ∅   (for all stages)
```

Stages are indexed by `ordinal`; the default cofinality witness is
`countableSettlingCofinality`.

## 3. Cross-library enactment

The same fibration is evaluated at two further bases. Symbols are cited for
lookup only.

### 3.1 lib/animating (agency)

- `/home/emsenn/561-group/lib/animating/src/becoming/doing/embodying/boundary/transition.mts` —
  `transition(before, after): TransitionCarrier`. Reads each carrier's
  `fixedPointReadings.knowledgeLeast` section (`sectionOf`); emits a
  `ChargeShift` per changed cell with `knowledgeShift` an exact integer in
  `-2..2`. **Absence is data:** a cell entering/leaving the carrier appears as a
  shift to/from `chargeValueNamed("absurd")`.
- `relation-boundary.mts` — the sole site permitted to inspect `Mark` payloads
  (the Curry–Howard proof of admission at the boundary).
- `handedness.mts` — `(recv, send, actuate, observe)` identified with
  Player/Opponent duality `(−)^⊥`.
- `charge-boundary.mts`, `capability.mts` — state the four charges over
  relating's bilattice; never hand-rolled.

Animating's edge: "you cannot be an agent site without being an agent cell; you
cannot be an agent cell without settling a relating `SettlementFiltration`."

### 3.2 lib/communicating (language)

- `/home/emsenn/561-group/lib/communicating/src/index.mts` — `communicate(...)`.
- `speaking/listening/parsing/carrier.mts` — `admitCommunication(...)` lifts a
  string/Mark to a `CommunicatingCarrier` wrapping relating's `UtteranceCarrier`.
- `speaking/listening/parsing/articulating.mts` —
  `articulateCommunication(carrier, bundle): ArticulateResult`.
- `speaking/listening/parsing/charging.mts` —
  `charge(words, arcs): ChargingResult` (bilattice kernel; `Entry` triples +
  `SpecializationEdge`).
- `speaking/listening/parsing/descending.mts` — `descend(...)` flows charges
  downward via `joinKnowledge` to a least fixed point.
- `speaking/listening/algebra/charge.mts` — `chargeStatus(carrier): ChargeStatus`
  (`"decided" | "ambiguous" | "void"`); `fuse = meetTruth` (Lambek fusion);
  `implies(b, c)` (right residual of fusion: largest `a` in truth order with
  `a * b ≤ c`).
- `holography/index.mts` — `read(text, bundle): Reading`, the headline
  endomorphism layering parse, roles, grammaticality, cohomology, reference over
  one settled parse.

## 4. Normalization rules

The canonical state of a node. Each rule is enforceable against the codec and
kernel above.

1. **Path-as-term canonicality.** A node's path is canonical iff it equals
   `address(root, term, type)` for some term — `termKey`-canonicalized, each
   segment `sanitizeSegment`-safe, leaf named after the last segment with `type`
   as extension, and `termOf(root, path)` recovering the term. A path that does
   not round-trip is non-canonical.

2. **Segment-as-claim.** Every path segment must name what the material is about
   ("A path name is a claim about what the material is about"). Source
   repository, project-dump, ingestion-date, and agent-session names are
   forbidden as segments.

3. **Recursive shape.** The canonical tree is `topic/content/topic/content`. Each
   `topic/` carries the topical claim; its `library/` holds the promoted body. Add
   a deeper `library/` branch only when a narrower topic has enough internal
   structure to deserve one.

4. **Recognition-entailment (deepest-projector rule).** A resource's canonical
   type is `classify(resource, catalog)`. Never assert a type whose parent does
   not already recognize the resource
   (`recognize_child = recognize_parent ∧ local`).

5. **Expressible-content discipline.** The codec path traversed bounds what may
   be written. At the `eavt` leaf, write only evidence —
   `[entity, attribute, value, time]` witnesses with no polarity, no
   assert/retract. Negation/denial is a derived gauge symmetry of settling, never
   serialized at the flatfile/eavt codec.

6. **content vs `_archive`/`archive`.** Promoted, intentionally-organized material
   lives under `topic/content/`. Source-dump, old, conflicting, superseded, or
   unmerged material lives under the relevant topic's `archive/` (legacy
   `_archive/` residue likewise) until a human or explicit task promotes it. Do
   not promote into `library/` merely because a topical home is known.

7. **`_triage` placement.** Undecided intake lives under
   `content/triage/YYYY/MM/DD/` — a not-yet-canonicalized fiber awaiting a
   categorization decision. It is moved into a topic's `archive/` on first
   placement, then promoted to `library/` on settling.

8. **Filename collision on move.** When moving into a destination `archive/` that
   already holds the filename, suffix the incoming file (`name-2.md` or
   `name-2026-06-08.md`); never overwrite, never skip the move.

9. **Tags attach as morphisms, not containers.** Tags are inline YAML kebab-case
   slugs for key topics actually mentioned in the file, not redundant restatements
   of the path. A facet already present as a path segment is not repeated as a
   tag.

10. **UDC/LCC as tag, never directory.** Classification codes (UDC, LCC) are
    frontmatter attestations the document asserts about itself — arrows it offers
    — and never become path segments. Library-of-Congress topical headings govern
    the path/claim at broad levels (domain-specific taxonomy where LC is
    insufficient); the code stays a tag.

11. **Frontmatter canonicality.** A frontmatter record is canonical when its tags
    are mentioned-topic slugs (not path echoes), its classification codes are
    present as tags, and its body settles (folds through articulate → predicate →
    posit → settle to a fixed point) without dropping any predecessor stage's
    designated cells (monotonicity).

12. **Yoneda logging directionality.** Record a run/edge only at its codomain
    node, so each node's log accumulates exactly its arrows-in. Do not log an
    operation at its domain.

13. **Single-coordinate / projection rule.** Derive every fact (distance, cycles,
    centrality, the fibration grid, role-fiber and domain-section views) from the
    one honest `(domain, role)` coordinate parsed off each node; project to
    JSON/Turtle/HTML without reshaping or duplicating the store. New views are new
    namespace entries over the same store, not new core data models.

14. **Order before metadata.** Place the node at its canonical path before
    standardizing note metadata — a note that cannot be found by topic cannot be
    made useful by adding tags.

15. **`_index.md` handling.** Never delete an `_index.md` by filename alone;
    inspect it. Remove it only if empty or a pure navigation shell; if it carries
    substantive prose/metadata, preserve that content by renaming to a normal slug
    file (`topic/topic.md`) under the relevant topical `archive/`.

16. **Dual-morphism naming.** Suffix function names with the axis only when both
    axes share the same verb (`possibilize`/`necessitate` share a verb → suffix
    both); a dual that is a different verb takes no suffix.

## 5. Glossary

**Yoneda embedding.** `𝒴(A) = Hom_C(−, A)`: an object IS its hom-functor, fully
and faithfully determined by the bundle of arrows into/out of it. A type/node is
defined by its morphisms (`recognize`/`read`/`write`), not by a folder. "To
understand an object, study how it relates to other objects."

**Curry–Howard(-Lambek-Hoare) directionality.** A proof of `A ⊢ B`, a program
`A → B`, a categorical morphism `A → B`, and a Hoare triple `{A} C {B}` are one
arrow (precondition = domain, postcondition = codomain, sequencing =
composition). Directionality is restriction/entailment along a path:
`recognize_child = recognize_parent ∧ local`.

**Path-as-term / filepath-as-proof-coordinate.** A POSIX filepath read as a typed
term/proof: "the filepath IS the Curry–Howard proof coordinate / the directory
tree is the proof term." The path is a categorical address, not file metadata.

**`Projector<T>`.** A holography node defined by `(type, parent, recognize, read?,
write?)`. The `parent` edge is the Curry–Howard entailment edge; a `Projector` is
a representable presheaf in the restriction lattice.

**`restrict` / `entails` / `classify`.** `restrict(parent, spec)` builds a child
whose recognition conjunctively entails the parent's; `entails(projector)` returns
the chain to the root; `classify(resource, catalog)` returns the deepest projector
recognizing a resource — the deepest true proposition.

**term ⇄ path codec (TFAS).** `termKey` canonicalizes a `JsonValue`;
`sanitizeSegment` encodes a safe POSIX segment; `address(root, term, type)` places
the term in the tree with `type` as extension; `termOf(root, path)` inverts it. The
one morphism term ⇄ typed filepath.

**`topic/content/topic/content`.** The recursive thing/content/thing/content
archive shape (`topic/content/topic/content`): each `topic/` node carries the topical
claim, its `library/` holds promoted material, birthing subnodes as the fiber
enriches.

**`archive/` (and legacy `_archive/`).** A not-yet-canonicalized fiber under a
topic: source-dump, old, conflicting, superseded, unmerged material held until a
human or explicit task promotes it into `library/`.

**`_triage/YYYY/MM/DD`.** Intake awaiting a categorization decision — an unsettled
fiber over the base whose section has not reached a fixed point.

**Tag (UDC-as-tag).** A morphism/attestation the document asserts about itself,
recorded as a frontmatter kebab-case slug for topics actually mentioned (not a path
echo). UDC/LCC codes are tags, never directories; LC headings may govern the path,
the code stays a tag.

**Descent (articulate → predicate → posit → settle).** The directed morphism
sequence taking an utterance to a settled cell; `settlementFiltration` is indexed by
ordinals and monotone (no stage drops its predecessor's designated cells).

**Bilattice FOUR / charges.** Evidence pairs `(pos, neg)` with two orders: knowledge
(both up) and truth (pos up, neg down). Named absurd `⊥`, absurd `t`, potential `f`,
stable `⊤`; `⊤` is a held contradiction, not explosion (paraconsistency).

**Fibration (fiber vs section).** Role (`-topology`/`-algebra`/`-geometry` suffix,
layer) and domain are orthogonal axes over one content-addressed store; rendering
both projections makes the fibration visible. Same store, new namespace entries — no
duplication.

**Yoneda logging.** A run/edge is recorded only at its codomain, so a node's log
accumulates exactly its arrows-in.

**Headline endomorphism.** communicating's `read()`: layers parse, roles,
grammaticality, cohomology, reference over one settled parse — a Yoneda embedding of
the parse into its multi-layer holographic representation.

**Object/Quality/Relation/Act.** The Curry-Howard-Lambek-Scott tetrad:
type-theoretic (fiber algebra), logical (modal calculus), categorical (sheaf
construction), computational (self-generating closure) faces of one content; a term,
proof, morphism, and element are one content's four shadows.

## 6. Source index

- `/home/emsenn/561-group/lib/relating/src/holography/index.mts`
- `/home/emsenn/561-group/lib/relating/src/codecs/index.mts`
- `/home/emsenn/561-group/lib/relating/src/codecs/path/projector.mts`
- `/home/emsenn/561-group/lib/relating/src/codecs/path/object/index.mts`
- `/home/emsenn/561-group/lib/relating/src/codecs/path/object/attribute/file/flatfile/index.mts`
- `/home/emsenn/561-group/lib/relating/src/codecs/path/object/attribute/file/flatfile/serialization/json/jsonl/eavt/index.mts`
- `/home/emsenn/561-group/lib/relating/src/articulating/predicating/positing/settling/filtration.mts`
- `/home/emsenn/561-group/lib/animating/src/becoming/doing/embodying/boundary/transition.mts`
- `/home/emsenn/561-group/lib/animating/src/becoming/doing/embodying/boundary/relation-boundary.mts`
- `/home/emsenn/561-group/lib/animating/src/becoming/doing/embodying/handedness.mts`
- `/home/emsenn/561-group/lib/animating/src/becoming/doing/algebra/charge-boundary.mts`
- `/home/emsenn/561-group/lib/animating/src/becoming/doing/algebra/capability.mts`
- `/home/emsenn/561-group/lib/communicating/src/index.mts`
- `/home/emsenn/561-group/lib/communicating/src/speaking/listening/parsing/carrier.mts`
- `/home/emsenn/561-group/lib/communicating/src/speaking/listening/parsing/charging.mts`
- `/home/emsenn/561-group/lib/communicating/src/speaking/listening/parsing/descending.mts`
- `/home/emsenn/561-group/lib/communicating/src/speaking/listening/algebra/charge.mts`
- `/home/emsenn/561-group/lib/communicating/src/holography/index.mts`
- `/home/emsenn/561-group/content/library/README.md`
