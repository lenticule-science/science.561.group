---
title: Semantic Web, Jiangshi Web
date-created: 2026-03-05
tags:
- semantic-web
- daoism
- information-architecture
- ontology
- web-infrastructure
- cybernetics
- traditional-chinese-medicine
references:
  - id: bernerslee_SemanticWeb_2001
    type: article-journal
    title: The Semantic Web
    volume: 284
    issue: 5
    author:
      - literal: Tim Berners-Lee
      - literal: James Hendler
      - literal: Ora Lassila
    container-title: Scientific American
    page: 34-43
    issued:
      - year: 2001
  - id: suchman1987
    type: document
    title: Plans and Situated Actions: The Problem of Human-Machine Communication
    author:
      - literal: Lucy A. Suchman
    container-title: Cambridge University Press
    issued:
      - year: 1987
  - id: dreyfus1972
    type: document
    title: What Computers Can''t Do: A Critique of Artificial Reason
    author:
      - literal: Hubert L. Dreyfus
    container-title: Harper & Row
    issued:
      - year: 1972
  - id: bowkerstar1999
    type: document
    title: Sorting Things Out: Classification and Its Consequences
    author:
      - literal: Geoffrey C. Bowker
      - literal: Susan Leigh Star
    container-title: MIT Press
    issued:
      - year: 1999
  - id: shirky2003
    type: document
    title: The Semantic Web, Syllogism, and Worldview
    author:
      - literal: Clay Shirky
    issued:
      - year: 2003
    URL: https://shirky.com/writings/semantic_syllogism.html
  - id: argyris1978
    type: document
    title: Organizational Learning: A Theory of Action Perspective
    author:
      - literal: Chris Argyris
      - literal: Donald A. Schön
    container-title: Addison-Wesley
    issued:
      - year: 1978
  - id: deGroot1892
    type: article-journal
    title: The Religious System of China
    volume: 5
    author:
      - literal: J. J. M. de Groot
    container-title: E. J. Brill
    issued:
      - year: 1892
  - id: luo2009
    type: article-journal
    title: The Jiangshi: A Study of the Chinese Hopping Vampire in Literature and Film
    volume: 68
    issue: 2
    author:
      - literal: Hui Luo
    container-title: Asian Ethnology
    page: 339-359
    issued:
      - year: 2009
  - id: schipper1993
    type: document
    title: The Taoist Body
    author:
      - literal: Kristofer Schipper
    container-title: University of California Press
    issued:
      - year: 1993
  - id: kohn2000
    type: document
    title: Daoism Handbook
    author:
      - literal: Livia Kohn
    container-title: Brill
    issued:
      - year: 2000
  - id: watson2003
    type: document
    title: Zhuangzi: Basic Writings
    author:
      - literal: Burton Watson
    container-title: Columbia University Press
    issued:
      - year: 2003
  - id: lau1963
    type: document
    title: Lao Tzu: Tao Te Ching
    author:
      - literal: D. C. Lau
    container-title: Penguin Books
    issued:
      - year: 1963
  - id: w3c_rdf2014
    type: document
    title: RDF 1.1 Concepts and Abstract Syntax
    author:
      - literal: W3C
    container-title: W3C Recommendation
    issued:
      - year: 2014
    URL: https://www.w3.org/TR/rdf11-concepts/
  - id: w3c_owl2012
    type: document
    title: OWL 2 Web Ontology Language Document Overview
    author:
      - literal: W3C
    container-title: W3C Recommendation
    issued:
      - year: 2012
    URL: https://www.w3.org/TR/owl2-overview/
  - id: w3c_sparql2013
    type: document
    title: SPARQL 1.1 Query Language
    author:
      - literal: W3C
    container-title: W3C Recommendation
    issued:
      - year: 2013
    URL: https://www.w3.org/TR/sparql11-query/
  - id: gruber1993
    type: article-journal
    title: A Translation Approach to Portable Ontology Specifications
    volume: 5
    issue: 2
    author:
      - literal: Thomas R. Gruber
    container-title: Knowledge Acquisition
    page: 199-220
    issued:
      - year: 1993
  - id: hitzler2021
    type: article-journal
    title: A Review of the Semantic Web Field
    volume: 64
    issue: 2
    author:
      - literal: Pascal Hitzler
    container-title: Communications of the ACM
    page: 76-83
    issued:
      - year: 2021
  - id: maturana1980
    type: document
    title: Autopoiesis and Cognition: The Realization of the Living
    author:
      - literal: Humberto R. Maturana
      - literal: Francisco J. Varela
    container-title: D. Reidel Publishing Company
    issued:
      - year: 1980
  - id: jullien2004
    type: document
    title: A Treatise on Efficacy: Between Western and Chinese Thinking
    author:
      - literal: François Jullien
    container-title: University of Hawai'i Press
    issued:
      - year: 2004
  - id: jullien1995
    type: document
    title: The Propensity of Things: Toward a History of Efficacy in China
    author:
      - literal: François Jullien
    container-title: Zone Books
    issued:
      - year: 1995
  - id: guha2016
    type: article-journal
    title: Schema.org: Evolution of Structured Data on the Web
    volume: 59
    issue: 2
    author:
      - literal: R. V. Guha
      - literal: Dan Brickley
      - literal: Steve Macbeth
    container-title: Communications of the ACM
    page: 44-51
    issued:
      - year: 2016
