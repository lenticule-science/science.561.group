---
title: "The Gray Completion: Place, Time, and Language Models as State-Realizers of Governance"
status: "Working research article"
proposed_venue: "Environment and Planning D: Society and Space"
date: "2026-07-10"
---

# The Gray Completion

## Place, Time, and Language Models as State-Realizers of Governance

### Abstract

This article begins with an unexceptional contemporary scene: a writer pauses in an email or document and an AI completion appears in pale type. It is easy to call this convenience. It is harder to ask what kind of time is being organized when a system makes a low-friction proposal for what a situation should become next. I read that scene through Vine Deloria Jr.’s contrast between spatial and temporal religious orientations—not as a civilizational binary, but as a problem of political authorization. In Deloria’s account, temporal orientation makes places intelligible within a larger historical destiny; a spatial orientation makes time answerable to relations formed in and through particular places. The difference matters for AI because large language models do not simply represent the world or predict an already-given future. In situated use, they convert an operational present into ranked linguistic successors that can be accepted, circulated, filed, and acted upon.

The empirical hinge is a 2025 controlled study of GPT-4o autocomplete used for ordinary culturally grounded writing. Its low-visibility suggestions homogenized Indian participants’ English-language writing toward U.S. styles. The study is not evidence about Indigenous communities, and it does not itself claim to measure settler colonialism. It is instead a clear public micro-case of a mundane interface making a particular continuation easier than others. From there, the article traces a genealogy from Christian and secular universal history, through settler temporalization and geontopower, to algorithmic governmentality. It then gives a technically restrained account of Markov state sufficiency and transformer next-token generation. I propose *state-realizer* for the sociotechnical assemblage in which a language model, interface, user, and institutional workflow turn a probabilistic continuation into the next operative state of an affair. The point is neither that a transformer is literally a settler state nor that every AI use is colonial. It is that the contemporary language model generalizes a temporal operation long central to governance: rendering a heterogeneous present sufficiently legible to select and install its next state.

**Keywords:** Vine Deloria Jr.; settler time; generative AI; algorithmic governmentality; geontopower; deterritorialization; abolition geography; Indigenous protocol

## 1. The ordinary scene is already a theory of time

A writer stops for a moment. After one hundred milliseconds of silence, a completion appears in light gray beside the sentence already on the screen. It is short, grammatical, and offered as help. A press of the tab key installs it. The writer can also refuse it, edit it, or keep typing. Nothing in this scene resembles a police raid, a land transfer, or a court ruling. That is precisely why it is useful.

In a 2025 CHI study, Dhruv Agarwal, Mor Naaman, and Aditya Vashistha built just such an interface. One hundred and eighteen participants in India and the United States completed culturally grounded English writing tasks with or without GPT-4o autocomplete. In the AI condition, the system requested a suggestion after a brief pause, displayed it as inline ghost text, and let the participant accept it with tab, reject it with escape, or type past it (Agarwal, Naaman, and Vashistha 2025, 4–5). The arrangement is recognizably ordinary: this is the interaction grammar of contemporary mail clients, documents, browsers, code editors, and chat interfaces. Its force lies in its banality.

The study found a directional homogenization. With AI suggestions, texts by Indian participants became harder to distinguish from the U.S. participants’ texts; the classification accuracy reported by the authors fell from 90.6 percent without AI to 83.5 percent with it. The change was not reducible to spelling or grammar correction. In examples concerning festivals and food, texts that otherwise named ritual, region, kin, and specific practice were supplemented or displaced by generic descriptions of celebration, warmth, flavor, family, and prosperity. Participants in India also accepted more suggestions and modified them more frequently, a combination that records both use and the work required to make an ill-fitting suggestion serviceable (Agarwal, Naaman, and Vashistha 2025, 8–14).

This is an unusually good contemporary case precisely because it is not spectacular. It is public, reproducible, and already close to how a great many people encounter generative AI: not as an autonomous agent making a high-stakes decision, but as an apparently neutral completion inside ordinary writing. The opacity is not principally technical. The interface makes the operation feel like assistance rather than a proposal about what should follow. It makes a distribution of possible continuations appear as the next helpful thing to say.

The case does **not** stand in for an Indigenous community or prove that the particular participants were subjected to the same forms of dispossession as Indigenous peoples. That substitution would repeat the abstraction this article criticizes. Nor does the experiment measure “time-governance.” Its contribution is narrower and more valuable: it makes visible an interface mechanism by which a model’s default can enter a person’s situated writing, under conditions that reward speed and flow. The theoretical work begins there.

