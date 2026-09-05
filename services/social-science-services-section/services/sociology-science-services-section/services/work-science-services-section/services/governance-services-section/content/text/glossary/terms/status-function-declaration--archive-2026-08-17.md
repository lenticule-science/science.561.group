---

name: "Status Function Declaration"
description: "A StatusFunctionDeclaration is a four-tuple (X, Y, C, A) — a target X, a status Y, a context C in which the status applies, and an authorizing act A by which the status is constituted — that creates an institutional fact by the act of its utterance or performance. The defining invariant: the declaration does not describe a pre-existing fact; it constitutes one. X acquires the status Y in context C precisely because the declaration A is performed by a party with the standing to make it operative. Without A, X may have all the properties it will have after A, yet still lack status Y."
date-created: 2026-03-20
---

## What this is

A **StatusFunctionDeclaration** is the mechanism by which institutional facts are created. It is a speech act (or equivalent collective act) of the form:

$$\text{``}X \text{ counts as } Y \text{ in context } C\text{''}$$

where $X$ is a brute-fact object or event, $Y$ is the institutional status assigned, and $C$ is the context within which the assignment holds. The act of making this declaration (when performed by a party with standing, under appropriate conditions) *constitutes* the institutional fact — it does not merely report one.

## Formal definition

A **StatusFunctionDeclaration** is a four-tuple $\mathcal{D} = (X, Y, C, A)$:

$$\mathcal{D} = (X : \mathrm{Target},\; Y : \mathrm{Status},\; C : \mathrm{Context},\; A : \mathrm{AuthorizingAct})$$

where:
- $X$ is the **target** — the entity, act, or state of affairs that acquires the new status; $X$ may preexist the declaration (a piece of metal that becomes a coin) or be constituted by the declaration itself (the corporation that comes into existence upon incorporation)
- $Y$ is the **institutional status** — the normative, deontic, or social position assigned to $X$ by the declaration; $Y$ specifies what $X$ *counts as* within $C$: what rights, duties, powers, privileges, or immunities $X$ now holds or confers; $Y$ is always a position in a [HohfeldianPosition](../domains/hohfeldian/terms/hohfeldian-position.md) web or an institutional-fact category
- $C$ is the **context** — the institutional frame within which the declaration is operative; the same $X$ may count as different $Y$'s in different contexts ($C_1$: a gold disc counts as a coin in the currency system; $C_2$: the same gold disc counts as evidence in a trial; $C_3$: the same gold disc counts as scrap metal outside both systems); context $C$ is specified by an [Institution](./institution.md) or [NormativeSystem](./normative-system.md)
- $A$ is the **authorizing act** — the speech act, ceremony, document, or procedure by which the declaration is performed; $A$ must be performed by a party with [Authority](./authority.md) to make declarations of type $Y$ within $C$; without this standing, $A$ misfires — the target $X$ does not acquire status $Y$

**Four invariants.** $\mathcal{D}$ is an operative StatusFunctionDeclaration iff:

1. **Constitutive, not descriptive**: $A$ does not report that $X$ already has status $Y$; it creates the fact that $X$ has status $Y$. Performing $A$ when the standing conditions hold brings the institutional fact into existence. This is Austin's performative-constative distinction: a performative utterance is neither true nor false before its performance (there is no fact yet to be true or false about); after a successful performance, the institutional fact obtains.

2. **Standing required**: the party performing $A$ must have the [Authority](./authority.md) to constitute status-$Y$-in-context-$C$. A random person saying "I appoint you judge" does not appoint a judge — the appointment misfires because the declaring party lacks standing. The President (in the right context, following the right procedure) saying "I appoint you" *does* appoint — because the President holds the Hohfeldian power to constitute judicial status in the relevant context.

3. **Collective recognition sustains**: once constituted, the institutional fact persists only while the relevant community continues to recognize $C$ as operative. If the institutional context dissolves (the game ends, the company is dissolved, the state ceases to be recognized), status-$Y$ dissolves with it. The declaration constitutes the fact; collective recognition sustains it. This is why [Institution](./institution.md) requires a recognition predicate $\mathrm{Rec}$ as a separate component: the constitutive act and the sustaining recognition are distinct.

4. **Context-relative**: the status $Y$ is never absolute — it is always $Y$-in-$C$. The corporate officer is an officer within the company's governance system; they have no authority outside the company's scope. The appointed judge has authority within the jurisdiction; beyond the jurisdiction, the title may be honorific but carries no Hohfeldian power. Status function declarations create locally operative facts, not globally absolute ones.

## The Searlean analysis

John Searle (*The Construction of Social Reality*, 1995; *Making the Social World*, 2010) builds his theory of institutional reality on status function declarations.

