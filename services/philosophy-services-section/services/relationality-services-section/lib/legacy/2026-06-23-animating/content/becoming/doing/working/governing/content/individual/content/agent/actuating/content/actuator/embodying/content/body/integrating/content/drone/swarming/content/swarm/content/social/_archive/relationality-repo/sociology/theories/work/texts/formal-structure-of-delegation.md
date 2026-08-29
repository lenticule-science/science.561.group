---
title: "The Formal Structure of Delegation: Presheaves, Heyting Algebras, and Roman Legal Doctrine"
date-created: 2026-04-03
description: "A presheaf model of delegation where authority is a sub-Heyting-algebra, accountability non-transfer follows from the directionality of restriction maps, and Roman legal doctrine (nemo dat, delegatus non potest delegare) has precise algebraic content."
related:
  - delegation
  - office
  - authority
  - trust
references:
  kantorowicz1957:
    authors: ["Ernst H. Kantorowicz"]
    title: "The King's Two Bodies: A Study in Medieval Political Theology"
    publication: "Princeton University Press"
    year: 1957
  searle1995:
    authors: ["John R. Searle"]
    title: "The Construction of Social Reality"
    publication: "Free Press"
    year: 1995
---

[Delegation](../terms/delegation.md) is the transfer of bounded authority from a principal to a beneficiary, where accountability remains with the principal.
This text develops the formal side: a presheaf model where authority is a Heyting algebra, delegation is a restriction map, and the structural facts of delegation (nemo dat, accountability non-transfer, sub-delegation bounds) follow from the algebra.

The model itself â€” treating authority as a Heyting algebra and delegation as a restriction map â€” is a proposed interpretation grounded in the repo's relational framework.
The question is whether it is the *right* model: whether the structural predictions it makes correspond to how delegation actually works in organizational practice.

## Setup

Let $a_Q \in H^*_t = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$ be the principal's authority proposition â€” doubly stable.
The delegation of grant $G$ to beneficiary $B$ at a derived history $s \leq t$ corresponds to the restriction map $\rho_{t \to s} : H_t \to H_s$.
Since $\rho_{t \to s}$ is a Heyting algebra homomorphism (it is a morphism of the presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$), its image $\mathrm{image}(\rho_{t \to s}) \subseteq H_s$ is a sub-Heyting-algebra of $H_s$ â€” this is the key structural fact.

## Proposition 1: Nemo dat via the first isomorphism theorem

The delegate's accessible authority space is $\mathrm{image}(\rho_{t \to s})$, which is a sub-Heyting-algebra of $H_s$ isomorphic (as a Heyting algebra) to $H_t / {\sim_\rho}$, where $a \sim_\rho b \Leftrightarrow \rho_{t \to s}(a) = \rho_{t \to s}(b)$ is the delegation kernel. $B$ can exercise any HA operation ($\wedge$, $\vee$, $\Rightarrow$) on received elements and the result remains in $\mathrm{image}(\rho_{t \to s})$ â€” no operation on delegated elements exits the authority sub-HA.

*Proof.* Every Heyting algebra homomorphism $f : A \to B$ has $\mathrm{image}(f)$ a sub-HA of $B$, because $f$ preserves all HA operations, so the image is closed under each.
The first isomorphism theorem gives $\bar{\rho} : H_t / {\sim_\rho} \xrightarrow{\cong} \mathrm{image}(\rho_{t \to s})$. $\square$

The content of nemo dat: it is not just that $a_B \leq a_Q$ â€” it is that $B$'s entire authority space is a quotient of $Q$'s by the coarsening that delegation introduces.
The delegation kernel $\sim_\rho$ identifies precisely those elements of $H_t$ that look identical from $B$'s fiber; $B$ cannot distinguish them, and therefore cannot act differently on them.

## Proposition 2: Shadow class stratification of delegated authority

The shadow class type of $a_B = \rho_{t \to s}(a_Q)$ in $H_s$ is determined by which nuclear intertwining conditions hold for $\rho_{t \to s}$:

| $\sigma_s \circ \rho_{t \to s} = \rho_{t \to s} \circ \sigma_t$ | $\Delta_s \circ \rho_{t \to s} = \rho_{t \to s} \circ \Delta_t$ | Shadow class of $a_B$ |
|---|---|---|
| Yes | Yes | $H^*_s$ â€” full authority |
| Yes | No | $\mathrm{SatShadow}_s$ â€” recognized, not yet forward-committed |
| No | Yes | $\mathrm{TrShadow}_s$ â€” operational, not yet backward-recognized |
| No | No | $\mathrm{FreeShadow}_s$ â€” raw grant, requires both nuclear closures |

*Proof.* $a_Q \in H^*_t$ gives $\sigma_t(a_Q) = a_Q$ and $\Delta_t(a_Q) = a_Q$.
If $\sigma_s$ commutes with $\rho_{t \to s}$, then $\sigma_s(a_B) = \rho_{t \to s}(\sigma_t(a_Q)) = \rho_{t \to s}(a_Q) = a_B$, so $a_B \in \mathrm{Fix}(\sigma_s)$; otherwise $\sigma_s(a_B) > a_B$ strictly.
The same argument applies to $\Delta_s$.
The four cases are exhaustive and pairwise disjoint. $\square$

Interpretive consequence: $\mathrm{SatShadow}_s$ is the class of recognized-but-revocable grants â€” $B$ has the backward record of authorization but the grant is not in the image of every independent forward extension. $\mathrm{TrShadow}_s$ is the class of operational-but-unrecognized grants â€” forward-stable but the backward recognition profile is incomplete (a probationary or tacit delegation). $\mathrm{FreeShadow}_s$ is a raw delegation requiring $B$'s own nuclear closures to settle.

