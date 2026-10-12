---
title: "The Gray Completion — internal scientific source audit and empirical identification"
type: scientific-review
status: critical-review-completed-research-still-open
date-created: 2026-10-12
reviewed-work: "2026-07-10-the-gray-completion-working-research-article.md"
publication-status: unpublished
scientific-disposition: major-revision-before-submission
---

# The Gray Completion: evidence boundaries and an identified research program

**Scope.** This is Lenticule Social Theory Science's *internal critical examination* of the working research article [The Gray Completion: Place, Time, and Language Models as State-Realizers of Governance](../07/10/2026-07-10-the-gray-completion-working-research-article.md). It is not an independent external peer review, a published scientific paper, the author's similarly titled Substack essay, or a universal research-operations procedure. The original received manuscript remains unchanged. General research execution, source custody and experimental operation should be commissioned from Coesite Research Operations; scientific inference and disciplinary adequacy remain with Lenticule.

## 1. Thesis and the strongest defensible contribution

The paper proposes that an AI-assisted writing interface can increase the probability that one possible linguistic continuation is selected, revised and installed into a subsequent institutional state. The idea is distinctive where it separates a **generated proposal**, an **interface intervention**, **human uptake**, and **actual institutional enactment**. This is a theoretical mechanism worth investigating.

It is *not yet* a demonstrated causal mechanism of settler temporal governance. The source's own example is a 2025 controlled HCI experiment involving English-language writing by recruited participants in India and the United States. It observed writing behavior and cultural convergence, **not** the transfer of Indigenous jurisdiction, the operation of a treaty regime, or consequential downstream institutional decisions. The source paper calls its transition schema a conceptual proposal. Maintain that status.

The Deloria, Rifkin, O'Brien, Povinelli, Gilmore and legal-literature passages are critical and historical interpretations with different warrants. None can be made into a measured finding merely by being placed next to the HCI experiment. The disciplinary contribution should be an explicitly qualified account of *how* control over admissible successors can emerge, and of where the published evidence stops.

## 2. Empirical source audit: what the main study actually establishes