My argument is that the gray completion is a small instance of a much larger temporal apparatus. It takes a present—represented as a text prefix plus a task prompt—and makes it available for transition. It does not merely forecast the future; it offers a successor which may become the next sentence, then the next message, then the record of a decision, then a step in a workflow. This is the sense in which a language model can become a *state-realizer of time-governance*. It does not govern by itself, and it is not the State in any simple sense. It helps materialize a successor state once institutions, interfaces, and people make its proposal actionable.

That claim needs a vocabulary adequate to place, relation, and political authority. Vine Deloria Jr. provides one starting point.

## 2. Deloria’s problem: what authorizes the future?

The shorthand “religions of place and religions of time” risks making Deloria sound like he offered a static opposition between Indigenous people and everyone else. He did not. In *God Is Red*, Deloria’s terms are more exactly **spatial** and **temporal** orientations, and he insists that both time and place matter in every religious formation. His polemical contrast concerns what becomes primary: temporal religions organize meaning through events in a universal history, while spatial religious traditions locate meaning in particular places and the relationships they sustain (Deloria 2003, chap. 4).

The stakes of that distinction are political. A temporally organized account can turn a place into the scene on which a redemptive story unfolds: creation, fall, covenant, conversion, discovery, development, progress, revolution, salvation. In its secular U.S. variants, Deloria saw Manifest Destiny, racial historical destiny, and technological control of nature as transformations rather than abandonments of that temporal structure. Place remains important, but as territory, resource, proof, obstacle, or future site of fulfillment. Its significance is authorized elsewhere—in the direction of history.

A spatial orientation reverses the burden of explanation. Time does not disappear; it is not a romantic timeless present. Rather, time happens inside relationships that have to be renewed among human beings, other-than-human beings, ancestors, institutions, and particular land. Recent work by Rene Ramirez usefully names the resulting formulation in Deloria’s writings **local time**: time is located, communal, and cyclically arranged, not a sequence abstracted from the relations that make it matter (Ramirez 2025). This is not a claim that all Indigenous peoples share one ontology, nor that a people’s relation to place is adequately represented by a map coordinate. It is a claim about obligation and jurisdiction: what counts as an event, a change, a responsibility, or a future depends upon relationships that cannot be supplied by an external historical clock.

This is close to what Glen Coulthard and Leanne Betasamosake Simpson call grounded normativity: ethical frameworks generated through Indigenous place-based practices, rather than rules applied from above to an interchangeable terrain (Coulthard and Simpson 2016). Mark Rifkin’s work on temporal sovereignty adds an essential guardrail. The problem is not solved by declaring Indigenous peoples “coeval” with settlers—an apparently generous move that still leaves settler institutions in charge of deciding what counts as contemporary. Nor is it solved by assigning Indigenous life to “tradition.” Temporal sovereignty names political practices that refuse the state’s monopoly on the present and its schedule of recognition (Rifkin 2017).

Treaty makes the difference especially concrete. In an Anishinaabe-specific account, Heidi Kiiwetinepinesiik Stark shows how respect, responsibility, and renewal organize treaty-making as an ongoing relationship, including relations beyond the human, rather than as a completed exchange exhausted by a written instrument (Stark 2010). This is not a universal definition of treaty, and it does not soften the force of treaty law. It shows why the temporal form matters: a state can file a treaty as a past event, calculate its effects through a bounded administrative record, or recognize it on its own timetable. A relational treaty account requires recurring practices of answerability. Its past is not inert evidence for a future decision; it continues to make demands in the present.

It would be an error to turn this account into a red/blue metaphysics. Deloria’s categories are analytical, pedagogical, and historically situated. Indigenous Christianities do not simply cease to be land-based; Christian traditions themselves contain internal struggles over land, covenant, and political authority. Michael McNally has cautioned that *God Is Red* uses the category of religion fluidly and strategically, and that the book’s strong contrasts should be read alongside lived practices and communities rather than as a total taxonomy (McNally 2022). The same caution applies here. “Time-governance” does not mean that Christians, liberals, radicals, or settlers all have identical beliefs. It names a recurring political form: a future is authorized as universal, and the relations of a place are made answerable to that authorization.

