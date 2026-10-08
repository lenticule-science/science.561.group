---
type: theorem
status: sketch
depends-on:
  - locution-illocution-perlocution-factorization
  - klein-four-symmetry
  - four-bilattice
  - positing-morphism
  - closure-operator
  - belnap-speech-act-partition
  - negation
  - conflation
  - predication-settling-category
see-also:
  - dihedral-symmetry-on-twist-products
  - negation-invisibility
  - conflation-strong-mld
  - channel-theoretic-speech-acts
  - bilattice-two-orders-duality
title: Klein-four symmetry stratifies the locution-illocution-perlocution factorization
description: "The Klein-four bilattice symmetry group $K4 = \\langle \\sim, - \\rangle$ acts on the three factors of the locution-illocution-perlocution factorization in three structurally distinct ways:"
---

# Klein-four symmetry stratifies the locution-illocution-perlocution factorization

The Klein-four bilattice symmetry group $K_4 = \langle \sim, - \rangle$ acts on the three factors of the [locution-illocution-perlocution factorization](../../research/2026/07/31/lenticule-import/from-predicate-category/locution-illocution-perlocution-factorization.md) in three structurally distinct ways:

| Factor | $K_4$-action | Equivariance |
|---|---|---|
| Locution (cell selection) | Trivial — $K_4$ doesn't touch the cell index | $K_4$-equivariant trivially |
| Illocution (positing) | Non-trivial — $g \in K_4$ permutes the Belnap class of the speech act | $K_4$-equivariant non-trivially |
| Perlocution (closure) | $K_4$-action conditional on the closure-rule system | $K_4$-equivariant **iff** the rule system is $K_4$-closed |

Each generator of $K_4$ acts on illocution along its own axis: $\sim$ permutes Asserting ↔ Denying (fixing Abstain, Contest); $-$ permutes Abstain ↔ Contest (fixing Assert, Deny); $\sim \circ -$ permutes both pairs. The action stratifies the three factors of the speech-act decomposition by their *invariance group*: locution is $K_4$-invariant, illocution is *not* $K_4$-invariant but is $K_4$-equivariant, perlocution is *neither* $K_4$-invariant *nor* $K_4$-equivariant in general — its equivariance is a conditional property of the rule system.

The corpus's bilattice $K_4$-symmetry is therefore not a uniform feature of the speech-act apparatus but a *middle-layer-specific* phenomenon, with the lower (locution) and upper (perlocution) layers obeying different invariance regimes. This refines [belnap-speech-act-partition](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/belnap-speech-act-partition.md), which establishes the $K_4$-action on the Belnap classes themselves; the present theorem establishes that this action *only* lives in the middle of the speech-act factorization, with the rest of the apparatus behaving differently.

## Statement

Fix a [predication settling category](../../research/2026/07/31/lenticule-import/objects/predication-settling-category.md) $\mathbf{PS}_\Phi$ over base $(\mathbf{L}, \mathcal{C}, E, \lambda)$ with a closure-rule system $\mathcal{S}$ generating closure operator $\mathrm{cl}^\mathcal{S}$. Let $g \in K_4 = \langle \sim, - \rangle$ act on settlings cellwise via $g \cdot v(s, o) := g(v(s, o))$.

The locution-illocution-perlocution factorization of an operationally-realizable settling step $v_0 \to v_1 = \mathrm{cl}^\mathcal{S}(v_0 \vee_k \delta_{\phi, q})$ is

$$(v_0, \phi) \xrightarrow{(\mathrm{id}, \phi)} (v_0, \phi) \xrightarrow{(\mathrm{posit}_{(\phi, q)}, \phi)} (v_0 \vee_k \delta_{\phi, q}, \phi) \xrightarrow{(\mathrm{cl}^\mathcal{S}, \phi)} (v_1, \phi).$$

**(L) Locution is $K_4$-equivariantly trivial.** For every $g \in K_4$ and every $(v, \phi) \in \mathbf{PS}_\Phi$,

$$\pi(g \cdot v, \phi) = \phi = \pi(v, \phi),$$

where $\pi : \mathbf{PS}_\Phi \to \Phi$ is the locution projection. The $K_4$-action commutes with $\pi$ as the identity on the codomain.

