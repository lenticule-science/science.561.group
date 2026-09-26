---
name: "Incumbent"
description: "An Incumbent is a quadruple (O, t_now, a, ι) — an Office, a designated current history, an occupant Entity, and an incumbency proposition asserting that a holds O at t_now. Full incumbency is joint settlement of two predicates: institution (recognized authority) and induction (corporeal possession)."
extends: [entity, office]
restricts: [entity, office]
date-created: 2026-03-19
date-modified: 2026-04-28
minimum-math: relational-history-fiber-saturating-nucleus
component-of: relational-universe
fiber-of: relational-universe
base: t
element-of: entity
params:
  office: office
  current-history: relational-history
  occupant: entity
  incumbency-proposition: relational-history-fiber-heyting-algebra
output: relational-universe-fixed-proposition
ast:
  incumbency-at-history:
    - office:
        - current-history
    - occupant:
        - entity
    - incumbency-proposition:
        - relational-history-fiber-saturating-nucleus
        - relational-history-fiber-transferring-nucleus
id: incumbent
defines: Incumbent
where:
- $O = (T, J, H, \sigma, \Delta)$ is the [Office](office.md) — the normative presheaf with nuclei defined over all histories in $T$
- $t_{\mathrm{now}} \in T$ is the **current history** — the designated base point for "now"; incumbency is a relation at a specific history, not a global structure
- $a$ is the **occupant** — an [Entity](entity.md) whose id is a doubly-stable proposition in $H^*$; the natural person currently wearing the body politic
- $\iota \in H_{t_{\mathrm{now}}}$ is the **incumbency proposition** — the element of the fiber Heyting algebra asserting "$a$ holds $O$ at $t_{\mathrm{now}}$"
---

## What it is

An **Incumbent** is a quadruple $(O,\; t_{\mathrm{now}},\; a,\; \iota)$:

$$\mathrm{Inc} = (O,\; t_{\mathrm{now}} \in T,\; a : \text{Entity},\; \iota \in H_{t_{\mathrm{now}}})$$

**Type note.** The occupant $a$ is an Entity (a named individual — a section of an agent-sheaf with a doubly-stable id), not itself an element of $H_{t_{\mathrm{now}}}$. The fiber Heyting algebra $H_t$ carries propositions, not individuals (Lambek–Scott 1986, *Introduction to Higher Order Categorical Logic*; Johnstone 2002, *Sketches of an Elephant*, Part D). The incumbency proposition $\iota \in H_{t_{\mathrm{now}}}$ is the proposition about $a$; $a$ is the individual the proposition names. What the original three-component tuple conflated — occupant individual and occupancy truth value — are now distinct.

**Full incumbency** is the condition $\iota \in H^*_{t_{\mathrm{now}}} = \mathrm{Fix}(\sigma_{t_{\mathrm{now}}}) \cap \mathrm{Fix}(\Delta_{t_{\mathrm{now}}})$: the incumbency proposition is doubly stable. When $\iota \notin H^*_{t_{\mathrm{now}}}$, the incumbency is partial — the holder has one stage of installation but not both. See the two-stage installation section below.

$$\mathrm{Inc} = (O,\; t_{\mathrm{now}} \in T,\; a : \text{Entity},\; \iota)$$

where:

- $O$ is the [Office](./office.md) — the normative structure defined over all histories in $T$
- $t_{\mathrm{now}} \in T$ is the **current history** — the designated base point for *now*; incumbency is a relation at a specific history, not a global structure
- $a$ is the **occupant** — an Entity whose id is settled in the framework; the natural person currently wearing the body politic
- $\iota$ is the **incumbency proposition** — asserting *$a$ holds $O$ at $t_{\mathrm{now}}$* — a claim whose [settlement](../../../../math/domains/voidmath/terms/settlement.md) is what the rest of the structure tracks

**Type note.** The occupant $a$ is an Entity (a named individual), not itself a value in the framework's settlement space. The settlement space carries claims about $a$, not $a$ itself (Lambek–Scott 1986, *Introduction to Higher Order Categorical Logic*; Johnstone 2002, *Sketches of an Elephant*, Part D). The incumbency proposition $\iota$ is the proposition about $a$; $a$ is the individual the proposition names. What earlier formulations conflated — occupant individual and occupancy claim — are distinct.

**Full incumbency** is the condition that two distinct predicates over $\iota$ have both reached affirming settlement at $t_{\mathrm{now}}$:

- *Institution* — the predicate that the office's authority has been conferred; recognized authorization
- *Induction* — the predicate that corporeal possession has been entered; forward-active occupancy

When only one of the two predicates has settled, the incumbency is partial; see the two-stage installation section below.

## Correspondence table

Nine external doctrines, each with a precise internal rendering:

| External doctrine | Source | Internal construct |
|---|---|---|
| **Body politic** (*corpus politicum*) | Plowden *Commentaries*, fol. 212v (c.1571); Kantorowicz (1957) §I | The normative presheaf $(H, \sigma, \Delta)$ over all of $T$ — defined for every history, never a function of the occupant |
| **Body natural** (*corpus naturale*) | Kantorowicz (1957) §I; Blackstone Bk. I Ch. 7 | The occupant Entity $a$ — local section of an agent-sheaf at $t_{\mathrm{now}}$; mortal in the sense of being indexed to one history |
| ***Dignitas non moritur*** ("the dignity does not die") | Kantorowicz (1957) §§IV–VI, citing Baldus, Johannes Andreae | The nuclear structure $(\sigma_t, \Delta_t)$ is defined for all $t \in T$; it does not depend on any element $a \in H_t$ being present |
| ***Salva rerum substantia*** (usufruct limit) | Digest 7.1.1 (Paul): *jus utendi fruendi salva rerum substantia* | The nuclei $(\sigma_t, \Delta_t)$ are not in the image of any stepping map $\gamma_{t_{\mathrm{now}}}$ the incumbent controls; the substance of the office — its normative structure — is outside the incumbency's write scope |
| **Corporation sole** | Blackstone Bk. I Ch. 18; *Sutton's Hospital* 10 Co. Rep. 23a (1613); Maitland, "The Crown as Corporation," *LQR* 17 (1901) | The Office $O$ is a structure over all of $T$; its legal personality (juristic continuity) is the presheaf, not any particular element at any particular $t$ |
| **Institution** (*institutio*, spiritual authorization) | Phillimore, *Ecclesiastical Law* Vol. 1 Bk. III Ch. VI; Blackstone Bk. II Ch. 3 | $\sigma_{t_{\mathrm{now}}}(\iota) = \iota$ — the incumbency proposition is [saturation-nucleus](../math/relational-history-fiber-saturating-nucleus.md)-fixed: meaning/recognition settled; the past has nothing more to add |
| **Induction** (*inductio*, corporeal possession) | Phillimore ibid.; Blackstone: "not complete incumbent till induction" | $\Delta_{t_{\mathrm{now}}}(\iota) = \iota$ — the incumbency proposition is [transfer-nucleus](../math/relational-history-fiber-transferring-nucleus.md)-fixed: forward-stable; every extension of $t_{\mathrm{now}}$ already contains the occupancy |
| **Full incumbency** (institution + induction both complete) | Blackstone Bk. II Ch. 3: "no complete freehold in the church" without induction | $\iota \in H^*_{t_{\mathrm{now}}}$: doubly stable — both nucleus conditions hold simultaneously |
| **Rule of recognition** | Hart, *The Concept of Law* (1961), Ch. IV–VI: the secondary rule specifying criteria of legal validity; persists through succession | The Grothendieck topology $J$ on $T$: the covering condition that determines which families of facts count as valid in the system; not modified by any change of occupant |