The challenge for a theory of AI is therefore not to announce that language models lack “Indigenous values.” That would imply a single repository of values waiting to be added to a model. The Indigenous Protocol and Artificial Intelligence Position Paper rejects exactly this move: its authors stress the plurality of Indigenous knowledge systems and state that no general document substitutes for reciprocal relations with particular communities (Lewis et al. 2020, 4–5). The more precise question is: **when an AI system proposes what should happen next, whose relations have been compressed into its present, whose obligations can constrain its proposal, and who has authority to refuse its installation?**

## 3. A genealogy of the governable future

### 3.1 Universal history and the temporal distancing of place

Deloria’s distinction belongs to a longer critical account of how modern power makes time do territorial work. Christianity is not reducible to linear history, and secular modernity is not merely disguised theology. But a historically powerful alignment links providential history, imperial expansion, development, and modern progress: different places become comparable according to their putative position on one developmental path. The question shifts from “what relations obtain here?” to “where is this place on history’s route?”

Johannes Fabian described one consequence in anthropology as the denial of coevalness: researchers encounter people in a shared present but represent them as inhabiting another time (Fabian 2002). Settler historical practice made a related maneuver more materially consequential. Jean M. O’Brien shows how nineteenth-century New England local histories “firsted” settlers and “lasted” Indians: settlers appeared as founders of a living civic modernity, while Indigenous peoples were narrated as already vanished or vanishing. This was not simply false chronology; it was a way of making land claims and political authority appear settled (O’Brien 2010).

The settler state is not only a sovereign that happens to have a past. It is an apparatus that makes authoritative temporal sequences: title, survey, registration, improvement, development, conservation, recognition, deadline, sunset, transition. These categories do not merely describe land. They arrange whose prior relation is legible as history, whose current relation is legible as use, and whose future relation counts as a plan. The archive is part of this operation, but not because archives are intrinsically colonial. Its political question is whether documentary sequence is allowed to displace or subordinate the relations it cannot contain.

Deloria’s intervention is stronger than a plea to include more places in the same history. It asks whether historical narration has been wrongly allowed to decide the meaning of place. This is why the contrast bears on liberal progress and some radical politics as well. A future-oriented politics can oppose the existing state and still treat actual relations as raw material for a redeemed future: after revolution, after transition, after growth, after justice. The problem is not having a future. The problem is treating the future as a court of appeal that overrides the obligations created by the changes it demands.

### 3.2 From territorial abstraction to geontopower

Elizabeth Povinelli’s account of geontopower extends this question beyond the familiar language of biopolitical management. Geontopower, for Povinelli, concerns late liberal governance through the distinction between Life and Nonlife and through figures such as the Desert, the Animist, and the Virus (Povinelli 2016). It matters here because it prevents “place” from becoming a soft synonym for environment. The conflict is not simply between living culture and inert land. Late liberal regimes determine which arrangements of mineral, water, organism, infrastructure, relation, and obligation count as life, resource, heritage, risk, or inert substrate.

Povinelli’s work is grounded in Indigenous Australian contexts and should not be used as a generic description of Lakota thought or of every Indigenous political formation. But it clarifies a problem that Deloria’s spatial analysis opens: the state does not only territorialize by drawing lines. It also fixes the ontological terms under which a place can appear before law, capital, policy, and expertise. A relation can be recognized as a cultural belief while the land to which it is answerable is treated as extractable nonlife. The result is not merely temporal displacement but an enclosure of what is allowed to matter.

Deleuze and Guattari’s language of deterritorialization and reterritorialization helps name a parallel movement in the gray completion, if used with restraint. A situated account is detached from the practical relations in which it was offered and becomes portable text: prompt, token sequence, embedding, training datum, recommendation. It is then reterritorialized in a genre with its own norms—professional email, plan, product specification, summary, application, post. This is not a claim that every translation is violence or that relation is pure before mediation. It is a way of tracking a specific capture: portability lets an account travel, but the platform and genre decide the terms on which it can return as an actionable statement (Deleuze and Guattari 1987).

The point becomes sharp in the autocomplete case. The suggestion does not need to erase every cultural word to make a difference. It can retain names while reformatting their significance into a generic and globally legible description. The relevant loss is not authenticity, as though culture were a storehouse of pure content. It is jurisdiction over the relation: who gets to determine what a festival, kin practice, place, or obligation is *for* in the present sentence and in the next practical step.

### 3.3 Prediction, preemption, and algorithmic governmentality

