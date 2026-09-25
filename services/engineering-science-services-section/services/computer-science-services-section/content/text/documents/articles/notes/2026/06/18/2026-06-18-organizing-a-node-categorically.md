---
title: "Organizing a Node Categorically"
description: "A task-oriented recipe for placing a document by its morphisms rather than a bucket: how to canonicalize a path, attach UDC/LCC as tags, route intake through triage and archive, let a fiber birth a subnode, and drive the work with the research engine bins."
date-created: 2026-06-18
date-modified: 2026-06-18
keywords: ["category-theory", "curry-howard", "directionality", "filepath", "knowledge-organization", "library-science", "posix", "presheaf", "taxonomy", "yoneda-embedding"]
---


This is a procedure, not an explanation. It assumes you already accept that a POSIX filepath is a typed term — a Curry-Howard proof coordinate — and that a node is determined by its morphisms (the Yoneda embedding `𝒴(A) = Hom_C(−, A)`), never by the folder that contains it. If you want the *why*, read [`../explanations/categorical-versus-object-oriented-taxonomy.md`](../../../../../../../../../../../information-science-services-section/services/math-services-section/content/text/documents/articles/notes/2026/06/18/2026-06-18-categorical-versus-object-oriented-taxonomy.md) first. Here you will find numbered recipes for the recurring filing tasks, each one anchored to the codec and holography kernel in `lib/relating` and driven by the research engine bins (`read-file`, `list-path`, `grep-text`, `inspect-topic`, `plan-normalization`, `update-frontmatter`).

Two laws govern every recipe below, and they are worth stating before you act:

- **The path is the term.** A path is canonical *iff* it is `address(root, term, type)` for some term and `termOf(root, path)` recovers that term (`lib/relating/src/codecs/index.mts`). If a path does not round-trip, you are not filing — you are lying about a type.
- **Descent is entailment.** Each segment is a restriction morphism whose recognition conjoins its parent's: `recognize_child = recognize_parent ∧ local` (`restrict` in `lib/relating/src/holography/index.mts`). You place a thing by inhabiting its type, not by choosing a home.

Work in this order: organize directories (place the node at its canonical path) *before* standardizing metadata. A note that cannot be found by topic cannot be made useful by adding tags (`content/library/README.md`).

## Recipe 1 — Place a document by its morphisms, not a bucket

Goal: give a document its canonical path — the deepest true proposition about what it is *about* — rather than dropping it into whatever bucket is nearest.

1. **Read the document itself.** Run `read-file` on the candidate. Do not classify from its filename, its source repository, or a sibling's path. The claim a path encodes is a claim about content; you must hold the content.
2. **List the destination neighborhood.** Run `list-path` on the topical branch you suspect is the home, and on its parent. You are surveying the existing hom-set: which `topic/` nodes already exist, and which `library/` bodies they carry. Choose the most specific existing branch; do not guess a flat top-level label when a deeper topic already exists (`content/library/README.md`).
3. **Find the deepest recognizing topic.** Run `inspect-topic` on each plausible branch. The canonical home is the one whose recognition *entails* every shallower one — the analogue of `classify(resource, catalog)` returning the deepest projector that recognizes the resource (`lib/relating/src/holography/index.mts`). Never assert a type whose parent does not already recognize the document: you cannot file a thing under `category-theory/yoneda-embedding` if it is not first about category theory.
4. **Name the segment as a claim, not a provenance.** Every path segment must name what the material is *about* — "a path name is a claim about what the material is about" (`content/library/README.md`). Source repository, project-dump, ingestion-date, and agent-session names are forbidden as segments; they are not the encoding of any topical term, so they break the round-trip and damage later classification.
5. **Verify the round-trip before committing.** A path is canonical only if `address(root, term, type)` produces it and `termOf(root, path)` recovers the term (`lib/relating/src/codecs/index.mts`). The leaf file is named after the last segment with the file type as its extension — `creatures/ada` maps to `<root>/creatures/ada/ada.<type>`. A path that does not round-trip is non-canonical no matter how sensible it looks; rename the segment until it does.
6. **Place the file.** Move the document to the canonical path. The directory you descended is not the document's owner; it is the chain of restriction morphisms the document's type inhabits. The tree is one rendered projection of that chain — not the truth itself.

