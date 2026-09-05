---
id: leitourgia
description: "A Leitourgia is a quadruple (λ, φ, C, ι) — a designated agent in Hohfeldian liability position, a prescribed-form proposition in the fiber Heyting algebra, a witnessing community constituted by a covering family in the Grothendieck topology, and a discharge proposition. Full discharge is ι ∈ H*_t: past-settled (saturation-nucleus-fixed) and forward-stable (transfer-nucleus-fixed) simultaneously. The personal cost is the Landauer cost of the settling step: spectral mass of the kernel of the counit."
minimum-math: relational-history-fiber-saturating-nucleus
component-of: flatfile-agential-resource-system
fiber-of: relational-universe
base: relational-history-site
element-of: entity
date-created: 2026-03-19
date-modified: 2026-03-20
params:
  leitourgos: entity
  prescribed-form: relational-history-fiber-heyting-algebra
  witnessing-cover: relational-history-site
  discharge-proposition: relational-history-fiber-heyting-algebra
output: relational-universe-fixed-proposition
ast:
  discharged-service-at-history:
    - leitourgos:
        - entity
    - prescribed-form:
        - relational-history-fiber-heyting-algebra
    - witnessing-cover:
        - relational-history-site
    - discharge-proposition:
        - relational-history-fiber-saturating-nucleus
        - relational-history-fiber-transferring-nucleus
---

# Leitourgia

## What it is

A **Leitourgia** is a quadruple $(\lambda,\; \varphi,\; C,\; \iota)$:

$$\Lambda = (\lambda,\; \varphi,\; C,\; \iota)$$

where:
- $\lambda$ is the **leitourgos** — an [Entity](entity.md) in Hohfeldian liability position with respect to the community $C$: designated by the appointing authority's power, not by self-selection. Olson's positional compulsion (*The Logic of Collective Action*, 1965, p.2): the obligation follows from station, not consent. The leitourgos is not an agent who has decided to serve; the station designates the service.
- $\varphi \in H_t$ is the **prescribed-form proposition** — a proposition in the [fiber Heyting algebra](../math/relational-history-fiber-heyting-algebra.md) at current history $t$ specifying what correct enactment consists in. Austin felicity condition A.1 (*How to Do Things with Words*, 1962, p.14): "there must exist an accepted conventional procedure having a certain conventional effect." The prescribed form is not a general contribution but a determinate element of $H_t$ with a yes/no satisfaction condition.
- $C$ is the **witnessing community** — not a pre-existing assembly but the entity constituted by the amalgamation of a $J(t)$-covering family of witnessing observations into a global section of $H^*_t$. Bell (*Ritual Theory, Ritual Practice*, 1992, pp.69-93): "ritualization constitutes the community rather than expressing it." $C$ exists as $C$ because and only because the enactment is collectively witnessed across a cover. Before the cover is assembled there is no community — there are only local observers.
- $\iota \in H_t$ is the **discharge proposition** — the element of the fiber Heyting algebra asserting "$\lambda$ enacted $\varphi$ before $C$." This is the proposition about the enactment, not the prescribed form itself. $\varphi$ specifies what must be enacted; $\iota$ records whether the enactment has occurred.

**Type note.** $\varphi$ and $\iota$ are distinct elements of $H_t$. The prescribed form $\varphi$ is a standing normative specification — it exists in $H_t$ whether or not any leitourgos has acted. The discharge proposition $\iota$ is a contingent claim whose truth value depends on whether $\lambda$ has enacted $\varphi$ before $C$. What earlier formulations conflated — the normative form and the enactment record — are now distinct. This parallels the incumbent distinction between the incumbency proposition $\iota$ (whether $a$ holds $O$) and the office structure $O$ (which holds regardless of any occupant): see [Incumbent](./incumbent.md).

**Full discharge** is the condition $\iota \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: doubly stable. When $\iota \notin H^*_t$, the service is partially discharged — one nucleus is satisfied but not both. See the two-stage discharge section below.

