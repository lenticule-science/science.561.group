---

title: "Precedent"
description: "A Precedent is a triple (p, t₀, J) — a doubly-settled proposition p ∈ H*_{t₀}, the history t₀ at which the decision was made, and a propagation condition derived from the Grothendieck topology J that determines whether p persists to future histories. The defining structure: p is a precedent iff p ∈ Fix(RelationalHistoryFiberTransferringNucleus(t₀)) — iff p is forward-stable at t₀, meaning it exists in the image of every independent one-step extension restriction map. Precedent-following at history t > t₀ = a lifting: there exists a doubly-settled p_t ∈ H*_t with H(t → t₀)(p_t) = p, ensuring the precedent is carried by the history without loss. Precedent-overruling = a change to J such that p ∈ Fix(Δ_{t₀}) fails in the new topology, geometrically: a covering morphism f: R' → R between toposes that does not preserve the fixed sublocale containing p. Distinguished from Breach (failure to discharge a duty), Defection (incompatible output), and Delegation (which transfers authority but not accountability): precedent neither delegates nor discharges — it transmits normative structure forward through the presheaf."
date-created: 2026-03-21
---

## Formal definition

A **Precedent** is a triple $(p, t_0, J)$:

$$(p \in H^*_{t_0},\; t_0 \in T,\; J : \mathrm{GrothendieckTopology}(T))$$

where: - $p \in H^*_{t_0}$ is the **decision** — a doubly-settled proposition in the fiber at $t_0$; the decision is both backward-recognized ($\sigma_{t_0}(p) = p$) and forward-stable ($\Delta_{t_0}(p) = p$); only doubly-stable decisions constitute genuine precedents - $t_0 \in T$ is the **decision history** — the position in the history monoid at which $p$ was decided; the precedent is anchored to $t_0$, not free-floating; earlier histories see $p$ as a future constraint; later histories see $p$ as an inherited structure - $J$ is the **propagation topology** — the Grothendieck topology on the history site $(T, J)$; $J$ determines which covering families of histories witness $p$'s propagation; changing $J$ is the formal structure of overruling

**The precedent condition.** $(p, t_0, J)$ is a valid precedent iff:

$$p \;\in\; \mathrm{Fix}\bigl(\mathrm{RelationalHistoryFiberTransferringNucleus}(t_0)\bigr)$$

That is: $\Delta_{t_0}(p) = p$.
The forward-stability condition is not an additional requirement layered on top of double-stability — it is the structural content of double-stability that is relevant to propagation.
The saturation condition ($\sigma_{t_0}(p) = p$) confirms the decision is recognized; the transfer condition confirms it will persist.

**Four invariants.** $(p, t_0, J)$ is a precedent iff it satisfies:

1. **Double settlement at $t_0$**: $p \in H^*_{t_0}$.
  A bare assertion or an acknowledged-but-fragile decision is not a precedent; it must be in the joint fixed-point set.
  An element of $\mathrm{SatShadow}_{t_0}$ may be recognized historically but is not forward-persistent — it is an ad hoc decision, not a precedent.

