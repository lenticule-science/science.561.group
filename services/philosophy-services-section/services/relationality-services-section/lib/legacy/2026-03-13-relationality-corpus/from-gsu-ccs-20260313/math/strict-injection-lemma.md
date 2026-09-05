---

name: strict-injection-lemma
description: "restriction maps on H* are surjective (by the Delta-Lifting canonical transfer); for non-periodic histories they are strict surjections; composites of strict surjections of finite Heyting algebras are strict surjections — completing the proof of patch-separation-equivalence direction (B) implies (A)."
---

### Lemma — Strict Injection for Aperiodic Histories {#strict-injection-lemma}

This lemma completes the proof of §patch-separation-equivalence by establishing the
direction (B) $\Rightarrow$ (A): if no single-step restriction map is an isomorphism,
then no multi-step restriction map is an isomorphism, hence $(H_U)^*$ is conservative.

#### Restriction Maps on $H^*$ Are Surjective {#strict-injection-surjective}

**Lemma (Canonical Transfer Surjectivity).** For every history $t \in T$, step $s \in \Sigma$
with $s \perp t$, and element $a \in H^*_t$, there exists $\tilde{a} \in H^*_{s \star t}$ such
that
$$
H^*(i_{s,t})(\tilde{a}) \;=\; a.
$$
The restriction map $H^*_{s \star t} \to H^*_t$ is surjective.

**Proof.** Since $a \in H^*_t \subseteq \mathrm{Fix}(\Delta_t)$, the $\Delta$-Lifting Lemma
(§delta-linking) furnishes a canonical transfer element $\widetilde{a}_{s,t} \in H_{s \star t}$
satisfying:
$$
H(i_{s,t})(\widetilde{a}_{s,t}) = a
\qquad\text{and}\qquad
\widetilde{a}_{s,t} \in \mathrm{Fix}(\Delta_{s \star t}).
$$

Define $\tilde{a} := \sigma_{s \star t}(\widetilde{a}_{s,t})$. Since $\widetilde{a}_{s,t} \in
\mathrm{Fix}(\Delta_{s \star t})$ and $\Delta_{s \star t}$ commutes with $\sigma_{s \star t}$
(§nucleus-commutation), we have $\Delta_{s \star t}(\tilde{a}) = \tilde{a}$. Also
$\sigma_{s \star t}(\tilde{a}) = \tilde{a}$ by idempotence of $\sigma_{s \star t}$.
Therefore $\tilde{a} \in H^*_{s \star t}$.

It remains to check that $\tilde{a}$ restricts to $a$. By naturality of $\sigma$
(§fiber-doctrine — restriction maps commute with both nuclei):
$$
H(i_{s,t})(\tilde{a})
= H(i_{s,t})(\sigma_{s \star t}(\widetilde{a}_{s,t}))
= \sigma_t(H(i_{s,t})(\widetilde{a}_{s,t}))
= \sigma_t(a)
= a,
$$
where the last equality uses $a \in \mathrm{Fix}(\sigma_t)$. $\square$

By induction on path length, every restriction map $H^*_{t'} \to H^*_t$ (for $t \leq t'$
in $T$) is surjective: apply Canonical Transfer Surjectivity at each step of the path
from $t$ to $t'$.

#### Non-Periodic Histories Give Strict Surjections {#strict-injection-strict}

**Lemma (Strict Surjection).** If $t$ is not locally periodic along $s$ — that is, the
restriction map $H^*_{s \star t} \to H^*_t$ is not an isomorphism — then it is a
**strict surjection**: surjective but not injective, i.e., $|H^*_{s \star t}| > |H^*_t|$
(in the sense of the Heyting algebra lattice dimension).

**Proof.** By Canonical Transfer Surjectivity, the restriction is surjective. By
hypothesis, it is not an isomorphism. For a surjective map of finite Heyting algebras
(which have finite carrier sets, by the fiber doctrine §fiber.md), "not an isomorphism"
is equivalent to "not injective" is equivalent to "the domain has strictly more elements
than the codomain": $|H^*_{s \star t}| > |H^*_t|$. $\square$

#### Composites of Strict Surjections Are Strict Surjections {#strict-injection-composite}

**Lemma (Composition).** If $f: A \to B$ and $g: B \to C$ are strict surjections of
finite sets (with $|A| > |B|$ and $|B| > |C|$), then $g \circ f: A \to C$ is a strict
surjection ($|A| > |C|$).

**Proof.** Transitivity of strict inequality: $|A| > |B| > |C|$ implies $|A| > |C|$.
The composite is surjective (composite of surjections) and not injective (domain strictly
larger than codomain), hence a strict surjection. $\square$

#### Completion of the Patch Separation Equivalence {#strict-injection-completion}

**Theorem.** For a patch site $(U, J_U)$, conditions (A) and (B) of §patch-separation-equivalence
are equivalent:
- **(A)** $(H_U)^*$ is conservative: no non-identity morphism in $U$ maps to an isomorphism.
- **(B)** No single-step restriction is an isomorphism: $H^*_{t \cdot s^{n+1}} \to H^*_{t \cdot s^n}$
  is not an iso for any $t \in U$, $s \in \Sigma$, $n \geq 0$.

**Proof of (A) $\Rightarrow$ (B).** A single-step restriction is a special case of a
non-identity morphism. If (A) holds, no non-identity morphism maps to an iso, hence no
single-step restriction is an iso. $\checkmark$

**Proof of (B) $\Rightarrow$ (A).** Suppose (B) holds. Let $t < t'$ be any pair of
distinct histories in $U$ with $t' = t \cdot s_1 \cdots s_k$ for some sequence of steps.
The restriction map $H^*_{t'} \to H^*_t$ factors as a chain of $k$ single-step restrictions:
$$
H^*_{t'} \to H^*_{t \cdot s_1 \cdots s_{k-1}} \to \cdots \to H^*_{t \cdot s_1} \to H^*_t.
$$
By (B), each single-step restriction is not an iso; by Canonical Transfer Surjectivity,
each is surjective; by Strict Surjection, each satisfies $|A| > |B|$ strictly; by
Composition, the composite satisfies $|H^*_{t'}| > |H^*_t|$ strictly; therefore the
composite restriction $H^*_{t'} \to H^*_t$ is not an iso. Since $t < t'$ was arbitrary,
$(H_U)^*$ is conservative. $\checkmark$ $\square$

**Corollary.** The equivalence (A) $\Leftrightarrow$ (B) $\Leftrightarrow$ (C) in
§patch-separation-equivalence is now unconditional on the (A) $\Leftrightarrow$ (B) side.
The connection to $U_G$ convergence (C) remains conditional on §aperiodicity-halting.
