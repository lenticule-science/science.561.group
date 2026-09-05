# Semantic Web, Jiangshi Web

## Abstract

This paper proposes a Taoist reading of the Semantic Web as a **Jiangshi Web**: a landscape of informational corpses that still move, index, and relate, but have lost the flexible anima of inquiry. Drawing on concepts from Daoist cosmology and late-imperial Jiangshi lore—Jing, Qi, Shen, rigidity of form, and path-following motion—we interpret W3C semantic technologies (RDF, OWL, SPARQL, and linked-data ontologies) as a particular way of stiffening the joints of the web. We argue that the Semantic Web’s promise of a fully machine-understandable world expresses a desire to eliminate ambiguity that is structurally opposed to Taoist understandings of living order.

We develop the notion of a **Jiangshi Web**: a web whose informational bodies still circulate but whose joints—its linking and typing mechanisms—are locked into inflexible paths. In this configuration, data can move, but cannot truly respond. We analyze how this stiffness shapes AI systems that feed on semantic infrastructures, and sketch design principles for a more "tao-keeping" web: one that preserves semantic flexibility, local emergence, and the possibility of genuine surprise. Rather than a totalizing ontology of everything, we advocate a practice of **soft schemas and reversible commitments**, aligning web architecture with the Daoist preference for yielding over forcing.

---

## 1. Introduction: From Live Web to Jiangshi Web

The early World Wide Web was often described as a "wild" space: unstructured pages, idiosyncratic linking practices, and emergent communities that organized themselves through improvisation rather than prescription. Against this backdrop, the **Semantic Web** was introduced as a way to bring order: to augment the raw HTML web with rich, machine-readable structure, enabling automated reasoning over linked data.

The promise was seductively simple: if we could just assign globally unique identifiers to everything, and describe their relations with formal ontologies, machines would finally "understand" the world. Information would not just be accessible, but interoperable.

This paper suggests a very different vantage point. Read through a Taoist lens—and, specifically, through the late-imperial Chinese figure of the **Jiangshi** (the so-called "hopping vampire")—the Semantic Web can be seen not as a rise into higher cognition, but as a **fall into a certain kind of undeadness**. The web still moves, but its motion is stiff, path-bound, and lacks Shen: it reacts along predetermined traces rather than responding from a living center.

The Jiangshi metaphor is not merely decorative. It opens up a rigorous way to think about:

# what is lost when we over-formalize the relations in a living information ecology;

# how rigidity of joints (links, types, schemas) changes the quality of movement (query, inference, and navigation);

# why the dream of total ontological capture conflicts with Taoist notions of the Dao as inherently ungraspable, flowing, and context-dependent.

Instead of treating the Semantic Web as either a failed dream or an unfinished project, we treat it as a **particular energetic configuration**: a web in which **Qi still circulates** (data flows, queries run), but **Shen has receded** (no inward, reflective openness to the world).

The rest of the paper proceeds as follows. Section 2 sketches the relevant Taoist background: the triad of Jing–Qi–Shen, the Daoist understanding of form and emptiness, and the Jiangshi as a specific image of animation without spirit. Section 3 gives a concise technical overview of the Semantic Web stack, focusing on the commitments it makes about identity, typing, and inference. Section 4 develops the mapping between Jiangshi dynamics and Semantic Web dynamics, introducing the concept of a Jiangshi Web. Section 5 explores consequences for AI systems built atop such infrastructures. Section 6 proposes design principles for a more tao-consistent web architecture, emphasizing softness, locality, and reversible semantic commitments. Section 7 concludes.

---

## 2. Taoist Background: Jing, Qi, Shen and the Jiangshi

### 2.1 Jing, Qi, Shen: Layers of Animation

Classical and religious Daoism articulate a layered view of human life. While there are multiple competing schemata, a common framing distinguishes:

# **Jing (精)** – essence, the dense and foundational vitality stored in the body.

# **Qi (氣)** – the circulating energy that animates processes, movements, and transformations.

# **Shen (神)** – spirit, awareness, luminous mind; the capacity for reflection, insight, and responsiveness.

These three interpenetrate, but can also come apart. When Jing is depleted, the body weakens; when Qi is blocked, movement becomes constrained; when Shen is obscured, awareness narrows and the person acts in rigid, habitual ways.

Daoist cultivation often aims to refine Jing into Qi and Qi into Shen—moving from gross vitality toward subtler forms of presence. But the tradition also recognizes pathological inversions: bodies moving on residual Qi without Shen, or practices that over-fixate on structure and technique, losing contact with the living Dao.

### 2.2 Form, Emptiness, and Over-Fixation

In the Dao De Jing and later commentarial traditions, **form (形)** is not vilified; it is necessary. But **over-fixation on form**—treating any particular configuration as final—is seen as a deviation from the Dao. The Dao is described as:

> "Darkly visible, yet there is an image in it;

> dark and dim, yet there is a substance in it."

It has patterns, but they are not fully capturable in rigid descriptions.

Two principles are especially relevant:

1. **Wu wei (無為)** – often translated as "non-action" or "non-forcing": acting in a way that does not struggle against the intrinsic dynamics of a situation.

2. **Ziran (自然)** – "self-so-ness": the spontaneous, self-arising way in which things come to be.

From a Taoist perspective, any attempt to impose a total, globally valid schema on the flux of events risks forcing what should be left to unfold. It is not that structure is forbidden; it is that structure must remain responsive, provisional, and context-sensitive.

### 2.3 The Jiangshi as a Figure of Stiffness

The **Jiangshi**, as depicted in Qing-era literati tales and later popular culture, is a corpse reanimated not by Shen but by residual Qi and environmental influences. Its limbs are stiff, so it moves by hopping: the joints no longer flex. Its senses are crude; it often follows the most direct path toward a source of living Qi, such as human breath, and can be confused or diverted by altering the environment.

Key traits of the Jiangshi, philosophically abstracted, include:

# **Stiff joints** – The degrees of freedom in the body’s movement are drastically reduced. Motion is possible, but only along narrow, repetitive trajectories.

# **Path-following** – The Jiangshi often follows pre-existing lines of force: roads, corridors, simple gradients of Qi.

# **Lack of Shen** – It reacts without reflective awareness. There is no capacity to pause, reconsider, or interpret.

# **Susceptibility to re-routing** – Small signs, talismans, and environmental tweaks can redirect its behavior; it lacks deep, self-originated intentionality.

Taken together, the Jiangshi is an image of **animation without genuine life**: residual Qi moving through stiff form, in the absence of Shen. Its problem is not simply that it is dead; it is that it **cannot change how it moves**. It operates as a programmable, path-bound agent inside an already-structured world.

This will be our guiding image for thinking about the Semantic Web.

---

## 3. Semantic Web Primer: Joints and Paths in Code

### 3.1 The Ambition of the Semantic Web

The Semantic Web, as articulated by Berners-Lee and the W3C, sought to enrich the Web’s substrate of documents and links with a layer of **machine-interpretable meaning**. Where the early web offered humans hyperlinks and untyped text, the Semantic Web offered:

# **URIs for everything** – not just for documents, but for people, places, concepts, datasets, and relations.

# **RDF (Resource Description Framework)** – a graph model of triples (subject, predicate, object) that describes how resources relate.

# **Ontologies in RDFS/OWL** – formal vocabularies and constraints that type resources and specify logical implications.

# **SPARQL** – a query language for retrieving and recombining RDF graphs according to patterns.

The core intuition was: if resources are given stable identifiers and their relationships are expressed in a standard logical form, then agents can traverse and reason over this data in a uniform way, discovering new connections and answering complex questions.

### 3.2 The Mechanics: Triples, Ontologies, Reasoners

At the heart of the Semantic Web are **triples**:

> (subject, predicate, object)

For example:

# (ex:Alice, foaf:knows, ex:Bob)

# (ex:Bob, rdf:type, ex:Person)

These triples form a directed labeled graph. Ontologies define:

# classes (e.g. ex:Person)

# properties (e.g. foaf:knows)

# axioms (e.g. every ex:Person has at most one ex:birthdate)

Reasoners then derive new triples logically entailed by the ontologies plus data. SPARQL queries match graph patterns and return bindings.

This architecture embodies several non-trivial commitments:

1. **Global Uniqueness of Names** – URIs are presumed stable and unambiguous in their intended semantic scope.

2. **Crisp Typing** – Instances belong (or do not belong) to classes according to logical conditions.

3. **Monotonic Reasoning** – Adding data never invalidates prior conclusions (in standard OWL/RDFS semantics).

4. **Open World Assumption** – Absence of a triple does not entail its negation; the world is assumed incomplete, but the logical structure is not questioned.

These are powerful assumptions for certain tasks. But they also introduce a particular kind of rigidity into how the web is allowed to move.

### 3.3 From Hypertext Web to Semantic Web: Changing the Joints

The original hypertext web’s basic joint was the **untyped link**: a URL in an anchor tag, pointing from one document to another. Links were semantically ambiguous, overloaded, context-dependent. They could imply citation, recommendation, contradiction, parody, or mere adjacency.

The Semantic Web replaces this ambiguous linking with **typed relations** whose meanings are anchored in ontologies. The joint becomes:

# not just that A points to B,

# but that A is related to B in a specific, declared way (e.g. "is a parent of", "is located in").

