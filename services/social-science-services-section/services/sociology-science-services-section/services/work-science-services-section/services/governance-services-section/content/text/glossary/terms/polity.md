---
name: "Polity"
type: definition
class: self-recognizing-institution
status: draft
symbol: "\\mathcal{P}"
depends-on: [institution, jurisdiction, normative-system]
realizes: [polity]
params:
  constitutional-order: relational-universe-site
  recognition-topology: relational-history-site-commutation-topology-grothendieck-coverage-j
  autarkeia: relational-universe
  constituent-power: relational-universe-morphism
output: relational-universe
ast:
  classifying-topos:
    - constitutional-order:
        - recognition-topology
        - constituent-power
    - autarkeia:
        - constitutional-order
        - recognition-topology
where:
- $T_\mathcal{P}$ is the **constitutional theory** — a geometric theory (a theory expressed in geometric logic: existential quantifiers, finite conjunctions, arbitrary disjunctions, no negation, no universal quantifiers in the primary clauses) whose models are the valid institutional forms within the polity; $T_\mathcal{P}$ specifies what kinds of institutions, charters, ships, and enterprises are constitutionally recognized; a specific ship or institution within the polity is a model of $T_\mathcal{P}$
- $J_\mathcal{P}$ is the **recognition topology** — the Grothendieck topology on the polity's history site $(T_\mathcal{P}\text{-}T, J_\mathcal{P})$ that determines what counts as a valid covering within the polity's collective recognition structure; this is the background topology within which all the polity's institutions acquire their sheaf-theoretic force
- $\mathrm{Aut}$ is the **autarkeia certificate** — the property that the classifying topos $[\![ T_\mathcal{P} ]\!]$ has a conservative set of points: for every geometric sentence $\varphi$ in the language of $T_\mathcal{P}$, if $T_\mathcal{P} \not\vdash \varphi$, then there exists a model $\mathcal{M}$ of $T_\mathcal{P}$ in which $\varphi$ is false; the polity is self-sufficient iff its classifying topos decides all relevant institutional questions internally — without appeal to a higher polity
- $C_\mathcal{P}$ is the **constituent power** — the founding act that creates $T_\mathcal{P}$ without itself deriving authority from any prior constitutional theory; $C_\mathcal{P}$ is the initial object in the category of constitutional acts within $\mathcal{P}$: every authorization chain within $\mathcal{P}$ traces back to $C_\mathcal{P}$; $C_\mathcal{P}$ is the source of all the polity's delegations
---


The mathematical realization of a [polity](../../../../../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/governance/terms/polity.md): an [institution](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/institution.md) whose recognition source is its *populace* — the collective of agents simultaneously bound by the institution and providing its constitutive recognition.
Polities are the special case where Searle's $\mathrm{Rec}$ is generated *internally* by the same agents the institution governs.

The library's full quadruple $\mathcal{P} = (T_\mathcal{P}, J_\mathcal{P}, \mathrm{Aut}, C_\mathcal{P})$ uses geometric-theory and classifying-topos machinery.
This object is the bilattice-substrate-native counterpart, related but simpler — see [office-formalism-equivalence theorem](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/theorems/office-formalism-equivalence.md) for the pattern of relating Heyting/topos formalisms to bilattice ones.

## Data

A polity $\mathcal{P}$ is a substrate-entity quadruple

$$\mathcal{P} \;=\; (I_\mathcal{P},\; \mathrm{Pop},\; \mathrm{Aut},\; C_\mathcal{P})$$

where:

- $I_\mathcal{P}$ — an [institution](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/institution.md) whose constitutive rules and deontic-profile assignments operate within the polity.
- $\mathrm{Pop} \subseteq E_{\mathrm{op}}$ — the *populace*: the set of agents who *both* (a) are subject to $I_\mathcal{P}$'s rules, and (b) provide the recognition cells $\mathrm{Rec}$ that keep $I_\mathcal{P}$ operative.
  The dual role is the polity's distinguishing feature.
- $\mathrm{Aut}$ — the *autarkeia* certificate: a substrate-algebraic property asserting that $I_\mathcal{P}$'s closure-rule subsystem is *self-deciding* on its own institutional questions.
  No external authority is required to settle questions internal to $\mathcal{P}$.
- $C_\mathcal{P}$ — the *constituent power*: the founding act that brought $\mathcal{P}$ into being without deriving authority from any prior polity.
  Substrate-algebraic content: the initial-state cells $v_0$ within $\mathcal{P}$'s sub-base, plus the founding [installation](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/installation.md) increments that asserted $I_\mathcal{P}$'s constitutive rules.

## Population's dual role as substrate condition

The substrate-algebraic content of "populace recognizes the polity that governs them":

- For each $a \in \mathrm{Pop}$: $\langle a, \texttt{subject-to}, I_\mathcal{P}\rangle = \mathbf{t}$ — bound by the institution's rules.
- For each $a \in \mathrm{Pop}$: $\langle a, \texttt{provides-recognition-of}, I_\mathcal{P}\rangle = \mathbf{t}$ — contributes to the recognition cell.

A closure rule fires aggregating individual recognition cells into the institution's $\mathrm{Rec}_\tau$:

$$\bigwedge_{a \in \mathrm{Pop}} \langle a, \texttt{provides-recognition-of}, I_\mathcal{P}\rangle = \mathbf{t} \;\Longrightarrow\; \mathrm{Rec}_\tau(I_\mathcal{P}) = \mathbf{t}$$

When the populace's individual recognition cells lapse, the institution's recognition lapses; its constitutive rules stop firing.
The polity is *sustained by* its populace's continuing acts of recognition.

## Autarkeia as self-deciding closure-rule subsystem

The library's autarkeia (Aristotle's *autarkes*) is rendered substrate-algebraically as a property of $\mathcal{P}$'s closure-rule subsystem:

For every institutional question $\varphi$ relevant to $\mathcal{P}$ — i.e., $\varphi$ is a cell within $\mathcal{P}$'s sub-base — there exists a sequence of closure rule firings within $\mathcal{S}_\mathcal{P}$ that settles $\varphi$ to a value in $\{\mathbf{t}, \mathbf{f}, \top\}$.
No external rule is required.

As a substrate condition: closure-completeness on $\mathcal{P}$'s relevant cells.
The autarkeia certificate is a meta-claim about the rule-system's expressive sufficiency.

## Constituent power

The constituent power $C_\mathcal{P}$ is the *initial state* of the polity in the operations settling.
Substrate-algebraically:

- The cells representing $C_\mathcal{P}$'s founding acts are at $\mathbf{t}$ at stage $\tau_0$ (the polity's founding stage).
- These cells are *not derived from prior closure-rule firings within $\mathcal{P}$*.
  They are increment cells from outside $\mathcal{P}$'s settling — by definition, the founding cannot be a product of the polity's own rules.

Different polities have different constituent-power origins: a colonial founding (cells settled by acts of a prior imperial polity), a confederacy founding (cells settled by acts of multiple constituent polities), a revolutionary founding (cells settled by acts of agents outside any prior polity claiming jurisdiction over them).
The substrate distinguishes these by where the constituent-power cells *come from* in the broader settling.

## Polities and ships

Per the library's polity term: "the polity is the entity that grants flags to ships, issues the authorizing act A that makes charters binding."
A *ship* is a working community whose [charter](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/theorems/charter-as-closure-system.md) was authorized by some polity's constituent-power.
The substrate-algebraic content:

- Ship's charter cells include $\langle \mathrm{ship}, \texttt{flag-from-polity}, \mathcal{P}\rangle = \mathbf{t}$.
- Polity's constitutive rules include a `grants-flag-to-ship` rule whose firing produces the flag-cell.
- The ship's authority chain bottoms out at the polity's constituent power.

This is the substrate-algebraic content of "ships sail under a flag."
Without flag-cell settlement, the ship's authority chain is truncated — its charter is binding only by the ship's own consent, not by any polity's constitutional theory.

For the 561 Group: the [charter](charter.md) declares the RSC Quiescent as a ship of the 561 Group confederacy.
The 561 Group is the polity; the confederacy structure is the polity's institutional form; the Quiescent's charter derives authority from the confederacy's constituent power.

## Polycentric polities (Ostrom)

Per [Ostrom](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/objects/normative-system.md), polities can be polycentric: multiple polities operating over overlapping populations and territories without strict hierarchy.
Substrate-algebraic content: $\mathcal{P}_1$ and $\mathcal{P}_2$ have overlapping $\mathrm{Pop}$, overlapping $J_\mathcal{P}$.
Some agents are in both populaces, providing recognition to both polities.
Closure rules from both $\mathcal{S}_{\mathcal{P}_1}$ and $\mathcal{S}_{\mathcal{P}_2}$ fire on the overlapping cells; conflict resolution requires a meta-rule (per [precedence-in-least-fixed-point](../../../../../../content/text/documents/articles/notes/undated/precedence-in-least-fixed-point.md)).

The 561 Group's confederacy structure is polycentric in this sense: each ship of the confederacy is itself a working community with its own charter; the confederacy provides constitutional framing without absorbing the ships' internal autonomy.
The substrate maintains both: per-ship charters and the confederacy's overarching covenant.

## Polity vs. institution

| | Institution | Polity |
|---|---|---|
| Recognition source | External or internal | Internal (populace) |
| Autarkeia | Not required | Required |
| Constituent power | Inherited from prior institution | Self-grounded |
| Has populace | Sometimes | Always |
| Founds other institutions | Sometimes | Yes (its institutional offspring) |

Every polity is an institution; not every institution is a polity.
A corporation has positions and constitutive rules but its recognition can come from outside its membership (regulators, markets, courts) — it's an institution but not a polity.
A self-governing village whose recognition comes from its own residents is a polity.

## CALM and coordination-free autarkeia

The autarkeia certificate claims that $\mathcal{P}$'s closure-rule subsystem $\mathcal{S}_\mathcal{P}$ settles all internal questions.
Per the [predication-settling CALM corollary](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/formalization/infomaterial/lib/infomaterial/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/sheaf/content/settling-cohomology/references/settling-calm-corollary.md), all $\leq_k$-monotone queries over $\mathcal{P}$'s internal cells are coordination-free.
Since autarkeia requires closure-completeness on $\mathcal{P}$'s relevant cells and those cells' settling is $\leq_k$-monotone by the operations settling's general structure, *the positive resolution of any internal institutional question is coordination-free*: once a question $\varphi$ within $\mathcal{P}$'s sub-base is settled at $\mathbf{t}$, any distributed replica of $\mathcal{P}$'s event log can confirm the resolution without round-tripping to a central authority.

