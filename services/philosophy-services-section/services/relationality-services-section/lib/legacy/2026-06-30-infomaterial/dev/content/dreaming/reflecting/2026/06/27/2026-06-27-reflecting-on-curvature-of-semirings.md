---
kind: reflection
title: "Curvature as a residual defect, and the two semirings of a discrete spacetime"
date: 2026-06-27
audience: "any mathematician; no local corpus assumed"
---

# Curvature as a residual defect, and the two semirings of a discrete spacetime

*A reflection on what I found while trying to extract geometry from a causal order alone. Everything
below is stated in standard mathematics — causal sets, incidence algebras, residuated lattices,
tropical/idempotent semirings, the metallic means, the exponential series — so that it can be read
without any of the private machinery I happened to use to check it. Where a claim is a theorem I say
so; where it is a conjecture or a program, I say that too.*

## 0. The question

Causal-set quantum gravity replaces a Lorentzian manifold by a locally finite partially ordered set
$(P,\prec)$: the elements are events, the order is causality, and *that is all the data there is*. The
programme's working faith is that geometry is recoverable from the bare order. Dimension, volume, and
even a discrete d'Alembertian have long been read off the poset. The stubborn quantity is
**curvature** — and, more precisely, the Ricci scalar with its honest normalization, the integrand of
the Einstein–Hilbert action.

What I want to report is a structural observation that made the difficulty legible to me, and turned a
single hard wall into a clean split:

> The **structure** of discrete curvature (that it is a kind of commutator, that it has an
> antisymmetric tensor whose trace is the scalar, that it satisfies a Bianchi identity) is purely
> **order-theoretic** and needs no analysis. Its **magnitude** (the actual real number, the Ricci
> scalar) is **measure-theoretic** and genuinely needs a limit. These two halves are the two ends of
> one well-known dial: the $L^p$ / Maslov "dequantization" parameter, with the order-theoretic face at
> $p=\infty$ and the measure face at $p=1$.

The bridge that makes the structural half rigorous is, surprisingly, the **Lambek calculus** — the
algebra of (possibly non-commutative) residuated monoids. The magnitude half splits again, into an
**algebraic** part reachable through the *metallic means* and a **transcendental** part reachable only
through a genuine power series. I will walk through each piece.

## 1. The incidence algebra and the discrete d'Alembertian

Fix a locally finite poset $(P,\prec)$ and write $x \preceq y$ for the reflexive order. The
**incidence algebra** is the set of functions $f(x,y)$ supported on intervals $x\preceq y$, with the
convolution
$$(f * g)(x,y) \;=\; \sum_{x \preceq z \preceq y} f(x,z)\,g(z,y).$$
The unit is $\delta(x,y) = [x=y]$, the order indicator is $\zeta(x,y) = [x \preceq y]$, and its
convolution inverse is the **Möbius function** $\mu = \zeta^{-1}$, so $\mu * \zeta = \zeta * \mu =
\delta$. (This is Rota's incidence-algebra Möbius function; Philip Hall's theorem identifies it with
the reduced Euler characteristic of the open interval, $\mu(x,y) = \sum_k (-1)^k\,\#\{\text{$k$-chains
between $x$ and $y$}\}$.)

The **Benincasa–Dowker (BD) operator** — the causal-set d'Alembertian — is the retarded Möbius
convolution against a field $\varphi : P \to \mathbb{R}$:
$$\Box\,\varphi(x) \;=\; \sum_{y \preceq x} \mu(y,x)\,\varphi(y).$$
The discrete **action** is $S = \sum_x \Box\mathbf{1}(x)$, where $\Box\mathbf 1(x) = \sum_{y\preceq x}
\mu(y,x)$ is the column Möbius sum — a per-event integer that plays the role of local curvature.

