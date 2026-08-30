# A Relational Model of Anarchist Insurgency Without Identity

## Abstract

Much scholarship on insurgency and collective action presupposes actors with persistent identity: organizations, movements, leaders, or at least stable networks of participants. Yet significant currents in anarchist practice explicitly reject fixed identity, formal membership, and durable representational structures. From anonymous affinity groups and black blocs to territorially diffuse communes and temporary constellations of mutual aid, these formations seek to act collectively while remaining illegible to state and market apparatuses.

This paper develops a formal **relational model of anarchist insurgency without identity**. Rather than starting from agents with attributes, we construct a calculus of **acts**, **traces**, and **relations** that captures how patterns of intervention can stabilize and propagate without any persistent subject. We define a minimal ontological vocabulary for such formations: sites, situations, interventions, and couplings. On this basis we introduce **insurgent configurations** as structured ensembles of interventions, and define conditions under which these configurations exhibit coherence, reproducibility, and resistance to state legibility.

Our contributions are fourfold. First, we articulate a relational formalism in which insurgent dynamics are described without reference to enduring actors, yet remain precise enough to support analysis of coordination, diffusion, and repression. Second, we introduce the concept of **non-identitarian coherence**: global stability of practice emerging from local compatibilities among interventions, rather than from centralized strategy or unitary identity. Third, we examine how such formations interact with apparatuses of legibility and control, drawing on James C. Scott’s analysis of state simplifications and more recent work on anonymous and insurrectionary anarchism. Finally, we analyze failure modes—capture, collapse, moralization, and re-identification—and propose criteria for evaluating the robustness of non-identitarian insurgent formations.

By treating identity-less insurgency as a relational structure rather than a sociological paradox, we show that such formations are neither ephemeral nor incoherent. They instantiate a distinct logic of political action, one in which the persistence of patterns does not require the persistence of persons.

---

## 1. Introduction

### 1.1 Identity and the grammar of insurgency

Standard accounts of insurgency begin with identifiable actors. In political science, insurgent organizations are catalogued as groups with names, leadership structures, and membership rules. In security studies, threat models distinguish organizations, cells, and lone actors, but always treat them as discrete units. Even sympathetic social movement research frequently traces trajectories of organizations, campaigns, and leaders over time.

Anarchist practice often refuses this grammar. Many currents of contemporary anarchism—insurrectionary, nihilist, communizing, anti-civilizational—insist on forms of action that are:

- **anonymous or pseudonymous** rather than name-bearing,
- **non-membership-based**, avoiding registration or formal joining,
- **non-representational**, rejecting the role of speaking for a population or constituency,
- and **anti-identitarian**, skeptical of stable self-descriptions as subjects of politics.

Black blocs, affinity groups, anonymous communiqués, diffuse networks of mutual aid, and temporary communes are all examples of such formations. They act, sometimes with considerable effect, but resist incorporation into familiar categories of organization and identity.

This tension is not merely descriptive. It reflects a substantive disagreement about what political action is. For many anarchists, identity is not merely a contingent feature of organizing but a vector of capture: to be legible as a group is already to be susceptible to policing, co-optation, and representation by others.

### 1.2 Problem statement

The central question of this paper is:

> How can we formally model insurgent formations that seek coherence of action while rejecting persistent identity, formal membership, and representational structures?

To answer this, we require a framework that:

1. **Does not presuppose identity.** The basic units of analysis cannot be organizations, groups, or selves with stable boundaries.
2. **Still captures coordination.** We must be able to describe how patterns of action cohere and reproduce across time and space.
3. **Engages legibility and control.** The model must represent how such formations appear to, and interact with, state and capitalist apparatuses.
4. **Supports evaluation.** It must be possible to speak about robustness, vulnerability, and failure modes.

We propose that this is best achieved by treating insurgency as a **relational field of interventions**, and by describing its structure in terms of acts and couplings rather than agents and attributes.

### 1.3 Approach and contributions

Our approach is constructive and formal. We develop a minimal relational vocabulary for describing insurgent activity:

