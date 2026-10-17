---
description: Survey of how the term-pairs "structure / object" and "transformer / morphism" are actually used in mathematical practice as of May 2026 — across mainstream category theory, structural-foundations work (Bourbaki, HoTT, univalent foundations), and applied/computational CT. Authored to ground 561's terminological choice (structures/transformers as canonical) in honest reading of the literature rather than retrofitted authority.
status: complete
session-date: 2026-05-15
topic: terminological-foundations
authorizing-prompt: user emsenn directed an immediate research focus after observing terminology drift in 561's own skill descriptions
---

## Scope and motivation

561 has chosen `structures` and `transformers` as its canonical names for what mainstream category theory typically calls `objects` and `morphisms` — see `code/structures/_index.md` and `code/transformers/_index.md`. In session 2026-05-15 the operator asked: is this 561's idiosyncratic choice, or is the mathematical mainstream itself drifting that way?

This survey reports honestly. It does not retrofit the field to validate 561; it reads the field as it is and notes where 561's choice aligns with which currents.

## Top-line finding

**Mainstream category theory in 2024–2026 still uses "object" and "morphism" as the primary vocabulary.** University courses (Cambridge CST 2024–25, Warwick MA4M6 2024, Northwestern Math 395 2025, McGill DRP 2025), nLab, the Stanford Encyclopedia (Fall 2024 edition), and recent textbooks (Riehl's *Category Theory in Context*, Leinster's *Basic Category Theory*, the Fong–Spivak *Seven Sketches* tradition) all open with "a category has objects and morphisms." No mainstream pedagogical or research source surveyed promotes `structure` and `transformer` as drop-in replacements for the primary vocabulary.

**However, there are several real currents that pull in the direction 561 has gone**, and they justify the choice on grounds other than "everyone says so." Those currents are: the Bourbaki structuralist tradition, the categorical-structuralist philosophy of mathematics, the structure-identity principle (SIP) work in HoTT / univalent foundations, and a small number of recent textbooks that foreground "structures and transformations" in their titles or framings. The user's intuition is therefore *partially* supported by the literature — not as a description of current vocabulary, but as a description of a philosophical current within current practice.

## Term-by-term findings

### "Object" in 2024–2026 mainstream CT

The standard definition is unchanged from Eilenberg and Mac Lane: a category consists of a collection of objects, a collection of morphisms between them, identity arrows, and an associative composition rule. nLab, the Stanford Encyclopedia, Wikipedia's category-theory entry, and every introductory text inspected use `object` as the primary term for the things in a category.

A widely-noted contemporary emphasis is **morphism-primacy**: "a category is characterized by its morphisms, not by its objects" — what matters about an object is the morphisms in and out of it. This is sometimes summarized as "category theory is the theory of arrows, not the theory of things." This emphasis weakens `object` as a noun-of-substance (it does not refer to anything with internal structure of its own within the category), but does not push the literature toward replacing the word.

### "Structure" as a primary term

Two distinct uses appear:

1. **Bourbaki-structuralist usage (foundational/philosophical).** Bourbaki, beginning in the 1930s, organized mathematics around "species of structure" in three basic families: algebraic, topological, order. The thesis was that mathematics studies *structures*, not *objects with intrinsic content*. Category theory grew partly out of Bourbaki's tradition (Eilenberg was peripherally associated; Grothendieck and Dieudonné's *Éléments de Géométrie Algébrique* completed the shift from "classes of structures in a universe of sets" to fully categorical language). Bourbaki himself could not articulate categories within his own species-of-structure framework — category theory **extends** structuralism beyond what Bourbaki's formalism could express. So `structure` is the older, more philosophically committed term that `object` partly displaced for working-mathematician convenience.

2. **nLab/contemporary CT usage (technical/derived).** In current CT, "structure" is a **derived** notion: objects in category D are said to "have extra structure" relative to a base category C when there is a faithful functor `p: D → C`. The classic example is `Grp → Set`: a group is a set "equipped with extra structure." Here `structure` is not a primary term naming what is in a category; it names *additional data layered on top of objects*. nLab does not treat `structure` as a synonym for `object`.

So when a 561 skill description says "structure" where mainstream CT would say "object," it is using `structure` in the older Bourbaki-structuralist sense, not in nLab's derived sense. This is coherent but should be acknowledged.

### "Transformer" — mostly not a mathematical term

The dominant 2024–2026 uses of `transformer`:

