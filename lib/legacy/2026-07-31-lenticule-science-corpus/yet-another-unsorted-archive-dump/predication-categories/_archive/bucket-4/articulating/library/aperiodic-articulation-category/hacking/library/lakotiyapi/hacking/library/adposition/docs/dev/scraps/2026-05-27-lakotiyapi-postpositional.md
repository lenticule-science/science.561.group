---
title: "Computational and Formal Analyses of Lakota Postpositional Syntax"
references:
  - id: lakota-wikipedia
    type: webpage
    title: "Lakota language"
    URL: "https://en.wikipedia.org/wiki/Lakota_language"
    accessed:
      year: 2026
      month: 5
      day: 27

  - id: pustet2003
    type: article-journal
    author:
      - family: Pustet
        given: Regina
    issued:
      year: 2003
    title: "Lakota locative and directional postpositions: A cognitive-functional analysis of él and ektá"
    URL: "https://epub.ub.uni-muenchen.de/17682/"

  - id: ullrich-dissertation
    type: thesis
    author:
      - family: Ullrich
        given: Jan
    title: "New Lakota Dictionary and Lakota grammar work in Role and Reference Grammar context"
    genre: "Doctoral dissertation"
    URL: "https://rrg.caset.buffalo.edu/rrg/Ullrich.pdf"

  - id: ullrich2026-postpositions-coverbs
    type: chapter
    author:
      - family: Ullrich
        given: Jan
    issued:
      year: 2026
    title: "Lakota Postpositions and Coverbs with Postpositional Semantics: A Role and Reference Grammar Analysis"
    URL: "https://www.researchgate.net/publication/400837435_191Lakota_Postpositions_and_Coverbs_with_Postpositional_Semantics_A_Role_and_Reference_Grammar_Analysis"
    note: "Metadata should be verified against the final publication record."

  - id: coen-siouan-adpositions
    type: paper-conference
    author:
      - family: Coen
        given: Noah Michael
    title: "Adpositions in Siouan languages"
    container-title: "Proceedings of the Siouan and Caddoan Languages Conference"
    URL: "https://static1.squarespace.com/static/5a6a5557268b96c6571a2596/t/63af8bb32776dc190a7b846f/1672448947962/SCLC%2B41%2B-%2BCoen.pdf"

  - id: curtis2014-lakota-fst
    type: paper-conference
    author:
      - family: Curtis
        given: Charles
    issued:
      year: 2014
    title: "A Morphophonological Analyzer for Lakota"
    container-title: "Proceedings of the Ninth International Conference on Language Resources and Evaluation"
    URL: "https://aclanthology.org/L14-1149/"

  - id: lingo-grammar-matrix
    type: webpage
    title: "LinGO Grammar Matrix"
    publisher: "University of Washington Department of Linguistics"
    URL: "https://linguistics.washington.edu/research/projects-and-grants/lingo-grammar-matrix"
    accessed:
      year: 2026
      month: 5
      day: 27

  - id: universal-dependencies-case
    type: webpage
    title: "Universal Dependencies: case"
    publisher: "Universal Dependencies"
    URL: "https://universaldependencies.org/u/dep/case.html"
    accessed:
      year: 2026
      month: 5
      day: 27

  - id: universal-dependencies
    type: webpage
    title: "Universal Dependencies"
    publisher: "Universal Dependencies"
    URL: "https://universaldependencies.org/"
    accessed:
      year: 2026
      month: 5
      day: 27

  - id: temperley-gildea2018
    type: article-journal
    author:
      - family: Temperley
        given: David
      - family: Gildea
        given: Daniel
    issued:
      year: 2018
    title: "Minimizing syntactic dependency lengths: Typological/cognitive universal?"
    URL: "https://www.cs.rochester.edu/u/gildea/pubs/temperley-gildea-ar18.pdf"
---

# Computational and Formal Analyses of Lakota Postpositional Syntax

The short version is that Lakota postpositional syntax has been analyzed formally, but not, as far as I can tell, in a dedicated Lakota-specific computational-complexity or experimental parsing literature. The relevant work clusters into descriptive grammar, cognitive-functional semantics, Role and Reference Grammar, Siouan morphosyntax, and one explicitly computational Lakota morphology project. The construction in question is the ordinary postfix adpositional pattern, as in `thípi=kiŋ ókšaŋ`, “around the house,” where the entity phrase precedes the relational element.