- **Sites** at which interventions can occur.
- **Situations** as local configurations of conditions at a site.
- **Interventions** as transformations of situations.
- **Couplings** as constraints relating situations and interventions across sites.

On this basis, an **insurgent configuration** is a finite set of coupled interventions satisfying certain structural properties. Coherence emerges as a property of how interventions fit together, not as the expression of a unified subject.

The contributions of the paper are:

1. A **relational formalism** for identity-less insurgency, centered on acts, situations, and couplings.
2. A definition of **non-identitarian coherence**, with associated structural criteria.
3. An analysis of **legibility** and **invisibility**, connecting the model to state practices of simplification and surveillance.
4. A typology of **failure modes** for such formations, including capture, collapse, moralization, and re-identification.

### 1.4 Structure of the paper

Section 2 situates our work in relation to anarchist theory, social movement research, and studies of state legibility. Section 3 introduces the relational formalism. Section 4 develops the model of insurgent configurations and non-identitarian coherence. Section 5 situates these configurations with respect to legibility and control. Section 6 analyzes failure modes. Section 7 discusses implications and possible extensions.

---

## 2. Background and Related Work

### 2.1 Anarchist currents against identity

Anarchism has always harbored tendencies skeptical of identity and representation, but this skepticism became particularly explicit in late twentieth and early twenty-first century currents. Insurrectionary anarchism emphasized small, affinity-based actions over enduring organizations, insisting on the primacy of attack and experimentation over programmatic politics. Anonymous texts such as those signed by the Invisible Committee argued for a politics organized around **zones of opacity** and diffuse communes rather than parties or unions.

Nihilist and anti-civilizational anarchists extended this critique further, rejecting projects of self-definition oriented toward recognition by the very structures they sought to abolish. Some strands of indigenous anarchist and nihilist writing likewise insisted that identity categories offered by settler states were themselves mechanisms of control, and that liberation required forms of life irreducible to the state’s classificatory schemes.

While these currents differ among themselves, they share a refusal of political identity as a stable object.

### 2.2 Direct action, affinity groups, and horizontality

Empirical work on anarchist and horizontalist movements has documented organizing practices that rely on affinity groups, consensus decision-making, and decentralized direct action. In such contexts, people often act together without forming organizations with names, membership lists, or formal leadership structures.

Affinity groups are small clusters of people who trust each other and coordinate actions together, often for a specific campaign or opportunity. They may dissolve and re-form as situations change. Decision-making tends to be **prefigurative**: the forms of organization embody the values of autonomy and mutual aid that participants wish to see generalized.

However, much of the scholarly literature still reverts to organizational language, tracking networks and coalitions as if they were quasi-organizations. Our relational model offers an alternative vocabulary better suited to the actual practices.

### 2.3 State legibility and resistance

James C. Scott’s work on state legibility has shown how modern states seek to render populations, territories, and social practices **legible**: classifiable, countable, and administratively manageable. Family names, cadastral surveys, standardized measures, and formal organizations are all instruments of this process. Legibility is not neutral; it facilitates taxation, conscription, policing, and development.

Scott also emphasized that people often resist legibility, maintaining practices that remain opaque to state categories. These forms of resistance can be subtle—evasions, informal arrangements, tactical ambiguity—or overt.

Non-identitarian insurgency can be understood as a deliberate strategy of illegibility: acting in ways that achieve effects while avoiding incorporation into the state’s schemata of groups and identities.

### 2.4 Relational and processual models of social action

Relational sociology and processual theories of social action have long argued that social phenomena are better understood as networks of relations and unfolding processes than as interactions among fixed entities. Instead of attributing outcomes to the properties of groups or individuals, they focus on how ties, flows, and sequences shape possibilities.

Our model draws on this orientation but pushes it further: we treat interventions themselves as primary and consider actors as at most derivative constructs. The question is not who acts but how acts couple and propagate.

---

## 3. Relational Formalism: Sites, Situations, and Interventions

We now introduce the formal vocabulary on which the rest of the paper is built.

### 3.1 Sites