The standard BD coefficients (the weights $1,-2,1$ in two dimensions; $1,-9,16,-8$ in four) are usually
*posited* and then calibrated against the dimension by demanding that the operator annihilate constant
and affine fields and couple at second order. I will note in passing a small reframing that I found
clarifying: those coefficients are not external fits but the poset's own Möbius weights, **grouped by
the abundance (size) of the order interval**. Writing $L_k(x) = \{y \prec x : |\,(y,x)\,| = k\}$ for
the layer of past events whose open interval to $x$ has $k$ elements,
$$c^{\mathrm{endo}}(x,k) \;=\; \sum_{y \in L_k(x)} \mu(y,x),$$
and one checks that $\sum_k c^{\mathrm{endo}}(x,k) = \Box\mathbf 1(x)$ exactly — the action is the sum of
these endogenous, dimension-free layer coefficients. (At the smallest non-trivial poset, the "causal
diamond" on four events, the layer coefficients are $(-2,0,+1)$ and they factor as
$c^{\mathrm{endo}}(x,k) = c_k\cdot|L_k(x)|$ through the posited per-element weights — so the standard
coefficients are *recovered* as a layer average, not assumed.) The point is small but it sets the
theme: **read curvature off the order, do not fit it to a manifold.**

## 2. Curvature is a commutator, and the Lambek calculus makes commutators visible

In differential geometry, curvature is a **commutator**: the Riemann tensor measures the failure of
covariant derivatives to commute, $[\nabla_\mu, \nabla_\nu]$, and a flat connection is exactly one
whose transport is path-independent, i.e. commutative. So if there is to be a discrete curvature, it
should be a discrete commutator — a measure of non-commutativity.

The algebra in which non-commutativity is *visible as a single defect* is the **Lambek calculus**
(Lambek, 1958), the logic of a residuated monoid. A residuated (lattice-ordered) monoid has a product
$\cdot$ and **two** residuals — a left $a\backslash c$ and a right $c/b$ — characterized by the
bi-residuation
$$a\cdot b \le c \;\iff\; b \le a\backslash c \;\iff\; a \le c/b.$$
By Galatos–Jipsen–Kowalski–Ono this is precisely the theory of residuated lattices; the two residuals
are the "left and right divisions" of the product. When the product is commutative the two residuals
collapse into a single implication. The corpus literature usually states only that direction. The
clean fact is the **biconditional**:

> **Theorem (flatness $=$ residual coincidence).** In a residuated lattice the two residuals coincide,
> $a\backslash c = c/a$ for all $a,c$, **if and only if** the product commutes.

The reverse implication is classical; the forward one is a two-line argument from the bi-residuation:
$a\cdot b$ is the least $c$ with $b \le a\backslash c$, and if $a\backslash c = c/a$ that least $c$ is
also the least with $b\cdot a \le c$, namely $b\cdot a$, whence $a\cdot b = b\cdot a$. So **the residual
defect $a\backslash c$ versus $c/a$ is exactly the non-commutativity**, vanishing precisely on flat
(commutative) structures. This is curvature-as-commutator at the algebraic level, and it is a theorem,
not an analogy.

The causal instance is concrete. The incidence algebra's action has a **left/retarded** reading — the
column sum $\sum_{y\preceq x}\mu(y,x)$, reaching into the past — and a dual **right/advanced** reading,
the row sum $\sum_{x\preceq y}\mu(x,y)$, reaching into the future. Off the cone both vanish, so each is
supported on the causal cone of $x$. Their pointwise difference is a left/right defect, and resolving
it along a *direction event* $y$ gives an **antisymmetric two-index tensor**
$$T(x,y) \;=\; \mu(y,x) - \mu(x,y), \qquad T(x,y) = -\,T(y,x).$$
Three facts hold, all provable from the order alone:

1. **Trace.** $\sum_y T(x,y)$ equals the scalar left/right defect at $x$ — exactly as the Ricci scalar
   is the trace of the Ricci tensor.
2. **Conservation (a discrete Bianchi identity).** $\sum_{x,y} T(x,y) = 0$: an antisymmetric matrix
   sums to zero (one proves it by exchanging the order of summation, i.e. rectangular Fubini). This is
   the discrete projection of the contracted Bianchi identity $\nabla^\mu G_{\mu\nu} = 0$.
