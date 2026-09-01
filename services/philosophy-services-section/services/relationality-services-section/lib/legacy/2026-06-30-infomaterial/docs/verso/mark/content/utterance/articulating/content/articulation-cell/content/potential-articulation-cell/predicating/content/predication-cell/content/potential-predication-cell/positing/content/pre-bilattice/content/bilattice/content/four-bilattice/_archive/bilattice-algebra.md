---
title: "Four-Element Bilattice (FOUR): Comprehensive Mathematical Treatment"
description: The smallest non-trivial bilattice FOUR — its two orders, twist-product and Chu-space characterizations, Klein-four automorphism group, residuation, and role as the minimal value algebra for multi-agent predicating.
date: 2026-06-15
status: salvaged-from-tmp
keywords: ["four-bilattice", "bilattice", "knowledge-order", "truth-order", "twist-product", "chu-space", "klein-four", "residuation", "belnap-logic", "value-algebra"]
source: "/tmp/claude-1001/-home-emsenn-561-group/ee73ac9c-9c8f-45f1-839a-8e4f6f4cb7c5/tasks/byrd3jg6f.output"
name: four-bilattice
references:
  - "Belnap, N. D. (1977). A Useful Four-Valued Logic. In J. M. Dunn & G. Epstein (Eds.), Modern Uses of Multiple-Valued Logic, pp. 5-37. Reidel."
  - "Ginsberg, M. L. (1988). Multivalued Logics: A Uniform Approach to Inference in Artificial Intelligence. Computational Intelligence 4, pp. 265-316."
  - "Fitting, M. (1991). Bilattices and the Semantics of Logic Programming. Journal of Logic Programming 11(2), pp. 91-116."
  - "Fitting, M. (2002). Bilattices Are Nice Things. In T. Bolander, V. Hendricks, & S. A. Pedersen (Eds.), Self-Reference. CSLI Publications."
  - "Kalman, J. A. (1958). Lattices with Involution. Transactions of the American Mathematical Society 87(2), pp. 485-491."
  - "Bou, F., & Rivieccio, U. (2011). The logic of distributive bilattices. Logic Journal of the IGPL 19(1), pp. 183-216."
  - "Jung, A., & Rivieccio, U. (2012). Priestley duality for bilattices. Studia Logica 100(1-2), pp. 223-252."
  - "Rivieccio, U., Jung, A., & Jansana, R. (2017). Four-Valued Modal Logic: Kripke Semantics and Duality. Journal of Logic and Computation 27(1), pp. 155-199."
  - "Jakl, T. (2025). Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science. arXiv:2503.20679."
  - "Stone, M. H. (1936). The theory of representations for Boolean algebras. Transactions of the American Mathematical Society 40(1), pp. 37-111."
  - "Mac Lane, S. (1971). Categories for the Working Mathematician. Graduate Texts in Mathematics 5. Springer."
---

# Four-element bilattice

## Definition

The **four-element bilattice** $\mathbf{FOUR}$ is the smallest non-trivial bilattice. Its carrier is

$$|\mathbf{FOUR}| \;=\; \{\bot,\; \mathbf{t},\; \mathbf{f},\; \top\}.$$

Each element is identified with an **evidence pair** $(\mathrm{pos}, \mathrm{neg}) \in \{0, 1\}^2$:

| element | $(\mathrm{pos}, \mathrm{neg})$ | reading |
|---|---|---|
| $\bot$ | $(0, 0)$ | told neither — *abstention* |
| $\mathbf{t}$ | $(1, 0)$ | told true — *assertion* |
| $\mathbf{f}$ | $(0, 1)$ | told false — *denial* |
| $\top$ | $(1, 1)$ | told both — *contestation* |

The first coordinate $\mathrm{pos} \in \{0, 1\}$ is positive evidence (information for an assertion); the second coordinate $\mathrm{neg} \in \{0, 1\}$ is negative evidence (information against). The four pair-combinations cover the four possible epistemic states: no evidence, positive only, negative only, both.

## The two orders

The bilattice carries two independent lattice orders, both defined componentwise on evidence pairs:

**Knowledge order $\leq_k$:** componentwise on evidence pairs:

$$(a, b) \leq_k (c, d) \;\iff\; a \leq c \;\text{ and }\; b \leq d.$$

Hasse diagram:

```
           ⊤
          / \
         t   f
          \ /
           ⊥
```

Covering relations: $\bot \leq_k \mathbf{t}$, $\bot \leq_k \mathbf{f}$, $\mathbf{t} \leq_k \top$, $\mathbf{f} \leq_k \top$. The values $\mathbf{t}$ and $\mathbf{f}$ are $\leq_k$-incomparable: each has the same amount of information (one bit), one positive, the other negative.

**Truth order $\leq_t$:** with the second component reversed:

$$(a, b) \leq_t (c, d) \;\iff\; a \leq c \;\text{ and }\; d \leq b.$$

Hasse diagram:

```
           t
          / \
         ⊥   ⊤
          \ /
           f
```

Covering relations: $\mathbf{f} \leq_t \bot$, $\mathbf{f} \leq_t \top$, $\bot \leq_t \mathbf{t}$, $\top \leq_t \mathbf{t}$. The values $\bot$ and $\top$ are $\leq_t$-incomparable: each is truth-neutral (neither fully for nor fully against the assertion), but at opposite knowledge ranks.

