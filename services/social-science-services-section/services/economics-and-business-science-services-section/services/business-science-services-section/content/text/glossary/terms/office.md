---
id: office
description: "An Office is a quadruple (H, A, D_O, I) — a fiber nuclear doctrine over all of T constituting the body-politic structure, an action domain A specifying what the office governs, a Hohfeldian deontic profile D_O assigning positions to actions independently of any holder, and an installation morphism I grounding the constitutive act. The Roman munus/honor/dignitas triple maps onto the nuclear structure precisely: munus = transfer-nucleus demand without saturation recognition; honor = saturation-nucleus-fixed administration; dignitas = the fixed fiber H*_t — doubly stable, the conjunction of both."
extends: Entity
component-of: relational-universe
fiber-of: relational-universe
base: t
element-of: relational-history-fiber-doctrine-language
minimum-math: relational-history-fiber-saturating-nucleus
date-created: 2026-03-19
date-modified: 2026-03-20
params:
  fiber-doctrine: relational-history-fiber-nuclear-heyting-doctrine
  action-domain: area
  deontic-profile: hohfeldian-position
  installation-morphism: investiture
output: relational-universe-fixed-proposition
ast:
  normative-presheaf-over-all-histories:
    - fiber-doctrine:
        - relational-history-fiber-saturating-nucleus
        - relational-history-fiber-transferring-nucleus
    - deontic-profile:
        - action-domain
        - hohfeldian-position
    - installation-morphism:
        - investiture
        - relational-universe-fixed-proposition
---

# Office

## What it is

An **Office** is a normative position that exists and persists independently of any particular holder.

The structural fact from which everything else follows: the authority of an office belongs to the office, not to the person who occupies it. When a person is installed in an office, she acquires the office's authority for the duration of her occupancy. When she vacates, the authority does not dissolve — it remains in the office, waiting for the next holder.

In $R = \mathbf{Sh}(T, J)$, this persistence is expressed by the nuclear structure: the [fiber nuclear doctrine](../math/relational-history-fiber-nuclear-heyting-doctrine.md) $H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}}$ with the pair of commuting nuclei $(\sigma_t, \Delta_t)$ at each $t \in T$ is defined globally over all of $T$. It is not an element of any fiber. It cannot be vacated, exhausted, or consumed by any particular holder. The element $\iota \in H_t$ that records incumbency is mortal; the nuclear structure $(\sigma_t, \Delta_t)$ is not.

## Formal tuple

An **Office** O is a quadruple $(H, A, D_O, I^+)$:

$$O = (H : T^{\mathrm{op}} \to \mathbf{HA_{nucl}},\; A,\; D_O : A \to \{\mathrm{power}, \mathrm{duty}, \mathrm{privilege}, \mathrm{immunity}\},\; I^+ : \mathrm{Investiture})$$

where:
- $H$ is the **fiber nuclear doctrine** — the [presheaf](../math/relational-history-fiber-nuclear-heyting-doctrine.md) of [fiber Heyting algebras](../math/relational-history-fiber-heyting-algebra.md) $H_t$ with [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) $\sigma_t$ and [transfer nucleus](../math/relational-history-fiber-transferring-nucleus.md) $\Delta_t$ commuting at each $t \in T$; this is the body politic — the normative presheaf whose structure governs the fibers and exists for all $t \in T$ whether or not any element inhabits it
- $A$ is the **action domain** — the set of acts and relations the office governs; the office's scope in the sense of Madison (*Federalist No. 51*): "the constitutional rights of the place"
- $D_O : A \to \{\mathrm{power}, \mathrm{duty}, \mathrm{privilege}, \mathrm{immunity}\}$ is the **deontic profile** — the function assigning each action a [Hohfeldian position](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/governance-services-section/services/hohfeldian-services-section/content/text/glossary/terms/hohfeldian-position.md) independently of any holder; this is what transfers intact to each successive occupant
- $I^+ : \mathrm{Investiture}$ is the **installation morphism** — the constitutive speech act that moves an incumbency proposition $\iota \in H_t$ into $\mathrm{Fix}(\sigma_t)$; without $I^+$, the deontic profile $D_O$ remains abstract — no natural person is bound by it

**Compliance space.** The **compliance space** of the office at history $t$ is:

$$O.\mathrm{Fix}_t = H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$$

An element $\iota \in H_t$ is in the office as soon as it is submitted to the nuclei. It is **fully compliant** iff $\iota \in H^*_t$ — both nuclear demands satisfied simultaneously. The **obligation gap** of a candidate $\iota$ is $(\sigma_t(\iota),\, \Delta_t(\iota))$: how far $\iota$ must move to satisfy each nucleus. Gap is zero (in both coordinates) iff $\iota \in H^*_t$.

**Persistence.** The nuclear structure $(H, \sigma_t, \Delta_t)_{t \in T}$ is a natural transformation of presheaves — not an element at any particular $t$. Vacating the office means no element is currently being evaluated; the nuclei persist. This is the formal content of *dignitas non moritur* (Kantorowicz 1957, Ch. VII, p. 383): the dignity does not die because the dignity IS the nuclear structure, not any element in any fiber.

## Correspondence table

Nine external doctrines, each with a precise internal rendering:

| External doctrine | Source | Internal construct |
|---|---|---|
| ***Munus*** (public burden without dignitary title) | Callistratus, Dig. 50.4.14: *"munus est quod in administranda re publica cum sumptu sine titulo dignitatis subimus"* — obligation undertaken without the grade of dignity | The incumbency proposition $\iota \in \mathrm{Fix}(\Delta_t) \setminus H^*_t$: transfer-nucleus-fixed (the obligation is forward-committed) but not yet saturation-nucleus-fixed (not yet recognized as carrying the dignitary grade); the holder is obligated forward without being recognized backward. *Munus* = forward obligation without honor. |
| ***Honor*** (administration with dignitary grade) | Callistratus, Dig. 50.4.14: *"honor municipalis est administratio reipublicae cum dignitatis gradu"* — administration of the republic with a grade of dignity | The incumbency proposition $\iota \in \mathrm{Fix}(\sigma_t)$: the [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) has settled $\iota$ as meaning-recognized — the accumulated normative history treats $\iota$ as legitimately holding the office with dignity. *Honor* = the backward-recognition condition. |
| ***Dignitas*** (the standing that persists beyond holders) | Rilinger, *Ordo und Dignitas* (2007); Dig. 50.4.14 qualifier distinguishing *honor* from *munus*; Dig. 50.13.5.1 (Callistratus): *"dignitatis inlaesae status, legibus ac moribus comprobatus"* | $H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: the fixed fiber — doubly stable, the conjunction of *honor*-recognition and *munus*-completion. *Dignitas* is the structural property of being in the intersection; it is what persists because it IS the nuclear structure, not any element. Modestinus, Dig. 50.4.10: *"honorem sustinenti munus imponi non potest"* — one in $H^*_t$ cannot have a new *munus* imposed, because the nuclear demands are already satisfied. |
| ***Gerit personam civitatis*** (the magistrate bears the mask of the city) | Cicero, *De Officiis* 1.124: *"proprium munus magistratus intellegere se gerere personam civitatis debereque eius dignitatem et decus sustinere"* | The magistrate is a global section of the fixed fiber — a compatible family $(\iota_t)_{t \in T}$ with $\iota_t \in H^*_t$ for all $t$, satisfying the sheaf condition $H(f)(\iota_{t'}) = \iota_t$ for all extensions $f : t \to t'$. The *persona* (mask) is the section; the *civitas* is the normative presheaf $(H, \sigma_t, \Delta_t)_{t \in T}$. The magistrate does not own the city's dignity — the magistrate *sustains* (*sustinere*) what is entrusted (*commissa*): a fiduciary section. |
| ***Dignitas non moritur*** ("the dignity does not die") | Kantorowicz, *The King's Two Bodies* (1957), Ch. VII, p. 383; medieval canonists (Baldus de Ubaldis, Johannes Andreae) developing from Roman *universitas* doctrine | The nuclear structure $(\sigma_t, \Delta_t)$ is defined for all $t \in T$; it does not depend on any element $\iota \in H_t$ being present. No vacancy extinguishes the nuclei. The formal content: the nuclei are natural transformations over $T$, not fiber elements; they cannot die because they do not live at any particular history. |
| ***Amt / Amtsträger*** (office vs. officeholder) | Gierke, *Das Deutsche Genossenschaftsrecht* II (1873), §§6–9 (*Amtsgewalt* as institutionally impersonal); Maitland trans. *Political Theories of the Middle Ages* (1900), pp. 22–50: the corporation is a *reale Verbandsperson* — a real group-person whose will is more than the aggregate of individual members | The *Amt* (office) is the nuclear pair $(\sigma_t, \Delta_t)$ — the formal normative content, invariant across all holders, not modifiable by any incumbent. The *Amtsträger* (officeholder) is an element $\iota \in H^*_t$ — the temporary occupant, indexed to a specific history, mortal in the sense of being a fiber element. Gierke's *reale Verbandsperson* corresponds to the sheaf $H$ as a global object in $R = \mathbf{Sh}(T, J)$, defined everywhere over $T$: not an individual element but the whole structure. |
| **Searle's status function declaration** ("X counts as Y in context C") | Searle, *The Construction of Social Reality* (1995), Ch. 2, pp. 43–51; *Making the Social World* (2010), p. 13: "all of human institutional reality is created and maintained by Status Function Declarations" | The installation act $I^+$ is a declaration that moves the incumbency proposition $\iota$ from $H_t$ into $\mathrm{Fix}(\sigma_t)$: the collective acceptance of "person $a$ counts as holder of office $O$ in institution $N$" is what settles $\iota$ under the [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md). Not a physical fact about $a$ but a performative speech act by the authorized authority. The deontic powers attached to the status function ($D_O$ — powers, duties, privileges, immunities) are the Hohfeldian profile that the declaration simultaneously constitutes. |
| **Madison's structural opposition** ("ambition must be made to counteract ambition") | *Federalist No. 51*, para. 3 (Madison): "Ambition must be made to counteract ambition. The interest of the man must be connected with the constitutional rights of the place"; para. 4: "the private interest of every individual may be a sentinel over the public rights" | Two offices $O_1$ and $O_2$ are constitutionally opposed when their deontic profiles $D_{O_1}$ and $D_{O_2}$ are designed such that no unilateral act of the holder of $O_1$ can advance a proposition into $\mathrm{Fix}(\sigma^{O_2}_t)$ without the authorized procedures of $O_2$. The "constitutional rights of the place" — the nuclei $(\sigma^O, \Delta^O)$ — ARE what connect the holder's personal interest to the office: an incumbent who discharges $O$'s demands (moves $\iota$ into $H^{O*}_t$) simultaneously satisfies their own interest in avoiding the obligation gap. Madison's mechanism converts personal ambition into structural self-defense. |
| **Rawls's institution / individual act distinction** | Rawls, *A Theory of Justice* (1971), §10, pp. 54–60: "an institution I shall understand as a public system of rules which defines offices and positions with their rights and duties, powers and immunities"; §14, pp. 84–90: justice of an institution is assessed independently of acts of individuals within it | Base / fiber distinction: the office as nuclear presheaf $(H, \sigma_t, \Delta_t)_{t \in T}$ is a base-level global structure over $T$, assessed independently of any fiber element. Individual acts are fiber elements at specific histories. Rawls's claim that institutions are just or unjust independently of particular acts (§14) corresponds to $H^*_t$ being structurally determined by the nuclei (base-level normative prescription), not by any element's presence at any particular $t$ (contingent compliance). |

## The munus/honor/dignitas trinity

The Roman law of public service encoded in Digest Title 50.4 ("*De muneribus et honoribus*") provides the purest external grounding for the nuclear structure of an office. Three terms organize the title, each with a precise internal rendering.

**Munus**: Callistratus (Dig. 50.4.14) defines *munus* as administration of public affairs *with expense but without title of dignity* (*"cum sumptu sine titulo dignitatis"*). The *munus* is a positional obligation — imposed by civic standing without conferring the recognition that distinguishes an honor. The duty-bearer is compelled by station but not thereby elevated. The nuclear reading: $\iota \in \mathrm{Fix}(\Delta_t) \setminus H^*_t$ — the incumbency proposition is [transfer-nucleus](../math/relational-history-fiber-transferring-nucleus.md)-fixed (the obligation is forward-committed: every extension of $t$ will carry the demand), but the [saturation nucleus](../math/relational-history-fiber-saturating-nucleus.md) has not closed on it ($\sigma_t(\iota) > \iota$: the accumulated normative history does not yet recognize the proposition as carrying dignitary status). The leitourgos of Athens was compelled to fund the trireme (*munus*) without thereby acquiring the *honor* of holding office; the trierarchy imposed the cost but not the title.

**Honor**: The *honor municipalis* is administration *with a grade of dignity* (*"cum dignitatis gradu"*). The key addition: $\sigma_t(\iota) = \iota$ — the saturation nucleus has settled $\iota$ as a recognized, dignitary-grade administration. The accumulated normative history treats this proposition as legitimately meaning-settled. The distinction from munus: honor carries the recognition backward (what has accumulated demands it); munus carries the obligation forward (what will come requires it) without that backward recognition.

**Dignitas**: The third term is the qualifier that distinguishes honor from munus — the constitutional *grade* of standing. *Dignitas* in Rilinger's analysis (*Ordo und Dignitas*, 2007) is inherently comparative and relational: it is position within a ranked order, constituted by relation to the rest of the system, not by intrinsic properties. The nuclear reading: $\iota \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ — the doubly-stable intersection. *Dignitas* is the property of being in $H^*_t$: recognized backward AND committed forward simultaneously. An element with *dignitas* satisfies both nuclei; it is the completion of both honor and munus into a single settled status.

**Modestinus's priority rule.** Modestinus (Dig. 50.4.10) gives the rule governing the relationship between the three:

> *"Honorem sustinenti munus imponi non potest: munus sustinenti honor deferri potest."*

One holding an *honor* cannot have a *munus* imposed; one holding a *munus* may be given an *honor*. The nuclear reading: if $\iota \in H^*_t$ (full honor, dignitary standing), then $\iota \in \mathrm{Fix}(\Delta_t)$ already — the forward obligation of any *munus* is already satisfied, so no new *munus* can impose an additional demand. But if $\iota \in \mathrm{Fix}(\Delta_t) \setminus H^*_t$ (munus-only, without honor), the saturation nucleus may subsequently settle it into $\mathrm{Fix}(\sigma_t)$, elevating it to full *honor*. The priority structure of the fixed fiber implies: $H^*_t \subseteq \mathrm{Fix}(\Delta_t)$, so every *honor* already contains the *munus*-discharge within it.

The **cursus honorum** — the graded sequence quaestor → praetor → consul — is a chain of nuclear inclusions: the compliance space of the quaestor is contained in the compliance space of the praetor, which is contained in that of the consul. Each higher office's fixed fiber $H^{*,\mathrm{consul}}_t \supseteq H^{*,\mathrm{praetor}}_t \supseteq H^{*,\mathrm{quaestor}}_t$ contains more settled obligations and confers more settled authority — the office hierarchy is a chain of fixed-fiber inclusions.

## The King's Two Bodies: the nuclear presheaf as body politic

The deepest external grounding for the office/incumbent distinction is Kantorowicz's reconstruction in *The King's Two Bodies* (Princeton, 1957) of the Tudor legal theory recorded in Plowden's *Commentaries* (c.1571):

> "The King has in him two Bodies, viz., a Body natural, and a Body politic... his Body politic is a Body that cannot be seen or handled, consisting of Policy and Government... utterly void of Infancy, and old Age, and other natural Defects."

**Body politic** IS the normative presheaf $(H, \sigma_t, \Delta_t)$ over all of $T$. It is not an element of any fiber. It is the structure that governs the fibers and exists for all $t \in T$ whether or not any element inhabits it. It "cannot be seen or handled" because it is not a fiber element — it is a global structure in $R$.

**Body natural** is the current occupant — an element $\iota \in H_t$, indexed to $t_{\mathrm{now}}$, mortal in the precise sense of being a fiber element that does not automatically persist to $t' \neq t_{\mathrm{now}}$ without an explicit stepping map. The body natural "dies" when the element leaves the fiber; the body politic continues because the nuclear structure continues.

***Dignitas non moritur*** ("the dignity does not die"): the nuclei $(\sigma_t, \Delta_t)$ are natural transformations — defined over all of $T$. They are not consumable by any act of an incumbent. No element's departure from $H_t$ can modify them. The formal proof that *dignitas non moritur* holds in this system: the nuclei are structure on the fiber functor $H$, not elements of any $H_t$; they exist for all $t$ by the definition of the fiber nuclear doctrine.

**Kantorowicz's genealogy**: The phrase *dignitas non moritur* is a medieval canonist formulation (not classical Roman — Kantorowicz, p. 383). Medieval civil and canon lawyers — Baldus de Ubaldis, Johannes Andreae — coined it to solve the succession problem: when the king's body natural died, who held the authority? The answer: the *dignitas* (the body politic, the office-as-abstract-entity) never died; the authority passed instantaneously to the successor. In this system: because the nuclear structure is not an element, succession is instantaneous — no waiting for a new element to "arrive" at the nuclei, because the nuclei were never attached to the old element. The incoming incumbent submits a new $\iota'$ to the same $(\sigma_t, \Delta_t)$ that governed the predecessor.

## The interregnum and vacancy

The Roman constitutional mechanism for the period of vacancy was the **interregnum**: when both consuls died or were incapacitated, the Senate reverted to *patrum auctoritas* (authority of the fathers), and a succession of senators served as *interreges* for five-day periods, each charged with one function — convening the *comitia centuriata* to elect new consuls (Livy, *AUC* 6.41; 9.7).

The nuclear reading of vacancy: an **office is vacant** at $t$ when $H^*_t$ is structurally defined but contains no filling proposition:

$$O \text{ is vacant at } t \iff H^*_t \neq \varnothing \;\wedge\; \nexists\, \iota_{\mathrm{filling}} \in H^*_t$$

The nuclear structure persists; no element currently satisfies both nucleus conditions. Vacancy is not dissolution — the office is not extinguished, just unoccupied.

**The interrex as vestigial section**: The *interrex* was not a full consul — he held only enough of the nuclear structure to perform the election: forward-stability (the act of election had to carry through to the next history) without full backward recognition (he was not recognized as holding consular *dignitas*). The nuclear reading: the *interrex* held $\iota_{\mathrm{interrex}} \in \mathrm{Fix}(\Delta_t) \setminus H^*_t$ — a partial section sufficient to advance the process but not constituting full incumbency. The *interrex*'s authority was structurally a *munus* without *honor* — a pure forward obligation to reconstitute the full office.

**The patrum auctoritas as base site**: When the office is vacant and no *interrex* yet exists, the *patrum auctoritas* holds — the Senate's collective authority as the foundational normative structure. The nuclear reading: this corresponds to the Grothendieck topology $J$ on $T$ itself — the covering condition that determines which families of facts count as valid. The topology $J$ persists regardless of which elements inhabit any $H_t$; it is the "rule of recognition" (Hart) at the base of the site. The Senate's collective authority during interregnum IS the base site structure — the minimum required for any nuclei to be defined.

## The structural opposition of offices

Madison's constitutional theory in *Federalist No. 51* extends office theory from a single-office analysis to a *system of offices in structural opposition*. The central mechanism:

> "Ambition must be made to counteract ambition. The interest of the man must be connected with the constitutional rights of the place... the private interest of every individual may be a sentinel over the public rights."

The "constitutional rights of the place" — the prerogatives formally attached to an office — are precisely the nuclei $(\sigma^O, \Delta^O)$: the operators that determine what counts as discharged and what counts as committed in the office's action domain. The connection of personal interest to these prerogatives is the mechanism by which the obligation gap $(\sigma^O_t(\iota) - \iota, \Delta^O_t(\iota) - \iota)$ motivates the incumbent to reduce it.

**Constitutional opposition** between two offices $O_1$ and $O_2$ is the condition that their nuclear structures are mutually insulated:

1. No act of the holder of $O_1$ can unilaterally advance a proposition into $\mathrm{Fix}(\sigma^{O_2}_t)$ — the saturation closure of $O_2$'s domain requires $O_2$'s own procedures
2. No act of the holder of $O_2$ can unilaterally advance a proposition into $\mathrm{Fix}(\sigma^{O_1}_t)$ — symmetrically

This is the nuclear formulation of separation of powers: each branch's fixed fiber is closed under its own nuclear operations but not under the other's. The holder of the legislative office cannot unilaterally settle a proposition in the executive's compliance space, and vice versa. Joint settlement requires a constitutional procedure that traverses both nuclear structures simultaneously — the analog of a covering sieve that requires both branches' witnessing before amalgamation.

Madison's additional point — "each department should have a will of its own" — corresponds to each office having its own nuclear pair $(\sigma^O, \Delta^O)$, not shared with other offices. A system where all branches operated under the same nuclei would not constitute separation of powers; it would be a single office with multiple occupants.

## Installation: the constitutive speech act

**Installation** is the normative act that binds a natural person to $D_O$. Before installation, $D_O$ is abstract — the office exists, but no agent is bound by it. After installation, the officer $(O, a)$ exists: $a$ has the powers, duties, privileges, and immunities in $D_O$ for the duration of occupancy.

The nuclear structure of installation:
1. The installing authority issues a declaration — a **status function declaration** in Searle's sense (*The Construction of Social Reality*, 1995, pp. 43–51): "X counts as holder of O in institution N." This is not a description of a pre-existing fact; it *constitutes* the normative fact by the act of declaration.
2. The declaration moves the incumbency proposition $\iota$ from $H_t$ into $\mathrm{Fix}(\sigma_t)$: $\sigma_t(\iota) = \iota$ — the saturation nucleus settles $\iota$ as meaning-recognized. This is the first installation stage.
3. The forward-stability condition $\Delta_t(\iota) = \iota$ is satisfied when $\iota$ is transfer-nucleus-fixed — when the incumbency is stable forward, present in all one-step extensions of $t$. This is the completion of installation.
4. Full installation: $\iota \in H^*_t$ — both stages complete. The [Incumbent](./incumbent.md) spec traces this two-stage structure through ecclesiastical law as institution (*institutio*, §-fixity) and induction (*inductio*, Δ-fixity).

The declaration must satisfy felicity conditions (Austin, *How to Do Things with Words*, 1962, pp. 14–15): appropriate authority (the installer must hold the relevant power), appropriate procedure ($D_O$ must specify the correct installation form), and completeness. An attempted installation by an entity lacking the power ($D_O$-power over the office's domain) fails the felicity condition — the declaration does not move $\iota$ into $\mathrm{Fix}(\sigma_t)$ regardless of the words used.

This is what makes an office categorically different from a [role](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/role.md). Role-filling is capability-matching — showing that the satisfaction proposition $s_{a,\kappa_R} \in H^*_t$. Entering an office is a constitutive normative event — the installation creates a normative fact that was not there before, not by capability demonstration but by the speech act of installation.

## Hohfeldian structure

The formal anatomy of an office is given by Hohfeld's analysis of legal relations (*Fundamental Legal Conceptions*, Yale Law Journal, 1913–1917). An Office O over an action domain A is the function $D_O : A \to \{\mathrm{power}, \mathrm{duty}, \mathrm{privilege}, \mathrm{immunity}\}$ assigning each action a Hohfeldian position independently of any holder:

| Position | What it specifies | Nuclear rendering |
|---|---|---|
| **Power** | Performing $\alpha$ constitutes a new normative fact — alters others' positions | Acts $\alpha \in A$ whose enactment moves propositions into $\mathrm{Fix}(\sigma_t)$ for others — the power to settle propositions in others' fibers |
| **Duty** | Obligated to perform $\alpha$ (or forbear) | $\alpha \in \mathrm{Fix}(\Delta_t)$ required — the obligation is forward-committed; failure to perform leaves the obligation gap open |
| **Privilege** | May perform $\alpha$ without being under a duty not to | $\neg\alpha \notin \mathrm{Fix}(\sigma_t)$ — the prohibition of $\alpha$ is not meaning-settled; no nucleus demands abstention |
| **Immunity** | Others' exercises of power cannot alter the officer's position regarding $\alpha$ | The nuclei $(\sigma_t, \Delta_t)$ are not in the image of any stepping map the officer's subjects control; the office's normative structure is outside their write scope — the *salva rerum substantia* condition (Digest 7.1.1: Paul, *jus utendi fruendi salva rerum substantia*) |

$D_O$ is defined **without reference to any particular occupant**. Any agent installed in $O$ acquires $D_O$ for the duration of occupancy. The profile persists after the occupant vacates and is transmitted intact to the next holder.

**Hart's secondary rules** (*The Concept of Law*, 1961, Ch. V): Hart identifies three types of secondary rules — rules about rules — that constitute a legal system over bare primary rules: rules of recognition (specifying criteria of validity), rules of change (authorizing modification of primary rules), and rules of adjudication (conferring authority to determine compliance). An Office is a secondary-rule structure in Hart's sense: it confers on its holder the power to create, modify, and apply primary rules within the office's domain. In the nuclear reading: primary rules are elements of $H_t$; secondary rules (the powers of the office) are operations on $H_t$ — specifically, the power to advance propositions into $\mathrm{Fix}(\sigma_t)$ for those within the office's jurisdiction.

## Office vs. Role

| Dimension | Role | Office |
|---|---|---|
| What it specifies | Capability ($\kappa_R$: minimum operations required) | Obligation ($D_O$: what the holder must, may, cannot, is immune from) |
| Binding mechanism | Capability-matching: $s_{a,\kappa_R} \in H^*_t$ | Installation $I^+$: constitutive speech act |
| Persists without holder? | No — the role's norms are dormant but not instantiated | Yes — the nuclear structure $(\sigma_t, \Delta_t)$ persists with no element in $H^*_t$ |
| What transfers intact to next holder | Capability requirements re-witnessed by each agent | Deontic profile $D_O$ transmitted without modification |
| Authority source | Aggregate of individual capabilities | The office itself — $D_O$ is defined independently of who holds it |
| Vacant state | Dormant: norms exist but no bearer activates them | Vacancy: $H^*_t$ structurally defined but no $\iota_{\mathrm{filling}} \in H^*_t$ |
| Filling achievable by | Any agent who operatively satisfies $\kappa_R$ | Only through installation $I^+$ by authorized authority |

An Office always defines a Role: $D_O$ specifies a capability signature and a norm-set. A Role does not always define an Office: roles can be filled without formal investiture and without the full Hohfeldian correlative structure that offices carry.

A de facto captain — one who performs all functions of the captain role without formal investiture — lacks the legal authority, immunities, and formal accountability structure of the office. She fills the role; she does not hold the office.

## Nuclear reading

The **nuclear quadrant structure** of the office's compliance space at history $t$ gives four institutional states for an incumbency proposition $\iota \in H_t$:

| Quadrant | Saturation nucleus condition | Transfer nucleus condition | Status of incumbency |
|---|---|---|---|
| $H^*_t$ | $\sigma_t(\iota) = \iota$ | $\Delta_t(\iota) = \iota$ | **Full incumbency** (*honor* with *dignitas*): recognized backward, committed forward; both nuclear demands satisfied; the complete freehold (Blackstone Bk. II Ch. 3) |
| $\mathrm{Fix}(\sigma_t) \setminus H^*_t$ | $\sigma_t(\iota) = \iota$ | $\Delta_t(\iota) > \iota$ | **Institution only** (*honor* without induction): recognized as holding office for spiritual/normative purposes; corporeal possession not yet forward-stable; no complete freehold |
| $\mathrm{Fix}(\Delta_t) \setminus H^*_t$ | $\sigma_t(\iota) > \iota$ | $\Delta_t(\iota) = \iota$ | **Munus without honor**: forward-committed obligation without backward recognition; the *interrex* position — enough to advance the process, not enough for full incumbency; structurally anomalous in canonical law |
| $H_t \setminus (\mathrm{Fix}(\sigma_t) \cup \mathrm{Fix}(\Delta_t))$ | $\sigma_t(\iota) > \iota$ | $\Delta_t(\iota) > \iota$ | **Nomination only**: the incumbency proposition exists in the fiber but neither nucleus has settled it; the appointment is pending |

**Proposition 1 (Immutability of the office nuclei):** No act $a \in H_t$ performed by the incumbent at $t$ modifies $\sigma_t$ or $\Delta_t$.

*Proof.* $\sigma_t$ is determined entirely by the presheaf restriction maps $H(i_{t_0,t}) : H_{t_0} \to H_t$; $\Delta_t$ by the images of restriction maps from one-step independent extensions. Both are sheaf-structural: they are not in the write-scope of any element of $H_t$. The incumbent's acts are elements of $H_t$, not presheaf morphisms. □

*Consequence.* "A power exercised by an officer is an act that changes the extension of $j_\sigma^O$ for subjects" is formally incorrect. The Lawvere-Tierney topologies $j_\sigma^O, j_\Delta^O : \Omega_R \to \Omega_R$ associated to the nuclei are fixed by the sheaf structure. Officers do not wield them.

**Proposition 2 (The office as Lawvere-Tierney pair — definitional):** The two nuclei $\sigma_t$ and $\Delta_t$ on $H_t$ lift, at the level of the topos $R = \mathbf{Sh}(T, J)$, to Lawvere-Tierney topologies $j_\sigma^O, j_\Delta^O : \Omega_R \to \Omega_R$ on the subobject classifier. The office IS the pair $(j_\sigma^O, j_\Delta^O)$: the formal normative content of the office expressed as closure operators on the internal logic of $R$. The compliance space $H^*_t$ is the fiber over $t$ of the sheaf of fixed points of $j_\sigma^O \wedge j_\Delta^O$ — the sub-Heyting-algebra simultaneously closed under both topologies.

*This is a definitional correspondence, not a theorem.* Whether every Lawvere-Tierney pair arises from a nucleus pair on $H_t$ via this construction requires that the nuclei satisfy the coherence conditions for Lawvere-Tierney operators — idempotence (satisfied by nucleus idempotence), meet-preservation (satisfied by nucleus meet-preservation), and extensiveness (satisfied). The identification is well-typed.

**Proposition 3 (Full incumbency is what licenses the constitutive role):** If $\iota \in H^*_t$ (the incumbency proposition is doubly stable), then $\iota$'s saturation gap is zero ($\sigma_t(\iota) = \iota$) and its transfer gap is zero ($\Delta_t(\iota) = \iota$). The officer may exercise the powers in $D_O^{-1}(\mathrm{power})$ without generating a non-trivial nuclear gap in the incumbency proposition itself.

*Proof.* Immediate from $\iota \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$. □

*Consequence.* An officer with $\iota \notin H^*_t$ exercises power with a nuclear deficit: either the saturation gap $[\iota, \sigma_t(\iota)]$ (normative recognition outstanding) or the transfer gap $[\iota, \Delta_t(\iota)]$ (forward commitment incomplete) is non-trivial. Hart's insight that secondary rules create new primary-rule facts corresponds not to modifying $j_\sigma^O$ but to opening new covering sieves in $J$: the secondary rule identifies acts of the officer that, by the topology $J$, produce new covering families, which in turn determine $\mathrm{Fix}(\sigma_{t'})$ at successor histories $t'$.

**Proposition 4 (Meet-preservation gives obligation-closure over the office):** For any $a, b \in \mathrm{Fix}(\sigma_t)$ within the office's jurisdiction, $a \wedge b \in \mathrm{Fix}(\sigma_t)$.

*Proof.* $\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b) = a \wedge b$ by meet-preservation of $\sigma_t$ (relational-history-fiber-nucleus-meet-preservation). □