The fundamental structure: **collective intentionality + constitutive rules + status functions**. Institutional reality is created and sustained by:
1. **Collective intentionality**: the relevant community collectively accepts that $X$ counts as $Y$ in $C$; this is not reducible to individual intentionality plus mutual belief — it is a genuinely collective mental state
2. **Constitutive rules**: rules of the form "$X$ counts as $Y$ in $C$" that are not merely regulative (governing pre-existing behavior) but constitutive (creating the behavior they govern); "touchdowns score six points" does not govern a pre-existing act — it constitutes what a touchdown *is*
3. **Status functions**: the functions assigned by constitutive rules that allow entities to perform roles they could not perform by their physical properties alone; money can function as a medium of exchange, a judge can function as an authority to convict, a president can function as a head of state — in each case, the function is not physical but institutional

The **deontic powers** generated by status functions: when $X$ acquires status $Y$, $X$ typically acquires deontic powers — the capacity to alter normative relations for others. A dollar bill acquires the power to discharge debts. A certified doctor acquires the power to prescribe. A president acquires the power to sign laws. The deontic power is not in the physical object; it is created by the status function declaration and sustained by collective recognition.

**The ontological asymmetry**: the declaration creates a fact that is observer-dependent (it depends on collective recognition) but not subjectively arbitrary (once constituted, it is objectively real within its context; it binds even those who do not believe in it). A five-dollar bill is "really" worth five dollars within the US dollar system — this is not merely a belief, it is an institutional fact that constrains behavior, resolves disputes, and generates legal obligations. The observer-dependence is collective, not individual: no one agent's refusal to accept the dollar destroys its status; the collective would have to cease accepting it.

## Domain instances

### Legal declarations

**Incorporation**: "This entity is hereby incorporated as [Corporation Name] Ltd." — $X$ = the set of assets, persons, and documents; $Y$ = juridical person with full legal personality; $C$ = the jurisdiction's corporate law; $A$ = the registrar's act of registration. Before incorporation: a set of things. After: a legal person that can sue, be sued, own property, enter contracts.

**Conviction**: "I find the defendant guilty." — $X$ = the defendant; $Y$ = convicted person (with the attendant changes to normative status: loss of liberty, criminal record, altered rights); $C$ = the criminal justice system; $A$ = the judge's pronouncement after the trial's procedural requirements are met. The pronouncement does not discover guilt; it *constitutes* the legal fact of guilt within the criminal justice system.

**Marriage**: "I now pronounce you [married]." — $X$ = the two persons; $Y$ = married persons (a new juridical and social status with rights, duties, and deontic relations between the spouses and toward third parties); $C$ = the legal/religious institution of marriage; $A$ = the officiating authority's pronouncement following the ceremony's requirements. Before: two individuals. After: a married couple with a new legal status.

**Appointment**: "I appoint you Chief Justice." — $X$ = the person; $Y$ = the office of Chief Justice (the Hohfeldian profile of the office); $C$ = the court system; $A$ = the appointing authority's formal act. The person may have all the qualifications before appointment; the status is not constituted until the authorizing act occurs.

### Specification declarations

Every definition file entry of the form `defines: Foo` is a status function declaration within a knowledge system:

$$\mathcal{D} = (X = \text{the document and its content},\; Y = \text{Foo as a named entity in the relational system},\; C = \text{the vocabulary of the knowledge system},\; A = \text{writing and publishing the definition})$$

The definition does not discover a pre-existing entity called Foo; it constitutes Foo as a named entity within the system's vocabulary. Before the definition exists, other entities can reference Foo as vocabulary pressure; after it exists, Foo is a settled entity in the system.

Similarly, every `id:` field in a definition file is a declaration: "this concept counts as [id] in the context of this knowledge system." The `defines:` field explicitly marks the status assigned. The `date-created:` field is the timestamp of the authorizing act's performance.

### Mathematical declarations

**Quotient maps**: "$[x]$ counts as $x \pmod{n}$" — the quotient map $\pi : \mathbb{Z} \to \mathbb{Z}/n\mathbb{Z}$ declares that each equivalence class $[x]$ counts as a single element in the quotient. The declaration creates a new mathematical object (the residue) by fiat; the quotient structure is constituted by the declaration, not discovered.

**Type definitions**: in programming languages, `type Foo = { x: Int, y: String }` is a status function declaration: a record type named `Foo` is hereby constituted with the given field structure. The declaration brings `Foo` into existence in the type system; before the declaration, no entity named `Foo` exists in scope.

**Axiomatic foundations**: "We take the following as axioms." — the axioms of a theory are status function declarations: "these propositions count as foundational in this context." The axioms are not proved; they are declared. Their status as axioms is constituted by the declaration, not by their proof-theoretic properties. This is why changing the axioms (declaring different foundational propositions) constitutes a different mathematical theory, not a correction of the original.