The two orders share the carrier (this is the *bi* in bilattice) but order it transversely: $\leq_k$ ranks by *amount* of evidence; $\leq_t$ ranks by *direction* of evidence.

## Bilattice operations

The lattice operations on each axis, componentwise:

- **Knowledge meet** $\wedge_k$ and **join** $\vee_k$: componentwise meet and join.

$$(a, b) \wedge_k (c, d) \;=\; (a \wedge c,\, b \wedge d), \qquad (a, b) \vee_k (c, d) \;=\; (a \vee c,\, b \vee d).$$

- **Truth meet** $\wedge_t$ and **join** $\vee_t$: meet in the first component, join in the second; reversed for $\vee_t$.

$$(a, b) \wedge_t (c, d) \;=\; (a \wedge c,\, b \vee d), \qquad (a, b) \vee_t (c, d) \;=\; (a \vee c,\, b \wedge d).$$

**Negation** $\sim$: swap the two coordinates.

$$\sim (a, b) \;=\; (b, a).$$

On named values: $\sim \mathbf{t} = \mathbf{f}$, $\sim \mathbf{f} = \mathbf{t}$, $\sim \bot = \bot$, $\sim \top = \top$. Negation is antitone in $\leq_t$ (reverses truth direction), monotone in $\leq_k$ (preserves evidence amount), involutive.

**Conflation** $-$: swap-then-complement.

$$-(a, b) \;=\; (\neg b, \neg a).$$

On named values: $-\bot = \top$, $-\top = \bot$, $-\mathbf{t} = \mathbf{t}$, $-\mathbf{f} = \mathbf{f}$. Conflation is antitone in $\leq_k$ (reverses knowledge direction), monotone in $\leq_t$ (preserves truth direction), involutive.

## The Klein-four group

Negation and conflation commute: $\sim \circ - = - \circ \sim$. Together they generate

$$K_4 \;=\; \langle \sim, - \rangle \;\cong\; \mathbb{Z}/2 \times \mathbb{Z}/2,$$

the Klein-four group, acting on $\mathbf{FOUR}$ by bilattice automorphisms. In fact $K_4 = \mathrm{Aut}(\mathbf{FOUR})$ — every bilattice automorphism of $\mathbf{FOUR}$ is one of the four:

| element | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
|---|---|---|---|---|
| $\mathrm{id}$ | $\bot$ | $\mathbf{t}$ | $\mathbf{f}$ | $\top$ |
| $\sim$ | $\bot$ | $\mathbf{f}$ | $\mathbf{t}$ | $\top$ |
| $-$ | $\top$ | $\mathbf{t}$ | $\mathbf{f}$ | $\bot$ |
| $\sim \circ -$ | $\top$ | $\mathbf{f}$ | $\mathbf{t}$ | $\bot$ |

In twist-product coordinates on $\mathbf{2}^\bowtie$ with $\sim \langle a, b \rangle = \langle b, a \rangle$ and $-\langle a, b \rangle = \langle \neg b, \neg a \rangle$:

- $\sim \circ - \langle a, b \rangle = \sim \langle \neg b, \neg a \rangle = \langle \neg a, \neg b \rangle$ — coordinatewise complement.

The orbits of $K_4$ on $\mathbf{FOUR}$:

- $\{\mathbf{t}, \mathbf{f}\}$ — a 2-orbit under $\sim$, fixed by $-$.
- $\{\bot, \top\}$ — a 2-orbit under $-$, fixed by $\sim$.

## FOUR as a twist product

**Theorem (Fitting 1991; Kalman 1958).** *$\mathbf{FOUR} \cong \mathbf{2}^\bowtie$ — the twist product of the two-element Boolean lattice $\mathbf{2} = \{0, 1\}$ with itself.*

**Construction.** Under the isomorphism:

$$\mathbf{f} \;=\; \langle 0, 1 \rangle, \quad \bot \;=\; \langle 0, 0 \rangle, \quad \top \;=\; \langle 1, 1 \rangle, \quad \mathbf{t} \;=\; \langle 1, 0 \rangle.$$

The twist-product bilattice operations match the bilattice operations on $\mathbf{FOUR}$ by direct computation; the swap negation $\sim \langle a, b \rangle = \langle b, a \rangle$ matches the four-element bilattice's negation.

This identification gives the four-element bilattice a uniform algebraic shape: it is the twist product of the simplest non-trivial Boolean lattice, and every distributive bilattice embeds into a power of $\mathbf{FOUR}$ (Bou-Rivieccio 2011).

## FOUR as the free distributive bilattice on no generators

**Theorem (Fitting 2002).** *$\mathbf{FOUR}$ is the initial object of the variety of bilattices: every distributive bilattice $\mathbf{B}$ receives a unique bilattice homomorphism $\mathbf{FOUR} \to \mathbf{B}$.*

This makes $\mathbf{FOUR}$ the "free distributive bilattice on no generators" — the bilattice generated by no elements at all, just by the constraint of being a bilattice. Every other distributive bilattice is obtained by adding elements (extending $\mathbf{FOUR}$ within the variety).

