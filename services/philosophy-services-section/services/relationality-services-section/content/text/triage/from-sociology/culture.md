---
id: culture
description: "A Culture is a triple (C, J, φ) — a community C, a background topology J on C's practice/history category (a Grothendieck topology determining what counts as culturally recognized covering), and a transmission functor φ that reproduces J across agents and generations. The defining structure: culture is pre-thematic (J operates as condition of intelligibility, not as an explicit norm), un-authored (no installation act, no charter, no authoring agent), transmitted through practice (φ is constituted by the aggregate of cultural acts, not by decree), and coherent (J satisfies the Grothendieck topology axioms — what the culture recognizes is stable under combination and transitivity). Formally: a Grothendieck topology on the history category that serves as the background site structure within which all vessels, charters, norms, and institutional acts operate and acquire cultural force."
defines: Culture
related: NormativeSystem, Charter, Norm, Institution, Vessel, Person, Community, Grounding
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  community: person
  background-topology: relational-history-site
  transmission: natural-transformation
output: relational-history-site
ast:
  site:
    - background-topology:
        - community
    - transmission:
        - background-topology
        - community
---

# Culture

## Formal definition

A **Culture** is a triple $\mathfrak{C} = (C, J, \varphi)$:

$$\mathfrak{C} = (C : \mathrm{Community},\; J : \mathrm{GTop}(T_C),\; \varphi : C \times T_C \to \mathrm{Sieve}(T_C))$$

where:
- $C$ is the **community** — the set (or category) of agents who operate under this culture; the community is not defined independently of the culture but is the community-of-those-who-share-$J$; no prior community boundary is needed
- $J$ is the **background topology** — a Grothendieck topology on the practice/history category $T_C$; $J$ assigns to each history $t \in T_C$ a collection $J(t)$ of sieves (covering families) that are recognized as sufficient within the culture; $J$ determines what counts as "enough evidence" or "recognized completion" within $\mathfrak{C}$
- $\varphi$ is the **transmission functor** — the mechanism by which $J$ is reproduced across agents and generations; $\varphi(a, t)$ is agent $a$'s culturally acquired sensitivity to the covering families at $t$; $\varphi$ is constituted by the aggregate of cultural acts (teaching, imitation, correction, example), not by any single authorizing decree

**Four invariants.** $\mathfrak{C}$ is a culture iff:

1. **Background character**: $J$ is pre-thematic — it operates as a condition on all normative acts within $C$ without being itself a normative act that members explicitly endorse. Agents in $\mathfrak{C}$ do not typically hold $J$ as a belief, formulate it as a rule, or consciously apply it; they act from within $J$. The background is what makes intelligible action possible, not what intelligent action is about.

2. **Non-authorship**: $J$ has no installation act and no authoring agent. Unlike a [Charter](../../../../../../../social-science-services-section/services/sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/charter.md) (which has an authorizing act $A$ and a constituting moment), culture has no moment of origination and no author. $J$ is constituted through practice — through the aggregate of culturally shaped acts across $C \times T_C$ — and not through any act of decree. A culture may be *reformed* (by deliberate normative campaigns) or *transmitted* (by education), but it is not *created* by any single act.

3. **Grothendieck coherence**: $J$ satisfies the three Grothendieck topology axioms over $T_C$:
   - **Maximality**: the maximal sieve $\{f : \mathrm{cod}(f) = t\}$ is in $J(t)$ for every $t$ — the culture always recognizes identity-level coverage
   - **Stability**: if $S \in J(t)$ and $f : t' \to t$, then $f^*(S) \in J(t')$ — cultural recognition is stable under restriction to sub-contexts
   - **Transitivity**: if $S \in J(t)$ and for each $f : t' \to t \in S$ there is $R_f \in J(t')$ with $R_f \subseteq f^*(S')$, then $S' \in J(t)$ — cultural covering is transitive; what covers a cover covers

   These axioms are not optional: they are what makes $J$ a coherent recognition structure rather than an arbitrary collection of preferences.

4. **Transmission persistence**: the transmission functor $\varphi$ ensures that $J$ is reproduced across membership change. When agent $a$ departs from $C$ and $a'$ arrives, $\varphi(a', \cdot)$ reproduces the same topology $J$ that $\varphi(a, \cdot)$ embodies (up to natural transformation). Culture is what persists through individual death and replacement — the topology $J$ is the invariant, not the particular agents carrying it.

## Tylor, Geertz, Bourdieu: three frameworks

### Edward Tylor: culture as acquired complex whole

Edward Tylor, *Primitive Culture*, Vol. I, John Murray, London, 1871, p. 1:

> "Culture or Civilization, taken in its wide ethnographic sense, is that complex whole which includes knowledge, belief, art, morals, law, custom, and any other capabilities and habits acquired by man as a member of society."

Tylor's definition establishes three structural facts that every subsequent theory must account for:
- Culture is a **complex whole** — a coherent integration, not a list of separate items; the items cohere into a recognizable pattern
- Culture is **acquired** — not genetic; transmitted through membership in society; the subject of enculturation
- Culture is **capabilities and habits** — dispositional, not merely propositional; culture is not a set of beliefs one holds but a set of capacities one exercises

In the formal framework: "complex whole" = the coherence of $J$ as a Grothendieck topology; "acquired" = transmitted via $\varphi$; "capabilities and habits" = dispositions embodied in agents via $\varphi(a, \cdot)$.

### Clifford Geertz: culture as semiotic context

Clifford Geertz, "Thick Description: Toward an Interpretive Theory of Culture," in *The Interpretation of Cultures: Selected Essays*, Basic Books, New York, 1973, ch. 1, pp. 3–30:

> "Believing, with Max Weber, that man is an animal suspended in webs of significance he himself has spun, I take culture to be those webs, and the analysis of it to be therefore not an experimental science in search of law but an interpretive one in search of meaning."

Geertz's contribution: culture is **semiotic context**, not causal variable. You cannot explain why a particular wink means what it means by listing its physical properties (rapid contraction of eyelid) — you need the cultural context that makes it a wink (a conspiratorial signal) rather than a twitch (a muscle spasm). The "thick description" that captures the wink's meaning is the description that locates it within the web of significance — the topology of recognitions — that the culture provides.

In the formal framework: the "webs of significance" = the topology $J$ together with the presheaf $H : T_C^{\mathrm{op}} \to \mathbf{HA}_{\mathrm{nucl}}$ over which $J$ operates; "thick description" = a section of $H$ that specifies at every history $t$ the locally $J$-recognized meaning of an act; "thin description" = a section that is not $J$-locally recognized, hence not a sheaf section (fails descent).

Geertz contrasts "thick" and "thin" description: a thin description gives the physical facts ($\beta$-movement of the eyelid); a thick description embeds the act in the cultural topology that makes it mean something. In the site-theoretic reading: thin description gives a global section of a discrete presheaf; thick description gives a section of the sheafification of that presheaf with respect to $J$ — the section that satisfies $J$-descent and is therefore recognized as carrying meaning within $\mathfrak{C}$.

### Pierre Bourdieu: habitus as embodied topology

Pierre Bourdieu, *Outline of a Theory of Practice*, Cambridge UP, 1977; *The Logic of Practice*, Stanford UP, 1990:

The **habitus** is Bourdieu's account of how culture is transmitted and embodied. It is:

> "systems of durable, transposable dispositions, structured structures predisposed to function as structuring structures, that is, as principles which generate and organize practices and representations that can be objectively adapted to their outcomes without presupposing a conscious aiming at ends or an express mastery of the operations necessary in order to attain them." (*Logic of Practice*, p. 53)

Key formal features:
- **Durable**: the habitus is acquired through prolonged practice and is resistant to explicit revision; it is not a belief one can just change by deciding to
- **Transposable**: the same dispositions operate across different fields; the habitus acquired in one context is applied in others
- **Structured structures predisposed to function as structuring structures**: the habitus is itself produced by social conditions (structured) and in turn produces new practices (structuring); it is both effect and cause

In the formal framework: the habitus of agent $a$ at history $t$ is $\varphi(a, t) \in J(t)$ — a $J$-covering family internalized by $a$ as a sensitivity. To have the habitus is to be sensitive to the covering families in $J$: to recognize as "normal," "natural," or "obvious" exactly the acts and states that $J$ recognizes as covering. The "feel for the game" (*sens du jeu*) is the ability to act in accordance with $J$ without needing to consult an explicit rule.

Bourdieu's **field** (*champ*) is a sub-community $C' \subseteq C$ with its own internal topology $J' \supseteq J$ (a refinement of the background topology — more specific recognition criteria). The academic field, the artistic field, the economic field each refine the background cultural topology with field-specific covering norms. Habitus in a field is sensitivity to $J'$; general cultural habitus is sensitivity to the background $J$.

## Wittgenstein: forms of life and rule-following

Ludwig Wittgenstein, *Philosophical Investigations*, Blackwell, 1953 (§§1–693); *On Certainty*, Blackwell, 1969:

Wittgenstein's concept of a **form of life** (*Lebensform*) is his account of the background within which language games operate. The form of life is not itself a rule or a set of rules; it is the pre-reflective practice-background that makes rule-following intelligible:

> "What has to be accepted, the given, is — so one could say — forms of life." (*Philosophical Investigations*, p. 226)