## Proposition 3: Conditional grant closure

$\mathrm{Fix}(\Delta_s)$ is a sub-Heyting-algebra of $H_s$.
Consequently, if a scope-condition proposition $c \in \mathrm{Fix}(\Delta_s)$ and a granted-act proposition $g \in \mathrm{Fix}(\Delta_s)$, then the conditional authority $c \Rightarrow g \in \mathrm{Fix}(\Delta_s)$.

*Proof.* $\mathrm{Fix}(\Delta_s) = \bigcap_{s' \perp s} \mathrm{image}(H(i_{s', ss'}))$.
Each factor is a sub-HA; a finite intersection of sub-HAs of a Heyting algebra is a sub-HA.
Therefore $\mathrm{Fix}(\Delta_s)$ is closed under $\Rightarrow$. $\square$

This is the formal content of the boundedness invariant: a well-bounded delegation produces a scope condition and grant that are both forward-committed, making the conditional authority $c \Rightarrow g$ forward-committed.
An unbounded grant ($g = \top_s$) trivializes to $c \Rightarrow \top_s = \top_s$, making the scope condition the sole constraint.

## Proposition 4: Accountability non-transfer as directional asymmetry

The principal's accountability proposition $\alpha \in H^*_t$ is not in $\mathrm{image}(\rho_{t \to s})$, because $\alpha$ is a proposition of $H_t$ and $\mathrm{image}(\rho_{t \to s}) \subseteq H_s$, which is a different fiber.
There is no HA morphism from $H_s$ to $H_t$ in the sheaf â€” restriction maps run in the direction of the presheaf ordering ($t \to s$, not $s \to t$).
No operation at $s$ generates an element of $H_t$.

*Proof.* The presheaf $H : T^{\mathrm{op}} \to \mathbf{HA}$ is contravariant: morphisms $s \leq t$ in $T$ yield morphisms $H_t \to H_s$ in $\mathbf{HA}$, not the reverse.
Since $s \leq t$ and $s \neq t$, there is no morphism $H_s \to H_t$ in the presheaf.
The accountability proposition $\alpha$ remains in $H_t$, inaccessible to operations at $s$. $\square$

## Proposition 5: Delegatus non potest delegare â€” the quotient bound

Let $B$ sub-delegate to $C$ at $r \leq s$.
By presheaf functoriality, $\rho_{s \to r} \circ \rho_{t \to s} = \rho_{t \to r}$.
Therefore $\mathrm{image}(\rho_{s \to r}|_{\mathrm{image}(\rho_{t \to s})}) \subseteq \mathrm{image}(\rho_{t \to r}) \subseteq H_r$.
The sub-HA that $C$ receives is contained in the sub-HA that would result from $Q$ delegating directly to $r$: $B$ cannot give $C$ more than $Q$ could have given $C$ directly.

*Proof.* Any $x \in \mathrm{image}(\rho_{t \to s})$ has the form $\rho_{t \to s}(a)$ for some $a \in H_t$.
Then $\rho_{s \to r}(x) = \rho_{s \to r}(\rho_{t \to s}(a)) = \rho_{t \to r}(a) \in \mathrm{image}(\rho_{t \to r})$.
So $\rho_{s \to r}(\mathrm{image}(\rho_{t \to s})) \subseteq \mathrm{image}(\rho_{t \to r})$. $\square$

This separates capacity from authorization: the HA structure forces $C$'s space inside $\mathrm{image}(\rho_{t \to r})$ (the ceiling).
Whether $B$'s sub-delegation is a valid act is a separate question about which morphisms are in the normative covering of the history site (the floor).

## Delegation and trust

When $Q$ delegates $G$ to $B$, $Q$ extends trust in the sense of a trust triple $\mathcal{T} = (Q, B, G)$: $Q$ is the truster, $B$ is the entrusted party, and $G$ is the trust domain. $Q$ accepts vulnerability to $B$'s exercise of $G$.
The `residual-accountability` component is what makes this an asymmetric exposure: $Q$ retains accountability even while depending on $B$'s goodwill within $G$.

This connection makes explicit why delegation to a fiduciary carries the strongest legal protections: when the delegated grant concerns a critical resource and the trust exposure is maximal (the beneficiary cannot be monitored), the law imposes fiduciary duties on top of the bare delegation structure.

## Open questions

- Whether the presheaf/Heyting algebra model is the right formalization.
  The model predicts specific structural facts (authority is a sub-HA, sub-delegation is bounded by presheaf functoriality, accountability can't transfer because restriction maps are one-directional).
  Are there cases in real organizational practice where these predictions fail?
- Whether the boundedness invariant admits fuzzy specification â€” whether "broad but non-total" delegations (e.g., "handle all operational matters during my absence") are valid delegations or structural abdications.
- Whether contract and delegation are formally separable: whether a delegation backed by consideration (a paid agency arrangement) is a contract with a delegation as its subject matter, or whether the contractual frame changes the delegation's structure.
- Whether irrevocable delegations (trust deed, statutory powers, power of attorney coupled with an interest) are genuine delegations or substitutions.

## See also

- [delegation](../terms/delegation.md) â€” the concept this text formalizes
- [office](../terms/office.md) â€” the normative position concept, which uses the same presheaf framework
- [The Office as Normative Presheaf](./formal-structure-of-office.md) â€” the companion text for offices
