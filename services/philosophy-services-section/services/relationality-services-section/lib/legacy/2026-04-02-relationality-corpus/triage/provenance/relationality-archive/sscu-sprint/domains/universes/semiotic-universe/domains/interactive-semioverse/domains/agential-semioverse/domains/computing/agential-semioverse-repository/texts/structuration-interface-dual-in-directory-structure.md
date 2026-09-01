---

name: structuration-interface-dual-in-directory-structure
date-created: 2026-03-09T00:00:00
keywords:
  - structuration-interface-dual
  - directory-organization
  - agential-semioverse
description: "Analysis of how the structuration-interface dual from semiotic-endeavor theory informs the directory organization of an agential semioverse repository."
part-of: mathematics/objects/universes/agential-semioverse/specifications/agential-semioverse-repository
---

The structuration-interface dual (defined in semiotic-endeavor) shows
a recurring pattern: things have an internal face (what they are on
their own terms) and an external face (how they meet the world). Method
and practice. Theory and specification. Repository and interaction
surface. Project and operation.

This text analyzes how that dual should inform the directory structure
of an agential semioverse repository.

## The problem with specifications/

The repository previously treated specifications as a content type —
a category of Thing that lives in `specifications/` directories.
Semiotic-markdown was a specification-Thing. Semiotic-versioning was a
specification-Thing. This created a parallel namespace: the conceptual
content lived in one place (concepts/, theory/) and its normative
requirements lived in another (specifications/).

But this split is the structuration-interface dual rendered as a
directory split — and rendered badly. The dual is a property of each
Thing, not a property of a directory. Every Thing has a structuration
face and an interface face. Splitting them into separate directories
makes it harder to see the whole Thing.

## Specification as practice face

The resolution: a specification is the practice face of a Thing. It
lives inside the Thing's directory at `practices/specification.md`.
The Thing's index.md is the structuration face (what it IS); the
specification is the interface face (what implementations MUST DO).

This is not merely organizational. It changes what it means to write
a specification. Under the old model, writing a specification was
creating a new Thing. Under the new model, writing a specification is
developing an existing Thing — adding its practice face. The Thing
comes first; the specification emerges when the Thing matures enough
to need normative requirements.

This progression is natural: you develop a concept, then you develop
its vocabulary, then you write about it, then you specify what
conformance to it requires. The specification is the last stage of
a Thing's development, not a parallel creation.

## Directory types as dual-encoded

The standard cross-cutting subdirectories split into two realms:

**Structuration (internal, self-organized):**
- `terms/` — the vocabulary
- `concepts/` — the ideas
- `methods/` — how knowledge is produced
- `standards/` — conventions used or created

**Interface (external, world-meeting):**
- `practices/` — concrete doing, including conformance requirements
- `skills/` — codified capabilities
- `research/` — knowledge intake from external sources
- `learning/` — knowledge output as accessible exposition

`texts/` spans both realms — some texts analyze (structuration), some
expose (interface). It remains as a default for content that does not
clearly belong to research/ or learning/.

## The created-here principle

Standards (conventions) created within a Thing go under that Thing's
`standards/` directory, not under the discipline they would
conventionally belong to. Semiotic-markdown is a standard created by
the agential semioverse, so it lives at
`agential-semioverse/standards/semiotic-markdown/`.

This follows the core placement principle (files go with the most
specific Thing they relate to) applied to created Things. The most
specific Thing that semiotic-markdown relates to is the agential
semioverse — which is what enables its creation.

The same principle places neuroreflexivity under relationality rather
than under psychology: it is derived from relationality, and that
derivational relationship is more specific than its disciplinary
category.

Conventions adopted from outside (like github-flavored-markdown, if
documented) go under their conventional discipline because the most
specific Thing they relate to is the external Thing they describe.

## Implications for the three-level naming convention

Decision 0005 established three naming levels: term (the thing itself),
semiotic-term (the convention), semiotic-term-specification (the
conformance requirements). The third level was a separate Thing.

Under the new model, the third level collapses into
`practices/specification.md` within the semiotic-term directory. The
three levels become:

1. **term** — the thing itself (e.g., `terms/specification.md`)
2. **semiotic-term** — the convention (e.g., `standards/semiotic-specification/index.md`)
3. **practices/specification.md** — conformance requirements, inside the semiotic-term directory

The naming convention still has three levels, but the third level is
a file within the second level's directory, not a separate Thing.

## The self-reference problem

The specification-specification — the convention governing how
specifications are written — presents a self-reference: where does the
Thing "specification" live, and what governs its own
practices/specification.md?

Specification is a concept within technology (it is a practice of
encoding normative requirements). The specification-specification is
the practice document for that concept. So:
`technology/concepts/specification/practices/specification.md` — the
practice of specification, governing itself.

This is genuinely self-referential, but the self-reference is
productive: the specification-specification must conform to its own
requirements. If it cannot, the requirements are wrong. This is the
same bootstrapping property that all foundational specifications share.

## Open questions

- What is the full inventory of standard cross-cutting subdirectories
  after this revision?
- Does `texts/` survive as a directory type, or does content
  progressively migrate to research/, learning/, and other more
  specific directories?
- How do `methods/` and `practices/` relate to each other within a
  single Thing? Is `methods/` about the general approach and
  `practices/` about the concrete doing?
- Should the structuration/interface classification be encoded in
  frontmatter (e.g., `realm: structuration` or `realm: interface`)?