**Theorem (Bou-Rivieccio 2011).** *The variety $\mathbf{DBiLat}$ of distributive bilattices is generated by $\mathbf{FOUR}$; every distributive bilattice embeds into a power $\mathbf{FOUR}^I$ for some set $I$.*

## FOUR as a Chu space

**Theorem (Jakl 2025).** *$\mathbf{FOUR} \cong \mathrm{Chu}(\mathbf{2}, 0)$ — the Chu space over the two-element Boolean lattice with adjoint dualizer $0$.*

The Chu construction $\mathrm{Chu}(H, 0)$ over a Heyting algebra $H$ with bottom $0$ has objects $(X, A, r)$ with $X, A$ sets and $r : X \times A \to H$ a pairing, and is a $*$-autonomous category — a model of multiplicative linear logic with tensor $\otimes$, linear implication $\multimap$, and a dualizing object (Barr 1991). For $H = \mathbf{2}$, the Chu construction $\mathrm{Chu}(\mathbf{2}, 0)$ has carrier identifying with $\mathbf{2} \times \mathbf{2}$ (via the pairing $r : \{*\} \times \{*\} \to \mathbf{2}$ giving the two-bit value), and the linear-logic operations identify with the twist-product residuated operations $\odot$ (fusion) and $\Rightarrow$ (right residual):

$$\odot \cong \otimes \quad \text{(Chu multiplicative tensor)}, \qquad \Rightarrow \cong \multimap \quad \text{(Chu linear implication)}.$$

Bilattice-valued predication on $\mathbf{FOUR}$ is therefore a model of multiplicative linear logic on this Chu space. The framework's residuated bilattice content (Busaniche-Cignoli's $\odot$ and $\Rightarrow$) IS, under the Jakl identification, the multiplicative linear logic of $\mathrm{Chu}(\mathbf{2}, 0)$.

## FOUR's residuated structure

Specializing the twist-product residuation theorem to $\mathbf{L} = \mathbf{2}$:

**Twist-product fusion** $\odot$ on $\mathbf{FOUR}$:

$$\langle x, y \rangle \;\odot\; \langle z, v \rangle \;=\; \langle x \wedge z,\; (x \to v) \wedge (z \to y) \rangle$$

(with $\to$ the Boolean implication $x \to y = \neg x \vee y$).

**Twist-product right residual** $\Rightarrow$ on $\mathbf{FOUR}$:

$$\langle x, y \rangle \;\Rightarrow\; \langle z, v \rangle \;=\; \langle (x \to z) \wedge (v \to y),\; x \wedge v \rangle.$$

**Theorem (FOUR residuation properties; proved).**

1. $\top$ is the identity for $\odot$: $\top \odot a = a$ for all $a$.
2. $\mathbf{f}$ is absorbing for $\odot$: $\mathbf{f} \odot a = \mathbf{f}$ for all $a$.
3. $\mathbf{t}, \mathbf{f}, \top$ are idempotent under $\odot$; $\bot$ is not: $\bot \odot \bot = \mathbf{f}$.
4. Self-implication: $a \Rightarrow a = \mathbf{t}$ for $a \in \{\bot, \mathbf{t}, \mathbf{f}\}$; $\top \Rightarrow \top = \top$.

(Proof via direct computation on twist-product representations; see the residuated lattice note for the full case-by-case calculation.)

**Theorem (FOUR convergence rate; proved).** *On $\mathbf{FOUR}$, for every $a \in \mathbf{FOUR}$ and every starting point $x_0$, the orbit $(x_n)$ defined by $x_{n+1} = a \odot x_n$ satisfies $x_2 = x_3$ (orbits stabilize in at most two steps). The same holds for $x_{n+1} = a \Rightarrow x_n$.*

This is a strengthening of the abstract Knaster-Tarski convergence bound for the specific case of $\mathbf{FOUR}$: orbits stabilize quickly.

## Why FOUR is the minimal adequate value algebra

The cardinality $|\mathbf{FOUR}| = 4$ is forced for multi-agent predicating by the requirement that positive and negative evidence accumulate independently:

**Theorem (FOUR-forced; proved).** *Let $V$ be any value algebra adequate for multi-agent predicating. Then $|V| \geq 4$. Moreover $V$ must carry two independent lattice orders on its carrier: one ordered by accumulated information, one ordered by truth direction. The minimal adequate $V$ has exactly four elements: $\mathbf{FOUR}$.*

**Proof sketch.** The predication record $(\varphi, v)$ must encode the joint epistemic state of all agents with respect to position $\varphi$. In a multi-agent system, agents contribute evidence independently: one may assert (positive evidence, $\mathrm{pos} = 1$) while another denies (negative evidence, $\mathrm{neg} = 1$). The record must therefore represent the pair $(\mathrm{pos}, \mathrm{neg}) \in \{0, 1\}^2$, giving four states.

*Boolean algebra insufficient:* $V = \{0, 1\}$ conflates $(0, 0)$ (no evidence) with $(1, 1)$ (contradictory evidence). Cannot accumulate contradiction without destruction.

