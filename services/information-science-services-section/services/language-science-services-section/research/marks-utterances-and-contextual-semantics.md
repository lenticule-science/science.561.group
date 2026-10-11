# Language science from marks to interpretive commitments

**Status:** A proposed multi-sorted construction, not a complete axiomatization of human language or a verified Lean proof. **Lenticule Science, 2026-10-10.**

## 1. Why the foundation matters

A piece of text is not a proposition, a proposition is not evidence for its truth, a parser result is not a speaker's intention, and a sentence that resembles an instruction is not authorization to act. Language research must keep these forms separate while explaining how they relate.

The Obsmetrologia/SignStuff direction begins with **marks** and **uttered articulations**. In the implemented [SignCell](https://github.com/red-cup-engineering/computer-data-engineering-services-section/tree/main/apps/signcell/src), an utterance carrier contains a token-side Mark and a claim-side Mark. This is a foundational **data carrier**, not proof that an English token already has a particular denotation. SignCell's [semantic-claim](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/apps/signcell/src/semantic-claim.mjs) also demands typed references and separately witnessed for/against evidence.

Here is a research presentation using distinct sorts:

- \(M\): admitted marks and source identity, with source revisions and exact spans.
- \(U\): uttered articulations (source actor, addressee, medium, situation and ordered marks).
- \(G\): English morphosyntactic analyses, potentially multiple per utterance.
- \(I\): candidate semantic interpretations anchored to English analyses and context.
- \(P\): typed propositions/predications with their reference and scope.
- \(E\): evidence records about claims; for/against can independently coexist.
- \(A\): agents and authorization/permission relations, not inferred from syntax.
- \(X\): effects/actions with externally checked preconditions and settlement receipts.

A *partial* interpretation relation is \(R \subseteq U \times C \times G \times I\), where \(C\) is context (source, task, discourse, interpretive conventions, domain ontology and date). The same utterance can have several consistent interpretations. A parser may supply \(G\) without obtaining \(I\), and \(I\) without showing \(P\) true in the world.

The central dependency to study is:

\[
 M \longrightarrow U
 \;\dashrightarrow\; G
 \;\dashrightarrow\; I
 \;\dashrightarrow\; P,
\qquad
(P,E) \longrightarrow \mathrm{SignCell},
\]

where dashed arrows intentionally mark partial, defeasible, possibly one-to-many interpretation, not total machine functions. A separate authority/effect boundary must remain between these readings and \(X\).

## 2. Construction via current software

| Abstract concern | Existing source and actual scope | Missing scientific/interface work |
| --- | --- | --- |
| Marks and uttered articulations | [SignCell mark and utterance](https://github.com/red-cup-engineering/computer-data-engineering-services-section/tree/main/apps/signcell/src) | Align Unicode/UTF-16 token spans and source identity; distinguish a source-marked utterance from its grammatical tokens |
| English articulation/tagging/roles | [Linguistics English language algebra](https://github.com/lenticule-science/linguistics-services-section/tree/main/services/english-language-algebra) and shared language engine | Version 0.1.2 vs 0.1.7 disagreement, missing lexical/grammar coverage, uncertain role-frame semantics |
| Typed cells | [SignCell semantic claim](https://github.com/red-cup-engineering/computer-data-engineering-services-section/blob/main/apps/signcell/src/semantic-claim.mjs) | Convert **admitted** semantic claims, not arbitrary tokenizer outputs, into witnessed cells |
| Consequence and evidence orders | [SignChain typed theory](https://github.com/red-cup-engineering/computer-engineering-services-section/tree/main/services/computer-code-engineering-services-section/apps/signchain/src) | Source-bound rule derivations, context and authority constraints for English claims |
| Contextual relations and restrictions | [SignGraph fiber](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/fiber.mjs), [cellular sheaf](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/cellular-sheaf.mjs) | Define real semantic sites, overlap/restriction maps, compatible sections and any valid linearization |
| Inference, refusal, repair | [SignCraft](https://github.com/red-cup-engineering/computer-engineering-services-section/tree/main/services/signcraft/src/inference) | Semantic certification vs contextual settlement vs writing quality; result authority and witness trace |

These paths identify actual upstream mechanisms, not an assertion that they already interoperate for PlainEng.

## 3. Separate four phenomena often called “ambiguity”

**Alternative syntax.** “I saw the scientist with the telescope” may have a verb-attachment or noun-attachment reading. Two different possible dependency configurations are alternatives; neither is automatically denied.

**Underspecified reference.** “They approved it” may parse uniquely but lack a referent for either pronoun.

**Contradictory evidence.** Evidence for and against the *same fully typed* predication under the same domain/context may accumulate in SignCell's four-valued evidence carrier. SignChain must not treat evidence for \(p\) and evidence for another \(q\) as contradictory merely because an application expects one choice.

**Context disagreement.** Two parties can assign different referents, ontologies or temporal frames. Their judgments may be locally coherent yet resist composition on a shared overlap.

This distinction corrects a tempting overreading of the older [sentence-fiber-algebra](https://github.com/lenticule-science/linguistics-services-section/blob/main/content/text/documents/articles/notes/recovered/history/triage/sentence-fiber-algebra.md) proposal: multiple candidate arcs in different fibers are **not** FOUR top without an explicit, same-proposition conflict rule. Also, an unsettled dependency graph is not evidence that the speaker lied.

## 4. Meaning as an indexed, revisable relation

A bare proposition-first style rule is not a full theory. Define a restricted family of **models of interpretation** \(J_{v,c,a,t}\), indexed by grammar/lexicon version \(v\), context \(c\), reader/agent \(a\), and task \(t\). Outputs may be:

- zero readings: unparsed or ill-formed under the specified fragment;
- one or more candidate readings: with derivation, referents and unresolved obligations;
- a reviewed/admitted typed reading: under a named expert/domain contract;
- an empirical understanding result: a measured human or agent task, independently witnessed.

Do not model an agent's guessed proposition as an observation of its truth. Neither frequency in a corpus nor model probability grants source or institutional authority. When comparing versions \(v \to v'\), preserve a translation relation and a set of observed counterexamples.

Theories may represent interpretation as a set, a weighted distribution, a lattice of constraints, or a fiber of compatible readings. Choose the object by the question tested; do not silently treat every such representation as interchangeable. Restriction to a context may throw information away; gluing can be partial or nonunique.

## 5. An indexed language site (candidate sheaf semantics)

Let \(B\) be a chosen poset or category of discourse contexts, document windows and named overlaps. For each \(b\in B\), define \(F(b)\) as the **set** of admissible local interpretations under source and grammar version. For each inclusion \(b' \subseteq b\), define a restriction \(\rho_{b,b'}:F(b)\to F(b')\) satisfying identity and composition where it exists.

This is a presheaf-like candidate, not automatically a sheaf. To assert a sheaf condition, specify which covers matter, what it means for readings to match on overlaps, and prove existence and uniqueness of amalgamated global readings. If local readings agree on overlaps but a global one does not exist, record the actual obstruction. An ambiguity may instead be *several* valid global sections, which is not an obstruction.

A bilattice-valued predicate fiber is **not automatically a vector space**. For a numeric sheaf Laplacian \(L=\delta^\top\delta\), choose and justify vector-space stalks, inner products, incidence restrictions and a linearization of the selected features. Then residual norm, kernel and cohomology are properties of **that model and its declared encoding**—not universal meters of sentence ambiguity. The implemented [SignGraph cellular sheaf](https://github.com/red-cup-engineering/computer-engineering-services-section/blob/main/services/computer-networking-engineering-services-section/apps/signgraph/src/cellular-sheaf.mjs) provides matrix tools once those prerequisites are met.

## 6. Agent communication is still communication

A text body can be understood without authorizing a transaction. Keep distinct:

1. act of saying/questioning/requesting/predicting;
2. speaker attribution and claims about the world;
3. evidence and its independent verification;
4. receiver interpretation with repair/clarification;
5. principal/office authority to undertake action;
6. action admission, execution, receipt and downstream effects.

Typed ActivityStreams/CloudEvents or a Semioverse exchange is an operational envelope for some of these events, not a replacement for semantics. A valid natural-language parse cannot grant a capability.

## 7. Research acceptance

Define a typed prototype with genuine source-span anchors, parser candidates, multiple distinct ambiguity forms and signed/linked evidence from one real English package revision. Make two local interpretations that do and do not glue; preserve honest unknowns. Produce restricted Lean propositions about source identity, restriction composition and no implicit authority change. Test the linguistic adequacy empirically against sampled utterances. No existing results are upgraded by this proposal.

See [English science](../services/english-science-services-section/research/english-language-research-program.md), [PlainEng science](../services/english-science-services-section/services/ptgae-science-services-section/README.md), [sign-and-sheaf program #60](https://github.com/lenticule-science/science-services-section/issues/60), and [formalization #57](https://github.com/lenticule-science/science-services-section/issues/57).