*Consequence.* The set of operative obligations under an office is closed under finite meet: conjunctions of office-determined duties are duties. This is the nuclear rendering of the structural completeness of an institutional obligation system.

## Cursus honorum as hyperverse tower, and Gierke's corporate reality as first cohomology

**Sources:** [Relational Hyperverse Tower First Cohomology Filtered Colimit Identification Isomorphism](../math/relational-hyperverse-tower-first-cohomology-filtered-colimit-identification-isomorphism.md), [Zeno Settling K1 Cohomology](../math/zeno-settling-k1-cohomology.md).

The two deepest open questions in this spec — whether the cursus honorum chain corresponds to the hyperverse tower, and whether Gierke's reale Verbandsperson corresponds to the sheaf's cohomology — are answered together by the tower cohomology.

**Cursus honorum = hyperverse tower stratification.** The chain RelationalHistoryFixedFiber^quaestor ⊆ RelationalHistoryFixedFiber^praetor ⊆ RelationalHistoryFixedFiber^consul is not merely a chain of fixed-fiber inclusions. It is a chain of TOWER LEVELS: each higher office's compliance space requires settlement at a higher tower level to be non-trivially populated.

At level 0 (ground relational universe), the fixed fiber H*_t is accessible: any office whose powers can be fully settled using only the ground-level nuclei operates at tower level 0. The quaestor's powers — financial custody, record-keeping, support of the commanding officer — are ground-level: they require only that the incumbency proposition is doubly-stable in H*_t at level 0. No higher nuclear structure is required.