A **site** is a locus at which interventions may occur. Sites can be physical (a neighborhood, a workplace, a piece of infrastructure), institutional (a meeting, a policy process), or informational (a social media thread, a communication channel). For our purposes, we treat the set of sites as an abstract set S.

We do not impose a fixed topology on S at the outset. Instead, relations among sites will be introduced as needed to represent couplings.

### 3.2 Situations

A **situation** at a site s ∈ S is a structured description of relevant conditions at that site. Let X_s denote the set of possible situations at s. A situation might include, for example:

- material conditions (presence of police, availability of resources),
- discursive conditions (dominant narratives, current framing of events),
- relational conditions (who is present, which ties are active),
- temporal conditions (immediacy, urgency, timing windows).

Formally, we treat the collection of situation spaces as a family {X_s}_s∈S.

A **global configuration** is a function x assigning to each site s a situation x(s) ∈ X_s. Let X denote the set of all such configurations compatible with whatever constraints we impose.

### 3.3 Interventions as local transformations

An **intervention type** at a site s is a partial function

- α: X_s ⇀ X_s

that maps some situations to new situations. For notational convenience, we write α: s when we need to emphasize the site.

The interpretation is: if the current situation at s is x(s) and α is defined on x(s), then performing intervention α at s results in a new situation α(x(s)). If α is not defined on x(s), the intervention is not feasible in that situation.

Intervention types capture the **form** of an action (e.g., blocking a road, distributing leaflets, sabotaging equipment, convening an assembly), abstracting from questions of who performs it.

### 3.4 Locality and coupled interventions

Interventions rarely affect only a single site. Blocking a road at site s may alter the situation at a neighboring site t (diverted traffic, police presence). To model this, we introduce **coupled interventions**.

A **coupled intervention** is a partial function

- A: X ⇀ X

with the following properties:

1. **Finite support**: there exists a finite subset U ⊆ S such that for any configuration x ∈ X where A(x) is defined, A(x)(s) = x(s) for all s ∉ U.
2. **Local dependence**: whether A(x) is defined, and the values of A(x)(s) for s ∈ U, depend only on x|_V for some finite V ⊇ U.

Thus A alters situations only at a finite set of sites but may depend on a finite neighborhood around them.

Any such A can be decomposed into component intervention types at each affected site, but in general we treat it as a single coupled act to capture coordinated multi-site interventions.

### 3.5 Insurgent events

An **insurgent event** is the actual occurrence of a coupled intervention A at some moment, transforming a configuration x into A(x).

Note that this does not require that all component actions be carried out by the same individuals, or even that they be synchronized in a strict temporal sense. The model abstracts away from micro-temporal ordering within the event, focusing on the net effect on situations.

### 3.6 Traces and histories

A **trace** is a finite sequence of insurgent events

- x_0 → x_1 → ⋯ → x_n

where each arrow corresponds to the application of some coupled intervention A_i, with x_{i+1} = A_i(x_i).

A **history** is a trace together with ambient context (e.g., external interventions by state or capital, exogenous events). For present purposes we concentrate on the insurgent component.

---

## 4. Insurgent Configurations and Non-Identitarian Coherence

We can now define what it means for insurgent activity to form a coherent formation without invoking identity or membership.

### 4.1 Families of intervention types

Let A denote a set of admissible coupled interventions. Intuitively, A encodes the repertoire of forms of action available within a given milieu or conjuncture.

We require that A be **locally finite**: for any finite subset U ⊆ S and any finite subset W ⊆ X of configurations, only finitely many A ∈ A have support contained in U and are defined on some x ∈ W. This ensures that at any moment, only finitely many interventions are locally relevant.

### 4.2 Insurgent configurations

An **insurgent configuration** is a pair (x, A_x) where:

- x ∈ X is a global configuration,
- A_x ⊆ A is the subset of interventions that are feasible in configuration x (i.e., A(x) is defined).

We are particularly interested in configurations that exhibit a degree of stability or reproducibility under sequences of insurgent events.