| External doctrine | Source | Internal construct |
|---|---|---|
| **Body politic** (*corpus politicum*) | Plowden *Commentaries*, fol. 212v (c.1571); Kantorowicz (1957) §I | The Office's normative structure over all of $T$ — defined for every history, never a function of the occupant |
| **Body natural** (*corpus naturale*) | Kantorowicz (1957) §I; Blackstone Bk. I Ch. 7 | The occupant Entity $a$ — present at $t_{\mathrm{now}}$; mortal in the sense of being indexed to one history |
| ***Dignitas non moritur*** ("the dignity does not die") | Kantorowicz (1957) §§IV–VI, citing Baldus, Johannes Andreae | The Office's normative structure is defined for all $t \in T$; it does not depend on any incumbent being present |
| ***Salva rerum substantia*** (usufruct limit) | Digest 7.1.1 (Paul): *jus utendi fruendi salva rerum substantia* | The Office's normative structure is not in the image of any act the incumbent controls; the substance of the office — its required predicates and laws — is outside the incumbency's write scope |
| **Corporation sole** | Blackstone Bk. I Ch. 18; *Sutton's Hospital* 10 Co. Rep. 23a (1613); Maitland, "The Crown as Corporation," *LQR* 17 (1901) | The Office is a structure over all of $T$; its legal personality (juristic continuity) is the structural form, not any particular element at any particular $t$ |
| **Institution** (*institutio*, spiritual authorization) | Phillimore, *Ecclesiastical Law* Vol. 1 Bk. III Ch. VI; Blackstone Bk. II Ch. 3 | The institution predicate over $\iota$ has reached affirming [settlement](../../../../math/domains/voidmath/terms/settlement.md) at $t_{\mathrm{now}}$: the past has settled the meaning of the appointment |
| **Induction** (*inductio*, corporeal possession) | Phillimore ibid.; Blackstone: "not complete incumbent till induction" | The induction predicate over $\iota$ has reached affirming settlement: the occupancy is forward-active, present in every continuation of $t_{\mathrm{now}}$ |
| **Full incumbency** (institution + induction both complete) | Blackstone Bk. II Ch. 3: "no complete freehold in the church" without induction | Both institution and induction predicates have reached affirming settlement simultaneously |
| **Rule of recognition** | Hart, *The Concept of Law* (1961), Ch. IV–VI: the secondary rule specifying criteria of legal validity; persists through succession | The covering structure on $T$ — what families of facts count as valid in the system; not modified by any change of occupant |

## The two-body doctrine

The deepest philosophical analysis of the office/incumbent distinction is Kantorowicz's reconstruction in *The King's Two Bodies* (Princeton, 1957) of the Tudor legal theory recorded in Plowden's *Commentaries* (c.1571). The Plowden passage:

> "The King has in him two Bodies, viz., a Body natural, and a Body politic... his Body politic is a Body that cannot be seen or handled, consisting of Policy and Government... utterly void of Infancy, and old Age, and other natural Defects."

In this system: the body politic IS the normative presheaf $(H, \sigma, \Delta)$ over all of $T$. It is not an element of any fiber. It is the structure that governs the fibers and exists for all $t \in T$ whether or not any element inhabits it. The body natural is the current occupant Entity $a$ — indexed to $t_{\mathrm{now}}$, not persisting to $t' \neq t_{\mathrm{now}}$ without an explicit stepping map. *Dignitas non moritur* is the condition that the nuclear structure is defined over all of $T$: no fiber can be vacated by the departure of an occupant.

The medieval canonists' concept of *dignitas* (dignity, office-as-abstract-entity) corresponds to the nuclei $(\sigma_t, \Delta_t)$ themselves: the formal normative content of the office, invariant across all holders, modifiable by no incumbent. Kantorowicz traces this through Baldus de Ubaldis and Johannes Andreae; the formal analog here is that no stepping map in $\gamma_{t_{\mathrm{now}}}$ controlled by the incumbent can alter $\sigma_t$ or $\Delta_t$.

Hart's rule of recognition (*The Concept of Law*, 1961, Ch. V) connects this to the philosophy of law: what survives succession is not the sovereign's person but the rule that specifies which acts count as law. Hart: legal continuity is continuity of the rule of recognition, not of the natural person in the seat. In this system: continuity of $J$ (the topology) and of $(\sigma_t, \Delta_t)$ (the nuclei) is what persists; the element $a \in \mathcal{A}(t_{\mathrm{now}})$ is mortal.

The **body politic** does not die. When the body natural expires, the body politic passes instantaneously to the successor — *the King never dies*. The natural person merely gives the continuous office temporary corporeal existence.

Formally: the body politic IS the Office's normative structure over all of $T$. It is not an element of any single history. It is the structure that governs incumbency claims and exists for all $t \in T$ whether or not any element inhabits it. The body natural is the current occupant Entity $a$ — indexed to $t_{\mathrm{now}}$, not persisting to $t' \neq t_{\mathrm{now}}$ without an explicit transition. *Dignitas non moritur* is the condition that the office's structure is defined over all of $T$: no history can be vacated by the departure of an occupant.

The medieval canonists' concept of *dignitas* (dignity, office-as-abstract-entity) corresponds to the Office's structure itself: the formal normative content of the office, invariant across all holders, modifiable by no incumbent. Kantorowicz traces this through Baldus de Ubaldis and Johannes Andreae; the formal analog here is that no act controlled by the incumbent can alter the office's required predicates or its laws.

