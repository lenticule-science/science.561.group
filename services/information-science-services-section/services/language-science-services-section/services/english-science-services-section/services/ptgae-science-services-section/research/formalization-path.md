# PlainEng formalization path — marks, utterances and bounded proof (2026-10-10)

**Status:** A research design for Obsmetrologia/Lean, *not* a compiled theorem or an empirical finding. [Science formalization issue #57](https://github.com/lenticule-science/science-services-section/issues/57).

## Distinguish levels of structure

1. **Mark:** an identifiable source inscription/sign occurrence with byte/rune span, provenance, medium and revision. Marks do not independently establish an intended interpretation.
2. **Uttered articulation:** a structured occurrence of marks used as an utterance by a source/actor in a context. Source identity, quotation boundary, time, discourse act and conditions belong here or in the anchored context.
3. **Candidate interpretation:** possibly multiple typed readings of an utterance; some cannot be resolved from local source text.
4. **Conformance judgment:** a context- and ruleset-qualified assertion about a document, not an all-purpose semantic truth claim.
5. **Reader-task result:** an empirical observation that may validate a particular accessible rendering for a particular audience/task; not inferred from a parser.

This dependency respects Obsmetrologia's research orientation from marks through uttered articulations. Whether it has a faithful full formal model remains a research question.

## Restricted intermediate structure

A first *candidate* claim representation can use typed fields for:

- attributed actor/speaker and action (with structured referent keys);
- subject/object relations and their grammatical/semantic roles;
- quantifiers and scope, polarity and condition direction;
- deontic force (requirement, prohibition, permission, recommendation) with explicit authority;
- evidence basis (observed, measured, inferred, reported, modeled, unknown) independent of obligation;
- time, numerical value/unit/uncertainty and source references;
- protected raw spans (quotations, equations, code, links, identifiers).

A parser must be **partial**. Its result should be `unparsed`, `ambiguous(candidates)` or `admitted(typed_claim, evidence)`, never a fabricated total interpretation. A language model's selected reading alone does not count as a proved reading.

## Possible formal signatures

Let `M` be marked inscriptions with stable identities, `U` source-bounded utterances, `C` contexts and `K` typed candidate claims. A parser has proposed type:

`parse : U × C → ParseResult K`

where `ParseResult` has constructors `Unparsed`, `Ambiguous` and `Admitted`, and `Admitted` carries source-span and authority evidence. Not every text is guaranteed an admissible parse.

Define material equality `≈_F` relative to a **declared finite set F of relevant invariant fields**. This relation says equality of checked fields, not equality of every possible pragmatic interpretation. A restricted rewrite rule `r` has an allowed domain and a proof target:

`∀ u c, pre_r(u,c) ∧ admitted(u,c) → admitted(r(u),c) ∧ parse(u,c) ≈_F parse(r(u),c)`

The statement is *only* sensible once the parse relation, context, type of equivalence and rewrite implementation are concrete. It is a proposed obligation, not a theorem.

## Lean-oriented proof schedule

1. Implement immutable mark/span and quotation identity data with roundtrip fixtures.
2. Define finite typed claims, a scoped reference/force model and a decidable equality checker on that **restricted** representation.
3. Prove identity rewrite preservation, protected-span immutability and local edit noninterference for well-formed spans.
4. Prove conditional non-escalation of adopted/evidentiary status when a rule's preconditions explicitly forbid that change.
5. Prove idempotence only for a specified normalization whose algorithm is known to converge; do not assert universal paramedic-method idempotence.
6. Run negative fixtures for all→some, may→must, if↔only-if, verified↔unverified, numbers/units, attribution and time.
7. Connect proved local obligations to machine diagnostics with an explicit checked source hash and Lean compiler/toolchain version.
8. Compare the accepted transformations with **human comprehension experiments**; code proofs do not demonstrate cognitive benefit.

## Proof and evidence boundaries

The full meaning of natural-language utterances is underdetermined by text alone, and reader behavior is contingent on context. Lean can prove facts about a formal restricted language and an implementation; it cannot certify that a human reader interpreted arbitrary English identically without assumptions and evidence.

Until executable Lean results are obtained, mark all proposed lemmas and theoretical adequacy claims as *unverified*. Preserve the scientific [interpretation model](interpretation-and-conformance.md), [reader evaluation protocol](evaluation-protocol.md), and Red Cup [semantic-drift cases](https://github.com/red-cup-engineering/ptgae-engineering-services-section/blob/main/data/fixtures/semantic-drift-cases.json) as distinct, linked artifacts.