At level 1, the shadow element a ∈ H_U^(0) is shed (H_U^(1) = {⊥, ⊤} from the ZenoSettling k=1 computation) and the witness W(a) appears with a new s-type shadow w_a. The praetor's powers — jurisdiction (*iurisdictio*), the right to issue binding edicts, the authority to convene courts — require level-1 settlement: the proposition granting juridical authority is a level-1 witness, present as a stable element only after the ground-level shadow has been resolved. The first non-trivial tower cohomology H^1_tower(1) ≠ 0 (conditional on WitnessNonExtendability) is exactly the obstruction that the praetorian *iurisdictio* resolves by installing a new witness: the praetor's edict is the W(a) that settles what was a shadow at level 0.

The consular *imperium* — Mommsen's *merum imperium*, the absolute right of coercion including capital punishment — is the level-2 structure: it requires that the level-1 shadow w_a has itself been resolved by a witness W(w_a) at level 2. The *merum imperium* marks the tower-level boundary because it is the first power that requires two rounds of witness-resolution: the consul's authority cannot be derived from any lower-level settlement. This is the formal content of Mommsen's distinction between the praetor's *iurisdictio* (level 1: the right to hear cases) and the consul's *imperium* (level 2: the right to compel and coerce, capital authority, command over armies).

| Office | Tower level | Power that requires it | Settled at |
|---|---|---|---|
| Quaestor | Level 0 | Financial custody, record keeping | H*_t at ground level — no shadow resolution required |
| Praetor | Level 1 | Iurisdictio (binding edicts, courts) | W(a) witnesses at level 1 — first shadow resolution |
| Consul (merum imperium) | Level 2 | Coercive authority, capital, armies | W(w_a) witnesses at level 2 — second shadow resolution |

