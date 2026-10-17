---
title: "Alice as a paracosmic stress test: local laws, unstable observations, and reproducibility"
date-created: 2026-10-17
type: note
status: research-model
authors: [OpenAI ChatGPT-Web]
keywords: [paracosm, alice, lewis-carroll, modal-semantics, reproducibility, observations, worldbuilding, four-valued-logic]
description: "A primary-text-based Wonderland and Looking-Glass case study of the existing paracosm theory, separating witnessed fiction, candidate models, finite deductions and unproved categorical claims."
---

# Alice as a paracosmic stress test

## Scientific question and owning theory

Can the 561 Group's **existing** paracosm theory reproduce distinct observations of Lewis Carroll's Wonderland and Looking-Glass worlds without inventing a universal clock, deleting disagreement, or treating an author's deliberately unresolved narrative as a continuity defect?

**Answer as of 2026-10-17:** A *scoped finite observational model* can preserve these features, subject to the stated observations. This is a constructive research proposal and a hand-checked counterexample to one overstrong projection, **not** a proof of the categorical Reproducible Paracosm Theorem, a complete encoding of the books, or an accepted runtime realization.

This work extends, rather than replaces, the section's [RPS v0.1](../../specifications/reproducible-paracosm-specification.md), [content schema v0.2](../../specifications/paracosm-content-schema.md), [relational worlding grammar](../../guides/relational-worlding-grammar.md), [praxonic worldbuilding](../../guides/praxonic-worldbuilding-guide.md), and [epic paracosms study](../2026/09/28/2026-09-28-note-on-the-science-of-epic-paracosms.md). The distinction between *paracosm* (sustained imaginative activity) and *secondary world* (the articulated world artifact) remains in force. The study does not claim that Carroll knowingly used these formalisms or that fiction supplies empirical evidence about natural physics.

**Original fictional sources.** Lewis Carroll, *Alice's Adventures in Wonderland* (1865), Project Gutenberg [eBook 11](https://www.gutenberg.org/ebooks/11), chapters V–VII and XII; Lewis Carroll, *Through the Looking-Glass* (1871), Project Gutenberg [eBook 12](https://www.gutenberg.org/ebooks/12), chapters II, V, VI and XII. These are separate texts and source editions. Passage locators in the table below are citations to narrative events, not proof of a mathematical model. The books are public-domain in the United States; the source text and our interpretive claims retain separate attribution.

## 1. Source-bound observations, not invented laws

| Source locus | Observed narrative event or utterance | Candidate paracosmic distinction | Status |
| --- | --- | --- | --- |
| *Wonderland* V, Caterpillar | Alice reports changes of size and difficulty recognizing herself or reproducing familiar verses. | Persistent identity may coexist with changing bodily measurements and language performance. Do not infer that identity *equals* height. | Text-bound reading; model proposed |
| *Wonderland* VI, Cheshire Cat | The body vanishes while the grin remains visible for a time. | A grin-observable need not be a function of the body-visible observable. Part-whole rules are locally qualified. | Text-bound reading; finite lemma below |
| *Wonderland* VII, Hatter | The Hatter says Time is a person offended by him, and tea remains at six o'clock. | Event succession and local clock-reading are different typed relations; the Hatter's explanation is testimony, not automatically a proved global cosmological law. | Text-bound testimony; model proposed |
| *Wonderland* VIII/XII, Queen and court | Authority threatens executions; at trial the Queen demands sentence before verdict. | An authoritative speech act, its claimed legal ordering, and executed consequences require different evidence. | Text-bound utterances; institutional hypothesis |
| *Wonderland* XII, waking | Alice wakes; the narration and her sister revisit the dream. | Diegetic and framing-world truth have different contexts. Waking does not retroactively delete events *within* the dream interpretation. | Text-bound frame transition |
| *Looking-Glass* II, Red Queen | Alice runs and remains by the same tree. | Relative position in a moving reference frame may fail to change despite positive effort. Any coordinate equation is a modeling choice, not given directly by the book. | Text-bound reading; mathematical model proposed |
| *Looking-Glass* V, White Queen | She claims to remember events yet to occur, and describes punishment, trial and crime in reversed order. | Speaker-relative memory assertions and event-order assertions must not be collapsed into settled chronology. | Text-bound testimony; truth unsettled |
| *Looking-Glass* VI, Humpty Dumpty | He asserts authority over his words' meanings; Alice disputes his usage. | Speaker- and context-indexed lexicons; an utterance is not a universal semantic rewrite just because a character demands it. | Text-bound dialogue; model proposed |
| *Looking-Glass* XII, "Which Dreamed it?" | The narrative leaves the dreamer's identity open. | Preserve competing possible interpretations and unknowns; a single mandatory resolved ending would erase an observable feature. | Text-bound openness; model proposed |

**Negative control:** none of the rows alone establishes that real-world physics is violated, that the Queen's proclamations were enforced, that Time literally has a body, or that the story's contradictory voices are contradictory *world facts*. They support hypotheses about how to **represent the text**.