The **corporation sole** (Blackstone Bk. I Ch. 18; *Sutton's Hospital*, Coke C.J. 1613: "invisible, immortal... resting only in intendment of the law") is the legal mechanism. The office is the juristic person; the natural person is the current occupant. Property vested in the corporation sole does not pass to the holder's heirs but to the successor in office. This is perpetual succession: the office's structure persists across the mortality of every individual element.

Hart's rule of recognition (*The Concept of Law*, 1961, Ch. V) connects this to the philosophy of law: what survives succession is not the sovereign's person but the rule that specifies which acts count as law. Hart: legal continuity is continuity of the rule of recognition, not of the natural person in the seat.

## The two-stage installation

The ecclesiastical tradition developed the most formally explicit installation structure, revealing the two-component anatomy of incumbency (Phillimore, *Ecclesiastical Law* Vol. 1, 1895; Blackstone Bk. II Ch. 3):

**Institution** (*institutio*): The bishop confers *cura animarum* — care of souls — and the right to exercise spiritual functions. This is the act of normative recognition: the bishop's act settles the incumbency proposition as meaningful, as occupying the right position in the normative order. Blackstone: the clerk "is now the incumbent" for spiritual purposes.

**Induction** (*inductio*): The archdeacon puts the priest in corporeal possession — hand on the church door-ring, ringing the bell, sitting in the chancel stall. Blackstone: "the parson is not complete incumbent till induction; for till then he has no complete freehold in the church." Induction makes the incumbency forward-stable: the occupancy is now present in all one-step extensions of $t_{\mathrm{now}}$.

These two stages map onto the two nucleus operators:

| Stage | Nuclear condition | What it gives |
|---|---|---|
| Institution only | $\sigma_{t_{\mathrm{now}}}(\iota) = \iota$, $\Delta_{t_{\mathrm{now}}}(\iota) \neq \iota$ | Spiritual authority without corporeal possession — settled meaning, not yet forward-stable |
| Induction only | $\Delta_{t_{\mathrm{now}}}(\iota) = \iota$, $\sigma_{t_{\mathrm{now}}}(\iota) \neq \iota$ | Possession without authorization — forward-stable but not yet settled in meaning |
| Full incumbency | $\iota \in H^*_{t_{\mathrm{now}}}$ | Both stages complete — doubly stable; the complete freehold |

**Succession condition.** Once $\iota \in H^*_{t_{\mathrm{now}}}$, the transfer nucleus carries the settled state forward: $\Delta_{t_{\mathrm{now}}}(\iota) \in H^*_{t'}$ for all $t' = s \star t_{\mathrm{now}}$. The successor who inherits $H^*_{t'}$ receives the incumbency proposition intact. The departing incumbent who has reached full incumbency leaves the office in a condition that permits clean succession — this is the formal content of the succession obligation.

The usufruct condition (Digest 7.1.1, Paul: *jus alienis rebus utendi fruendi **salva rerum substantia***) is the negative face of the same structure: the incumbent may freely use $H^*_{t_{\mathrm{now}}}$ (the fruits of the office — the stable resources at the current history) but may not modify $(\sigma_t, \Delta_t)$ (the *substantia rerum* — the substance of the thing enjoyed). The nuclei are not consumable. An incumbent who attempts to alter the nuclear structure violates the *salva rerum substantia* condition.

**Institution** (*institutio*): The bishop confers *cura animarum* — care of souls — and the right to exercise spiritual functions. This is the act of normative recognition: the bishop's act settles the institution predicate as affirming, placing $\iota$ in a position recognized by the surrounding normative system. Blackstone: the clerk *is now the incumbent* for spiritual purposes.

**Induction** (*inductio*): The archdeacon puts the priest in corporeal possession — hand on the church door-ring, ringing the bell, sitting in the chancel stall. Blackstone: *the parson is not complete incumbent till induction; for till then he has no complete freehold in the church*. Induction settles the induction predicate as affirming: the occupancy is forward-active, present in continuations of $t_{\mathrm{now}}$.

These two stages map onto the two predicates whose joint settlement defines full incumbency:

| Stage | Settlement state | What it gives |
|---|---|---|
| Institution only | Institution predicate settled affirmingly; induction predicate not yet | Spiritual authority without corporeal possession — recognized but not yet forward-active |
| Induction only | Induction predicate settled; institution predicate not yet | Possession without authorization — forward-active but not yet recognized |
| Full incumbency | Both predicates settled affirmingly | Both stages complete; the complete freehold |

**Succession condition.** Once both predicates have settled at $t_{\mathrm{now}}$, the framework's settling monotonicity carries the settled state forward: the successor who inherits the office at $t' = s \star t_{\mathrm{now}}$ receives the incumbency claim intact. The departing incumbent who has reached full incumbency leaves the office in a condition that permits clean succession — this is the formal content of the succession obligation.

The usufruct condition (Digest 7.1.1, Paul: *jus alienis rebus utendi fruendi **salva rerum substantia***) is the negative face of the same structure: the incumbent may freely use the settled state at $t_{\mathrm{now}}$ (the fruits of the office — the stable resources at the current history) but may not modify the office's normative structure (the *substantia rerum* — the substance of the thing enjoyed). The structure is not consumable. An incumbent who attempts to alter it violates the *salva rerum substantia* condition.

## The Hohfeldian profile

An incumbent's jural positions (Hohfeld, *Yale Law Journal* 23/26, 1913/1917; Finnis, *Natural Law and Natural Rights*, 1980, Ch. VIII):

| Hohfeldian position | With respect to | Internal rendering |
|---|---|---|
| **Power** | Subjects within the office's jurisdiction | Authorized acts that move propositions into $H^*_{t_{\mathrm{now}}}$ — acts whose outputs are stable under the office's nuclei |
| **Duty** | The office itself | Obligation to settle the office's required propositions: $\iota \in H^*_{t_{\mathrm{now}}}$ is what the duty demands; positive gap = duty unfulfilled |
| **Privilege** | Core office functions | Liberty to exercise the office's functions without owing anyone a duty not to — the First Hohfeldian Quartet liberty |
| **Immunity** | The nuclei $(\sigma_t, \Delta_t)$ | The nucleus structure is not modifiable by ordinary agents; the incumbent cannot alter the normative profile of the office unilaterally |
| **Disability** | Office resources and successor's inheritance | Cannot alienate the office's nucleus structure; cannot pre-commit successors beyond what $\Delta_t$ itself carries forward; cannot consume what belongs to the corporation sole |
| **Liability** | The appointing body | The appointing body has the power to install, discipline, or remove; the incumbent's normative position is alterable by the legitimate authority |

| Hohfeldian position | With respect to | Internal rendering |
|---|---|---|
| **Power** | Subjects within the office's jurisdiction | Authorized acts that move predicates into affirming settlement at $t_{\mathrm{now}}$ |
| **Duty** | The office itself | Obligation to settle the office's required predicates: full incumbency is what the duty demands; an unsettled predicate is a duty unfulfilled |
| **Privilege** | Core office functions | Liberty to exercise the office's functions without owing anyone a duty not to |
| **Immunity** | The Office's normative structure | The structure is not modifiable by ordinary agents; the incumbent cannot alter the office's normative content unilaterally |
| **Disability** | Office resources and successor's inheritance | Cannot alienate the office's structure; cannot pre-commit successors beyond what the framework's monotonic settling carries forward; cannot consume what belongs to the corporation sole |
| **Liability** | The appointing body | The appointing body has the power to install, discipline, or remove; the incumbent's normative position is alterable by the legitimate authority |

## Incumbency levels

Four levels of incumbency stability, from least to most complete:

| Level | Condition | What it names |
|---|---|---|
| **Nomination / designation** | $\iota \in H_{t_{\mathrm{now}}}$, $\iota \notin \mathrm{Fix}(\sigma) \cup \mathrm{Fix}(\Delta)$ | The occupancy proposition exists but is not yet fixed by either nucleus; the appointment is pending |
| **Institution only** | $\sigma_{t_{\mathrm{now}}}(\iota) = \iota$ | Spiritual authorization settled; corporeal possession not yet forward-stable |
| **Induction only** | $\Delta_{t_{\mathrm{now}}}(\iota) = \iota$ | Forward-stable possession; meaning not yet settled — anomalous, normally impossible in canonical law |
| **Full incumbency** | $\iota \in H^*_{t_{\mathrm{now}}}$ | Doubly stable; institution and induction both complete; the complete freehold |

| Level | Condition | What it names |
|---|---|---|
| **Nomination / designation** | $\iota$ exists; neither predicate has settled | The occupancy claim is held but is not yet recognized or possessed; the appointment is pending |
| **Institution only** | Institution predicate settled affirmingly | Spiritual authorization complete; corporeal possession not yet forward-active |
| **Induction only** | Induction predicate settled affirmingly | Forward-active possession; meaning not yet settled — anomalous, normally impossible in canonical law |
| **Full incumbency** | Both predicates settled affirmingly | Both stages complete; the complete freehold |

## Open questions

- **Institution = σ-fixed, induction = Δ-fixed**: This mapping from the two ecclesiastical stages to the two nucleus operators is motivated by the functional roles — σ_t is the saturation nucleus (meaning-closure, settling what the accumulated past demands) and Δ_t is the transfer nucleus (forward-stability, settling what all extensions must share). Institution confers recognized meaning; induction confers forward-stable possession. But this hypothesis is not yet a derived theorem: deriving it requires specifying what "spiritual authorization" and "corporeal possession" mean formally as propositions in $H_{t_{\mathrm{now}}}$, and showing that the σ/Δ operators act on those propositions as claimed. This derivation is the primary open technical task of this spec.

- **The agent-sheaf**: The occupant $a$ is an Entity — a section with a doubly-stable id in $H^*$. But the proper type for agents in the topos is a section of a sheaf $\mathcal{A}$ of agents (Lambek–Scott 1986; Abramsky–Brandenburger 2011, *New Journal of Physics* 13), and the incumbency proposition $\iota$ is the characteristic morphism $[\mathrm{holds}(a, O)] : \mathcal{A}(t) \to H_t$ applied to $a$. Whether $\mathcal{A}$ is the same sheaf as the Entity-sheaf — whether every Entity is a potential agent — or whether there is a distinct Agent type with a separate sheaf, is not yet derived. The finest available answer: an agent is an Entity whose id is in $H^*$, making $\mathcal{A}$ the subsheaf of Entities with globally coherent ids; but the derivation of this identification is not given.

- **The rule of recognition as topology**: The hypothesis that Hart's rule of recognition corresponds to the Grothendieck topology $J$ on $T$ rests on the structural parallel: $J$ determines which families of facts "cover" a history (constitute a valid basis for sheaf sections); the rule of recognition determines which acts of officials "count as" law. Whether the nuclei $(\sigma_t, \Delta_t)$ arise from $J$ as the associated Lawvere–Tierney topologies $j_\sigma, j_\Delta : \Omega_R \to \Omega_R$ is a formal question in the math locale — $j_\sigma$ would be the Lawvere–Tierney topology corresponding to sheafification under $\sigma$, and its coalgebras would be the σ-fixed propositions. If this derivation goes through, Hart's internal point of view ("officials treat the rule as binding from the inside") corresponds to the sheaf gluing condition: local sections that are coherent get glued into global sections only from within the site.

- **The institution/induction predicate decomposition**: This mapping from the two ecclesiastical stages to two predicates whose joint settlement defines full incumbency is motivated by the functional roles. Institution confers recognized meaning; induction confers forward-active possession. Deriving this formally requires specifying what *spiritual authorization* and *corporeal possession* mean as predicates in the framework's predication structure, and showing that the institution and induction acts settle those predicates as claimed. This derivation is the primary open technical task of this spec.

- **The agent-sheaf**: The occupant $a$ is an Entity with a settled id. The proper type for agents in the framework is a section of an agent-sheaf $\mathcal{A}$ (Lambek–Scott 1986; Abramsky–Brandenburger 2011, *New Journal of Physics* 13), and the incumbency proposition $\iota$ is a [predication cell](../../../../math/domains/voidmath/terms/predication-cell.md) over $a$. Whether $\mathcal{A}$ is the same sheaf as the Entity-sheaf — whether every Entity is a potential agent — or whether there is a distinct Agent type with a separate sheaf, is not yet derived.

- **The rule of recognition as covering structure**: Hart's rule of recognition specifies which acts count as law. Whether the framework's covering structure on $T$ — what families of facts cover a history — is the formal counterpart to the rule of recognition, and whether the institution and induction predicates arise from this covering structure as derived settling conditions, is an open question. If the derivation goes through, Hart's *internal point of view* (officials treat the rule as binding from the inside) corresponds to the framework's commitment that settlement is achieved through the witnessings the inquiry has actually performed, not from a view from nowhere.
