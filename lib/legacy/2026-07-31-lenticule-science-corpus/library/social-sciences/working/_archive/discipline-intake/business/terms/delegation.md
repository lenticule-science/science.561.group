---
id: delegation
description: "A Delegation is a four-tuple (Q, G, B, ρ) — a principal Q, a bounded grant G of authority or capacity, a beneficiary B who receives G, and a residual accountability ρ that remains with Q. The defining structure: authority transfers, accountability does not. Q can give B the power to act; Q cannot give B the duty to answer."
defines: Delegation
related: Principal, StaffOfficer, DutyOfficer, Proxy, Duty, Captain, Authority, Contract, Trust, HohfeldianPosition, Investiture
date-created: 2026-03-19
date-modified: 2026-03-19
params:
  delegating-principal: person
  grant: authority
  beneficiary: person
  residual-accountability: relational-universe-morphism
output: relational-universe
ast:
  authority-transfer:
    - delegating-principal:
        - grant
    - beneficiary:
        - grant
    - residual-accountability:
        - delegating-principal
---

# Delegation

## Formal definition

A **Delegation** is a four-tuple $\mathcal{L} = (Q, G, B, \rho)$:

$$\mathcal{L} = (Q : \mathrm{Principal},\; G \subseteq \mathrm{Authority}(Q),\; B : \mathrm{Beneficiary},\; \rho : \mathrm{Authority}(Q) \setminus G \cup \mathrm{Accountability}(Q))$$

where:
- $Q$ is the **delegating principal** — the party who holds the authority being granted; $Q$ must hold $G$ in order to delegate it
- $G \subseteq \mathrm{Authority}(Q)$ is the **grant** — the bounded subset of $Q$'s authority transferred to $B$; $G$ must be specific: "everything" is not a delegation but an abdication
- $B$ is the **beneficiary** — the party who receives $G$ and may exercise it within its specified bounds
- $\rho$ is the **residual** — what remains with $Q$ after delegating $G$: all authority not in $G$, plus all accountability for outcomes attributable to $G$

**Four invariants.** $\mathcal{L}$ is a delegation iff it satisfies:

1. **Derivativity**: $Q$ can only delegate what $Q$ holds. $G \subseteq \mathrm{Authority}(Q)$. A party without authority cannot delegate it. (*Nemo dat quod non habet* — no one gives what they do not have.)

2. **Accountability non-transfer**: $\mathrm{Accountability}(Q)$ does not decrease by delegating $G$. $Q$ remains answerable for all outcomes attributable to $G$'s exercise, even those $B$ produces. The canonical statement (US Navy Regulations): "delegation of authority shall in no way relieve the commanding officer of continued responsibility." The delegator cannot give away the duty to answer.

3. **Boundedness**: $G$ is strictly specified. It defines what $B$ may do, within what limits, and (optionally) for how long. An unbounded delegation — "do whatever you think is necessary" without any specification — is an abdication, not a delegation, because it eliminates the residual structure that makes $Q$ accountable for how $G$ is used.

4. **Revocability**: $Q$ may revoke $G$ at will unless constrained by an external obligation (contract, statute, institutional rule). The grant is $Q$'s to give and $Q$'s to take back. Until revoked, $B$ may exercise $G$; after revocation, $B$'s exercise of $G$ is unauthorized.

## Authority transfers; accountability does not

The asymmetry between authority and accountability is the structural core of delegation:

| What is delegated | What is retained |
|---|---|
| Power to act within $G$ | Accountability for outcomes in $G$ |
| $B$'s capacity to bind $Q$ within $G$ | $Q$'s duty to answer for $B$'s exercise of $G$ |
| The doing | The answering |

This asymmetry is why delegation is not the same as transfer. A full transfer would move both authority and accountability. Delegation moves authority only. The fiduciary, the trustee, the commanding officer — all can delegate authority to subordinates and agents; none can delegate their accountability.

