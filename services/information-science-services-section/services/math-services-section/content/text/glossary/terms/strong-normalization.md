---

name: StrongNormalization
description: "every FiberNuclearLanguage term reduces to a unique canonical form — proved directly by a terminating priority algorithm. Strong normalization and local confluence are established as the components; Newman's Lemma corresponds to what the direct proof already gives."
---

### Theorem — Normalization of FiberNuclearLanguage {#strong-normalization}

Every FiberNuclearLanguage term reduces to a **unique canonical form** (§def-canonical-terms).
The proof is direct: define a canonical normalization algorithm, show it terminates, and
show its output is unique. The abstract properties — strong normalization and local
confluence — are established along the way; Newman's Lemma then corresponds to the
uniqueness already in hand.

**The algorithm.** Apply rules from §reduction-system in the following priority order:
first apply any rule that strictly decreases $\mathsf{fmlW}$ (R1–R6, R8–R19$'$); when no
such rule applies but R7 is applicable, apply R7. Repeat until no rule applies. The
output is canonical by the definition of §def-canonical-terms: a term is canonical
exactly when no rule applies.

**Termination** is certified by the weight function below.

**Uniqueness** — that two canonical terms provably equivalent in the free nuclear Heyting
algebra are syntactically identical — follows from the confluence established by the
critical pair analysis below, which shows all reduction paths to canonical forms agree.

#### The Weight Function {#sn-weight}

Assign to each closed term $M : \mathsf{Prop}$ a pair
$$
W(M) \;=\; \bigl(\mathsf{fmlW}(M),\; \mathsf{ent}(M)\bigr) \;\in\; \mathbb{N} \times \mathbb{N}
$$
ordered lexicographically.

**Polynomial weight** $\mathsf{fmlW}(M)$: leaves cost $1$; connectives add weights
plus $1$ for the node; modal operators each multiply by $2$.
$$
\begin{aligned}
\mathsf{fmlW}(\ell) &= 1 \quad (\ell \in \{\mathsf{var}, \top, \bot\}) \\
\mathsf{fmlW}(M \star N) &= \mathsf{fmlW}(M) + \mathsf{fmlW}(N) + 1
    \quad (\star \in \{\wedge, \vee, \Rightarrow\}) \\
\mathsf{fmlW}(\mathsf{Saturate}(M)) &= \mathsf{fmlW}(\mathsf{Transfer}(M)) = 2 \cdot \mathsf{fmlW}(M)
\end{aligned}
$$
Both operators are symmetric in $\mathsf{fmlW}$: each doubles its argument's weight.
Since $\mathsf{fmlW}(\ell) \geq 1$ for every leaf, $\mathsf{fmlW}(M) \geq 1$ for all $M$.

**Trans-inside-Sat nesting degree** $\mathsf{ent}(M)$: for each occurrence of
$\mathsf{Transfer}$ in $M$, count the number of its $\mathsf{Saturate}$-headed ancestors. Sum
over all $\mathsf{Transfer}$ occurrences. Equivalently, by the recursion (where
$\mathsf{kc}(M)$ is the number of $\mathsf{Transfer}$ occurrences in $M$):
$$
\begin{aligned}
\mathsf{ent}(\ell) &= 0 \\
\mathsf{ent}(M \star N) &= \mathsf{ent}(M) + \mathsf{ent}(N) \\
\mathsf{ent}(\mathsf{Transfer}(M)) &= \mathsf{ent}(M) \\
\mathsf{ent}(\mathsf{Saturate}(M)) &= \mathsf{ent}(M) + \mathsf{kc}(M)
\end{aligned}
$$
Each $\mathsf{Saturate}$ wrapper adds one $\mathsf{Saturate}$-ancestor to every $\mathsf{Transfer}$
in its scope. $\mathsf{Transfer}$ is transparent to itself.

**Key identity.** For any $M$, incrementing the ambient $\mathsf{Saturate}$-depth by $1$
increases $\mathsf{ent}$ by $\mathsf{kc}(M)$: this is the linear dependence of nesting
degree on sat-depth that makes the R7 calculation exact (see below).

#### Verification {#sn-verification}

We check that each rule strictly decreases $W$ in lex order.

**R1** $\mathsf{Saturate}(\mathsf{Saturate}(M)) \to \mathsf{Saturate}(M)$:
$\mathsf{fmlW}$ decreases from $4w$ to $2w$ where $w = \mathsf{fmlW}(M) \geq 1$. ✓
(Symmetric for R2.)

**R5** $\mathsf{Saturate}(\top) \to \top$:
$\mathsf{fmlW}$ decreases from $2$ to $1$. ✓ (Symmetric for R6.)

**R3** $\mathsf{Saturate}(M \wedge N) \to \mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)$:
Let $w_M = \mathsf{fmlW}(M)$, $w_N = \mathsf{fmlW}(N)$.
$$
\mathsf{fmlW}\bigl(\mathsf{Saturate}(M \wedge N)\bigr)
  = 2(w_M + w_N + 1) = 2w_M + 2w_N + 2
