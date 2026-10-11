# English science: literature-grounded critical review and research design (11 October 2026)

Status: source-backed analytical research note, not a theorem, a completed systematic review, or an authorization to replace existing packages. Parent: [English 21st-century research](english-21st-century-language-science.md). Downstream consumer: Red Cup English Engineering → PTGAE.

## Distinguish novelty from precedents

**Attempto Controlled English (ACE)** has long combined restricted English with formal semantic representations and specification/query workflows. Fuchs and Schwitter (1996), *Attempto Controlled English*, https://arxiv.org/abs/cmp-lg/9603003 . Therefore “machine-interpretable controlled English” is not itself a novel contribution. Investigate *source-anchored, explicitly partial* readings, provenance/evidence separation, context transport, agent-scale adversarial testing and measurable human-agent task performance as differentiators; do not assert their novelty without prior-art review.

**Grammatical Framework (GF)** separates abstract syntax from concrete language-specific realization. Ranta (2009), *GF: A Multilingual Grammar Formalism*, https://doi.org/10.1111/j.1749-818X.2009.00155.x ; Ranta, *GF tutorial*, https://www.grammaticalframework.org/doc/tutorial/gf-tutorial.html . Angelov and Ranta (2010), *Implementing Controlled Languages in GF*, https://research.chalmers.se/en/publication/131247, specifically implement controlled languages including ACE. Before new DSL/compiler claims, compare: typed abstract syntax, concrete syntax, parser/realizer relation, linearization ambiguity, semantic interpretation and grammar reuse. Choose interoperability or establish a falsifiable deficiency.

**Universal Dependencies (UD)** provides documented morphological and dependency annotation, but a dependency tree is neither logical form nor unambiguous interpretation. UD English Web Treebank v2.18 (2026-05-15), https://github.com/UniversalDependencies/UD_English-EWT , comprises 16,622 sentences from multiple web genres; inspect actual genre composition and annotation limitations, avoid treating it as representative of all English. UD English language documentation https://github.com/UniversalDependencies/docs/blob/pages-source/_en/index.md records treebank differences and clitic segmentation variation. Use a pinned revision/partition and document licensing upstream, not a presumed entitlement to republish raw sentences.

**Cellular sheaf theory**: Hansen and Ghrist, *Toward a spectral theory of cellular sheaves*, Journal of Applied and Computational Topology 3 (2019), 315–358, https://doi.org/10.1007/s41468-019-00038-7 . Their Laplacian applies to cellular sheaves of vector spaces. A symbolic interpretation presheaf may be legitimate without any natural linear structure. Never call an arbitrarily embedded parse-space Laplacian a proof of semantic inconsistency; require an operational meaning for basis, norm, restrictions and invariance under representation change.

## Critical correction to legacy sentence-fiber-algebra