The one exception: [Captain](captain.md) assumption of command, where accountability does transfer via a formal installation act. This is why the change-of-command ceremony is structurally distinct from ordinary delegation — it is not a delegation but a substitution of the accountability-bearing party.

## Delegation produces the staff officer and duty officer

The delegation operator is what creates [StaffOfficer](staff-officer.md) and [DutyOfficer](duty-officer.md) from a [Principal](principal.md):

$$\mathrm{delegate}(Q, G_{\mathrm{domain}}, B) = \mathrm{StaffOfficer}(Q, G_{\mathrm{domain}}, \mathrm{Advisory})$$
$$\mathrm{delegate}(Q, G_{\mathrm{positional}}, B) + \mathrm{investiture} = \mathrm{DutyOfficer}(W, Q, \ldots)$$

Staff officers receive functional domain delegations; duty officers receive positional delegations bounded by a watch interval. The duty officer additionally requires [Investiture](investiture.md) — a formal assumption act — which ordinary staff delegation does not require.

## Nuclear reading

**Definitions.** Let $a_Q \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ be the principal's authority proposition — doubly stable. The delegation of grant $G$ to beneficiary $B$ at a derived history $s \leq t$ corresponds to the restriction map $\rho_{t \to s} : H_t \to H_s$. Since $\rho_{t \to s}$ is a Heyting algebra homomorphism (it is a morphism of the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$), its image $\mathrm{image}(\rho_{t \to s}) \subseteq H_s$ is a sub-Heyting-algebra of $H_s$ — this is the key structural fact.

**Proposition 1 (Nemo dat via the first isomorphism theorem):** The delegate's accessible authority space is $\mathrm{image}(\rho_{t \to s})$, which is a sub-Heyting-algebra of $H_s$ isomorphic (as a Heyting algebra) to $H_t / {\sim_\rho}$, where $a \sim_\rho b \Leftrightarrow \rho_{t \to s}(a) = \rho_{t \to s}(b)$ is the delegation kernel. $B$ can exercise any HA operation ($\wedge$, $\vee$, $\Rightarrow$) on received elements and the result remains in $\mathrm{image}(\rho_{t \to s})$ — no operation on delegated elements exits the authority sub-HA.

*Proof.* Every Heyting algebra homomorphism $f : A \to B$ has $\mathrm{image}(f)$ a sub-HA of $B$, because $f$ preserves all HA operations, so the image is closed under each [sub-HA lemma, relational-history-fiber-nuclear-heyting-algebra.md]. The first isomorphism theorem gives $\bar{\rho} : H_t / {\sim_\rho} \xrightarrow{\cong} \mathrm{image}(\rho_{t \to s})$. $\square$

*The content of nemo dat.* It is not just that $a_B \leq a_Q$ — it is that $B$'s entire authority space is a quotient of $Q$'s by the coarsening that delegation introduces. The delegation kernel $\sim_\rho$ identifies precisely those elements of $H_t$ that look identical from $B$'s fiber; $B$ cannot distinguish them, and therefore cannot act differently on them. The grant $G$ determines the quotient: a coarser $\sim_\rho$ (larger delegation kernel) means $B$ receives less distinguishing power over $Q$'s authority space.

**Proposition 2 (Shadow class stratification of delegated authority):** The shadow class type of $a_B = \rho_{t \to s}(a_Q)$ in $H_s$ is determined by which nuclear intertwining conditions hold for $\rho_{t \to s}$:

| $\sigma_s \circ \rho_{t \to s} = \rho_{t \to s} \circ \sigma_t$ | $\Delta_s \circ \rho_{t \to s} = \rho_{t \to s} \circ \Delta_t$ | Shadow class of $a_B$ |
|---|---|---|
| Yes | Yes | $H^*_s$ — full authority |
| Yes | No | $\mathrm{SatShadow}_s$ — recognized, not yet forward-committed |
| No | Yes | $\mathrm{TrShadow}_s$ — operational, not yet backward-recognized |
| No | No | $\mathrm{FreeShadow}_s$ — raw grant, requires both nuclear closures |