2. **Forward persistence**: For every one-step extension $t_0' = \mathrm{gen}(s) \star t_0$ with $s \perp t_0$, there exists $p' \in H_{t_0'}$ with $H(t_0' \to t_0)(p') = p$.
  The precedent "lifts" through independent extensions — every independent new development must be compatible with $p$.
  This is exactly the transfer-stability condition.

3. **Coverage by the topology**: The covering sieves $J(t_0)$ recognize $p$'s decision history as a valid covering point — the normative system's covering structure confirms that $t_0$ was the right locus for this decision.
  A decision made without proper authority (outside the relevant covering family) fails this invariant even if the decision itself is well-formed.

4. **Propagation coherence**: For any histories $t, t'$ both above $t_0$ with $p_t \in H^*_t$ and $p_{t'} \in H^*_{t'}$ both lifting $p$, the restrictions $H(t \wedge t' \to t)(p_t) = H(t \wedge t' \to t')(p_{t'})$ agree at their common meet.
  Precedent-following is globally coherent across divergent histories — if two independent lines of development both follow the precedent, their decisions about $p$ are compatible.

## Etymology and legal grounding

**Precedent** derives from Latin *praecedere* — *prae-* (before) + *cedere* (to go); literally, that which has gone before.
The legal term enters English in the 15th century as the principle that past decisions bind future decisions on analogous cases.

**Stare decisis** ("to stand by what has been decided") is the common law doctrine formalizing the binding force of precedent.
Its two dimensions: - **Vertical stare decisis**: lower courts are bound by higher courts' decisions (hierarchical binding, between different levels of the coverage structure) - **Horizontal stare decisis**: a court is (presumptively) bound by its own prior decisions (self-binding, within a single level)

The common law's nuanced doctrine of precedent was systematized by Blackstone (1765) and given its most rigorous jurisprudential analysis by Ronald Dworkin (*Law's Empire*, 1986): law is not merely a collection of rules but a coherent structure of principle — every decision must fit with all past decisions, and the legal system must be interpretable as an expression of coherent principles.
This is the **integrity condition**: the law must be understood as a coherent whole, with no past decision ignorable.

The Kelsenian **Grundnorm** (Hans Kelsen, *The Pure Theory of Law*, 1934) is the ultimate precedent — the presupposed founding norm from which all legal validity derives.
The Grundnorm is not itself a legal decision but the presupposition that makes all legal decisions valid.
In the nuclear reading: the Grundnorm is the element of $H^*_e$ at the root history $e$ — the only history with no predecessors — from which all future fibers are initialized.

## Precedent vs. decision vs. rule

Not every decision is a precedent, and not every rule is a decision.
The distinctions:

| Concept | Location in nuclear structure | Propagation condition |
|---|---|---|
| **Ruling** (ad hoc) | $\mathrm{SatShadow}_{t_0}$ — backward-recognized, forward-fragile | May not lift to all extensions |
| **Decision** | $\mathrm{TrShadow}_{t_0}$ — forward-committed, recognition pending | Forward-persistent but awaiting backward recognition |
| **Precedent** | $H^*_{t_0}$ with $\Delta_{t_0}(p) = p$ | Lifts to every independent one-step extension |
| **Rule** | $H^*_{t_0}$ with $p$ in the institution's constitutive core $C_{t_0}$ | Cannot be modified by ordinary acts; requires topology change to revise |
| **Grundnorm** | $H^*_e$ — doubly stable at the root | Trivially lifts to all histories (every restriction path passes through $e$) |

The Grundnorm occupies a special place: it is the unique element of $H^*_e$ that generates all other elements via the restriction maps.
A precedent is between a rule and a ruling in force: more stable than a ruling (it must be in $H^*_{t_0}$, not just $\mathrm{SatShadow}_{t_0}$) but less stable than a rule (it can be overruled, which requires a topology change rather than impossibility).

## Overruling: a geometric morphism

**Overruling** a precedent is the formal act of removing $p$ from the images of future restriction maps — making precedent-following impossible at some $t > t_0$.
The structure:

A **topology change** $J \to J'$ (a new Grothendieck topology on $T$) generates a **geometric morphism** $f : R' = \mathbf{Sh}(T, J') \to R = \mathbf{Sh}(T, J)$: a pair of adjoint functors $(f^*, f_*)$ satisfying the geometric morphism axioms.
The inverse image functor $f^* : R \to R'$ sends the presheaf $H$ (over the old topology $J$) to $f^*(H)$ (over the new topology $J'$).

Under the new topology $J'$, the element $p \in H^*_{t_0}$ may no longer be forward-stable: the covering families recognized by $J'$ may not include the extensions that $p$'s transfer stability depended on.
Formally: $\Delta^{J'}_{t_0}(p) > p$ under the new topology, even though $\Delta^J_{t_0}(p) = p$ under the old one.

Three consequences of overruling: 1.
The overruled precedent $p$ moves from $H^*_{t_0}$ to $\mathrm{SatShadow}^{J'}_{t_0}$ — it retains backward recognition (the history that established $p$ still happened) but loses forward stability (the new topology no longer commits to $p$ in future extensions) 2.
Every future decision that cited $p$ as authority is potentially weakened: the restriction maps above $t_0$ no longer carry $p$'s fixed-fiber status 3.
The overruling institution (the body that changed $J$) must itself have the authority to change $J$ — this is a second-order power in the Hohfeldian sense, the power to alter the covering structure itself

**Distinguishing** (a weaker operation than overruling) is the claim that the current history $t$ is not in the sieve that $p$ covers — the current case is materially different from the decision history $t_0$, so the precedent does not reach this history.
Formally: the restriction map $H(t \to t_0)$ does not include $t \to t_0$ in any covering sieve $S \in J(t_0)$ that supports $p$.
Distinguishing leaves the topology $J$ unchanged; it only denies that the current case is within $p$'s covering reach.

## Precedent and the depth filtration

**The depth filtration** gives a structural account of when a decision becomes a precedent.
At depth $n = 0$ (the root history $e$), the Grundnorm occupies the full fiber.
As depth increases, new histories are generated; each new history adds new fibers and new restriction maps.
A decision $p$ made at depth $n$ accumulates forward-stability as follows:

- At depth $n$ (the decision is made): $p \in \mathrm{TrShadow}_{t_0}$ or $H^*_{t_0}$ depending on the immediate topology
- At depth $n + k$ for small $k$: $p$ is tested against $k$ generations of restriction maps; its liftability to each generation is tracked
- **Prescription threshold**: the depth $k^*$ at which every extension history at depth $n + k^*$ that is reachable from $t_0$ has a lift of $p$ in $H^*$; after depth $k^*$, $p$ is a confirmed precedent

The **extremally-slow prescription rate** applies when the history system has the minimal non-trivial commutation structure (one commuting pair): the number of fibers that must carry $p$ before $p$'s precedential status is confirmed grows as $F_{k}$ (Fibonacci numbers).
This is the exact spectral gap of the nuclear transfer matrix $M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}$: the eigenvalues $\varphi$ and $-1/\varphi$ govern how fast precedential stability accumulates and how fast it decays when overruled.

*Content.* The golden ratio $\varphi = (1+\sqrt{5})/2$ is not an aesthetic feature of the law but the spectral content of the nuclear pair's non-adjointness: because $\sigma_{t_0}$ and $\Delta_{t_0}$ are not in Galois connection, the accumulation of precedential stability at each depth level requires contributions from BOTH shadow classes (the TrShadow and SatShadow chains), and their joint contribution per level is exactly $\varphi$-multiplicative.

## Nuclear reading

**Definitions.** Fix a history $t_0 \in T$ and a doubly-stable proposition $p \in H^*_{t_0}$.
The **precedent liftability** of $p$ to a later history $t \geq t_0$ is the condition that there exists $p_t \in H^*_t$ with $H(t \to t_0)(p_t) = p$.
The **propagation depth** of $p$ is the maximum depth $k$ such that every history at depth $\mathrm{depth}(t_0) + k$ reachable from $t_0$ has a lift of $p$ in $H^*$.

**Proposition 1 (Transfer-stability is the necessary and sufficient condition for local liftability).** For any $p \in H^*_{t_0}$ and any independent one-step extension $t_0' = \mathrm{gen}(s) \star t_0$ (with $s \perp t_0$):

$$p \in \mathrm{Fix}(\Delta_{t_0}) \;\iff\; p \in \mathrm{image}(H(t_0' \to t_0))$$

That is: $p$ is forward-stable at $t_0$ iff there exists $p' \in H_{t_0'}$ with $H(t_0' \to t_0)(p') = p$.
Transfer-stability is exactly local liftability — the condition that the precedent survives one independent step.

*Proof.* $\mathrm{Fix}(\Delta_{t_0}) = \bigcap_{s \perp t_0} \mathrm{image}(H(i_{s, t_0}))$ by definition of the transferring nucleus.
Therefore $p \in \mathrm{Fix}(\Delta_{t_0})$ iff $p \in \mathrm{image}(H(i_{s, t_0}))$ for all $s \perp t_0$, which is $p \in \mathrm{image}(H(t_0' \to t_0))$ for every independent one-step extension $t_0'$. $\square$

*Content.* A decision in $\mathrm{SatShadow}_{t_0}$ ($\sigma_{t_0}(p) = p$ but $\Delta_{t_0}(p) > p$) has backward recognition but fails local liftability: there exists some independent one-step extension $t_0'$ where no lift of $p$ exists.
The precedent cannot be followed at $t_0'$ — not because it has been overruled, but because the forward structure of the history site doesn't carry it.
This is the formal analog of an "ad hoc" ruling: recognized in its own context but not sufficiently general to lift to independent developments.

**Proposition 2 (The lift of a precedent is itself doubly stable).** If $p \in H^*_{t_0}$ and $p' \in H_{t'}$ with $H(t' \to t_0)(p') = p$ for some $t' \geq t_0$, then $p' \in H^*_{t'}$.

*Proof.* The restriction maps $H(t' \to t_0)$ commute with both nuclei: $H(t' \to t_0)(\sigma_{t'}(p')) = \sigma_{t_0}(H(t' \to t_0)(p')) = \sigma_{t_0}(p) = p$.
If $\sigma_{t'}(p') \neq p'$, then $H(t' \to t_0)(\sigma_{t'}(p')) = H(t' \to t_0)(p') = p$ but $\sigma_{t'}(p') > p'$, contradicting $\sigma_{t_0}(p) = p$ (which forces the restriction of any element above $p'$ to be above $p = p$, but the restriction of $\sigma_{t'}(p')$ equals $p = $ restriction of $p'$, so $\sigma_{t'}(p') = p'$ by the saturation-restriction intertwining).
Similarly for $\Delta_{t'}$.
Therefore $p' \in H^*_{t'}$. $\square$

*Content.* Lifts of precedents are themselves precedents.
The institution following a precedent does not degrade it to SatShadow or TrShadow — it carries it forward at the same full stability.
This is the sheaf-cohomological content: the global section corresponding to $p$ is lifted coherently.

**Proposition 3 (The coherence condition for multi-path precedent following).** Let $p \in H^*_{t_0}$ be a precedent.
Let $t_1, t_2 \geq t_0$ be two histories both reachable from $t_0$, with lifts $p_1 \in H^*_{t_1}$ and $p_2 \in H^*_{t_2}$.
Let $t_{12} = t_1 \wedge t_2$ (the meet of $t_1$ and $t_2$ in the history poset) be their greatest common sub-history above $t_0$.
Then the restrictions of $p_1$ and $p_2$ to $H_{t_{12}}$ agree:

$$H(t_1 \to t_{12})(p_1) \;=\; H(t_2 \to t_{12})(p_2) \;=\; p_{12}$$

and $p_{12} \in H^*_{t_{12}}$.

*Proof.* Both $p_1$ and $p_2$ restrict to $p$ at $t_0$ (by hypothesis).
By the sheaf condition on $H$, compatible local sections (sections that agree on their overlaps) have a unique amalgamation.
The sections $p_1 \in H^*_{t_1}$ and $p_2 \in H^*_{t_2}$ are compatible because they both restrict to $p$ at $t_0 \leq t_{12}$.
The amalgamation is $p_{12} \in H^*_{t_{12}}$. $\square$

*Content.* Precedent-following is globally coherent: two courts that both follow the same precedent — even developing the law independently along different doctrinal paths — produce decisions that are compatible at their common ground.
This is Dworkin's integrity condition formalized: the law as a whole is coherent precisely because precedent-following satisfies the sheaf condition.

**Proposition 4 (Overruling moves the overruled element from $H^*$ to $\mathrm{SatShadow}$ in the new topology).** Let $J'$ be a Grothendieck topology on $T$ with $J' \supset J$ (finer topology — more covering sieves).
Denote the nuclei under $J'$ as $\sigma'_{t_0}$ and $\Delta'_{t_0}$.
If $J'$ is chosen so that $\Delta'_{t_0}(p) > p$ (the new topology does not commit to $p$'s forward-stability), then $p \in \mathrm{SatShadow}^{J'}_{t_0}$ — backward-recognized under $J'$ (the history of the decision is still there) but no longer forward-stable.

*Proof.* Since $J'$ is finer than $J$, there are more covering sieves in $J'(t_0)$, potentially introducing new independent extensions that $p$ is not in the image of.
Specifically: if $J'$ adds a covering family $\{t_0' : t_0' \to t_0\}$ for which $p \notin \mathrm{image}(H(t_0' \to t_0))$ for some $t_0'$, then $\Delta^{J'}_{t_0}(p) = \min\{b \in \mathrm{Fix}(\Delta^{J'}_{t_0}) : b \geq p\} > p$.
Meanwhile $\sigma'_{t_0}(p) = p$ still (the backward recognition is unchanged — the decision history $t_0$ is still in the past). $\square$

*Content.* Overruling does not erase history.
The decision at $t_0$ remains part of the history; the saturation nucleus $\sigma'_{t_0}$ still recognizes $p$ as backward-settled (the old cases still happened).
What overruling removes is forward commitment: the overruled decision is no longer carried into future fibers.
The overruled precedent enters SatShadow — recognized, not followed.

**Proposition 5 (The Fibonacci prescription rate as spectral structure of precedent accumulation).** In the extremally-slow-growth regime (minimal non-trivial commutation: one commuting pair $(s_1, s_2) \in I$), the number of histories at depth $n$ above $t_0$ that must carry a lift of $p$ before precedential status is confirmed grows as $F_{n+1}$ (Fibonacci numbers).
The rate of confirmation per depth level converges to $\varphi = (1+\sqrt5)/2$ (the golden ratio eigenvalue of the nuclear transfer matrix $M = \begin{pmatrix}1 & 1 \\ 1 & 0\end{pmatrix}$).

*Proof.* By the nuclear Verlinde eigenvalue correspondence ([RelationalHistoryFiberNuclearVerlinde­EigenvalueCorrespondence](../../humanities/theories/math/relational-history-fiber-nuclear-verlinde-eigenvalue-correspondence.md)): the eigenvalues of $M$ are $\varphi$ and $-1/\varphi$.
The count $d_{t_0}(n)$ of fibers at depth $n$ above $t_0$ that must carry a lift satisfies the recurrence $d_{t_0}(n+1) = d_{t_0}(n) + d_{t_0}(n-1)$ — the Fibonacci recurrence driven by the two non-empty shadow classes.
The dominant eigenvalue $\varphi$ determines the asymptotic growth rate; the sub-dominant eigenvalue $-1/\varphi$ determines the oscillatory correction (the Binet formula). $\square$

*Content.* The golden ratio is not an aesthetic feature of legal precedent but the spectral consequence of nuclear pair non-adjointness: the two shadow classes (TrShadow and SatShadow) each contribute independently to precedent accumulation, and their independence is what drives the Fibonacci recurrence.
In legal terms: a decision becomes a precedent through two independent channels — backward recognition by subsequent decisions citing it (saturation direction) and forward commitment by the covering structure of the topology (transfer direction).
The non-adjointness of these two channels is what gives precedent-setting its Fibonacci growth rate.

## Precedent and the sheaf condition (Dworkin's integrity)

The sheaf condition on $H : T^{\mathrm{op}} \to \mathbf{HA}$ is the formal content of Dworkin's law-as-integrity.
The sheaf condition requires: for any covering sieve $S \in J(t_0)$, any compatible family of sections $(a_{t'})_{t' \in S}$ (sections at each history in the sieve that agree on overlaps) has a unique amalgamation $a_{t_0} \in H_{t_0}$.

Precedent-following is the special case where the covering family is the set of all histories above $t_0$ (the maximal sieve), and the compatible sections are all the lifts $p_t \in H^*_t$.
The sheaf condition guarantees that these local following-acts assemble into a global section — a coherent reading of the law as a whole that includes all precedents.

Dworkin's integrity condition ("the law must be interpretable as an expression of coherent principle") = the sheaf condition on the presheaf of legal validity: local legal decisions (sections at individual histories) must assemble into a globally coherent legal order (a global section over the full site).

**What breaks integrity:** A normative system fails the integrity condition when compatible local sections fail to assemble uniquely — when two lines of precedent-development that both follow some precedent $p$ arrive at incompatible conclusions at their meeting point $t_{12}$.
This is a failure of the sheaf axiom and corresponds to a contradiction in the normative system's coverage structure.

## Open questions

- Whether the **prescription threshold** $k^*$ — the depth at which a decision $p \in \mathrm{TrShadow}_{t_0}$ (forward-committed but not yet backward-recognized) becomes a genuine precedent $p \in H^*_{t_0}$ — has a structural formula in terms of the covering topology $J$ and the history's commutation structure, or whether it is always case-specific.

- Whether **vertical stare decisis** (higher-court decisions bind lower courts) can be formalized as a condition on the restriction maps between fibers at different levels of a hierarchical coverage structure — whether there is a topology $J_{\mathrm{hierarchy}}$ on $T$ that makes higher-level decisions automatically transfer-stable relative to lower-level extensions.

- Whether the **Grundnorm** (Kelsen) — the root-level precedent $p_e \in H^*_e$ — has a constructive specification or whether it must be posited as an axiom: whether the history site $(T, J)$ with its initial fiber $H_e$ has a canonical preferred element that plays the role of the Grundnorm, or whether the Grundnorm is always a choice.

- Whether the **second eigenvalue** $-1/\varphi$ of the nuclear transfer matrix has a legal interpretation: the negative-valued, oscillatory correction to Fibonacci precedent-accumulation corresponds to an alternating structure in the precedent history — decisions that align with the SatShadow direction subtract from the TrShadow direction and vice versa.
  Whether this alternation corresponds to pendulum-like doctrinal swings in law (expansive interpretations followed by restrictive ones, cycling at the spectral frequency of $-1/\varphi$).

- Whether **constitutional entrenchment** — making certain elements of $H^*_{t_0}$ immune to topology change (immune to overruling) — corresponds to a notion of a "super-sublocale" in $\mathrm{Sl}(H_{t_0})$ that is preserved by all geometric morphisms into $R$, and whether such super-sublocales are formal invariants of the topos $\mathbf{Sh}(T, J)$.

- Whether **common law development** (organic expansion of precedent by case-by-case application) and **statutory law** (top-down rules established by legislation) have distinct nuclear signatures: whether common law = the process of $p$ moving from TrShadow to $H^*$ through accumulated citations (saturation nucleus settling the decision), while statutory law = the process of $p$ being installed directly in $H^*$ by a constitutive act (declaration-type act bypassing the saturation accumulation).
