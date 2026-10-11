# PlainEng: a controlled English and synthetic formal register

**Research proposal 0.2 — 2026-10-10. Not yet adopted as a normative specification.** PlainEng is the program name; Plain Technical General American English (PTGAE) is its starting English register. This program goes beyond sentence cleanup into grammar, semantics, pragmatics, formal derivation, agent communication and human comprehension.

## Thesis: constrain English rather than translate it into private jargon

The scientific wager is that a disciplined *subset of existing English* can be useful both as human language and as a language of increasingly verifiable computation. Its morphology, core syntax, discourse habits and readable words remain recognizable English. Restrictions apply where they prevent material interpretive errors or enable reliable compilation: scope, word sense, denotation, attribution, modality, units, reference and versioned operations.

It is synthetic in **construction**, because accepted grammar and proof obligations are engineered; it is not necessarily synthetic in appearance. Ordinary English remains a valid source and target. PlainEng is a family of subset languages indexed by domain, audience, task and version, not a ban on expressions outside the restricted grammar.

## Objects, judgments and four separations

Let \(S\) be source-marked utterances, \(C\) contexts, \(V\) a bundle/grammar version, \(D\) domain vocabulary/ontology, \(R\) readings, \(P\) typed propositions, \(E\) evidence, and \(A\) authorization. A candidate parser is a partial operation:

\[
\mathrm{parse}_{V,D}: S\times C \longrightarrow
\mathrm{Reject}+\mathrm{Abstain}+\mathrm{Ambiguous}(\mathcal P_{\mathrm{fin}}R)
+\mathrm{Admitted}(R).
\]

An **admitted reading** means only that grammar and context license a particular interpretation. It does not mean its proposition is true, supported, or authorized to alter a system. Distinguish:

1. Grammatical admissibility \(G(s,V)\): the structure belongs to the constrained fragment.
2. Semantic interpretation \(M(s,r,c,V,D)\): candidate \(r\) is linked to source \(s\) in context.
3. Epistemic support \(W(p,e)\): specific evidence tells for, against, both or neither for proposition \(p\).
4. Effect authority \(\mathrm{MayAct}(a,x,c)\): independent permission to execute effect \(x\).

No automatic inference from grammar to support, interpretation to support, or support to effect authority is valid.

## Typed intermediate language

Candidate *abstract* categories, to be reconciled with real English-algebra output and SignCell:

- **Referent(domain, id, type):** independently resolved entity or typed discourse variable.
- **Predication(predicateId, argumentRoles, polarity, scope, time):** meaning candidate, with no assumed truth.
- **Quantified(variable, domainType, kind, body):** every, some, none, exactly N, with explicit scope.
- **Condition(kind, antecedent, consequent):** one-way implication versus equivalence/necessity.
- **Modal(kind, holder, issuer?, proposition):** ability, permission, obligation, recommendation, possibility or necessity; these are not interchangeable.
- **Attribution(source, reportingAct, content):** reported content not automatically endorsed.
- **Evidence(kind, method?, source?, time?, subject):** observation, measurement, inference and testimony separated.
- **SpeechAct(kind, speaker, receiver?, content, conversationId?):** assertion, question, request, reply, refusal, acknowledgement, proposal.
- **LiteralSpan(kind, start, end):** exact quotations, code, math, IDs, cited text with source coordinates.

The English realization is a *projection* from accepted typed constructors under an English grammar and registered lexical senses. It need not be the shortest or most literary wording.

## First proposed surface grammar

This illustrative EBNF is **not implemented** and is not a universal parser for English. Nonterminals depend on upstream English morphology, tokenization, agreement and lexical-sense registration.

~~~ebnf
document        = { statement | question | request | quotation } ;
statement       = [ source_marker ] [ evidence_marker ] proposition "." ;
question        = "Does" named_actor finite_verb named_object "?" ;
request         = "Request:" named_actor modal_action "." ;
proposition     = atomic | negated | conditional | quantified ;
atomic          = named_actor verb_phrase [ time_phrase ] ;
negated         = "It is not the case that" atomic ;
conditional     = "If" proposition "," "then" proposition ;
quantified      = quantifier typed_nominal "," proposition ;
quantifier      = "For every" | "For some" | "For no" ;
modal_action    = ("must" | "may" | "should" | "can") approved_verb [ named_object ] ;
source_marker   = "According to" source_ref "," ;
evidence_marker = "Observed:" | "Measured:" | "Inferred:" |
                  "Hypothesis:" | "Model:" | "Unverified:" ;
named_actor     = resolved_nominal ;
named_object    = resolved_nominal ;
~~~

A grammar is **narrow by design**. A good ordinary English sentence outside E2 is not bad English; it receives an E0/E1 reading and an honest abstention from machine-grade semantic certification.

## Synthetic precision without textual hostility

Reader form: “Before publishing the report, the operator must verify the receipt.”

Candidate typed interpretation: an obligation under a named authority; the operator is a domain-resolved role; a verification predicate on receipt precedes the publish action on report. Its operational authority must be supplied and checked separately. Without a named policy, the system may preserve the writer's “must” but cannot infer a binding institutional mandate. Without grounded operator or receipt identifiers, the system should ask for referent binding rather than fill in plausible ones.

The interface may display friendly English while carrying content-addressed typed referents in its envelope. It must not rewrite quoted source or silently turn the parser's candidate interpretation into what the speaker necessarily meant.

## Restriction families and scientific questions

