---
id: company
description: "A Company is a quadruple (K, S, G, ℓ) — a charter K encoding a common purpose, a staff S as ongoing personnel, a governance mechanism G for collective decision-making, and an institutional standing ℓ constituting the company as an entity. The defining structure: a company is a vessel whose charter encodes a purpose jointly held by its members — not merely imposed from above but constitutive of membership — with staff (ongoing personnel) rather than voyage-bounded crew, and an entity-status that makes collective attribution possible: 'the company decided.' Company derives from Latin companio (com + panis, bread-fellow) — a fellowship of persons sharing a common purpose."
defines: Company
related: Vessel, Staff, Charter, Institution, NormativeSystem, Crew, Person, Captain
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  charter: charter
  staff: staff
  governance: relational-universe-morphism
  standing: relational-universe-morphism
output: relational-universe
ast:
  status-function-declaration:
    - charter:
        - staff
    - governance:
        - charter
        - staff
    - standing:
        - charter
---

# Company

## Formal definition

A **Company** is a quadruple $\mathcal{K} = (K, \mathcal{S}, \mathcal{G}, \ell)$:

$$\mathcal{K} = (K : \mathrm{Charter},\; \mathcal{S} : \mathrm{Staff},\; \mathcal{G} : \mathrm{Governance},\; \ell : \mathrm{Standing})$$

where:
- $K$ is the **charter** — the constitutive document that specifies the company's common purpose, establishes its normative order, and declares its membership conditions; $K$ is not merely the vessel's background document but the explicit formulation of what members share — the telos that makes membership meaningful and constitutes the fellowship
- $\mathcal{S}$ is the **staff** — the ongoing personnel bearing roles within the company; unlike a crew (bounded by a voyage $T$), the staff's role-bindings persist through the company's history without a pre-specified terminal period
- $\mathcal{G}$ is the **governance mechanism** — the collective decision procedure that aggregates staff inputs into group-level decisions attributable to the company as a whole rather than to individual members; without $\mathcal{G}$, the staff acts in parallel but the company does not act as one
- $\ell$ is the **institutional standing** — the status-function declaration of the form "this collective counts as $Y$ in context $C$" that gives the company its entity identity; $\ell$ is what makes "the company decided" a coherent attribution; it installs the company as a recognized node in a normative system

A Company is a [Vessel](../../../../../../../information-science-services-section/services/knowledge-services-section/services/research-services-section/content/text/glossary/terms/vessel.md) — it is an institutional entity bearing officers, carrying a charter, and persisting through changes in personnel. What the company adds over bare vessel:

1. **Charter as jointly held purpose**: in a bare vessel, the charter is a document. In a company, the charter encodes a purpose that members jointly hold — membership in the company just is participation in the common purpose. This is the *companio* structure: you are a bread-fellow insofar as you share the meal (the purpose), not merely insofar as you hold a role.
2. **Staff rather than crew**: a vessel can operate with voyage-bounded crew; a company operates with ongoing staff. The company's identity is continuous across the comings and goings of individual members.
3. **Entity attribution**: a vessel can be the institutional container for authority; a company is attributed agency — it acts, decides, commits, and is held responsible as a collective entity.

**Four invariants.** $\mathcal{K}$ is a company iff it satisfies:

1. **Common purpose**: $K$ encodes a telos $\tau_K$ that is held jointly by the company's members — not imposed from above but constitutive of membership. A person is a member of the company iff they have accepted $\tau_K$ as their operative collective purpose. This is the fellowship condition: the company is constituted by shared purpose, not by contract alone. Coase's insight is that firms exist because shared purpose enables coordination without price-negotiation for each transaction; the firm's boundary is where the common-purpose relation holds. A group without shared purpose is not a company; it is a nexus of contracts, a market interaction, or an aggregate.

2. **Perpetual succession**: $\mathcal{K}$'s identity persists through complete turnover of $\mathcal{S}$. The charter $K$, the governance mechanism $\mathcal{G}$, and the standing $\ell$ persist when all current staff members depart and are replaced by others. This is the formal content of the corporation's perpetual succession doctrine and the military unit's persistent designation — the company as an entity is defined by its role-structure and charter, not by its current personnel. When the 1st Company changes its entire complement, it remains the 1st Company.

