Semantic Web as Prion System: A Formal Analogy Between Conformational Propagation and Ontological Lock-In

Abstract

This paper develops a rigorous analogy between biological prions and the Semantic Web / Linked Data stack. Prion diseases arise when a normally folded host protein (PrP

𝐶

C

) converts into a misfolded, β-sheet–rich conformer (PrP

𝑆

𝑐

Sc

), which then acts as a template to convert further PrP

𝐶

C

molecules, leading to self-propagating aggregates in tissue.

Nature

+1

The Semantic Web aims to transform the World Wide Web into a “web of data” by assigning URIs to entities, describing them in RDF graphs, and constraining them via ontologies in RDFS/OWL, enabling interoperable querying with SPARQL.

Wikipedia

+1

We formalize a prion-like propagation pattern as a process in which (1) a substrate of identical carriers can exist in multiple stable conformational states, (2) one state can template the local conversion of others, and (3) local conversion events induce large-scale pattern formation across a network. Using this template, we analyze how RDF vocabularies, ontologies, and Linked Data practices can produce semantic conformations that propagate through reuse, alignment, and dereferencing, yielding strongly path-dependent, sometimes brittle knowledge infrastructures.

The analogy is deliberately structural, not metaphorical. We show that: (i) RDF resources and properties resemble a prion substrate in that they are structurally identical carriers differentiated by conformation (ontology commitments); (ii) widespread reuse of high-visibility vocabularies (e.g., FOAF, schema.org, domain ontologies) yields templated propagation of specific semantic structures; and (iii) constraints such as global URIs and ontological consistency can induce forms of semantic aggregation and strain-like heterogeneity analogous to prion strains. We conclude by discussing how to design Semantic Web systems that retain the benefits of Linked Data while mitigating prion-like lock-in, emphasizing versioning, multiplicity of ontologies, and mechanisms for controlled “semantic refolding.”

1. Introduction

Prions occupy a singular position in biology: they are infectious conformational states. A protein that is ordinarily soluble, mostly α-helical, and benign (PrP

𝐶

C

) can be converted into a β-rich, aggregation-prone conformer (PrP

𝑆

𝑐

Sc

) that then templates further conversion in a self-propagating cycle.

OUP Academic

+1

This process spreads through tissue like an infection while involving no nucleic acid genome, challenging classical distinctions between “information” and “structure.”

The Semantic Web, by contrast, is a socio-technical attempt to standardize meaning on the World Wide Web by representing data as RDF graphs, using URIs as global identifiers, and constraining those graphs via ontologies. Linked Data principles—use URIs as names, use HTTP URIs, provide useful RDF information on dereference, and link out to other URIs—were explicitly framed by Berners-Lee as a path toward an “Internet as a global database.”

w3.org

+1

This paper argues that the Semantic Web and prions share a deep structural homology. In both cases:

There is a substrate of carriers (proteins; URIs and triples) that can adopt different conformations.

Certain conformations are self-propagating: once introduced, they favor their own replication across the substrate.

Propagation is local but networked: conversion occurs through direct contact (protein–protein; dataset–dataset / ontology–dataset), but the overall effect is global patterning and sometimes pathology (disease; brittle semantic lock-in).

We do not claim that the Semantic Web is literally pathological. Rather, we propose that the formal pattern of prion propagation offers a useful language for describing how particular ontological designs and Linked Data practices can become “infectious,” shaping entire information ecologies in ways that are hard to reverse.

2. Biological Prions: Mechanism and Formal Structure

2.1 Basic Biology of Prions

Prion diseases (transmissible spongiform encephalopathies) include Creutzfeldt–Jakob disease, scrapie in sheep, and bovine spongiform encephalopathy. They are linked to the conversion of the host-encoded prion protein (PrP), normally a GPI-anchored cell-surface glycoprotein (PrP

𝐶

C

), into a misfolded isoform (PrP

𝑆

𝑐

Sc

).

OUP Academic

+1

Key features:

Conformational change: PrP

𝐶

C

is predominantly α-helical and soluble; PrP

𝑆

𝑐

Sc

is β-sheet–rich, protease-resistant, and prone to aggregate into amyloid fibrils.

PMC

+1

Templated propagation: PrP

𝑆

𝑐

Sc

acts as a structural template that induces PrP

𝐶

C

to adopt the misfolded conformation, generating new PrP

𝑆

𝑐

Sc

.

VetRes

+1