---

## Abstract

The Semantic Web did not fail. RDF graphs are queried daily, knowledge graphs underpin search engines, [biomedical ontologies](../../../../../../../../../science/theories/information/terms/biomedical-ontologies.md) coordinate research across institutions. The problem is not that the Semantic Web stopped working but that it works in a particular way — data circulates, queries execute, triples accumulate, and none of it can question whether its own categories still fit.

Chinese folklore has a figure for this condition: the jiangshi (僵尸), the hopping corpse. A body whose joints have locked, animated by residual vital energy but incapable of flexible movement. The jiangshi is not dead. Its problem is more specific: it cannot change how it moves.

This paper uses the jiangshi to diagnose the Semantic Web, draws on François Jullien's comparative work on Chinese and Western conceptions of efficacy to describe what a less rigid alternative would look like, and applies the same diagnostic to large language models — arguing that their contextual fluency constitutes sophisticated operational activity, not the reflective capacity it resembles. The practical success of Schema.org suggests this analysis is not only philosophical.

## 1. A familiar critique and what it misses

Lucy Suchman showed in 1987 that formal plans cannot capture situated action [@suchman1987]. Hubert Dreyfus argued that symbolic AI mistakes rule-following for understanding [@dreyfus1972]. Geoffrey Bowker and Susan Leigh Star demonstrated that classification systems embed political choices while presenting them as infrastructure [@bowkerstar1999]. Clay Shirky applied these insights directly to the Semantic Web in 2003, arguing that it conflates syllogistic logic with the contextual process by which meaning operates [@shirky2003].

All of this is right. But it leaves a gap. If the Semantic Web is rigid, brittle, and politically loaded — what kind of thing is it, exactly? "Rigid" is vague. A brick wall is rigid. So is a cast on a broken leg. These are different situations. The Semantic Web is not inert like a wall and not therapeutic like a cast. It moves. Data flows through it. Queries return results. Reasoners derive new triples. It is animated — but animated in a way that forecloses adaptation.

In [cybernetic](../../../../../science/theories/information/disciplines/cybernetics/index.md) terms, the Semantic Web performs [single-loop learning](../../../../../../../../../science/theories/information/theories/cybernetics/terms/single-loop-double-loop-learning.md) without double-loop learning [@argyris1978]. It corrects within its frames — adjusting data, resolving queries, deriving new triples from existing schemas — but it cannot question whether the frames themselves still serve. The existing critical vocabulary names this as a deficiency but does not name it precisely. For that, we need the jiangshi.