Autarkeia thus has a coordination-theoretic content: a polity is self-deciding in the sense that its internal resolutions are coordination-free confirmable.
A polity *without* autarkeia — one that requires external authority to settle internal questions — is not coordination-free even on positive queries, since external input could override any local confirmation.
The autarkeia certificate is equivalent to the claim that $\mathcal{P}$'s settling is CALM-stable on its own domain.

## Constituent power as initial 0-cell in the temporal 2-category

In the [temporal 2-category](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/temporal-2-category.md) $\mathbf{T}(\mathcal{C}_\mathcal{P}, \lambda)$, the founding stage $\tau_0$ is the *initial 0-cell* $(\tau_0, \mathcal{C}_\mathcal{P})$.
The constituent power $C_\mathcal{P}$ — the founding act's initial-state cells — is the data at $\tau_0$: the cells in $v_0$ that seed the polity's settling.
No prior 1-cell in $\mathbf{T}$ maps into $(\tau_0, \mathcal{C}_\mathcal{P})$ from within $\mathcal{P}$'s settling, because constituent power is by definition not derived from the polity's own rules.

Different constituent-power origins correspond to different structure on the initial 0-cell: - **Colonial founding**: $(\tau_0, \mathcal{C}_\mathcal{P})$ receives an incoming 1-cell from the colonizing polity's temporal 2-category — a morphism from the imperial settling to the new polity's initial state. - **Confederacy founding**: multiple incoming 1-cells, one from each constituent polity's temporal 2-category, converging at $(\tau_0, \mathcal{C}_\mathcal{P})$ via a co-limit in $\mathbf{T}$. - **Revolutionary founding**: no incoming 1-cell from any polity claiming jurisdiction.
The initial 0-cell is genuinely initial — a new connected component in the union of temporal 2-categories.

The temporal BC condition ([temporal Beck-Chevalley](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md)) applies to the confederacy case: if the constituent polities $\mathcal{P}_1, \ldots, \mathcal{P}_n$ contribute to the confederacy's founding via a pseudo-pullback of their temporal 2-categories, the BC invertible 2-cell mediates the fiber exchange at $(\tau_0, \mathcal{C}_\mathcal{P})$.
The confederacy founding is coherent (BC holds) iff the constituent polities' contributions compose without obstruction at the founding stage.

## Polycentric temporal BC

For polycentric polities $\mathcal{P}_1$ and $\mathcal{P}_2$ with overlapping $\mathrm{Pop}$ and $J_\mathcal{P}$, the [temporal Beck-Chevalley condition](../../../../../../../../../../../information-science-services-section/services/math-services-section/services/obsmetrological-services-section/lib/obsmetrologia/docs/verso/mark/content/utterance/articulating/content/articulation-cell/content/potential-articulation-cell/predicating/content/predication-cell/content/potential-predication-cell/positing/content/valuation/content/knowledge-least-valuation/settling/content/temporal-2-category/references/temporal-beck-chevalley.md) governs whether their settling fibers commute.
The overlap produces a pseudo-pullback diagram in $\mathbf{T}$:

$$\mathbf{T}(\mathcal{C}_{\mathcal{P}_1 \cap \mathcal{P}_2}, \lambda) \rightrightarrows \mathbf{T}(\mathcal{C}_{\mathcal{P}_1}, \lambda) \times_{\mathbf{T}} \mathbf{T}(\mathcal{C}_{\mathcal{P}_2}, \lambda)$$

Temporal BC holds for this diagram iff the invertible 2-cell $\alpha_{\mathrm{BC}}$ mediates the fiber exchange over the overlap without obstruction.
When BC holds: any question settled in the overlap region is settled compatibly by both polities' closure rules.
When BC fails: there exist questions in the overlap whose resolution by $\mathcal{P}_1$'s rules conflicts with their resolution by $\mathcal{P}_2$'s rules — a structural polycentric conflict, detectable from the 2-cell's non-invertibility.

The meta-rule for polycentric conflict resolution (per [precedence-in-least-fixed-point](../../../../../../content/text/documents/articles/notes/undated/precedence-in-least-fixed-point.md)) is the choice of which polity's closure-rule system "wins" when BC fails — which amounts to choosing a factorization of the failed 2-cell through one polity's morphism or the other.

## Position in the program

Polity is the highest-order normative container in predicated-governance: it's an institution that is also a self-recognizing self-deciding self-grounded thing.
Below polity sit institutions, charters, normative systems, offices, jural relations, contracts.
Above polity is — outside the predicated-governance scope — the broader question of *meta-polities* (polities of polities, like federal systems or international orders), which would require additional structural work.