Aggregation and strain formation: Misfolded prions aggregate into fibrils and higher-order assemblies. Different conformations (prion “strains”) can coexist and propagate with distinct biochemical and pathological profiles.

SpringerLink

+1

Network-level spread: Misfolded assemblies can move between cells and tissues, leading to spatial propagation in the nervous system and beyond.

PMC

+1

Prion-like mechanisms have now been identified in other proteins (α-synuclein, tau, amyloid-β), where misfolded aggregates seed further misfolding, reinforcing the generality of templated conformational propagation.

Frontiers

+1

2.2 A Formal Template of Prion-Like Propagation

We can abstract a prion-like system as follows.

Let:

𝑆

S be a set of carriers (e.g., protein molecules; RDF predicates), each capable of existing in different states.

Each carrier has a conformational state

𝜎

(

𝑥

)

∈

{

𝑐

1

,

𝑐

2

,

…

}

σ(x)∈{c

1

​

,c

2

​

,…}, e.g., normal vs misfolded.

Carriers interact via a relation

𝑅

⊆

𝑆

×

𝑆

R⊆S×S (e.g., protein–protein contact; reuse/linking between data sources).

Then a prion-like process has three core properties:

Multiple stable conformations

There exist at least two relatively stable conformations

𝑐

𝑁

c

N

​

and

𝑐

𝑃

c

P

​

such that carriers in either state can persist for timescales longer than the interaction timescale.

Templated conversion

When a carrier in state

𝑐

𝑃

c

P

​

interacts with a carrier in state

𝑐

𝑁

c

N

​

, the probability that the latter switches to

𝑐

𝑃

c

P

​

is elevated:

Pr

⁡

[

𝜎

(

𝑦

)

←

𝑐

𝑃

∣

𝜎

(

𝑥

)

=

𝑐

𝑃

,

𝜎

(

𝑦

)

=

𝑐

𝑁

,

(

𝑥

,

𝑦

)

∈

𝑅

]

≫

Pr

⁡

[

𝜎

(

𝑦

)

←

𝑐

𝑃

∣

𝜎

(

𝑦

)

=

𝑐

𝑁

]

.

Pr[σ(y)←c

P

​

∣σ(x)=c

P

​

,σ(y)=c

N

​

,(x,y)∈R]≫Pr[σ(y)←c

P

​

∣σ(y)=c

N

​

].

That is, the “pathological” or dominant conformation seeds its own replication.

Network-level aggregation

Templated local conversions propagate along the interaction network

𝑅

R, so that initially localized instances of

𝑐

𝑃

c

P

​

can lead to large-scale regions in which

𝜎

(

𝑥

)

=

𝑐

𝑃

σ(x)=c

P

​

for most or all

𝑥

x in those regions.

Additional features in biological prions include strain diversity (multiple distinct

𝑐

𝑃

(

𝑖

)

c

P

(i)

​

that propagate under similar rules but with different kinetics) and species barriers (constraints on conversion across different host backgrounds).

SpringerLink

+1

3. The Semantic Web and Linked Data: Architecture and Dynamics

3.1 Core Technologies

The Semantic Web provides a framework for representing and querying data on the web in a machine-readable, interoperable form. According to the W3C, it “provides a common framework that allows data to be shared and reused across application, enterprise, and community boundaries.”

Wikipedia

The key components are:

URIs (Uniform Resource Identifiers): Names for entities, concepts, documents, datasets, etc.

RDF (Resource Description Framework): A graph-based data model representing facts as triples (subject, predicate, object).

sphn-semantic-framework.readthedocs.io

+1

RDFS / OWL (Web Ontology Language): Schema and ontology languages for defining classes, properties, and logical axioms over RDF graphs.

sphn-semantic-framework.readthedocs.io

+1

SPARQL: A query language for retrieving and manipulating RDF data.

sphn-semantic-framework.readthedocs.io

+1

Linked Data is a set of principles for publishing and interlinking RDF-based data on the Web, formulated by Berners-Lee:

w3.org

+2

Wikipedia

+2

Use URIs as names for things.

Use HTTP URIs so that these names can be dereferenced.

When a URI is dereferenced, provide useful machine-readable information (RDF, SPARQL, etc.).

Include links to other URIs to enable discovery.

Large Linked Data hubs such as DBpedia and Wikidata aggregate massive numbers of RDF triples following these principles, forming dense graphs of interlinked entities.

Wikipedia

+1

3.2 Semantic Conformations: Vocabularies and Ontologies

