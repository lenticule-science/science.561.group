---
title: "Research memo: articles as formal, inspectable claim systems"
description: An article can be modeled not as a string of prose but as a versioned, discourse-structured, provenance-bearing argument object.
---
# Research memo: articles as formal, inspectable claim systems

## 1. Orientation

An article can be modeled not as a string of prose but as a **versioned, discourse-structured, provenance-bearing argument object**. Its visible prose is only one realization of an underlying system of propositions, predicates, discourse referents, sources, warrants, evidence, modal contexts, attacks, supports, and editorial transformations.

The relevant foundations come from several partially overlapping traditions: Montague grammar treats natural language composition with the tools of formal semantics; DRT and dynamic semantics treat discourse as context update; situation semantics makes meaning dependent on partial situations; SDRT/RST-style theories formalize discourse relations; Dung-style argumentation abstracts conflict and acceptability; structured argumentation adds internal logical form; AGM and truth-maintenance model revision; justification/provenance logics model why a claim is held and where it came from; knowledge graphs and claim verification systems operationalize claims, evidence, and source dependency. Montague’s “Universal Grammar” is the canonical primary point for Montague grammar; Kamp/Heim and later DRT accounts formalize discourse referents and update; Barwise and Perry ground situation semantics; Dung defines abstract argumentation frameworks; AGM/Gärdenfors and Doyle ground revision and truth maintenance; Artemov gives justification logic; Green–Karvounarakis–Tannen and W3C PROV formalize provenance; FEVER-style verification datasets formalize claim/evidence/verdict tasks. ([onlinelibrary.wiley.com](https://onlinelibrary.wiley.com/doi/10.1111/j.1755-2567.1970.tb00434.x?utm_source=chatgpt.com))

---

## 2. Formal object: an article version

Let an article at editorial version \(i\) be a structured object

\[
A_i =
(\Sigma_i, E_i, P_i, C_i, Ev_i, Src_i, Cit_i, D_i, R_i, M_i, U_i, \Omega_i, H_i, \rho_i)
\]

where:

| Component | Meaning |
|---|---|
| \(\Sigma_i\) | Surface text: paragraphs, sentences, spans, quotations, captions, headlines. |
| \(E_i\) | Entities: people, institutions, events, places, documents, datasets, times. |
| \(P_i\) | Predicates and relations: typed relation symbols such as \(Reopen(x,t)\), \(Said(s,\varphi)\), \(Caused(e_1,e_2)\). |
| \(C_i\) | Claims: formalized units of assertive, attributed, modal, evidential, or evaluative content. |
| \(Ev_i\) | Evidence objects: documents, observations, testimony, data tables, interviews, images, recordings. |
| \(Src_i\) | Sources: persons, institutions, publications, datasets, archives, sensors, anonymous sources. |
| \(Cit_i\) | Citations and source links: bibliographic, hyperlink, quotation, attribution, footnote, dataset reference. |
| \(D_i\) | Discourse structure: discourse referents, anaphora, temporal order, rhetorical/discourse relations. |
| \(R_i\) | Argument relations: support, attack, rebuttal, undercutting, warranting, exception. |
| \(M_i\) | Rhetorical/editorial moves: backgrounding, concession, qualification, correction, hedging, amplification. |
| \(U_i\) | Uncertainty assignments: probabilities, confidence scores, epistemic statuses, modal strengths. |
| \(\Omega_i\) | Contradiction/inconsistency structure: explicit conflicts, paraconsistent truth values, unresolved disputes. |
| \(H_i\) | Revision history: ordered transformations \(A_0 \to A_1 \to \cdots \to A_i\). |
| \(\rho_i\) | Realization map from text spans to formal objects: \(\rho_i : Span(\Sigma_i) \to 2^{C_i \cup E_i \cup Ev_i \cup D_i}\). |

A claim can be represented as

\[
c =
(id,\ span,\ \kappa,\ \varphi,\ role,\ attr,\ prov,\ links,\ u,\ status)
\]

where \(\varphi\) is the formal content, \(\kappa\) is its modal-temporal-attribution context, \(attr\) records whether the article itself asserts it or attributes it to a source, \(prov\) records source/evidence derivation, \(links\) records support/attack/discourse dependencies, \(u\) records uncertainty, and \(status\) records editorial state: draft, asserted, attributed, supported, refuted, under review, corrected, withdrawn.

The surface sentence “The minister said the policy will reduce emissions” should not be flattened into \(Reduce(policy, emissions)\). It should normally produce at least:

\[
Said(minister, t, \ulcorner WillReduce(policy, emissions)\urcorner)
\]

plus a separate, optional commitment relation indicating whether the article itself endorses, doubts, or merely reports the embedded proposition.

---

## 3. Core definitions

### Proposition

A **proposition** is the semantic content of a claim. In possible-worlds semantics it may be modeled as a set of worlds or indices:

\[
\llbracket \varphi \rrbracket \subseteq W
\]

In intensional Montague-style semantics, meanings are typed objects, often functions from worlds, times, or contexts to truth values. In dynamic semantics, a sentence meaning is not merely a truth value but a **context-change potential**, often modeled as a relation or function on information states. Dynamic predicate logic and DRT formalize this discourse-update view. ([link.springer.com](https://link.springer.com/article/10.1007/BF00628304))

### Predicate

A **predicate** is a typed relation symbol or semantic function. For example:

\[
PassedInspection : Bridge \times Inspection \times Time \to t
\]

In a knowledge graph, a binary predicate may be realized as an RDF-like edge:

\[
(subject,\ predicate,\ object)
\]

RDF is standardized as a data-interchange model that supports merging data from heterogeneous sources, which makes it natural for representing article claims as graph fragments. ([w3.org](https://www.w3.org/RDF/?utm_source=chatgpt.com))

### Discourse referent

A **discourse referent** is a variable-like object introduced into discourse and made available for later anaphora. In DRT, a simple discourse representation structure is a pair \([U \mid Con]\), where \(U\) is a universe of discourse referents and \(Con\) is a set of conditions constraining them. DRT was explicitly designed to give both construction procedures for discourse representations and model-theoretic interpretations for those representations. ([ims.uni-stuttgart.de](https://www.ims.uni-stuttgart.de/archiv/kamp/files/2011.kamp.van.genabith.reyle.discourse.representation.theory.pdf))

Example:

> “A contractor filed a report. It said the bridge passed inspection.”

A DRT-style representation introduces a discourse referent \(x\) for “a contractor” and \(r\) for “a report,” then resolves “it” to \(r\).

\[
[ x,r \mid Contractor(x), Report(r), Filed(x,r), Said(r,\varphi)]
\]

### Argumentation framework

A Dung abstract argumentation framework is:

\[
AF = (Arg, Att)
\]

where \(Arg\) is a set of arguments and \(Att \subseteq Arg \times Arg\) is an attack relation. Dung’s 1995 paper introduced this abstraction and showed that several nonmonotonic reasoning and logic-programming approaches can be represented as special cases of argumentation-theoretic acceptability. ([cse-robotics.engr.tamu.edu](https://cse-robotics.engr.tamu.edu/dshell/cs631/papers/dung95acceptability.pdf))

For articles, arguments may be claims, evidence bundles, source reports, warrants, or structured arguments. A richer article framework is often bipolar:

\[
BAF = (Arg, Att, Sup)
\]

where \(Sup \subseteq Arg \times Arg\) is a support relation.

### Attack and support

An **attack** relation represents conflict. It may be:

\[
Att(a,b)
\]

meaning argument \(a\) attacks argument \(b\). Subtypes include:

| Type | Meaning |
|---|---|
| Rebuttal | \(a\) supports \(\neg \varphi\) while \(b\) supports \(\varphi\). |
| Undercut | \(a\) attacks the inference from premises to conclusion in \(b\). |
| Source attack | \(a\) attacks the credibility, relevance, or reliability of \(b\)’s source. |
| Exception | \(a\) supplies a defeating condition for \(b\). |

A **support** relation represents positive dependence:

\[
Sup(a,b)
\]

meaning \(a\) contributes to the acceptability of \(b\). In structured argumentation, support is usually not merely a graph edge but a derivability relation from premises and inference rules. Besnard and Hunter’s deductive argumentation work is important here because it treats arguments as constructed from formulae, with counterarguments generated by logical inconsistency. ([direct.mit.edu](https://direct.mit.edu/books/monograph/3215/Elements-of-Argumentation?utm_source=chatgpt.com))

### Extension semantics

An **extension semantics** is a function assigning acceptable sets of arguments to an argumentation framework:

\[
\sigma(AF) \subseteq 2^{Arg}
\]

Common Dung semantics include admissible, complete, preferred, grounded, and stable extensions. Intuitively, an extension is a coherent standpoint the article, a source, or an editor could accept after conflict resolution.

### Provenance relation

A **provenance relation** records derivation, dependence, or origin:

\[
Prov(x,y,r)
\]

meaning object \(x\) depends on source/evidence/activity \(y\) under relation type \(r\). W3C PROV-O expresses the PROV data model in OWL2 and supplies classes and properties for representing provenance; PROV-SEM gives a declarative first-order semantics for PROV. ([w3.org](https://www.w3.org/TR/prov-o/))

For claim systems, useful provenance relations include:

\[
wasDerivedFrom(c,e),\quad wasAttributedTo(c,s),\quad quotedFrom(q,d),\quad generatedBy(c,activity)
\]

Provenance semiring work gives an algebraic account of how provenance annotations propagate through relational queries, unifying why-provenance, bag semantics, incomplete databases, and probabilistic databases. ([web.cs.ucdavis.edu](https://web.cs.ucdavis.edu/~green/papers/pods07.pdf))

### Belief revision operator

A **belief revision operator** is a function

\[
* : K \times \varphi \mapsto K * \varphi
\]

where \(K\) is a belief set and \(K * \varphi\) is the revised belief state after incorporating \(\varphi\). AGM belief revision treats belief states as logically closed sets and studies rationality postulates for contraction and revision. The SEP summary of AGM gives the standard contraction and revision postulates and the partial-meet representation theorem. ([plato.stanford.edu](https://plato.stanford.edu/entries/logic-belief-revision/))

For editorial systems, \(K\) is not merely “what the author believes.” It may be the article’s public commitment set, the newsroom’s verified claim set, or the system’s accepted extension of a claim graph.

### Modal and temporal context

A **modal-temporal context** is an index such as

\[
\kappa = (w,t,a,s,m)
\]

where \(w\) is world/scenario, \(t\) is time, \(a\) is agent, \(s\) is source, and \(m\) is modality: epistemic, deontic, temporal, evidential, counterfactual, reportive, or editorial.

Examples:

\[
At(t_1,\varphi),\quad Believes(source,\varphi),\quad Ought(editor,\varphi),\quad PublishedAt(article,t)
\]

Modal, temporal, epistemic, deontic, and relevance logics are applicable when articles contain obligation, knowledge, possibility, temporal development, or relevance-sensitive inference. Paraconsistent logics are relevant when contradiction should not trivialize the article’s claim system; Belnap’s four-valued logic and Priest’s Logic of Paradox are central references for inconsistency-tolerant reasoning. ([philpapers.org](https://philpapers.org/rec/BELAUF-2?utm_source=chatgpt.com))

---

## 4. Semantic layers of an article

### 4.1 Montague layer: compositional semantics

Montague grammar treats natural-language expressions as compositional objects interpretable in formal logic. Its relevance to articles is that surface prose can be mapped into typed semantic forms rather than merely tokenized. Montague’s “Universal Grammar” is the primary classic source. ([onlinelibrary.wiley.com](https://onlinelibrary.wiley.com/doi/10.1111/j.1755-2567.1970.tb00434.x?utm_source=chatgpt.com))

A simplified typed interpretation:

\[
\llbracket \text{the report} \rrbracket : e
\]

\[
\llbracket \text{passed inspection} \rrbracket : e \to t
\]

\[
\llbracket \text{the report says the bridge passed inspection} \rrbracket
=
Says(report,\ulcorner PassedInspection(bridge)\urcorner)
\]

The important editorial distinction is between:

\[
PassedInspection(bridge)
\]

and

\[
Says(report,\ulcorner PassedInspection(bridge)\urcorner)
\]

The latter is an attribution claim; the former is an article-level assertion.

### 4.2 Situation semantics layer

Situation semantics represents content relative to partial situations, not total possible worlds. This is useful for articles because journalistic evidence is almost always partial: a report, interview, dataset, or scene supports claims about some situation but not all facts in a possible world. Barwise and Perry’s *Situations and Attitudes* is the canonical source. ([philpapers.org](https://philpapers.org/rec/BARSAA?utm_source=chatgpt.com))

A situation-theoretic claim may have the form:

\[
s \vDash \langle R, a_1,\ldots,a_n; polarity \rangle
\]

For example:

\[
inspection\_situation \vDash \langle Passed, bridge, preliminaryInspection; + \rangle
\]

A correction may reveal that the earlier article confused one situation with another:

\[
finalInspection \neq preliminaryInspection
\]

### 4.3 DRT and dynamic layer

DRT and dynamic semantics treat discourse as the incremental construction of context. This is essential for articles because later sentences routinely depend on earlier discourse referents, temporal anchors, and implicit questions under discussion. Kamp, Heim, and dynamic semantics moved formal semantics from isolated sentences toward discourse update. ([ims.uni-stuttgart.de](https://www.ims.uni-stuttgart.de/archiv/kamp/files/2011.kamp.van.genabith.reyle.discourse.representation.theory.pdf))

A discourse representation structure:

\[
K = [U \mid Con]
\]

Example:

> “A bridge closed in March. It will reopen Friday.”

\[
K =
[ b,t_1,t_2 \mid Bridge(b), Closed(b,t_1), March(t_1), Reopen(b,t_2), Friday(t_2)]
\]

The pronoun “it” is interpreted through the accessible discourse referent \(b\). DRT’s donkey-sentence treatment is a classic result showing how indefinites can introduce discourse referents that later behave with universal force in embedded contexts. ([ims.uni-stuttgart.de](https://www.ims.uni-stuttgart.de/archiv/kamp/files/2011.kamp.van.genabith.reyle.discourse.representation.theory.pdf))

### 4.4 SDRT/RST layer: discourse relations

A formal article system needs relations such as Background, Elaboration, Contrast, Explanation, Evidence, Result, Narration, Correction, and Concession. SDRT is especially relevant because it gives a dynamic semantic theory with discourse structure and rhetorical relations, connecting context update with coherence and pragmatic inference. ([homepages.inf.ed.ac.uk](https://homepages.inf.ed.ac.uk/alex/papers/iwcs4.pdf))

For article units \(u_1,u_2\):

\[
Explanation(u_1,u_2)
\]

may license default inference that \(u_1\) gives a cause, reason, or warrant for \(u_2\).

\[
Contrast(u_1,u_2)
\]

may signal potential attack or tension between claims.

\[
Correction(u_1,u_2)
\]

may signal a revision operation: \(u_2\) supersedes or modifies \(u_1\).

---

## 5. Theorems and major formal results

### 5.1 Dung semantics

Let \(AF = (Arg, Att)\). Define a set \(S \subseteq Arg\) as conflict-free when no \(a,b \in S\) satisfy \(Att(a,b)\). Let \(S\) defend \(a\) when every attacker of \(a\) is attacked by some member of \(S\).

Major Dung results include:

1. Every admissible set is contained in a preferred extension.  
2. Every argumentation framework has at least one preferred extension.  
3. Every stable extension is preferred, but not every preferred extension is stable.  
4. The characteristic function \(F_{AF}\) is monotone.  
5. The grounded extension is the least fixed point of \(F_{AF}\).  
6. Preferred extensions are complete, the grounded extension is the least complete extension, and complete extensions form a complete semilattice. ([cse-robotics.engr.tamu.edu](https://cse-robotics.engr.tamu.edu/dshell/cs631/papers/dung95acceptability.pdf))

Editorial interpretation: an article may contain mutually incompatible source claims. Dung-style semantics lets the system compute which claim sets are defensible, skeptically accepted, credulously accepted, or rejected under a chosen semantics.

### 5.2 AGM belief revision

Let \(K\) be a logically closed belief set. AGM contraction \(K \div \varphi\) removes commitment to \(\varphi\), while revision \(K * \varphi\) incorporates \(\varphi\) while preserving consistency as far as possible.

Important AGM results include:

\[
K \div \varphi = \bigcap \gamma(K \perp \varphi)
\]

for partial-meet contraction, where \(K \perp \varphi\) is the set of maximal subsets of \(K\) not implying \(\varphi\). The partial-meet representation theorem says an operator is a partial-meet contraction iff it satisfies the standard AGM contraction postulates such as closure, success, inclusion, vacuity, extensionality, and recovery. Revision can be defined by the Levi identity:

\[
K * \varphi = (K \div \neg \varphi) + \varphi
\]

where \(+\) is expansion. ([plato.stanford.edu](https://plato.stanford.edu/entries/logic-belief-revision/))

Editorial interpretation: a correction is not just a changed sentence. It is a contraction of one article commitment, an expansion by a corrected claim, and a recalculation of dependent claims.

### 5.3 Truth maintenance

Doyle’s truth maintenance system records and maintains reasons for beliefs. Its relevance to article systems is direct: each claim should be accepted, rejected, or suspended because of explicit justifications, assumptions, and dependencies, not because it appears as a sentence. ([dspace.mit.edu](https://dspace.mit.edu/handle/1721.1/5733?utm_source=chatgpt.com))

A claim state can be maintained by justifications:

\[
In(c) \Leftarrow In(e_1), In(e_2), Out(d_1)
\]

where \(c\) is accepted if its evidence is in and its defeater is out.

### 5.4 Justification logic

Justification logic enriches modal logic with explicit terms for evidence or proof. Artemov’s notation has formulas such as:

\[
t : F
\]

read as “\(t\) is a justification for \(F\).” Artemov gives soundness and completeness results for justification systems and correspondence/realization results connecting justification logics with modal logics such as \(K,T,S4,S5\). ([sartemov.ws.gc.cuny.edu](https://sartemov.ws.gc.cuny.edu/files/2014/01/RSL2008.pdf))

Editorial interpretation:

\[
report42 : PassedInspection(bridge)
\]

is stronger and more inspectable than merely storing \(PassedInspection(bridge)\). It says which evidence term justifies the claim.

### 5.5 Provenance semirings

Provenance semiring theory annotates data with algebraic provenance tokens and propagates those annotations through queries. Green, Karvounarakis, and Tannen show that semiring annotations unify several database semantics, including incomplete databases, probabilistic databases, bag semantics, and why-provenance. ([web.cs.ucdavis.edu](https://web.cs.ucdavis.edu/~green/papers/pods07.pdf))

For article systems, a derived claim may carry an annotation such as:

\[
prov(c) = e_1 \cdot e_2 + e_3
\]

meaning the claim is supported either jointly by \(e_1,e_2\), or alternatively by \(e_3\).

### 5.6 Claim verification as formal task

FEVER formalizes claim verification as a task over claims, evidence, and labels: Supported, Refuted, or Not Enough Information. The original FEVER dataset contains 185,445 claims generated from Wikipedia and annotated with evidence for supported/refuted claims. ([aclanthology.org](https://aclanthology.org/N18-1074/))

For article systems, the FEVER abstraction is useful but incomplete. It gives:

\[
claim + evidence \mapsto verdict
\]

A richer article model needs:

\[
claim + evidence + source + discourse role + attribution + uncertainty + revision history \mapsto editorial state
\]

---

## 6. Worked example

### 6.1 Short article

> **Version 1.** City officials said Monday that the Riverbend Bridge will reopen Friday after engineers completed safety repairs. The contractor’s report says the bridge passed inspection. However, the transit union said the bridge should remain closed because vibration readings are still above last year’s threshold.  
>
> **Correction, Version 2.** The city later clarified that the inspection was preliminary, not final.

### 6.2 Entities

\[
E =
\{
city,\ officials,\ bridge,\ engineers,\ repairs,\ contractorReport,\ transitUnion,\ vibrationReadings,\ threshold2025,\ monday,\ friday
\}
\]

### 6.3 Predicates

\[
Bridge(x),\quad Reopen(x,t),\quad Completed(y,z,t),\quad PassedInspection(x,k,t)
\]

\[
Above(reading,threshold,t),\quad ShouldRemainClosed(x),\quad Said(source,\varphi,t)
\]

\[
Clarified(source,\varphi,t),\quad Preliminary(k),\quad Final(k)
\]

### 6.4 Claims

| ID | Formal content | Article status |
|---|---|---|
| \(c_1\) | \(Said(cityOfficials, Reopen(bridge,friday), monday)\) | attributed |
| \(c_2\) | \(Completed(engineers, safetyRepairs, monday)\) | asserted or attributed, depending on wording |
| \(c_3\) | \(Says(contractorReport, PassedInspection(bridge, inspection_1, monday))\) | attributed to document |
| \(c_4\) | \(Final(inspection_1)\) | implicit in Version 1 if “passed inspection” is read as final |
| \(c_5\) | \(Said(transitUnion, ShouldRemainClosed(bridge), monday)\) | attributed |
| \(c_6\) | \(Above(vibrationReadings, threshold2025, monday)\) | attributed/evidential |
| \(c_7\) | \(Clarified(city, Preliminary(inspection_1) \wedge \neg Final(inspection_1), t_2)\) | correction |
| \(c_8\) | \(Preliminary(inspection_1) \wedge \neg Final(inspection_1)\) | corrected accepted claim |

### 6.5 Support, attack, warrant

Support edges:

\[
Sup(c_2,c_1)
\]

Completed repairs support reopening.

\[
Sup(c_3,c_1)
\]

Inspection report supports reopening.

\[
Sup(c_6,c_5)
\]

High vibration readings support the union’s recommendation.

Attack edges:

\[
Att(c_5,c_1)
\]

The recommendation to remain closed attacks the reopening claim.

\[
Att(c_6,c_1)
\]

High vibration readings attack the safety basis for reopening.

\[
Att(c_7,c_4)
\]

The correction attacks the implicit final-inspection claim.

Warrant examples:

\[
w_1: CompletedRepairs(x) \wedge PassedInspection(x) \Rightarrow SafeToReopen(x)
\]

\[
w_2: Above(VibrationReadings,Threshold) \Rightarrow \neg SafeToReopen(x)
\]

The article’s real conflict is not simply \(Reopen\) versus \(\neg Reopen\). It is a conflict between warrants: one inference path supports reopening through repairs and inspection, while another undercuts safety through vibration evidence.

### 6.6 Claim graph

A compact graph representation:

\[
Ev_{rep} \to c_3 \to c_1
\]

\[
Ev_{vib} \to c_6 \to c_5 \dashv c_1
\]

\[
c_7 \dashv c_4
\]

where \(\to\) denotes support and \(\dashv\) denotes attack/defeat.

### 6.7 Contradiction representation

A classical system may mark:

\[
Final(inspection_1)
\]

and

\[
\neg Final(inspection_1)
\]

as inconsistent. A paraconsistent article system instead stores both without explosion:

\[
Truth(Final(inspection_1)) = both
\]

or records:

\[
Conflict(c_4,c_8,type = correction)
\]

This permits the article to say: Version 1 implied final inspection; Version 2 corrects that implication; downstream claims depending on finality must be re-evaluated.

### 6.8 Attribution and source dependence

The article should distinguish:

\[
PassedInspection(bridge,inspection_1)
\]

from:

\[
Says(contractorReport,\ulcorner PassedInspection(bridge,inspection_1)\urcorner)
\]

and from:

\[
ArticleCommits(A,PassedInspection(bridge,inspection_1))
\]

This avoids a common extraction error: treating quoted or attributed claims as the article’s own commitments.

A provenance representation:

\[
wasDerivedFrom(c_3, contractorReport)
\]

\[
wasAttributedTo(c_5, transitUnion)
\]

\[
wasGeneratedBy(c_8, correctionActivity)
\]

\[
invalidates(c_7,c_4)
\]

Nanopublication-style modeling is relevant here because it separates a core assertion from contextual graphs that record provenance, attribution, and publication metadata. ([w3.org](https://www.w3.org/wiki/images/c/c0/HCLSIG%24%24SWANSIOC%24%24Actions%24%24RhetoricalStructure%24%24meetings%24%2420100215%24cwa-anatomy-nanopub-v3.pdf))

### 6.9 Revision

Let \(K_1\) be the Version 1 commitment set:

\[
K_1 = \{Reopen(bridge,friday), PassedInspection(bridge,inspection_1), Final(inspection_1)\}
\]

The correction introduces:

\[
\neg Final(inspection_1) \wedge Preliminary(inspection_1)
\]

Using AGM-style notation:

\[
K_2 = K_1 * (\neg Final(inspection_1) \wedge Preliminary(inspection_1))
\]

A more editorially faithful operation is:

\[
K_2 = (K_1 \div Final(inspection_1)) + \{\neg Final(inspection_1), Preliminary(inspection_1)\}
\]

Then all claims supported by \(Final(inspection_1)\) must be recomputed. If \(Reopen(bridge,friday)\) depended on final inspection rather than merely preliminary inspection, its support strength is downgraded.

---

## 7. Editorial production as transformations over claim states

### 7.1 Drafting as claim expansion

Drafting adds candidate claims, entities, predicates, discourse referents, and evidence links:

\[
Draft(A_i,\Delta C,\Delta E,\Delta Ev) = A_{i+1}
\]

This is not only text generation. It is expansion of a structured state:

\[
C_{i+1} = C_i \cup \Delta C
\]

\[
Ev_{i+1} = Ev_i \cup \Delta Ev
\]

\[
D_{i+1} = update(D_i,\Sigma_{new})
\]

A drafting system should mark new claims as unverified unless evidence/provenance is supplied.

### 7.2 Editing as transformation

Editing may preserve formal content while changing realization:

\[
Edit_{style}(A_i) = A_{i+1}
\]

with

\[
C_i = C_{i+1}
\]

But substantive editing changes the claim graph:

\[
Edit_{substance}(A_i) = A_{i+1}
\]

where claims may be merged, split, weakened, strengthened, attributed, hedged, or deleted.

Examples:

| Editorial move | Formal effect |
|---|---|
| “will” → “may” | Change modal force: \(Future(\varphi)\) to \(Possible(\varphi)\). |
| “officials said \(p\)” → “\(p\)” | Remove attribution; increase article commitment. |
| “because” | Add explanatory/warrant relation. |
| “however” | Add contrast relation, possible attack. |
| “according to” | Add source/provenance dependency. |
| “correction” | Add revision event; contract or supersede prior claim. |

### 7.3 Fact-checking as constraint checking

Fact-checking can be represented as checking whether each claim satisfies constraints:

\[
Check(c) =
\begin{cases}
Supported & \text{if evidence entails or strongly supports } c \\
Refuted & \text{if evidence entails or strongly supports } \neg c \\
NEI & \text{if evidence is insufficient} \\
Conflict & \text{if competing evidence supports both } c \text{ and } \neg c
\end{cases}
\]

FEVER operationalizes a simplified version of this task with claims, evidence sentences, and verdict labels, but editorial systems require richer distinctions between assertion, attribution, quotation, implication, and correction. ([aclanthology.org](https://aclanthology.org/N18-1074/))

### 7.4 Publishing as stabilization

Publishing freezes a version:

\[
Publish(A_i) = (A_i,\ timestamp,\ publicID,\ commitmentSet)
\]

The published article need not be logically complete, but it should have a stabilized public state:

\[
Commit(A_i) \subseteq C_i
\]

where \(Commit(A_i)\) excludes merely quoted or disputed claims unless the article endorses them.

### 7.5 Correction as belief revision

Correction is a structured revision event:

\[
Correct(A_i,c,\varphi_{new},reason,evidence) = A_{i+1}
\]

It should record:

1. The prior claim.
2. The corrected claim.
3. The source/evidence of correction.
4. The dependency graph of affected claims.
5. The public correction notice.
6. Which article commitments are withdrawn, replaced, or retained.

Formally:

\[
H_{i+1} = H_i \cup \{(A_i, op, A_{i+1})\}
\]

\[
op = Contract(c_{old}) ; Expand(c_{new}) ; RecomputeExtensions
\]

Truth-maintenance systems are appropriate here because they record which accepted claims depend on which assumptions and justifications. ([dspace.mit.edu](https://dspace.mit.edu/handle/1721.1/5733?utm_source=chatgpt.com))

---

## 8. Comparing modeling families

| Model family | Best at | Weakness | Article-system role |
|---|---|---|---|
| Logic-based semantics | Precise entailment, quantification, modality, contradiction control. | Brittle if surface language is ambiguous; requires careful formalization. | Represents claim content and checks implication/consistency. |
| Montague/dynamic/DRT semantics | Compositionality, anaphora, discourse referents, context update. | Less directly suited to evidence and source credibility. | Converts prose into structured discourse objects. |
| SDRT/RST-style discourse logic | Coherence, narration, explanation, contrast, correction. | Rhetorical relations can be hard to infer automatically. | Explains how article units relate beyond sentence-level logic. |
| Dung/bipolar argumentation | Acceptability under conflict; support/attack structure. | Abstract AFs ignore internal formula structure unless enriched. | Computes defensible claim sets under competing evidence. |
| Structured argumentation | Links premises, rules, conclusions, counterarguments. | More complex; depends on chosen base logic. | Models warrants and inferential dependence in prose. |
| Belief revision/TMS | Corrections, retractions, dependency maintenance. | AGM idealizes belief sets as logically closed; real articles are finite and messy. | Tracks editorial change and downstream effects. |
| Provenance/justification logic | Explicit evidence, source, derivation, accountability. | Provenance is not the same as truth. | Records why a claim is present and where it came from. |
| Knowledge graphs | Queryable entities, relations, citations, named graphs. | Open-world assumptions and reification issues can obscure assertion status. | Stores inspectable article claim graphs. |
| Editorial workflow model | Captures drafting, checking, publishing, correction. | Not formal enough alone. | Supplies operational transformations over formal claim states. |

---

## 9. Minimal architecture for a mathematically grounded article system

A buildable system should separate five layers.

### Layer 1: Surface/document layer

\[
Doc = (sections, paragraphs, sentences, spans, quotations, citations)
\]

This is the ordinary article as displayed.

### Layer 2: Semantic/discourse layer

\[
Sem = (DRS, entities, predicates, temporalOrder, discourseRelations)
\]

This layer handles reference, anaphora, event structure, temporal sequencing, and rhetorical coherence.

### Layer 3: Claim/provenance layer

\[
ClaimStore = (C, Ev, Src, Cit, Prov)
\]

Each claim has source status: asserted, attributed, quoted, inferred, corrected, or backgrounded.

### Layer 4: Argument/revision layer

\[
ArgState = (Arg, Att, Sup, Warrants, Extensions, Inconsistencies)
\]

This layer computes what follows, what conflicts, and what is acceptable under a chosen semantics.

### Layer 5: Editorial workflow layer

\[
Workflow = (Draft, Edit, Check, Publish, Correct, Archive)
\]

Each operation is a transformation:

\[
op : A_i \mapsto A_{i+1}
\]

with provenance-preserving history.

---

## 10. Practical design principles

A rigorous article system should obey these principles:

1. **Never collapse attribution into assertion.**  
   “X said \(p\)” is not \(p\).

2. **Keep surface spans linked to formal claims.**  
   Every formal object should be traceable to prose, evidence, or an editorial operation.

3. **Represent uncertainty and contradiction explicitly.**  
   Use paraconsistent, probabilistic, argumentation, or labeled-status methods rather than silently deleting conflict.

4. **Separate evidence from warrant.**  
   Evidence supports premises; warrants license inferences.

5. **Use discourse relations as inferential signals, not decoration.**  
   “Because,” “however,” “although,” “according to,” and “correction” change the formal graph.

6. **Treat revision as a first-class operation.**  
   Corrections should transform claim states and recompute dependencies.

7. **Preserve provenance through every transformation.**  
   If a sentence is rewritten, the system should still know which claim, source, and evidence it realizes.

---

## 11. Compressed formal schema

A mathematically grounded article platform can be specified as:

\[
\mathcal{A} =
(V,\leq,\{A_i\}_{i \in V},Ops,\vdash,\models,\sigma,Rev,Prov)
\]

where:

- \(V\) is a set of versions.
- \(\leq\) orders versions by editorial history.
- \(A_i\) is the article object at version \(i\).
- \(Ops\) is the set of editorial transformations.
- \(\vdash\) is the selected proof/argument construction relation.
- \(\models\) is the selected semantic consequence relation.
- \(\sigma\) is the argument-extension semantics.
- \(Rev\) is the revision/contraction/update machinery.
- \(Prov\) is the provenance algebra or relation system.

The central invariant:

\[
\forall c \in C_i,\quad
c \text{ should have identifiable content, source status, discourse role, provenance, and revision state.}
\]

That invariant is what turns an article from prose into a structured, inspectable, transformable claim-bearing artifact.