**(I) Illocution is $K_4$-equivariantly non-trivial.** For every $g \in K_4$, the positing morphism intertwines with the $K_4$-action via the Belnap-class permutation:

$$g \cdot \mathrm{posit}_{(\phi, q)}(v) = \mathrm{posit}_{(\phi, g \cdot q)}^{(g)}(g \cdot v),$$

where $\mathrm{posit}^{(g)}$ is the *$g$-twisted positing morphism*: standard $\vee_k$-positing when $g$ is $\leq_k$-monotone (i.e., $g \in \{\mathrm{id}, \sim\}$), and $\wedge_k$-positing (a co-positing or retraction-style operation) when $g$ is $\leq_k$-antitone (i.e., $g \in \{-, \sim \circ -\}$).

In particular: $\sim$ takes assertive positing of $q = \mathbf{t}$ to assertive positing of $\sim q = \mathbf{f}$, i.e., **a denial**. $-$ takes assertive positing of $q = \mathbf{t}$ to co-positing of $-q = \mathbf{t}$, i.e., **a withdrawal-of-contestation** (a $\wedge_k$-retraction step at the truth-axis).

**(P) Perlocution is $K_4$-equivariant iff $\mathcal{S}$ is $K_4$-closed.** Define $\mathcal{S}$ to be **$g$-closed** if for every rule $r \in \mathcal{S}$, the $g$-twisted rule $g \cdot r$ (with all antecedent and consequent values replaced by their $g$-images) is derivable from $\mathcal{S}$. $\mathcal{S}$ is **$K_4$-closed** if it is $g$-closed for every $g \in K_4$. Then:

$$g \cdot \mathrm{cl}^\mathcal{S}(v) = \mathrm{cl}^\mathcal{S}(g \cdot v) \quad \text{for every } g \in K_4 \quad\iff\quad \mathcal{S} \text{ is } K_4\text{-closed}.$$

For generic rule systems $\mathcal{S}$, $K_4$-equivariance of perlocution fails. The **$K_4$-closure defect** of $\mathcal{S}$ — the smallest extension of $\mathcal{S}$ that is $K_4$-closed — measures precisely the failure.

**Conclusion (the stratification theorem).** $K_4$ acts on the L/I/P factorization as

$$\mathrm{loc} : \text{trivially},\qquad \mathrm{illoc} : \text{non-trivially},\qquad \mathrm{perloc} : \text{conditionally},$$

with each layer having a distinct invariance regime.

## Proof

**(L).** $\pi(v, \phi) = \phi$ depends only on the cell index, not on the settling values. $K_4$ acts cellwise on values; cells are unchanged. Hence $\pi(g \cdot v, \phi) = \phi$ for all $g \in K_4$. ✓

**(I).** Compute $g \cdot \mathrm{posit}_{(\phi, q)}(v) = g \cdot (v \vee_k \delta_{\phi, q})$.

- *Case $g = \mathrm{id}$.* Trivial.
- *Case $g = \sim$.* $\sim$ is $\leq_k$-monotone-and-involutive, hence a $\vee_k$-homomorphism: $\sim(a \vee_k b) = \sim a \vee_k \sim b$. So $\sim \cdot (v \vee_k \delta_{\phi, q}) = (\sim v) \vee_k (\sim \delta_{\phi, q}) = (\sim v) \vee_k \delta_{\phi, \sim q}$. This is positing $\sim q$ at $\phi$ from below in $\leq_k$.

   On Belnap classes via [belnap-speech-act-partition](../../../../../../../relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/undated/belnap-speech-act-partition.md): $q = \mathbf{t}$ (Assert) becomes $\sim q = \mathbf{f}$ (Deny); $q = \mathbf{f}$ (Deny) becomes $\sim q = \mathbf{t}$ (Assert); $q = \bot$ (Abstain) and $q = \top$ (Contest) are fixed.