The twentieth- and twenty-first-century technical genealogy is not a smooth sequel to Christian history. It is a new apparatus with its own material infrastructures, labor relations, and forms of uncertainty. Rouvroy and Berns call algorithmic governmentality a mode of governance that acts on data-derived profiles and potentialities while bypassing the reflexive subject addressed by law or discipline (Rouvroy and Berns 2013). Its characteristic move is not primarily to tell an individual who they are. It is to process traces so that an intervention can occur before an uncertain future becomes an event.

Lazaro and Rizzi make the temporal point explicit: predictive analytics does not simply discover a future. It renders a future imaginable, calculable, and actionable in the present, thereby reorganizing how governance relates to uncertainty (Lazaro and Rizzi 2023). This literature is indispensable, but it does not fully describe the case of a writing assistant. A risk model may sort or flag a population without speaking to anyone. The gray completion speaks in the user’s sentence. It governs less by classifying a person than by offering a plausible continuation of their action.

That difference is consequential. The language model’s ordinary interface distributes anticipatory governance beyond institutions visibly called “government.” It enters drafting, planning, searching, tutoring, customer service, grant writing, care coordination, coding, and the preparation of records. Its political significance is not that every generated sentence is a command. It is that the machine increasingly supplies the candidate descriptions through which people and institutions decide what the next state of an affair is.

This is also why a critique confined to model “bias” is too small. Coloniality in natural-language processing is not only a matter of offensive outputs. Held, Harris, Best, and Yang argue that it is embedded and amplified across data, algorithms, and software, with inequalities accumulating as NLP systems build on prior systems (Held et al. 2023). The gray completion is a surface expression of that accumulation: data geography, model defaults, interface friction, language hierarchy, and institutional demand for fluent output meet at the tab key.

## 4. What a language model actually does—and what the analogy must not claim

The claim that AI realizes state must not be bought at the price of technical mystification. A transformer is not a mystical engine of destiny; nor is it a first-order Markov chain with a more expensive name. The technical account matters because it identifies the particular abstraction through which a heterogeneous present becomes available for continuation.

### 4.1 The Markov question is a question of sufficient history

For a discrete-time Markov chain \(X_t\), the Markov property is conventionally written:

\[
\Pr(X_{t+1}=j \mid X_t=i, X_{t-1},\ldots,X_0)
= \Pr(X_{t+1}=j \mid X_t=i).
\]

The point is not that reality has no past. It is that the state \(X_t\) has been defined so that the relevant past is treated as already contained in the present state for the transition at hand (Norris 1997). State construction is therefore an ethical and political question as well as a mathematical one. What must be retained, and what can be forgotten, for a system to say: *this is enough of the present to decide what comes next?*

Settler governance has repeatedly answered that question through property, population, jurisdiction, improvement, risk, and archive. A parcel number, eligibility category, case file, or environmental assessment is not the whole of a place; it is a state description made sufficient for a particular administrative transition. The danger is not that every abstraction is forbidden. Collective action always requires some descriptions. The danger is when an abstraction claims jurisdiction over the relations it has excluded, or when its outcome is installed as if the excluded relations had never been conditions of the decision.

This is the productive, limited sense in which Markov chains illuminate time-governance. The analogy is about **state sufficiency**, not a claim that land, culture, or governance literally evolves as a Markov process. It asks what a system has to render irrelevant so that a present becomes administratively transitionable. A place-based account of time refuses the easy answer. It holds that obligations may be neither compressible into a state vector nor dischargeable by a single future-oriented transition.

### 4.2 A transformer is autoregressive, not simply Markovian

Autoregressive language models assign probabilities to sequences by factorizing them as

\[
p_\theta(x_{1:n}) = \prod_{t=1}^{n} p_\theta(x_t \mid x_{<t}).
\]

At generation time, the model produces a distribution over a next token conditioned on the preceding context, and a decoding procedure selects or samples a token. The transformer architecture introduced by Vaswani et al. uses attention rather than recurrence or convolution; in a decoder, causal masking allows a position to attend to earlier positions while blocking later ones so that the autoregressive property is preserved (Vaswani et al. 2017).

Calling this “Markov” without qualification would be wrong. A decoder may attend across a long token prefix within its context window. Its next-token distribution is not, in general, conditioned only on the immediately preceding token. One can mathematically enlarge the state to include the whole retained prefix, cached activations, retrieved documents, system instruction, and tool state; the resulting sequential process can then be represented as Markovian in that expanded state. But that is a modeling move, not a discovery that the transformer preserves a whole history.

