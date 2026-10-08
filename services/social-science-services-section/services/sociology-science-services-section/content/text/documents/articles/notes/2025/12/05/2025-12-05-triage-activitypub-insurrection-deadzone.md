---
title: "ActivityPub: Institutional Capture of Insurgent Protocol"
description: "How W3C standardization transformed ActivityPub from an insurgent infrastructure into an institutional dead zone, and how Meta's Threads encountered the Domestication Paradox."
date-created: 2025-12-05
date-updated: 2026-03-03
type: paper
authors:
  - emsenn
tags:
  - infrastructure-studies
  - standards-governance
  - political-economy
  - fediverse
  - research
status: draft
defines:
  - insurgent-infrastructure-as-high-generativity-low-legibility-system
  - standardization-as-counterinsurgency-five-stage-pipeline
  - domestication-of-infrastructure-via-legibility-increase-and-generativity-decrease
  - domestication-paradox-where-taming-destroys-value-of-adoption
  - dead-zone-as-stabilized-low-energy-infrastructural-residue
extends:
  - scott-legibility-theory
  - protocol-as-control-literature
  - infrastructure-studies
requires:
  - w3c-standardization-process
  - activitypub-and-fediverse-historical-record
  - threads-federation-rollout-data
acts-on: trajectory-of-insurgent-infrastructure-through-institutional-standardization
produces:
  - five-stage-model-of-standardization-as-counterinsurgency
  - domestication-paradox-as-general-principle
  - dead-zone-concept-for-stabilized-but-inert-infrastructure
  - strategic-lessons-for-decentralized-movements-engaging-standards-bodies
contrasts-with: standardization-as-neutral-technical-graduation
analogous-to: describing-the-lineage-of-evidentiary-structuration-of-state-repression-technologies
references:
  - id: scott1998
    type: document
    title: Seeing Like a State
    author:
      - literal: J. C. Scott
    container-title: Yale University Press
    issued:
      - year: 1998
  - id: galloway2004
    type: document
    title: Protocol: How Control Exists After Decentralization
    author:
      - literal: A. Galloway
    container-title: MIT Press
    issued:
      - year: 2004
  - id: star1999
    type: document
    title: The Ethnography of Infrastructure
    author:
      - literal: S. L. Star
    container-title: American Behavioral Scientist
    issued:
      - year: 1999
cites:
  - scott1998
  - galloway2004
  - star1999
---
﻿---

title: "ActivityPub: Institutional Capture of Insurgent Protocol"
description: "How W3C standardization transformed ActivityPub from an insurgent infrastructure into an institutional dead zone, and how Meta's Threads encountered the Domestication Paradox."
date-created: 2025-12-05
date-modified: 2026-03-03
keywords:
  - infrastructure-studies
  - standards-governance
  - political-economy
  - fediverse
  - research
extends:
  - scott-legibility-theory
  - protocol-as-control-literature
  - infrastructure-studies
requires:
  - w3c-standardization-process
  - activitypub-and-fediverse-historical-record
  - threads-federation-rollout-data
acts-on: trajectory-of-insurgent-infrastructure-through-institutional-standardization
produces:
  - five-stage-model-of-standardization-as-counterinsurgency
  - domestication-paradox-as-general-principle
  - dead-zone-concept-for-stabilized-but-inert-infrastructure
  - strategic-lessons-for-decentralized-movements-engaging-standards-bodies
contrasts-with: standardization-as-neutral-technical-graduation
analogous-to: describing-the-lineage-of-evidentiary-structuration-of-state-repression-technologies
references:
  scott1998:
    authors: ["J. C. Scott"]
    title: "Seeing Like a State"
    publication: "Yale University Press"
    year: 1998
  galloway2004:
    authors: ["A. Galloway"]
    title: "Protocol: How Control Exists After Decentralization"
    publication: "MIT Press"
    year: 2004
  star1999:
    authors: ["S. L. Star"]
    title: "The Ethnography of Infrastructure"
    publication: "American Behavioral Scientist"
    year: 1999
---

## 1. Introduction: From Insurgent Protocol to Institutional Dead Zone

In the last decade, the â€œfediverseâ€ has been widely promoted as a concrete manifestation of a different kind of social web: one built on federation rather than platform enclosure, local governance rather than global terms of service, and open protocols rather than proprietary APIs. At the center of this story sits ActivityPub, a protocol standardized at the World Wide Web Consortium (W3C) and frequently described as the technical backbone of decentralized social networking. Mastodon, the most visible ActivityPub-based platform, has become the public face of this alternative.
From the perspective of traditional web governance, ActivityPub looks like a success story. A grassroots set of practices and experiments coalesced into a protocol; the protocol was taken up by a major standards body; a flagship implementation gained substantial public recognition; large firms, including Meta, announced plans to integrate with it. The story appears to track the standard life-cycle of web technologies: experimental beginnings, formal consolidation, and eventual mainstream adoption.
Yet the trajectory of Metaâ€™s Threadsâ€”its attempt to plug a large-scale commercial social network into ActivityPub and â€œjoin the fediverseâ€â€”complicates this narrative. Despite intensive publicity, regulatory interest in interoperability, and the symbolic weight of a major platform endorsing a W3C standard, Threadsâ€™ federation has so far failed to either (a) transform the fediverse into a profitable growth engine for Meta or (b) establish ActivityPub as a living, generative substrate for a new kind of social web. Federated support exists, but it is marginal to Threadsâ€™ core product. Many fediverse communities remain skeptical or actively hostile. The promise of a vibrant, open ecosystem lubricated by a neutral standard has not materialized.
This paper starts from that tension. Why does a protocol that appears to have successfully navigated the standards pipelineâ€”and attracted the attention of one of the worldâ€™s largest platformsâ€”produce such an anemic result, both politically and economically? Why does a success in the language of standards bodies (a W3C Recommendation, a large deployed base, corporate adoption) coincide with a sense that something has gone dead at the heart of the â€œopen social webâ€ project?
We argue that these outcomes are symptomatic of a deeper structural dynamic: standardization as counterinsurgency. By this we mean a patterned institutional response in which standards bodies absorb infrastructural projects that originate as challenges to the dominant platform order, translate them into narrow technical artifacts, and stabilize them in forms that are highly legible to corporate and regulatory actors but stripped of much of their generative and political force.
To develop this argument, we introduce three linked concepts:

- Insurgent infrastructures: technical systems that emerge from communities as instruments of autonomy and contestation, characterized by high generativity, strong movement value, and low legibility to incumbent institutions.
- Domestication: a mode of standardization that increases institutional legibility while reducing generativity, autonomy support, and movement value.
- The Domestication Paradox: the observation that, under certain conditions, domestication can render infrastructures less valuable even to the corporations and regulators who demanded their taming, because it erodes the social and cultural energies that would have made them worth integrating.
We develop these ideas formally as an analytical framework, and then use them to interpret the evolution of ActivityPub through W3C and its subsequent encounter with Metaâ€™s Threads. Our empirical claim is that the specific processes by which ActivityPub was formalized and positioned transformed it from an insurgent infrastructure into a dead zone: a state in which a protocol is standardized, maintained, and institutionally visible, but exhibits low generativity, low movement value, and low corporate payoff.
The paper makes three contributions. First, it provides a conceptual model of standardization as counterinsurgency in the governance of internet infrastructure, connecting literatures on protocol and control, legibility, and infrastructure studies. Second, it offers a process-tracing account of ActivityPubâ€™s path through W3C and Metaâ€™s subsequent attempt to leverage it in Threads, showing how domestication unfolded in practice. Third, it draws out implications for both standards bodies and decentralized technology movements, arguing that standardization cannot be treated as a neutral graduation step but as a site of political and strategic choice.
The remainder of the paper proceeds as follows. Section 2 situates W3C and ActivityPub within the broader landscape of web standards and social web experiments. Section 3 develops our analytical framework, defining insurgent infrastructures, standardization as counterinsurgency, domestication, the Domestication Paradox, and dead zones. Section 4 explains our methods and data. Sections 5 and 6 provide our empirical analyses: ActivityPubâ€™s emergence and standardization, and Threadsâ€™ failed harvest. Section 7 synthesizes the findings, and Section 8 concludes with implications for internet governance and decentralized movements.
# 2. Background: Web Standards, Protocols, and the Social Web
## 2.1 Web Standards as Governance Infrastructure
Web standards bodies such as the W3C are often presented as neutral technical coordinators: venues in which stakeholders collaborate to design and formalize interoperable protocols. In practice, they are governance institutions that shape what the web is and can become. They determine which problems merit attention, which designs are admissible, whose concerns count as â€œtechnicalâ€ and whose as â€œout of scope,â€ and when a technology is considered stable enough to be relied upon by browser vendors, service providers, and regulators.
The W3C, founded in 1994, operates through a membership model in which companies, research institutions, and other organizations join as members and participate in working groups (WGs) and interest groups. Technical work proceeds through drafts, charters, and review processes, culminating in Recommendations that are treated as de facto standards. Although participation is formally open, the practical ability to devote staff time, travel to meetings, and sustain engagement through long deliberations gives large firms considerable influence. The resulting governance is neither purely intergovernmental nor purely market-driven; it is a hybrid regime in which corporate, academic, and civil-society actors interact under an institutional logic that emphasizes consensus, interoperability, and perceived neutrality.
Treating W3C as governance infrastructure foregrounds two points important for our argument. First, standards are political settlements: they freeze particular interpretations of what counts as a problem, what counts as adequate interoperability, and which trade-offs are acceptable. Second, participation in standardization is often a way for powerful actors to shape the evolution of infrastructures in ways that align with their strategic interests, whether by promoting technologies they control, constraining rival designs, or ensuring that emerging practices remain compatible with existing business models and regulatory commitments.
## 2.2 Protocols as Political Objects
There is a substantial body of work arguing that protocols embed specific forms of power and control. Protocols specify how entities communicate, what kinds of messages are permissible, and which behaviors are expressible or forbidden. They encode assumptions about identities, roles, and permissible interactions. Once widely adopted, they become part of the taken-for-granted infrastructure on which other systems rely.
One way to understand this is through the lens of legibility. James C. Scottâ€™s work on state-building emphasizes how institutions seek to render complex social practices legible, so they can be monitored, taxed, and regulated. Standards and protocols are a central instrument in this process, because they impose shared categories, formats, and interfaces. What becomes legible through a protocol is easier to governâ€”by states and by corporations who must coordinate large technical systems and manage regulatory risk.
Another angle comes from analyses of protocol as control, which argue that protocols operate as a form of soft power: instead of directly commanding behavior, they structure the space of possible behaviors by defining what is compatible with the system. To adopt a protocol is to accept its implicit model of the world.
Both perspectives highlight that the choice to standardize a protocolâ€”and the specific form that standardization takesâ€”is a decision about whose concerns matter, whose practices are normalized, and which futures are foreclosed. When a protocol emerges from communities opposed to dominant platform logicsâ€”such as the fediverseâ€”it enters standards processes with a particular set of political aspirations baked into its design. The question is what happens to those aspirations when the protocol becomes the subject of formal standardization.
## 2.3 The Social Web and the Fediverse
Attempts to build a â€œsocial webâ€ atop open standards have a long history. Projects such as FOAF (Friend of a Friend), OpenSocial, and various RDF-based vocabularies sought to encode social relationships and identity in web-readable formats that could be shared across services. Many of these efforts remained niche or were superseded by platform-specific APIs. The gravitational pull of centralized social networks, with their network effects and rapid product cycles, made it difficult for standards-based approaches to gain traction.
The fediverse represents a different lineage. Rather than trying to standardize abstractions that platforms could adopt, it began as a patchwork of independently-run servers implementing federation protocols to communicate with one another. Users could join specific communities (instances) with their own rules and cultures, yet still interact across boundaries. Early software such as GNU social, Diaspora, and later Mastodon offered alternative modes of participation that emphasized local moderation, community norms, and the possibility of leaving one instance for another without losing oneâ€™s social graph.
ActivityPub emerged in this context as a protocol for client-to-server and server-to-server interactions in federated social systems. Before and outside W3C, it was tied to a particular imagination: that social networking could be re-centered around small, locally governed communities that shared a common protocol but did not answer to a single platform. Its design choices reflect this orientation: emphasis on federation, ability to follow accounts across instances, and a model of content distribution that assumes multiple autonomous servers.
At the same time, ActivityPub became the focus of W3Câ€™s Social Web activity. A Social Web Working Group, and later community and interest groups, took up the task of specifying how decentralized social interactions could be expressed in web protocols. ActivityPub was formalized as a W3C Recommendation in 2018, wrapped in a cluster of related specifications (ActivityStreams 2.0, WebSub, etc.).
From one angle, this looked like a natural and welcome consolidation: a grassroots protocol gaining institutional support, increasing its chances of broader adoption and regulatory recognition. From another, it marked the beginning of a translation process: the movementâ€™s social and political aims being reinterpreted as a set of modular technical problems to be solved within the existing governance and business frameworks of the web.
In the sections that follow, we formalize this latter dynamic. We treat ActivityPub as an instance of what we call an insurgent infrastructure, and W3Câ€™s standardization process as a particular form of responseâ€”one that increases the protocolâ€™s institutional legibility while transforming its role in the broader socio-technical system.
# 3. Analytical Framework: Standardization as Counterinsurgency
In this section we build a conceptual model for understanding how standards bodies interact with infrastructures that originate as challenges to the dominant platform order. We introduce the notions of insurgent infrastructures, standardization as counterinsurgency, domestication, the Domestication Paradox, and dead zones. The goal is to define a set of structures precise enough to guide empirical analysis and comparison.
## 3.1 Insurgent Infrastructures
We use the term infrastructure to refer to technical systems that provide shared capabilities on which other applications and practices depend: protocols, platforms, identity systems, and so on. For our purposes, an infrastructure `X` can be characterized along five conceptual dimensions:

- Generativity: the extent to which `X` enables new practices, applications, and social formationsâ€”how much â€œroom to moveâ€ it creates for experimentation and divergence.
- Legibility: the extent to which `X` is easily understood, documented, and governable by dominant institutions, including standards bodies, large firms, and regulators. Legible infrastructures have clear interfaces, stable semantics, and predictable failure modes.
- Autonomy support: the extent to which `X` supports the ability of communities to operate independently of dominant platformsâ€”running their own instances, governing their own data, and setting their own norms without being technically or economically forced back into centralized services.
- Movement value: the value `X` provides to the communities and movements that created or adopted it as part of a political project. This includes functional, symbolic, cultural, and affective dimensions: the sense that the infrastructure embodies â€œourâ€ values and opens â€œourâ€ futures.
- Corporate extractable value: the extent to which large firms can derive value from integrating `X` into their systems, whether through new revenue streams, user growth, regulatory compliance, or risk mitigation.
We call an infrastructure insurgent when it scores high on generativity, autonomy support, and movement value, while its legibility and corporate extractable value are low or uncertain. Insurgent infrastructures emerge from communities seeking to change the conditions imposed by existing platforms. They are often messy, evolving, and embedded in local practices. Their meaning is tied to their role in a broader political and social project: building alternatives, resisting enclosure, or experimenting with new governance forms.
Early ActivityPub and the fediverse fit this description. They provided strong autonomy support (anyone could run an instance and connect), high generativity (numerous experimental implementations and social practices), and high movement value (a shared sense of building â€œsomething elseâ€). At the same time, they were not fully legible to major web governance institutions or platform firms. Their future corporate extractable value, if any, was unclear.
Insurgent infrastructures are not inherently virtuous or stable. They can be exclusionary, fragile, or internally contested. What matters for our purposes is that they inhabit a position outside the settled arrangements of platform capitalism and established web governance. Their very existence poses a question to those arrangements: will they be ignored, suppressed, or brought into alignment?
## 3.2 Standardization as Counterinsurgency
Standards bodies like the W3C have multiple reasons to engage with insurgent infrastructures. They may see them as promising solutions to recognized problems (e.g., interoperability, regulatory pressure for openness). They may wish to prevent fragmentation by consolidating practices around a single, documented approach. They may also respond to pressure from member organizations that want certain technologies formalized to support product roadmaps or policy narratives.
We conceptualize standardization as counterinsurgency when the response of a standards body to an insurgent infrastructure follows a particular trajectory: absorbing it into formal processes, translating its aims into institutionally acceptable terms, and stabilizing it in ways that increase legibility while neutralizing much of its insurgent potential.
For a given standards body `S` (such as W3C) and an infrastructure `X`, we can distinguish five stages in this trajectory:

- Emergence: `X` exists outside `S`. Communities develop and deploy it in pursuit of their own aims.
- Recognition: `S` acknowledges `X` as relevant. This is often visible in the creation of a working group, community group, or charter that names the technology or its problem domain.
- Translation: Within `S`, the political and social aims associated with `X` are translated into a set of â€œtechnicalâ€ problems and scoping decisions. Certain concerns (e.g., community governance, economic models, power relations) are explicitly bracketed as â€œout of scope,â€ while others (message formats, endpoints, error semantics) are considered legitimate topics for standardization.
- Stabilization: A formal standard is produced. The specification reflects the compromises and constraints of the translation process: it must be general enough to cover multiple use cases, minimal enough to reach consensus, and vague enough in contentious areas to avoid blocking publication.
- Deployment: The standardized version of `X` is adopted and implemented. Reference implementations, often maintained by a few committed projects, anchor the standard in practice. Corporate actors may selectively implement parts of the standard that align with their interests.

At each stage, the infrastructureâ€™s attributes change. Recognition increases legibility: `X` becomes a named object in institutional discourse. Translation increases legibility further but often reduces movement value, by stripping away contested aims and reframing the protocol as a neutral tool. Stabilization tends to reduce generativity, as deviations from the standard come to be seen as â€œnon-compliant.â€ Deployment, especially by large firms, can weaken autonomy support if implementations steer users into tightly coupled relationships with dominant platforms.
We call this trajectory â€œcounterinsurgencyâ€ because, like state responses to political insurgencies, it aims less at frontal suppression than at structured absorption. The goal is not to prevent people from using `X`, but to ensure that they do so in ways compatible with existing institutional logics. The insurgent infrastructure is not outlawed; it is normalized.
This framing does not imply unified intent or conspiracy. Standardization is a multi-actor process, and many participants genuinely seek to support openness, interoperability, and user autonomy. Counterinsurgency here is a structural effect: given the incentives and constraints faced by standards bodies and their members, engagements with insurgent infrastructures tend to transform them in particular ways.
## 3.3 Domestication and the Domestication Paradox
Within the broader pattern of standardization as counterinsurgency, we distinguish a more specific process we call domestication. An infrastructure is domesticated when it is reshaped so that it is highly legible and low-risk for dominant institutions, but significantly less generative, less supportive of autonomy, and less valuable as an instrument for the movement that created it.
Domestication typically involves:

- Tightening interfaces: clarifying and narrowing what counts as â€œcompliantâ€ behavior, reducing space for divergent interpretations.
- Decontextualizing goals: recasting the infrastructure as a general-purpose tool (â€œa protocol for interoperable social activitiesâ€) rather than an instrument of a specific political project.
- Repositioning control: shifting de facto control over interpretation and evolution from grassroots communities to standard editors, major implementers, and corporate participants.
From the point of view of corporations and regulators, domestication appears attractive. A domesticated infrastructure is easier to integrate, explain to policymakers, and incorporate into compliance narratives. It reduces uncertainty and coordination costs.
However, domestication has a less obvious effect on corporate extractable value. Large firms derive value from integrating infrastructures in at least two ways: by harnessing their generativity (access to new practices, communities, and markets) and by exploiting their legibility (predictable interfaces, stability, and regulatory cover). Domestication increases legibility but decreases generativity and movement value. It can also damage alignment with the originating communities, making those communities less willing to cooperate or to treat the corporate integration as legitimate.
We call this the Domestication Paradox: under some conditions, the very process that makes an insurgent infrastructure legible and seemingly safe for corporate adoption also undermines the social and cultural energies that would make integration worthwhile. After domestication, the infrastructure may be technically easy to plug into but no longer anchors a vibrant ecosystem that wants to be plugged into.
In such cases, firms may find that integration yields only thin benefits: minor regulatory goodwill, marketing narratives about openness, or small pockets of user activity, without the transformative network effects or innovation pipelines they had anticipated. Meanwhile, the movement that created the infrastructure experiences it as hollowed out: present in technical standards and corporate whitepapers, but absent as a living vehicle for its aspirations.
## 3.4 Dead Zones
The end state of a domestication trajectory can be described as a dead zone in the space of possible infrastructures. A dead zone infrastructure exhibits the following characteristics:

- It is highly legible to institutions. It is documented, standardized, and incorporated into reference architectures and regulatory frameworks.
- It has low generativity. Few new practices or applications are emerging around it. Innovation, where it occurs, happens elsewhere.
- It has low movement value. The communities that once saw it as an instrument of their project now see it as peripheral, compromised, or simply irrelevant.
- It has low corporate extractable value. Firms either do not bother to integrate it, or do so in ways that are marginal to their core strategies.
Dead zones are not empty. Traffic still flows; some systems depend on them; standards bodies may still maintain them. But they are not where the future is being made. They are stabilized, managed spacesâ€”vestiges of earlier conflicts that have been rendered harmless.
Our claim is not that all standardization produces dead zones, nor that all insurgent infrastructures are destined to be domesticated. Rather, we propose that the combination of insurgent origins, engagement by standards bodies oriented toward legibility and consensus, and subsequent selective corporate adoption can produce dead zones as a structural outcome.
## 3.5 Summary and Expectations
The framework developed in this section offers a set of expectations we will use in our empirical analysis of ActivityPub and Threads:

- We expect to see ActivityPub originate as an insurgent infrastructure: high generativity, high autonomy support, high movement value, low institutional legibility.
- We expect W3Câ€™s engagement to follow the stages of standardization as counterinsurgency: recognition, translation, stabilization, and deployment, each associated with increased legibility and decreased generativity and movement value.
- We expect domestication to manifest in the way ActivityPub is specified (what is in scope, what is not) and in the emergence of a narrow reference implementation (Mastodon) that anchors interpretation.
- We expect Metaâ€™s Threads to approach ActivityPub as a domesticated, institutionally safe protocol and to discover that integration yields limited corporate extractable value, in part because the domestication process has weakened the very ecosystem that would have made integration attractive.
- We expect the current configuration of ActivityPub in relation to Threads and the broader fediverse to exhibit features of a dead zone: standardized, visible, and maintained, but not a locus of significant generativity or value production for either movement or platform.
In the next sections, we operationalize these expectations through a qualitative analysis of documents, timelines, and discourses surrounding ActivityPubâ€™s standardization and Threadsâ€™ federation.
# 4. Methods and Data
This paper combines conceptual modeling with qualitative, document-based analysis. The argument does not rest on a large-N dataset or formal causal identification; instead, it proceeds by theory-building from a structured case, in which ActivityPub and Threads are treated as a single evolving configuration of infrastructure and governance.
## 4.1 Research Design
We adopt a process-tracing design oriented around two linked moments in the life of the same protocol:

- **Moment 1: ActivityPubâ€™s emergence and standardization**
We follow ActivityPub from its origins in fediverse-adjacent development through its formalization as a W3C Recommendation, paying particular attention to how its aims, design space, and interpretive flexibility changed as it moved through the stages of recognition, translation, stabilization, and deployment.

- **Moment 2: Threadsâ€™ federation attempt**
We then examine Metaâ€™s attempt to integrate ActivityPub into Threads, focusing on how ActivityPubâ€™s domesticated form structured what was technically and politically possible, and how both Meta and fediverse communities responded.
The two moments are analytically distinct but materially continuous: the Threads episode is only intelligible given the prior standardization of ActivityPub, and the effects of that standardization become visible when a major platform tries to exploit the resulting protocol. The research design thus treats Threads not as a separate case, but as a later phase in the trajectory of the same insurgent infrastructure under institutional pressure.
The design is theory-guided: the analytical framework developed in Section 3 specifies a set of expectations about how insurgent infrastructures are transformed by standardization as counterinsurgency. We use empirical materials to test and refine these expectations, and to identify the conditions under which the Domestication Paradox and dead zones emerge.
## 4.2 Data Sources
The analysis draws on three primary types of material:

- **Standards and governance documents**
- W3C charters, working group and community group descriptions, and process documents related to the Social Web activity.
- Drafts, issues, and the final Recommendation text for ActivityPub and closely related specifications (e.g., ActivityStreams 2.0).
- Meeting minutes, mailing list discussions, and GitHub issue threads associated with the development and standardization of ActivityPub.

These documents reveal how ActivityPub was framed within W3C, what problems it was said to solve, which topics were considered in scope or out of scope, and how contentious design decisions were negotiated.

- **Fediverse and community discourse**
- Blog posts, technical write-ups, and announcement posts from early ActivityPub implementers and fediverse developers.
- Public discussions on issue trackers and community forums related to federation design, moderation, governance, and platform alternatives.
- Commentary from instance administrators, developers, and users reflecting on the meaning of federation and the role of ActivityPub within the fediverse.

These materials reveal how ActivityPub was understood as part of a broader political and social project, and how those understandings evolved as W3C became involved and Mastodon rose to prominence.

- **Corporate and media materials related to Threads**
- Metaâ€™s public announcements of Threads, including statements about interoperability, federation, and plans to â€œjoin the fediverse.â€
- Technical documentation and blog posts describing how ActivityPub integration was to be implemented.
- Press coverage and interviews with Meta representatives about the motivations and implications of ActivityPub support.
- Public responses from fediverse communities to Threadsâ€™ federation plans, including decisions to federate or defederate.
These materials reveal how Meta framed ActivityPub and the fediverse, what it expected to gain from federation, and how the domesticated protocol and its communities responded in practice.
Where possible, we treat these sources as performative acts: moments in which actors position themselves, redefine the situation, and contribute to the ongoing domestication or resistance of the infrastructure.
## 4.3 Analytic Strategy
Analytically, we combine discourse analysis with process tracing under the guidance of the conceptual language introduced in Section 3.
First, we code key documents and discussions using the five conceptual dimensions of an infrastructureâ€™s attribute vectorâ€”generativity, legibility, autonomy support, movement value, corporate extractable valueâ€”as sensitizing concepts. We do not assign numeric scores. Instead, we ask:

- How is ActivityPub being framed: as a tool for autonomy or for interoperability?
- Who is expected to run it: small communities, large platforms, or both?
- Which futures are being imagined around it: platform alternatives, regulatory compliance, or incremental feature integration?
- How are questions of governance, moderation, and power handled: as technical scope, as external concerns, or as â€œsomeone elseâ€™s problemâ€?
Second, we reconstruct timelines of key decisions and events in both the W3C process and the Threads rollout, identifying moments where the attributes of ActivityPub shift. For example: the decision to bracket moderation and governance as out of scope at W3C; the emergence of Mastodon as a de facto reference implementation; the choice by Threads to federate only certain kinds of content or instances; the decisions by fediverse communities to block or accept Threads instances.
Third, we map these empirical observations onto the SaC pipeline (emergence, recognition, translation, stabilization, deployment) and the outcomes of domestication (including potential dead zones). We ask whether and how the patterns we see in ActivityPub and Threads correspond to the theoretical expectations laid out previously, and where the empirical material suggests modifications or additional nuance.
This strategy allows us to move back and forth between theory and case, without forcing messy historical trajectories into overly rigid categories. The goal is to articulate a pattern in the interaction between insurgent infrastructures and standards bodies that can be recognized, debated, and tested in other settings.
# 5. Case I â€“ From Insurgency to Standard: ActivityPub Through W3C
We now turn to the first moment of our case: the path of ActivityPub from an insurgent infrastructure rooted in fediverse experimentation to a W3C Recommendation that anchors a domesticated understanding of the â€œsocial web.â€ We follow the stages of emergence, recognition, translation, and stabilization, and show how they reshape ActivityPubâ€™s attributes.
## 5.1 Emergence: ActivityPub as Insurgent Infrastructure
Before W3C formalization, ActivityPub was part of a broader family of experiments in federated social networking. Developers working on projects such as GNU social, Diaspora, StatusNet, Pump.io, and early Mastodon instances shared a common frustration with centralized social platforms: their control over user data and social graphs, their opaque moderation practices, and their susceptibility to sudden policy or business model changes. Federation, in this context, was not simply a distribution technique. It was a political strategy: a way to decentralize control and enable communities to run their own social spaces.
ActivityPub emerged from efforts to design a protocol that could support both client-to-server and server-to-server interactions across independently run instances. Its emphasis on following accounts across instances, sending activities between actors hosted on different servers, and representing social objects in extensible vocabularies reflected a commitment to inter-instance autonomy. Anyone could run an ActivityPub server and participate in the network on equal technical footing with others.
In this phase, ActivityPub exhibited the attributes of an insurgent infrastructure:

- High generativity: multiple implementations experimented with different user experiences (microblogging, photo sharing, event planning), federation patterns, and governance models. The protocol was evolving, and its edges were porous.
- High autonomy support: communities could fork code, spin up instances, and define local norms without needing approval from a central authority. The protocol aimed to make moving between instances or interacting across them straightforward.
- High movement value: for many participants, using ActivityPub-based systems was an expression of commitment to â€œanother web,â€ one not dominated by a handful of platforms. Posts, blog entries, and talks framed federation as a way to reclaim agency over social media infrastructure.
- Low institutional legibility: outside of the fediverse and allied circles, ActivityPub was obscure. It was not yet inscribed into high-profile standards or regulatory frameworks.
- Unclear corporate extractable value: large firms did not yet see a clear path to making money from ActivityPub. If anything, the protocol appeared to undermine their advantages by lowering the cost of entry for competitors.
In short, ActivityPub started life as a protocol through which communities attempted to materialize a different social order, not just to add another option to the existing platform ecosystem.
## 5.2 Recognition and Translation in W3C
The W3Câ€™s Social Web activities emerged from a recognition that interaction, identity, and social relationships on the web were increasingly mediated by centralized platforms, and that there was value in defining standards for decentralized social data and interactions. ActivityPub entered this space as a candidate solution, influenced by and sometimes converging with previous W3C work on social data formats and APIs.
The recognition phase can be seen in the creation of working groups and community groups charged with exploring â€œsocial webâ€ standards and in the inclusion of ActivityPub in their scopes. This brought ActivityPub into the W3Câ€™s institutional field of view. It became a named object in charters, issue lists, and deliverable schedules.
The translation phase occurred as W3C participants worked to define what, exactly, ActivityPub was supposed to standardize. Draft charters and specification introductions framed ActivityPub as â€œa protocol for distributed social networking,â€ emphasizing technical goals such as interoperability between independently operated servers, message delivery semantics, and the use of ActivityStreams vocabularies for expressing actions.
In this process, key aspects of the fediverse imagination were selectively reinterpreted or bracketed:

- Questions about moderation and governanceâ€”who should have the power to block whom, how hate speech or harassment should be handled, how communities could defend themselves against unwanted attentionâ€”were generally treated as application-level concerns, â€œout of scopeâ€ for the protocol.
- Questions about economic models and sustainabilityâ€”how instances would be funded, whether advertising or surveillance would be permitted, how to avoid reproducing platform business logicsâ€”were also bracketed. The protocol was presented as neutral with respect to business models.
- Questions about power asymmetries between small, volunteer-run instances and large, professionally operated services were acknowledged in discussion but not encoded in the specification. ActivityPub did not distinguish between an instance run by one person and a global-scale deployment by a major corporation.
What remained in scope were technical interoperability issues: how to send and receive activities, how to discover actor endpoints, how to handle delivery failures. The infrastructureâ€™s legibility increased: ActivityPub was now described in terms that fit W3Câ€™s preferred problem categories. But the translation process also reduced movement value: the protocol was no longer explicitly positioned as an instrument for building alternatives to platform capitalism, even if many of its implementers still saw it that way.
This is not to say that W3C actors were hostile to the fediverseâ€™s aspirations. Many participants were sympathetic to decentralization and user autonomy. But the institutional logic of standardizationâ€”emphasizing technical scope, consensus, and implementability across diverse stakeholdersâ€”meant that the political content of ActivityPub had to be flattened to fit.
## 5.3 Stabilization and Mastodon as Reference Implementation
The stabilization phase culminated in ActivityPub becoming a W3C Recommendation. The specification defined client-to-server and server-to-server interactions, relying on ActivityStreams 2.0 as the vocabulary for expressing activities. It provided examples of common use cases (e.g., following, liking, creating posts) and described how servers should handle delivery and addressing.
The Recommendation increased ActivityPubâ€™s institutional legibility significantly. It now had an official, citable document backed by W3Câ€™s processes. This made it easier for regulators, journalists, and companies to talk about â€œthe ActivityPub standardâ€ and to treat it as a stable piece of web infrastructure.
At the same time, the ecosystem around ActivityPub began to consolidate around Mastodon as a de facto reference implementation. Mastodonâ€™s rapid growth, especially during high-profile waves of user migration away from Twitter, meant that its particular interpretation of ActivityPubâ€”its data models, timelines, moderation tools, and federation patternsâ€”became the dominant way people encountered the protocol in practice.
This consolidation had several effects:

- It reduced generativity. While other implementations and experiments continued, the gravitational pull of Mastodonâ€™s model made deviations less attractive. New projects often chose to be â€œMastodon-compatibleâ€ rather than exploring radically different designs, because compatibility brought instant access to an existing network.
- It subtly shifted autonomy support. Technically, ActivityPub still allowed anyone to run an instance. But in practice, many users experienced federation through large, well-known Mastodon instances. The social and infrastructural dependence on Mastodonâ€™s codebase and governance grew.
- It reframed activity in the fediverse. Public discourse increasingly equated â€œthe fediverseâ€ with â€œMastodon,â€ and â€œMastodonâ€ with a familiar microblogging experience. The broader experimentation that had defined the earlier stages receded from view.
Here, domestication operates through the specification text and through implementation hegemony. Mastodon did not simply implement ActivityPub; it anchored what ActivityPub was understood to be. Insofar as ActivityPubâ€™s insurgent potential lay in the diversity of forms it could support, the combination of W3C stabilization and Mastodon-centric consolidation narrowed that potential.
## 5.4 Trajectory of Attributes
Viewed through the attribute lens introduced in Section 3, ActivityPubâ€™s passage through W3C exhibits the characteristic movements of standardization as counterinsurgency:

- Legibility increased steadily. ActivityPub moved from an obscure protocol used by a subset of federated projects to a named W3C Recommendation, interpreted through a widely adopted implementation. It became easier for institutions to â€œseeâ€ and refer to ActivityPub as a unitary object.
- Generativity decreased. The combination of specification constraints and Mastodonâ€™s dominance reduced the incentive and space for divergent experiments. Innovation increasingly took the form of extensions and tweaks within the Mastodon-centric model rather than exploration of alternative federation paradigms.
- Autonomy support shifted. The formal protocol continued to enable independently run instances, and in that sense autonomy remained structurally available. But the sociotechnical ecosystem nudged users and developers toward relying on a small number of large instances and codebases, introducing new dependencies and informal centralization.
- Movement value declined. While many in the fediverse remained committed to alternative visions of social media, ActivityPub itself became less of a symbolic rallying point. It was increasingly framed as â€œthe standard protocol Mastodon usesâ€ rather than as an insurgent infrastructure for a different social web.
- Corporate extractable value appeared to increase, at least in perception. With a W3C Recommendation and a visible user base via Mastodon, ActivityPub looked like a safe, institutionally recognized protocol that major platforms could adopt to claim openness or comply with emerging interoperability expectations.
This trajectory does not mean that W3C â€œcapturedâ€ ActivityPub in a single decisive move. Rather, it shows how a series of individually reasonable decisionsâ€”about scope, consensus, and implementationâ€”collectively transformed ActivityPub from a messy, insurgent infrastructure into a legible, domesticated protocol. In the next section, we examine what happened when a major platform, Metaâ€™s Threads, attempted to harvest value from that domesticated infrastructure, and how the Domestication Paradox manifests in this encounter.
# 6. Case II â€“ Threads and the Failed Harvest
If ActivityPubâ€™s path through W3C illustrates standardization as counterinsurgency, Metaâ€™s Threads illustrates the Domestication Paradox: an attempt by a major platform to extract value from a domesticated infrastructure that yields much less than expected.
## 6.1 Metaâ€™s Strategic Framing of Threads and ActivityPub
Threads was launched as Metaâ€™s answer to Twitterâ€™s instability and perceived decline. Positioned as a text-centric companion to Instagram, it promised a more positive, less combative space for real-time conversation. Early announcements emphasized ease of onboarding (using Instagram accounts) and familiar engagement mechanics.
In a move that surprised many observers, Meta also announced an intention to support ActivityPub federation. The integration was framed as a commitment to openness and interoperability. Public statements suggested that Threads would eventually allow users to follow and be followed by accounts on other ActivityPub-based services, and that posts could flow between Threads and the broader fediverse.
From Metaâ€™s perspective, ActivityPub now had several attractive features:

- It was a W3C Recommendation, giving it institutional legitimacy and a proven process behind it.
- It had a visible ecosystem via Mastodon and other fediverse services, providing an existing network into which Threads could plug.
- It offered a way to claim alignment with regulatory and public narratives around interoperability and user choice, particularly in jurisdictions considering rules to curb platform lock-in.
ActivityPub, in other words, appeared as a domesticated protocol: technically well-specified, socially stabilized, and safe to endorse. Meta could present federation as a gesture toward an â€œopen social webâ€ without committing to a radical restructuring of its business model or control over data.
## 6.2 Implementing Federation: Asymmetry and Caution
In practice, Threadsâ€™ federation rollout was cautious, asymmetric, and tightly managed. Rather than immediately entering into full, bidirectional federation with the entire fediverse, Meta took a staged approach:

- Initial integration was limited to following Threads users from certain ActivityPub instances, with constraints on what kinds of content would flow and when.
- Threads did not immediately allow full portability of user accounts or social graphs, preserving Metaâ€™s control over identity and moderation.
- Federation was framed as an experimental feature, subject to change and not central to the core product.
These choices reflect rational concerns: Meta had to manage legal liability for content, maintain moderation standards, and avoid undermining its own network effects. But they also reveal an underlying tension. The insurgent appeal of ActivityPub lay in its support for autonomous, locally governed communities; Threadsâ€™ integration emphasized minimal, low-risk interoperability that would not destabilize Metaâ€™s platform logic.
Technically, the domesticated ActivityPub standard made this cautious integration straightforward. The protocol defined how to deliver activities, discover actors, and represent posts. Meta could implement the parts it needed, ignore others, and still claim â€œActivityPub complianceâ€ in a broad sense. This is the selective deployment stage of standardization as counterinsurgency: corporations adopt a standard in ways that reinforce their existing strategies.
## 6.3 Fediverse Responses: Suspicion, Resistance, and Conditional Engagement
Fediverse communities did not uniformly welcome Threads. Some instances saw the potential for greater reach, easier onboarding for new users, or increased visibility for alternative platforms. Others viewed Threads as a direct threat: an attempt by a dominant platform to infiltrate, observe, and eventually absorb a network that had been built as an alternative to platform dominance.
Administrators and users debated whether to federate with Threads instances at all. Arguments against federation included:

- Concern that Threads would serve as a surveillance point, collecting data on user behavior and social graphs across the fediverse.
- Fear that federation would normalize Metaâ€™s presence and undermine the fediverseâ€™s identity as a space outside of platform capitalism.
- Worry that Metaâ€™s scale and moderation policies would create pressure to align with its norms, effectively re-centralizing power.
Arguments in favor of federation typically focused on incremental benefits: giving fediverse users access to content and connections on Threads without having to join Metaâ€™s platform directly, or exposing Threads users to federated alternatives.
Crucially, these debates indicate that the movement value of ActivityPub, as an insurgent infrastructure, remained alive in many communitiesâ€”even if the protocol itself had been domesticated at the standards level. Users and administrators were not simply neutral nodes in a network defined by a W3C Recommendation; they were participants in a political project who had to decide whether Metaâ€™s integration was compatible with their goals.
Many instances chose to block Threads or to adopt a wait-and-see approach. Others federated but monitored the situation closely. The result was a patchy, negotiated landscape of partial interoperability, rather than a smooth merger of two networks.
## 6.4 Limited Corporate Extractable Value
From Metaâ€™s standpoint, federation with ActivityPub did not become a central driver of Threadsâ€™ growth or differentiation. User adoption of Threads appeared to be driven more by its integration with Instagram, its interface design, and the gravitational pull of Metaâ€™s existing user base than by its ability to connect with the fediverse. For most Threads users, federation was an obscure or irrelevant feature.
Meanwhile, the fediverse remained wary. It did not reorganize itself around Threads as a new center of gravity. Instead, many communities doubled down on their own norms and narratives, using the possibility of federation with Meta as a catalyst for internal discussions about autonomy, trust, and identity.
In terms of our framework, the corporate extractable value of integrating with ActivityPub (`C_p`) appears to have been much lower than Metaâ€™s public framing might have implied:

- The generativity of the ActivityPub ecosystem had already been reduced by domestication and consolidation around Mastodonâ€™s model. There was less novel practice to harvest.
- The movement value of ActivityPub remained, but it was now oriented in part against Metaâ€™s presence. Integration risked activating resistance rather than cooperation.
- The legibility of ActivityPub was highâ€”Meta could implement it with confidenceâ€”but legibility alone did not translate into valuable new user behaviors or markets.
Threadsâ€™ federation thus exemplifies the Domestication Paradox. The very processes that rendered ActivityPub legible and safe enough for a platform like Meta to adopt also eroded the insurgent energies that would have made such an adoption transformative. ActivityPub had become a managed interface rather than a living frontier.
## 6.5 ActivityPub and Threads as a Dead Zone Configuration
Putting these elements together, we can see the current ActivityPubâ€“Threads configuration as an instance of a dead zone in the infrastructural landscape:

- ActivityPub is standardized and legible. It is backed by a W3C Recommendation, referenced in policy discussions, and known to major platforms.
- It has reduced generativity. Innovation in the fediverse continues, but much of it takes place within the constraints of Mastodon-compatible federation or in adjacent protocols and practices, rather than in redefining ActivityPub itself.
- Its movement value is partial and contested. For some, ActivityPub remains an emblem of an alternative social web; for others, it is a technical detail in a much broader political struggle over governance and autonomy.
- Its corporate extractable value is limited. Metaâ€™s integration has not yielded the kind of strategic advantage that might make federation central to Threadsâ€™ identity or business.
This does not mean ActivityPub is irrelevant. It continues to underpin real systems and communities. But it occupies a stabilized, low-energy position: a domesticated infrastructure that neither platform capital nor decentralized movements can straightforwardly claim as a vehicle for their respective ambitions.
In the next section, we synthesize the two moments of our case to clarify how standardization as counterinsurgency, domestication, and dead zones interact in this trajectory.
# 7. Synthesis: Dead Zones and the Limits of Infrastructural Capture
The two moments we have examinedâ€”ActivityPubâ€™s standardization and Threadsâ€™ attempted harvestâ€”reveal a consistent pattern. In this section, we step back and draw out the implications of that pattern for our theoretical framework.
## 7.1 Mapping the SaC Pipeline
ActivityPubâ€™s passage through W3C and its encounter with Threads closely align with the stages of standardization as counterinsurgency:

- Emergence: ActivityPub arises within the fediverse as an insurgent infrastructure, tightly coupled to a political project of platform autonomy.
- Recognition: W3C incorporates ActivityPub into its Social Web agenda. The protocol becomes a named object in charters and deliverables.
- Translation: Political questions about governance, power asymmetry, and business models are bracketed as out of scope. ActivityPub is redefined as a technical solution to the problem of interoperable social activities.
- Stabilization: A W3C Recommendation is published, and Mastodon emerges as the dominant implementation. ActivityPubâ€™s behavior and meaning are anchored by a relatively narrow slice of the original design space.
- Deployment: Platform firms, including Meta, selectively implement ActivityPub in ways that align with their own strategies, using federation as a feature rather than a foundation.
Each stage represents a plausible, even reasonable, move from the standpoint of participants. Yet the cumulative effect is to absorb an insurgent infrastructure into the existing governance regime, neutralizing much of its disruptive potential.
## 7.2 Domestication and the Domestication Paradox in Practice
The domestication of ActivityPub becomes visible in at least three dimensions:

- Scope: The specification encodes technical interoperability while excluding explicit attention to governance, economics, and power. This narrowing decouples the protocol from the broader political project that animated its creation.
- Implementation: Mastodonâ€™s dominance as a reference implementation narrows the range of viable interpretations, making it harder to experiment with radically different social forms under the same protocol.
- Integration: Metaâ€™s Threads uses ActivityPub as a low-risk, optional interoperability layer, demonstrating that domesticated protocols can be integrated selectively without significant changes to platform governance or business models.
The Domestication Paradox emerges when we ask what Meta actually gains from this integration. The legibility of ActivityPubâ€”the outcome of standardizationâ€”is necessary for adoption but not sufficient for value. Without a vibrant, welcoming ecosystem oriented toward collaboration, federation offers limited payoff. Indeed, the residual movement value of ActivityPub, now partially oriented in opposition to corporate capture, may actively constrain Metaâ€™s freedom of action.
In this sense, standardization as counterinsurgency overperforms its neutralizing function. By the time a domesticated infrastructure becomes attractive to a major platform, it has already lost much of the generativity that would make integration mutually beneficial.
## 7.3 Dead Zones as Structural Outcomes
The notion of a dead zone helps to capture this outcome. ActivityPub is neither a failed technology nor a triumphant standard. It is something in between: an infrastructure that has been stabilized and institutionalized, but which no longer serves as a primary site of innovation for either insurgent movements or dominant platforms.
Dead zones are not accidents. They arise when:

- insurgent infrastructures are drawn into standards bodies,
- domestication processes prioritize legibility and compatibility over generativity and autonomy,
- and corporate actors adopt the resulting standards in ways that are cautious, selective, and strategically defensive.
In such configurations, both sides get less than they might have hoped. Movements lose a key vehicle for experimentation and the articulation of alternatives; platforms gain a modest public-relations boon and some interoperability tools, but not a new engine of growth or control.
Recognizing dead zones as a structural possibility complicates both celebratory narratives of open standards and purely oppositional narratives of corporate capture. It suggests that the interplay between insurgent infrastructures and standards institutions can produce mutual exhaustion rather than clear victory for either side.
# 8. Implications: Governance, Movements, and Design
The analysis above carries implications for three overlapping domains: internet governance and standards bodies, decentralized movements and protocol designers, and scholars of infrastructure and platform capitalism.
## 8.1 Rethinking the Role of Standards Bodies
For standards bodies like W3C, this case highlights the need to reflect on how their processes interact with insurgent infrastructures. Three points follow:
First, scope decisions are political. When questions of governance, power asymmetry, and economic models are systematically declared out of scope, standards bodies contribute to the domestication of infrastructures, even if unintentionally. Recognizing this does not mean that W3C should legislate social arrangements, but it does mean that the consequences of bracketing such issues should be made explicit and contestable.
Second, legibility is political. Increasing the legibility of an infrastructure to institutions can support adoption and coordination, and it can also redirect control and constrain experimentation. Standards processes could be designed to preserve or even protect certain forms of illegibilityâ€”spaces where communities retain interpretive autonomy and the ability to evolve the protocol locally.
Third, success metrics need revision. Counting Recommendations, implementations, or corporate adopters as indicators of success obscures whether the standard sustains a living ecosystem or contributes to a dead zone. Standards bodies could develop metrics that attend to generativity and diversity of practice, not just compliance and deployment.
## 8.2 Strategic Lessons for Decentralized Movements
For decentralized technology movements, the ActivityPubâ€“Threads trajectory suggests that standardization is a double-edged sword.
On the one hand, standards can provide stability, interoperability, and recognition. On the other, premature or uncritical standardization can accelerate domestication, locking in a version of the protocol that is optimized for legibility to institutions rather than for the movementâ€™s own evolving needs.
Three strategic lessons follow:

- Movements should treat engagement with standards bodies as a political decision, not as a purely technical graduation step. This includes assessing whether the benefits of institutional recognition outweigh the risks of domestication in a given moment.
- Protocol designers can consider deliberately preserving non-standardized or partially standardized zones, where local experimentation, governance models, and divergent practices can flourish without being forced into a single, globally legible form. This may involve resisting the temptation to formalize every aspect of a system under a single banner.
- In some cases, movements may decide to postpone or limit standardization, focusing instead on running code, shared norms, and federated social structures that are resilient to institutional capture.

## 8.3 Directions for Scholarship
For scholars of infrastructure, platforms, and governance, this paper points toward several lines of inquiry:

- Comparative studies of other insurgent infrastructures that have encountered standardizationâ€”such as certain blockchain protocols, peer-to-peer file-sharing systems, or identity frameworksâ€”could test whether similar domestication and dead zone dynamics appear.
- Quantitative and network-analytic approaches could attempt to operationalize generativity and movement value, for example by tracking the diversity of implementations, rates of protocol extension, or patterns of forking and convergence over time.
- Institutional ethnographies of standards bodies could illuminate the everyday practices through which scoping decisions, consensus-building, and interface design enact standardization as counterinsurgency.
- More broadly, the concept of dead zones suggests that we need a vocabulary for infrastructures that are neither failures nor triumphs, but stabilized residues of contested futures.

# 9. Conclusion
This paper has argued that the trajectory of ActivityPub and Metaâ€™s Threads can be understood as an instance of standardization as counterinsurgency in the governance of internet infrastructure. ActivityPub began as an insurgent infrastructure associated with the fediverse: a protocol through which communities sought to build alternatives to centralized social platforms. Its passage through W3C increased its institutional legibility but also domesticated it, narrowing its design space and decoupling it from many of the political aims that animated its creation.
When Metaâ€™s Threads later attempted to integrate ActivityPub, it encountered a domesticated protocol: technically well-specified, institutionally recognized, and easy to adopt selectively. Yet the integration yielded limited corporate extractable value. Federation did not become central to Threadsâ€™ growth or differentiation, and many fediverse communities responded with suspicion or resistance. The insurgent energy that might have made ActivityPub a powerful partner for Threads had already been eroded; the remaining movement value was partially oriented against platform integration.
We have described this outcome as a dead zone: a state in which an infrastructure is standardized and maintained but exhibits low generativity, low movement value, and low corporate payoff. Dead zones, we suggest, are a structural possibility whenever insurgent infrastructures are absorbed into standards processes that prioritize legibility and consensus, and when corporations adopt the resulting protocols in cautious, defensive ways.
The ActivityPub-Threads case shows that standardization is a site of political choice and strategic risk. It can protect and amplify insurgent projects, and it can also domesticate them to the point where they no longer serve either the movements that created them or the platforms that adopt them.
For standards bodies, this suggests a need to confront the political implications of scoping and domestication. For decentralized movements, it underscores the importance of being deliberate about when and how to seek institutional recognition. For scholars, it opens a lens onto the subtle ways in which infrastructures that once embodied alternative futures become stabilized as managed, low-energy residues.
The future of the social web will not be determined solely in code repositories or standards documents. It will also be shaped by how communities and institutions negotiate the tension between legibility and autonomy, between interoperability and control, between the desire to be recognized and the need to remain partially illegible in order to stay alive.