Primary article: Dhruv Agarwal, Mor Naaman and Aditya Vashistha, "AI Suggestions Homogenize Writing Toward Western Styles and Diminish Cultural Nuances," *CHI 2025*, DOI [10.1145/3706598.3713564](https://doi.org/10.1145/3706598.3713564). Readable author manuscript [arXiv:2409.11360v3](https://arxiv.org/html/2409.11360).

| Claim | Direct source evidence | Warrant and boundary |
| --- | --- | --- |
| 118 participants | 60 participants from India, 58 from the U.S.; online Prolific sample; each performed four tasks | 472 **essays**, **not** 472 independent people; two country cohorts are not representative of all Western and non-Western societies |
| AI treatment | 65 participants received suggestions (36 India, 29 U.S.), with GPT-4o completion | Control and AI conditions; writing task, prompt and interface are experimental, not deployments with administrative decisions |
| Suggestions and uptake | 12,015 suggestions displayed; 1,476 accepted (12.3%); most non-acceptance occurred by typing past, not an explicit Escape choice | "Not accepted" is not necessarily deliberative refusal, and "accepted" alone does not imply institutional enactment |
| Classifier gap | Logistic regression over essay embeddings, 20-fold cross-validation: mean accuracy 90.6% without AI versus 83.5% with AI, **7.1 percentage points**; reported t(38)=2.25, p=.03 | Change in *a classifier's discrimination*, not a measurement that persons lost 7.1% of culture, sovereignty or identity |
| Source's caution | Authors explicitly discuss limited Indian Prolific population and how two national cohorts fail to capture internal cultures | No inference about any named Indigenous nation without separate situated research and permission |

The key distinctions above can be checked in [arXiv manuscript sections 3, 4, and 5.4](https://arxiv.org/html/2409.11360). The source also reports macro-F1 changes (89.9% to 82.9%) and tests against simpler grammar/explicit-marker explanations. These checks are relevant but still do not establish a unique mechanism of colonial governance.

### Inferential vulnerabilities to resolve before citing the experiment as strong causal proof

1. **Repeated measures.** Four essays came from each participant. Check whether the authors' essay-level classification folds group all four observations from the same author; a split that mixes an author's writing across train and test can overstate generalization to unseen writers. This is a **verification task**, not an assertion that the original study leaked subjects.
2. **Fold dependence.** The paper compares 20 fold-level accuracy measures across conditions using a t-test. Training sets in cross-validation overlap. A t-test assuming independent fold outcomes can have misleading nominal p-values. Request/reproduce uncertainty estimates using participant-clustered resampling, nested or group-stratified cross-validation, and a clearly defined prediction target.
3. **Causal estimands.** Distinguish (a) effect of assignment to an autocomplete condition on an essay metric; (b) effect of the exact set of suggestions shown; (c) effect of an accepted suggestion; and (d) actual downstream institutional action. Random assignment identifies (a) under assumptions, **not** automatically (b)-(d), because acceptance is selected by users.
4. **Cultural proxies.** Indian/U.S. national cohort labels and embedding-distance or authorship-classifier accuracy are not identical to cultural affiliation, cultural harm, or sovereignty; demographic imbalance, language fluency, task framing and recruitment matter.
5. **Mechanism specificity.** Differences could arise from suggestion content, costs of correction, literacy, prior familiarity, model version, or features of the user interface. The experiment does not separately randomize these components.

The original paper is empirical evidence for an *interface-conditioned change in writing*, with limits. The working *Gray Completion* article is a theoretical extension; it should state both plainly.

## 3. Formal disambiguation needed in the working article

Current notation treats \(C_t\) as context, \(A_t\) as retrieved/archived content, \(J_t\) as encoded permissions/jurisdiction, \(G_\theta\) as generator, \(\delta\) as all sociotechnical selection, and \(s^{op}_{t+1}\) as an operative successor. That is useful for exposition but merges **sampling**, **display**, **human adoption**, and **institutional action** into one \(\delta\), making the proposed claim difficult to test.

For the next version, define separate operations:

\[
q_t = G_\theta(C_t,A_t),\quad
u_t = \operatorname{display}(q_t,F_t),\quad
a_t = \operatorname{adopt}(u_t,U_t),\quad
s^{op}_{t+1} = \operatorname{enact}(s_t,a_t,J_t).
\]

Here \(F_t\) is measurable interface friction, \(U_t\) is the user's situated decision context, and \(J_t\) describes **enforced** permissions and institutional jurisdiction. This is proposed bookkeeping, **not a theorem or claimed explanatory law**. Some \(J_t\) may constrain model prompts; other parts reside solely in validation/enforcement after generation. The expression should not imply that an unenforced legal obligation is automatically a probabilistic condition inside the transformer.

To avoid equivocation, define a **state-realization event** only when a candidate has actually entered a consequential record/action under identified authority. Merely rendering a gray suggestion or accepting text into an unsent local draft is not by itself institutional realization. Track negative cases: rejected suggestions, local edits never transmitted, actions blocked by a rule, recipient refusal, and drafts later retracted.

The paper's statement that an autoregressive transformer is **not** a first-order Markov chain is technically correct. Expanded-state Markovization is a *modeling operation*, not an empirical observation about complete retention of situated memory. The political analogy must stay at that level. The word *realizer* should also be checked against its established uses in logic and computer science before claiming terminological novelty.

## 4. Three empirically separable hypotheses

**H1 — suggestion distribution.** For a specified task, model and interface, random assignment to displayed completion suggestions alters the distribution of authored textual features relative to no suggestions. Outcomes: lexical diversity, preserved culturally specific content *with participant-informed interpretation*, embedding similarities, edit distances and correction work. Existing CHI evidence supports this as a contingent effect in the studied sample, not as a universal law.

**H2 — presentation friction.** Holding candidate strings and tasks constant, changing the effort/latency to accept a suggestion changes uptake, modification and retained content. Suggested conditions: inline one-key acceptance; visible opt-in disclosure requiring deliberate action; no suggestion. Randomize the presentation at a suitable person/session level and audit carryover. An effect would establish an interface-selection mechanism without attributing an intention to the model.

**H3 — downstream authority.** Conditional on an appropriately authorized action system, the probability that model-suggested wording becomes a consequential institutional record depends on the downstream verification, veto and source-claim gates. Measure exact lineage: proposed → displayed → accepted/edited → filed/sent → acted upon, with explicit rejection, rollback and non-use. This has **not** been observed by the cited CHI study; it is the major missing empirical bridge in the proposed theory.

A potentially revealing falsifier for the strongest "governance" claim is high model uptake with **no** institutional decision consequence, or effective downstream refusal despite the model's default. Such cases must count against a sweeping state-realization assertion, not be relabeled as invisible governance.

## 5. Candidate study with pre-commitment, not retrospective storytelling

Commission one bounded, non-sensitive pilot in a consenting environment **before** expanding to community-specific or high-stakes cases. The design should preserve the ability to say no, avoid automated consequential decisions on real people, and test the mechanism rather than presupposing the theory.

- **Unit:** a consented participant/session composing a task whose alternatives can be measured. If multiple essays/session units share an author, cluster uncertainty by participant.
- **Treatments:** (i) no suggestion; (ii) fixed-model suggestion with low-friction acceptance; (iii) exactly the same candidate pool with opt-in or delayed acceptance. Use blinded, randomized candidate order where feasible. Record model version and the rendered candidate, not only output after editing.
- **Primary contrast:** intention-to-treat difference in fraction of prompts where *some displayed candidate* enters the final local artifact; secondarily model-text proportion, revisions, time/cognitive load and independently rated preservation of task-specific meaning.
- **Downstream extension:** a sandbox institutional workflow with explicit source-claim acceptance and veto. The only "enactments" are reversible test records. Measure how many suggestions survive independent receiving and how many are refused for reasons visible in evidence.
- **Analysis:** preregister estimands, primary endpoint, exclusions, missing-data rules, multiplicity, cluster handling and planned robustness checks. Use effect sizes and intervals; estimate a defensible sample size from pilot variance/power, not a convenient fixed count.
- **Permissions:** no Indigenous language, protocol, ceremony, oral history or community data collected as a generic convenience sample. Any such study needs nation/community-specific authorization, possession and non-use constraints, and substantive authority over publication and withdrawal.
- **Reproducibility:** separate source corpus versions, task setup, model/decoding configuration, instrument hashes, outcomes, adjudication and source-to-claim references. The reusable ingestion/execution functions should be purchased from Coesite Research Operations rather than copied into Lenticule.

This is **not** yet a preregistered or executed study: no sample was recruited, no instrument was deployed, no data or inference were generated under this protocol.

## 6. Boundaries against related scholarship

- Held, Harris, Best and Yang, [*A Material Lens on Coloniality in NLP*](https://arxiv.org/abs/2311.08391) (2023), analyze how geography and inequality accumulate across NLP pipelines. Their actor-network and quantitative geography work supports attention to infrastructures, **not** a direct numerical estimate of colonial harm from an autocomplete suggestion.
- Lazaro and Rizzi, [*Predictive Analytics and Governance: A New Sociotechnical Imaginary for Uncertain Futures*](https://doi.org/10.1017/S1744552322000477) (*International Journal of Law in Context*, 2023, online 2022), distinguish precaution, pre-emption and preparedness. Treat these as *analytic categories* to compare with successor selection, not as proof that a transformer or platform is a sovereign.
- Deloria's time/place argument, Rifkin's temporal sovereignty, Stark's Anishinaabe treaty account, and O'Brien's local historical cases each retain their own objects and situated authority. The current article is a synthesis **by its author**, not a single unified Indigenous account.

## 7. Scientific receiving judgment

**Disposition: substantial working article, major revision recommended before journal submission.** The case selection, source attribution limits, and technical caution are stronger than a generic polemic. The central unearned step is from measured writing change to institutional jurisdiction or time-governance. Preserve the paper's theoretical contribution, explicitly mark H3 as unverified, clarify correlated-essay and cross-validation inference, and specify a design capable of rejecting its strongest proposition.

**Deliverables already present:** source paper received byte-exact in the Social Theory Science domain; primary CHI source metadata and HCI results checked; three hypotheses and an ethical, measurable pilot framed here. **Deliverables still owed:** detailed historical source criticism, data/code replication or statistical reanalysis of the CHI study, original pilot evidence, and domain-level review of Indigenous political claims. None is an automatic obligation to publish a Substack essay or to relabel the author's existing prose as research.