The distinction is exactly the point. The context window is a technical memory, not a relation. Retrieval can append a document, but it cannot by itself establish who has authority to speak for it, whether its circulation is permitted, which obligations govern its use, or whether the relevant relation should be represented as text at all. Model context is an engineered record selected under limits of token budget, product design, access control, and data availability. It may include a great deal of language while excluding the jurisdiction that makes language answerable.

The question is not whether transformers have “memory.” They do, in constrained and technically specific forms. The question is what counts as a sufficient present once the system converts those forms of memory into next-token probabilities. This is where Deloria’s problem returns: a temporal apparatus can treat a place-bound obligation as a datum in the past of a generalized future; a place-based relation may require that the conditions of a future remain answerable to the relation itself.

### 4.3 From token distribution to operative successor: a proposed schema

The following is a conceptual schema, not a causal model validated by the autocomplete study. Let

- \(C_t\) be the user’s current textual and task context;
- \(A_t\) be any supplied archive, retrieval result, memory, or profile;
- \(J_t\) be the permissions, policies, jurisdictional constraints, and interface rules actually encoded or enforced;
- \(G_\theta\) be the model;
- \(\mathcal{D}_\theta(Y_{t+1}\mid C_t,A_t,J_t)\) be its distribution over candidate continuations; and
- \(\delta\) be the sociotechnical selection process: decoding, ranking, interface presentation, user uptake, and any later institutional or tool-mediated action.

Then the relevant sequence is:

\[
(C_t,A_t,J_t)
\xrightarrow{G_\theta}
\mathcal{D}_\theta(Y_{t+1})
\xrightarrow{\delta}
y^*_{t+1}
\xrightarrow{\text{uptake / enactment}}
s^{\mathrm{op}}_{t+1}.
\]

The first arrow is model inference. The second is not: it is where a product designer’s defaults, a user’s needs, a keyboard shortcut, a manager’s rubric, a deadline, or an automated workflow turns a distribution into a displayed candidate. The third is where the candidate becomes part of an operative social state: a sent message, a completed case note, an application, a policy draft, a task assignment, a database update, or a tool call. A model can be technically accurate at the first arrow and politically disastrous at the third. Conversely, a community may refuse or repurpose a technically ordinary output at the second. The layers cannot be collapsed.

I use **state-realizer** for the full assemblage when it performs the third movement: when it helps make a proposed successor become the next state in which action is expected, judged, or carried forward. The term has a deliberate double edge. In computer science, a state is a representation adequate for transition. In political theory, the state is an institution that monopolizes or coordinates legitimate ordering. The argument is not that an LLM has sovereignty. It is that, inside contemporary institutional infrastructures, the technical demand for a transition-ready state can align with the state’s long practice of making a complex present governable through authoritative successors.

This account also explains why generative AI is not just another predictive system. A credit-risk score may determine whether a person receives a loan; an autocomplete phrase may seem too small to compare. But language is itself an action-bearing medium. The model can supply the sentence that frames the case, the plan that organizes a meeting, the reasons that justify a decision, the summary that travels upward, or the “next steps” that become a work queue. As models are joined to retrieval, long-context memory, and tool-using agent architectures, the gap between proposing and enacting a successor can shrink. ReAct, for example, formalized a pattern in which language models interleave textual reasoning with actions that query an external environment (Yao et al. 2023). The frontier is therefore not a singular machine takeover. It is the ongoing shortening of the path from modeled continuation to institutional effect.

## 5. Returning to the gray completion

The autocomplete study lets us see the schema in miniature. The participant’s typed words, task prompt, and the application’s instruction become \(C_t\). GPT-4o produces a short candidate continuation. The interface places it immediately beside the participant’s text and offers tab as the cheapest path to continuation. The proposed text becomes operative only when the participant accepts, edits, or writes around it. The study’s point is not that participants lacked agency. Their modification behavior demonstrates the opposite: they worked with, against, and through the suggestions.

But agency here is not evenly distributed. The interface gives the suggestion an advantage of timing, fluency, and visibility; productivity is a reason to accept it; and the model’s training and prompt design constrain what appears before deliberation. When a culturally specific description is repeatedly met with generic phrasing, a writer may correct it, accept it, or learn to write toward it. The important political unit is neither the isolated model output nor the isolated individual choice. It is the repeated transition through which a model default becomes part of the practical present.