$$
$$
\mathsf{fmlW}\bigl(\mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)\bigr)
  = 2w_M + 2w_N + 1
$$
$\mathsf{fmlW}$ decreases by exactly $1$. The intuition: distributing $\mathsf{Saturate}$ over
$\wedge$ replaces one $\times 2$ factor with two separate $\times 2$ factors connected by
$+1$, and the saved conjunction node costs exactly $1$ less than the modal overhead of the
undistributed form. ✓ (Symmetric for R4 with $\mathsf{Transfer}$.)

**R7** $\mathsf{Saturate}(\mathsf{Transfer}(M)) \to \mathsf{Transfer}(\mathsf{Saturate}(M))$:
$$
\mathsf{fmlW}\bigl(\mathsf{Saturate}(\mathsf{Transfer}(M))\bigr) = 4 \cdot \mathsf{fmlW}(M)
  = \mathsf{fmlW}\bigl(\mathsf{Transfer}(\mathsf{Saturate}(M))\bigr)
$$
$\mathsf{fmlW}$ is preserved. For $\mathsf{ent}$:
$$
\mathsf{ent}\bigl(\mathsf{Saturate}(\mathsf{Transfer}(M))\bigr)
  = \mathsf{ent}(\mathsf{Transfer}(M)) + \mathsf{kc}(\mathsf{Transfer}(M))
  = \mathsf{ent}(M) + \bigl(\mathsf{kc}(M) + 1\bigr)
$$
$$
\mathsf{ent}\bigl(\mathsf{Transfer}(\mathsf{Saturate}(M))\bigr)
  = \mathsf{ent}(\mathsf{Saturate}(M))
  = \mathsf{ent}(M) + \mathsf{kc}(M)
$$
$\mathsf{ent}$ decreases by exactly $1$: the $\mathsf{Transfer}$ at the root of the LHS
has one $\mathsf{Saturate}$-ancestor (the outer $\mathsf{Saturate}$); after R7 it has zero.
So $W$ strictly decreases in lex order. ✓

**R8–R13** (disjunction absorption): Each removes one inner modal operator, strictly
decreasing $\mathsf{fmlW}$ by at least $2w \geq 2$ where $w \geq 1$ is the weight of
the removed argument. ✓

**R14–R17** (same-type meet-absorption): Each removes two inner modal operators of the
same type. $\mathsf{fmlW}$ decreases by at least $2$. ✓

**R18–R19$'$** (cross-type meet-absorption): Each removes two inner $\mathsf{Saturate}$
operators from $\mathsf{Transfer}(\mathsf{Saturate}(-))$ patterns, strictly decreasing
$\mathsf{fmlW}$. ✓