**The Grundnorm** (Kelsen, *Pure Theory of Law*, 1934): every legal system presupposes a basic norm (*Grundnorm*) — the norm from which all other norms derive their validity. The Grundnorm cannot be derived from any higher norm within the system; it is presupposed as the condition of the system's validity. The Grundnorm is the ultimate status function declaration: "the constitution counts as valid law." Every legal status function declaration within the system derives its force from this foundational declaration.

## Settlement reading

**Definitions.** Before the declaration at history $t$: the [predication cell](../../../../../../math/domains/voidmath/terms/predication-cell.md) $(X, p_Y, C)$ — *target $X$ has status $Y$ in context $C$* — has not reached affirming [settlement](../../../../../../math/domains/voidmath/terms/settlement.md). Two predicates over this cell are relevant:

- A *recognition predicate* — that the relevant authority and community recognize the act constitutes the status
- A *persistence predicate* — that the institutional fact carries forward into continuations of the current history (the institution remains operative, the context remains in force)

Full institutional standing of $X$-as-$Y$-in-$C$ requires both predicates to reach affirming settlement.

**Proposition 1 (Authorizing act extends the history).** The authorizing act $A$ at $t$ does not retroactively modify the witnessing already in place at $t$. It is a new act of [witnessing](../../../../../../philosophy/domains/relationality/terms/witnessing.md) at a successor history $t' = s_\mathcal{D} \star t$. The settlement of $(X, p_Y, C)$ at $t$ is unchanged; at $t'$ the settlement is what $A$ has now added to it.

**Proposition 2 (Felicitous declaration settles the recognition predicate).** If the declaration $\mathcal{D}$ is felicitous (standing conditions met, authorizing source recognized, context operative), then the recognition predicate over $(X, p_Y, C)$ has reached affirming settlement at $t'$. The witnessing performed by $A$ — together with the prior witnessings about authority, context, and target — is sufficient for the recognition predicate to settle in the affirming corner.

*Consequence.* Infelicitous declarations — those lacking authority, standing, or proper context — produce a witnessing that does not advance the recognition predicate to affirming settlement. The element persists unsettled. Misfires are visible in the framework as failed witnessings, not as settlements that retroactively become invalid.

**Proposition 3 (Full institutional recognition requires both predicates to settle).** Collective recognition corresponds to both predicates — recognition and persistence — having reached affirming settlement at some history $t''$ reachable from $t'$. This requires:

(a) the recognition predicate has settled (the authority's act has been received and the community accepts it as constitutive), AND

(b) the persistence predicate has settled (every continuation of $t''$ that the framework can reach carries the institutional fact forward).

Neither implies the other. A declaration that secures recognition but not persistence gives an institutional fact that is recognized at the moment but not entrenched in continuations — the fact may dissolve as the institution changes or the context shifts. A declaration that secures persistence but not recognition is structurally anomalous: the institutional fact is forward-stable but has not been formally constituted, which is normally impossible for declared facts (they require an authorizing act to enter the framework).

*Consequence.* When collective recognition fails — the institution dissolves, the community stops treating $X$ as having status $Y$ — the persistence predicate's settlement at later histories no longer holds. The institutional fact becomes unsettled at those later histories, not because the earlier settlement was invalidated retroactively, but because the new witnessings at the later histories do not maintain the predicate's affirming position.

**Context-relativity of status.** The context $C$ is encoded in which witnessings and which predicates are operative. A dollar bill is settled as currency in the witnessing structure governed by the US monetary system; the same physical object is not settled as currency in the witnessing structure of the EU monetary system. Context-relativity is witnessing-relativity: different constitutive frameworks involve different histories, different absurdities, and different witnessing acts, producing different settlements of the same target's status predicates.

## Open questions

- Whether the **Grundnorm** has a formal analog in the framework's [absurdities](../../../../../../philosophy/domains/relationality/terms/absurd.md) — whether there is a foundational declaration that constitutes one of the absurdities the inquiry rests on; and whether such a foundational declaration is self-referential in a way that requires a fixed-point treatment ("the system's axioms count as valid, where 'valid' is defined by the system's axioms").
- Whether **conflicting status function declarations** (two authorizing acts that constitute incompatible statuses for the same $X$) have a resolution procedure in the [settlement](../../../../../../math/domains/voidmath/terms/settlement.md) structure — whether the conflict corresponds to the recognition predicate settling at the $\top$ corner (paraconsistently affirmed in two incompatible directions), and whether the framework gives a canonical resolution.
- Whether **revocation** (the act of removing a status — dissolution of the corporation, annulment of the marriage, reversal of the conviction) is the inverse of a status function declaration, and whether it has a formal representation as a witnessing that settles a denial-of-status predicate, taking the original status predicate from affirming to mixed or denying settlement at later histories.
- Whether the `defines:` field across all definition files constitutes a formal vocabulary of status function declarations — and whether the closure of this vocabulary under the system's constitutive rules gives the full institutional structure of a knowledge system.