## Recipe 2 — Tag UDC and LCC as attestations, not directories

Goal: record a classification code without ever turning it into a path segment.

1. **Decide what governs the path and what stays a tag.** Library of Congress *topical headings* may govern the path at broad levels when those headings are available — they shape the *claim* (`content/library/README.md`). The classification *code* (a UDC number, an LCC mark) is a different thing: an attestation the document asserts about itself, a morphism it offers into the scheme's category. The heading belongs to the term; the code belongs to the hom-set as an arrow.
2. **Never make a code a directory.** A UDC or LCC code is an arrow, and an arrow is not a container. Collapsing it into a path segment re-commits the object-oriented error in its most seductive form — turning a good standard taxonomy into a single forced home — and it breaks the round-trip, since the code is not the encoding of the topical term.
3. **Attach the code as an inline frontmatter tag.** Tags are inline YAML kebab-case slugs for key topics actually mentioned in the file, not redundant restatements of the path (`content/library/README.md`). Record the classification code in this same `tags` array. Do not repeat a facet that is already a path segment as a tag.
4. **Apply it with `update-frontmatter`.** Run `update-frontmatter` to write or amend the `tags` field. Keep the array inline and sorted, and keep the codes alongside the mentioned-topic slugs — they are the same kind of thing: arrows the document offers, not walls it sits behind.
5. **Audit canonicality.** A frontmatter record is canonical when its tags are mentioned-topic slugs (not path echoes), its classification codes are present as tags, and the date fields are preserved when meaningful. Remove frontmatter that only records prior AI taxonomization attempts or obsolete source-system bookkeeping, unless it is needed for provenance.

## Recipe 3 — Route intake through `_triage` and `archive`

Goal: hold material that has not yet reached its classification fixed point without pretending it is canonical. Both `triage/` and a topic's `archive/` are fibers over the same base whose section has not yet settled — not a second truth, just an un-canonicalized projection.

1. **Land undecided intake in dated triage.** New material whose categorization is undecided goes under `content/triage/YYYY/MM/DD/` — intake awaiting a decision. Do not force a classification you have not earned; an un-settled section belongs in the fiber, not in `library/`.
2. **Use `prepare-triage-promotion` to inspect a triage item.** Before moving anything out of triage, run `prepare-triage-promotion` on it to see the candidate destination and the work the promotion implies. Then `read-file` the item itself — the indicated file, not its neighbors.
3. **First placement is into a topic's `archive/`, never straight into `library/`.** Source-dump notes, old notes, conflicting notes, and unmerged material go under the relevant topic's `archive/` (legacy `_archive/` residue likewise) until a human or explicit task promotes them. Do not promote into `library/` merely because a topical home is *known* — knowing the home is not the same as the section having settled.
4. **Resolve filename collisions on move.** When moving into a destination `archive/` that already holds the incoming filename, suffix the incoming file — `name-2.md` or `name-2026-06-08.md`. Never overwrite, and never skip the move (`content/library/README.md`).
5. **Promote to `library/` only on settling.** Material moves from `archive/` into `library/` when it has been intentionally organized and its classification has settled — when it folds through articulate → predicate → posit → settle to a fixed point without dropping any predecessor stage's designated cells (`settlementFiltration` in `lib/relating/src/articulating/predicating/positing/settling/filtration.mts` is monotone: no stage drops cells its predecessor designated). Promotion is the section reaching its fixed point, not a convenience.
6. **Handle `_index.md` carefully.** Never delete an `_index.md` by filename alone — inspect it with `read-file`. Remove it only if it is empty or a pure navigation shell. If it carries substantive prose or meaningful metadata, preserve that content by renaming it to a normal slug file (`topic/topic.md`) under the relevant topical `archive/`.

