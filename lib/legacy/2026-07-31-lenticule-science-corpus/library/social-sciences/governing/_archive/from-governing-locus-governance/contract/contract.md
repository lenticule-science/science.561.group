---

title: "Contract"
description: "A Contract is a five-tuple (P₁, P₂, Φ₁₂, Φ₂₁, V) — two parties P₁ and P₂, a bilateral exchange of promise-sets (Φ₁₂: what P₁ commits to deliver to P₂; Φ₂₁: what P₂ commits to deliver to P₁), and formation conditions V (offer, acceptance, consideration, intention, capacity, legality) — that generates a Hohfeldian web of duties and claims persisting independently of performance. The invariant: authority transfers through delegation; obligation persists through contract. A contract is not a transfer but a mutual binding: both parties remain bound until discharge."
defines: Contract
related: Duty, Person, Institution, Delegation, Principal, Office, Promise, Trust, HohfeldianPosition, NormativeSystem, Record, Norm, Authority
date-created: 2026-03-20
---

## Formal definition

A **Contract** is a five-tuple $\mathcal{C} = (P_1, P_2, \Phi_{12}, \Phi_{21}, V)$:

$$\mathcal{C} = (P_1 : \mathrm{Person},\; P_2 : \mathrm{Person},\; \Phi_{12} \subseteq \mathrm{Acts}(P_1),\; \Phi_{21} \subseteq \mathrm{Acts}(P_2),\; V : \mathrm{FormationConditions})$$

where:
- $P_1$ is the **first party** — a [Person](../../../../../../philosophy/terms/person.md) who makes and receives commitments under the contract; need not be natural; corporations, ships, states, and software components are persons for contract purposes
- $P_2$ is the **second party** — a [Person](../../../../../../philosophy/terms/person.md) symmetric to $P_1$ in formal structure; bilaterality is built into the tuple; there is no "offeror side" in the settled contract, only two equally-bound parties
- $\Phi_{12} \subseteq \mathrm{Acts}(P_1)$ is **P₁'s promise set** — the acts, performances, deliveries, or forbearances that $P_1$ commits to provide to $P_2$; these are the terms owed by $P_1$; breach occurs when $P_1$ fails to perform some $\varphi \in \Phi_{12}$ without excuse
- $\Phi_{21} \subseteq \mathrm{Acts}(P_2)$ is **P₂'s promise set** — symmetric to $\Phi_{12}$; the terms $P_2$ owes $P_1$; $\Phi_{21}$ is the consideration $P_1$ receives for $\Phi_{12}$
- $V$ is the **formation conditions** — the predicate that must be satisfied for $\mathcal{C}$ to be valid and legally or normatively binding; in common law: $(V = \mathrm{offer} \wedge \mathrm{acceptance} \wedge \mathrm{consideration} \wedge \mathrm{intention} \wedge \mathrm{capacity} \wedge \mathrm{legality})$; in civil law: $(V = \mathrm{consent} \wedge \mathrm{capacity} \wedge \mathrm{cause} \wedge \mathrm{lawful\text{-}object})$

**Five invariants.** $\mathcal{C}$ is a contract iff it satisfies:

1. **Bilaterality**: the contract generates duties in both directions. $P_1$ has a duty to $P_2$: $\mathbf{D}(P_1, \Phi_{12}, P_2)$. $P_2$ has a duty to $P_1$: $\mathbf{D}(P_2, \Phi_{21}, P_1)$. By Hohfeldian correlativity, $P_2$ has a claim against $P_1$: $\mathbf{C}(P_2, \Phi_{12}, P_1)$, and $P_1$ has a claim against $P_2$: $\mathbf{C}(P_1, \Phi_{21}, P_2)$. A unilateral obligation (one party binds, the other does not) is a promise or a gift — not a contract.

2. **Consideration**: $\Phi_{12} \neq \varnothing$ and $\Phi_{21} \neq \varnothing$. Something flows in each direction. This is the common law consideration requirement: $P_2$ does not receive $\Phi_{12}$ for nothing — $P_1$ receives $\Phi_{21}$ in exchange. Civil law calls the same requirement *cause*: there must be a purpose or reason for each party to be bound. Past consideration does not count (*Re McArdle* [1951]): $\Phi_{21}$ must be a response to $\Phi_{12}$, not a prior act unconnected to the contract.

3. **Normative persistence after formation**: once $V$ is satisfied, the contract persists as a normative fact independently of performance. The parties cannot simply cease performing without consequence — the obligation remains until discharge, breach, frustration, or mutual release. Contrast with a request: requests do not create persisting normative facts; contracts do.