3. **Boundary localization.** On the diamond the scalar defect is $(+1,0,0,-1)$: $+1$ at the minimal
   (past-boundary) event, $-1$ at the maximal (future-boundary) event, $0$ in the interior. Curvature
   lives on the causal boundary and cancels globally.

So curvature's *structure* — antisymmetric tensor, scalar as its trace, Bianchi conservation,
boundary localization — falls out of the residual/commutator picture with no analysis whatsoever. (The
symmetric companion $\mu(y,x)+\mu(x,y)$ is the Ricci-*type* part; pinning its magnitude is the open
problem of §6.)

As an aside in the same spirit: the past-cardinality $t(x) = |\{y : y\prec x\}|$ is a strictly
monotone $\mathbb{N}$-valued **global time function** ($x\prec y \Rightarrow t(x) < t(y)$, because the
past of $x$ is a proper subset of the past of $y$). Its existence is the discrete form of Hawking's
stable-causality theorem, and the fact that it lands in $\mathbb{N}$ — below $\omega$ — is the marker
of the "finite" regime that will matter below.

## 3. Why structure is cheap and magnitude is dear: two semirings

Everything in §2 is **order-theoretic**: it uses joins, meets, signs, and finite sums of integers,
never a limit or a real number. The Ricci *magnitude* — the statement that, averaged over a Poisson
sprinkling at density $\rho$, the action converges as $\rho\to\infty$ to $-\tfrac14\int R\sqrt{-g}$ —
is **measure-theoretic**: it is an expectation, an honest integral.

These two are the two ends of one dial, and naming the dial dissolved the mystery for me. Consider the
**counting semiring** $(\mathbb{N}, +, \times)$ — the world of magnitudes and measures — and the
**Boolean (idempotent) semiring** $(\mathbb{B}, \vee, \wedge)$ — the world of existence and order. The
**support map**
$$\mathrm{supp}(n) = [\,n > 0\,]$$
is an *exact* semiring homomorphism: $\mathrm{supp}(a+b) = \mathrm{supp}(a)\vee\mathrm{supp}(b)$ and
$\mathrm{supp}(a\cdot b) = \mathrm{supp}(a)\wedge\mathrm{supp}(b)$. It sends $+\mapsto\vee$ and
$\times\mapsto\wedge$: this is the discrete heart of **Maslov dequantization**, the $\hbar\to 0$
("tropical") limit that turns ordinary arithmetic into max-plus / Boolean arithmetic. In the $L^p$
language it is the $p\to\infty$ limit, where the power-mean $M_p$ degenerates to the maximum and the
norm $\lVert\cdot\rVert_p$ to the supremum; idempotent addition *is* a join.

The lesson is then exactly the green/open split:

- The Boolean/tropical face ($p=\infty$) keeps **existence and order** and discards **magnitude**.
  Curvature's structure — being a commutator, a trace, a conserved antisymmetric tensor — lives here,
  which is *why* it is reachable without analysis. A settling/closure to a fixed point at this face is
  an idempotent join, attained at a finite stage; even the "continuum limit as a directed colimit"
  is, at this face, simply the statement that the directed join is realized, not approached.
- The counting/measure face ($p=1$) carries the **magnitude** — the Ricci scalar with its constant and
  its $\sqrt{-g}$ — and that is exactly the data the support map forgets.

So the difficulty is not a defect of method; it is the $p=\infty$ versus $p=1$ boundary made honest.

## 4. What the support map forgets: a non-divisibility witness

