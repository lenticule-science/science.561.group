---
id: assignment
description: "An Assignment is a triple (Q, C, B) — an assignor Q who holds a Hohfeldian claim C in H*_{t*}, an assignee B who receives C, and an assignment act α that moves C's section from Q's authority domain to B's authority domain. The defining structure: assignment transfers the right (the Hohfeldian claim — Q's right to receive) without changing the correlative duty (the obligor's duty to perform). The obligor P's duty is unchanged; only the identity of the party to whom P owes performance changes from Q to B. Formally: assignment is a natural transformation α : H_Q → H_B between Q's and B's authority presheaves that carries C's settled section from Q's fiber to B's fiber, leaving the duty-fibration unchanged."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  assignor: person
  claim: relational-universe-fiber-proposition
  assignee: person
  assignment-act: natural-transformation
output: relational-universe-morphism
ast:
  claim-transfer:
    - assignment-act:
        - assignor
        - claim
        - assignee
    - claim:
        - assignor
        - assignee
---

# Assignment

## Formal definition

An **Assignment** is a triple $\mathcal{A} = (Q, C, B)$:

$$\mathcal{A} = (Q : \mathrm{Assignor},\; C \in H^*_{t^*}(Q),\; B : \mathrm{Assignee})$$

together with an **assignment act** $\alpha : H^*_{t^*}(Q) \to H^*_{t^*}(B)$:

$$\alpha(C) = C' \in H^*_{t^*}(B)$$

where $C'$ is the **transferred claim** — the same normative relationship (right to performance by the obligor $P$) now held by $B$ rather than $Q$.

- $Q$ is the **assignor** — the original holder of $C$; after $\alpha$, $Q$ no longer holds $C$
- $C \in H^*_{t^*}(Q)$ is the **assigned claim** — a Hohfeldian claim (right to receive something from $P$); the settled right held by $Q$ that is being transferred to $B$
- $B$ is the **assignee** — the party who receives $C$; after $\alpha$, $B$ holds the right to demand performance from $P$ that $Q$ previously held
- $\alpha$ is the **assignment act** — the notification, writing, or formal act that constitutes the transfer; the assignment is effective against the obligor $P$ when $P$ has notice of $\alpha$

**Three invariants.** $\mathcal{A}$ is a valid assignment iff:

1. **Assignability**: $C$ is assignable — not every right can be assigned. A right is non-assignable iff it is personal to $Q$ (its value depends essentially on $Q$'s identity — a contract for $Q$'s personal services, a right grounded in trust of $Q$ specifically) or is made non-assignable by the governing normative system. The test: can the obligation be performed identically for $B$ as for $Q$? If yes, the right is assignable.