*Proof.* $a_Q \in H^*_t$ gives $\sigma_t(a_Q) = a_Q$ and $\Delta_t(a_Q) = a_Q$. If $\sigma_s$ commutes with $\rho_{t \to s}$, then $\sigma_s(a_B) = \rho_{t \to s}(\sigma_t(a_Q)) = \rho_{t \to s}(a_Q) = a_B$, so $a_B \in \mathrm{Fix}(\sigma_s)$; otherwise $\sigma_s(a_B) > a_B$ strictly. The same argument applies to $\Delta_s$. The four cases are exhaustive and pairwise disjoint. $\square$

*Interpretive consequence.* $\mathrm{SatShadow}_s$ is the class of recognized-but-revocable grants: $B$ has the backward record of authorization but the grant is not in the image of every independent forward extension of $s$ — it could be suspended. $\mathrm{TrShadow}_s$ is the class of operational-but-unrecognized grants: the grant is forward-active (operationally active in every extension) but the backward recognition profile at $s$ is incomplete — a probationary or tacit delegation. $\mathrm{FreeShadow}_s$ is a raw delegation: the grant is present in $H_s$ but neither recognized by $B$'s restriction history nor forward-committed; it requires $B$'s own nuclear closures to settle.

**Proposition 3 (Conditional grant is forward-committed when scope and grant are):** $\mathrm{Fix}(\Delta_s)$ is a sub-Heyting-algebra of $H_s$. Consequently, if a scope-condition proposition $c \in \mathrm{Fix}(\Delta_s)$ and a granted-act proposition $g \in \mathrm{Fix}(\Delta_s)$, then the conditional authority $c \Rightarrow g \in \mathrm{Fix}(\Delta_s)$.

*Proof.* $\mathrm{Fix}(\Delta_s) = \bigcap_{s' \perp s} \mathrm{image}(H(i_{s', ss'}))$. Each factor $\mathrm{image}(H(i_{s', ss'}))$ is a sub-HA (sub-HA lemma); a finite intersection of sub-HAs of a Heyting algebra is a sub-HA (sub-HA intersection lemma). Therefore $\mathrm{Fix}(\Delta_s)$ is closed under $\Rightarrow$. $\square$

*Content of the boundedness invariant.* Invariant 3 (boundedness: $G$ is strictly specified) has a structural reading: a well-bounded delegation produces a scope condition $c$ and grant $g$ that are both forward-committed in $B$'s fiber, making the conditional authority $c \Rightarrow g$ forward-committed. An unbounded grant ($g = \top_s$) trivializes to $c \Rightarrow \top_s = \top_s \in \mathrm{Fix}(\Delta_s)$, making the scope condition the sole constraint. When the scope condition is itself not forward-committed ($c \notin \mathrm{Fix}(\Delta_s)$), the conditional authority $c \Rightarrow g$ is also not forward-committed — the delegation is bounded only nominally.

**Proposition 4 (Accountability non-transfer as directional asymmetry):** The principal's accountability proposition $\alpha \in H^*_t$ is not in $\mathrm{image}(\rho_{t \to s})$, because $\alpha$ is a proposition of $H_t$ and $\mathrm{image}(\rho_{t \to s}) \subseteq H_s$, which is a different fiber. There is no HA morphism from $H_s$ to $H_t$ in the sheaf — restriction maps run in the direction of the presheaf ordering ($t \to s$, not $s \to t$). No operation at $s$ generates an element of $H_t$.

*Proof.* The presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$ is contravariant: morphisms $s \leq t$ in $T$ yield morphisms $H_t \to H_s$ in $\mathbf{HA}$, not the reverse. Since $s \leq t$ and $s \neq t$, there is no morphism $H_s \to H_t$ in the presheaf. The accountability proposition $\alpha$ remains in $H_t$, inaccessible to operations at $s$. $\square$

**Proposition 5 (Delegatus non potest delegare — quotient bound):** Let $B$ sub-delegate to $C$ at $r \leq s$. By presheaf functoriality, $\rho_{s \to r} \circ \rho_{t \to s} = \rho_{t \to r}$. Therefore $\mathrm{image}(\rho_{s \to r}|_{\mathrm{image}(\rho_{t \to s})}) \subseteq \mathrm{image}(\rho_{t \to r}) \subseteq H_r$. The sub-HA that $C$ receives is contained in the sub-HA that would result from $Q$ delegating directly to $r$: $B$ cannot give $C$ more than $Q$ could have given $C$ directly.

*Proof.* Any $x \in \mathrm{image}(\rho_{t \to s})$ has the form $\rho_{t \to s}(a)$ for some $a \in H_t$. Then $\rho_{s \to r}(x) = \rho_{s \to r}(\rho_{t \to s}(a)) = \rho_{t \to r}(a) \in \mathrm{image}(\rho_{t \to r})$. So $\rho_{s \to r}(\mathrm{image}(\rho_{t \to s})) \subseteq \mathrm{image}(\rho_{t \to r})$. $\square$

*Separation of capacity from authorization.* This gives the capacity bound: the HA structure forces $C$'s space inside $\mathrm{image}(\rho_{t \to r})$. The authorization condition — whether $B$'s sub-delegation is a valid act — is a separate $J$-topological question about which morphisms are in the normative covering of the history site. The HA structure gives the ceiling; the Grothendieck topology gives the floor.

## Delegation as exercise of a Hohfeldian Power

The [HohfeldianPosition](hohfeldian-position.md) spec resolves the open question about delegation's normative type: a delegation is exactly the exercise of a **Power** (second quartet) by $Q$. A Hohfeldian Power is the capacity to create new normative relations — to bring about a change in another party's normative position by performing a voluntary act. When $Q$ delegates $G$ to $B$, $Q$ exercises a Power: $Q$'s voluntary act (the delegation) creates a new normative relation in which $B$ now has the authority to act within $G$, and $B$'s counterpart position is a **Liability** — $B$ is liable to have their normative position changed by $Q$'s exercise of the delegating power (and also by $Q$'s revocation).