4. **Breach creates liability**: if $P_1$ fails to perform $\varphi \in \Phi_{12}$ at the required time and without legal excuse, the failure creates new Hohfeldian relations: $P_2$ acquires a **claim to remedy** against $P_1$. The remedies available (specific performance, damages, rescission) depend on the normative system $N$ governing the contract. Breach does not terminate the contract; it converts performance obligations into remedy obligations.

5. **Privity is the default**: the obligations in $\mathcal{C}$ bind only $P_1$ and $P_2$. Third parties cannot normally acquire rights or be bound by a contract they are not party to (*Tweddle v. Atkinson* [1861]; *Dunlop v. Selfridge* [1915]). Exceptions (third-party beneficiary doctrines, assignment, novation, the *Contracts (Rights of Third Parties) Act 1999*) are departures from the privity default, not the norm.

## The consideration/cause dyad

The deepest formal question about contract is why consideration is required — what work it does that cannot be done by a bare promise.

**The answer**: consideration is what distinguishes a contract (bilateral, mutually binding, enforceable) from a promise (unilateral, morally binding, often unenforceable). The bilateral exchange structure of $\Phi_{12}$ and $\Phi_{21}$ is what generates the Hohfeldian web: $P_1$'s duty creates $P_2$'s claim *because* $P_2$ has given $P_1$ something in return. If $P_2$ gives nothing, $P_1$'s "obligation" is merely a moral one — the law will not enforce it because the Hohfeldian correlative structure is incomplete.

In civil law systems, *cause* does the same work differently: the cause of a contract is its object or purpose — why the parties are entering it. A contract without cause (for no reason, for an impossible reason, for an illegal reason) is void. The civil law requires that the contract make sense as an exchange; the common law requires that something actually change hands.

The economic theory (Posner): consideration marks the contracts that both parties subjectively value at the time of formation — both gave something up, both expected something in return, so both revealed preferences support enforcement. Gifts transfer value unilaterally; courts have no basis to value them. Contracts transfer value bilaterally with each party's contribution as evidence of the other's value.

## Domain instances

### Common law contract: offer, acceptance, consideration

The common law contract is the most rigidly formal instance of the tuple. Formation requires satisfaction of each component of $V$:

**Offer**: a proposal by $P_1$ to be bound by the terms of $\Phi_{12}$ if $P_2$ accepts. An offer must be communicated to $P_2$; an offer to the world (*Carlill v. Carbolic Smoke Ball Co.* [1893]) is a special case. The offeror controls the terms; the offeree's power is to accept or reject, not modify.

**Acceptance**: an unqualified assent by $P_2$ to the terms of the offer. A modification is a counter-offer (rejecting the original). The mirror-image rule: acceptance must match the offer exactly. The postal rule: acceptance is effective on posting (Adams v. Lindsell [1818]) — the moment $P_2$ performs the acceptance act, the contract is formed, even before $P_1$ knows.

**Consideration**: the "price" paid by each party. *Currie v. Misa* (1875): consideration is "some right, interest, profit or benefit accruing to the one party, or some forbearance, detriment, loss or responsibility given, suffered or undertaken by the other." The classic shorthand: a benefit to the promisor or a detriment to the promisee. Adequacy is irrelevant (*Chappell v. Nestlé* [1960]: three chocolate wrappers were good consideration for a record); sufficiency is required (consideration must have some value in law; love and affection do not suffice as consideration for a contract).

**Intention to create legal relations**: not every exchange creates a contract. Social arrangements between friends and family are presumed not intended to be legally binding (*Balfour v. Balfour* [1919]); commercial arrangements are presumed intended to be. The intention component of $V$ captures the parties' normative attitude toward their exchange: a contract requires that both parties intend to be bound in law.

**Capacity**: each party must be legally capable of entering contracts. Minors, persons of unsound mind, and corporations acting beyond their *ultra vires* scope lack full contractual capacity.

**Legality**: contracts for illegal purposes are void or voidable. *Ex turpi causa non oritur actio* — no action arises from a base cause.

### Design by contract (CS): Hoare triples as bilateral contracts

Bertrand Meyer's Design by Contract (DbC, Eiffel language, 1988) is the application of contract theory to software component interfaces. The insight: a software component is not an isolated function but a party in a bilateral obligation with its caller.

