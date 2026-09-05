---
title: 2026-06-09, note on the infotopology of emsenn.net content
description: "Reads emsenn.net's content kinds -> babbles, letters, glossary, papers, and bibliography -> through Obsmetrologia (“Infomaterial” at time of writing), showing the apparent circularity is genuine and that new information enters only from the author's marks and outside references."
authors: [emsenn]
date-created: 2026-06-09
type: note
science-owner: knowledge-systems-services-section
keywords: ["infomaterial", "infotopology", "emsenn-net", "content"]
---

# Note on the infotopology of emsenn.net content

This is a first interpretation from Infomaterial, not from the site's implementation.
The question is what relational mathematics would describe a site whose main content
kinds are:

- babbles: rambling posts, derived from posts and bibliography;
- letters: more formal newsletter posts, derived from posts and bibliography;
- glossary: terms, topics, and concepts, derived from the language of posts;
- papers: formal proofs or arguments for the glossary, derived from posts and bibliography;
- bibliography: external references.

The apparent circularity is the point. Posts generate the language by which the
glossary is found. The glossary gives predicates by which posts can be read. Papers
stabilize parts of the glossary. Bibliography supplies external marks that can change
how posts, glossary terms, and papers settle. The only genuinely new information comes
from two places: me, writing another mark into the corpus, and references I introduce
from outside the corpus.

## Infomaterial reading

Infomaterial starts with a very thin primitive: a mark has a finite surface string,
but the surface string is not identity. Identity is downstream role. A mark may stand
in token position or claim position. From there, an utterance is a token/claim pair,
and predicating turns the pair into a predication cell:

```text
phi = (subject, predicate, object)
```

That makes the site's content system less like a set of folders and more like a
field of possible assertions. A post is not only a document. It is also a source of
utterances that seed predication cells. A bibliography item is not only metadata
about an external work. It is a mark introduced from outside, able to stand as an
entity, predicate, object, warrant, contrast, or source of pressure on existing cells.

Infomaterial's positing step assigns each predication cell a four-valued charge:

- no evidence either way;
- evidence for;
- evidence against;
- evidence both ways.

For emsenn.net this is useful because the site is not trying to publish only final
truth. It wants to preserve rambling, contradiction, citation, clarification, and
formalization as stages of one relational process. A babble can leave a cell
undercharged or contradictory. A letter can organize charges enough to be socially
legible. A paper can try to settle a cluster of cells into a fixed point. A glossary
term is not "true" merely because it has a page; it has a standing in a valuation over
the site's predication cells.

## Content state

Let the content state be a valuation over predication cells generated from the site:

```text
V : PredicationCell -> Charge
```

The base predication cells come from marks extracted from posts and references. A
minimal cell has a subject, predicate, and object. Examples, schematically:

```text
(babble-2025-08-22, uses-term, babble)
(letter-2020-10-20, cites, The Future is Indigenous)
(term-infotopology, elaborated-by, paper-on-infotopology)
(reference-r, supports, glossary-term-g)
```

These examples should not be mistaken for fixed schema. They are a first handle on
the shape: each content artifact can be both a subject and an object, and terms from
the artifact language can become predicates.

The five named content kinds are then not five independent databases. They are
different derived views over the same charged predication field:

- **Bibliography** is the boundary through which external marks enter. A reference is
  a source mark plus enough relation to say how it enters: cites, supports, contests,
  names, exemplifies, borrows language from, and so on.
- **Babbles** are exploratory sections of the field. They introduce marks and
  predicates with weak or unstable standing. They are allowed to carry unresolved
  charge.
- **Letters** are socially addressed settlements of the field. They select from posts
  and bibliography, organize the claims, and present a coherent enough section for
  readers.
- **Glossary** is the term extraction and stabilization layer. It names recurring
  marks and predicates from posts, then treats those terms as entities that can be
  related, refined, contradicted, and re-used.
- **Papers** are proof-oriented closures over glossary regions. They do not merely
  explain terms; they attempt to derive the standing of terms and their relations
  from posts plus bibliography.

## The circularity as closure

The circularity can be modeled as a monotone endomap on content state:

```text
F : ContentState -> ContentState
```

Given a state, `F` performs the derivations the site promises:

```text
posts + bibliography -> babbles
posts + bibliography -> letters
posts language        -> glossary
posts + bibliography -> papers
glossary + papers     -> refined readings of posts
papers + bibliography -> refined glossary
```

This is circular only if these arrows are expected to be a one-pass construction.
Infomaterial suggests a better reading: this is settling. The state begins at a
knowledge-least valuation, accepts deltas from writing and references, then iterates
closure until the currently available material reaches a fixed point.

The fixed point is local, not final. If I write another post or introduce another
reference, the base changes. A new delta enters. The valuation climbs again. The
important requirement is monotonicity in the knowledge order: new material may add
evidence for, evidence against, or evidence both ways, but it should not pretend the
prior derivation never existed.

So the system is not:

```text
babbles -> glossary -> papers -> letters
```