The `authority-transfer` opcode in this spec's AST corresponds to the Power-Liability pair in the [HohfeldianPosition](hohfeldian-position.md) first-to-second-quartet structure: delegation is a Power (second quartet) and the beneficiary's reception of the grant is a Liability (the correlative of Power).

## Delegation and Trust

Delegation always involves extending [Trust](trust.md). When $Q$ delegates $G$ to $B$, $Q$ extends trust in the sense of the Trust triple $\mathcal{T} = (Q, B, G)$: $Q$ is the truster, $B$ is the entrusted party, and $G$ is the trust domain. $Q$ accepts vulnerability to $B$'s exercise of $G$ — $B$ could exploit the delegated authority in ways that harm $Q$'s interests. The `residual-accountability` component is what makes this an asymmetric exposure: $Q$ retains accountability even while depending on $B$'s goodwill within $G$.

This connection makes explicit why delegation to a [Fiduciary](fiduciary.md) carries the strongest legal protections: when the delegated grant $G$ concerns a critical resource, and the trust exposure is maximal (the beneficiary cannot be monitored), the law imposes fiduciary duties on top of the bare delegation structure.

## Open questions

- Whether the boundedness invariant (3) admits fuzzy specification — whether "broad but non-total" delegations (e.g., "handle all operational matters during my absence") are valid delegations or structural abdications; and whether the `scope-specificity-predicate` opcode in the AST can be weakened to admit probabilistic scope specifications.
- Whether [Contract](contract.md) and Delegation are formally separable: whether a delegation backed by consideration (a paid agency arrangement) is a contract with a delegation as its subject matter, or whether the contractual frame changes the delegation's structure (particularly the revocability condition — an agency contract may limit $Q$'s revocability).
- Whether irrevocable delegations (trust deed, statutory powers, power of attorney coupled with an interest) are genuine delegations or substitutions — and whether the `revocability-condition` opcode should be a required or optional child of the `bounded-grant` node.