Read through Deloria, the problem is not simply that a description has become “Western.” It is that an account grounded in particular relations can be made legible as a generic object in a universal field of communication. The fact that the text remains about Diwali or biryani does not settle the matter. The question is whether the relation is allowed to author its own temporal significance—what must be remembered, what obligations it activates, what future it opens—or whether it is translated into the kind of portable, affirmative, future-ready language preferred by the interface.

This is a conceptual extension of the experiment, not its empirical conclusion. It is also a hypothesis that needs different forms of research: community-governed studies of actual systems in actual decision contexts; interface audits that trace suggestions through revision and institutional uptake; and material studies of the data, labor, energy, and contractual arrangements that make the service possible. The limited case warrants a limited claim: a mundane language interface can perform a normalizing selection before the user encounters it as a political decision.

## 6. Place against the abstract future: implications for abolition and AI

An abolitionist reading should not turn place into refusal of all technical futures. Ruth Wilson Gilmore’s abolition geography is useful because it treats abolition as a practical remaking of the conditions of life, not as a distant redemption earned after the correct historical transition (Gilmore 2022). The question is not whether an AI system can be given a better future-state objective. It is whether the infrastructures that produce its states are accountable to the relations they transform.

That reframes several familiar proposals.

First, *representation* is not enough. A more diverse dataset may alter which continuations appear, but it does not by itself give a community jurisdiction over whether, when, and under what protocol relation becomes data, context, or output. The Indigenous Protocol and AI position paper points toward a stronger demand: systems developed with or for Indigenous communities must be responsible and accountable to those communities first, through protocols that are themselves local and relational rather than imported as a universal ethics layer (Lewis et al. 2020).

Second, *customization* is not enough. Fine-tuning or prompting can make a system sound culturally fluent while leaving the platform’s extraction, ownership, default future orientation, and authority structure intact. A model that produces the “right” words but cannot recognize a refusal, a restriction on circulation, or a relation not available for computational use has not become place-responsive. It has merely become more convincing.

Third, *human in the loop* is not enough. The autocomplete case already has a human in the loop. The political issue is who bears the cost of correction, whose uptake is rewarded, and which institutional arrangements turn an accepted phrase into a consequential state change. A meaningful intervention must modify the transition itself: access, consent, provenance, non-use, review authority, retention, interface friction, and the ability to stop a workflow before it creates a new record or action.

Finally, the goal cannot be a generic “Indigenization” of AI for use by settler institutions. That language can easily detach Indigenous thought from Indigenous authority and reinstall it as a resource for a universal future. The more defensible program is plural and jurisdictional: particular peoples and communities determine whether AI belongs in a relation at all, what it may know, what it may not transform into a state, and what forms of refusal must remain non-negotiable. Those constraints will sometimes produce useful systems and sometimes require the absence of a system.

## 7. Conclusion: the successor is not innocent

The gray completion is not sovereign. It does not contain a theology. It cannot, on its own, dispossess anyone, recognize a treaty, honor a protocol, or govern a place. But it is not politically innocent convenience either. It operationalizes a particular relation to the present: represent enough of it, calculate what is likely or useful next, and make one continuation easier to install than the rest.

Deloria’s spatial-temporal distinction names what this operation risks displacing. A religion of time, in the analytic sense developed here, permits a place to become material for a destination authorized elsewhere. A politics of place does not abolish the future; it refuses a future that need not answer to the relations it rearranges. The difference is not between backward-looking people and forward-looking people. It is between a future that treats relation as an input and a future that remains obligated to relation as it happens.

Language models sit at this fault line because they are machines for conditional continuation. Their formal task is to turn a retained context into a distribution over what comes next. Their social force appears when institutions make that continuation consequential. The task for critical AI scholarship is thus not to attribute intention to the model, nor to use Indigenous theory as a moral texture for technical critique. It is to identify every point at which a heterogeneous, place-bound present is compressed into a transition-ready state; to ask who controls that compression and its successors; and to build or refuse systems accordingly.

The political question is not, finally, whether the machine can predict the future. It is who gets to make a future present, and at whose expense.

## References

Agarwal, Dhruv, Mor Naaman, and Aditya Vashistha. 2025. “AI Suggestions Homogenize Writing Toward Western Styles and Diminish Cultural Nuances.” *Proceedings of the 2025 CHI Conference on Human Factors in Computing Systems*, 1–21. https://doi.org/10.1145/3706598.3713564.