*Three-valued algebra insufficient:* $V = \{\mathbf{f}, u, \mathbf{t}\}$ supplies one intermediate $u$ but cannot simultaneously represent $(0, 0)$ and $(1, 1)$. The componentwise join of $(1, 0)$ and $(0, 1)$ is $(1, 1) \neq (0, 0)$. Kleene's three-valued logic conflates missing evidence with contradictory evidence.

*Two independent orders required:* the value algebra must support two independent measurement axes — how much is known (information amount, ordered componentwise) and which direction the evidence points (truth direction, ordered by positive minus negative). These are independent: contradiction $(1, 1)$ is maximally informed but truth-direction-neutral; no evidence $(0, 0)$ is minimally informed and equally neutral. No single total order captures both axes.

*Minimality:* Fitting 2002 proved $\{0, 1\}^2$ with the componentwise order and the implication-reversed truth order is the free bounded distributive bilattice on one generator. The minimum is exactly four elements. $\square$

This forcing argument is why $\mathbf{FOUR}$ is not just a particular bilattice the framework chose — it is the unique minimum value algebra adequate for the framework's commitments.

## Bilattice Priestley dual of FOUR

Under Jung-Rivieccio bilattice Priestley duality, $\mathbf{FOUR}$ corresponds to the simplest non-trivial paired Priestley space:

**Theorem.** *The paired Priestley dual of $\mathbf{FOUR} = \mathbf{2}^\bowtie$ is the two-point space $\{+, -\}$ with the swap involution $\sigma : + \leftrightarrow -$.*

Since $\mathrm{Spec}(\mathbf{2})$ is a single point, the paired Priestley dual of $\mathbf{2}^\bowtie$ is the pair $(\mathrm{Spec}(\mathbf{2}), \mathrm{Spec}(\mathbf{2})) = (\{*\}, \{*\})$ — two copies of a point — equipped with the swap involution. As a single set, this is the two-point set $\{+, -\}$ with $\sigma : + \mapsto -, - \mapsto +$.

This is the simplest non-trivial paired Priestley space. The dual-side apparatus of the framework (dualized closure 2-comonad $\mathrm{Cl}^*$, dual predication hyperdoctrine, bitopological settling site) all specialize on this two-point Priestley dual when working with $\mathbf{FOUR}$.

## The modal four-valued logic on FOUR

**Theorem (Rivieccio-Jung-Jansana 2017).** *The four-valued modal logic on $\mathbf{FOUR}$ has the finite model property and is decidable. Modal operators decompose into pairs of classical modal operators on the twist components: $\Box (a^+, a^-) = (\Box_1(a^+), \Diamond_2(a^-))$, with the resulting four-valued modal logic decidable.*

The decomposition is the modal analog of the twist-product structure on the bilattice operations: each modal operator splits into two operators acting on the two components, with appropriate Box/Diamond pairing.

## The four classes of cells in a settling

In a predication settling, the four values of $\mathbf{FOUR}$ correspond to the four possible long-run states of a cell:

- $\bot$: never touched — no evidence collected.
- $\mathbf{t}$: only positive evidence — *asserted true*.
- $\mathbf{f}$: only negative evidence — *asserted false*.
- $\top$: both positive and negative — *contested*.

In a closure-driven settling, every cell starts at $\bot$ (in the uninformed valuation $v_0$) and rises monotonically in $\leq_k$ as evidence accumulates: $\bot \to \mathbf{t}$ (or $\bot \to \mathbf{f}$, or $\bot \to \top$), then potentially $\mathbf{t} \to \top$ (or $\mathbf{f} \to \top$) when conflicting evidence arrives. Once a cell reaches $\top$, it stays there: $\top$ is the $\leq_k$-top, so further joins do not move it.

The four-class partition is the basis for the Belnap partition of positing-entry classes in the framework's positing morphism: assertion (datum = $\mathbf{t}$), denial ($\mathbf{f}$), contestation ($\top$), abstention ($\bot$). Each positing falls into exactly one of these four classes based on its datum.

## Reading

$\mathbf{FOUR}$ is the framework's *primary* value algebra — the minimal value algebra adequate for multi-agent predicating, the free distributive bilattice on no generators, the twist product of the simplest non-trivial Boolean lattice, and the Chu space over $\mathbf{2}$. Its central features:

(i) **It is the smallest non-trivial bilattice.** Four values: $\bot, \mathbf{t}, \mathbf{f}, \top$. Two independent lattice orders ($\leq_k, \leq_t$), each a diamond with two incomparable middle elements. The smallest setting in which the bilattice's two-order structure is non-degenerate.

(ii) **Each value is an evidence pair $(\mathrm{pos}, \mathrm{neg}) \in \{0, 1\}^2$.** The framework's commitment to representing positive and negative evidence separately is realized at the smallest scale here: each value is literally a pair of bits.

(iii) **It is the minimal value algebra forced by multi-agent predicating.** Boolean (two-valued) collapses contradiction with no-evidence; Kleene three-valued collapses contradiction with abstention. Four is the minimum that separates all four epistemic states. The forcing argument is structural, not a choice.

(iv) **It is the free distributive bilattice on no generators.** Every distributive bilattice receives a unique homomorphism from $\mathbf{FOUR}$ by initiality; the variety of distributive bilattices is generated by $\mathbf{FOUR}$. The framework's reasoning on richer bilattices factors through $\mathbf{FOUR}$ at the variety level.