It is closer to:

```text
authorial delta + external reference delta
  -> predication cells
  -> charged valuation
  -> settling closure
  -> derived sections
  -> new occasions for authorial and reference deltas
```

That last arrow is not an internal derivation. It is the living boundary of the
system. The site can produce questions, gaps, and contradictions, but it cannot by
itself add the author's next act of writing or the next external reference. Those are
new information.

## The site topology

Infomaterial's site construction is especially helpful for the word "infotopology."
A site object can be read as a triple:

```text
(q, tau, U)
```

where `q` is a predicate base, `tau` is a settling stage, and `U` is a clopen region
of the local information space. Covers are fiber-local refinements: they cover a
region by subdividing it at fixed `q` and fixed `tau`. Temporal advancement is carried
by morphisms, not by covers.

For emsenn.net, this says a content view should distinguish two things:

- refining what a region currently covers;
- advancing the state through another settling step.

A glossary page that breaks a topic into subtopics is a cover-like refinement. It
says, "these local patches jointly account for this region." A new post that changes
the standing of the topic is not a cover. It is temporal or developmental movement in
the state. It should be represented as a morphism in the history of settlement, not
as if it were merely another subheading.

This matters because it keeps the site from confusing organization with progress.
Taxonomy can refine a region. Writing and citation can advance a valuation.

## Sheaves of content

In Infomaterial, the settled state can be packaged as a sheaf: local sections glue
when their overlaps agree, and in the strict finite regime the first obstruction to
gluing vanishes. In site terms, local deltas can merge without coordination when the
merge is an order-independent join.

For emsenn.net, each content kind can be treated as a sheaf-like projection from the
same underlying valuation:

- A babble section is a local section preserving exploratory charge.
- A letter section is a locally coherent selection addressed to readers.
- A glossary section is a section over named terms and their relations.
- A paper section is a section with proof obligations over a glossary region.
- A bibliography section is a section over introduced external marks and their
  relations to cells in the site.

The useful test is gluing. If two babbles use a term differently, can a glossary entry
represent both uses without erasing the contradiction? If a letter cites a reference
for a claim, can the bibliography and paper layer recover the exact predication that
reference supports? If a paper settles a definition, can older babbles remain as
historical local sections without being rewritten into false finality?

If the answer is yes, the site has sheaf-like behavior: local content remains local,
but its restrictions and overlaps determine a global reading. If the answer is no,
the system has a real obstruction, not just missing metadata.

## First formal sketch

A first formal model could use:

```text
Mark
Utterance = token Mark x claim Mark
PredicationCell = subject Entity x predicate Predicate x object Entity
Charge = {none, for, against, both}
Valuation = PredicationCell -> Charge
ContentState = {
  posts        : finite set of content marks,
  references   : finite set of external marks,
  valuation    : Valuation,
  derivations  : generated content sections
}
```

Then define generators:

```text
extractMarks       : Post -> Set Mark
extractReferences  : Post -> Set ReferenceMark
seedCells          : Mark* -> Set PredicationCell
citeCells          : ReferenceMark* -> Set PredicationCell
deriveGlossary     : ContentState -> GlossarySection
deriveBabble       : ContentState -> BabbleSection
deriveLetter       : ContentState -> LetterSection
derivePaper        : ContentState -> PaperSection
settle             : ContentState -> ContentState
```

The critical law is not that every derivation is correct on the first pass. The
critical law is that each derivation is role-respecting and monotone with respect to
knowledge: it adds standing to cells, reveals conflict, or creates a more precise
local section.

## What each content kind owes the others

Babbles owe the system marks. They are allowed to be noisy, but their language must
remain extractable enough to seed cells.

Letters owe the system addressability. They are not merely polished babbles; they are
sections prepared for social circulation, so their citations, claims, and intended
audience should be recoverable.

Glossary entries owe the system reusability. A term page should not only state a
definition; it should expose the predicates by which the term participates in the
site.

Papers owe the system closure. A paper should say which glossary region it attempts
to settle, what bibliography it uses, and what charge changes it argues for.

Bibliography owes the system ingress. A reference should not merely be listed. It
should say how an external mark entered the valuation: as support, contrast, lineage,
method, example, or unresolved pressure.

## The live boundary

The site is not autopoietic in the strong sense. It cannot fully produce itself from
itself, because the author and external references remain open boundaries. The
mathematics should preserve that.

The almost-circular diagram becomes coherent if it is read as a closure process over
a changing base:

```text
base_n = prior posts + prior references
state_n = settle(base_n)
delta_{n+1} = new writing + newly introduced references
base_{n+1} = base_n + delta_{n+1}
state_{n+1} = settle(base_{n+1})
```

The "me" in this diagram is not a node the site derives. The author is the source of
new utterances. A reference is not a node the site derives either; it is an external
mark introduced through authorial or editorial action. Once introduced, both become
available to the relational machinery.

That distinction may be the most important design rule: the system should derive as
much as it can from its own contents, but it should mark the boundary where new
information enters.