## Recipe 4 — Let a fiber birth a subnode

Goal: grow the recursive `topic/content/topic/content` shape exactly when the content has earned it, never to satisfy a schema.

1. **Watch the fiber enrich.** Each `topic/` node is a representable presheaf `𝒴(A) = Hom(−, A)`; its `library/` holds the promoted body the claim births. A subnode is justified only when a narrower topic accumulates "enough internal structure to deserve its own branch" (`content/library/README.md`). Run `inspect-topic` on the branch to see how much it actually carries.
2. **Do not manufacture depth.** Add a deeper `library/` branch only when the narrower topic has earned it. You never create depth to normalize a tree shape; the unfolding is governed by content, not by a schema imposed in advance.
3. **Create the subnode at its canonical path.** Apply Recipe 1 to the narrower claim: name the new `topic/` segment as a claim, verify the `address`/`termOf` round-trip, and place it under the parent's `library/`. The new segment is one more conjunct of recognition — `recognize_child = recognize_parent ∧ local`.
4. **Move the qualifying material down.** Relocate the documents that motivated the branch into the new subnode (its `library/` if settled, its `archive/` if not), suffixing on any filename collision per Recipe 3.
5. **Honor Yoneda logging directionality.** Record a run or edge only at its codomain, so each node's log accumulates exactly its arrows-in — "the run is recorded only at the codomain." Do not log an operation at its domain. A node's history is its incoming hom-set materialized; logging at the origin would falsify the embedding.
6. **Re-derive views, do not duplicate the store.** Every derived fact — distance, centrality, the fibration grid, role-fiber and domain-section views — comes from the one honest `(domain, role)` coordinate parsed off each node, projected to JSON/Turtle/HTML without reshaping the store. A new view is a new namespace entry over the same coordinate, never a new core data model.

## Recipe 5 — Drive the whole pass with the research engine bins

Goal: do the above without hand-rolling filesystem walks or manifest parsing. The bins are package-bin transport projections; each is a `package.json#bin` script you invoke over `application/eavt+jsonl`.

1. **Survey with `list-path`.** Enumerate a branch's children to see the existing hom-set before you move anything.
2. **Inspect with `inspect-topic`.** Check whether a branch already recognizes your material and how enriched its fiber is — this is your stand-in for `classify`/`entails` over the topical tree.
3. **Search with `grep-text`.** Find where a topic is actually mentioned across the corpus when you do not yet know the home, or to confirm a candidate tag names a topic the file really discusses.
4. **Read with `read-file`.** Always open the indicated file itself before classifying it. One named file read beats ten skimmed around it.
5. **Plan with `plan-normalization`.** Before a multi-file pass, run `plan-normalization` to get the ordered set of moves and metadata repairs. Organize directories first, metadata second — the plan reflects that order.
6. **Write metadata with `update-frontmatter`.** After a branch is findable, normalize `title`, `description`, preserved `date-created`/`date-modified`, and the inline sorted kebab-case `tags` (mentioned-topic slugs plus UDC/LCC codes as tags). This is the last step, not the first.

## Closing checks

Before you consider a node organized, confirm each of the following:

- The path round-trips: `address(root, term, type)` produces it and `termOf(root, path)` recovers the term.
- Every segment names a topical claim; no provenance, date, or session names appear as segments.
- The home is the deepest topic that recognizes the document, with every shallower topic also recognizing it.
- UDC/LCC codes appear only as inline frontmatter tags, never as directories.
- Un-settled material sits in `triage/YYYY/MM/DD/` or a topic's `archive/`, not in `library/`.
- Subnodes exist only where a fiber earned a branch; runs are logged at the codomain.

The categorical tree is the durable composition of its morphisms. Filing is
inhabiting a type by traversal, and a correctly placed node is a proof that the
document carries the type its complete path asserts.

## Earlier material

The tree is not the truth — the morphisms are. Filing is inhabiting a type by traversal, and a correctly placed node is a proof that the document carries the type its path asserts.