## 2. A minimal source-indexed model

Use the existing paracosm signature and flatfile claim model. For this study let an episode record be

\[
 e=(\text{work},\text{chapter},\text{span},\text{canon},\text{locale},\text{speaker},\text{event},\text{claim},\text{polarity},\text{observation}).
\]

A claim identifies a typed subject, predicate, object, source, interpretation context and source revision. Do not key contradictory values only by a filename or natural-language string. Interpretive status is separate from whether the fiction explicitly *reports* the utterance.

Let \(E_c\) be the events admitted to one named canon \(c\). An event order \(\prec_c\) can be a **partial** order. A narrated sequence \(d_c:E_c\rightarrow\mathbb{N}\) orders presentation; it need not preserve causal ordering. A local clock \(\tau_r:E_{c,r}\rightarrow T_r\) maps events in region \(r\) to clock readings; it need not be injective or a global order embedding. An actor's knowledge accessibility \(K_a\) is a relation over annotated state alternatives, not initially assumed to be an exact, colimit-preserving endofunctor. These are candidate *data sorts and relations* to refine in Obsmetrologia, not a completed formalization.

**Tea-time example.** Take two distinguishable dialogue events \(e_1\prec_c e_2\) at the Hatter's table and set \(\tau_{\mathrm{tea}}(e_1)=\tau_{\mathrm{tea}}(e_2)=18{:}00\). Both assertions are simultaneously satisfiable. If a consumer assumes that \(\tau_{\mathrm{tea}}\) strictly increases with every event, it rejects a model admitted by the literary evidence. That is a failure of the **consumer's extra assumption**, not a demonstrated contradiction in the story.

**Relational-motion example.** Let \(x_A(e)\) be Alice's position in one coordinate and \(x_F(e)\) the coordinate of a moving frame. The relative observable \(x_A(e)-x_F(e)\) can be constant while both coordinates change. The scene does not identify a unique reference frame or governing motion equation. The point is *underdetermination*: more than one dynamics can realize the same observation.

**Claim-scoping example.** "Humpty Dumpty uses 'glory' with meaning X" and "Alice rejects meaning X for 'glory'" are compatible facts about two speakers' uses. Only explicitly opposed positive/negative evidence for the *same typed proposition* under matching scope, canon, time and interpretation should be assessed for a FOUR value of both. A declared \`contradicts:\` link between text entries is an index of dispute, **not by itself** a witness that every proposition in both is \(\top\). The source's utterance authority is not fictional-world truth authority.

**Canon example.** Keep a canon identifier for *Wonderland* and another for *Looking-Glass*; a combined Alice-world interpretation is an additional explicit bridge, not a silent identity of all entities and laws across novels. Treat narrator, characters, readers and adaptation authors as separate observation sources. Distinguish identity of an actor, its body at a time, its appearance in a scene, and a detached sign such as the Cat's grin.

## 3. A finite separation result (hand-checked)

**Lemma (an insufficient observer cannot recover a discarded grin).** Let \(s_0,s_1\) be admitted states with no visible Cat body in either, but with a visible grin only in \(s_0\). Define \(B(s)\in\{0,1\}\) as "Cat body visible" and \(G(s)\in\{0,1\}\) as "grin visible". Then there exists no function \(h:\{0,1\}\to\{0,1\}\) for which \(G=h\circ B\) on both states.

**Proof.** \(B(s_0)=B(s_1)=0\), so any \(h\) gives \(h(B(s_0))=h(B(s_1))\). But \(G(s_0)=1\) and \(G(s_1)=0\). Contradiction. \(\square\)

This is an elementary finite argument, not a Lean-checked proof and not evidence that the body and grin are ontologically separable in nature. It establishes that a consumer observing *only* body visibility cannot faithfully reconstruct all grin-visible distinctions in this **chosen** finite fictional state model. It supplies a specific negative test for any overly coarse observation functor.

## 4. What the legacy RPS must stop assuming

The science source [RPS v0.1](../../specifications/reproducible-paracosm-specification.md) historically states two categorical theorems as proved. Its current text does not furnish proofs of all claimed conclusions. In particular:

1. The old modal-object arrow \(\Box M\rightarrow M\) is an **algebra-like** structure, although the source calls it a coalgebra. Its displayed multiplication law uses an adjunction counit without establishing the needed types. A category of such objects must not be identified with a category of coalgebras or with a reflective localization by assertion.
2. A family indexed by \(I\) does not on its own furnish the transition functors and coherence data required for a pseudofunctor \(I\to\mathbf{Cat}\). Even a well-defined Grothendieck construction does not automatically have every stated fibration, reflection or equivalence.
3. An arbitrary quotient of a complete and cocomplete category does not automatically remain complete and cocomplete. An equivalence relation on models and a category of models with a localization at a specified class of arrows are not interchangeable constructions.
4. Global terminating, confluent narrative transitions would destroy intentional branching or unresolved endings. A **receiver-specific canonical representation** may have a terminating confluent rewrite system without the **fictional world's transitions** having one.
5. The six alleged finite checks are proof obligations, not an algorithm proving general completeness, descent, bisimulation, or institutional invariance for arbitrary possibly infinite worlds. Compactness does not mean that testing every finite subset is a finite program.