- *Case $g = -$.* $-$ is $\leq_k$-antitone-and-involutive, hence sends $\vee_k$ to $\wedge_k$: $-(a \vee_k b) = -a \wedge_k -b$. So $- \cdot (v \vee_k \delta_{\phi, q}) = (-v) \wedge_k (-\delta_{\phi, q}) = (-v) \wedge_k \delta_{\phi, -q}$.

   This is *not* a $\vee_k$-positing of $-q$ — it's a $\wedge_k$-restriction. Mechanically: positing-from-below in $\leq_k$ becomes restriction-from-above. On Belnap classes: $q = \bot$ (Abstain) becomes $-q = \top$ (Contest) and the operation becomes a $\wedge_k$-restriction-at-Contest; $q = \top$ becomes $-q = \bot$ with a $\wedge_k$-restriction-at-Abstain; $q = \mathbf{t}, \mathbf{f}$ are fixed values, but the operation type changes from $\vee_k$-positing to $\wedge_k$-restriction.
- *Case $g = \sim \circ -$.* Composition of the two prior cases: $\vee_k \mapsto \wedge_k$ via $-$, then $\wedge_k \mapsto \wedge_k$ via $\sim$ (since $\sim$ is $\vee_k$- *and* $\wedge_k$-preserving as a $\leq_k$-monotone bilattice automorphism). Net: $\vee_k$-positing $q$ becomes $\wedge_k$-restriction at $\sim - q = -\sim q$.

In every case, the twisted operation $\mathrm{posit}_{(\phi, g \cdot q)}^{(g)}$ is well-defined and the equivariance holds. ✓

**(P), ⇐ direction (rule-system-closed ⇒ closure-equivariant).** Suppose $\mathcal{S}$ is $K_4$-closed. The closure operator $\mathrm{cl}^\mathcal{S}$ is defined as the smallest closure operator above $v_0$ satisfying every rule in $\mathcal{S}$. For $g \in K_4$:

$$g \cdot \mathrm{cl}^\mathcal{S}(v_0) = g \cdot \bigvee_k \{w : w \geq_k v_0 \text{ and } w \text{ satisfies every } r \in \mathcal{S}\}.$$

When $g \in \{\mathrm{id}, \sim\}$ (i.e., $\leq_k$-monotone), $g$ commutes with $\bigvee_k$:

$$= \bigvee_k \{g \cdot w : w \geq_k v_0 \text{ and } w \models \mathcal{S}\}.$$

Now $g \cdot w \geq_k g \cdot v_0$ (by $\leq_k$-monotonicity of $g$) and $g \cdot w \models g \cdot \mathcal{S} = \mathcal{S}$ (by $K_4$-closure). So the right-hand side equals $\mathrm{cl}^\mathcal{S}(g \cdot v_0)$.

When $g \in \{-, \sim \circ -\}$ (i.e., $\leq_k$-antitone), $g$ sends $\bigvee_k$ to $\bigwedge_k$, and the closure $\mathrm{cl}^\mathcal{S}$ has a dual realization as a $\leq_k$-antitone retraction-style operator $\mathrm{cl}^{\mathcal{S}, \mathrm{dual}}$. Under $g$-twisting, the closure on the dual side picks up the same $K_4$-closure hypothesis applied to the dual rule-set. So the equivariance still holds, in the form

$$g \cdot \mathrm{cl}^\mathcal{S}(v) = \mathrm{cl}^{\mathcal{S}, \mathrm{dual}}(g \cdot v),$$

with $\mathrm{cl}^{\mathcal{S}, \mathrm{dual}} = \mathrm{cl}^\mathcal{S}$ precisely under $K_4$-closure. ✓

**(P), ⇒ direction (closure-equivariant ⇒ rule-system-closed).** Suppose $g \cdot \mathrm{cl}^\mathcal{S}(v) = \mathrm{cl}^\mathcal{S}(g \cdot v)$ for every $v$ and every $g \in K_4$. Fix a rule $r \in \mathcal{S}$ with antecedent valuation $v_r$ and consequent $w_r$. By construction, $\mathrm{cl}^\mathcal{S}(v_r) \geq_k w_r$. Applying $g$:

$$g \cdot \mathrm{cl}^\mathcal{S}(v_r) = \mathrm{cl}^\mathcal{S}(g \cdot v_r) \geq_? g \cdot w_r.$$

The $\geq_?$ holds iff the $g$-twisted rule $g \cdot r$ (with antecedent $g \cdot v_r$ and consequent $g \cdot w_r$) is derivable from $\mathcal{S}$. Since $g$ and $v$ were arbitrary, this holds for every rule and every $g \in K_4$ — i.e., $\mathcal{S}$ is $K_4$-closed. ✓