Within RDF graphs, vocabularies (sets of URIs for predicates and classes) and ontologies (axiomatizations of those vocabularies) act as semantic structures. For example:

FOAF defines properties like foaf:name, foaf:knows.

schema.org defines a large set of classes and properties for web content, widely adopted by major platforms.

Domain ontologies (e.g., in life sciences, geography, cultural heritage) define domain-specific classes and relationships.

Once a vocabulary achieves wide adoption, its URIs and axioms effectively define default semantic conformations for describing a particular kind of thing (persons, events, products, etc.). These conformations then propagate via reuse: new datasets that wish to interoperate adopt the same predicates and class hierarchies.

3.3 Networked Propagation in Linked Data

From a graph-theoretic viewpoint, the Linked Data cloud is a large directed, labeled graph

𝐺

=

(

𝑉

,

𝐸

)

G=(V,E), where:

𝑉

V = set of RDF resources (identified by URIs or literals).

𝐸

E = set of edges labeled by predicates (URIs denoting properties).

Publishing Linked Data involves:

minting or reusing URIs for resources and properties,

asserting triples using those URIs,

linking out to URIs in other datasets (interlinking).

Over time, the network exhibits:

heavy reuse of a relatively small number of widely-recognized vocabularies,

emergent hub nodes (e.g., widely referenced identifiers in DBpedia or Wikidata),

structural standardization as ontologies become de facto norms.

Ontotext

+1

In this sense, ontological patterns propagate through reuse: each dataset that aligns to a given ontology strengthens its position as a template for further alignment.

4. Formal Analogy: Semantic Web as Prion System

4.1 Identifying the Substrate and Conformations

To apply the prion-like template, we need to identify:

the substrate: what plays the role of “PrP molecules” in the Semantic Web;

the conformational states: what counts as different stable configurations;

the interaction relation: what corresponds to the “contact” through which templating occurs.

We propose:

Substrate

𝑆

S: semantic carriers, particularly property URIs and class URIs that can be instantiated across many datasets. A URI like schema:Person or foaf:name can appear in millions of triples across different graphs.

Conformations

𝜎

(

𝑠

)

σ(s): interpretative and ontological commitments attached to these URIs:

local interpretations (informal documentation, community practice),

formal axioms in ontologies (domain, range, subClassOf, equivalence),

constraints embedded in applications.

Interaction

𝑅

R: reuse and alignment relations between datasets and vocabularies:

a dataset “contacts” a vocabulary when it uses its URIs,

vocabularies “contact” each other via owl:equivalentClass, owl:sameAs, rdfs:subClassOf, or cross-mappings.

Thus, a property URI such as schema:Person has a state function

𝜎

(

schema:Person

)

σ(schema:Person) that describes its effective semantics as maintained by a community of practice and a web of axioms.

4.2 Templated Conversion as Ontological Adoption

Given this substrate, we can define templated conversion in the Semantic Web as follows:

Consider two datasets

𝐷

𝐴

D

A

​

and

𝐷

𝐵

D

B

​

that both describe persons.

𝐷

𝐴

D

A

​

uses vocabulary

𝑉

𝐴

V

A

​

(ex:Human, ex:hasName);

𝐷

𝐵

D

B

​

uses vocabulary

𝑉

𝐵

V

B

​

(foaf:Person, foaf:name).

Suppose there exists a mapping or perceived advantage in adopting foaf:Person and foaf:name (better tooling, broader interoperability, etc.).

We can model a conversion event as:

“Carriers” in

𝐷

𝐴

D

A

​

(its local concepts for people and names) are refactored into foaf:Person and foaf:name:

existing triples are migrated;

future data is generated using FOAF terms.

The probability that a dataset adopts FOAF terms increases when it is in contact with other FOAF-based datasets (e.g., via reuse examples, tooling, sample queries). The FOAF vocabulary acts as a template for representing person data, just as PrP

𝑆

𝑐

Sc

acts as a template for PrP

𝐶

C

conformation.

Formally, letting

𝜎

(

𝐷

)

σ(D) denote the “semantic conformation” of dataset

𝐷

D (which vocabulary and ontology it uses), contact via

𝑅

(

𝐷

𝐴

,

𝑉

𝐵

)

R(D

A

​

,V

B

​

) increases the probability of

𝜎

(

𝐷

𝐴

)

←

𝜎

(

𝑉

𝐵

)

σ(D

A

​

)←σ(V

B

​

) (partial or total adoption of

𝑉

𝐵

V

B

​

).

4.3 Aggregation and Semantic Strains