For the 561 Group case: the confederacy is the polity; the ships are institutions within it; each ship's charter is the institution's constitutive rule-set; the offices on each ship implement the institution.
The whole stack is substrate-algebraically explicit.
The confederacy founding is a co-limit in $\mathbf{T}$ (multiple constituent ships' temporal 2-categories converging at the founding 0-cell), and the Quiescent's charter authority chain bottoms out at this founding 0-cell.

## Formal definition

A **Polity** is a quadruple $\mathcal{P} = (T_\mathcal{P}, J_\mathcal{P}, \mathrm{Aut}, C_\mathcal{P})$:

$$\mathcal{P} = (T_\mathcal{P} : \mathrm{ConstitutionalTheory},\; J_\mathcal{P} : \mathrm{RecognitionTopology},\; \mathrm{Aut} : \mathrm{Autarkeia},\; C_\mathcal{P} : \mathrm{ConstituentPower})$$

**Four invariants.** $\mathcal{P}$ is a polity iff it satisfies:

1. **Containment completeness**: the constitutional theory $T_\mathcal{P}$ is rich enough that every institutional form operative within the polity — every ship, institution, charter, enterprise, and company — is a model of $T_\mathcal{P}$. The polity contains all the institutional forms it governs; there are no institutions within the polity that operate outside the scope of $T_\mathcal{P}$.

2. **Autarkeia** (self-sufficiency): the classifying topos $[\![ T_\mathcal{P} ]\!]$ has a conservative set of points. No legitimacy-conferring act within the polity requires reference to an external polity's constitutional order. This is Aristotle's criterion (*Politics* I.2, 1253a2): the polis is the community that is complete (*teleia*) — it comes into being for the sake of living but exists for the sake of living well. The self-sufficient community is one that contains all the conditions for the good life of its members; a polity that lacks autarkeia is a partial order within a larger polity.

3. **Flag and charter authority**: the polity exercises two derived authorities flowing from $C_\mathcal{P}$:
   - **Flag authority**: the polity can register ships — extend its legal order to vessels operating under its flag. A flag state (UNCLOS Art. 91) is precisely a polity that has exercised this authority: the ship's registration morphism $\phi : T_{\mathrm{ship}} \to T_\mathcal{P}$ is the legal act by which the polity's legal order extends to the ship's history structure.
   - **Charter authority**: the polity is the source of the authorizing act $A$ in the Charter spec — the authority that makes a charter binding rather than merely advisory. A charter without a valid authorizing act is a specification (a blueprint) but not a constitution; the authorizing act traces to $C_\mathcal{P}$ through a chain of delegations.

4. **Constitutional closure**: the polity has a procedure for revising $T_\mathcal{P}$ — a constitutional amendment process that changes the geometric theory while maintaining continuity with the existing institutional order. Constitutional amendment is a geometric morphism $f : [\![ T_\mathcal{P} ]\!] \to [\![ T'_\mathcal{P} ]\!]$ between the old and new classifying toposes. The polity is constitutionally closed iff every valid revision of $T_\mathcal{P}$ is generated by geometric morphisms within the polity's own constitutional structure — no revision requires appeal to an external authority.

## Aristotle's three levels and the polity

Aristotle, *Politics* I.1–2 (1252a1–1253a37), establishes the polity as the culmination of three levels of community:

$$\mathrm{oikos\ (household)} \;\subset\; \mathrm{kome\ (village)} \;\subset\; \mathrm{polis\ (polity)}$$

The household exists for daily necessity — the ongoing reproduction of life. The village is a collection of households cooperating for something beyond daily necessity. The polis is the community that comes into being for the sake of living but exists for the sake of *living well* — it is the first community that is complete (teleia), not merely necessary. The polis is the telos of the community-hierarchy: the level at which the community becomes self-sufficient.

Aristotle's argument at 1252b29–1253a3: the polis is prior *in nature* to the individual and to the household, even though it is posterior *in time*. The priority in nature means: the polis is the completed form of which the household and village are parts — they are explicable only by reference to the whole they constitute. The polity is not an aggregate of households and villages but the organic whole within which households and villages have their function. Applied to the relational universe: individual institutions and ships are elements in the classifying topos $[\![ T_\mathcal{P} ]\!]$; they are constituted by the polity's constitutional theory, not prior to it.

## Constitutional registration as universe morphism: three proved results

**Sources**: [RelationalUniverseGeometricTheory](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/relational-universe-geometric-theory.md), [HyperverseInitiality](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/relational-hyperverse-initiality-initial-object-hyperverse-models-theorem.md).

**The internal object.** A polity is a relational universe $R_\mathcal{P} = \mathbf{Sh}(T_\mathcal{P}, J_\mathcal{P})$ — a history site $(T_\mathcal{P}, J_\mathcal{P})$ equipped with a fiber sheaf $H_\mathcal{P}$, RelationalHistoryFiberSaturatingNucleus $\sigma_\mathcal{P}$, RelationalHistoryFiberTransferringNucleus $\Delta_\mathcal{P}$, and their joint fixed-point sub-sheaf $H^*_\mathcal{P}$ (RelationalHistoryFixedFiber). The "constitutional theory $T_\mathcal{P}$" in the formal definition is the relational universe axioms instantiated at the polity level; the polity's site $(T_\mathcal{P}, J_\mathcal{P})$ is the concrete object, and $R_\mathcal{P}$ is the relational universe it generates.

**What "institution within polity" means.** An institution $R_I$ is **within** polity $R_\mathcal{P}$ iff there exists a RelationalUniverseMorphism $(\phi, \alpha): R_I \to R_\mathcal{P}$ where:
- $\phi: T_I \to T_\mathcal{P}$ is a history functor embedding institution histories into polity histories
- $\alpha: \phi^* H_\mathcal{P} \Rightarrow H_I$ is a natural transformation of fiber sheaves (constitutional data: how polity propositions restrict to institution propositions)
- Nucleus compatibility: $\alpha \circ \sigma_\mathcal{P} = \sigma_I \circ \alpha$ and $\alpha \circ \Delta_\mathcal{P} = \Delta_I \circ \alpha$

This is definitional: "within" IS defined as the existence of such a morphism. What can be proved is that these morphisms are closed under composition and preserve the constitutional hard core.

**Proposition (Composition of registrations).** If $(\phi, \alpha): R_I \to R_\mathcal{P}$ is a registration morphism and $(\psi, \beta): R_J \to R_I$ is a sub-institution morphism, then $(\phi \circ \psi,\; \beta \circ \psi^* \alpha): R_J \to R_\mathcal{P}$ is a registration morphism.

*Proof.*
1. $\phi \circ \psi: T_J \to T_\mathcal{P}$ is a functor (composite of functors).
2. $\psi^* \alpha: \psi^* \phi^* H_\mathcal{P} \Rightarrow \psi^* H_I$ is the pullback of $\alpha$ along $\psi$, using $(\phi \circ \psi)^* = \psi^* \circ \phi^*$.
3. $\beta \circ \psi^* \alpha: (\phi \circ \psi)^* H_\mathcal{P} \Rightarrow H_J$ is the vertical composite: natural in $T_J$ because both $\psi^* \alpha$ and $\beta$ are.
4. Nucleus compatibility of the composite: $(\beta \circ \psi^* \alpha) \circ \sigma_\mathcal{P} = \beta \circ \psi^*(\alpha \circ \sigma_\mathcal{P}) = \beta \circ \psi^*(\sigma_I \circ \alpha) = \beta \circ (\sigma_I \circ \psi^* \alpha) = \sigma_J \circ (\beta \circ \psi^* \alpha)$, using nucleus compatibility of $\alpha$ then $\beta$ in sequence. Similarly for $\Delta_\mathcal{P}$. $\square$

**Proposition (Constitutional hard core preserved by registration).** For every registration morphism $(\phi, \alpha): R_I \to R_\mathcal{P}$ and every history $t \in T_I$, the component $\alpha_t: H_\mathcal{P}(\phi(t)) \to H_I(t)$ sends RelationalHistoryFixedFiber elements to RelationalHistoryFixedFiber elements: if $c \in H^*_\mathcal{P}(\phi(t))$, then $\alpha_t(c) \in H^*_I(t)$.

*Proof.*
1. Let $c \in H^*_\mathcal{P}(\phi(t))$, meaning $\sigma_\mathcal{P}(\phi(t))(c) = c$ and $\Delta_\mathcal{P}(\phi(t))(c) = c$.
2. $\sigma$-compatibility gives: $\sigma_I(t)(\alpha_t(c)) = \alpha_t(\sigma_\mathcal{P}(\phi(t))(c)) = \alpha_t(c)$.
3. $\Delta$-compatibility gives: $\Delta_I(t)(\alpha_t(c)) = \alpha_t(\Delta_\mathcal{P}(\phi(t))(c)) = \alpha_t(c)$.
4. Steps 2–3 give $\alpha_t(c) \in H^*_I(t)$. $\square$

**Corollary (Constitutional commitment is transitive).** Every doubly-stable proposition $c \in H^*_\mathcal{P}$ constitutes a constitutional commitment that every registered institution must satisfy via pullback through $\alpha$. Removing $c$ from $H^*_\mathcal{P}$ requires a constitutional amendment (a change to $J_\mathcal{P}$ that changes the nuclei $\sigma_\mathcal{P}, \Delta_\mathcal{P}$) and automatically releases all registered institutions from that commitment.

**Constitutional amendment = topology change.** A constitutional amendment replaces $J_\mathcal{P}$ with $J'_\mathcal{P}$, yielding $R'_\mathcal{P} = \mathbf{Sh}(T_\mathcal{P}, J'_\mathcal{P})$ with new nuclei $\sigma'_\mathcal{P}, \Delta'_\mathcal{P}$ and new fixed fiber $H'^*_\mathcal{P}$. By the charter amendment theorem ([Charter](charter.md) §Charter amendment, governing principles, and the threshold), the amendment is constitutionally valid iff the induced morphism $f: R_\mathcal{P} \to R'_\mathcal{P}$ preserves the polity's founding hard core: the constitutional core $C_\mathcal{P} \subseteq H^*_\mathcal{P}$ embeds as a sub-fixed-point of $H'^*_\mathcal{P}$. If $C_\mathcal{P} \not\subseteq f^*(H'^*_\mathcal{P})$, the amendment dissolves the constitutional core and constitutes a new polity rather than amending the old one.

**CLAIM (not proved in general): polity as classifying object.** The analogy with the classifying topos — that RelationalUniverseMorphisms $R_I \to R_\mathcal{P}$ are in natural bijection with models of the polity's constitutional axioms in $R_I$ — holds if and only if $R_\mathcal{P} \cong R_\mathrm{syn}(T_\mathcal{P}, J_\mathcal{P})$, the syntactic relational universe freely generated by the polity's history site. By RelationalUniverseGeometricTheory, the global classifying object for all relational universes is $R_\mathrm{syn}$ — the initial model of the RelationalUniverseGeometricTheory $\mathbb{T}_\mathbf{RU}$, whose geometric morphisms classify all relational universes universally. A polity $R_\mathcal{P}$ is a local classifying object for its institutional forms iff $R_\mathcal{P}$ is the freely-generated relational universe over $(T_\mathcal{P}, J_\mathcal{P})$ — verified by [SyntacticRelationalUniverseInitiality](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/relational-hyperverse-initiality-initial-object-hyperverse-models-theorem.md) for the specific history site. This verification is the polity-level completeness condition; its general status is open.

**The universal polity.** By HyperverseInitiality, the hyperverse $\mathcal{H} = \varinjlim_n R^{(n)}$ is the initial object in the category of hyperverse models: every hyperverse model $\mathbf{V}$ receives a unique morphism $\mathcal{H} \to \mathbf{V}$. In the direction of registration morphisms (from institution to polity), the hyperverse is the smallest structure that maps into every model — and every polity $R_\mathcal{P}$ is a specific relational universe within the hyperverse. The hyperverse is the polity that contains all relational universes; every other polity is a quotient of it via the unique morphism $\mathcal{H} \to R_\mathcal{P}$.

## Flag and charter authority in the relational universe

**Flag registration.** The [Ship](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/terms/okaga-quarters-ship.md) spec defines the ship's flag as the history functor component $\phi: T_\mathrm{ship} \to T_F$ where $T_F$ is the flag state's history category. In polity terms: $T_F = T_\mathcal{P}$, and the flag registration is the history-functor component $\phi$ of the full constitutional registration RelationalUniverseMorphism $(\phi, \alpha): R_\mathrm{ship} \to R_\mathcal{P}$. The fiber component $\alpha: \phi^* H_\mathcal{P} \Rightarrow H_\mathrm{ship}$ carries the constitutional data: how the polity's doubly-stable propositions restrict to the ship's fiber.

UNCLOS Art. 91 requires that ships have a genuine link to the flag state — a real connection, not merely nominal. In relational universe terms: the RelationalUniverseMorphism $(\phi, \alpha)$ must be non-trivial — the fiber component $\alpha$ must carry genuine constitutional content from $H^*_\mathcal{P}$ into $H^*_\mathrm{ship}$ (the Hard Core Preservation proposition above requires this content to be non-empty for the registration to be constitutionally meaningful). A flag of convenience corresponds to a morphism $(\phi, \alpha)$ where $\alpha$ is trivially the zero map or factors through the two-element fiber of the minimal relational universe: the ship's hard core $H^*_\mathrm{ship}$ receives no constitutional content from the polity.

**Charter authorization.** The [Charter](charter.md) spec defines the authorizing act $A$ as the authority that makes the charter binding rather than merely advisory. In polity terms: $A$ is the data of the constitutional registration RelationalUniverseMorphism $(\phi_\mathrm{charter}, \alpha_\mathrm{charter}): R_\mathrm{charter} \to R_\mathcal{P}$ — the fiber component $\alpha_\mathrm{charter}$ witnesses the charter's constitutional validity by showing how the polity's fixed fiber maps into the charter's fixed fiber.

Delegation chains: if an institution $I$ within the polity issues a sub-charter to a company $\mathcal{K}$, the sub-charter's authorizing act is the composite RelationalUniverseMorphism $(\phi_\mathcal{P} \circ \phi_I,\; \alpha_I \circ \phi_I^* \alpha_\mathcal{P}): R_\mathcal{K} \to R_\mathcal{P}$ — established by the Composition of Registrations proposition above. Every delegation chain is a composable sequence of RelationalUniverseMorphisms with $R_\mathcal{P}$ as terminal target.

## Autarkeia: internal candidate and open equivalence

**Source**: [RelationalHistoryFixedPresheafAutomorphismRigidityAxiom](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/humanities/theories/math/relational-history-fixed-presheaf-automorphism-rigidity-axiom.md).

The autarkeia condition — self-sufficiency — has the following internal candidate traced through named constructs.

**Internal candidate (RelationalHistoryFixedPresheafAutomorphismRigidityAxiom applied at polity level).** The polity $R_\mathcal{P}$ is autarkic iff its fixed fiber sheaf $H^*_\mathcal{P}$ satisfies the following: for any two registration morphisms $(\phi, \alpha): R_I \to R_\mathcal{P}$ and $(\phi', \alpha'): R_{I'} \to R_\mathcal{P}$ with $R_I \not\cong R_{I'}$, there exists a history $t \in T_\mathcal{P}$ and a doubly-stable proposition $c \in H^*_\mathcal{P}(t)$ such that $\alpha_t(c) \neq \alpha'_t(c)$ — the pullback values of $c$ to the two institutions are distinct.

This is the polity-level extension of RelationalHistoryFixedPresheafAutomorphismRigidityAxiom. That axiom states: no nontrivial automorphism of $T_\mathcal{P}$ preserving $J_\mathcal{P}$ is invisible to $H^*_\mathcal{P}$ — the fixed fiber distinguishes all histories. The autarkeia extension says: $H^*_\mathcal{P}$ not only distinguishes histories within the polity but distinguishes institutions registered within it. A polity where two distinct institutions $R_I \not\cong R_{I'}$ agree on all doubly-stable polity propositions has a failure of autarkeia: it cannot distinguish the two institutions from within.

**What autarkeia failure looks like internally.** A polity fails autarkeia iff there exist two institutions $R_I \not\cong R_{I'}$ with registration morphisms $(\phi, \alpha)$ and $(\phi', \alpha')$ such that $\alpha_t(c) = \alpha'_t(c)$ for all $t \in T_\mathcal{P}$ and all $c \in H^*_\mathcal{P}(t)$. In this case, the polity's constitutional hard core $H^*_\mathcal{P}$ carries no information that distinguishes $R_I$ from $R_{I'}$: the two institutions are constitutionally indistinguishable. A polity in this state must appeal to a higher-level polity (a polity $R_{\mathcal{P}'}$ with $R_\mathcal{P} \to R_{\mathcal{P}'}$ as a sub-polity morphism) whose larger $H^*_{\mathcal{P}'}$ can distinguish them.

**SEMANTIC INTERPRETATION**: The external "conservative set of points" condition and this internal "fixed-fiber separation" condition are semantically equivalent — both say the polity distinguishes its institutional content from within. Whether they are formally identical requires deriving that the evaluations $\{H^*_\mathcal{P}(t)\}_{t \in T_\mathcal{P}}$ constitute a conservative set of points of $R_\mathcal{P}$ in the topos-theoretic sense. This requires showing that the fixed fiber evaluations separate morphisms in $R_\mathcal{P}$ globally — a consequence of the RelationalHistoryFiberHeytingAlgebraIsomorphism (collapse isomorphism: when the RelationalHistoryFiberSaturatingNucleus transfer stable fiber injectivity condition holds, $\mathrm{Fix}(\Delta_t) \cong H^*_t$) combined with the sheaf separation condition. Whether the collapse isomorphism applies at every history of every polity — or only at histories where the saturation-transfer injectivity condition holds — is open. The formal equivalence is a consequence of this open condition, not independently established.

## Nuclear derivation

The polity's institutional propositions inhabit a fiber at the polity level of the hyperverse tower — the level above individual institutions:

$$H^\mathcal{P}_t \;=\; \bigl\{\, \varphi \in L(T_\mathcal{P}) \,:\, \varphi \text{ is a geometric sentence in the language of } T_\mathcal{P} \bigr\}$$

**Constitutional validity.** A geometric sentence $\varphi$ is constitutionally valid at history $t$ iff it is a theorem of $T_\mathcal{P}$ — iff $T_\mathcal{P} \vdash \varphi$. This is the polity-level analog of RelationalHistoryFixedFiber: the doubly-stable propositions at the polity level are the theorems of $T_\mathcal{P}$. Every institution within the polity must satisfy these theorems; the theorems are the polity's hard core in the enterprise sense — they require a change to $T_\mathcal{P}$ (a constitutional amendment) to remove, not merely a change to individual institutions' nuclear pairs.

**Polity-level nuclei.** The polity has its own nuclear pair:
- RelationalHistoryFiberSaturatingNucleus at the polity level: the operator taking a geometric sentence $\varphi$ to the weakest theorem above $\varphi$ in $T_\mathcal{P}$ — the backward-stable closure within the polity's constitutional theory
- RelationalHistoryFiberTransferringNucleus at the polity level: the operator taking $\varphi$ to its forward-implication under the constitutional theory — what $\varphi$ commits the polity to in future constitutional moments

The polity's RelationalHistoryFixedFiber is the set of theorems of $T_\mathcal{P}$: propositions whose nuclear closure in both directions is themselves.

**Constitutional amendment as topology change.** At the individual institution level, operating within the institution means operating within a fixed topology $J$; operating on the institution means changing $J$ (see [Institution](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/institution.md) §Beck-Chevalley). At the polity level, the same distinction operates: operating within the polity's constitutional order means operating within $T_\mathcal{P}$; operating on the polity's constitutional order means changing $T_\mathcal{P}$ itself — the polity-level analog of a change to the Grothendieck topology. The polity's constitutional amendment process is the formal procedure for changing $T_\mathcal{P}$ in a constitutionally authorized way (i.e., in a way sanctioned by $C_\mathcal{P}$, the constituent power).

## The three traditions

**Aristotle (Politics, 350 BCE)**: the polis is the complete community — the telos of the association hierarchy, prior in nature to its parts, constituted by its constitution (*politeia*) as its soul. The three constitutional forms (monarchy, aristocracy, polity) and their degenerations (tyranny, oligarchy, democracy) are the possible specifications of the polity's constitutional theory $T_\mathcal{P}$.

**Pettit (Republicanism, 1997)**: the polity is the community constituted by non-domination — members stand in relations of freedom from arbitrary interference. In classifying topos terms: the theory $T_\mathcal{P}$ has the non-domination axiom as a theorem — no model of $T_\mathcal{P}$ includes a relation in which one party can arbitrarily interfere with another without institutional accountability. Republican constitutionalism is the program of making non-domination a theorem of $T_\mathcal{P}$ by the right choice of constitutional theory.

**MacIntyre (After Virtue, 1981; Whose Justice? Which Rationality? 1988)**: the polity is the community within which practices (enterprises in the enterprise spec sense) can pursue their internal goods. The polity's constitutional theory $T_\mathcal{P}$ includes the recognition of internal goods as goods — not merely as instrumental to external goods (market value, political power). A polity whose $T_\mathcal{P}$ reduces all goods to external goods has degenerated in the MacIntyrean sense: its enterprises can no longer pursue genuine internal goods because the constitutional order does not recognize them.

## Open questions

- Whether every polity's constitutional order is Boolean (every proposition in $H^*_\mathcal{P}$ satisfies excluded middle: $c \vee \neg c = \top$) or genuinely intuitionistic (some propositions admit intermediate degrees of settledness). The existing relational universe uses intuitionistic Heyting algebras at every fiber; a polity with a Boolean fixed fiber $H^*_\mathcal{P}$ would have a fully decidable constitutional order where every institutional question is definitively settled or definitively unsettled. Whether there are polities with genuinely non-Boolean $H^*_\mathcal{P}$ — where constitutional questions admit degrees corresponding to the Heyting implication structure — is open. The connection to Rawls's publicity condition (analyzed in [Office](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/terms/office.md)) may constrain this.
- Whether the **dissolution of a polity** corresponds to a formal condition in the polity containment order: whether there exists a smallest polity containing any given institutional complex, or whether the containment relation on polities (ordered by registration morphisms $R_I \to R_\mathcal{P}$) is not well-founded below the hyperverse $\mathcal{H}$. The HyperverseInitiality theorem establishes $\mathcal{H}$ as the maximum (every polity receives a unique morphism from $\mathcal{H}$); it does not establish a minimum. Whether every institutional complex has a unique smallest enclosing polity is unresolved.
- Whether the **classifying-object claim** for $R_\mathcal{P}$ can be established: whether every polity's relational universe is freely generated by its history site $(T_\mathcal{P}, J_\mathcal{P})$ in the sense of SyntacticRelationalUniverseInitiality. If yes, the "institution within polity = RelationalUniverseMorphism into $R_\mathcal{P}$" bijection becomes the full classifying-object universal property. If no, polities carry extra unchosen structure beyond their history sites, and the constitutional uniqueness theorem of HyperverseInitiality (no accidental models) would fail at the polity level.
- Whether the **formal equivalence between autarkeia and fixed-fiber separation** is derivable: whether the RelationalHistoryFiberSaturatingNucleus transfer stable fiber injectivity condition (which gives $\mathrm{Fix}(\Delta_t) \cong H^*_t$ and enables the separation argument in the autarkeia section) holds at every history of a well-formed polity, or only at saturation-complete histories. If the condition fails at some histories, the polity has histories where its fixed fiber does not separate institutions — localized failures of autarkeia at specific histories, rather than global failure.
- Whether the polity's **constituent power** $C_\mathcal{P}$ can be specified internally: whether $C_\mathcal{P}$ is the initial object in the category of RelationalUniverseMorphisms from the polity's own $R_\mathcal{P}$ to itself (the identity morphism in the self-registration sense), or whether the constituent power is necessarily at a higher tower level (the polity-founding act lives in $R^{(n+1)}$ if the polity itself lives at level $n$). The HyperverseInitiality corollary — the four initiality results form a single stratified freeness pattern — suggests that the constituent power is the level-$(n+1)$ initiality morphism from the hyperverse into the polity: $C_\mathcal{P} = \phi_n: R^{(n)} \to \mathbf{V}$ at the appropriate tower level. Sieyès's paradox (the constituent power creates the order but cannot be authorized by it) may correspond to the fact that this morphism lives one tower level above the polity, exactly as a RelationalUniverseMorphism $R^{(n)} \to R_\mathcal{P}$ is a morphism between tower levels, not within a single level.
- **Asabiyyah and polity stability**: the connection between shadow density in $H_\mathcal{P}$ and the polity's group solidarity is addressed in [Asabiyyah](../../../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2026/03/21/2026-03-21-asabiyyah.md), which establishes the shadow partition as the formal substrate and provides the proved level-0 and level-1 propositions. Whether the polity-level shadow density directly corresponds to Ibn Khaldun's cycle at the polity level — rather than at the level of individual institutions — remains open.

```yaml
---

**Sources**: [RelationalUniverseGeometricTheory](../../../../../../../../../../content/text/humanities/theories/math/relational-universe-geometric-theory.md), [HyperverseInitiality](../../../../../../../../../../content/text/humanities/theories/math/relational-hyperverse-initiality-initial-object-hyperverse-models-theorem.md).

**Source**: [RelationalHistoryFixedPresheafAutomorphismRigidityAxiom](../../../../../../../../../../content/text/humanities/theories/math/relational-history-fixed-presheaf-automorphism-rigidity-axiom.md).

**Sources**: [RelationalUniverseGeometricTheory](../../../humanities/domains/math/relational-universe-geometric-theory.md), [HyperverseInitiality](../../../humanities/domains/math/relational-hyperverse-initiality-initial-object-hyperverse-models-theorem.md).

**Source**: [RelationalHistoryFixedPresheafAutomorphismRigidityAxiom](../../../humanities/domains/math/relational-history-fixed-presheaf-automorphism-rigidity-axiom.md).