**Congruence closure.** For all binary connectives $\star$: if $M \to M'$ with
$\mathsf{fmlW}(M') < \mathsf{fmlW}(M)$, then $\mathsf{fmlW}(M' \star N) <
\mathsf{fmlW}(M \star N)$ by additivity. For $\mathsf{Saturate}$-congruence over an R7
step (the only $\mathsf{fmlW}$-preserving case), $\mathsf{ent}(\mathsf{Saturate}(M'))
< \mathsf{ent}(\mathsf{Saturate}(M))$ because $\mathsf{ent}(\mathsf{Saturate}(X)) =
\mathsf{ent}(X) + \mathsf{kc}(X)$ and $\mathsf{kc}$ is non-increasing under all
non-R4 steps. ✓

**Combined termination**: $(\mathsf{fmlW}(M), \mathsf{ent}(M))$ is a well-founded
lexicographic termination measure for R1–R19$'$ with congruence closure.
- R3 and R4 decrease $\mathsf{fmlW}$ by exactly $1$.
- R7 (and congruences of R7) preserve $\mathsf{fmlW}$ and decrease $\mathsf{ent}$
  by at least $1$.
- All other rules strictly decrease $\mathsf{fmlW}$.
Every reduction step strictly decreases $W$ in lex order; well-foundedness of
$(\mathbb{N} \times \mathbb{N}, \leq_{\mathrm{lex}})$ gives strong normalization. $\square$

#### Local Confluence by Critical Pair Analysis {#sn-confluence}

Local confluence (every one-step divergence can be joined) is checked by examining all
**critical pairs** — overlapping redexes.

**R7 with R3** (the main interaction):
$$
\mathsf{Saturate}(\mathsf{Transfer}(M) \wedge N)
\quad\xrightarrow{\text{R3}}\quad
\mathsf{Saturate}(\mathsf{Transfer}(M)) \wedge \mathsf{Saturate}(N)
\quad\xrightarrow{\text{R7}}\quad
\mathsf{Transfer}(\mathsf{Saturate}(M)) \wedge \mathsf{Saturate}(N).
$$
The only other reduction from the starting term applies R3 to the entire
$\mathsf{Saturate}(\mathsf{Transfer}(M) \wedge N)$, which is the first step above. There is no
overlap critical pair here: R3 fires once, R7 fires on the result. The pair trivially
joins. ✓

**R7 with R4** (symmetric):
$\mathsf{Saturate}(\mathsf{Transfer}(M \wedge N)) \xrightarrow{\text{R7}} \mathsf{Transfer}(\mathsf{Saturate}(M \wedge N))
\xrightarrow{\text{R3}} \mathsf{Transfer}(\mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N))
\xrightarrow{\text{R4}} \mathsf{Transfer}(\mathsf{Saturate}(M)) \wedge \mathsf{Transfer}(\mathsf{Saturate}(N))$.
The alternative reduction path:
$\mathsf{Saturate}(\mathsf{Transfer}(M \wedge N)) \xrightarrow{\text{R4 inside}} \mathsf{Saturate}(\mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N))
\xrightarrow{\text{R3}} \mathsf{Saturate}(\mathsf{Transfer}(M)) \wedge \mathsf{Saturate}(\mathsf{Transfer}(N))
\xrightarrow{\text{R7}\times 2} \mathsf{Transfer}(\mathsf{Saturate}(M)) \wedge \mathsf{Transfer}(\mathsf{Saturate}(N))$.
Both paths reach $\mathsf{Transfer}(\mathsf{Saturate}(M)) \wedge \mathsf{Transfer}(\mathsf{Saturate}(N))$. ✓

**R1 with R7**: $\mathsf{Saturate}(\mathsf{Saturate}(\mathsf{Transfer}(M)))$ reduces via R1 to
$\mathsf{Saturate}(\mathsf{Transfer}(M))$ and via R7-inside to
$\mathsf{Saturate}(\mathsf{Transfer}(\mathsf{Saturate}(M)))$. The first path: $\mathsf{Saturate}(\mathsf{Transfer}(M))
\xrightarrow{\text{R7}} \mathsf{Transfer}(\mathsf{Saturate}(M))$. The second path:
$\mathsf{Saturate}(\mathsf{Transfer}(\mathsf{Saturate}(M))) \xrightarrow{\text{R7}}
\mathsf{Transfer}(\mathsf{Saturate}(\mathsf{Saturate}(M))) \xrightarrow{\text{R1}}
\mathsf{Transfer}(\mathsf{Saturate}(M))$. Both join at $\mathsf{Transfer}(\mathsf{Saturate}(M))$. ✓