As more datasets adopt a given vocabulary and ontology, we see aggregation:

The proportion of triples in the Linked Data cloud using, say, schema:Person grows.

Downstream applications increasingly assume that schema:Person is the way to represent people.

Tooling, documentation, and training materials further reinforce this conformation.

Different major vocabularies—FOAF, schema.org, domain ontologies in biomedicine—can be viewed as semantic strains:

They implement distinct but internally coherent structures for similar conceptual domains.

They propagate through aligned communities, producing different “phenotypes” of data.

Cross-mappings (owl:equivalentClass, owl:equivalentProperty) correspond to partial cross-seeding between strains.

This parallels prion strains, where distinct conformations of PrP

𝑆

𝑐

Sc

exhibit different propagation kinetics and pathological profiles despite being composed of the same amino acid sequence.

SpringerLink

+1

4.4 Species Barriers and Ontological Incompatibilities

In biological prions, species barriers limit cross-species transmission; differences in primary sequence and host factors can impede conformational templating.

SpringerLink

+1

In the Semantic Web, ontology barriers arise when datasets use incompatible modeling choices:

different URI patterns and identifier policies,

distinct and conflicting class hierarchies,

divergent assumptions about cardinality, closure, or identity.

Sometimes these barriers are permeable: careful mapping can align datasets. Other times, differences in design philosophy or domain scope make full alignment impractical. The result is a landscape of partially isolated semantic strains that propagate within their niches.

4.5 Irreversibility and Lock-In

Biological prion conversion is largely irreversible under physiological conditions; once PrP

𝐶

C

becomes PrP

𝑆

𝑐

Sc

, the system tends toward aggregation and disease.

Nature

+1

In the Semantic Web, ontological adoption is not physically irreversible, but it can become socio-technical lock-in:

once data is published at scale using a particular vocabulary and URI scheme,

once tooling, client code, and downstream consumers embed those assumptions,

the cost of “refolding” (migrating to a new ontology, changing URIs) becomes very high.

The effect is functional irreversibility: practical constraints prevent large-scale reconfiguration, even if a different modeling choice would now be preferable.

This is the core of the prion analogy: semantic conformations that self-reinforce through network effects, making alternative patterns increasingly costly to adopt.

5. Case Sketches: Semantic Prions in Practice

Rather than detailed empirical studies (which would require large-scale quantitative analysis), we sketch qualitatively how prion-like propagation appears in several common Semantic Web scenarios.

5.1 schema.org and Search Ecosystems

The schema.org vocabulary, created by major search engine providers, provides a standardized way to annotate web content. Its adoption has been strongly incentivized by improved search results and rich snippets.

From a prion perspective:

schema.org terms (e.g., schema:Person, schema:Event, schema:Product) act as a dominant conformation for representing such entities.

Webmasters and CMS platforms update templates to emit schema.org markup; future data is born into this conformation.

Alternatives (local vocabularies, competing schemas) face significant energetic barriers—they must either co-exist in parallel or be mapped onto schema.org.

The more schema.org is used, the more tooling and documentation assume it, reinforcing its position as a self-propagating semantic strain.

5.2 Biomedical Ontologies and Reference Graphs

In life sciences, knowledge graphs such as those built from Bio2RDF, UniProt, and ontologies like GO, DO, and others rely heavily on Semantic Web technologies.

Ontotext

Prion-like features:

widely used upper-level or domain ontologies serve as templates,

new databases align to existing ontologies to ensure compatibility,

once alignment is performed, subsequent re-modeling is rare due to effort and risk.

Here, prion-like propagation can be beneficial (standardization, data integration), but it also risks ossifying early design decisions, making it difficult to accommodate novel biological insights that don’t fit the original conceptual schema.

5.3 Identity Explosion via owl:sameAs

The controversial use of owl:sameAs to assert identity between URIs across datasets has been described as creating “identity snowballs” where different identifiers get glued together. Once large Linked Data hubs publish aggressive owl:sameAs links, others reuse them, propagating identity assumptions globally.

Wikipedia

+1

This resembles prion aggregation:

each identity assertion is a small local “conversion,”

repeated across the network, they produce large aggregates of resources treated as the same,

undoing these aggregates can be extremely difficult if many datasets and applications depend on them.

6. Where the Analogy Holds—and Where It Breaks

6.1 Strong Parallels

The prion analogy illuminates several real properties of Semantic Web infrastructures:

Stateful carriers

URIs and predicates are structurally identical strings whose effective meaning depends on community practice and ontological context, just as identical amino-acid chains adopt different conformations.

