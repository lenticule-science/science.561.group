---
id: modal-weight-duality
name: ModalWeightDuality
description: "Observation: the lexicographic measure (fmlW, ent) for FiberNuclearLanguage corresponds to the two nuclei — one coordinate per nucleus, commutativity being the unique axiom requiring the second coordinate."
---

### Conjecture — Modal Weight Duality {#modal-weight-duality}

The lexicographic termination measure $(\mathsf{fmlW}, \mathsf{ent})$ for
FiberNuclearLanguage (§strong-normalization) is not an arbitrary well-founded pair. Its
two coordinates correspond precisely to the two nuclei $\sigma_t$ and $\Delta_t$,
and the unique rule requiring a second coordinate is the rewriting of the commutation
axiom $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ — the BiNucleus axiom that
distinguishes a genuine bi-nucleus from two independent nuclei.

---

#### The Two Coordinates and the Two Nuclei {#mwd-duality}

**$\mathsf{fmlW}$ is the joint modal weight.** It treats $\mathsf{Saturate}$ and
$\mathsf{Transfer}$ symmetrically: both operators multiply their argument's weight by $2$.
This symmetry reflects the algebraic parity of $\sigma_t$ and $\Delta_t$: both are
nuclei on the same Heyting algebra $H_t$, satisfying the same three conditions
(extensiveness, idempotence, meet-preservation). Neither nucleus has greater algebraic
weight than the other. $\mathsf{fmlW}$ measures the combined modal overhead, agnostic
to which operator appears where.

**$\mathsf{ent}$ is the $\Delta$-inside-$\sigma$ disorder.** It counts, for each
$\mathsf{Transfer}$ occurrence, how many $\mathsf{Saturate}$-headed ancestors it has — i.e.,
how deeply $\mathsf{Transfer}$ is embedded inside $\mathsf{Saturate}$. This measure is
asymmetric: wrapping in $\mathsf{Saturate}$ increases $\mathsf{ent}$; wrapping in
$\mathsf{Transfer}$ does not. The asymmetry is oriented by the direction of R7: the
normal form has $\mathsf{Saturate}$ inside $\mathsf{Transfer}$ (i.e.,
$\mathsf{Transfer}(\mathsf{Saturate}(-))$), so $\mathsf{ent}$ measures exactly the deviation
from the canonical ordering.

The two coordinates are dual to $\sigma_t$ and $\Delta_t$ in the following sense:
$\mathsf{fmlW}$ is the symmetric joint measure (neither nucleus distinguished);
$\mathsf{ent}$ is the asymmetric interaction measure (oriented by the ordering
$\Delta$ outside $\sigma$). Together they generate a two-dimensional space that
exactly separates the two kinds of work the reduction system performs.

---

#### The Deepest Axiom Generates the Deepest Termination Case {#mwd-depth}

The BiNucleus axioms fall into three strata by algebraic depth:

| Axiom | Rules | Involves |
|-------|-------|---------|
| Idempotence: $\sigma_t \sigma_t = \sigma_t$, $\Delta_t \Delta_t = \Delta_t$ | R1, R2 | One nucleus alone |
| Top-preservation: $\sigma_t(\top) = \top$, $\Delta_t(\top) = \top$ | R5, R6 | One nucleus alone |
| Meet-distribution: $\sigma_t(a \wedge b) = \sigma_t(a) \wedge \sigma_t(b)$ | R3, R4 | One nucleus alone |
| Commutativity: $\sigma_t \circ \Delta_t = \Delta_t \circ \sigma_t$ | R7 | Both nuclei together |

The first three strata involve a single nucleus. Each of their rules decreases
$\mathsf{fmlW}$: removing a redundant application (R1, R2, R5, R6) collapses
a $\times 2$ factor; distributing over $\wedge$ (R3, R4) replaces one $\times 2$ with
two additive $+1$ terms, a net decrease of exactly $1$.

The fourth stratum — commutativity — is the only axiom that relates $\sigma_t$ and
$\Delta_t$ as a pair. R7 ($\mathsf{Saturate}(\mathsf{Transfer}(M)) \to
\mathsf{Transfer}(\mathsf{Saturate}(M))$) is its rewriting. It neither creates nor destroys
modal operators; it only exchanges their positions. Since $\mathsf{fmlW}$ is symmetric
in both operators, R7 preserves $\mathsf{fmlW}$ exactly:
$$
\mathsf{fmlW}(\mathsf{Saturate}(\mathsf{Transfer}(M)))
= 4 \cdot \mathsf{fmlW}(M)
= \mathsf{fmlW}(\mathsf{Transfer}(\mathsf{Saturate}(M))).
$$
$\mathsf{fmlW}$ cannot witness termination of R7. The second coordinate $\mathsf{ent}$
is required: it strictly decreases by $1$ under each application of R7
(§strong-normalization §strong-normalization), since R7 removes exactly one
$\mathsf{Saturate}$-ancestor from the $\mathsf{Transfer}$ at the redex root.

The principle recorded here: **the algebraically deepest axiom (commutativity,
which requires both nuclei) generates the computationally deepest termination case
(the unique rule that exhausts the primary measure and requires a second coordinate).**
Single-nucleus axioms are absorbed by the first coordinate. Only the interaction axiom
escapes it.

---

#### Why Two Coordinates Are Sufficient {#mwd-sufficiency}

Every rule in R1–R19$'$ is accounted for by at most two coordinates:

- **First coordinate only** (R1, R2, R3, R4, R5, R6, R8–R19$'$): $\mathsf{fmlW}$
  strictly decreases. The congruence rules for these steps also decrease $\mathsf{fmlW}$
  by additivity.

- **Second coordinate** (R7 and its congruences): $\mathsf{fmlW}$ is preserved;
  $\mathsf{ent}$ strictly decreases.

There is no rule that preserves both $\mathsf{fmlW}$ and $\mathsf{ent}$. This is not
a coincidence: $\mathsf{ent}$ is defined to measure exactly the $\Delta$-inside-$\sigma$
disorder that R7 eliminates, so R7 is the unique rule that can preserve $\mathsf{fmlW}$
while necessarily decreasing $\mathsf{ent}$. No third coordinate is needed because
there is no rule that simultaneously preserves both.

The termination proof is two-dimensional because the reduction system has two kinds
of irreducibility to enforce — single-nucleus axioms, and the interaction axiom — and
one coordinate per kind is exactly sufficient.

---

#### Relation to the Nuclear Square {#mwd-nuclear-square}

At the semantic level, the nuclear square ([CommutativeNuclearSquare](commutative-nuclear-square.md)) has four nodes:
$H_t$, $\mathrm{Fix}(\sigma_t)$, $\mathrm{Fix}(\Delta_t)$, and
$H_t^* = \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$.

The reduction system drives terms toward $H_t^*$ by enforcing the fixed-point conditions
of both nuclei. The two coordinates of $(\mathsf{fmlW}, \mathsf{ent})$ track the two
dimensions of this convergence:

- $\mathsf{fmlW}$ decreasing corresponds to reducing modal overhead — collapsing
  redundant applications and distributing operators — the work of enforcing
  idempotence, top-preservation, and meet-distribution for each nucleus individually.

- $\mathsf{ent}$ decreasing corresponds to sorting the two nuclei into canonical
  order — the work of enforcing commutativity and settling which nucleus is "outer"
  in the normal form.

Both dimensions of work are necessary to reach $H_t^*$. Together they are sufficient.