3. **Governance generates collective attribution**: $\mathcal{G}$ is a procedure that produces company-level decisions — representations and actions attributable to $\mathcal{K}$ as a whole rather than to any individual member. List and Pettit's formal criterion: $\mathcal{G}$ must resolve the **discursive dilemma** — produce coherent group-level outcomes even when individual member views would aggregate inconsistently under majority rule. Without $\mathcal{G}$, collective attribution fails: "the company decided" dissolves into "several members happened to agree." With $\mathcal{G}$, the company is a genuine corporate agent.

4. **Entity standing**: $\ell$ installs the company as a recognized entity in at least one normative system — legal, military, or associational. For commercial companies: $\ell$ is legal incorporation, giving the company five legal capacities (own property, contract, sue, be sued, make bylaws). For military companies: $\ell$ is doctrinal designation, giving the unit operational standing within the chain of command. For fellowships: $\ell$ is collective recognition, giving the group standing within a social or institutional context. Without $\ell$, there is a staff with a charter but no company — no entity that acts, is addressed, or is held responsible.

## Two canonical variants

**The commercial company** (legal sense):
$$\mathcal{K}_{\mathrm{comm}} = (\underbrace{K_{\mathrm{articles}}}_{\text{articles of incorporation}},\; \underbrace{\mathcal{S}_{\mathrm{emp}}}_{\text{employees + directors}},\; \underbrace{\mathcal{G}_{\mathrm{corp}}}_{\text{corporate governance}},\; \underbrace{\ell_{\mathrm{inc}}}_{\text{incorporation}})$$

The commercial company's charter is the articles of incorporation + bylaws; its governance mechanism is the board of directors + officer hierarchy; its standing is the legal personhood granted by incorporation (the state's status-function declaration: "this entity counts as a legal person in this jurisdiction"). Its common purpose is specified in the objects clause of the articles.

**The military company** (tactical unit sense):
$$\mathcal{K}_{\mathrm{mil}} = (\underbrace{K_{\mathrm{doc}}}_{\text{mission orders + doctrine}},\; \underbrace{\mathcal{S}_{\mathrm{sol}}}_{\text{assigned soldiers}},\; \underbrace{\mathcal{G}_{\mathrm{cmd}}}_{\text{chain of command}},\; \underbrace{\ell_{\mathrm{des}}}_{\text{unit designation}})$$

The military company's charter is its mission orders and unit doctrine; its governance mechanism is the chain of command (company commander → executive officer → first sergeant → platoon leaders); its standing is its doctrinal designation (the unit exists within the army's table of organization and equipment, giving it operational authority within the chain of command). Its common purpose is to close with and accomplish the mission.

The military company is the **minimal combined-arms unit** — capable of independent tactical action across offensive, defensive, and stability operations without constant higher-direction. Self-sufficiency is the functional criterion: a company can operate independently; a platoon cannot.

## The com-panis structure

Etymology is formal here. *Company* derives from *companio* — Latin *com* ("with, together") + *panis* ("bread") — a bread-fellow, a person who shares a meal. The company is, at its root, a fellowship of persons sharing something in common. The sharing of bread is the metaphor for a shared stake in a common enterprise.

This etymological structure encodes the first invariant: a company is not a nexus of bilateral contracts (each member contracts separately with the firm) but a fellowship of mutual participation in a common purpose. Two contracting parties do not form a company; a group sharing a common stake does.

The joint-stock company of the 17th century (VOC, East India Company) formalized this: many investors could hold fractional shares in a single common enterprise, with limited liability enabling participation without unlimited exposure. The *company* of merchants is the fellowship that pools risk and purpose; the legal company is its formal instantiation.

## Company and capital

Every company operates within a **field** of positions and **capital** — the structured resources that members deploy in pursuit of the common purpose. Capital in a company takes multiple forms:

- **Financial capital**: the monetary resources subscribed by shareholders and managed by the company as a legal entity; the company holds, deploys, and accumulates financial capital in its own name (entity theory)
- **Social capital**: the network of relationships within the company's field — the trust, reputation, and connection-value that members bring and accumulate
- **Organizational capital** (Penrose): the company's competencies, routines, and distinctive capabilities — what makes the company more than the sum of its members' individual capabilities; the collective learning embedded in the role-structure and procedures

The Penrose insight: the company's **organizational capital** is what grounds perpetual succession. Even after complete personnel turnover, the company retains its competency structure, its procedures, its reputation, and its routines — these are the real content of the company's persistent identity, beyond the legal formality of incorporation.

## Theory of the company: four accounts

The essential question: what *is* a company? Four major answers, each grounded in the research:

| Account | What the company *is* | What gives it unity | Member relation |
|---|---|---|---|
| **Concession / Entity** (corporate law) | A creature of state; a genuine legal person | The charter granted by sovereign authority | Members are shareholders in something that transcends them |
| **Nexus of contracts** (Jensen, Meckling) | A legal fiction; a nexus of bilateral contracts | No genuine unity — the firm is the intersection of contracts | Members are contracting parties; the company is the central node |
| **Shared cooperative activity** (Bratman, Searle) | A collectively recognized institutional fact with meshing sub-plans | Interconnected intentions + constitutive rules | Members are joint intenders; membership = bearing meshing sub-plans |
| **Bundle of capabilities** (Penrose, RBV) | A repository of resources and routines that cannot be traded separately | The coherent competency architecture | Members are contributors to and learners from the collective capability |

In the relational universe, these accounts correspond to different aspects of the company's formal structure:
- The entity account corresponds to the **standing** $\ell$ (the status-function declaration that installs the company)
- The nexus-of-contracts account underemphasizes $\ell$ and focuses on $\mathcal{S}$'s role-bindings as bilateral contracts
- The shared-cooperative-activity account corresponds to the **charter** $K$ encoding meshing sub-plans + the **governance** $\mathcal{G}$
- The bundle-of-capabilities account corresponds to the **staff** $\mathcal{S}$'s collective competency structure

A complete account of the company requires all four: the entity (standing $\ell$), the charter (purpose $K$), the governance (collective rationality $\mathcal{G}$), and the staff (capabilities $\mathcal{S}$).

## Nuclear derivation

The company $\mathcal{K} = (K, \mathcal{S}, \mathcal{G}, \ell)$ is an [Institution](institution.md) and inherits its nuclear analysis directly. It generates four families of propositions in $H_t$:

- For each constitutive rule $(X, Y, C) \in K$: proposition $k_{XYC} \in H_t$ — "agent $X$ counts as status $Y$ in context $C$ within $\mathcal{K}$ at $t$"
- For each staff role-binding: proposition $b_{p,r} \in H_t$ — "person $p$ bears role $r$" (see [Staff](./staff.md))
- The **entity status** proposition $\ell_t \in H_t$ — "this collective counts as company $\mathcal{K}$"
- For each company decision $d$: the **governance** proposition $g_d \in H_t$ — "$d$ is a company-level decision"

**Company existence.** The company is operative at $t$ iff its entity status is doubly settled:
$$\mathcal{K} \text{ operative at } t \iff \ell_t \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$

**Charter operativity.** The charter $K$ is operative at $t$ iff all its constitutive rules are doubly settled:
$$K \text{ operative at } t \iff \forall (X, Y, C) \in K : k_{XYC} \in H^*_t$$

**Governance IS the nuclear pair.** The governance mechanism $\mathcal{G}$ is not merely analogous to the nuclear pair — it is the pair $(\sigma_t, \Delta_t)$ restricted to company propositions. A proposal $d \in H_t$ becomes a company-level decision iff it reaches $H^*_t$: $\sigma_t(d) = d$ (semantically coherent with the charter) and $\Delta_t(d) = d$ (committed to forward action). The discursive dilemma (List-Pettit) is resolved iff there exists a governance proposition $g_d \in H^*_t$ that is not the join of individual member propositions — i.e., $g_d \neq \bigvee_{p \in P} b_{p,r}$ for any collection of role-bindings.

**Perpetual succession theorem.** By the persistence theorem for $H^*$ ([Institution](institution.md), Persistence Theorem): for any morphism $f : s \to t$ in $T$, $H(f)(H^*_t) \subseteq H^*_s$. Therefore:

$$\ell_t \in H^*_t \implies H(f)(\ell_t) \in H^*_s \quad \forall s \leq t$$

The entity status is preserved under restriction maps. The company's identity persists backward through history regardless of changes in staff. Forward: if $\ell_t \in H^*_t$ and no dissolution act occurs, then $\Delta_t(\ell_t) = \ell_t$ ensures $\ell_{t'}$ remains settled for all $t' \geq t$ in the forward direction.

**Membership.** Staff member $p$ is a member of $\mathcal{K}$ at $t$ iff $b_{p,\mathrm{member}} \in H^*_t$. Complete personnel turnover = all specific $b_{p,r}$ leave and new $b_{p',r}$ enter $H^*_t$ — while $\ell_t \in H^*_t$ throughout by perpetual succession. The company is constituted by $\ell_t$, not by any particular $b_{p,r}$.

**The four company states.** The nuclear partition applies to $\ell_t$:

| Quadrant | $\sigma_t(\ell_t)$ | $\Delta_t(\ell_t)$ | Company status |
|---|---|---|---|
| $H^*_t$ | $= \ell_t$ | $= \ell_t$ | Operative: recognized and stable |
| $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ | $= \ell_t$ | $> \ell_t$ | Recognized but precarious — accepted by participants but structurally unstable forward |
| $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ | $> \ell_t$ | $= \ell_t$ | Structurally required but unrecognized — the rule-structure requires this company but collective acceptance has not settled it |
| $H_t \setminus (H^*_t \cup \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | $> \ell_t$ | $> \ell_t$ | Proposed only — charter drafted but neither recognized nor structurally operative |

## Diagonal witness composition: propagation of instability through company structure

**Source:** [Diagonal Witness Composition](../math/diagonal-witness-composition.md).

The diagonal witness composition is the mechanism by which a change that resolves one type of nuclear instability at a company sub-unit can create a new, previously-invisible instability in another sub-unit — without any direct morphism between the two sub-units. The composition proceeds through the intermediary company structure:

RelationalHistoryDiagonalWitnessComposition: W(a) → V → W(c)

where W(a) is the sub-unit that was added to resolve a t-type shadow (Δ-instability) at V (the parent company), V is the company itself, and W(c) is the extension added to resolve the s-type shadow (σ-instability) that resulted at level k+1. The composed morphism W(a) → V → W(c) makes W(c) an indirect extension of W(a), inducing a new Δ-instability at W(a) that was not present before W(c) was created.

**Company restructuring: resolving one instability creates another.** When the company governance RelationalHistoryCompanyGovernance resolves a Δ-instability at some sub-unit (adds a new sub-unit W(a) to address a forward-commitment gap), the resulting s-type shadow at the company level is then resolved by a company extension W(c) at the next tower step. The diagonal witness composition connects W(a) to W(c) through V: W(c) becomes an indirect extension of W(a) in the tower at level k+2. This creates a new s-type shadow β at W(a) — an element that was previously Δ-stable at W(a) but now fails to extend consistently to W(c). The restructuring that fixed the sub-unit created a new instability in that same sub-unit via the diagonal.

This is the formal content of why corporate restructuring has unforeseen consequences: fixing one organizational instability (a Δ-gap: the forward-commitment of some element is not witnessed) triggers the creation of a company-level extension W(c) that propagates diagonally back to create new instability in the sub-unit that was added to fix the original problem.

**Company dissolution: residual liabilities as diagonal compositions.** The open question — whether company dissolution leaves behind residual standing (pension obligations, legal liabilities) that must be discharged before dissolution is complete — is answered by the diagonal witness composition. Dissolution creates a company-level extension W(c) (the winding-up entity, the liquidation proceeding, the successor legal structure). The sub-units W(a) that map to the company V via the sub-universe morphism W(a) → V acquire the diagonal morphism W(a) → V → W(c). This diagonal morphism imposes new Δ-constraints on elements of the sub-units' fibers: elements that were previously Δ-stable (properly settled obligations within the sub-units) may now fail the extended Δ-stability test because they cannot extend consistently to W(c).

The residual liabilities β (the new s-shadows at W(a)) are precisely these elements — obligations, claims, duties — that were properly settled within the company's operational context but become unstable under the dissolution extension. They resist removal from RelationalHistoryFixedFiber because their Δ-stability is now anchored to the diagonal composition through W(c), and they cannot be discharged until their extension to W(c) is explicitly resolved.

**CLAIM (conditional on RelationalHyperverseTowerSiteClosure).** The residual standing after company dissolution — the elements that resist removal and must be discharged before dissolution is complete — corresponds to the s-type shadows β generated by diagonal witness compositions W(a) → V → W(c) at tower level k+2, where V is the company, W(a) are its sub-units, and W(c) is the dissolution extension. The company cannot fully dissolve (reach RelationalHistoryNuclearTriviality, where the entity status ℓ is completely removed from RelationalHistoryFixedFiber) until all diagonal s-shadows β at all sub-units W(a) are resolved. Each such resolution may itself trigger further diagonal compositions at level k+3, explaining why complex corporate dissolutions require iterative settlement across multiple tower steps.

The claim rests on the following conditional chain:

1. **Dissolution as tower extension.** Company dissolution at tower level k is formalized as: the entity status $\ell_V \in H^*_V{}^{(k)}$ enters the SatShadow at level k — it retains σ-stability (the backward recognition is intact: the company's past acts are coherent) but fails Δ-stability (the forward transfer nucleus cannot witness continuation: there is no forward obligation that keeps the company operative). The tower construction then adds a dissolution extension $\mathbf{W}(c) \in \mathbf{RU}^{(k+1)}$ — a morphism $V \to \mathbf{W}(c)$ in the relational universe site — to resolve this Δ-instability at $V$.

2. **Sub-units acquire a composed morphism, conditional on site closure.** Each operational sub-unit $\mathbf{W}(a)$ of the company carries a sub-universe morphism $\mathbf{W}(a) \to V$ in $\mathbf{RU}^{(k)}$. The dissolution extension adds $V \to \mathbf{W}(c)$ in $\mathbf{RU}^{(k+1)}$. **Conditional on RelationalHyperverseTowerSiteClosure** (the claim that the relational universe tower site is closed under composition — currently a standing open claim in the hyperverse tower axiomatization; see [§Status](../math/diagonal-witness-composition.md#diagonal-witness-composition-status)): the composite $\mathbf{W}(a) \to V \to \mathbf{W}(c)$ is a valid morphism in $\mathbf{RU}^{(k+1)}$, making $\mathbf{W}(c)$ an indirect extension of $\mathbf{W}(a)$.

3. **Conditional on step 2: W(c) enters the transfer nucleus at W(a).** The level-$(k+1)$ transfer nucleus $\Delta^{(k+1)}_{\mathbf{W}(a)}$ is defined as the meet over all extensions of $\mathbf{W}(a)$ in $\mathbf{RU}^{(k+1)}$. If $\mathbf{W}(a) \to \mathbf{W}(c)$ exists (conditional on step 2), then $\mathbf{W}(c)$ is in the extension set for $\Delta^{(k+1)}_{\mathbf{W}(a)}$. An element $\beta \in H_{\mathbf{W}(a)}^{(k+1)}$ that was $\Delta^{(k)}$-stable fails $\Delta^{(k+1)}$-stability iff it does not extend consistently to $\mathbf{W}(c)$: $\Delta^{(k+1)}_{\mathbf{W}(a)}(\beta) > \beta$.

4. **Conditional on steps 2–3: β is an s-shadow at W(a).** Since $\beta$ is Δ-unstable at level $k+1$ but was Δ-stable at level $k$, and since no new sub-universe of $\mathbf{W}(a)$ was added at level $k+1$ ($\mathbf{W}(c)$ is an extension of $V$, not of $\mathbf{W}(a)$), $\beta$'s σ-stability is unchanged: $\sigma^{(k+1)}_{\mathbf{W}(a)}(\beta) = \beta$. Therefore $\beta \in \mathrm{Fix}(\sigma^{(k+1)}_{\mathbf{W}(a)}) \setminus \mathrm{Fix}(\Delta^{(k+1)}_{\mathbf{W}(a)}) = \mathrm{SatShadow}^{(k+1)}_{\mathbf{W}(a)}$ — this is the s-type shadow generated by the diagonal.

5. **Conditional on steps 2–4: dissolution residuals = diagonal s-shadows.** The elements $\beta \in \mathrm{SatShadow}^{(k+1)}_{\mathbf{W}(a)}$ identified in step 4 are precisely the obligations, claims, and duties that were doubly-settled within the sub-unit's operational context ($\beta \in H^*_{\mathbf{W}(a)}{}^{(k)}$) but become σ-stable-only under the dissolution extension. They retain backward recognition (σ-stability: the historical basis for the obligation is intact) but lose forward commitment (Δ-instability: the dissolution extension breaks the forward chain). These are the residual standing elements. Discharging $\beta$ requires adding a further extension to $\mathbf{W}(a)$ that witnesses $\beta$'s forward extension through $\mathbf{W}(c)$ — resolving the Δ-instability in a subsequent tower step, which may itself generate further diagonal compositions at level $k+2$.

*Source.* Diagonal witness composition definition from [§Definition](../math/diagonal-witness-composition.md#diagonal-witness-composition); effect on transfer nucleus from [§Role in s-Type Shadow Generation](../math/diagonal-witness-composition.md#diagonal-witness-composition-role); site closure status from [§Status](../math/diagonal-witness-composition.md#diagonal-witness-composition-status). The entire chain (steps 1–5) is conditional on RelationalHyperverseTowerSiteClosure. $\square$

## Open questions

- Whether the **common purpose** requirement (invariant 1) is formal or merely motivational — whether a company can exist without members genuinely sharing the purpose (holding it only notionally while pursuing individual interests within it), and whether this is a company in name only, or whether the formal structure ($K$, $\mathcal{S}$, $\mathcal{G}$, $\ell$) is sufficient regardless of members' actual orientations. The Coase nexus-of-contracts view implies that genuine shared purpose is unnecessary — only the contractual structure matters. The Bratman view implies genuine shared intentions are necessary for corporate agency.
- Whether **capital** — financial, social, organizational — should be a formal component of the company tuple: whether $\mathcal{K}$ should be a quintuple $(\mathcal{K}, K, \mathcal{S}, \mathcal{G}, \ell)$ with $\mathcal{K}$ a capital bundle, or whether capital is a derived concept from the staff's competencies and the charter's scope.
- Whether the **military company** (a tactical unit without legal personhood) and the **commercial company** (a legal person) are formally the same concept distinguished only by the type of $\ell$, or whether they are different things that happen to share a name — whether the *companio* structure (shared purpose + standing) is the genuine common element.
- Whether a company can be a **member of another company** — whether nested membership (a subsidiary corporation within a parent corporation) is coherent in the formal structure, and whether the parent's governance $\mathcal{G}$ subsumes or merely coordinates with the subsidiary's $\mathcal{G}$.
- Whether **RelationalHyperverseTowerSiteClosure** — the claim that the relational universe tower site is closed under composition — can be derived from the RelationalUniverseMorphism composition axioms and RelationalHistorySite axioms, or requires an independent axiom. The dissolution-residuals claim (above) is entirely conditional on this. The math file ([§Status](../math/diagonal-witness-composition.md#diagonal-witness-composition-status)) identifies it as an open task in the full hyperverse tower axiomatization; the concrete question is whether the RelationalUniverseMorphism definition (specifying what morphisms are: a history functor φ with natural transformation α satisfying nucleus compatibility) is automatically closed under composition, or whether composition of morphisms can fail the nucleus compatibility conditions.
- Whether the **dissolution extension W(c) is unique** up to isomorphism, or whether a company can dissolve in structurally inequivalent ways corresponding to different choices of W(c). If W(c) is not unique, then the set of diagonal s-shadows at each sub-unit W(a) depends on which dissolution extension is chosen — different dissolution paths leave different residual obligations. The uniqueness question is whether the Δ-instability of the entity status ℓ_V at level k determines a unique extension up to the relational universe morphism isomorphism.