(v) **It identifies with $\mathrm{Chu}(\mathbf{2}, 0)$.** Under Jakl 2025, $\mathbf{FOUR}$ is the Chu space over the two-element Boolean lattice. Bilattice-valued predication on $\mathbf{FOUR}$ is a model of multiplicative linear logic, with $\odot \cong \otimes$ and $\Rightarrow \cong \multimap$.

(vi) **Its automorphism group is $K_4 = \mathbb{Z}/2 \times \mathbb{Z}/2$.** The Klein-four group generated by negation and conflation. The Klein-four gauge bundle and gauge connections of the framework's curved-hyperdoctrinal layer are built on $K_4 = \mathrm{Aut}(\mathbf{FOUR})$.

(vii) **Its Priestley dual is the two-point space with swap.** Under Jung-Rivieccio bilattice Priestley duality, $\mathbf{FOUR}$ corresponds to $(\{+, -\}, +\leftrightarrow -)$ — the simplest non-trivial paired Priestley space.

$\mathbf{FOUR}$ is the framework's value algebra in its primary instance. All other value-algebra examples the framework considers (general distributive bilattices, Łukasiewicz fuzzy bilattices, quantale-valued bilattices, etc.) are either specializations of $\mathbf{FOUR}$ (as in the strict-regime examples) or generalizations along the $\mathbf{L}$ parameter (with $\mathbf{FOUR}$ recovered at $\mathbf{L} = \mathbf{2}$). The framework's distinctive content — paraconsistency, the bigraded diamond, the Klein-four gauge, the Priestley-dualizable cohomology — all has its primary instance and its most concrete example here on the four-element bilattice.

---

# Appended from composted articulating-hacking-library/four-bilattice journal


## Definition

The **four-bilattice** $\mathrm{FOUR}$ is the distributive bilattice on the four-element carrier $\{\bot, t, f, \top\}$ with two independent lattice orders:

- The **knowledge order** $\le_k$ orders by amount of evidence: $\bot$ is least, $\top$ is greatest, and $t$ and $f$ are incomparable in $\le_k$.
- The **truth order** $\le_t$ orders by direction of truth: $f$ is least, $t$ is greatest, and $\bot$ and $\top$ are incomparable in $\le_t$.

Each element is identified with an evidence pair $(\mathrm{pos}, \mathrm{neg}) \in \{0,1\}^2$:

| Element | Pair | Reading |
|---|---|---|
| $\bot$ | $(0,0)$ | abstention — no evidence |
| $t$ | $(1,0)$ | assertion — positive evidence only |
| $f$ | $(0,1)$ | denial — negative evidence only |
| $\top$ | $(1,1)$ | contestation — both positive and negative recorded without crashing |

The fundamental endomorphisms are:

- **Negation** $\mathord{\sim}(a, b) = (b, a)$ — swaps $t$ and $f$, fixes $\bot$ and $\top$.
- **Conflation** $-(a, b) = (1-b, 1-a)$ — swaps $\bot$ and $\top$, fixes $t$ and $f$.

Together with the identity, these generate the Klein four-group $K_4$ acting on FOUR.

## Theorems

### Minimum-value-algebra-for-multi-agent-predicating

**Claim.** $|V| \ge 4$ is forced as the minimum cardinality of a value algebra $V$ adequate for multi-agent predicating. The minimal adequate $V$ has exactly four elements and is FOUR.

**Proof.** In a multi-agent system, agents contribute evidence independently; one agent may assert while another denies. The value algebra $V$ must represent at least four distinct states: no evidence, only-positive, only-negative, both-positive-and-negative. Boolean $V = \{0, 1\}$ has two elements and conflates abstention $(0,0)$ with contestation $(1,1)$. Kleene's three-valued $V = \{0, u, 1\}$ adds a single "undefined" middle but cannot simultaneously represent the absence of evidence and the presence of contradictory evidence as distinct states. Any adequate $V$ must therefore carry $\ge 4$ elements. FOUR carries exactly four and supports both orderings; it is the minimal adequate value algebra. ∎

### Knowledge-order-join-is-componentwise-max

**Claim.** The knowledge-order join $\bigvee^{\le_k}$ on FOUR is componentwise max on the evidence pair $(\mathrm{pos}, \mathrm{neg})$.

**Proof.** The pair encoding identifies FOUR with $\{0,1\}^2$. The knowledge order $\le_k$ is componentwise $\le$ on this pair: $(a, b) \le_k (a', b')$ iff $a \le a'$ and $b \le b'$. On a product of two-element chains, the lattice join is componentwise max. So $\bigvee^{\le_k}_i (a_i, b_i) = (\max_i a_i,\ \max_i b_i)$. ∎

### Klein-four-group-acts-on-FOUR-by-involutions

**Claim.** Negation $\mathord{\sim}$ and conflation $-$, together with their composition $\mathord{\sim} \circ -$ and the identity, form a copy of the Klein four-group $K_4$ acting on FOUR.