### 4.3 Coherence as compatibility of interventions

Consider a configuration x and a finite sequence of insurgent events starting from x:

- x = x_0 → x_1 → ⋯ → x_n.

Each step corresponds to the application of some A_i ∈ A. We say that a family A is **coherent at x** if, informally, finite sequences of feasible interventions do not interfere destructively with each other beyond certain tolerances.

Formally, fix a configuration x. A is coherent at x if for any two finite sequences of interventions

- (A_1, …, A_m) and (B_1, …, B_k)

that are both feasible at x (i.e., there exist traces starting from x applying them in order), there exists a configuration y and sequences of further interventions (C_1, …, C_r), (D_1, …, D_s) such that:

- starting from the end of the first sequence, applying the C_i yields y,
- starting from the end of the second sequence, applying the D_j yields the same y.

In less formal terms: different locally feasible sequences can be reconciled by further local interventions.

Coherence, so defined, does not require that all paths lead to the same outcome; it requires only that divergences are not irreconcilable in principle.

### 4.4 Non-identitarian coherence

We can now define **non-identitarian coherence** for an insurgent formation.

An insurgent formation on site set S is given by:

- a family of situation spaces {X_s},
- a set of admissible coupled interventions A,
- a family of configurations X′ ⊆ X considered relevant (e.g., those reachable from a given initial condition).

The formation exhibits non-identitarian coherence if:

1. **Coherence at typical configurations**: there exists a large subset X^* ⊆ X′ (e.g., of full measure with respect to some measure on X′, or dense in X′) on which A is coherent.
2. **No privileged subject coordinates coherence**: the coherence conditions can be verified purely in terms of situations and intervention types, without reference to enduring identifiers or roles.

Condition (2) is crucial: we do not allow, for example, that coherence holds only because there exists a central planning site whose situation space encodes the state of a persistent organization making decisions.

In other words, non-identitarian coherence means that the pattern of compatible interventions is a property of the relational field itself, not of an underlying subject.

### 4.5 Example schema: mutual aid constellation

To make the notion more concrete, consider a schematic mutual aid constellation during a disaster.

- Sites are physical neighborhoods and communication channels.
- Situations encode local resource levels, unmet needs, presence of hostile actors, and communication status.
- Interventions include: opening a supply distribution point, sending volunteers to a neighbor site, publishing an information update, or dissolving a hub that has become a target.

A repertoire A can be constructed so that many interventions are compatible: sending volunteers from site s to site t tends to increase the capacity of t to undertake further interventions, while resource-sharing interventions are designed to be locally additive.

Non-identitarian coherence here means that even if no group persists under a name, patterns of mutual aid can propagate and stabilize because interventions have been designed to be mutually supportive and reconcilable across sites.

---

## 5. Legibility, Invisibility, and the State

Non-identitarian insurgency is not merely an internal organizational choice. It is a response to a hostile environment structured by state and capitalist apparatuses of surveillance, legibility, and control.

### 5.1 Legibility as a mapping from configurations to identities

We formalize **legibility** as a mapping

- L: X → Y

where Y is a space of categories and identities recognized by an apparatus (e.g., a state).

Elements of Y might include:

- organization identifiers (names of groups),
- individual identifiers (persons, suspects, leaders),
- roles (organizer, agitator, financier),
- risk scores or threat classifications.

L describes how a given configuration x—patterns of activity, communication, resource flows—is rendered into a legible representation.

The mapping L is itself constructed under constraints of administrative simplification. It typically discards much of the relational and situational detail, retaining only those aspects actionable within bureaucratic routines.

### 5.2 Identity-less formations and the kernel of legibility

An insurgent formation is **identity-less relative to L** if, for configurations x in its typical set X′, the image L(x) does not contain stable identifiers corresponding to the formation as a whole. That is, L may identify incidents, suspect individuals, or local disturbances, but it does not successfully construct a durable category corresponding to the formation.

Formally, suppose Y has a distinguished subset Y_org of organization-level identifiers. The formation is identity-less if for all x ∈ X′, L(x) ∩ Y_org = ∅, or if the identifiers that appear are transient and non-persistent across traces.

