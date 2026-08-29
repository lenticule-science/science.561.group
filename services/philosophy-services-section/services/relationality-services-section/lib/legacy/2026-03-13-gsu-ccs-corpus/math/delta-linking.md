---
id: delta-linking
name: DeltaLinking
description: "Delta Linking: Transfer Nucleus and Trace Extensions"
---

### Theorem — Transfer Nucleus Linking {#delta-linking}

The transfer nucleus $\Delta_t$ is characterized by its interaction with
actual history extension morphisms, not merely by its fixed-point algebra. This
section makes that interaction precise.

#### Transfer Witness Characterization {#delta-linking-witness}

**Proposition.** For $a \in H_t$, the following are equivalent:
1. $a \in \mathrm{Fix}(\Delta_t)$, i.e., $\Delta_t(a) = a$.
2. For every $s \in \Sigma$ with $s \perp t$, there exists $b \in H_{s \star t}$
   such that $H(i_{s,t})(b) = a$.

*Proof.* By definition (§fiber-doctrine), $\mathrm{Fix}(\Delta_t) = \bigcap_{s \perp t}
\mathrm{image}(H(i_{s,t}))$. So $a \in \mathrm{Fix}(\Delta_t)$ iff $a$ lies in the image
of $H(i_{s,t})$ for every $s \perp t$ iff condition (2) holds. $\square$

This gives the **transfer witness** reading of $\Delta_t$: a proposition $a \in H_t$
is transfer-stable exactly when it arises as the restriction of some proposition in
every possible one-step extension of $t$.

**Definition — Canonical transfer.** For $s \perp t$ and $a \in \mathrm{Fix}(\Delta_t)$,
a **canonical transfer** of $a$ along $s$ is an element $\widetilde{a}_{s,t} \in H_{s \star t}$
satisfying:
1. $H(i_{s,t})(\widetilde{a}_{s,t}) = a$ (it restricts back to $a$);
2. $\widetilde{a}_{s,t} = \Delta_{s \star t}(\widetilde{a}_{s,t})$ (it is itself fixed by $\Delta$ at the extended history).

#### The Δ-Lifting Lemma {#delta-lifting}

**Lemma (Δ-Lifting).** Let $s \perp t$ and $a \in \mathrm{Fix}(\Delta_t)$. Then there
exists a canonical transfer $\widetilde{a}_{s,t} \in \mathrm{Fix}(\Delta_{s \star t})$
with $H(i_{s,t})(\widetilde{a}_{s,t}) = a$.

*Proof sketch.* Since $a \in \mathrm{Fix}(\Delta_t)$, condition (2) of the witness
characterization gives some $b \in H_{s \star t}$ with $H(i_{s,t})(b) = a$. Set
$\widetilde{a}_{s,t} := \Delta_{s \star t}(b)$. Then:

- $H(i_{s,t})(\widetilde{a}_{s,t}) = H(i_{s,t})(\Delta_{s \star t}(b)) = \Delta_t(H(i_{s,t})(b))
  = \Delta_t(a) = a$,
  using nucleus preservation (§reindexing): $H(f) \circ \Delta_{t'} = \Delta_t \circ H(f)$.
- $\Delta_{s \star t}(\widetilde{a}_{s,t}) = \Delta_{s \star t}(\Delta_{s \star t}(b))
  = \Delta_{s \star t}(b) = \widetilde{a}_{s,t}$ by idempotence of $\Delta_{s \star t}$.

So $\widetilde{a}_{s,t} \in \mathrm{Fix}(\Delta_{s \star t})$ and restricts to $a$. $\square$

**Corollary.** The restriction of the transfer functor to fixed fibers:
$$
H(i_{s,t})\big|_{H_{s \star t}^\ast} : H_{s \star t}^\ast \longrightarrow H_t^\ast
$$
is surjective onto $\mathrm{Fix}(\Delta_t) \cap H_t^\ast$, with the canonical
transfer providing a set-theoretic right inverse.

*Note:* the canonical transfer is not in general unique (the preimage of $a$ under
$H(i_{s,t})$ need not be a singleton), but the $\Delta$-closure makes it canonical.

#### The Linking Axiom {#delta-linking-axiom}

The preceding establishes that $\Delta_t$ is governed by the following **linking rule**:
for every extension morphism $i_{s,t} : t \to s \star t$ in $T$ (where $s \perp t$),
the diagram
$$
\begin{CD}
H_{s \star t} @>{H(i_{s,t})}>> H_t \\
@V{\Delta_{s \star t}}VV @VV{\Delta_t}V \\
H_{s \star t} @>>{H(i_{s,t})}> H_t
\end{CD}
$$
**commutes**: $H(i_{s,t}) \circ \Delta_{s \star t} = \Delta_t \circ H(i_{s,t})$.

This is the already-proved nucleus preservation from §reindexing, now stated explicitly
as the **Δ-linking axiom**: every extension morphism is a morphism in $\mathbf{HA_{nucl}}$
(it intertwines both nuclei). The lifting lemma is the converse direction: intertwining
is not just a constraint but a generator of canonical transfers.

#### Adjoint Characterization {#delta-linking-adjoint}

The transfer nucleus $\Delta_t$ is the right adjoint of the "forget-transfer"
map in the following precise sense.

Define the functor $\iota : \mathrm{Fix}(\Delta_t) \hookrightarrow H_t$ (inclusion of
the full subcategory of $\Delta_t$-fixed elements, viewed as a functor between thin
categories / posets). Then:
$$
\Delta_t : H_t \to H_t \quad\text{is the reflection onto } \mathrm{Fix}(\Delta_t)
$$
in the sense that the inclusion $\iota : \mathrm{Fix}(\Delta_t) \hookrightarrow H_t$
has $\Delta_t$ as its left adjoint:
$$
\Delta_t(a) \leq_{\mathrm{Fix}(\Delta_t)} c \iff a \leq_{H_t} \iota(c)
\quad\text{for all } a \in H_t,\; c \in \mathrm{Fix}(\Delta_t).
$$
Since $\Delta_t(a) \geq a$ (extensivity) and $c = \iota(c)$, the left-to-right direction
requires $a \leq \Delta_t(a) \leq c$, which holds iff $a \leq c$. The right-to-left
direction: if $a \leq c$ and $c \in \mathrm{Fix}(\Delta_t)$, then $\Delta_t(a) \leq
\Delta_t(c) = c$ (by monotonicity and fixed-point property). ✓

This adjunction is the categorical content of $\Delta_t$: it is the **reflection into the
transfer-stable layer**, and the unit of the adjunction is the extensivity map
$a \leq \Delta_t(a)$.

**Consequence for history extensions.** For $f : t \to t'$ any prefix morphism, the
nucleus preservation $H(f) \circ \Delta_{t'} = \Delta_t \circ H(f)$ (§reindexing)
is the statement that $H(f)$ is a morphism of reflection pairs
$(\mathrm{Fix}(\Delta_{t'}), H_{t'}) \to (\mathrm{Fix}(\Delta_t), H_t)$:
it maps $\Delta_{t'}$-reflections to $\Delta_t$-reflections, coherently. This is the
linking axiom in its most compact form.