**Proof.** Both $\mathord{\sim}$ and $-$ are involutions on $\{0,1\}^2$: $\mathord{\sim} \circ \mathord{\sim} = \mathrm{id}$ and $- \circ - = \mathrm{id}$. They commute: $\mathord{\sim}(-(a,b)) = \mathord{\sim}(1-b, 1-a) = (1-a, 1-b) = -(b, a) = -(\mathord{\sim}(a, b))$. The composition $\mathord{\sim} \circ -$ is therefore also an involution. The group generated by two commuting involutions is the Klein four-group $K_4 \cong \mathbb{Z}/2 \times \mathbb{Z}/2$, with elements $\{\mathrm{id}, \mathord{\sim}, -, \mathord{\sim} \circ -\}$. The action on FOUR has orbits matching the four Belnap classes. ∎

## Implementation Notes

### Role as the cell-fiber

In the predication fibration, each cell $\varphi$ has an associated fiber algebra that IS FOUR. The bigraded knowledge-and-truth structure of FOUR is what makes settling have direction (in $\le_t$) and progress (in $\le_k$): the doing-pass advances in $\le_k$, while the truth-order structure orients the closure-rules.


---

# Appended from composted variety-library-bilattice-leftovers four-bilattice journal


## Definition

The **four-element bilattice** $\mathbf{FOUR}$ is the specific bilattice on the carrier set $\{\bot,\; \mathbf{t},\; \mathbf{f},\; \top\}$ with the four lattice operations $\wedge_t, \vee_t, \wedge_k, \vee_k$ and the negation $\sim$ specified by the construction $\mathbf{FOUR} := \mathbf{2}^\bowtie$ — the twist product of the two-element Boolean lattice $\mathbf{2} = \{0, 1\}$ (with $0 < 1$) with itself, equipped with the coordinate-swap negation $\sim\langle a, b\rangle = \langle b, a\rangle$.

The four elements receive the evidence-pair encoding

$$\bot = \langle 0, 0\rangle, \quad \mathbf{t} = \langle 1, 0\rangle, \quad \mathbf{f} = \langle 0, 1\rangle, \quad \top = \langle 1, 1\rangle,$$

reading the first coordinate as positive evidence and the second as negative evidence.

The two orders, derived from the twist-product operations and equivalently from the lattice axioms on each pair $(\wedge_t, \vee_t)$ and $(\wedge_k, \vee_k)$:

**Truth order $\le_t$:**

$$\mathbf{f} \;\le_t\; \bot \;\le_t\; \mathbf{t}, \qquad \mathbf{f} \;\le_t\; \top \;\le_t\; \mathbf{t},$$

with $\bot$ and $\top$ mutually $\le_t$-incomparable. Hasse diagram is the four-element diamond with $\mathbf{f}$ at the bottom, $\mathbf{t}$ at the top, $\bot$ and $\top$ at the two intermediate positions.

**Knowledge order $\le_k$:**

$$\bot \;\le_k\; \mathbf{t} \;\le_k\; \top, \qquad \bot \;\le_k\; \mathbf{f} \;\le_k\; \top,$$

with $\mathbf{t}$ and $\mathbf{f}$ mutually $\le_k$-incomparable. Hasse diagram is the four-element diamond rotated 90° from the $\le_t$ diagram: $\bot$ at the bottom, $\top$ at the top, $\mathbf{t}$ and $\mathbf{f}$ at the two intermediate positions.

## Operation tables

Given the twist-product formulas

$$\langle a_1, a_2\rangle \wedge_t \langle b_1, b_2\rangle = \langle a_1 \wedge b_1, a_2 \vee b_2\rangle, \quad \langle a_1, a_2\rangle \vee_t \langle b_1, b_2\rangle = \langle a_1 \vee b_1, a_2 \wedge b_2\rangle,$$
$$\langle a_1, a_2\rangle \wedge_k \langle b_1, b_2\rangle = \langle a_1 \wedge b_1, a_2 \wedge b_2\rangle, \quad \langle a_1, a_2\rangle \vee_k \langle b_1, b_2\rangle = \langle a_1 \vee b_1, a_2 \vee b_2\rangle,$$

and the Boolean $\wedge, \vee$ on $\mathbf{2}$, the operation tables on the four-element carrier are determined uniquely. The five resulting tables (one per binary operation, one for negation):

$$\wedge_t: \quad \begin{array}{c|cccc} & \mathbf{f} & \bot & \top & \mathbf{t}\\ \hline \mathbf{f} & \mathbf{f} & \mathbf{f} & \mathbf{f} & \mathbf{f}\\ \bot & \mathbf{f} & \bot & \mathbf{f} & \bot\\ \top & \mathbf{f} & \mathbf{f} & \top & \top\\ \mathbf{t} & \mathbf{f} & \bot & \top & \mathbf{t} \end{array} \qquad \vee_t: \quad \begin{array}{c|cccc} & \mathbf{f} & \bot & \top & \mathbf{t}\\ \hline \mathbf{f} & \mathbf{f} & \bot & \top & \mathbf{t}\\ \bot & \bot & \bot & \mathbf{t} & \mathbf{t}\\ \top & \top & \mathbf{t} & \top & \mathbf{t}\\ \mathbf{t} & \mathbf{t} & \mathbf{t} & \mathbf{t} & \mathbf{t} \end{array}$$