- **Machine learning** — Vaswani et al.'s attention-based architecture and everything downstream. This is by orders of magnitude the most frequent contemporary use of the word.
- **Functional programming / Haskell** — *monad transformer*, a type constructor that takes a monad to another monad in a compatible way. This is the closest "transformer" comes to mainstream math vocabulary.
- **Specialized 2002 paper** — Golubtsov and Moskaliuk's "information transformers" in a monoidal Kleisli category (arXiv:math-ph/0211067); a niche framework, not adopted broadly.
- **Recent ML-meets-CT papers** — "The Topos of Transformer Networks" and similar, but these analyze the ML object with CT tools; they do not use `transformer` as a CT word.

The standard CT word for "map between functors" is **natural transformation**, and its singular form `transformation` does appear in some pedagogical framings (the 2023 ResearchGate-hosted *Foundations of Category Theory: An Introduction to Structures, Transformations, and Applications* uses the title-level pair "structures, transformations"). But `transformer` as a synonym for `morphism` is **not present** in any source surveyed. 561's `transformer` is, on this dimension, an idiosyncratic 561 coinage.

### "Morphism" in 2024–2026 mainstream CT

`Morphism` is the universal generalization of `homomorphism` (algebra), `continuous map` (topology), `function` (sets), and so on. Recent extensions of the vocabulary (e.g., "chimera morphisms" / "heteromorphisms" / "hets" — Ellerman 2025) generalize *within* the morphism vocabulary rather than replacing it. The structure-preserving-map intuition behind `homomorphism` (Greek *homos* "same" + *morphē* "form") survives directly in `morphism`: a morphism is the thing that respects whatever structure is in play. This is precisely the structuralist content 561 wants to foreground; the word `morphism` already carries it, but in compressed, etymological form.

### HoTT and univalent foundations

The Structure Identity Principle (SIP) is the closest the literature comes to elevating "structure" to first-class status within categorical work. SIP says: for set-level structures (groups, posets, rings) definable in univalent foundations, identifications coincide with isomorphisms. A Higher Structure Identity Principle (Ahrens et al., arXiv:2004.06572) generalizes this to higher-categorical structures. There is also "Univalence and Ontic Structuralism" (arXiv:2407.14238, 2024) explicitly arguing univalence as a foundation for structuralist philosophy of mathematics.

These works do place `structure` at the center. But they still operate with the vocabulary `type` / `equivalence` / `identification` (not `object` / `morphism` / `equality` exactly — HoTT has its own primitive names), and `transformer` does not appear in them. So HoTT is a real precedent for **putting structure first**, but not for the specific word `transformer`.

## Where 561's choice lands

Mapping the survey onto 561's vocabulary:

- **`structure` as the canonical term for entity-form** — *partially supported* by mainstream usage, *strongly supported* by Bourbaki structuralism and the HoTT/SIP tradition. Coherent and defensible, but should be acknowledged as a structuralist commitment rather than a neutral terminological choice.
- **`transformer` as the canonical term for typed relation between forms** — *not supported* by mainstream usage. The Bourbaki and HoTT traditions do not use it. 561's `transformer` is a 561 coinage. It overlaps semantically with `morphism` / `natural transformation` / `homomorphism` but is not a translation of any specific standard term.
- **The user's claim that "objects are a category of structure and morphisms a category of transformer"** — this is a defensible move *if* "category of structure" is read as "instance under the genus of structure," i.e., an object in mainstream CT is a particular kind of structure in the Bourbaki sense. This reading aligns with categorical-structuralism, but it is *not* what mainstream CT 2026 says.

## What this means for 561's skill descriptions

The terminology drift the operator observed in `doing/working/hacking/doing/working/skills/` (object/morphism appearing where structure/transformer is canonical) is real and worth fixing, but the fix is *not* mechanical search-and-replace. The reasons:

1. Some skill files (e.g., `applying-predication-theory-cross-domain`, `recording-a-progress-cell`) use `object` in the SPO-cell sense — that is the linguistic / RDF triple-position, unrelated to CT objecthood. Those uses are correct.
2. Some skill files reference literal directories `theories/.../objects/` and `theories/.../morphisms/`. Renaming the *words* in those skills without renaming the *directories* would create broken references. Whether those directories should themselves be renamed to `structures/` and `transformers/` is a separate, larger decision; this survey does not recommend it (the `theories/` tree is, per `CLAUDE.md`, an AI-cruft informant layer, and reorganizing it may not be worth the effort).
3. The math-teaching skills (`learning-category-theory`, `learning-infinity-categories`, `learning-enriched-categories`, `checking-enrichment-data`) need a deeper rewrite if 561 wants them to teach the math in 561 vocabulary. The proper framing is: "category theory's primary vocabulary is *object* and *morphism*; 561 names these *structure* and *transformer* because (Bourbaki / SIP / structuralist reasons); the rest of this skill uses 561 vocabulary, with the standard equivalents named once at the top."