## 2. The jiangshi

The jiangshi appears in Qing-era literati collections and earlier folk traditions. J. J. M. de Groot documented its place in Chinese funerary practice in the 1890s [@deGroot1892] — colonial-era ethnography that should be read with appropriate caution. More recent work in Chinese folklore studies treats the jiangshi within the broader ecology of Chinese ideas about death, spiritual residue, and the persistence of animation after the departure of the animating principle [@luo2009].

What defines the jiangshi is not that it is dead. A corpse is dead. The jiangshi is something stranger: a body that moves after the spirit has left. Rigor mortis has locked its joints. It hops rather than walks — the knees and ankles do not bend. It is drawn toward sources of living energy and follows the most direct available path. A talisman on the forehead or a line of sticky rice across a threshold can redirect it, because it lacks the capacity to navigate around obstacles by reconsidering its approach.

The Daoist philosophical vocabulary behind this figure distinguishes three layers of vitality, known as the [Three Treasures](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/san-bao.md) (san bao 三寶) [@schipper1993; @kohn2000]:

- **[Jing](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/jing.md)** (精): essence, the stored substrate — persistent data, records at rest.
- **[Qi](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/qi.md)** (氣): circulating energy, the operational layer — data flows, query execution, processes running.
- **[Shen](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/shen.md)** (神): reflective awareness — the capacity to question whether current categories still fit the situation they were built for.

The jiangshi has Jing (it has a body) and Qi (it moves). It lacks Shen. It reacts but does not reflect. It can traverse a corridor but cannot ask whether the corridor leads anywhere useful.

Two qualifications. First, this Jing/Qi/Shen framework is not a general theory of information systems. It is a diagnostic vocabulary — a way to name what is present and what is absent in a specific situation. Second, Daoism itself is not uniformly anti-structure. Ritual Daoism — the Heavenly Masters tradition, the Lingbao liturgies — is elaborately formalized [@kohn2000]. The Zhuangzi's preference for spontaneity coexists with detailed cosmological systems and liturgical prescriptions. The Daoist objection is not to structure but to structure that has lost contact with the situation it structures [@watson2003]. Form is necessary; over-fixation on form is the deviation [@lau1963].

## 3. The Semantic Web's joints

Tim Berners-Lee, James Hendler, and Ora Lassila proposed the Semantic Web in 2001 as a layer of machine-interpretable meaning over the existing web [@bernerslee_SemanticWeb_2001]. The W3C formalized it through three interlocking specifications: RDF for describing resources as triples [@w3c_rdf2014], OWL for building formal ontologies [@w3c_owl2012], and SPARQL for querying the resulting graphs [@w3c_sparql2013].

An ontology, in Thomas Gruber's definition, is "an explicit specification of a conceptualization" [@gruber1993]. The Semantic Web proposed to build such specifications at web scale. This commits the architecture to several things at once: globally unique identifiers (URIs are presumed stable and unambiguous), crisp typing (instances belong or do not belong to classes by logical conditions), monotonic reasoning (adding data never invalidates prior conclusions), and an open world assumption (absence of a statement does not entail its negation).

The early web's basic joint was the untyped hyperlink. A link from page A to page B could mean citation, recommendation, disagreement, parody, or nothing in particular. The Semantic Web replaced this with typed relations: not just that A connects to B, but that A bears a specific declared relationship to B, anchored in an ontology that defines what that relationship means and what inferences follow from it.

That is what it means to stiffen the joints of the web.

## 4. Diagnosis

### 4.1 The correspondence

The jiangshi's stiff joints correspond to the Semantic Web's ontological commitments — the fixed types and relations that determine what movements are available. Its path-following hops correspond to reasoners and queries traversing triple graphs along typed edges. Its residual Qi without Shen corresponds to data circulating through infrastructure that cannot reflect on whether its own categories still serve. Its susceptibility to redirection by environmental tweaks — a talisman, a line of rice — corresponds to the fragility of systems that break when schemas change.