$$\wedge_k: \quad \begin{array}{c|cccc} & \bot & \mathbf{t} & \mathbf{f} & \top\\ \hline \bot & \bot & \bot & \bot & \bot\\ \mathbf{t} & \bot & \mathbf{t} & \bot & \mathbf{t}\\ \mathbf{f} & \bot & \bot & \mathbf{f} & \mathbf{f}\\ \top & \bot & \mathbf{t} & \mathbf{f} & \top \end{array} \qquad \vee_k: \quad \begin{array}{c|cccc} & \bot & \mathbf{t} & \mathbf{f} & \top\\ \hline \bot & \bot & \mathbf{t} & \mathbf{f} & \top\\ \mathbf{t} & \mathbf{t} & \mathbf{t} & \top & \top\\ \mathbf{f} & \mathbf{f} & \top & \mathbf{f} & \top\\ \top & \top & \top & \top & \top \end{array}$$

$$\sim: \quad \begin{array}{c|c} a & \sim a\\ \hline \bot & \bot\\ \mathbf{t} & \mathbf{f}\\ \mathbf{f} & \mathbf{t}\\ \top & \top \end{array}$$

The negation table is forced: knowledge-monotonicity and involutivity of $\sim$ make it a $\le_k$-automorphism, which must fix the unique $\le_k$-bottom $\bot$ and unique $\le_k$-top $\top$; truth-antitonicity then forces $\sim$ to swap the unique $\le_t$-bottom $\mathbf{f}$ with the unique $\le_t$-top $\mathbf{t}$.

## The four extremes and their structural roles

The four elements play distinct structural roles forced by the bounded-lattice axioms in each order:

- $\bot$ is the identity of $\vee_k$ and the absorbing element of $\wedge_k$ — the $\le_k$-bottom. Given $\bot \le_k a$ for all $a$, $\bot \vee_k a = a$ and $\bot \wedge_k a = \bot$. The starting state for monotone evidence accumulation.
- $\top$ is the identity of $\wedge_k$ and the absorbing element of $\vee_k$ — the $\le_k$-top. Joining any value with $\top$ in $\le_k$ yields $\top$; meeting any value with $\top$ in $\le_k$ yields that value. Records contradiction as a state without trivialization.
- $\mathbf{t}$ is the identity of $\wedge_t$ and the absorbing element of $\vee_t$ — the $\le_t$-top. The truth-designated corner.
- $\mathbf{f}$ is the identity of $\vee_t$ and the absorbing element of $\wedge_t$ — the $\le_t$-bottom. The truth-rejected corner.

The four extremes are pairwise distinct in $\mathbf{FOUR}$ — no two coincide. This is what makes $\mathbf{FOUR}$ "non-trivial": collapse of any two extremes would reduce $\mathbf{FOUR}$ to a smaller bilattice with fewer distinguishable states.

## Universal property — initiality in $\mathbf{DBiLat}$

**Theorem (Fitting 2006).** *$\mathbf{FOUR}$ is the free distributive bilattice on no generators. Equivalently, $\mathbf{FOUR}$ is the initial object in the category $\mathbf{DBiLat}$ of distributive bilattices and bilattice homomorphisms: for every distributive bilattice $\mathbf{B}$, there is a unique bilattice homomorphism $\iota_\mathbf{B} : \mathbf{FOUR} \to \mathbf{B}$.*

**Proof sketch.** Given a distributive bilattice $\mathbf{B}$ with bounds $\bot^\mathbf{B}, \top^\mathbf{B}, \mathbf{t}^\mathbf{B}, \mathbf{f}^\mathbf{B}$, the candidate homomorphism is forced on the four elements: $\iota_\mathbf{B}$ must send $\bot$ to $\bot^\mathbf{B}$ (the unique $\le_k$-bottom; preserved because a homomorphism preserving $\wedge_k$ and $\vee_k$ sends absorbing element to absorbing element), and analogously $\top \mapsto \top^\mathbf{B}$, $\mathbf{t} \mapsto \mathbf{t}^\mathbf{B}$, $\mathbf{f} \mapsto \mathbf{f}^\mathbf{B}$. Distributivity of $\mathbf{B}$ together with the absorptive forcing on the four extremes determines $\iota_\mathbf{B}$ uniquely and verifies that it preserves all four operations and the negation. So $\iota_\mathbf{B}$ exists and is unique. $\blacksquare$

**Consequence (Bou–Rivieccio 2011).** *The variety $\mathbf{DBiLat}$ is generated by $\mathbf{FOUR}$: every distributive bilattice embeds into a power $\mathbf{FOUR}^I$ for some index set $I$.*

The generation theorem says that the equational theory of distributive bilattices is exactly the equational theory of $\mathbf{FOUR}$ — an equation holds in every distributive bilattice if and only if it holds in $\mathbf{FOUR}$. Combined with initiality, this makes $\mathbf{FOUR}$ the canonical reference object of $\mathbf{DBiLat}$: questions about arbitrary distributive bilattices reduce to questions about $\mathbf{FOUR}$ pointwise.

## Three equivalent characterizations of $\mathbf{FOUR}$

Three constructions give the same bilattice up to bilattice-isomorphism:

- **Twist product $\mathbf{2}^\bowtie$**: the construction from above, with carrier $\{0, 1\}^2$ and coordinate-swap negation.
- **Free distributive bilattice on no generators**: the initial object in $\mathbf{DBiLat}$ (universal property above).
- **Chu space $\mathrm{Chu}(\mathbf{2}, 0)$**: the Chu construction over the two-element Boolean lattice with dualizing element $0$ (Jakl 2025; the isomorphism is detailed in the chu-space-isomorphism note in this directory's library).

The three characterizations are mutually equivalent: the twist-product construction realizes the free distributive bilattice as $\mathbf{2}^\bowtie$, and Jakl 2025 establishes the further identification with the Chu space. Each characterization is independently useful — the twist-product gives explicit operation tables, the universal property gives the canonical-reference role, the Chu-space identification gives the MLL-model structure.

## Belnap's epistemic motivation

The four elements admit the canonical epistemic reading (Belnap 1977):

- $\bot$ — *told nothing*: no evidence either way.
- $\mathbf{t}$ — *told true*: positive evidence, no negative.
- $\mathbf{f}$ — *told false*: negative evidence, no positive.
- $\top$ — *told both*: positive and negative evidence simultaneously, held as a state without trivialization.

Under this reading, $\le_k$ ranks states by the total amount of evidence received (told-nothing at the bottom, told-both at the top); $\le_t$ ranks states by truth-direction (told-false at the bottom, told-true at the top, with told-nothing and told-both in the middle as truth-neutral).

The motivation forces the bilattice structure: any value algebra adequate to represent multi-agent evidence accumulation with paraconsistency must distinguish these four states, and the minimal carrier supporting the distinction is the four-element set with the two orders. Coarser value algebras conflate some states: Boolean two-valued logic conflates $\bot$ with $\top$ and $\mathbf{t}$ with $\mathbf{f}$; Kleene three-valued logic identifies $\top$ with $\bot$, losing the contradiction-versus-no-information distinction.

## Sub-objects and substructures

The directory `four-bilattice/library/` contains the structural sub-objects of $\mathbf{FOUR}$:

- **`chu-space-isomorphism/`** — Jakl 2025 Lemma 3.1 at $H = \mathbf{2}$: $\mathbf{FOUR} \cong \mathrm{Chu}(\mathbf{2}, 0)$ as residuated structures, with the Chu tensor identified with the twist-product fusion and the Chu linear implication identified with the strong implication. The identification makes $\mathbf{FOUR}$ a model of multiplicative linear logic without exponentials.

## Position in the predication apparatus

$\mathbf{FOUR}$ is the value-algebra of the smallest non-trivial predication-fiber-algebra: when $\mathbf{L} = \mathbf{2}$, the predication-fiber-algebra at a predicate $p$ is $A_p = \mathbf{2}^{\bowtie\,E \times E} = \mathbf{FOUR}^{E \times E}$ — a function from entity-pair cells to $\mathbf{FOUR}$ values. Predication valuations with $\mathbf{L} = \mathbf{2}$ are functions $\Phi = E \times \Pi \times E \to \mathbf{FOUR}$.

When the residuated lattice parameter $\mathbf{L}$ is a richer Heyting algebra, the predication-fiber-algebra is $\mathbf{L}^{\bowtie\,E \times E}$ — a function into $\mathbf{L}^\bowtie$ rather than $\mathbf{FOUR}$. The $\mathbf{FOUR}$-valued case is the smallest one; the richer $\mathbf{L}$-valued cases extend the same construction with finer-grained evidence on each side.

## References

- Belnap, Nuel D. (1977). "A Useful Four-Valued Logic." In *Modern Uses of Multiple-Valued Logic*, ed. J. M. Dunn and G. Epstein, 5–37. Reidel. — Original four-valued epistemic motivation.
- Ginsberg, Matthew L. (1988). "Multivalued Logics: A Uniform Approach to Inference in Artificial Intelligence." *Computational Intelligence* 4, 265–316. — Distributive bilattice characterization.
- Fitting, Melvin (1991). "Bilattices and the Semantics of Logic Programming." *Journal of Logic Programming* 11, 91–116. — Two-order bilattice semantics.
- Fitting, Melvin (2006). "Bilattices Are Nice Things." In *Self-Reference*, ed. T. Bolander, V. F. Hendricks, and S. A. Pedersen, 53–77. CSLI Publications. — Free-distributive-bilattice characterization of $\mathbf{FOUR}$.
- Kalman, John A. (1958). "Lattices with Involution." *Transactions of the American Mathematical Society* 87(2), 485–491. — Early twist-product construction.
- Avron, Arnon (1996). "The Structure of Interlaced Bilattices." *Mathematical Structures in Computer Science* 6(3), 287–299. — Representation theorem realizing $\mathbf{FOUR}$ as $\mathbf{2}^\bowtie$.
- Bou, Félix, and Rivieccio, Umberto (2011). "The Logic of Distributive Bilattices." *Logic Journal of the IGPL* 19(1), 183–216. — $\mathbf{DBiLat}$ generated by $\mathbf{FOUR}$.
- Jakl, Tomáš (2025). "Four Imprints of Belnap's Useful Four-Valued Logic in Computer Science." *arXiv:2503.20679*. — Chu space identification $\mathbf{FOUR} \cong \mathrm{Chu}(\mathbf{2}, 0)$.
