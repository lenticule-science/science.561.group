---
id: revocation
description: "A Revocation is a triple (Q, G, B) — a principal Q who granted authority G to beneficiary B — together with a retraction act ρ that removes G from B's operative domain and restores it to Q's exclusive domain. The defining structure: revocation is the left inverse of delegation; it retracts the sub-presheaf H_G ↪ H_Q that was shared with B, collapsing B's claim on G back to ⊥. Three cases: full revocation (entire grant withdrawn), partial revocation (sub-grant G' ⊆ G withdrawn while G \ G' remains), and conditional revocation (withdrawal triggered by B's breach or changed circumstances). Revocation is always unilateral by Q — it does not require B's consent. Formally: a sub-presheaf retraction, the left inverse of the inclusion morphism that constituted the delegation."
date-created: 2026-03-20
date-modified: 2026-03-20
params:
  principal: person
  grant: authority
  beneficiary: person
  retraction-act: relational-universe-morphism
output: relational-universe
ast:
  sub-presheaf-retraction:
    - retraction-act:
        - principal
        - grant
    - beneficiary:
        - grant
---

# Revocation

## Formal definition

A **Revocation** is a triple $\mathcal{R} = (Q, G, B)$:

$$\mathcal{R} = (Q : \mathrm{Principal},\; G \subseteq \mathrm{Authority}(Q),\; B : \mathrm{Beneficiary})$$

together with a **retraction act** $\rho : H_G \to \bot_{H_Q}$:

$$\rho : H_G \hookrightarrow H_Q \;\to\; \bot_{H_Q}$$

where:
- $Q$ is the **revoking principal** — the original grantor of $G$; the party who holds the authority $G$ as part of their operative domain $\mathrm{Authority}(Q)$ and who retains the Hohfeldian power to withdraw it
- $G$ is the **grant being revoked** — the sub-domain of $Q$'s authority that was delegated to $B$; $G$ is a subset $G \subseteq \mathrm{Authority}(Q)$ that was shared as a sub-presheaf $H_G \hookrightarrow H_Q$
- $B$ is the **beneficiary** — the agent from whose operative domain $G$ is being withdrawn; after $\rho$, $B$ no longer has authority within $G$
- $\rho$ is the **retraction act** — the formal event (written order, notification, explicit withdrawal) that collapses $B$'s access to $G$ back to $\bot_{H_Q}$: the sub-presheaf $H_G$ is retracted from $B$'s domain

**Three invariants.** $\mathcal{R}$ is a valid revocation iff:

1. **Grantor authority**: $Q$ holds $G$ — either $G \subseteq \mathrm{Authority}(Q)$ originally, or $Q$ has been re-granted $G$ before revoking. A party cannot revoke a grant they did not make. The Hohfeldian power to revoke is held by the grantor: only $Q$ can undo what $Q$ granted.

2. **Grant existence**: $G$ was actually delegated to $B$ — there is a delegation record establishing that $B$ currently holds $G$. Revoking a non-existent grant is void: $G \not\subseteq \mathrm{Authority}(B)$ means there is nothing to retract.

3. **Unilaterality**: $\rho$ does not require $B$'s consent. Revocation is the principal's unilateral exercise of the Hohfeldian power to alter $B$'s normative position. $B$ may challenge the revocation (e.g., claiming contractual protection), but the revocation act itself is not void merely because $B$ objects.

## The three cases

### Full revocation

The entire grant $G$ is withdrawn: $\rho : H_G \to \bot_{H_Q}$ collapses all of $G$ back to the bottom element. After $\rho$, $B$'s operative domain is $\mathrm{Authority}(B) \setminus G$ — everything $B$ held before the delegation, minus $G$.

Full revocation is the simplest case and the default. The delegation is treated as having never existed from the moment $\rho$ is effective. Third parties who relied on $B$'s authority within $G$ must now deal directly with $Q$ (unless the revocation was not properly notified — see invariant 3 of [Delegation](./delegation.md)).