Read [historical design](https://github.com/lenticule-science/linguistics-services-section/blob/main/content/text/documents/articles/notes/recovered/history/triage/sentence-fiber-algebra.md). It proposes E×Π×E predicate cells, diagonal POS and off-diagonal dependency arcs. The preservation of off-diagonal cells and noncommittal candidate arcs are valuable *design hypotheses*.

However the claim that two competing PP attachments should JOIN into FOUR `TOP` does not follow. Example “I saw the man with the telescope”: parse A attaches PP to seeing event; parse B attaches PP to noun phrase. A and B are competing readings of utterance u; they are not necessarily evidence both supporting and refuting one *pinned* proposition p. Multiple positive arcs in different predicate cells also do not create `TOP` in a single cell. An exclusivity constraint could rule out a combination as one parse, but that is a structural constraint on parse selection, not a bilattice proof of factual contradiction.

**Replacement modeling obligation:** `ParseForest(u, grammarEdition)` stores a set of complete or partial analyses and their source spans; structural compatibility is a constraint relation among analyses. `Evidence(p, context, time)` separately holds independent for/against witnesses. `TOP` appears only where both evidence coordinates are warranted for the same scoped proposition. Examples for tests: A/B attachment retained; mutually exclusive parser rules do not automatically yield `TOP`; independent conflicting measurements for same pinned proposition may yield `TOP`; unsupported source remains neither. Update historical file only with preservation of provenance and explicit new evidence.

## Typed minimal fragment to pursue

Concrete domain: technical inspection records, deliberately excluding automatic execution.

Source sentence: “If sensor S fails before 17:00 UTC, operator O must inspect valve V.” Define typed AST constructors `SensorId(S)`, `OperatorId(O)`, `ValveId(V)`, `Deadline(UTC,17:00)`, `Condition(Fails(S), Before(deadline))`, `Obligation(O,Inspect(O,V),condition)`; this is *proposed notation*, not a statement that these exact constructors exist in SignCell.

Separate: source span and quotation; grammatical analysis alternatives; contextual binding S/O/V; possible interpretation(s); signed/admitted factual evidence concerning sensor failure; deontic force attributed to the *source* vs actual authorization; action permissions. Source assertion of an obligation is not an obligation issued by an authorized principal.

Negative pairs:
- “must inspect” versus “may inspect” (normative force changes);
- “fails before 17:00” versus “does not fail before 17:00” (negation);
- “A reports that S failed” versus “S failed” (attribution);
- “at 17:00 UTC” versus “before 17:00 UTC” (boundary);
- “inspect V” versus “repair V” (action class);
- same spelling of S with two scoped referents (identity).

Candidate formal lemma 1 (not yet proved): with a fixed source/grammar edition and injective occurrence map, every admitted token occurrence in a parsed fragment maps to an exact source span. Counterexample: normalized token with no recorded source map.

Candidate formal lemma 2 (not yet proved): a realization preserving typed scope, attribution, referents, temporal relations and modal constructors preserves the selected fragment's *declared compositional semantics*. This is not global pragmatic equivalence of all English. Counterexample: dropping the reporting operator or changing `Must` to `May`.

Candidate formal lemma 3 (not yet proved): a derivation system with evidence and authorization sorts separated cannot derive an operational `Permit` from a grammatical `Parsed` alone, provided no bridging rule exists. Audit the actual SignChain/SignCraft rules for any hidden bridge.

## Fibers and sheaf experiment: simplest worked research specification

Use a finite site consisting of two overlapping context windows `U`, `V` and their intersection `W`. Specify local interpretation sets `F(U)`, `F(V)`, `F(W)` and actual restriction functions `r_UW`, `r_VW`. A compatible pair satisfies `r_UW(a)=r_VW(b)`; gluing to `F(U∪V)` is a distinct existence/uniqueness question. Exhibit (i) compatible pair with a global realization; (ii) incompatible pair with none; (iii) compatible pair with multiple global realizations so uniqueness fails. Without a specified coverage/site and restriction map, “semantic sheaf” is a metaphor.

*Only separately* construct numerical toy sheaves on a graph with real vector stalks and linear restrictions, compute `δ` and `L=δᵀδ`, and compare nullspace/residual under coordinate transformations. Ask what the vector values actually denote and whether the encoding is faithful. Do not use H¹ as a generic ambiguity score.

## Research method and independent receiving

1. Pin actual English algebra 0.1.2/0.1.7 source versions and compare ASTs, grammars, type discipline and roundtrip behavior against GF and ACE, recording failures, not merely feature names.
2. Sample corpus by genre and variety; independently annotate pronoun resolution, scope, ellipsis, tense/aspect, evidentials, quotation, directives and discourse. Document disagreements between annotators and stratified exclusions.
3. Create constrained realizers of the *same interpretation* and use blinded human reader tasks. Measure error rates, coverage, abstention, task latency, reading speed, subjective naturalness and dialect-dependent differences.
4. Agents generate adversarial examples and predict interpretation sets; independently sampled human judgments and held-out data adjudicate usefulness. Self-agreement is not ground truth.
5. For each formal claim, name definitions, assumptions, proof obligation, countermodel, implementer and test witness. Maintain separate columns: observed in code, established literature, proposed model, measured hypothesis, mechanically proved statement.
6. Report simpler baselines: ambiguity-preserving parse forest, typed AST with no sheaf, ordinary rules, and GF/ACE-style architecture. Require incremental benefit over simpler alternatives before introducing higher category machinery.

## Actual contribution sought

Not “we invented controlled language”, “bilattice solves parsing”, or “sheaf Laplacian measures English meaning”. The proposed contribution is a *testable integration* of (a) English descriptive science, (b) source-grounded typed alternative readings, (c) evidence-bearing paraconsistency only where justified, (d) contextual transport with stated gluing conditions, (e) downstream scoped English realization, and (f) independently measured human-agent performance. Failure to outperform simpler models is a valid scientific finding.

Source status: referenced literature/source pages checked October 11, 2026. Bibliography is selective, **not exhaustive**. Further study needed in dynamic semantics, DRT, generalized quantifiers, type-logical grammar, MRS/UDRS, CCG, HPSG, construction grammar, sociolinguistics, plain-language empirical evaluation and agent communication protocols.