## Descriptive and typological baseline

Lakota is generally described as a head-final, postpositional language: adpositional or relational material follows the nominal phrase it relates to [@lakota-wikipedia]. A minimal phrase-structure representation of the local construction is therefore:

`AdpositionalPhrase → ReferencePhrase Postposition`

This captures the entity-then-relation shape: the parser first encounters the entity, such as `thípi=kiŋ`, “the house,” and then receives the relational operator, such as `ókšaŋ`, “around.”

In this local form, the construction is computationally simple. A flat pattern like `Noun Determiner Postposition` can be recognized by finite-state means, and recursive embedding of such phrases falls naturally into context-free or feature-grammar territory. The complexity does not come from postfix order alone, but from the interaction of postpositions with Lakota morphology, enclisis, predicate structure, discourse function, and coverbal constructions.

## Cognitive-functional analysis

Regina Pustet’s work is the main cognitive-functional source on Lakota postpositions. Her analysis of `él` and `ektá` treats them not as cleanly separable one-form-one-meaning postpositions, but as semantically overlapping relational forms organized by prototype, discourse distribution, and grammaticalization history [@pustet2003]. Roughly, `él` is more locative, while `ektá` is more directional, but the opposition is not merely a dictionary contrast.

This matters for computational parsing because a parser cannot simply map each postposition to a rigid spatial relation. A cognitively realistic analysis needs lexical-semantic and discourse-sensitive representations. The listener does not merely attach a postfix relation to a preceding noun phrase; they also interpret the relation through prototype structure, motion/location construal, and discourse context.

## Role and Reference Grammar

The most directly relevant formal-syntactic framework applied to Lakota is Role and Reference Grammar. Jan Ullrich’s dissertation applies Role and Reference Grammar to Lakota syntax, especially secondary predication and complex verbal constructions [@ullrich-dissertation]. More directly, Ullrich’s chapter on Lakota postpositions and coverbs argues that not every item with postpositional semantics belongs to the same morphosyntactic class [@ullrich2026-postpositions-coverbs].

The key point is that some Lakota forms that translate like English adpositions behave as true postpositions, while others are better analyzed as coverbs with postpositional semantics [@ullrich2026-postpositions-coverbs]. That changes the computational analysis. A naïve parser might treat every English-like “in,” “at,” “on,” “with,” or “around” gloss as an adposition. A Role and Reference Grammar analysis instead requires the parser to decide whether the relational element closes an adpositional phrase or contributes to predicate structure.

So the computational operation is not always:

`ReferencePhrase + Postposition → AdpositionalPhrase`

Sometimes it may be closer to:

`ReferencePhrase + CoverbalRelator → ComplexPredicateStructure`

This makes the parsing problem more syntactic-semantic than purely positional. The postfix order is easy; the category decision is harder.

## Siouan morphosyntax and adpositional packaging

Noah Michael Coen’s broader Siouan work treats adpositions as morphosyntactically variable objects: they may occur as independent postpositions, compounding elements, enclitic-like elements, or constructions related to applicative morphology [@coen-siouan-adpositions]. This is important because it prevents the analysis from treating “postposition” as one uniform computational object.

For Lakota-style syntax, the question becomes: what kind of packaging is this token using? Is the relation expressed by an independent postposition, a bound or enclitic-like element, a compound, or a predicate-like relational form? From a computational grammar perspective, these alternatives require different lexical entries and different attachment rules, even when the English glosses look similar.

## Computational grammar and finite-state morphology

The main explicitly computational Lakota work I found is Charles Curtis’s morphophonological analyzer, which uses finite-state methods to model Lakota morphology and connect it to a precision grammar derived from the LinGO Grammar Matrix [@curtis2014-lakota-fst; @lingo-grammar-matrix]. The LinGO Grammar Matrix is based in Head-driven Phrase Structure Grammar and is designed for implemented grammars that map strings to semantic representations [@lingo-grammar-matrix].