> "To obey a rule, to make a report, to give an order, to play a game of chess, are customs (uses, institutions)." (*Philosophical Investigations*, §199)

The rule-following considerations (§§138–242) establish that no rule determines its own application — every rule requires a practice-background to be applied correctly. What ensures that "adding 2" yields 1004 after 1002 (not 1000) is not a further rule but the shared practice of arithmetic within a community. The form of life is what makes the practice recognizable as the same practice across all applications.

In the formal framework: the form of life is the topology $J$ viewed from the perspective of rule-following. What $J$-covering means is: "what the community recognizes as sufficient evidence for the rule to have been followed correctly." The shared practice is the shared topology; the form of life is the cultural topology that makes practice-assessment possible.

*On Certainty* (§§1–676) develops this further: hinge propositions ("The Earth exists") are not verified; they are the framework within which verification operates. In the formal reading: hinge propositions are the maximal sieve — the $J$-covering family that is always in $J(t)$ regardless of any specific act. They are the invariant background of the topology, never themselves at issue.

## Searle's Background

John Searle, *Intentionality: An Essay in the Philosophy of Mind*, Cambridge UP, 1983, ch. 5; *The Construction of Social Reality*, Free Press, 1995, ch. 7:

Searle distinguishes **intentional states** (beliefs, desires, intentions — which have propositional content and conditions of satisfaction) from the **Background** — the set of non-intentional mental capacities, practices, and skills that enable intentional states to function:

> "The Background is a set of pre-intentional capacities that enable intentional states to function... The Background is not itself a set of further intentional states." (*Intentionality*, p. 143)

Searle distinguishes:
- **Deep Background**: universal features of human cognition and bodily engagement (the capacity to deal with objects, to recognize gravity, to parse space)
- **Local Background**: culturally specific practices and capacities (knowing how to handle money, how to interact with authority figures, what counts as polite behavior in a specific context)

The Local Background is the culture's contribution to individual competence. It is not propositional knowledge — it is not a set of beliefs that "in this culture one does X" — but a set of practical capacities that have been acquired through enculturation. The agent does not typically know they have the Local Background; they simply find certain actions natural, obvious, or inconceivable.

In the formal framework: the Local Background is the $\varphi$-image — the covering families $\varphi(a, t)$ that agent $a$ has internalized at history $t$. An agent with the culture's Local Background is an agent whose $\varphi(a, \cdot)$ is aligned with $J$: what the agent finds natural are the $J$-covered acts; what the agent finds inconceivable are the $J$-uncovered acts.

## Culture as site topology

In the relational universe, the culture $\mathfrak{C} = (C, J, \varphi)$ operates as the **site topology** of the ambient relational universe $(T_C, J)$. Every vessel, charter, norm, and institutional entity within $\mathfrak{C}$ is constituted over this site.

The formal consequences:

**Cultural settlement**: a proposition $\phi \in H_t$ is *culturally settled* iff $\phi$ is $J$-locally recognized — iff there is a $J$-covering sieve $S \in J(t)$ such that for all $f : t' \to t$ in $S$, $H(f)(\phi) \in H_{t'}^*$ (is locally settled in the fiber above $t'$). Cultural settlement is sheaf-descent: $\phi$ is culturally settled iff it satisfies $J$-descent.

**Cultural force**: a norm $N$ has cultural force within $\mathfrak{C}$ iff $N$'s propositional content satisfies $J$-descent — iff the norm is recognizable as valid from within the culture's background topology. A norm imposed from outside that fails $J$-descent has no cultural force; it may have coercive force (backed by sanction) but not the pre-thematic endorsement that comes from being culturally intelligible.

**Cross-cultural contact**: two cultures $\mathfrak{C}_A = (C_A, J_A, \varphi_A)$ and $\mathfrak{C}_B = (C_B, J_B, \varphi_B)$ are in contact when there is a site morphism $\mu : (T_{C_A}, J_A) \to (T_{C_B}, J_B)$ — a functor $\mu$ on history categories that is **continuous**: $J_A$-covering families map to $J_B$-covering families. If $\mu$ is continuous, then $J_A$-settled propositions are $J_B$-settled after translation; the cultures share a recognized common ground. Where $\mu$ fails continuity — where a covering family in $J_A$ does not map to a $J_B$-covering family — cultural intelligibility fails: what counts as sufficient evidence in $\mathfrak{C}_A$ is not recognized in $\mathfrak{C}_B$.

**Cultural universals**: the intersection $\bigcap_{\mathfrak{C}} J_\mathfrak{C}$ of all cultural topologies is the topology of culturally universal covering — what every culture recognizes. This is the topology underlying what anthropologists call "cultural universals" (Brown, *Human Universals*, Temple UP, 1991): mourning practices, kin terms, prohibitions on in-group killing, gift exchange, narrative. In the formal framework: a covering family is a universal iff it is in every cultural topology.

**Cultural change**: a culture changes when its topology refines or coarsens. A **cultural refinement** $J \hookrightarrow J'$ (where $J' \supseteq J$) adds new covering families — the culture becomes more fine-grained in what it recognizes. A **cultural coarsening** $J' \twoheadrightarrow J$ (where $J' \subseteq J$) removes covering families — the culture loses distinctions (simplification, homogenization). Cultural revolution is a non-continuous topology change — a shift where the new topology $J'$ is not a refinement of $J$ but a replacement, breaking the continuity of cultural descent.