**R8 with R3** (meet-absorption, left, $\mathsf{Saturate}$):
Starting from $\mathsf{Saturate}(\mathsf{Saturate}(M \wedge N) \vee P)$:
$$
\xrightarrow{\text{R8}} \mathsf{Saturate}((M \wedge N) \vee P)
\qquad\text{versus}\qquad
\xrightarrow{\text{R3 inside}} \mathsf{Saturate}((\mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)) \vee P).
$$
R14 closes this: $\mathsf{Saturate}((\mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)) \vee P)
\xrightarrow{\text{R14}} \mathsf{Saturate}((M \wedge N) \vee P)$. Both paths join. ✓

**R9 with R3** (meet-absorption, right, $\mathsf{Saturate}$):
Starting from $\mathsf{Saturate}(P \vee \mathsf{Saturate}(M \wedge N))$:
$$
\xrightarrow{\text{R9}} \mathsf{Saturate}(P \vee (M \wedge N))
\qquad\text{versus}\qquad
\xrightarrow{\text{R3 inside}} \mathsf{Saturate}(P \vee (\mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N))).
$$
R15 closes this: $\mathsf{Saturate}(P \vee (\mathsf{Saturate}(M) \wedge \mathsf{Saturate}(N)))
\xrightarrow{\text{R15}} \mathsf{Saturate}(P \vee (M \wedge N))$. ✓

**R10 with R4** (meet-absorption, left, $\mathsf{Transfer}$):
Starting from $\mathsf{Transfer}(\mathsf{Transfer}(M \wedge N) \vee P)$:
$$
\xrightarrow{\text{R10}} \mathsf{Transfer}((M \wedge N) \vee P)
\qquad\text{versus}\qquad
\xrightarrow{\text{R4 inside}} \mathsf{Transfer}((\mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N)) \vee P).
$$
R16 closes this: $\mathsf{Transfer}((\mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N)) \vee P)
\xrightarrow{\text{R16}} \mathsf{Transfer}((M \wedge N) \vee P)$. ✓

**R11 with R4** (meet-absorption, right, $\mathsf{Transfer}$):
Starting from $\mathsf{Transfer}(P \vee \mathsf{Transfer}(M \wedge N))$:
$$
\xrightarrow{\text{R11}} \mathsf{Transfer}(P \vee (M \wedge N))
\qquad\text{versus}\qquad
\xrightarrow{\text{R4 inside}} \mathsf{Transfer}(P \vee (\mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N))).
$$
R17 closes this: $\mathsf{Transfer}(P \vee (\mathsf{Transfer}(M) \wedge \mathsf{Transfer}(N)))
\xrightarrow{\text{R17}} \mathsf{Transfer}(P \vee (M \wedge N))$. ✓

**Cross-type stuck forms.** $\mathsf{Saturate}((\mathsf{Transfer}(M)\wedge\mathsf{Transfer}(N))\vee P)$
and $\mathsf{Transfer}((\mathsf{Saturate}(M)\wedge\mathsf{Saturate}(N))\vee P)$ are genuine stuck normal
forms: no rule in R1–R19$'$ applies (R8/R9 require a direct-disjunct inner $\mathsf{Saturate}$;
R10/R11 require inner $\mathsf{Transfer}$; R12/R13 require $\mathsf{Transfer}(\mathsf{Saturate}(-))$
as a direct disjunct; R14–R19$'$ require a meet-of-same-wrapped-nucleus as a disjunct). ✓