### Partial revocation

Only a sub-grant $G' \subsetneq G$ is withdrawn. $B$ retains authority within $G \setminus G'$. The retraction act $\rho$ is:

$$\rho_{G'} : H_{G'} \hookrightarrow H_G \to \bot_{H_G}$$

and $H_{G \setminus G'} \hookrightarrow H_Q$ remains active. Partial revocation is a sub-presheaf retraction: the sub-presheaf $H_G$ is replaced by the smaller sub-presheaf $H_{G \setminus G'}$; the difference $H_{G'}$ is collapsed.

Partial revocation is common in commercial practice: a principal limits an agent's authority after over-reaching but retains the agent for the remaining scope. In military practice: a commanding officer restricts a subordinate's authority over a specific domain (e.g., revokes their authority to approve expenditures over a certain threshold) while leaving command authority intact.

### Conditional revocation

The retraction act $\rho$ is triggered by a predicate — typically a [Breach](./breach.md) by $B$ or a change in circumstances that makes the grant inappropriate. The revocation is not effective until the trigger condition is satisfied. Before trigger: $G$ remains active. After trigger: $\rho$ fires automatically.

Conditional revocation is common in agency law and contract: "This authority is revocable on breach" is a conditional revocation clause. In the formal framework: the retraction act $\rho$ is a morphism from the breach-conditioned section of $H_G$ to $\bot_{H_Q}$ — a morphism with a guard condition on $B$'s breach status.

## Math grounding

A delegation from $Q$ to $B$ for grant $G$ creates a **sub-presheaf sharing**: the sub-presheaf $H_G \hookrightarrow H_Q$ of $Q$'s authority presheaf is made accessible to $B$. In terms of the relational universe morphism ([Relational Universe Morphism](../math/relational-universe-morphism.md)): the delegation is an inclusion morphism $(\phi_G, \alpha_G) : \mathbf{U}_G \hookrightarrow \mathbf{U}_Q$ where $\phi_G$ is the inclusion of $G$'s history category into $Q$'s and $\alpha_G$ is the identity on the shared portion of the presheaf.

Revocation is the **left inverse** of this inclusion: a retraction $r_G : \mathbf{U}_G \to \bot$ such that $r_G \circ (\phi_G, \alpha_G) = 0$ (the zero morphism, collapsing all content to $\bot$). In Heyting algebra terms: the grant $G$ was a proposition $g \in H_Q$ that was shared downward; revocation applies the settling nucleus $\sigma_t$ in the dissolving direction — $\sigma_t(g)_{\mathrm{revoke}} = \bot_{H_Q}$ after $\rho$.

The three cases map to:
- Full revocation: retraction of the entire inclusion $(\phi_G, \alpha_G)$
- Partial revocation: retraction of a sub-inclusion $(\phi_{G'}, \alpha_{G'}) \subsetneq (\phi_G, \alpha_G)$
- Conditional revocation: retraction guarded by a local section predicate (breach status of $B$)

## Revocation vs. delegation vs. expiry

| Mechanism | Initiator | Beneficiary consent | Effect on $G$ | Math |
|---|---|---|---|---|
| Delegation | Principal $Q$ | Not required | $G$ shared with $B$ | Sub-presheaf inclusion |
| Revocation | Principal $Q$ | Not required | $G$ retracted from $B$ | Sub-presheaf retraction |
| Expiry of grant | Institutional schedule | Not required | $G$ lapses at $T$'s end | Temporal boundary of delegation |
| Renunciation | Beneficiary $B$ | Not required (self-initiated) | $B$ returns $G$ to $Q$ | Section retraction by $B$ |

Renunciation is the beneficiary-initiated return of a grant: $B$ retracts their own access to $G$ and returns it to $Q$'s exclusive domain. This is not revocation (which is $Q$-initiated) but has the same formal effect: $H_G$ is no longer accessible to $B$.

## Revocability and irrevocability

Not all grants are revocable at will. A grant may be:
- **Gratuitous and freely revocable**: a simple delegation without consideration; $Q$ can revoke at any time without liability
- **Coupled with an interest**: if $B$ paid consideration for the grant, revocation may constitute breach of contract — $Q$ retains the Hohfeldian power to revoke but incurs liability; the revocation is effective but wrongful
- **Irrevocable**: a grant made by deed or supported by specific consideration under terms that preclude revocation; the Hohfeldian power to revoke has been alienated

In the formal framework: irrevocability is the alienation of the Hohfeldian power-to-revoke. After alienation, $Q$ no longer holds the power $\rho$; the retraction act is no longer available to $Q$. The sub-presheaf $H_G$ remains accessible to $B$ for the agreed period regardless of $Q$'s wishes.

## Open questions

- Whether the Hohfeldian power-to-revoke is itself a section of the authority fibration — a section $s_{\rho} : \{\mathrm{revoke}_G\} \to H^*_{t^*}$ — and whether alienating this power is a retraction of $s_{\rho}$ (the power-to-revoke is revoked by the grantor's own act of alienation).
- Whether partial revocation that progressively reduces a grant — a sequence $G \supset G_1 \supset G_2 \supset \ldots \supset G_n = \emptyset$ — forms a filtration of the sub-presheaf $H_G$, and whether this filtration has a canonical limit (total revocation as the colimit of the partial retractions).
- Whether conditional revocation (triggered by breach) has the structure of a Lawvere–Tierney topology: whether the breach condition defines a nucleus $j : \Omega \to \Omega$ on the subobject classifier such that the revocation is exactly the $j$-closed subobject of $H_G$.

## Consolidated material from hohfeldian-revocation-2026-03-20.md

---

title: "Revocation"
description: "A Revocation is a triple (Q, G, B) — a principal Q who granted authority G to beneficiary B — together with a retraction act ρ that removes G from B's operative domain and restores it to Q's exclusive domain. The defining structure: revocation is the left inverse of delegation; it retracts the sub-presheaf H_G ↪ H_Q that was shared with B, collapsing B's claim on G back to ⊥. Three cases: full revocation (entire grant withdrawn), partial revocation (sub-grant G' ⊆ G withdrawn while G  G' remains), and conditional revocation (withdrawal triggered by B's breach or changed circumstances). Revocation is always unilateral by Q — it does not require B's consent. Formally: a sub-presheaf retraction, the left inverse of the inclusion morphism that constituted the delegation."
defines: Revocation
related: Delegation, Principal, Authority, Investiture, HohfeldianPosition, Breach, Contract, Trust
date-created: 2026-03-20
---

Full revocation is the simplest case and the default. The delegation is treated as having never existed from the moment $\rho$ is effective. Third parties who relied on $B$'s authority within $G$ must now deal directly with $Q$ (unless the revocation was not properly notified — see invariant 3 of [Delegation](../../../../../terms/delegation.md)).

The retraction act $\rho$ is triggered by a predicate — typically a [Breach](../../../terms/breach.md) by $B$ or a change in circumstances that makes the grant inappropriate. The revocation is not effective until the trigger condition is satisfied. Before trigger: $G$ remains active. After trigger: $\rho$ fires automatically.

A delegation from $Q$ to $B$ for grant $G$ creates a **sub-presheaf sharing**: the sub-presheaf $H_G \hookrightarrow H_Q$ of $Q$'s authority presheaf is made accessible to $B$. In terms of the relational universe morphism ([Relational Universe Morphism](../../humanities/theories/math/relational-universe-morphism.md)): the delegation is an inclusion morphism $(\phi_G, \alpha_G) : \mathbf{U}_G \hookrightarrow \mathbf{U}_Q$ where $\phi_G$ is the inclusion of $G$'s history category into $Q$'s and $\alpha_G$ is the identity on the shared portion of the presheaf.