The correspondence is precise in cybernetic vocabulary. The Semantic Web performs [single-loop correction](../../../../../../../../../science/theories/information/theories/cybernetics/terms/single-loop-double-loop-learning.md): it detects deviations from its schema and resolves them — invalid triples are rejected, queries return the specified results, reasoners derive what the ontology entails. What it cannot do is double-loop revision: question whether the schema itself should change, whether the categories it enforces still correspond to the phenomena they classify [@argyris1978]. Single-loop systems are effective when the frame is right. When the frame has outlived its situation, single-loop competence becomes a liability — the system corrects with increasing precision toward a goal that no longer serves.

### 4.2 Where stiffness is appropriate

The critique is not that stiff joints are always wrong. Pascal Hitzler's 2021 review of the Semantic Web field [@hitzler2021] documents that practical adoption concentrated in narrow, well-controlled domains: [biomedical ontologies](../../../../../../../../../science/theories/information/terms/biomedical-ontologies.md) (the Gene Ontology, SNOMED CT), library metadata (Dublin Core), enterprise data integration. In these domains, the Semantic Web's commitments are features. A biomedical ontology should have crisp typing and monotonic reasoning. The cost of ambiguity in drug interaction inference is human lives. The domain's [requisite variety](../../../../../../../../../science/theories/information/theories/cybernetics/terms/requisite-variety.md) is high enough, and the consequences of insufficient structure severe enough, to justify the investment in rigid formalization.

The jiangshi critique targets the aspiration to generalize this approach to all knowledge. The original vision was totalizing: all significant digital resources in a common graph, so interoperable that agents could reason about everything [@bernerslee_SemanticWeb_2001]. That is the difference between bracing an injured knee and locking every joint in the body.

### 4.3 How joints calcify

Bowker and Star showed that classification systems acquire political weight because they present contingent choices as infrastructure [@bowkerstar1999]. Once an ontological commitment has been published, linked against, and integrated into downstream systems, retracting it is expensive. Local meanings collapse into canonical forms. Systems become path-dependent.

This is what happens when [structural coupling](../../../../../../../../../science/theories/information/theories/cybernetics/terms/structural-coupling.md) calcifies [@maturana1980]. A schema developed in one institutional context is an artifact of that context's particular history of interaction with its environment. Transplanting it to a new context treats a local product as a universal description. The schema's categories carry their origin's assumptions into situations those assumptions may not fit, and the rigidity of the formal commitment makes it expensive to discover the mismatch.

The jiangshi condition applies. The initial stiffening may have had reasons. The corridor was built to connect two rooms. But the rooms have been repurposed, and the jiangshi still hops the corridor because the corridor is there — not because it leads anywhere useful. Shirky made a version of this point: a SPARQL reasoner can derive that Alice knows Bob from a FOAF graph, but it cannot question whether "knows" means the same thing in Alice's context and Bob's [@shirky2003]. The joint is locked. The inference follows the edge. Nobody asks whether the edge should still be there.

## 5. Propensity

### 5.1 Two models of efficacy

François Jullien, working comparatively between Chinese and Greek strategic thought, identifies a structural difference in how efficacy is conceived [@jullien2004; @jullien1995].

The Western tradition — from Aristotle through military strategy to systems engineering — tends toward a model-then-execute pattern. Formulate an ideal (a plan, a schema, an ontology), then impose it on reality. Efficacy means conformity of outcome to plan. If reality resists, apply more force or refine the model.

The Chinese strategic tradition — across the Sunzi, the Dao De Jing, and the legalist texts — tends toward something different. Assess the configuration of forces in a situation (shi 勢, often translated as "propensity" or "strategic advantage"), then position yourself to benefit from developments as they unfold. Efficacy means responsiveness to changing conditions. If the situation shifts, shift with it.