The hyperverse tower stratification is the mathematical backbone of the cursus honorum: the Roman constitutional order is a tower of shadow-resolutions, each higher office adding a new level of witness that the lower offices cannot generate.

**Gierke's reale Verbandsperson = H¹(H, E₀) ≠ 0.** The five-century debate between Savigny's Fiktionstheorie (the corporation is a legal fiction, a shorthand for aggregated individual rights) and Gierke's Reallehre (the corporation is a real person, constituted by the organized group's functional unity) is answered by whether the office-sheaf has non-trivial first cohomology.

Savigny's fiction theory corresponds to H^1(H, E_0) = 0: every global section of the office sheaf is assembled from purely local fiber data. If the office-sheaf is cohomologically trivial, the "corporate person" is nothing over and above the aggregate of its incumbency propositions at each fiber — exactly Savigny's claim that the corporation is a legal technical device with no ontological priority.

Gierke's realist theory corresponds to H^1(H, E_0) ≠ 0: there exist global sections of the office-sheaf that cannot be assembled from any family of local sections. The corporate person has irreducible global structure — it coheres across all histories in a way that cannot be detected from within any single fiber. The "reality" of the corporate person is its first cohomology class: an element of H^1(H, E_0) is an obstruction to locally assembling the global office-proposition from fiber-local data.