A clean approach is therefore: (a) fix the clear-leak cases in 561-polity contexts to use structures/transformers, (b) preface math-teaching skills with an explicit translation note rather than rewriting their internals, (c) leave SPO/JSON/proper-name uses of "object" alone, (d) defer the question of renaming `theories/.../objects/` and `theories/.../morphisms/` directories.

## Sources

Mainstream pedagogy and reference:
- [Category Theory (Stanford Encyclopedia of Philosophy, Fall 2024 edition)](https://plato.stanford.edu/archives/fall2024/entries/category-theory/)
- [nLab: structure](https://ncatlab.org/nlab/show/structure)
- [nLab: homomorphism](https://ncatlab.org/nlab/show/homomorphism)
- [nLab: monad transformer](https://ncatlab.org/nlab/show/monad+transformer)
- [Cambridge Category Theory course 2024–25](https://www.cl.cam.ac.uk/teaching/2425/CAT/)
- [Warwick MA4M6 Category Theory 2024](https://courses.warwick.ac.uk/modules/2024/MA4M6-15)
- [Northwestern Math 395 lecture notes 2025](https://bpb-us-w2.wpmucdn.com/voices.uchicago.edu/dist/c/4310/files/2025/09/lecture-notes-category-theory.pdf)
- [Riehl, *Category Theory in Context*](https://emilyriehl.github.io/files/context.pdf)
- [Leinster, *Basic Category Theory*](https://arxiv.org/pdf/1612.09375)
- [Introduction to Category Theory (McGill DRP 2025)](https://www.math.mcgill.ca/gsams/drp/papers/papers2025/Report8.pdf)

Bourbaki and categorical structuralism:
- [Bourbaki, Structuralism, and Categories — CMS Notes](https://notes.math.ca/en/article/bourbaki-structuralism-and-categories/)
- [Bell, *Reflections on Bourbaki's Notion of "Structure" and Categories*](https://publish.uwo.ca/~jbell/baki.pdf)
- [Marquis, *Forms of Structuralism: Bourbaki and the Philosophers*](https://philarchive.org/archive/MARFOS-4)
- [Palmgren, *Category Theory and Structuralism*](https://www2.math.uu.se/~palmgren/CTS-fulltext.pdf)
- [Corry, *Nicolas Bourbaki and the Concept of Mathematical Structure*](https://www.tau.ac.il/~corry/publications/articles/pdf/bourbaki-structures-synthese.pdf)

HoTT and Structure Identity Principle:
- [The HoTT Book](https://homotopytypetheory.org/book/)
- [Ahrens et al., *A Higher Structure Identity Principle* (arXiv:2004.06572)](https://arxiv.org/pdf/2004.06572)
- [Shulman, *Identity, Indiscernibility, and Univalence*](https://home.sandiego.edu/~shulman/papers/hsip-birmingham.pdf)
- [*Univalence and Ontic Structuralism* (arXiv:2407.14238, 2024)](https://arxiv.org/pdf/2407.14238)
- [1Lab: Structure Identity Principle](https://1lab.dev/1Lab.Univalence.SIP.html)

Morphism / natural transformation:
- [Wikipedia: Morphism](https://en.wikipedia.org/wiki/Morphism)
- [Wikipedia: Natural transformation](https://en.wikipedia.org/wiki/Natural_transformation)
- [Wikipedia: Homomorphism](https://en.wikipedia.org/wiki/Homomorphism)
- [Ellerman, *Chimera Morphisms and Adjoint Functors* (2025)](https://www.mdpi.com/2673-9321/5/1/10)

"Transformer" in mathematical / categorical contexts:
- [Golubtsov & Moskaliuk, *Method of Additional Structures on the Objects of a Monoidal Kleisli Category as a Background for Information Transformers Theory* (arXiv:math-ph/0211067)](https://arxiv.org/abs/math-ph/0211067)
- [*Foundations of Category Theory: An Introduction to Structures, Transformations, and Applications* (ResearchGate, 2023)](https://www.researchgate.net/publication/374334134_FOUNDATIONS_OF_CATEGORY_THEORY_AN_INTRODUCTION_TO_STRUCTURES_TRANSFORMATIONS_AND_APPLICATIONS)

Applied / topos-theoretic CT:
- [*Category-Theoretical and Topos-Theoretical Frameworks in Machine Learning: A Survey*](https://www.mdpi.com/2075-1680/14/3/204)
- [*A Brief Introduction to Category Theory for Systems and Information* (OMG, September 2024)](https://www.omg.org/maths/September-2024-Mathsig-Presentation-to-the-AI-PTF.pdf)