**Personal cost.** The enactment step $s$ that settles $\iota$ carries the [Landauer cost](../math/relational-universe-landauer-cost-counit-sheaf-kernel-spectral-drop-constant.md) $\mathcal{L}_s(t) = M(\delta|_{\mathcal{K}_s(t)})$ — the spectral mass of the kernel $\mathcal{K}_s(t) = \ker(\varepsilon_s(t) : H_{s \star t} \to H_t)$: the sub-Heyting-algebra of propositions at $s \star t$ that vanish when $s$ is forgotten (Landauer, *IBM Journal of Research and Development*, 5:183–191, 1961). This is not a free parameter of the quadruple but a structural consequence of the step $s$: the leitourgos bears a cost whose magnitude is fixed by the spectral structure of the step, not by the leitourgos's choice. The irreversibility is not a defect but the defining mark distinguishing genuine leitourgia from a performance of leitourgia.

## Correspondence table

Nine external doctrines, each with a precise internal rendering:

| External doctrine | Source | Internal construct |
|---|---|---|
| **Positional designation** (obligation from station) | Olson (1965) *The Logic of Collective Action* p.2; Davies *Athenian Propertied Families* (1971) Ch.1 | The leitourgos $\lambda$ is an Entity in Hohfeldian liability position — the appointing authority has the power to designate $\lambda$; $\lambda$ holds the corresponding liability. Refusal alters $\lambda$'s positional standing, not the obligation. |
| **Prescribed form** (*ta nomizomena*, "the customary things") | Lysias *Against Mantitheus* 16.14; Austin (1962) p.14 felicity condition A.1 | The prescribed-form proposition $\varphi \in H_t$ — a closed element of the fiber Heyting algebra specifying the correct enactment. Not a contribution to a general fund but a determinate form. |
| **Illocutionary vs perlocutionary** | Austin (1962) p.121: illocutionary force is not the caused effect; Searle (1969) pp.33–42 | Discharge turns on $\iota$ being settled ($\iota \in H^*_t$), not on any outcome caused beyond the act. The trierarch who builds and crews the trireme to specification discharges the leitourgia whether or not Athens wins the subsequent battle. |
| **Constitutive rules ("X counts as Y in context C")** | Searle (1969) pp.33–42: constitutive rules define the activity they regulate, not merely regulate a pre-existing one | The [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ is the constitutive recognition operator — $\sigma_t(\iota) = \iota$ means the community's accumulated normative history recognizes $\iota$ as correctly enacted; it is past-settled. The nucleus is the formal analog of the context $C$ in "X counts as Y in $C$." |
| **Community-constitution through enactment** | Bell (1992) pp.69–93: "ritualization is a way of acting that is designed and orchestrated to distinguish itself from other ways of acting"; Durkheim (1912) *Les Formes élémentaires de la vie religieuse* pp.225–272 | The witnessing community $C$ is not a pre-existing audience. It is constituted by the amalgamation of a $J(t)$-covering family of local witnessing observations into a global section of $H^*_t$. The community exists as a coherent entity only when the cover assembles. |
| **Sheaf witnessing (the covering sieve)** | Grothendieck topology $J$ on $T$ (Artin–Grothendieck–Verdier, SGA4 I §1, 1972) | The community is constituted iff the witnessing observations form a $J(t)$-covering sieve whose amalgamation is unique — this is the sheaf axiom applied to the witnessing family: compatible local observations glue to exactly one global section. |
| **Personal cost** (the leitourgos's irreversible outlay) | Demosthenes *Against Meidias* 21.155 on the trierarch's personal expenditure; Landauer (1961) *IBM J. R&D* 5:183–191 | The Landauer cost $\mathcal{L}_s(t)$ = spectral mass of $\ker(\varepsilon_s(t) : H_{s \star t} \to H_t)$ — the propositions settled by the service-step that do not carry back to $H_t$. Information produced by the enactment enters the community's fiber but is irreversible from the leitourgos's position at $t$. |
| **Full discharge** (service completely rendered) | Austin (1962) p.14 felicity condition A.2: "the procedure must be executed by all participants both correctly and completely" | $\iota \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: doubly stable — past has recognized the enactment AND all future histories inherit it. Neither nucleus can demand more. |
| **Theological extension** (priestly leitourgia) | Bradshaw, *The Search for the Origins of Christian Worship* (Oxford, 2002) pp.1–30; Septuagint *leitourgia* for Temple service (LXX 1 Chr 23:28, 26:30) | Same four-component structure across the civic-to-liturgical transformation: designated minister ($\lambda$), prescribed rite ($\varphi$), assembled congregation ($C$), consecrated cost $\kappa$. The normative skeleton — positional designation, correct form, communal witness, personal cost — persists. |

## The Athenian structure

**Leitourgia** (Greek: *leitos*, public + *ergon*, work) was in classical Athens a legally required public service borne by wealthy citizens at their own expense: funding a trireme (trierarchy), equipping a dramatic chorus (choregia), provisioning a sacred embassy (theoria). Not a tax, which is distributed; not charity, which is voluntary. A positional obligation — compelled by civic standing, borne at irreversible personal cost, directed toward a specific form whose correct enactment benefited the whole community.

The structural features that persist from this civic institution:

1. **Designation by position, not choice**: the liturgical class was determined by assessed wealth. A man who crossed the wealth threshold owed the service. Nomination by a rival (*antidosis*) was the mechanism for identifying who held the position (Davies 1971).
2. **A determinate prescribed form**: not "contribute to the navy" but "provide a specific trireme, crewed and maintained, for one year." The form had a yes/no satisfaction condition. Demosthenes *Against Meidias* 21.155 documents the legal content of correct trierarchic performance.
3. **A community constituted by the performance**: the Athenian theatrical festivals were not performances for an audience that existed independently. The audience was constituted as the *demos* — the political body of Athens — by assembling in the theater and witnessing the choruses funded by the liturgy. Aristotle *Politics* 1280b30: the city is not a commercial alliance but is constituted by shared participation in its own institutions.
4. **Irreversible personal cost**: the trierarch could not recover the expenditure. This irreversibility was the liturgy's marker of genuine civic commitment — it distinguished it from a refundable levy or a performance for fee.

## The two-stage discharge

The [Incumbent](./incumbent.md) spec derives two installation stages — institution ($\sigma_t$-fixed) and induction ($\Delta_t$-fixed) — from ecclesiastical law. The leitourgia has a structurally parallel two-stage discharge:

**Form-enacted** (*perfectus actus*): The leitourgos enacts $\varphi$ in the correct form before $C$. The accumulation of relational history — the completed witnessing sieve — settles $\iota$ under the saturation nucleus: $\sigma_t(\iota) = \iota$. The past has no further demand. This corresponds to Austin's felicity condition A.2 (complete execution) — the procedure is complete.

**Forward-stable** (*perpetua effectus*): All one-step extensions of $t$ carry $\iota$ forward under the transfer nucleus: $\Delta_t(\iota) = \iota$. Every future history inherits the discharge as already-accomplished. No successor can be called upon to discharge what $\lambda$ has already discharged. This is the structural content of "once served, always served" — the discharge is not re-litigable in any extension.

| Stage | Nuclear condition | What it gives |
|---|---|---|
| Enacted only | $\sigma_t(\iota) = \iota$, $\Delta_t(\iota) \neq \iota$ | Past has recognized the form-enactment; the discharge is not yet carried into all extensions — future histories could re-open the question |
| Forward-stable only | $\Delta_t(\iota) = \iota$, $\sigma_t(\iota) \neq \iota$ | All future histories carry the discharge forward; the accumulated past has not yet fully recognized it as correctly enacted — anomalous, normally impossible without form-enactment first |
| Full discharge | $\iota \in H^*_t$ | Both: past-settled and forward-stable; the community inherits the enacted service across all extensions; no nucleus can demand more |

The ordering $\sigma_t(\iota) = \iota$ before $\Delta_t(\iota) = \iota$ is the normal sequence: the past settles the enactment as correctly executed, and then the transfer nucleus carries that settled state forward. The reverse order — forward-stable before past-recognized — is structurally anomalous, as $\Delta_t$ is extensive ($\iota \leq \Delta_t(\iota)$) and idempotent, but whether the saturation nucleus automatically settles what the transfer nucleus already carries is not yet derived; see the first open question.

## Community-constitution as sheaf amalgamation

The original formulation described community-constitution as "a formal correlate in sheaf theory" — an analogy. This section states the hypothesis precisely enough to be a derived claim or a forced open question.

**Hypothesis.** The witnessing community $C$ at history $t$ is constituted as follows: a family of local witnessing observations $\{w_i : 1 \to H_{t_i}\}_{i \in I}$ — one at each history $t_i$ in a covering sieve $S \in J(t)$ — forms a **compatible family** iff $H(f)(w_j) = H(f')(w_i)$ whenever $f : t_k \to t_i$ and $f' : t_k \to t_j$ are morphisms in $S$. The sheaf axiom ([fiber doctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md)) guarantees that every compatible family has a unique amalgamation $w : 1 \to H_t$ — a global section. The community $C$ is the entity indexed by this global amalgamation: it exists as a unified entity iff the witnessing observations cohere across a cover.

Before the covering sieve assembles, there are local witnesses but no community. The community comes into existence at the moment the compatible family becomes a global section. This is the formal content of Bell's claim that ritualization constitutes the community: the sheaf gluing IS the constitution.

The claim that $\iota \in H^*_t$ requires this community-constitution is the critical addition: not only must the enactment occur, but the witnessing sieve must cohere. An enactment witnessed by an incoherent family — one that cannot be amalgamated — does not discharge the leitourgia, because there is no community before whom discharge could be recognized. Austin's felicity condition B.1 (*How to Do Things with Words*, 1962, p.15): "the particular persons and circumstances in a given case must be appropriate for the invocation of the particular procedure invoked." Inappropriate witnesses = incomplete cover = no amalgamation = no community = no discharge.

## Leitourgia levels

Four levels of discharge stability, from least to most complete:

| Level | Condition | What it names |
|---|---|---|
| **Designated / pending** | $\iota \in H_t$, $\iota \notin \mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t)$ | $\lambda$ is designated and the obligation exists as a proposition in $H_t$, but neither form-enacted nor forward-settled; the service is owed but not yet rendered |
| **Form-enacted** ($\sigma_t$-settled only) | $\sigma_t(\iota) = \iota$, $\Delta_t(\iota) \neq \iota$ | The enactment has been performed and the accumulated past recognizes it; the discharge is not yet forward-inherited — future extensions could reopen the record |
| **Forward-stable only** | $\Delta_t(\iota) = \iota$, $\sigma_t(\iota) \neq \iota$ | All future histories inherit the discharge; the past has not yet settled the recognition — structurally anomalous |
| **Fully discharged** | $\iota \in H^*_t$ | Doubly stable — past-recognized and future-inherited; neither nucleus can demand more; the service is permanently complete |

## Personal cost and the Landauer connection

The Landauer cost $\mathcal{L}_s(t)$ is not a separate formal parameter but arises from the step structure. When the enactment step $s$ fires — settling $\iota$ in $H_{s \star t}$ — the counit $\varepsilon_s(t) : H_{s \star t} \to H_t$ restricts the new fiber back to the old. The kernel $\mathcal{K}_s(t) = \ker(\varepsilon_s(t))$ is the sub-Heyting-algebra of propositions settled by $s$ that do not carry back. These propositions enter the community's fiber (at $s \star t$) but are invisible from $H_t$ — they are the service's contribution to the community that the leitourgos cannot reclaim.

The Landauer bound then gives the thermodynamic cost:

$$\Delta\mathcal{E}_{\mathrm{Landauer}}(t, s) \;\geq\; \varepsilon_{\min} \cdot T_{\mathrm{thermo}}(t) \cdot \mathcal{L}_s(t)$$

where $\varepsilon_{\min}$ is the minimum spectral drop (the relational cost constant) and $T_{\mathrm{thermo}}(t) = M_t(\delta)$ is the spectral temperature at $t$. The personal cost is bounded below by $\varepsilon_{\min} \cdot T_{\mathrm{thermo}}(t) \cdot \mathcal{L}_s(t)$. An enactment step with $\mathcal{L}_s(t) = 0$ — one that settles nothing that does not already carry back — has zero Landauer cost and therefore zero personal cost. Such a step cannot be a genuine leitourgia: no cost, no positional discharge.

**The irreversibility condition.** A leitourgia with full discharge $\iota \in H^*_t$ and $\mathcal{L}_s(t) > 0$ is irreversible in two senses simultaneously: the nucleus fixed-point condition means no further normative demand can be made ($\sigma_t$ and $\Delta_t$ are already satisfied), and the Landauer cost means the spectral information produced by the step is permanently deposited in the community's fiber. The leitourgos cannot retrieve what the step cost. These two irreversibilities are structurally connected — both arise from the step $s$ — but whether they are formally the same irreversibility or two independent ones is the third open question below.

## Theological development

The Septuagint uses *leitourgia* for Temple priestly service (1 Chr 23:28; 26:30; Num 8:22); the New Testament and patristic literature extend it to corporate worship. The structural transformation: the designated minister enacts a prescribed form before the assembly; the cost shifts from financial (trierarchy's outlay) to consecrated time, purity, and submission to form; the recipient shifts from the city to the divine. Bradshaw (*The Search for the Origins of Christian Worship*, Oxford, 2002, pp.1–30) traces how the Eucharist inherits the positional-designation structure from both civic and Temple antecedents.

The invariant structure persists across this transformation: designated leitourgos ($\lambda$), prescribed form ($\varphi$), community constituted by the assembly's witnessing ($C$), personal cost ($\kappa$). The nuclear conditions — $\sigma_t(\iota) = \iota$ (recognized by the accumulated normative past) and $\Delta_t(\iota) = \iota$ (inherited by all future histories of the community) — map onto the distinction between valid celebration (*perfecta execitio*) and the permanent effect of valid celebration (*character indelebilis* in sacramental theology: the priesthood, once conferred, cannot be rescinded). Whether this theological extension generates derivable claims or remains interpretive is an open question of the same kind as the institution/induction mapping in [Incumbent](./incumbent.md).

## Open questions

- **Whether the covering sieve $J$ encodes social witnessing**: The community-constitution hypothesis states that the witnessing family must form a $J(t)$-covering sieve for amalgamation to occur. But the Grothendieck topology $J$ on $T$ is defined by the step-commutation and history-extension axioms of the history site — it is not defined by social witnessing. Whether social witnessing (the presence of the relevant witnesses at $t$) is captured by the existing $J$, or whether a leitourgia-specific enrichment of the site is required — a second topology $J_{\mathrm{witness}}$ alongside $J$, or a morphism of sites — is not yet derived. If two topologies are required, community-constitution in the leitourgia sense cannot be expressed within the existing site structure and requires a bisite or a morphism of Grothendieck sites.

- **Whether $\sigma_t$-settlement entails $\Delta_t$-settlement for discharge propositions**: The two-stage table above lists form-enacted ($\sigma_t$-fixed) and forward-stable ($\Delta_t$-fixed) as independent conditions. But the [commuting nucleus pair](../math/relational-history-fiber-commuting-nucleus-pair-submonoid.md) condition — $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ — plus the extensive and idempotent properties of both nuclei, may suffice to show that for discharge propositions of a specific type (those of the form "λ enacted φ before C"), $\sigma_t(\iota) = \iota$ implies $\Delta_t(\iota) = \iota$. If this implication holds for the discharge proposition specifically, the two-stage distinction collapses to a single condition for leitourgia and the distinction from [Incumbent](./incumbent.md) is formal, not substantive. This derivation requires characterizing which propositions in $H_t$ behave this way, and is not yet carried out.

- **Whether the leitourgos's personal cost is formally identical to the Landauer cost of the step**: The hypothesis identifies the personal cost $\kappa$ borne by $\lambda$ with $\mathcal{L}_s(t)$ — the spectral mass of the kernel of the counit. This is motivated: the step $s$ produces information (settles propositions in $H_{s \star t}$) that does not return to $H_t$; the leitourgos, occupying the position that fires $s$, bears that irreversible production. But this identification requires a model of what it means for $\lambda$ — an Entity at $t$ — to bear the cost of a step that produces a fiber at $s \star t$. Whether the Entity $\lambda$ is formally the system that undergoes the erasure (identifying $\lambda$'s resource expenditure with the kernel's spectral mass) or merely occupies the position that triggers the step is not yet derived. Without this derivation, the Landauer cost remains a structural analog of personal cost rather than a formal identification.

## Key references

Austin, *How to Do Things with Words* (Oxford, 1962), pp.14–15, 121; Searle, *Speech Acts* (Cambridge, 1969), pp.33–42; Bell, *Ritual Theory, Ritual Practice* (Oxford, 1992), pp.69–93; Olson, *The Logic of Collective Action* (Harvard, 1965), p.2; Landauer, "Irreversibility and Heat Generation in the Computing Process," *IBM Journal of Research and Development* 5:183–191 (1961); Davies, *Athenian Propertied Families 600–300 BC* (Oxford, 1971); Demosthenes *Against Meidias* 21.155; Lysias *Against Mantitheus* 16.14; Durkheim, *Les Formes élémentaires de la vie religieuse* (Paris, 1912), pp.225–272; Bradshaw, *The Search for the Origins of Christian Worship* (Oxford, 2002), pp.1–30; Artin–Grothendieck–Verdier, SGA4 I §1 (1972).