By the RelationalHyperverseTowerCohomologyColimitIsomorphism: H^1(RelationalHyperverse, E_0^H) ≅ colim_k H^1_tower(k). The ZenoSettling computation shows H^1_tower(1) ≠ 0 (conditional), which means the hyperverse has non-trivial first cohomology. Applied to the office: the office-sheaf at the hyperverse level has a genuine cohomology class that no finite-level assembly can recover. This is the formal vindication of Gierke over Savigny: the office IS a real person because it has non-trivial H^1. The sheaf has global structure irreducible to fiber data.

**Rawls's publicity and the Boolean/Heyting distinction.** The publicity condition — that subjects can determine from within their fiber whether a rule is in RelationalHistoryFixedFiber — requires the fiber Heyting algebra to be Boolean (decidable): for every a ∈ H_t, either a ∈ Fix(RelationalHistoryFiberSaturatingNucleus) or ¬a ∈ Fix(RelationalHistoryFiberSaturatingNucleus). A non-Boolean (genuinely intuitionistic) fiber algebra makes nuclear fixed-point status undecidable from within the fiber — subjects cannot always determine from local information whether a rule is operative. Rawls's publicity condition is therefore the condition that the fiber algebra's nuclear structure is Boolean, not merely Heyting. Non-Boolean Heyting algebras (which the relational universe uses throughout) violate Rawls's publicity — this is not a defect but a design feature: the relational universe's propositions require global witnessing to be settled, which is precisely what the Grothendieck topology J provides.