In practice, this can be achieved by:

- avoiding names and symbols that can be used to aggregate actions under a label,
- preventing accumulation of stable leadership positions,
- varying sites and forms of intervention to avoid consistent patterns.

### 5.3 Trade-offs between legibility and capacity

Complete invisibility is neither achievable nor necessarily desirable. Interventions often require some degree of visibility to their intended beneficiaries and potential collaborators. The challenge is to calibrate visibility so that useful signals reach appropriate audiences without providing stable handles for adversaries.

Our relational model clarifies this as a problem of **selective coupling**:

- Design interventions so that their effects are legible along channels that support cooperation (e.g., neighbor-to-neighbor networks, trusted media),
- while remaining illegible to channels monitored by adversarial apparatuses.

This may involve:

- maintaining redundancy in communication paths so that no single channel carries enough structure to reconstruct the formation,
- using context-dependent signals intelligible to locals but opaque to distant observers,
- fragmenting traces so that sequences of interventions cannot be easily linked.

### 5.4 Everyday opacity and eventful rupture

From the perspective of legibility, identity-less formations often appear as a mixture of background noise and isolated incidents. Most of the time, configurations x are such that L(x) looks like a pattern of ordinary life, small gestures, or ambiguous events. Occasionally, interventions assemble into more visible ruptures—blockades, occupations, mass mutual aid operations.

The relational model accommodates this by recognizing that X′ includes both low-intensity and high-intensity regions, with different profiles under L. Non-identitarian coherence requires that the mundane and the spectacular be connected at the level of interventions and couplings, even if they do not form a recognizable trajectory of a group.

---

## 6. Failure Modes and Limits

Identity-less insurgent formations are not inherently superior to those with explicit organizations. They have characteristic vulnerabilities and failure modes, which the relational model helps to clarify.

### 6.1 Capture: re-identification through aggregation

One failure mode is **capture**: adversarial apparatuses successfully construct a stable identifier for the formation despite its efforts.

Formally, this corresponds to the emergence of a subset Z ⊆ X′ and an identifier y* ∈ Y_org such that for all x ∈ Z, y* ∈ L(x), and such that Z is large and temporally extended. The formation becomes legible as a group.

Mechanisms of capture include:

- media narratives that retroactively name and frame incidents as part of a movement,
- law enforcement aggregation of disparate incidents under a single label for prosecutorial purposes,
- self-identification by some participants in ways that the mapping L can reuse.

Capture is not merely discursive. Once a name exists, infrastructure for surveillance, prosecution, and repression can be organized around it.

### 6.2 Collapse: incompatible interventions and loss of coherence

Non-identitarian coherence can also fail internally. If the repertoire A is not designed with compatibility in mind, sequences of interventions may interfere destructively.

Examples include:

- resource-depleting actions that undermine the capacity to undertake future interventions,
- conflicting narratives that make it difficult for potential collaborators to interpret situations consistently,
- actions that introduce fear, mistrust, or fatigue in ways that shrink the effective situation spaces X_s.

Formally, coherence fails when A is not coherent at typical configurations: divergent sequences from x cannot be reconciled by further interventions, or reconciliation requires intervention types that are not actually available.

### 6.3 Moralization: reintroduction of identity as purity

Another failure mode is **moralization**, where participants reconstruct identity internally in the form of pure and impure ways of being, even without formal organizations.

This can appear as:

- distinctions between “real” and “fake” militants,
- essentialized categories of who belongs in certain spaces,
- informal but rigid stratification of roles (e.g., permanent facilitators, informal leaders).

In the relational model, moralization narrows situation spaces X_s by declaring certain configurations illegitimate, independent of their relational consequences. Over time, this can produce de facto identities and reintroduce the very structures that identity-less insurgency sought to avoid.

### 6.4 Exhaustion and temporal limits

Identity-less formations can be particularly vulnerable to exhaustion. Because there is no formal organization to accumulate and manage resources, much of the burden of coordination and care rests on informal ties and personal endurance.