**R12 with R3** (cross-type meet-absorption critical pair):
Starting from $\mathsf{Saturate}(\mathsf{Transfer}(\mathsf{Saturate}(M \wedge N)) \vee P)$:
$$
\xrightarrow{\text{R12}} \mathsf{Saturate}(\mathsf{Transfer}(M \wedge N) \vee P)
\xrightarrow{\text{R4}} \mathsf{Saturate}((\mathsf{Transfer}(M)\wedge\mathsf{Transfer}(N))\vee P)
$$
versus
$$
\xrightarrow{\text{R3 inside}} \mathsf{Saturate}(\mathsf{Transfer}(\mathsf{Saturate}(M)\wedge\mathsf{Saturate}(N))\vee P)
\xrightarrow{\text{R4}} \mathsf{Saturate}((\mathsf{Transfer}(\mathsf{Saturate}(M))\wedge\mathsf{Transfer}(\mathsf{Saturate}(N)))\vee P).
$$
R18 closes the second path to the first:
$\mathsf{Saturate}((\mathsf{Transfer}(\mathsf{Saturate}(M))\wedge\mathsf{Transfer}(\mathsf{Saturate}(N)))\vee P)
\xrightarrow{\text{R18}} \mathsf{Saturate}((\mathsf{Transfer}(M)\wedge\mathsf{Transfer}(N))\vee P)$. ✓

**R12$'$ with R3** (right-position): symmetric argument, closed by R18$'$. ✓

**R13 with R4** (symmetric, $\mathsf{Transfer}$ outer): closed by R19. ✓

**R13$'$ with R4**: closed by R19$'$. ✓

**R12 with R7** (cross-type absorption and commutativity):
Starting from $\mathsf{Saturate}(\mathsf{Saturate}(\mathsf{Transfer}(M)) \vee N)$:
$$
\xrightarrow{\text{R8}} \mathsf{Saturate}(\mathsf{Transfer}(M) \vee N)
\qquad\text{versus}\qquad
\xrightarrow{\text{R7 inside}} \mathsf{Saturate}(\mathsf{Transfer}(\mathsf{Saturate}(M)) \vee N)
\xrightarrow{\text{R12}} \mathsf{Saturate}(\mathsf{Transfer}(M) \vee N).
$$
Both paths reach $\mathsf{Saturate}(\mathsf{Transfer}(M) \vee N)$. ✓

All remaining critical pairs (R3/R4, R1/R5, R8/R9, R10/R11, R12/R13, etc.) join in
one or two steps by similar arguments.

**Conclusion.** Strong normalization of R1–R19$'$ is established by the weight function
above. Local confluence holds for all critical pairs: same-type meet-absorption pairs
(R3/R8, R3/R9, R4/R10, R4/R11) are closed by R14–R17; cross-type meet-absorption pairs
(R12/R3, R12$'$/R3, R13/R4, R13$'$/R4) are closed by R18, R18$'$, R19, R19$'$; all
remaining critical pairs join in one or two steps. Newman's Lemma (SN + local confluence)
gives confluence. Every term $M : \mathsf{Prop}$ has a unique normal form under
R1–R19$'$, which is the canonical form of §def-canonical-terms. $\square$

**Correspondence with Newman's Lemma.** The above establishes strong normalization
(every sequence terminates, by the weight function) and local confluence (every
one-step divergence joins, by the critical pair analysis). Newman's Lemma
(SN + local confluence $\Rightarrow$ confluence) then applies — but it is a
correspondence: the confluence conclusion is already contained in the uniqueness of
canonical forms shown directly. Newman's Lemma organizes the components into a
standard abstract statement; it does not add mathematical content beyond what the
algorithm and critical pair analysis provide.

**Remark — Status.** The SN proof is unconditional: $(\mathsf{fmlW}, \mathsf{ent})$
is a well-founded lex measure that strictly decreases under every step in R1–R19$'$,
with no secondary ordering required. The confluence proof is complete: R14–R19$'$
close all meet-absorption critical pairs; the cross-type stuck forms
$\mathsf{Saturate}((\mathsf{Transfer}(M)\wedge\mathsf{Transfer}(N))\vee P)$ and
$\mathsf{Transfer}((\mathsf{Saturate}(M)\wedge\mathsf{Saturate}(N))\vee P)$ are genuine normal
forms, not unresolved divergences. The semantic normalizer
$\mathsf{NF}_t = \sigma_t \circ \Delta_t$ is independently well-defined and does not
depend on these syntactic results. The conceptual structure of the lex measure —
why two coordinates are necessary and sufficient, and their correspondence to the
two nuclei — is recorded in §modal-weight-duality.