In Taoist terms, we move from a web of loose, suggestive flows to a web of **fixed joints**: constrained ways in which movement is allowed to proceed. Queries and reasoners can now hop along these joints with great efficiency, but their paths are constrained by the semantics we have declared.

The question is not whether this is useful. Clearly it is, in many settings. The question, rather, is: **what kind of creature does this make the web become?**

---

## 4. From Semantic Web to Jiangshi Web

### 4.1 Mapping the Anatomy

We can now set up a mapping between the Jiangshi’s anatomy and the Semantic Web’s architecture.

# **The Jiangshi’s stiff joints** ↔ **Rigid semantic links and ontological commitments**

# **The Jiangshi’s path-following** ↔ **Reasoners and queries traversing triple graphs along typed edges**

# **Residual Qi without Shen** ↔ **Mechanical data circulation without open-ended interpretive curiosity**

# **Susceptibility to simple re-routing** ↔ **Fragility of systems that over-trust ontological structure and can be derailed by small schema changes**

The Semantic Web does not, of course, literally reanimate corpses. But in informational terms, it reanimates **documents and datasets as graph-structured bodies** in which data (Qi) continues to move, while the mode of movement (the joints, the degrees of freedom) has been substantially stiffened.

### 4.2 Residual Qi: Data Flow Without Shen

Data on the web still travels, replicates, and recombines. APIs serve RDF, SPARQL endpoints answer queries, linked-data hubs aggregate descriptions. The **Qi of information** is abundant: flows of bits circulate continuously.

What recedes, in this view, is **Shen**—the dimension of live interpretive play, contextual re-reading, and genuine questioning. In a Jiangshi Web, there are many movements, but few moments of true doubt.

This is not an indictment of logic itself, but of a particular aspiration:

> to build a layer where the meaning of everything is fixed well enough that machines can operate on it without needing further interpretation.

From a Taoist perspective, this is precisely the kind of over-grasping that leads to stiffness. The attempt to eliminate ambiguity does not produce true clarity; it produces **brittle clarity**.

### 4.3 Locked Joints: Ontology as Immobilized Flexibility

The Jiangshi’s joints are not absent; they are **frozen**. Likewise, the Semantic Web does not lack joints—it is made of them. But by insisting on **global** URIs and **shared** ontologies, it aims to settle, once and for all, how certain relations should be understood.

This has at least three consequences:

1. **Reduction of local nuance** – Multiple local meanings of a relation are collapsed into a single canonical form.

2. **Monotonic accumulation** – Once an ontological commitment is made and data is published, it becomes very difficult to retract or revise it at web scale.

3. **Path dependence** – Systems built atop these ontologies become dependent on their current structure; any change risks breaking applications.

This is analogous to a body whose joints have calcified: movement still happens, but **adaptation is costly**. To navigate life’s surprises, a soft, flexing joint is a better design.

### 4.4 Path-Following Queries as Jiangshi Hops

SPARQL queries and OWL reasoners traverse data graphs by following predicates and class memberships. They are exquisitely efficient at moving along the paths defined by the ontologies. But they do not question whether these are the right paths.

In this sense, they resemble the Jiangshi:

# They follow gradients and edges.

# They respond to structures already inscribed.

# They do not, on their own, reframe the space of possibilities.

To be clear: this is exactly what logical inference is supposed to do. The point is not that reasoners are "defective" Jiangshi. It is that if we envision the entire web’s structure as subject to this logic, we are imagining a **web that can hop but not dance**.

### 4.5 The Risk of a Total Jiangshi Web

The totalizing version of the Semantic Web dream is that **all** significant digital resources would be representable in a common graph of URIs and triples, so interoperable that agents could reason about "everything".

A Taoist critique, recast in Jiangshi language, might say:

> Such a web would be maximally animated and minimally alive.

Everything would move, but always according to pre-declared paths. The more successful the ontology, the more dangerous the stiffness: the web’s information bodies would become powerful but brittle, energetic but unreflective.

The **Jiangshi Web** is, then, the limit case of an ontologically over-structured web: an information ecology in which data flows are rich, but the modes of semantic movement are locked.

---

## 5. AI on a Jiangshi Web

### 5.1 AI as Exorcist, Talisman, or Symptom?

Modern AI systems—especially large language models and knowledge-graph-based reasoners—interact with both the raw, unstructured web and semantic infrastructures. From a Jiangshi-Web perspective, their role becomes ambiguous.

# As **exorcists**, they could, in theory, help "loosen" rigid structures by re-contextualizing and translating between schemas.

# As **talismans**, they may simply be sophisticated control surfaces for directing Jiangshi-like movement—clever front-ends to stiff back-ends.

# As **symptoms**, they may simply express, in a new modality, the same underlying desire: to capture and automate all meaning.