Our model captures this by allowing situation spaces X_s to shrink over time as repeated interventions deplete capacities. If the repertoire A does not include interventions that replenish or redistribute capacities, the formation may be structurally unable to sustain itself.

---

## 7. Discussion and Conclusion

### 7.1 Summary of the model

We have proposed a relational model for anarchist insurgency without identity, built on four key notions:

1. **Sites** and **situations** as the basic loci and states of political life.
2. **Interventions** as local transformations of situations, abstracted from actors.
3. **Couplings** as constraints and relations among interventions across sites.
4. **Insurgent configurations** and **non-identitarian coherence** as properties of how interventions fit together and propagate.

Within this framework, insurgent formations are understood not as organizations or groups but as structured ensembles of interventions with characteristic repertoires and patterns of compatibility.

### 7.2 Theoretical implications

This model has several implications for theories of collective action and political agency.

First, it supports a conception of politics in which **patterns precede persons**: instead of starting from self-identical subjects that then act, we start from recurring forms of intervention that condition what kinds of subjectivities can emerge.

Second, it clarifies how **opacity and legibility** operate not simply as states of visibility but as properties of mappings from configurations to categories. Identity-less insurgency exploits gaps and limitations in these mappings.

Third, it reframes debates about organization within anarchism. Rather than positioning formal organizations and identity-less constellations as opposed at the level of principle, we can analyze them as different ways of structuring intervention repertoires and couplings, each with characteristic strengths and vulnerabilities.

### 7.3 Practical considerations

For practitioners, the model suggests several design questions:

- How can intervention repertoires be crafted to maximize coherence without central coordination?
- Which channels of visibility are necessary for cooperation, and how can their use be balanced against the risk of capture?
- What forms of care and regeneration can be encoded as interventions to counter exhaustion?

These questions are not answered by the model, but it provides a vocabulary for posing them sharply.

### 7.4 Directions for further research

Several extensions suggest themselves.

1. **Stochastic dynamics.** Introducing probabilistic elements in the application of interventions and the evolution of situations could allow analysis of typical trajectories and resilience under uncertainty.
2. **Game-theoretic adversaries.** Modeling legibility mappings and repressive responses explicitly as strategic actors could clarify conditions under which identity-less formations can survive or grow.
3. **Empirical instantiation.** Applying the model to concrete historical or contemporary cases—disaster mutual aid networks, anti-police uprisings, or pipeline resistance campaigns—could refine its concepts and test its descriptive adequacy.
4. **Subjectivity and experience.** While the model brackets questions of individual experience, it may be possible to extend it to account for how subjectivities are produced within non-identitarian formations without collapsing back into identity-centered analysis.

### 7.5 Conclusion

Anarchist insurgency without identity is neither a romanticized ideal nor a pathological failure to organize. It is a distinct mode of political action, emerging from specific diagnoses of power and capture, and embodying particular commitments to autonomy, opacity, and mutual aid.

By modeling such formations in relational terms, we have shown that coherence of action does not require the persistence of persons or organizations. Patterns of intervention can stabilize, propagate, and adapt through their couplings alone. The challenge, for both theorists and practitioners, is to understand and shape these patterns in ways that preserve their emancipatory potentials while navigating the hostile terrains of legibility, repression, and exhaustion.

---

## References

*This is a selective and illustrative bibliography rather than a comprehensive survey.*

- Graeber, D. (2009). *Direct Action: An Ethnography*. AK Press.
- Scott, J. C. (1998). *Seeing Like a State: How Certain Schemes to Improve the Human Condition Have Failed*. Yale University Press.
- Scott, J. C. (1990). *Domination and the Arts of Resistance: Hidden Transcripts*. Yale University Press.
- The Invisible Committee. (2009). *The Coming Insurrection*. Semiotext(e).
- Various authors. Essays and pamphlets in contemporary anarchist and insurrectionary theory, including discussions of anonymity, affinity, and anti-identitarian practice, as collected in venues such as the Anarchist Library and related archives.