**(Conclusion).** The three factors have three distinct $K_4$-behaviors: trivial, non-trivial-but-equivariant, conditional. $\square$

## Remarks

**Why this is structural.** Austin/Searle distinguished locution, illocution, and perlocution philosophically. The corpus's [factorization theorem](../../research/2026/07/31/lenticule-import/from-predicate-category/locution-illocution-perlocution-factorization.md) realizes the distinction *mathematically* as a three-factor decomposition of settling-steps. The present theorem adds a *symmetry-theoretic* witness to the distinction: the three layers have three distinct invariance groups under $K_4$. The philosophical claim "illocution and perlocution are structurally different" becomes the mathematical claim "$K_4$ acts non-trivially on illocution and conditionally on perlocution; the invariance groups don't coincide."

**Relation to $D_4$.** [Dihedral symmetry on de Morgan twist products](../../research/2026/07/31/lenticule-import/from-predicate-category/dihedral-symmetry-on-twist-products.md) extends $K_4$ to $D_4$ via the order-swap $\sigma$. The stratification of the present theorem lifts to $D_4$: $\sigma$ acts trivially on locution, non-trivially on illocution (rotating the speech-act diamond by the $\leq_k$-vs-$\leq_t$ axis swap), and conditionally on perlocution (with a strictly stronger closure condition than $K_4$-closure, namely $D_4$-closure). The lift may be its own follow-up theorem.

**Relation to [negation-invisibility](../../research/2026/07/31/lenticule-import/from-predicate-category/negation-invisibility.md) and [conflation-strong-mld](../../research/2026/07/31/lenticule-import/from-predicate-category/conflation-strong-mld.md).** Those theorems establish $K_4$-action-related invariance results at the level of *cohomology* (firing patterns, classifying invariants). The present theorem is the *layer-stratified* version: the invariance fails at the perlocution layer for non-$K_4$-closed rule systems, but the cohomology may still be invariant (because cohomology is computed downstream, after closure has acted, and the firing-pattern combinatorics depend only on the structural rules, not on per-step $K_4$-equivariance). Reconciling the two — when does the layer-stratified equivariance pattern lift to a cohomological invariance? — is its own substantive question.

**The $K_4$-closure-defect as a structural invariant.** For non-$K_4$-closed rule systems, the smallest $K_4$-closed extension $\mathcal{S}^{K_4}$ measures the rule-system's failure to respect the bilattice symmetry. The pair $(\mathcal{S}, \mathcal{S}^{K_4})$ is a candidate structural invariant of the rule system: when $\mathcal{S} = \mathcal{S}^{K_4}$, the system is symmetric; when $\mathcal{S}^{K_4} \setminus \mathcal{S}$ is large, the system is asymmetric in a quantitatively-trackable way. This invariant has no current name but plausibly belongs in the rule-system classification hierarchy.

**The Klein-four-acts-on-illocution-only slogan.** A natural informal reading is "Klein-four is an illocution-layer symmetry." The precise version is: $K_4$ acts trivially on locution (it doesn't touch cells), non-trivially on illocution (it permutes Belnap classes), and conditionally on perlocution (depending on rule-system $K_4$-closure). The slogan is correct as a center-of-mass statement; the precise theorem refines it three ways.

## Status

Sketch. The structural argument above is essentially complete for the $\mathbf{L} = \mathbf{2}$ case (where $\mathbf{L}^\bowtie = \mathbf{FOUR}$). Open:

- *General $\mathbf{L}$.* The argument lifts to arbitrary distributive integral commutative residuated lattices $\mathbf{L}$, but uniform verification of (I) and the dual-closure realization in (P, ⇐) requires care for $\mathbf{L}$ where $\sim$ and $-$ have different commutation properties with the residuation $\Rightarrow$.
- *Multi-step perlocution.* The proof above treats single-step closure. The multi-step (ordinal-indexed) closure used in transfinite-bounded and aperiodic regimes preserves the equivariance pattern by induction, but the limit-ordinal step at non-Scott-continuous firings needs explicit verification.
- *Connection to the cohomology stratification.* The present theorem is at the morphism-level (single step). The cohomology-level analog — whether $K_4$'s action on $\mathrm{cl}\text{-}\mathrm{inv}$ has the same stratification pattern — is open and likely depends on whether the rule system is $K_4$-closed.