A Hoare triple $\{P\}\; C\; \{Q\}$ is the contract:
- **$P$** (precondition): what the caller must guarantee before invoking $C$ — the caller's obligation $\Phi_{21}$
- **$Q$** (postcondition): what the implementor guarantees after $C$ terminates (given $P$) — the implementor's obligation $\Phi_{12}$
- **Invariant $I$**: conditions that both parties must maintain throughout — the shared persistent norm of the "class institution"

The bilateral structure is explicit: "if you give me $P$, I'll give you $Q$." The caller is $P_2$ (committing to $P$); the callee is $P_1$ (committing to $Q$ given $P$). Neither party has an unlimited obligation: the callee need not maintain $Q$ if the caller failed to establish $P$; the caller need not establish $P$ for every possible invocation, only when it wants $Q$.

**Subcontracting**: Liskov Substitution Principle in DbC form — a subtype may weaken preconditions and strengthen postconditions, but not vice versa. A stronger precondition ($P' \Rightarrow P$) means the subtype accepts fewer callers; a weaker postcondition ($Q \not\Rightarrow Q'$) means the subtype delivers less. Either is a contract violation: the subtype should be *at least as easy to call* and *at least as useful as* its supertype. This is the monotonicity requirement on contract inheritance.

**The predicate transformer reading**: the weakest precondition $\mathrm{wp}(C, Q)$ is the weakest $P$ such that $\{P\}\; C\; \{Q\}$ holds. This defines a Galois connection: $P \vdash \{P\}\; C\; \{Q\}$ iff $P \Rightarrow \mathrm{wp}(C, Q)$. The Hoare logic is a system of contract derivation — given a program $C$, find the bilateral exchange that $C$ implements.

### Adjunctions: the categorical contract

In category theory, an **adjunction** $F \dashv G$ between categories $\mathcal{C}$ and $\mathcal{D}$ (with $F : \mathcal{C} \to \mathcal{D}$ and $G : \mathcal{D} \to \mathcal{C}$) is a contract between two functors:

$$\mathrm{Hom}_{\mathcal{D}}(FA, B) \cong \mathrm{Hom}_{\mathcal{C}}(A, GB) \quad \text{natural in } A, B$$

The bilateral exchange structure: $F$ "commits" to universally factor every $\mathcal{D}$-morphism $FA \to B$ through the unit; $G$ "commits" to universally factor every $\mathcal{C}$-morphism $A \to GB$ through the counit. The bijection is the consideration: neither functor's commitment makes sense independently; they are mutually determining.

The formation witnesses:
- **Unit** $\eta : \mathrm{id}_{\mathcal{C}} \to GF$: $P_1$'s performance — "$P_1$ delivers $\eta_A : A \to GFA$" — the canonical element each $A$ generates in the $G$-side
- **Counit** $\varepsilon : FG \to \mathrm{id}_{\mathcal{D}}$: $P_2$'s performance — "$P_2$ delivers $\varepsilon_B : FGB \to B$" — the canonical element each $B$ absorbs from the $F$-side
- **Triangle identities**: the discharge conditions — $\varepsilon_{FA} \circ F(\eta_A) = \mathrm{id}_{FA}$ and $G(\varepsilon_B) \circ \eta_{GB} = \mathrm{id}_{GB}$ — "if both parties perform their canonical obligations, you recover the identity"

**Galois connections** are adjunctions between posets. The Galois correspondence (Galois, 1832): the subgroup lattice of $\mathrm{Gal}(L/K)$ and the intermediate field lattice between $K$ and $L$ are related by a Galois connection (a pair of order-reversing maps that are adjoint). Each intermediate field is uniquely determined by the subgroup of symmetries that fix it; each subgroup is uniquely determined by the field it fixes. The symmetry group and the field extension are in contractual correspondence: "I'll tell you which field I fix if you tell me which symmetry group I am."