2. **Obligor's duty preserved**: the assignment does not change $P$'s correlative duty. $P$ still owes performance; only the recipient of performance changes from $Q$ to $B$. $P$ cannot resist performance to $B$ on the grounds that $P$ preferred $Q$ as the obligee (except where the obligee's identity is material to performance — the personal-right exception).

3. **Notice of assignment**: assignment is effective against $P$ when $P$ has notice of $\alpha$. Before notice: $P$ can discharge their duty by performing to $Q$ (the original obligee, who must then account to $B$). After notice: $P$ must perform to $B$ to discharge the duty.

## The Hohfeldian analysis

An assignment moves a Hohfeldian **claim** from one holder to another. Hohfeldian analysis (Wesley Newcomb Hohfeld, "Some Fundamental Legal Conceptions as Applied in Judicial Reasoning," *Yale Law Journal* 23:16, 1913) identifies four types of legal positions:

| Position | Correlative | Opposite |
|---|---|---|
| Right (claim) | Duty | No-right |
| Privilege (liberty) | No-right | Duty |
| Power | Liability | Disability |
| Immunity | Disability | Liability |

Assignment transfers a **claim** (right) from $Q$ to $B$: the correlative **duty** on $P$ is unchanged. This is the key structural asymmetry: assignment operates entirely on $Q$'s side of the Hohfeldian relation without touching $P$'s side.

Contrast with:
- **Delegation**: transfers a **power** (authority to act on behalf of $Q$) while $Q$ retains the correlative accountability
- **Novation**: extinguishes both the claim and the correlative duty and replaces them with a new set
- **Waiver**: relinquishes the claim entirely without transferring it to anyone

## Types of assignment

**Legal assignment**: a formal assignment that transfers the right absolutely and enables $B$ to sue $P$ directly in $B$'s own name. Requirements: written form, signed by the assignor, notice to the obligor. Under the Law of Property Act 1925 (UK) §136 and UCC Article 9 (US), a legal assignment transfers complete ownership of the claim.

**Equitable assignment**: an informal assignment that creates obligations between $Q$ and $B$ but may require $Q$ to join as a party in proceedings against $P$. No particular form is required; words of present transfer suffice. A party who says "I assign to you my right to receive the debt" has made an equitable assignment even without writing.

**Partial assignment**: assignment of a portion of a claim — "$Q$ assigns to $B$ half of the right to receive $X$." This creates a fractional interest: $B$ holds $C' = C/2$ and $Q$ retains $C/2$. In formal terms: $\alpha$ moves a sub-section of $H^*_{t^*}(Q)$ to $H^*_{t^*}(B)$ while the remaining sub-section stays with $Q$.

**Future assignment (assignment of future rights)**: an assignment of a right not yet in existence — "when I earn the right to X, I hereby assign that right to B." In formal terms: this is an assignment of a prospective section — a section that will be in $H^*_{t^*}$ when the generative condition is satisfied. The assignment creates a priority right: when $C$ arrives in $H^*_{t^*}(Q)$, $\alpha$ is applied immediately.

## Math grounding

The assignment act $\alpha$ is a **natural transformation** $\alpha : H_Q \Rightarrow H_B$ between $Q$'s and $B$'s authority presheaves ([Natural Transformation](../math/natural-transformation.md)):

$$\alpha_t : H_t(Q) \to H_t(B) \quad \text{for each } t \in T$$

commuting with the restriction maps: $\alpha_{t} \circ H(f)_B = H(f)_Q \circ \alpha_{t'}$ for all $f : t \to t'$.

The assignment preserves the settled layer: $\alpha_t(H^*_t(Q)) \subseteq H^*_t(B)$ — settled claims transfer as settled claims. The natural transformation condition ensures that $B$'s claim $C'$ is coherent across all histories in $T$: if $C$ was globally recognized in $Q$'s fiber, $C' = \alpha(C)$ is globally recognized in $B$'s fiber.

The assignment does **not** act on the obligor $P$'s fiber: $H_t(P)$ is unchanged. The duty $D_P \in H^*_t(P)$ — $P$'s correlative duty — remains settled regardless of the assignment. The only change is in the target of $P$'s performance: after notice of $\alpha$, $P$'s duty is discharged by performing to $B$ rather than to $Q$.

In [Relational Universe Morphism](../math/relational-universe-morphism.md) terms: the assignment is a morphism $(\phi, \alpha) : \mathbf{U}_Q \to \mathbf{U}_B$ where $\phi = \mathrm{id}_T$ (same history structure) and $\alpha : H_Q \xrightarrow{\sim} H_B$ is the natural isomorphism restricted to the claim $C$.

## Assignment vs. delegation vs. novation

| Dimension | Assignment | Delegation | Novation |
|---|---|---|---|
| What transfers | Claim (right to receive) | Power (authority to act) | Nothing transfers — extinguish + create |
| Obligor consent | Not required | Not required | Required |
| Obligor's position | Duty unchanged; recipient changes | Accountability unchanged; proxy acts | Duty extinguished; new duty created |
| Assignor/delegator retains | Nothing (full assignment) | Accountability | Nothing (obligation extinguished) |
| Math | Natural transformation $H_Q \Rightarrow H_B$ | Sub-presheaf sharing | Terminal morphism ∘ genesis |

## Open questions

- Whether partial assignment (assignment of a fractional interest in a claim) has the structure of a sub-presheaf assignment: whether $B$'s partial claim $C/2$ is a section of the sub-Heyting-algebra $H^*_{t^*}(Q)/2$ and whether the meet structure of the Heyting algebra provides the natural definition of "half a claim."
- Whether future rights assignment (assignment of prospective sections) corresponds to a morphism in the pro-category of presheaves — a filtered inverse limit of sections that converges to the settled right when the generative condition fires.
- Whether an assignment chain $Q \to B \to B'$ (successive assignments of the same claim) is a composition of natural transformations, and whether the resulting composite natural transformation $H_Q \Rightarrow H_{B'}$ factors through any intermediate presheaf or composes directly.

## Consolidated material from hohfeldian-assignment-2026-03-20.md

---

title: "Assignment"
description: "An Assignment is a triple (Q, C, B) — an assignor Q who holds a Hohfeldian claim C in H*_{t*}, an assignee B who receives C, and an assignment act α that moves C's section from Q's authority domain to B's authority domain. The defining structure: assignment transfers the right (the Hohfeldian claim — Q's right to receive) without changing the correlative duty (the obligor's duty to perform). The obligor P's duty is unchanged; only the identity of the party to whom P owes performance changes from Q to B. Formally: assignment is a natural transformation α : H_Q → H_B between Q's and B's authority presheaves that carries C's settled section from Q's fiber to B's fiber, leaving the duty-fibration unchanged."
defines: Assignment
related: HohfeldianPosition, Right, Duty, Delegation, Novation, Contract, Waiver, Person
date-created: 2026-03-20
---

The assignment act $\alpha$ is a **natural transformation** $\alpha : H_Q \Rightarrow H_B$ between $Q$'s and $B$'s authority presheaves ([Natural Transformation](../../../../../../../../../humanities/theories/math/theories/categories/theories/ordinary-categories/terms/natural-transformation.md)):

In [Relational Universe Morphism](../../humanities/theories/math/relational-universe-morphism.md) terms: the assignment is a morphism $(\phi, \alpha) : \mathbf{U}_Q \to \mathbf{U}_B$ where $\phi = \mathrm{id}_T$ (same history structure) and $\alpha : H_Q \xrightarrow{\sim} H_B$ is the natural isomorphism restricted to the claim $C$.