Templated propagation

Adoption of a vocabulary in one dataset raises the probability of adoption in others due to tooling reuse, documentation, training, and interlinking demands.

Strain-like diversity

Distinct ontologies for overlapping domains behave like strains: different structural conformations for essentially similar conceptual sequences.

Network-shaped spread

Ontological patterns propagate along links of collaboration, standardization consortia, and technical integration projects, mirroring how prions move along neural pathways and tissue networks.

Lock-in and irreversibility

Once a particular conformation dominates, refactoring becomes costly, leading to practical irreversibility and the risk of brittle infrastructures.

6.2 Important Differences

However, the analogy has limits:

Biological prions are pathologically harmful, leading to neurodegeneration and death. Semantic ontologies may be harmful only in a socio-technical sense (e.g., encoding biased categories, inhibiting innovation), but they can also produce clear benefits (interoperability, discoverability).

Semantic conformations are explicitly representational, subject to conscious design and revision. Prion conformations are biophysical, not intentional; they emerge from energetics, not governance, even if selection pressures shape them.

Reversibility is possible in the Semantic Web: schemas can be versioned, data migrated, clients updated. The barriers are economic and organizational, not thermodynamic.

Multiplicity is easier: whereas a single protein sequence tends to be in one conformation at a time, Semantic Web systems can simultaneously support multiple ontologies and mappings.

Recognizing these differences prevents over-extension of the analogy. The point is not to classify the Semantic Web as a disease, but to import structural concepts from prion science to reason about self-reinforcing semantic patterns and their risks.

7. Design Implications: Toward Controlled Semantic Refolding

If prion-like propagation captures important dynamics of Semantic Web infrastructures, it suggests design strategies to avoid degenerative lock-in:

7.1 Encouraging Ontological Multiplicity

Just as diversity of conformations can modulate prion propagation, Semantic Web architectures should:

support coexistence of multiple vocabularies for similar domains,

provide standard mechanisms for expressing partial mappings and conflicts,

treat “semantic strain diversity” as a feature, not necessarily a bug.

This reduces the risk that a single rigid ontology becomes a de facto monoculture.

7.2 Making Refolding Cheap

To mitigate practical irreversibility:

adopt versioned ontologies and schema-evolution patterns,

build migration tooling that automates refactoring of RDF graphs,

decouple internal representations from external, “public” vocabularies via mapping layers.

The goal is to make semantic refolding—changing the conformation of a dataset—low-cost and reversible, unlike prion conversion.

7.3 Locality and Scoped Semantics

Instead of seeking global, universal ontologies, design for scoped, local semantics:

define vocabularies within clear domain and community boundaries,

avoid overloading predicates with globally universal meanings,

use context (named graphs, provenance, profiles) to qualify interpretative commitments.

This is akin to building “species barriers” intentionally, to prevent uncontrolled global spread of a single semantic conformation.

7.4 Monitoring Semantic Aggregation

Borrowing from prion aggregation studies, which track fibril formation and strain dominance,

SpringerLink

+1

Semantic Web communities could:

measure distribution of vocabularies and ontologies across datasets,

track emergence of dominant predicates and classes,

identify regions of the Linked Data cloud where semantic diversity is collapsing.

Such monitoring would allow early detection of potentially harmful lock-in and guide governance interventions (e.g., promoting alternative models, revising standards).

8. Conclusion

Prions reveal a class of phenomena in which structure is information and where certain conformations propagate at the expense of others, leading to robust, sometimes catastrophic, pattern formation. The Semantic Web, in its ambition to create a global web of data structured by shared ontologies, naturally exhibits analogous dynamics: semantic conformations that spread via reuse, alignment, and interlinking, becoming increasingly hard to change.

By viewing the Semantic Web through a prion lens, we gain a vocabulary for:

understanding how certain ontologies and vocabularies become self-reinforcing,

analyzing network-level consequences of local modeling decisions,

designing infrastructures that preserve flexibility and diversity rather than converging prematurely on brittle monocultures.

The analogy is not a diagnosis of disease, but a warning about unexamined self-propagation. When we design semantic structures that are easy to adopt yet hard to revise, we build prion-like mechanisms into our information ecologies. If we wish to keep the web alive—capable of refolding, adapting, and accommodating new forms of understanding—we must attend not only to the syntax and logic of our ontologies, but also to their conformational dynamics: how they spread, fix, and sometimes overtake the very systems they were meant to serve.