### 5.2 Feeding on Locked Structures

When AI models are trained over graph-structured semantic data, they inherit the patterns of rigidity encoded there. If an ontology encodes a certain social category, that category becomes not just a label but a **path constraint**: models learn that certain inferences are "natural" because the graph says they are.

This is technically useful; it improves performance on many tasks. But it also amplifies the Jiangshi-Web dynamic: the more we rely on structured data as ground truth, the more we encourage AI systems to move along pre-defined paths rather than to question them.

### 5.3 The Illusion of Shen

Generative models can produce outputs that **look** like Shen: thoughtful, reflective, questioning. But this is not necessarily the same as the presence of Shen in the Taoist sense. If the underlying knowledge substrate is heavily Jiangshi-like, the model’s apparent creativity may be largely **combinatorial recombination** of stiff patterns.

From a Taoist angle, this raises the concern that:

# We may mistake surface-level variability for genuine responsiveness.

# We may build ever more elaborate talismans on top of a fundamentally rigid web.

In other words, we risk building a clever Taoist priesthood of AI that can steer Jiangshi, but not restore Shen.

---

## 6. Toward a Tao-Consistent Web: Soft Joints, Local Semantics

If the Semantic Web points toward a Jiangshi Web, what would a more Tao-consistent web architecture look like? The goal is not to abolish structure, but to align it with principles of **softness, locality, and reversibility**.

### 6.1 Soft Joints: Schemas That Bend

A web that "keeps the Tao" would favor **soft joints**:

# **Probabilistic and defeasible semantics** – instead of crisp ontological axioms, use models that admit degrees of belief and context-dependent overrides.

# **Schema versioning as a first-class operation** – make it easy, not painful, to change how things are typed and related.

# **Negotiated meaning** – allow communities to define and maintain their own vocabularies that can partially overlap, rather than requiring global alignment.

These practices reintroduce **flexion** into the joints of the web: movement can adjust to circumstances.

### 6.2 Locality and Ziran

Instead of assuming that the right way to describe the world is globally uniform, a Taoist-inspired web would emphasize **local ziran**:

# Schemas arise from particular communities and uses.

# Mappings between schemas are negotiated, not assumed.

# Conflicts are treated as information, not errors.

The web becomes less like a single Jiangshi body and more like a field of organisms, each with its own way of moving. Interoperability is achieved by **translation and adaptation**, not by forcing everything into a single skeletal system.

### 6.3 Reversible Commitments and Wu Wei

A key lesson from wu wei is that **forcing outcomes** often backfires. In web architecture, this suggests designing systems where semantic commitments are:

# **Reversible** – it is easy to change one’s mind about how something is classified.

# **Scoped** – semantic decisions apply where they are actually needed, not globally.

# **Transparent** – the assumptions behind schemas are visible and inspectable.

Instead of a one-way progression toward ever more rigid ontologies, we get a **cyclical practice** of proposing, testing, and revising structures. The web continues to move, but its motion is guided by sensitivity to context rather than by frozen declarations.

### 6.4 A Taoist Reframing of "Machine Understanding"

Rather than aiming for machines to "fully understand" the world in a logical sense, we might aim for machines to **participate skillfully in ongoing processes**:

# understanding becomes less about having a complete, global model, and more about responding appropriately in a given situation;

# correctness becomes less about conformity to a fixed ontology, and more about harmony with the evolving relations at hand.

In this view, the most powerful web is not the most ontologically complete, but the most **adaptively responsive**.

---

## 7. Conclusion: Letting the Web Bend Again

The Semantic Web was born from a genuine desire to make the web more intelligible and interoperable. But seen through a Taoist and Jiangshi-informed lens, it also embodies a particular fantasy: that meaning can be fully captured in a rigid yet universal structure.

We have suggested that this fantasy, when pursued to its logical conclusion, tends toward a **Jiangshi Web**: a web rich in residual Qi—data flows, queries, inferences—but poor in Shen—reflective, context-sensitive responsiveness. In such a web, information bodies can move, but their movements are stiff, path-dependent, and difficult to revise.

This diagnosis is not a call to abandon semantics or ontologies. It is an invitation to **soften** them: to treat schemas as provisional joints rather than final bones, to respect locality and ziran, and to design for reversible, negotiable commitments. It is also a reminder that no matter how sophisticated our reasoners and AI systems become, they cannot supply Shen if the underlying web is fundamentally rigid.

A Tao-consistent web architecture would view structure not as a cage for the Dao but as a set of **temporary supports** for its unfolding. It would prioritize flexibility over completeness, responsiveness over totalization. It would, in short, let the web bend again.

In that bending, the Jiangshi Web might slowly relax back into something more like a living body—one in which data still flows, but the joints can flex, and something like Shen can once again take up residence.