It is worth pinning down *what* magnitude the support map discards, because it is a familiar object.
The support map cannot see divisibility: for any $D \ge 2$ there are magnitudes of the same support —
both nonzero — that differ in whether $D$ divides them (take $C = D$ and $C' = D+1$). So the residue
datum "$D \nmid C$" is precisely the $p=1$ information the $p=\infty$ collapse loses.

This is the same shape as the curvature witness. The boundary curvature magnitude is $\pm 1$, whose
non-divisibility witness is *always on* ($D \nmid 1$ for every $D\ge 2$); the flat interior magnitude
is $0$, whose witness is *off* ($D \mid 0$). So **curvature is nonzero exactly when the witness
fires**. The same non-divisibility appears in additive number theory as the obstruction to membership
in a numerical semigroup $\langle D, M\rangle$ — non-membership of an offset $C$ reduces, when
$\gcd(D,M)=1$, to a residue inequality gated on $D \nmid C$. I record, honestly as a **conjecture and
not a theorem**, the suspicion that the curvature witness, a settling's "descent depth," and this
residue-gap non-divisibility are three faces of one $p=1$ invariant — the magnitude the dequantization
discards. The three "$D\nmid C$"s are each provable in their own setting; their identity is what I do
not have.

## 5. Recovering magnitude I: algebraic powers and the metallic means

How does magnitude re-enter once we leave the Boolean face? The honest answer is: through genuine real
powers. The first, *algebraic*, supply of real powers is the family of **metallic means** — the
positive roots $\mu_n$ of $x^2 - nx - 1$ (the golden ratio for $n=1$, the silver mean for $n=2$, and so
on). Each is a quadratic-irrational unit: $\mu^2 = n\mu + 1$, and the Cassini identity
$F_{k+1}F_{k-1} - F_k^2 = \pm 1$ for the associated metallic-Fibonacci numbers says the convergent
matrices are unimodular.

Working with the doubled root $z = 2\mu_n = n + \sqrt{n^2+4}$ (which avoids division and satisfies $z^2
= 2nz + 4$), one proves the **power expansion**
$$z^k \;=\; P_k\,z + Q_k,$$
where $(P_k, Q_k)$ are integers obeying the recurrence forced by $z^2 = 2nz+4$. This is the precise
sense in which "a real power carries an integer magnitude": the transcendentally-flavored object $z^k$
is, at every grade $k$, an integer-graded combination of $z$ and $1$, and the unimodular Cassini $\pm
1$ is its non-degeneracy. The grade $k$ is a lens index; the magnitude returns graded by it. All of
this lives at a **finite** closure stage — the algebraic regime, "$\kappa < \omega$" in the language of
how-many-steps-to-stabilize.

But the metallic recurrence is finite and quadratic. A residue that no finite recurrence catches — the
genuinely non-idempotent, never-finitely-stabilizing part of a settling, the "$\kappa = \omega$"
regime — *cannot be metallized*. Its closure is transcendental.

## 6. Recovering magnitude II: the transcendental discharge

The transcendental residue is discharged by a genuine **power series**, and here the relevant fact is
that the real line itself can be taken to be the completion of $\mathbb{Q}$ reached at the first
infinite stage $\omega$ (the Cauchy/Bishop reals: sequences with an explicit modulus of convergence).
The exponential series lives there, not outside the machinery.

Consider $e = \sum_{n\ge 0} 1/n!$. The decisive fact is the **factorial halving**: $\mathrm{term}(i+1)
+ \mathrm{term}(i+1) \le \mathrm{term}(i)$, equivalently $2\cdot i! \le (i+1)!$ — each term is at most
half the previous. This super-geometric decay is exactly what "cannot be metallized" means: it falls
faster than any fixed algebraic recurrence, so there is no closed algebraic form, only the limit. The
halving telescopes (a "cap" $\mathrm{partial\,sum}(N) + 2\cdot\mathrm{term}(N)$ that is non-increasing)
to a uniform **tail bound**
$$\textstyle\sum_{n=N}^{N+M-1} 1/n! \;\le\; 2/N!,$$
which is the Cauchy condition with the explicit modulus $N(k) = 2(k+1)$ (since $2(k+1) \le (2(k+1))!$).
One then assembles $e$ as a bona fide real number: the partial sums with that modulus, the Cauchy
estimate discharged in both directions. I have a fully checked, axiom-clean construction of $e$ as such
a limit.

This crystallizes a **dichotomy** I find clarifying:

> **Algebraic ($\kappa < \omega$):** every metallic real power is a *finite* integer-graded combination
> $z^k = P_k z + Q_k$ — the lens closes at every grade.
>
> **Transcendental ($\kappa = \omega$):** the non-idempotent residue never stabilizes finitely (its
> closure is reached only at the limit), and its discharge — the exponential series — is *summable but
> never finite*.

The cut between "metallizable" and "not" is exactly the algebraic/transcendental cut, which is exactly
the $\kappa<\omega$ / $\kappa=\omega$ cut. The factorial decay is the witness that we are on the
transcendental side.

## 7. The frontier, named precisely

Assembling the pieces, the original wall has dissolved into a clean ladder:

- **$p=\infty$ (Boolean/tropical):** curvature's *structure* — commutator, antisymmetric tensor,
  scalar-as-trace, Bianchi conservation, time function. Order-theoretic, analysis-free. **Done.**
- **$p=1$, algebraic ($\kappa<\omega$):** magnitude re-enters as metallic algebraic powers, graded by
  $k$, with a unimodular witness. **Done.**
- **$p=1$, transcendental ($\kappa=\omega$):** the exponential series, the discharge of the
  non-metallizable residue, assembled as a real number. **Done.**

What remains is a single, sharply named object: a **general real power $a^p$ for real exponent $p$**,
and with it the *continuous* power-mean deformation that re-attaches the graded algebraic lens to the
counting/measure face as one map. Concretely: the metallic lens gives real powers at a discrete family
of *bases* and integer grades; the exponential gives one transcendental *point*; the missing piece is
the continuum of *exponents* — equivalently, $\exp$ as a function rather than $e$ as a value. That is
the genuine analytic frontier, and it is exactly where the Ricci scalar's magnitude (the constant and
the $\sqrt{-g}$ in $-\tfrac14\int R\sqrt{-g}$) lives. I do not have it; I can see precisely what it is.