This work is relevant because it shows Lakota being brought into a computational grammar-engineering environment. However, the published emphasis is morphophonology and verbal morphology, not a dedicated computational treatment of postpositional syntax [@curtis2014-lakota-fst]. So it should be cited as evidence for computational Lakota grammar work generally, not as evidence that Lakota postpositions themselves have already been given a full implemented parsing analysis.

A plausible implemented architecture would therefore be layered:

1. finite-state morphology for wordform analysis;
2. lexical entries distinguishing true postpositions from coverbs with postpositional semantics;
3. feature-structure or Role and Reference Grammar-style syntax-semantics mapping;
4. discourse-sensitive semantics for forms whose distribution is prototype-based.

## Universal Dependencies as a possible computational annotation model

Universal Dependencies provides a cross-linguistic dependency annotation framework in which adpositions, including postpositions, are typically attached to the nominal they mark with the `case` relation [@universal-dependencies-case]. Under a simple Universal Dependencies-style analysis, `thípi=kiŋ ókšaŋ` would likely treat `thípi` as the nominal head, `kiŋ` as a determiner or determiner-like dependent, and `ókšaŋ` as a case/adpositional dependent.

But this would only be appropriate for true postpositions. If Ullrich’s coverb analysis applies to a given token, then annotating the relational element merely as `case` would flatten away predicate structure [@ullrich2026-postpositions-coverbs]. Universal Dependencies is therefore useful as a possible computational annotation framework, but it may be too shallow for Lakota relational elements that participate in complex predication.

I did not find an official Lakota Universal Dependencies treebank in the general Universal Dependencies resources [@universal-dependencies]. That means this is best understood as an available framework one could apply to Lakota, not as an already-established Lakota-specific corpus result.

## Processing characteristics and cognitive parsing

The entity-then-relation order of Lakota postpositions is a head-final parsing pattern. Incrementally, a listener first builds or buffers the reference phrase and then waits for the following relational element to determine the phrase’s relation to the clause. In `thípi=kiŋ ókšaŋ`, the listener receives “the house” before receiving “around,” so the relational role of the nominal is finalized only after the postposition arrives.

General dependency-length research suggests that head-final constructions can impose memory and prediction demands when the head or relational licenser is delayed, but those costs depend strongly on dependency length [@temperley-gildea2018]. A short local construction like `thípi=kiŋ ókšaŋ` is not computationally burdensome in itself, because the postposition immediately follows the nominal phrase. The parser does not need to hold a long unresolved dependency.

The more interesting cognitive issue is not raw memory cost but category and semantic resolution. A listener must determine whether the relational postfix is an ordinary postposition, a semantically postpositional coverb, or part of a larger predicate structure. They must also interpret spatial, directional, or discourse-sensitive meanings through Lakota-specific lexical semantics.

## Computational complexity

There is no reason to treat the local postfix adpositional pattern as computationally complex. As a local construction, it is compatible with regular or context-free recognition, depending on how much internal noun-phrase recursion is included. A toy grammar could handle the surface pattern with rules like:

`NP → N DET`

`PP → NP POSTPOSITION`

But that toy grammar is insufficient for serious Lakota analysis. A realistic parser must handle rich morphology, enclitic material, flexible word order, agreement and pronominal marking, complex predicates, and the postposition/coverb distinction. Thus, the complexity of parsing Lakota postpositional syntax is not primarily generated by the entity-then-relation order. It is generated by the broader morphosyntactic system into which that order is embedded.

## Conclusion

Lakota postfix adpositions have been analyzed descriptively, functionally, morphosyntactically, and in Role and Reference Grammar. Lakota has also been represented in computational grammar work through finite-state morphology and Grammar Matrix-style precision grammar engineering. But the specific topic of Lakota postpositional processing complexity or cognitive parsing strategies does not appear to have a dedicated experimental or formal computational-complexity literature.

The best current characterization is therefore:

Lakota postpositional constructions are locally low-complexity, head-final relational structures. Cognitively, they require the listener to hold an entity phrase until the postfix relation arrives. Computationally, they are easy to model at the shallow phrase-structure level, but become interesting when one accounts for Lakota-specific morphology, discourse-sensitive postposition semantics, and the distinction between true postpositions and coverbs with postpositional semantics.