In the framework: the [knowledge order](../../../../../../math/theories/voidmath/terms/knowledge-order.md) and [truth order](../../../../../../math/theories/voidmath/terms/truth-order.md) of the bilattice are related to each other by mutual constraint. The four corners of [settlement](../../../../../../math/theories/voidmath/terms/settlement.md) are the joint extremes of this constraint. Whether the two orders compose to a Galois connection of some kind — with the fully-determined corner $\mathbf{t}$ as the invariant — is an open structural question (see [Open questions](#open-questions)).

### Linear logic: resource-aware contracts

Classical logic treats truth as free: $A \wedge A \Leftrightarrow A$ (you can use $A$ as many times as you like). **Linear logic** (Girard, 1987) treats formulas as resources: each hypothesis must be used exactly once. This gives linear logic the character of **resource-accounting**, and linear propositions behave as contracts:

| Linear connective | Contract reading |
|---|---|
| $A \otimes B$ | "I will deliver both $A$ and $B$" — joint obligation |
| $A \parr B$ | "I will deliver $A$ or $B$, your choice determines which" — co-choice |
| $A \oplus B$ | "I will deliver one of $A$ or $B$, my choice" — choice |
| $A \mathbin{\&} B$ | "I will deliver either $A$ or $B$, your choice but not both" — exclusive choice obligation |
| $A \multimap B$ | "Given exactly one $A$, I will deliver one $B$" — resource contract |
| $!A$ | "You can use $A$ as many times as you want" — waiver of consumption constraint |
| $?A$ | "I will produce $A$ as many times as you need" — supply commitment |

The $\multimap$ (lollipop) connective is the **linear contract**: $A \multimap B$ is the agreement "one $A$ for one $B$, no stockpiling, no discarding." This is the contract at its most minimal — the resource exchange with strict accounting.

The $!$ modality (exponential) is the **irrevocability modifier**: $!A$ means $A$ is inexhaustible — the party committing to $!A$ has waived the right to limit consumption. This corresponds to the legal concept of an **irrevocable offer** or a **continuous obligation** (a standing commitment to perform on demand).

Linear logic also models the **Curry–Howard correspondence for contracts**: a proof of $A \multimap B$ is a program that consumes exactly one $A$-resource to produce one $B$-resource. The proof is the discharge evidence — the contract is discharged when the program runs and the transformation completes.

### Social contract: the meta-contract

Social contract theory addresses not ordinary contracts between existing persons within an existing normative system, but the **foundational contract** that constitutes the normative system itself — the contract that makes all other contracts possible.

**Hobbes** (*Leviathan*, 1651): in the state of nature (no sovereign, no law, no enforceable contracts), life is "solitary, poor, nasty, brutish, and short." Rational agents, to escape, covenant to surrender natural freedom to a sovereign in exchange for protection. The Hobbesian social contract is:
- $P_1$ = all persons in the state of nature
- $P_2$ = the sovereign (or the Leviathan as institutional person)
- $\Phi_{12}$ = subjects surrender natural right to govern themselves; obey the sovereign's law
- $\Phi_{21}$ = sovereign provides protection, maintains peace, enforces contracts

The Hobbesian insight: contracts presuppose a sovereign to enforce them. The social contract is the meta-contract — it constitutes the institutional authority under which ordinary contracts can function. Without the meta-contract, $V$ fails for every ordinary contract: there is no authority to enforce.

**Locke** (*Second Treatise*, 1689): the social contract is more limited than Hobbes allows. Natural rights (life, liberty, property) preexist the state; the contract is to protect them, not to surrender them. If the sovereign violates the contract (fails to protect natural rights), the people's obligation dissolves; they may revolve. The Lockean social contract: $\Phi_{21}$ includes protecting life, liberty, and property as conditions of $P_2$'s performance; if $P_2$ fails, $\Phi_{12}$ is discharged by breach.

**Rousseau** (*Social Contract*, 1762): the social contract transforms natural freedom into civil freedom through the **general will** (*volonté générale*). Each person gives themselves to all, and by giving to all, gives to no one. The general will is not the sum of individual wills but the common good — what all would will as citizens. The contract is with the *body politic* constituted by the contract itself: the parties are their own counterparty, in the sense that the community they constitute through the contract is what they are contracting with. $P_2$ is not a pre-existing entity but is constituted by the contract's formation.

**Rawls** (*A Theory of Justice*, 1971): the **original position** and **veil of ignorance** generate the social contract procedurally. Rational agents who do not know their place in society (their class, abilities, fortune, conception of the good) choose principles of justice. The veil ensures impartiality. Rawls argues they would choose: (1) equal basic liberties; (2) the difference principle (social and economic inequalities must benefit the least advantaged). The Rawlsian social contract is what rational agents behind the veil would agree to — it is a contract under conditions of epistemic equality.

The formal structure of the social contract is unusual: $P_1$ and $P_2$ are not distinct pre-existing persons; the contract *constitutes* one of its parties (the body politic, the sovereign, the civil society). This is the limit case of contract formation where $V$'s satisfaction and the contract's terms together create the normative system within which the contract then operates. Institution and contract coincide at the boundary.

### Game theory: mechanism design and Nash bargaining

In **cooperative game theory**, a contract is a **binding agreement** between players — one where the players can commit credibly to their promised strategies. The key question is not *whether* to contract but *what to contract for* — the terms of the agreement.

**Nash bargaining** (Nash, 1950): two players have a disagreement point $(d_1, d_2)$ (what each gets if they fail to agree) and a feasible utility set $U$ (the set of payoff pairs achievable by some agreement). The Nash bargaining solution maximizes the **Nash product** $(u_1 - d_1)(u_2 - d_2)$ over $U$. The Nash solution is the unique agreement satisfying: Pareto optimality, symmetry, invariance to affine transformations of utility, and independence of irrelevant alternatives.

The Nash solution is the contract that satisfies the most natural bilateral fairness conditions — it is the "exchange" both parties would choose if bargaining maximally.

**Mechanism design** (Hurwicz, Maskin, Myerson — Nobel 2007): the problem of designing the terms of a contract (the mechanism) so that self-interested parties will truthfully reveal their private information and behave as intended. The **revelation principle**: any outcome achievable by any mechanism can be achieved by a direct mechanism where truth-telling is a dominant strategy. An incentive-compatible contract is one where each party's dominant strategy is to perform $\Phi$ honestly — the contract aligns self-interest with compliance.

## The structure of discharge

A contract is **discharged** (terminated, with all obligations extinguished) by:

1. **Full performance**: both $P_1$ and $P_2$ complete all acts in $\Phi_{12}$ and $\Phi_{21}$ respectively. The contract is discharged; no further obligations remain. This is the joint affirming settlement: both parties' performance predicates have reached the truth-only corner.

2. **Mutual release** (*accord and satisfaction*): $P_1$ and $P_2$ agree to release each other from their obligations, usually in exchange for some reduced or modified performance. A new contract extinguishes the old.

3. **Frustration** (common law) / **impossibility**: the subject matter is destroyed, the purpose is defeated, or performance becomes illegal after formation, through no fault of either party. The contract is discharged; neither party is in breach.

4. **Breach** (by one party, accepted by the other): if $P_1$ commits a **repudiatory breach** (a fundamental failure going to the root of the contract), $P_2$ may elect to **accept the breach** and treat the contract as discharged. At that point, both parties' primary obligations end; $P_1$'s breach obligation (damages) begins. If $P_2$ does not accept the breach, the contract continues in force.

5. **Operation of law**: bankruptcy, merger of parties, death (in personal service contracts).

The common thread in 1 and 4: the contract terminates either because both performance predicates have reached affirming settlement (full performance) or because the breach has been accepted and converted into a new remedial obligation.

## Contract vs. adjacent concepts

| Concept | Formation | Bilateral? | Persists after formation? | Enforceability |
|---|---|---|---|---|
| **Contract** | $V$ (offer, acceptance, consideration) | Yes — mutual duties | Yes | Yes — generates remedy on breach |
| **Promise** | Unilateral declaration of intent | No — one party binds | Morally yes; legally often no | Generally not enforceable without consideration |
| **Gift** | Donor's declaration + delivery | No — one party gives | Yes, after delivery | Not enforceable as obligation; once complete, irrevocable |
| **Delegation** | Principal's grant | No — authority flows one way | Yes | Yes — agent bound by scope |
| **Duty** | Position (office, statute, institution) | Relational (duty ↔ claim) | Yes | Yes — correlative claim creates enforceability |
| **Trust** | Settlor's declaration | Triangular (settlor-trustee-beneficiary) | Yes | Yes — beneficiary holds claim against trustee |
| **Treaty** | Formal agreement between sovereigns | Yes — state parties | Yes | Yes — international law; self-enforcement through reciprocity |
| **Convention** | Implicit coordination by repeated play | No formal parties | Yes — by social norm | Normatively binding; no legal mechanism |

**Contract vs. promise**: a promise binds the promisor morally; a contract binds both parties legally. The formal distinction is consideration: the promisee in a bare promise gives nothing, so the promisor receives no Hohfeldian consideration and the correlative web is incomplete.

**Contract vs. delegation**: a delegation moves authority from principal to agent — unidirectional. A contract creates bilateral obligations — both parties are bound. The captain who delegates watch-standing authority has not contracted with the duty officer; the officer is bound by position, not exchange.

**Contract vs. institution**: an institution is the rule-system (the constitutive rules and deontic profiles); a contract is an act within an institution that generates particular obligations between particular parties. Contract law (institution) governs contracts (acts). Every contract presupposes an institution to give its terms meaning and enforce them; not every institution was created by contract.

## Settlement reading

A contract $\mathcal{C} = (P_1, P_2, \Phi_{12}, \Phi_{21}, V)$ at history $t$ has its formation and performance recorded as joint settlement on multiple [predication cells](../../../../../../math/theories/voidmath/terms/predication-cell.md):

- The parties $P_1, P_2$ are entities whose identity claims have reached affirming [settlement](../../../../../../math/theories/voidmath/terms/settlement.md) at $t$.
- **Contract in force** at $t$: the formation predicates over both $\Phi_{12}$ and $\Phi_{21}$ have reached affirming settlement (formation conditions $V$ have been satisfied), but the performance predicates over the actual deliveries have not yet reached affirming settlement. The formation event settles the contract as recognized; performance has not yet settled the deliveries as completed.
- **Contract discharged** at $t'$: the performance predicates over both $\Phi_{12}$ and $\Phi_{21}$ have reached affirming settlement at $t'$. Both parties have completed their commitments and the framework records both as settled.
- **Breach** at $t'$: the performance predicate over one party's commitment fails to reach affirming settlement at the deadline $t'$. Note: breach is a condition on the performance predicate at $t'$, not on the contract-formation predicate at $t$. The obligation to perform remains in force (the formation predicate stays affirmingly settled); it is the performance predicate's failure to reach affirming settlement at the deadline that constitutes breach. Breach does not unsettle the contract; it adds a new predicate (the breach record) and triggers remedy obligations.

**Bilateral symmetry of the obligation web.** The contract at $t$ generates four Hohfeldian positions simultaneously, all derivable from the bilateral structure $(P_1, P_2, \Phi_{12}, \Phi_{21})$:

- $D(P_1, \Phi_{12}, P_2)$: $P_1$'s duty — performance of $\Phi_{12}$ is required at the performance date
- $C(P_2, \Phi_{12}, P_1)$: correlative claim — $P_2$'s standing to enforce $\Phi_{12}$
- $D(P_2, \Phi_{21}, P_1)$ and $C(P_1, \Phi_{21}, P_2)$: symmetrically

The bilateral structure is the symmetric pair: both performance predicates must reach affirming settlement for the web to dissolve (full discharge). Partial performance leaves a measurable gap on at least one performance predicate. The contract persists as a normative fact — both $\Phi_{12}$ and $\Phi_{21}$ remain settled at $t$ as obligations regardless of subsequent performance — until both performance predicates reach affirming settlement at the deadline.

**Discharge requires both performance predicates to settle simultaneously.** Discharge is not the partial settlement of one party's performance; it is the joint condition that *both* performance predicates have reached affirming settlement at the deadline. A contract where only one party has performed has been *partially* discharged in a colloquial sense, but the framework records it as still in force on the unperformed side, with the breach mechanism triggering if the deadline passes without performance.

## Open questions

- Whether the adjunction reading $(F \dashv G)$ is formally an instance of the contract tuple — whether every adjunction generates a five-tuple $\mathcal{C} = (\mathcal{C}, \mathcal{D}, F, G, V_{\text{adjunction}})$ where $V_{\text{adjunction}}$ is the satisfaction of the naturality condition in the bijection.
- Whether the framework's [knowledge order](../../../../../../math/theories/voidmath/terms/knowledge-order.md) and [truth order](../../../../../../math/theories/voidmath/terms/truth-order.md) compose to a Galois-connection-like structure between the contract's formation predicates and its performance predicates, and whether this adjunction-as-contract encodes something about the internal normative structure of the [bilattice](../../../../../../math/theories/voidmath/terms/bilattice.md).
- The formal treatment of **relational contracts** (contracts whose terms are deliberately incomplete and filled in by ongoing relationship management) versus **complete contingent contracts** (contracts that specify outcomes for all states of the world). The incomplete contract requires a governance structure; the complete contract requires only enforcement. Whether the inquiry-trajectory modes (absurd → possible → necessary → determined) model the governance modes of incomplete contracts.
- Whether the **Curry–Howard–Lambek correspondence** gives a contract interpretation of the framework's predication language — whether terms correspond to contract proofs, types correspond to contract terms, and reduction corresponds to discharge.
- The formal status of the **social contract** in the framework: whether a system's specification itself is a social contract among agents — a set of constitutive rules that constitute the institution within which agents then enter ordinary contracts.