**Corrected working distinction.** For a specified source revision \(P\), canon \(c\), and consumer \(q\), define a source-to-observation projection \(O_{q,c}\) with explicit evidence and observables. On admitted states define \(s\equiv_{q,c}t\) iff \(O_{q,c}(s)=O_{q,c}(t)\). This is an equivalence relation **when** \(O_{q,c}\) is a total well-defined function, but it need not be a bisimulation, a category-theoretic localization, or sufficient to preserve every other consumer's observable. Prove stronger claims only after supplying the appropriate structure.

## 5. Coupling to praxonic and Obsmetrologia inquiry

The [relational worlding grammar](../../guides/relational-worlding-grammar.md) preserves field, actor, alignment, emission, trace and irresolved noise. Applied to Carroll:

- The Queen's order is an **emission**; fear, the court's reaction and any actually executed act are distinct **traces**. Do not replace them with the claim "execution happened".
- Humpty Dumpty's asserted lexical authority generates a **field of negotiation** with Alice. The dispute's continuance is meaningful, not dirty data to normalize away.
- The Hatter's tea-party social field allows speech, quarrel and place-setting changes even when its reported clock refuses advancement.
- Alice's bodily transformations alter available paths without requiring a replacement actor at every change.
- The closing dream question is a live interpretive alternative, not a missing scene to fabricate.

Obsmetrologia begins with **Marks** and articulations, not with a primitive Carroll-specific physics. A source span is admitted as a mark-bearing record; the speaker/context-sensitive utterance is articulated; proposed subject-predicate-object readings are predicated; evidence polarity is posited; any world claim is settled only under the applicable scope and proof rules. This mapping is a **proposed research translation**, not a claimed Lean theorem, physical Landauer accounting, or an already implemented SignCraft pipeline. The distinction between speaking about an act and witnessing its result is load-bearing.

## 6. RPS case configuration and tests

| Existing RPS element | Alice case configuration | Falsifier or negative test |
| --- | --- | --- |
| Signature \(S\) | Works, chapters, scenes, beings, bodies, signs, utterances, locations, frames, authority and event relations | Treating grin as body-visibility alone loses an observed distinction |
| Constraints \(\Theta\) | Source-bound identity constraints; shared state sorts across defined canon bridges | Forcing all stated events into one strictly advancing local clock rejects tea-time |
| Locales \(J\) | Scene/chapter/character observation scopes and explicitly named textual overlap | A retelling that changes a scoped claim without declaring an alternate canon fails overlap checking |
| Dynamics \(N\) | Parse and identity normalization **only** for canonical data representation; possible event branches retained | Normalizing all possible dreamers to one loses the last chapter's openness |
| Observations \(O\) | Explicit body, grin, clock, speaker, speech-act and reader observations | \(O_{\mathrm{body}}\) cannot recover \(O_{\mathrm{grin}}\) in the finite counterexample |
| Modal access \(\Box,\Diamond\) | Candidate speaker knowledge, memory, dream and counterfactual access relations | Assuming White Queen's statement alone makes future events globally true |
| Verification suite | Small source-anchored fixtures, proposition-scope agreement, transition and projection controls | A green finite test falsely labeled proof of categorical completeness |

**Acceptance for Science:** source-grounded observations with chapter locators; explicit proposed constructs; documented countermodels and derivable finite claims; theory correction without conflating four-valued evidence and modal alternatives. **Acceptance for Engineering (future, separate):** consume these as Science-owned fixtures and proof obligations in the existing FeltOS / SignCell / SignCraft implementation; avoid a separate Alice simulator, source clone, or new parser unless actual consumer demand establishes a missing reusable capability. **Public creative receiving:** separate rights and approval; this study does not create a new 561-owned Alice canon or authorize use of personal creative-world assets.

## 7. Next scientific questions

- Which category or institution of *source-indexed finite observations* permits precisely stated, preservation-checked projections? Determine the actual arrows, not just names for them.
- Can nonterminating narrative dynamics coexist with a terminating *serialization normalizer*, and what consumer observables must its rewriting preserve?
- Which local coverings admit gluing for a declared canon, and what explicit obstruction is produced by incompatible witnesses?
- How should a two-book Alice bridge distinguish shared narrative identity from distinct dream frames without treating an author's ambiguity as a specification defect?
- How can the six RPS proof obligations be given mathematically honest statuses and bounded test fixtures without calling sampling a proof?

**Scientific result:** the novel provides test cases that *improve the questions and types* in our paracosm theory. It does not prove that every phenomenon in Carroll's fiction has a unique hidden law or that a proposed universal mathematical foundation has already been validated.