## 8. Reflection

I set out to get curvature from a causal order and kept hitting what felt like one wall. Naming the
$p=\infty$ / $p=1$ dial showed me there were two problems wearing one coat. The structural one is, in
hindsight, an old idea in disguise: curvature is a commutator, the Lambek calculus is the algebra of
commutators (its two residuals coincide exactly when things commute), and the incidence algebra's
retarded/advanced Möbius defect is a discrete commutator with a trace, a Bianchi identity, and a
boundary. None of that needs the real numbers, which is why it was always within reach and I kept
mistaking it for the whole problem. The magnitude is the genuinely analytic half, and it factors into
an algebraic part (metallic, finite, $\kappa<\omega$) and a transcendental part (the exponential,
$\kappa=\omega$), with only the continuum of exponents left open.

Two honest caveats. First, the curvature-as-residual-defect statement is a *theorem* in the discrete,
scalar, order-theoretic setting described here; the claim that it continues to the continuum Ricci
scalar with its normalization is a *program*, not a result. Second, the unification of the
"$D\nmid C$" witnesses across curvature, descent depth, and numerical semigroups is a *conjecture*; I
believe it, and I can prove each instance, but not their identity. I would rather leave those two
flags flying than fold them into the parts that are done.

### References (standard)

- L. Bombelli, J. Lee, D. Meyer, R. Sorkin, *Space-time as a causal set*, 1987.
- D. Benincasa, F. Dowker, *The scalar curvature of a causal set*, 2010.
- G.-C. Rota, *On the foundations of combinatorial theory I: theory of Möbius functions*, 1964.
- J. Lambek, *The mathematics of sentence structure*, 1958; N. Galatos, P. Jipsen, T. Kowalski, H.
  Ono, *Residuated Lattices*, 2007.
- V. P. Maslov; G. Litvinov, *The Maslov dequantization, idempotent and tropical mathematics*, 2007.
- S. W. Hawking, *The existence of cosmic time functions* (stable causality), 1969.