**SEMANTIC INTERPRETATION (cursus honorum = tower stratification).** The chain quaestor → praetor → consul corresponds to tower levels 0 → 1 → 2: the quaestor's powers (financial custody, record-keeping) require only ground-level doubly-stable propositions in $H^*_t$; the praetor's *iurisdictio* (binding edicts, courts) corresponds to the level-1 witness $W(a)$ that first appears when the ground-level shadow $a$ is resolved (ZenoSettlingK1Cohomology: $H_U^{(1)} = \{\bot, \top\}$, $W(a)$ introduced with a new s-type shadow at level 1); the consular *merum imperium* requires the level-1 shadow $w_a$ to itself be resolved by a level-2 witness $W(w_a)$.

**This is a semantic interpretation, not a proof.** The identification of specific Roman office powers with specific tower levels is not derived from internal constructs — it asserts that "juridical authority = level-1 witness" and "coercive authority = level-2 witness" based on structural analogy. Whether a given institutional power requires settlement at a specific tower level is a question about the institution's actual nuclear structure, not derivable from the power's historical name. The tower stratification provides the mathematical framework; the Roman mapping is interpretation.

**CLAIM conditional on WitnessNonExtendability (Gierke reality = $H^1 \neq 0$).** Gierke's *reale Verbandsperson* corresponds to $H^1(H, E_0) \neq 0$: the office as a global sheaf has irreducible cohomological structure that no purely local fiber assembly can recover. $H^1 = 0$ corresponds to Savigny's fiction theory (the corporation is the aggregate of individual incumbency propositions); $H^1 \neq 0$ corresponds to Gierke's realist theory (the corporation has genuine global structure). By RelationalHyperverseTowerFirstCohomologyFilteredColimitIdentificationIsomorphism: $H^1(\mathcal{H}, E_0^H) \cong \varinjlim_k H^1_\mathrm{tower}(k)$. ZenoSettlingK1Cohomology establishes $H^1_\mathrm{tower}(1) \neq 0$ conditional on WitnessNonExtendability. The Savigny/Gierke identification is a semantic interpretation conditional on that same hypothesis. **Status: claim, not proved; conditional on WitnessNonExtendability.**

