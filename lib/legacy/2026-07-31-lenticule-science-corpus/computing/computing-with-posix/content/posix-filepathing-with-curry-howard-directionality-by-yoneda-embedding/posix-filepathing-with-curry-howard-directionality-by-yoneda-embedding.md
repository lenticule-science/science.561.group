---
title: POSIX Filepathing with Curry–Howard Directionality by Yoneda Embedding
description: A node landing page for reading a POSIX filepath as a typed term and proof coordinate, where directory descent is restriction/entailment (Curry–Howard) and a node is determined by its morphisms (Yoneda) rather than by containment.
date-created: 2026-06-18
date-modified: 2026-06-18
keywords: ["category-theory", "curry-howard", "directionality", "diataxis", "filepath", "knowledge-organization", "library-science", "posix", "presheaf", "taxonomy", "yoneda-embedding"]
---


## What this node is

This node holds the theory and practice of reading a POSIX filepath **as a typed term — a proof of the proposition that is its type**. It collapses three ideas that the corpus already enacts in code into one claim: a path *is* a Curry–Howard proof coordinate, its segments *are* restriction/entailment morphisms, and its complete ancestor chain materially composes the node's bundle of arrows (the Yoneda embedding 𝒴(A)=Hom_C(−,A)).

The object-oriented taxonomy this node displaces treats directory names as resemblance buckets rather than earned morphisms. `content/library/README.md` forbids that filing error: "Do not flatten a source corpus into a single bucket because the source had a name." The categorical reading makes the tree proof-bearing: a directory segment is a **restriction/projection morphism**, the complete filepath is the entailment chain the term inhabits, and flattening or relocating it changes the claim and identity.

## Why it matters

This is the law every archive operation in this corpus already obeys, made explicit so it can be reasoned about and taught.

- **A path is honest or it is non-canonical.** The codec `address(root, term, type)` in `lib/relating/src/codecs/index.mts` is the one genuine morphism term ⇄ typed filepath: `termKey` canonicalizes a `JsonValue`, `sanitizeSegment` encodes each safe POSIX segment, the leaf is named for the last segment with the type as extension, and `termOf(root, path)` recovers the term. A path that does not round-trip is not a place; it is a lie about a type.
- **Descent is entailment, not nesting.** `restrict(parent, spec)` composes a child whose recognition conjoins the parent's (`recognize_child = recognize_parent ∧ local`), so "you cannot be a `json` without being a `flatfile`." `classify(resource, catalog)` returns the *deepest* projector that recognizes a resource — the most-specific true proposition — and `entails(projector)` returns its chain to the root. Filing a thing is inhabiting its type by traversal.
- **Facets are tags, never directories.** UDC, LCC, and Library-of-Congress codes are attestations the document asserts about itself — arrows it offers — recorded as inline frontmatter slugs, never path segments. LC headings may govern the *claim* (the path); the code stays a tag.
- **Un-canonicalized material is a fiber, not a second truth.** `archive/` (and legacy `_archive/`) holds source-dump, displaced, conflicting, and unmerged material under a topic; `content/triage/YYYY/MM/DD/` holds intake whose section has not yet settled to a fixed point. Neither is promoted into `library/` merely because a topical home is known.
- **The recursive `topic/content/topic/content` shape is the categorical unfolding.** Each `topic/` node carries a topical *claim* and is a representable presheaf; as its fiber enriches enough to deserve a branch, it births subnodes, and per Yoneda its log accumulates only its arrows-in (a run is recorded at the codomain).

The same law is restated, by restriction, in the sibling kernels: `lib/animating` evaluates the fibration at the base of agency (`becoming` settles a `SettlementFiltration` into an `AgentCell`; the four charges absurd/potential/active/stable come from relating's bilattice, never hand-rolled — see `lib/animating/src/becoming/doing/algebra/charge-boundary.mts`), and `lib/communicating` evaluates it at the base of language (`communicate`/`admitCommunication` lift a string to a carrier wrapping relating's `UtteranceCarrier`; `read()` in `lib/communicating/src/holography/index.mts` is the headline endomorphism layering parse, roles, grammaticality, cohomology, and reference over one settled parse).

## The four Diátaxis documents

- **Explanations** — [`docs/explanations`](docs/explanations) — the understanding-oriented treatment: why containment is the wrong model, how the Yoneda embedding and Curry–Howard(-Lambek-Hoare) correspondence make a path a proof, and how `Projector<T>`, `restrict`, `entails`, and `classify` realize the restriction lattice path → object → attribute → file → flatfile → serialization → json → jsonl → eavt.
- **Tutorials** — [`docs/tutorials`](docs/tutorials) — the learning-oriented walkthrough: round-trip a term through `address`/`termOf`, watch a segment become an entailment edge, and read off the deepest recognizing projector for a sample resource.
- **Guides** — [`docs/guides`](docs/guides) — the task-oriented procedures: place a new node at its canonical path, attach UDC/LCC as tags rather than directories, route intake through `triage/` and `archive/` to `library/`, and resolve filename collisions on move.
- **References** — [`docs/references`](docs/references) — the information-oriented specification: the codec functions (`termKey`, `sanitizeSegment`, `address`, `termOf`, `pathProjector`, `POSIX_PATHNAME_PATTERN`), the holography API, the normalization rules, and the glossary of terms (Yoneda embedding, path-as-term, restrict/entails/classify, the bilattice FOUR, fibration fiber/section).

## Orientation

Start at **Explanations** for the *why*, move to **Tutorials** to see the codec round-trip in your hands, consult **Guides** when filing real material, and keep **References** open for the exact symbol surface. The canonical kernel lives at `lib/relating/src/holography/index.mts` and `lib/relating/src/codecs/index.mts`; the filing discipline lives at `content/library/README.md`. The categorical tree is the durable, operational composition of its morphisms.