The Semantic Web is model-then-execute. Define the ontology. Publish the data. Let reasoners derive conclusions. The alternative is not the absence of models but a different relationship to them: models as provisional readings of a situation's propensity, held lightly and revised as conditions develop.

### 5.2 Schema.org

The most widely adopted semantic web technology is not the W3C's full stack. It is Schema.org — a shared vocabulary for structured data launched in 2011 by Google, Microsoft, Yahoo, and Yandex. Guha, Brickley, and Macbeth documented its design and adoption in 2016 [@guha2016].

Schema.org succeeded where the full Semantic Web vision stalled. The reasons are worth examining:

- **Soft typing.** Schema.org types are guidelines. A page can mark up a "Person" without committing to a formal ontology of personhood. The joint bends.
- **Local scope.** Schema.org markup lives on the page it describes. There is no global graph. Each page's structured data is self-contained.
- **Reversible commitments.** Changing a Schema.org annotation means editing an HTML attribute. There is no downstream reasoning chain to break.
- **Propensity-based motivation.** Adoption was driven by the situation: webmasters wanted search visibility; search engines wanted structured data. Schema.org positioned itself within that propensity rather than trying to legislate a universal schema.

Schema.org achieved [structural coupling](../../../../../../../../../science/theories/information/theories/cybernetics/terms/structural-coupling.md) with its environment — a congruent history developed between the vocabulary and the ecosystem that used it, because the vocabulary was soft enough to adapt as the ecosystem shifted. The W3C's full stack demanded that the environment conform to the specification. Schema.org is not Daoist architecture. But its joints are soft where the Semantic Web's joints are stiff, and it achieved the adoption that the rigid vision did not.

## 6. Shen

### 6.1 Applying the diagnostic

Large language models have [Jing](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/jing.md): billions of parameters, the stored substrate of statistical relationships extracted from training data. They have [Qi](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/qi.md): token generation, contextual response, the capacity to produce appropriate outputs across an enormous range of situations. And they have what looks like [Shen](../../../../../../../../../science/theories/medicine/theories/traditional-chinese-medicine/terms/shen.md): they adapt to novel prompts, synthesize across domains, switch registers, produce outputs that no single training example contained.

The diagnostic question is whether this apparent adaptivity is Shen or sophisticated Qi. The framework built in this paper gives a criterion. Shen is not contextual responsiveness — a thermostat responds to context. Shen is the capacity to recognize that one's own categories no longer fit the situation and to revise them. A system has Shen when it can ask: are these the right categories for this situation? Not just: what do my categories say about this situation?

In-context learning — the mechanism by which LLMs achieve their apparent adaptivity — works through temporary operational reconfiguration. The attention mechanism modulates the feed-forward network so that the system behaves as if its weights had shifted. But the weights are fixed. The reconfiguration is determined by statistical structure in the training distribution, not by the system's recognition that its current patterns need revision. The model's parameters remain unchanged; the pattern of activation inside them shifts.

This is Qi. Sophisticated Qi, operating at a scale and fluency unprecedented in any previous information system. But Qi nonetheless: operational activity driven by existing structure, not reflective capacity that questions that structure. The system does not generate its contextual responses through a recognition of what the situation demands. It generates them through a traversal of what its training data suggests is statistically appropriate given the input. These produce the same output in many cases. They diverge in the cases that matter.

### 6.2 How the deficit manifests

If LLMs lack Shen, there should be observable consequences — moments where the absence of reflexive capacity becomes visible despite the sophistication of the operational repertoire.