Coulthard, Glen Sean, and Leanne Betasamosake Simpson. 2016. “Grounded Normativity/Place-Based Solidarity.” *American Quarterly* 68 (2): 249–55. https://doi.org/10.1353/aq.2016.0038.

Deleuze, Gilles, and Félix Guattari. 1987. *A Thousand Plateaus: Capitalism and Schizophrenia*. Translated by Brian Massumi. Minneapolis: University of Minnesota Press.

Deloria, Vine Jr. 2003. *God Is Red: A Native View of Religion*. 30th anniversary ed. Golden, CO: Fulcrum.

Fabian, Johannes. 2002. *Time and the Other: How Anthropology Makes Its Object*. New York: Columbia University Press. Originally published 1983.

Gilmore, Ruth Wilson. 2022. *Abolition Geography: Essays Towards Liberation*. Edited by Brenna Bhandar and Alberto Toscano. London: Verso.

Held, William, Camille Harris, Michael Best, and Diyi Yang. 2023. “A Material Lens on Coloniality in NLP.” arXiv:2311.08391. https://arxiv.org/abs/2311.08391.

Lazaro, Christophe, and Marco Rizzi. 2023. “Predictive Analytics and Governance: A New Sociotechnical Imaginary for Uncertain Futures.” *International Journal of Law in Context* 19 (1): 70–90. https://doi.org/10.1017/S1744552322000477.

Lewis, Jason Edward, ed. 2020. *Indigenous Protocol and Artificial Intelligence Position Paper*. Honolulu, HI: Initiative for Indigenous Futures and Canadian Institute for Advanced Research. https://doi.org/10.11573/spectrum.library.concordia.ca.00986506.

McNally, Michael D. 2022. “The Impact of *God Is Red* on Religious Studies.” Harvard Divinity School, Women’s Studies in Religion Program. https://wsrp.hds.harvard.edu/news/2022/11/7/video-impact-god-red-religious-studies.

Norris, J. R. 1997. *Markov Chains*. Cambridge: Cambridge University Press.

O’Brien, Jean M. 2010. *Firsting and Lasting: Writing Indians Out of Existence in New England*. Minneapolis: University of Minnesota Press.

Povinelli, Elizabeth A. 2016. *Geontologies: A Requiem to Late Liberalism*. Durham, NC: Duke University Press.

Ramirez, Rene. 2025. “Local Time: A Placed-Based Account of Time in Vine Deloria Jr.’s Various Works.” *APA Studies on Native American and Indigenous Philosophy* 24 (2): 9–15. https://cdn.ymaws.com/www.apaonline.org/resource/collection/13B1F8E6-0142-45FD-A626-9C4271DC6F62/NativeAmericanV24n2.pdf.

Rifkin, Mark. 2017. *Beyond Settler Time: Temporal Sovereignty and Indigenous Self-Determination*. Durham, NC: Duke University Press.

Rouvroy, Antoinette, and Thomas Berns. 2013. “Algorithmic Governmentality and Prospects of Emancipation: Disparateness as a Precondition for Individuation through Relationships.” *Réseaux* 177 (1): 163–96. https://doi.org/10.3917/res.177.0163.

Stark, Heidi Kiiwetinepinesiik. 2010. “Respect, Responsibility, and Renewal: The Foundations of Anishinaabe Treaty Making with the United States and Canada.” *American Indian Culture and Research Journal* 34 (2): 145–64. https://escholarship.org/uc/item/8gk1f6g0.

Tuck, Eve, and K. Wayne Yang. 2012. “Decolonization Is Not a Metaphor.” *Decolonization: Indigeneity, Education & Society* 1 (1): 1–40.

Vaswani, Ashish, Noam Shazeer, Niki Parmar, Jakob Uszkoreit, Llion Jones, Aidan N. Gomez, Łukasz Kaiser, and Illia Polosukhin. 2017. “Attention Is All You Need.” In *Advances in Neural Information Processing Systems 30*. https://papers.neurips.cc/paper/7181-attention-is-all-you-need.pdf.

Yao, Shunyu, Jeffrey Zhao, Dian Yu, Nan Du, Izhak Shafran, Karthik Narasimhan, and Yuan Cao. 2023. “ReAct: Synergizing Reasoning and Acting in Language Models.” In *International Conference on Learning Representations*. https://openreview.net/forum?id=WE_vluYUL-X.