1. **Lexical senses.** A controlled term has a stable sense ID, class, definition, source, version, domain and optional register. Familiar words are preferred when they preserve specificity; technical language stays exact.
2. **Scope.** Explicit quantifiers and conditional direction; distinguish if from only-if; allow nested exceptions only when typed and readable.
3. **Anaphora.** Pronouns and definite descriptions are admitted only when their references are resolved or a controlled ambiguity is explicitly retained.
4. **Modality.** Capability, probability, permission, obligation and recommendation are different typed constructors with optional issuing authority.
5. **Time and evidence.** Preserve absolute deadlines, units, tolerance, original measurement methods, report versus observation, simulation and confidence calibration.
6. **Quotation and nested speech.** Preserve exact source text, nesting and attribution; a quoted assertion does not become an endorsed assertion.
7. **Discourse acts.** Speech act and subsequent action are separate; a syntactically valid request does not grant an agent authority.
8. **Accessibility.** Multiple valid human renderings may be necessary; test comprehension, search, screen readers and information-seeking tasks.
9. **Scoped exceptions.** Complex idioms and specialist constructs may be accepted by a versioned, reviewable extension; unreviewed exceptions may not weaken preservation constraints.
10. **Information economics.** Evaluate disambiguation cost, model compute, reader effort and consequences of false admission before requiring extra restrictions.

## Twenty-four conceptual regression cases

These are research hypotheses and proposed fixtures, **not passing automated tests**.

| Case | Expression or edit | Meaning issue / candidate handling |
| --- | --- | --- |
| P01 | The teacher graded the exam. | Simple event candidate; an upstream real engine fixture |
| P02 | Mary reads a book. | Upstream current English parser documents missing present-verb roles |
| P03 | The difficult exam was graded. | Upstream adjective heuristic can mis-tag difficult |
| P04 | The engineer saw the technician with the camera. | Distinct attachment readings; not automatically FOUR contradiction |
| P05 | All tests did not pass. | Quantifier/negation scope requires disambiguation |
| P06 | Not all tests passed. | Explicit not-all; distinct from no-test-passed |
| P07 | Every engineer inspected a sample. | Scope of sample may be shared or dependent |
| P08 | Exactly three samples failed. | Count needs a fixed sample population/time |
| P09 | The operator may publish. | Speaker probability vs normative permission |
| P10 | The operator can publish. | Capability does not entail permission |
| P11 | The operator must publish. | Obligation needs an effective issuing authority |
| P12 | The operator should publish. | Recommendation is not a requirement |
| P13 | If the request is valid, approve it. | Sufficient condition under imperative context |
| P14 | Approve only if the request is valid. | Necessary condition; not equivalent to P13 |
| P15 | The service appears to be live. | Evidence/attribution unresolved |
| P16 | The provider reports that the service is live. | Attributed report, not verified deployment |
| P17 | Measured: 3.0 ± 0.2 mg. | Preserve units, method, tolerance and time |
| P18 | Measured: 3 mg. as an edit of P17 | Reject: erases uncertainty |
| P19 | Submit before 2026-10-12T17:00-05:00. | Preserves deadline/timezone |
| P20 | Submit soon. as an edit of P19 | Reject: loses deadline |
| P21 | The agency denied the request. | Trace actor/action and original source |
| P22 | The request was denied. | Passive may be fine, but erased actor may matter |
| P23 | The operator said, “The report is final.” | Quotation and attribution protected |
| P24 | The report is final. as an edit of P23 | Reject: removes attribution and upgrades claim |

Expand with argument control, tense/aspect, presuppositions, anaphora, relative clauses, conjoined quantifiers, Unicode source spans, dialect expressions, and code-switched technical texts.

## Formalization and composition

For grammar version \(v\), domain ontology \(d\), context \(c\), and admitted reading \(r\), a proposed judgment is

\[
\Gamma;v;d;c \vdash s \Downarrow r : \mathrm{AdmittedReading}.
\]

The derivation is partial. Unknown referents, unsupported grammar, unresolved scope or lack of evidence leave proof obligations; they are not completed by fluent output.

Given a typed reading \(r\) in the admitted fragment, a generated English surface \(s'=\mathrm{render}_{v,d}(r)\) has a *conditional* roundtrip obligation:

\[
\mathrm{parse}_{v,d}(\mathrm{render}_{v,d}(r)) \approx_{v,d} r
\]

where typed equivalence is explicitly defined. This is not a statement that arbitrary English paraphrases preserve all pragmatic meaning. It is likewise not a reader-comprehension guarantee.

The composable morphisms to investigate are source-preserving parsing; sense/referent binding; domain type checking; local normalization under an invariant; human-readable realization; and **forgetful projection** when emitting less-structured English. Each must declare exactly what information is lost.

## The nontrivial contribution to test

Attempto Controlled English, Common Logic Controlled English, Grammatical Framework, PENG and ASD-STE100 already explore controlled English. PlainEng is **not first** at constraining natural English. The research hypothesis is the combined use of Lenticule's real English apparatus, typed SignCell witnesses, SignChain rules, SignGraph overlaps and fibers, SignCraft settling/repair, Obsmetrologia restricted proof obligations, and human/agent task validation.

See [comparative source map](controlled-language-predecessors.md), [Sign-stack semantics](signstack-fiber-sheaf-interpretations.md), [agent communication](agent-readable-english-contracts.md), [issue #61](https://github.com/lenticule-science/science-services-section/issues/61), and [engineering compiler issue #7](https://github.com/red-cup-engineering/ptgae-engineering-services-section/issues/7).