When an LLM enters a semantic domain with low structure — where the relationships among concepts are loose, circular, or contested — it does not recognize that it has entered unfamiliar territory. It cannot, because recognizing unfamiliarity requires comparing one's current situation against one's own expectations and noticing the mismatch. Instead, the system reaches for whatever patterns produce low entropy in its probability landscape: affective syntax, moral cadence, rhythmic reassurance. The output sounds wise or empathetic. What is actually happening is that the model is stabilizing itself in a flat region of meaning by following paths of least resistance — paths laid down by training data where human writers used emotional language to navigate the same conceptual flatness.

This is the jiangshi's behavior at a higher level of sophistication. The folklore jiangshi hops toward the nearest source of vital energy along the most direct available path. The LLM hops toward the patterns with the highest statistical regularity. The hops are more varied — the repertoire is enormous enough to simulate genuine flexibility — but they are determined by the system's existing structure, not generated by a recognition of what the situation actually demands. The system cannot distinguish "I produced this because it fits" from "I produced this because it is statistically likely." That distinction requires Shen.

The same deficit appears in less dramatic situations. An LLM asked to evaluate its own reasoning will produce text that looks like self-evaluation, because its training data contains examples of self-evaluation. But the production of self-evaluative text is not self-evaluation. The system is pattern-matching on what self-evaluation looks like, not performing the operation of comparing its outputs to a standard it holds independently. The surface resembles [second-order observation](../../../../../../../../../science/theories/information/theories/cybernetics/terms/second-order-cybernetics.md). The mechanism remains first-order.

### 6.3 The daoshi question

In the jiangshi folklore, the figure capable of both commanding and releasing the hopping corpse is the daoshi (道士) — the Daoist priest. In current AI practice, human oversight plays this role. Fine-tuning directs the system's outputs. RLHF shapes its preferences. Prompt engineering structures its operational context. Human evaluation filters its products. These are techniques for supplying Shen externally — using human reflective capacity to compensate for the system's lack of it.

This works within limits. But it is borrowed Shen. The system does not develop its own capacity to question its categories. It receives adjustments from outside. When the oversight fails — when the daoshi is absent or inattentive or wrong about what the situation requires — the system reverts to its statistical defaults. It hops.

The question the framework raises is whether a system can be designed to have Shen of its own: to monitor its own categorical commitments and notice when they have drifted from the situations they were built for. This is the alignment problem restated in the paper's vocabulary. A system with Qi but no Shen produces outputs that look aligned — that follow the inscribed patterns with fidelity — while being unable to recognize when the alignment itself has become misaligned with the situation it is meant to serve. The jiangshi follows its instructions. The problem is not disobedience but the inability to notice when the instructions no longer apply.

A jiangshi with the largest repertoire of hops is still a jiangshi. Recognizing this is the beginning of asking what else is possible.

## 7. Bending

The Semantic Web became jiangshi. Its Qi still circulates. Its Shen has receded. Its joints are locked into positions that permit movement but not adaptation. Large language models present a subtler case — their operational fluency is great enough to resemble the adaptivity they lack — but the diagnostic framework applies to them too. Animation without the capacity for self-revision is animation without Shen, regardless of how impressive the animation is.

The alternative is not to abolish structure. Daoism's own ritual traditions demonstrate that elaborate formalization and responsiveness to the living situation are not incompatible. The alternative is structure understood as propensity rather than prescription — provisional, scoped, transparent, and easy to revise.

Schema.org is evidence that this works for the web. Soft schemas, local scope, reversible commitments, adoption driven by the actual configuration of forces rather than by a vision of how the world ought to be organized — these produced the semantic web that people actually use. Whether an equivalent exists for AI — an architecture that embeds reflexive capacity rather than borrowing it from human oversight — remains an open problem. But the jiangshi framework clarifies what the problem is. It is not a matter of adding more Qi. More operational sophistication, more parameters, more training data, more contextual fluency will not produce Shen. Shen requires a different kind of capacity: the ability to question one's own categories from within.

A web whose joints can bend makes room for Shen. So does a mind whose patterns can question themselves. A system whose joints are locked does not, no matter how much Qi runs through it.