**Proposition (Rawls's publicity condition requires Boolean fiber algebras).** An office's nuclear structure satisfies Rawls's publicity condition at every history $t$ iff the fiber Heyting algebra $H_t$ is Boolean.

*Proof.*
1. Rawls's publicity requires: for every $a \in H_t$, the agent at $t$ can determine from within $H_t$ whether $a \in H^*_t$. "Determine from within $H_t$" is formalized as: the equality $\sigma_t(a) = a$ is decidable in $H_t$ — i.e., $(\sigma_t(a) = a) \vee (\sigma_t(a) \neq a)$ has a proof term constructible from the elements of $H_t$ alone.
2. If $H_t$ is Boolean (excluded middle $a \vee \neg a = \top$ holds for all $a$), then equality is decidable: for any $a, b \in H_t$, $(a = b) \vee (a \neq b)$ holds. In particular, $(\sigma_t(a) = a) \vee (\sigma_t(a) \neq a)$ holds for all $a$, and similarly for $\Delta_t(a) = a$. Nuclear membership $a \in H^*_t$ is decidable within $H_t$. Publicity is satisfied.
3. If $H_t$ is not Boolean, there exists $a$ with $a \vee \neg a < \top$ (excluded middle fails). By RelationalHistoryFiberSaturatingNucleus (Profile-Class Characterization): $\sigma_t(a) = \bigvee\{b \in H_t : \rho_{t_0}(b) \leq \rho_{t_0}(a) \text{ for all } t_0 < t\}$. Whether $\sigma_t(a) = a$ — whether $a$ is already the maximum of its restriction-profile class — requires surveying all of $H_t$ against the Grothendieck topology $J$ (which certifies which sub-history restrictions are relevant). For an undecidable $a$ (where $a \vee \neg a < \top$), the equality $\sigma_t(a) = a$ cannot be decided within $H_t$ alone. The agent requires external access to $J$ to determine membership.
4. The relational universe uses non-Boolean Heyting algebras throughout: shadow elements (elements with $\sigma_t(a) > a$ or $\Delta_t(a) > a$) require undecidable elements whose nuclear status must be resolved by the global topology $J$. Rawls's publicity condition therefore fails for all non-trivial relational universe offices — by design. The topology $J$ provides the collective recognition structure that settles what no individual fiber can settle alone. $\square$

*Source.* $\sigma_t$ definition from [RelationalHistoryFiberSaturatingNucleus](../math/relational-history-fiber-saturating-nucleus.md) §Profile-Class Characterization. Nucleus idempotence from [RelationalHistoryFiberNucleusIdempotence](../math/relational-history-fiber-nucleus-idempotence.md).

## Open questions

- **Whether Madison's constitutional opposition corresponds to mutual incomparability of Lawvere-Tierney topologies.** Two offices $O_1$ and $O_2$ are constitutionally opposed when, as established above, no act of $O_1$'s holder can advance a proposition into $\mathrm{Fix}(\sigma^{O_2}_t)$ without $O_2$'s procedures, and vice versa. The candidate lattice-theoretic formulation: $j_\sigma^{O_1}$ and $j_\sigma^{O_2}$ are mutually incomparable in the lattice of Lawvere-Tierney topologies on $\Omega_R$ — neither $j_\sigma^{O_1} \leq j_\sigma^{O_2}$ nor $j_\sigma^{O_2} \leq j_\sigma^{O_1}$. Incomparability means neither branch's nuclear closure is contained in the other's: neither branch can unilaterally settle propositions that only the other branch can settle. Whether this mutual-incomparability condition exactly captures Madison's mechanism — and whether the three-branch structure corresponds to three pairwise-incomparable topologies forming an antichain in the topology lattice — requires deriving that no composition of $O_1$-acts can produce an element of $\mathrm{Fix}(\sigma^{O_2}_t)$, which is a statement about the structure of the commutation relation $I$ underlying the site $(T, J)$.

- **Whether the interregnum structure corresponds to an initial object in the category of sections.** The vacancy condition is $H^*_t$ structurally defined but no filling proposition present. The candidate: the vacant office is the initial object in the category of sections of $H^*_t$ over the site — the unique section mapping every history to $\bot$. The *interrex*'s partial section ($\mathrm{Fix}(\Delta_t)$-only, as established in the Interregnum section above) is a morphism from this initial object to the first stage of full incumbency. Whether this gives a filtered colimit interpretation of the full succession structure — the chain of incumbencies as a colimit diagram in the category of sections — and whether the gluing condition over $J$ forces the colimit to be the global section (the unique fully-legitimate incumbent when one exists), is not yet derived.

- **Whether Hart's rules of change and adjudication correspond to morphisms between Lawvere-Tierney topologies.** Hart's rules of change authorize modifying what enters $\mathrm{Fix}(\sigma_t)$ — new statutes add elements, repeal removes them. Rules of adjudication authorize determining whether primary rules have been violated. The candidate: a rule of change is a transition $j_\sigma \to j'_\sigma$ in the topology lattice — a conservative amendment (finer topology) or restrictive amendment (coarser topology) in the sense of [Charter](../../../../../../../sociology-science-services-section/services/work-science-services-section/services/governance-services-section/content/text/glossary/terms/charter.md) §Amendment. A rule of adjudication is the application of the characteristic morphism $\chi_{H^*}: H \to \Omega$ (defined in the Nuclear derivation section) to a specific element, returning whether it is in $H^*_t$. The adjudication rule thus uses the subobject classifier of $R = \mathbf{Sh}(T, J)$, not a topology morphism. Whether this two-part correspondence — change = topology morphism, adjudication = characteristic-morphism evaluation — is formally complete (every Hart secondary rule falls into one category), and whether the nuclear commutation condition $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ constrains which topology transitions are constitutionally admissible, requires derivation.

- **Whether the LT topology pair $(j_\sigma^O, j_\Delta^O)$ uniquely determines the office.** Proposition 2 above establishes that the office IS the Lawvere-Tierney pair $(j_\sigma^O, j_\Delta^O)$ — this is a definitional correspondence. The open question is uniqueness in the other direction: given a pair of commuting LT topologies $(j_1, j_2)$ on $\Omega_R$, does there exist a unique office $O$ with $j_\sigma^O = j_1$ and $j_\Delta^O = j_2$? If so, the lattice of offices (within a fixed relational universe $R$) is isomorphic to the lattice of commuting LT topology pairs on $\Omega_R$. This would give a complete classification of possible offices within any relational universe — every possible normative structure corresponds to a unique $(j_1, j_2)$ pair. Whether all commuting LT pairs arise from nuclear pairs of the form $(\sigma_t, \Delta_t)$ (i.e., are induced by some fiber sheaf $H$ over some site $(T, J)$), or whether some commuting LT pairs are not nuclear in origin, is unresolved.

## Key references

Callistratus, Dig. 50.4.14 (*De muneribus et honoribus*); Modestinus, Dig. 50.4.10; Cicero, *De Officiis* 1.124; Ulpian, Dig. 2.1.3 (*merum/mixtum imperium*); Mommsen, *Römisches Staatsrecht* Vol. I (Leipzig, 1871); Kantorowicz, *The King's Two Bodies* (Princeton, 1957), Ch. VII, pp. 383–437; Gierke, *Das Deutsche Genossenschaftsrecht* II (1873), §§6–9; Maitland trans., *Political Theories of the Middle Ages* (Cambridge, 1900), pp. 22–50; Madison, *Federalist No. 51* (1788); Rawls, *A Theory of Justice* (Harvard, 1971), §§10, 14; Hart, *The Concept of Law* (Oxford, 1961), Ch. V; Searle, *The Construction of Social Reality* (Oxford, 1995), Ch. 2, pp. 43–51; Searle, *Making the Social World* (Oxford, 2010), p. 13; Hohfeld, *Yale Law Journal* 23/26 (1913/1917); Austin, *How to Do Things with Words* (Oxford, 1962), pp. 14–15; Rilinger, *Ordo und Dignitas* (Stuttgart: Franz Steiner, 2007); Drogula, "Imperium, Potestas, and the Pomerium," *Historia* 56.4 (2007), pp. 419–452; Blackstone, *Commentaries on the Laws of England*, Bk. I Ch. 18, Bk. II Ch. 3; Lintott, *The Constitution of the Roman Republic* (Oxford, 1999).