## Culture vs. norm, charter, institution

| Dimension | Culture | Norm | Charter | Institution |
|---|---|---|---|---|
| Origin | Un-authored; constituted by practice | Authored or customary; ascribed to a bearer | Authored; has an authorizing act $A$ | Authored; has a constituting act |
| Mode | Background topology $J$ | Explicit deontic proposition $\phi$ | Constitutive rule-system | Constitutive + regulative rules |
| Operator | Pre-thematic; not explicitly endorsed | Endorsed or recognized as valid | Authoritative; formally binding | Formally binding within scope |
| Bearer | The community $C$; no individual bearer | A specific normative subject | The constituted community $G$ | The institution's officers |
| Change mechanism | Cultural drift, reformation, contact | Norm revision, repeal | Amendment (site morphism) | Institutional reform |
| Persistence | Through individual death; transmission $\varphi$ | Through normative system validity | Through community identity preservation | Through institutional continuity |
| Math type | Grothendieck topology $J$ on $T_C$ | Proposition in $H_t$ with deontic operator | Site $(T, J)$ with normative sheaf | Multi-level site structure |

The key asymmetry: culture is the condition within which norms, charters, and institutions acquire force. A norm stated in a culturally unintelligible form (violating $J$-descent) has no cultural force even if it has formal validity. A charter that lacks cultural recognition (whose $J$-covering structure is absent from $\mathfrak{C}$) cannot mobilize the practices that make institutional action possible.

## The relational universe mapping

| Culture component | Relational universe |
|---|---|
| $T_C$ (practice/history category) | The base category of the ambient relational universe |
| $J$ (background topology) | The Grothendieck topology on $T_C$ — the site structure |
| $(T_C, J)$ (site) | The site of the ambient relational universe |
| $\mathrm{Sh}(T_C, J)$ (sheaf topos) | The full ambient relational universe — the "world" that the culture constitutes |
| $\varphi(a, t)$ (habitus at $t$) | Agent $a$'s sensitivity to $J(t)$ — the covering families internalized as disposition |
| $J$-descent | Cultural settlement — a proposition is culturally recognized iff it satisfies descent |
| Site morphism $(T_A, J_A) \to (T_B, J_B)$ | Cross-cultural contact or translation |
| Sheafification $\mathrm{sh}_J(\mathcal{F})$ | The culturally recognized version of a pre-sheaf $\mathcal{F}$ — the cultural interpretation of a practice |

## Open questions

- Whether the Grothendieck topology $J$ of a culture is uniquely determined by the community $C$'s aggregate practice, or whether multiple distinct topologies $J, J'$ could be compatible with the same observable practice (underdetermination of cultural topology by behavioral evidence). This is the formal version of the ethnographic interpretation problem.
- Whether the transmission functor $\varphi$ has a fixed-point characterization: whether the culture is in a stable reproduction equilibrium iff $\varphi$ is the identity natural transformation on the topology $J$ — the topology exactly reproduces itself in the next generation without drift.
- Whether Bourdieu's field structure (sub-communities with topology refinements $J' \supseteq J$) forms a lattice of subtopologies, and whether the lattice of fields within a culture has the same structure as the lattice of nuclei on the ambient Heyting algebra — whether field membership is the cultural-topological analog of nuclear projection.
- Whether cultural contact (site morphism $\mu : (T_A, J_A) \to (T_B, J_B)$) that is fully faithful on the site structure produces cultural assimilation, partial contact produces syncretic hybridization (where $J_A \cap J_B$ is the hybrid topology), and no common coverings produces cultural incommensurability — and whether Kuhn's incommensurability of paradigms in science is the academic-field instance of this general structure.
- Whether there is a notion of **cultural sheaf** — a presheaf over the culture's site that satisfies $J$-descent and can be evaluated for cultural truth — and whether the propositions of the normative system $N$ that bear cultural force are exactly the $J$-sheaf sections of the cultural presheaf (making cultural force = sheaf membership in the cultural topos).
