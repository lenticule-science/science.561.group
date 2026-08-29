---
title: "An Object Is Its Arrows: Reading the Yoneda Embedding"
description: "An explanation of why a mathematical object is completely determined by the morphisms into it — the Yoneda embedding — and why that theorem, not a preference for tidiness, is what forbids classifying a document by the folder that contains it."
date-created: 2026-06-19
date-modified: 2026-06-19
keywords: ["yoneda-embedding", "yoneda-lemma", "category-theory", "presheaf", "natural-transformation", "representable-functor", "knowledge-organization", "identity"]
---

# An Object Is Its Arrows: Reading the Yoneda Embedding

This is an explanation.
It will not teach you to compute a Yoneda extension or prove the lemma; it tries to change what you reach for when you ask *what a thing is*.
The habit it works against is almost invisible because it is so deep: the habit of answering "what is this?" by looking *inside* — by opening the thing up and naming its parts, its substance, the box it came in.
The Yoneda embedding says that for an enormous range of purposes this is the wrong place to look, and that everything you could want to know about an object is already written on the *outside*, in how it relates to everything else.

## Two ways to say what a thing is

Take any object — a number, a shape, a data type, a document. There are two ways to characterize it.

The **intrinsic** way looks inward: the number 6 *is* the set `{0,1,2,3,4,5}`, or *is* `2 × 3`; this document *is* the bytes on disk in this folder. You point at the substance.

The **relational** way looks outward: 6 is the thing that 2 and 3 multiply to, that is one less than 7, that divides 12, that counts the edges of a triangle's... You never open 6 up. You list how 6 sits among other things — every arrow into it and out of it — and you claim that this list leaves nothing out.

Intuition resists the second way. Surely the list of relations is a *consequence* of what 6 intrinsically is, downstream of the real thing. The Yoneda lemma reverses exactly this intuition. It says the list of relations is not downstream of the object's identity — it **is** the object's identity, with full mathematical rigor.

## The embedding, stated plainly

In a category `C`, an object `A` comes with all the arrows pointing at it. Collect them into a single gadget: for every object `X`, the set `Hom(X, A)` of morphisms `X → A`, assembled compatibly across all `X`. This gadget is a functor, written

> 𝒴(A) = Hom(−, A)

— "the arrows into `A`, from everywhere." The map `𝒴` sending each object `A` to this bundle is the **Yoneda embedding**, and the theorem about it is two words doing heavy work: it is **full and faithful**.

*Faithful* means no two distinct arrows `A → B` collapse to the same transformation between their bundles — the passage to arrows loses nothing. *Full* means every transformation between the bundles `𝒴(A) → 𝒴(B)` comes from an actual arrow `A → B` — the passage to arrows adds nothing. Together: `A` and its bundle of incoming arrows carry *exactly* the same information. You can forget the object and keep only `Hom(−, A)`, and you have thrown nothing away and invented nothing. To say "an object is its arrows" is not poetry; it is what *full and faithful* means.

The sharper consequence is the one the corpus keeps: distinct morphisms `f, g : A → B` induce distinct natural transformations. So the arrows are not a layer of behaviour sitting on top of a prior identity that the object "really" has. There is no prior identity. The arrows are where identity lives.

## Why this is the right model for a knowledge tree

Now read the embedding onto a filesystem, and a familiar mistake becomes visible as a mistake.

The **object-oriented** reading of a directory tree is the intrinsic one. A document *lives in* a folder; the folder *is* its class; to classify is to choose the one box. The container owns the object, and the object's identity is reduced to its position — its substance, the place it sits. This is the inward look, and it fails in exactly the ways the inward look always fails. A document about both information science and category theory must be torn in two or arbitrarily shoved under one parent and made invisible under the other — because a single position cannot hold a thing whose identity is a *web* of relations. And because the container owns identity, the path of least resistance is to name the folder after where the material came from — a source repo, an ingestion date, a session — leaking provenance into a coordinate that was supposed to mean *what the thing is about*.

The **categorical** reading is the outward one, and it is the Yoneda embedding applied to filing. A document is determined by the arrows it offers and the arrows that recognize it. A classification — a UDC number, a Library of Congress mark, a subject heading — is one such arrow: a morphism the document *asserts about itself*, "I claim membership in this scheme's class." An arrow is not a container. So the classification lives in frontmatter, as a tag, never as a wall the document is filed behind. A path segment, meanwhile, is a different kind of arrow — a restriction morphism, narrowing recognition by one conjunct as you descend — and the path as a whole is the chain of those arrows the document's type inhabits. The tree on disk is one rendered projection of the hom-set, the way a shadow is a projection of a body. The shadow is real and useful; it is just not the body.

This is why the corpus can say, without contradiction, that it keeps the same directory tree and yet denies that the tree is the truth. The folder is a shadow. The morphisms are the object.

## Where the node's history has to live

The embedding even fixes *where evidence is recorded*, and this is the test that the reading is being taken seriously rather than admired.

If an object is its arrows-*in* — `Hom(−, A)`, the morphisms whose codomain is `A` — then a node's accumulated identity is precisely the incoming arrows it has gathered. So a run, an edit, an admission is logged **at its codomain**, never at its origin: the run is recorded at the node it arrives at, so that each node's log materializes exactly its hom-set. Logging at the source would record an arrow at the wrong end and falsify the embedding — it would attribute to a node a history of things it *did* rather than things that *became* it, and the embedding is about the latter. A node's past is the set of arrows that proved their way into it.

## The thing to carry away

Stop opening things up to find out what they are. For an enormous range of objects — mathematical, computational, documentary — the question "what is this?" is answered in full by "how does this relate to everything else?", and the Yoneda embedding is the guarantee that this answer omits nothing and adds nothing. An object is its arrows. A document is the classifications it offers and the restrictions that recognize it, not the folder that happens to hold its bytes. Once that inversion lands, classification stops being the act of choosing a home and becomes the act of reading off a hom-set — and the tree, demoted from truth to projection, is finally safe to keep.
