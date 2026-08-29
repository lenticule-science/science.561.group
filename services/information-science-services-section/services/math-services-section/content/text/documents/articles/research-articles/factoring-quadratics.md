---
title: "Factoring Quadratics: Discriminants, Splitting, and the Genealogy of a Small Polynomial"
subtitle: "A graduate-to-research level paper on the algebra, history, and frontiers of degree-two factorization"
author: "OpenAI"
date: "2026-07-03"
lang: "en-US"
abstract: >
  Factoring quadratics is often introduced as a school technique, but the operation is a compact entry point into much of algebra: roots and divisors, discriminants and square classes, separability and characteristic two, unique factorization and its failures, binary quadratic forms, field extensions, local-global arithmetic, and exact symbolic computation. This paper develops factoring quadratics as a problem about how a degree-two polynomial decomposes relative to a chosen coefficient universe. It begins with the elementary field criterion in terms of the discriminant, then extends the analysis to finite fields, rational and integral coefficients, characteristic two, general rings, and geometric/scheme-theoretic interpretations. It then gives a genealogy from Old Babylonian square-completion and al-Khwārizmī’s rhetorical algebra through Viète, Descartes, Gauss, Galois, Dedekind, and twentieth-century computational algebra. The final sections explain why quadratics remain research-relevant, not because degree-two polynomials themselves are unsolved, but because they are the minimal laboratory for modern questions about factorization algorithms, quadratic forms, class groups, hyperfields, semirings, formal verification, and arithmetic geometry.
references:
  - id: neugebauer-sachs-1945
    type: book
    title: "Mathematical Cuneiform Texts"
    author:
      - family: Neugebauer
        given: Otto
      - family: Sachs
        given: Abraham J.
    issued:
      date-parts:
        - [1945]
    publisher: "American Oriental Society"
    publisher-place: "New Haven"
  - id: friberg-1981
    type: article-journal
    title: "Methods and Traditions of Babylonian Mathematics: Plimpton 322, Pythagorean Triples, and the Babylonian Triangle Parameter Equations"
    author:
      - family: Friberg
        given: Jöran
    issued:
      date-parts:
        - [1981]
    container-title: "Historia Mathematica"
    volume: "8"
    issue: "3"
    page: "277-318"
    DOI: "10.1016/0315-0860(81)90069-0"
  - id: mansfield-wildberger-2017
    type: article-journal
    title: "Plimpton 322 Is Babylonian Exact Sexagesimal Trigonometry"
    author:
      - family: Mansfield
        given: Daniel F.
      - family: Wildberger
        given: N. J.
    issued:
      date-parts:
        - [2017]
    container-title: "Historia Mathematica"
    volume: "44"
    issue: "4"
    page: "395-419"
    DOI: "10.1016/j.hm.2017.08.001"
  - id: alkhwarizmi-rosen-1831
    type: book
    title: "The Algebra of Mohammed ben Musa"
    author:
      - literal: "Muḥammad ibn Mūsā al-Khwārizmī"
    editor:
      - family: Rosen
        given: Frederic
    translator:
      - family: Rosen
        given: Frederic
    issued:
      date-parts:
        - [1831]
    publisher: "Oriental Translation Fund"
    publisher-place: "London"
  - id: loc-alkhwarizmi
    type: webpage
    title: "The Compendious Book on Calculation by Completion and Balancing"
    author:
      - literal: "Library of Congress"
    issued:
      date-parts:
        - [2021]
    URL: "https://www.loc.gov/item/2021666184/"
  - id: fibonacci-sigler-2002
    type: book
    title: "Fibonacci's Liber Abaci: A Translation into Modern English of Leonardo Pisano's Book of Calculation"
    author:
      - literal: "Leonardo of Pisa"
    translator:
      - family: Sigler
        given: Laurence E.
    issued:
      date-parts:
        - [2002]
    publisher: "Springer"
    publisher-place: "New York"
  - id: cardano-witmer-1993
    type: book
    title: "The Great Art; or, The Rules of Algebra"
    author:
      - family: Cardano
        given: Girolamo
    translator:
      - family: Witmer
        given: T. Richard
    issued:
      date-parts:
        - [1993]
    publisher: "Dover Publications"
    publisher-place: "New York"
  - id: vieta-1591
    type: book
    title: "In artem analyticem isagoge"
    author:
      - family: Viète
        given: François
    issued:
      date-parts:
        - [1591]
    publisher-place: "Tours"
  - id: descartes-1637
    type: book
    title: "La Géométrie"
    author:
      - family: Descartes
        given: René
    issued:
      date-parts:
        - [1637]
    publisher-place: "Leiden"
  - id: gauss-1801
    type: book
    title: "Disquisitiones Arithmeticae"
    author:
      - family: Gauss
        given: Carl Friedrich
    issued:
      date-parts:
        - [1801]
    publisher: "Fleischer"
    publisher-place: "Leipzig"
  - id: buell-1989
    type: book
    title: "Binary Quadratic Forms: Classical Theory and Modern Computations"
    author:
      - family: Buell
        given: Duncan A.
    issued:
      date-parts:
        - [1989]
    publisher: "Springer"
    publisher-place: "New York"
  - id: bhargava-2004
    type: article-journal
    title: "Higher Composition Laws I: A New View on Gauss Composition, and Quadratic Generalizations"
    author:
      - family: Bhargava
        given: Manjul
    issued:
      date-parts:
        - [2004]
    container-title: "Annals of Mathematics"
    volume: "159"
    issue: "1"
    page: "217-250"
    DOI: "10.4007/annals.2004.159.217"
  - id: artin-1991
    type: book
    title: "Algebra"
    author:
      - family: Artin
        given: Michael
    issued:
      date-parts:
        - [1991]
    publisher: "Prentice Hall"
    publisher-place: "Englewood Cliffs"
  - id: lang-2002
    type: book
    title: "Algebra"
    author:
      - family: Lang
        given: Serge
    edition: "Revised third edition"
    issued:
      date-parts:
        - [2002]
    publisher: "Springer"
    publisher-place: "New York"
  - id: cox-2012
    type: book
    title: "Galois Theory"
    author:
      - family: Cox
        given: David A.
    issued:
      date-parts:
        - [2012]
    publisher: "Wiley"
    publisher-place: "Hoboken"
  - id: lam-2005
    type: book
    title: "Introduction to Quadratic Forms over Fields"
    author:
      - family: Lam
        given: Tsit-Yuen
    issued:
      date-parts:
        - [2005]
    publisher: "American Mathematical Society"
    publisher-place: "Providence"
  - id: berlekamp-1967
    type: article-journal
    title: "Factoring Polynomials over Finite Fields"
    author:
      - family: Berlekamp
        given: Elwyn R.
    issued:
      date-parts:
        - [1967]
    container-title: "Bell System Technical Journal"
    volume: "46"
    issue: "8"
    page: "1853-1859"
    DOI: "10.1002/j.1538-7305.1967.tb03174.x"
  - id: cantor-zassenhaus-1981
    type: article-journal
    title: "A New Algorithm for Factoring Polynomials over Finite Fields"
    author:
      - family: Cantor
        given: David G.
      - family: Zassenhaus
        given: Hans
    issued:
      date-parts:
        - [1981]
    container-title: "Mathematics of Computation"
    volume: "36"
    issue: "154"
    page: "587-592"
    DOI: "10.1090/S0025-5718-1981-0606517-5"
  - id: lll-1982
    type: article-journal
    title: "Factoring Polynomials with Rational Coefficients"
    author:
      - family: Lenstra
        given: Arjen K.
      - family: Lenstra
        given: Hendrik W.
      - family: Lovász
        given: László
    issued:
      date-parts:
        - [1982]
    container-title: "Mathematische Annalen"
    volume: "261"
    page: "515-534"
    DOI: "10.1007/BF01457454"
  - id: vonzurGathen-panario-2001
    type: article-journal
    title: "Factoring Polynomials over Finite Fields: A Survey"
    author:
      - family: von zur Gathen
        given: Joachim
      - family: Panario
        given: Daniel
    issued:
      date-parts:
        - [2001]
    container-title: "Journal of Symbolic Computation"
    volume: "31"
    issue: "1-2"
    page: "3-17"
    DOI: "10.1006/jsco.2000.1002"
  - id: kedlaya-umans-2011
    type: article-journal
    title: "Fast Polynomial Factorization and Modular Composition"
    author:
      - family: Kedlaya
        given: Kiran S.
      - family: Umans
        given: Christopher
    issued:
      date-parts:
        - [2011]
    container-title: "SIAM Journal on Computing"
    volume: "40"
    issue: "6"
    page: "1767-1802"
    DOI: "10.1137/08073408X"
  - id: guo-narayanan-umans-2016
    type: article
    title: "Algebraic Problems Equivalent to Beating Exponent 3/2 for Polynomial Factorization over Finite Fields"
    author:
      - family: Guo
        given: Zeyu
      - family: Narayanan
        given: Anand Kumar
      - family: Umans
        given: Christopher
    issued:
      date-parts:
        - [2016]
    URL: "https://arxiv.org/abs/1606.04592"
  - id: baker-lorscheid-2018
    type: article
    title: "Descartes' Rule of Signs, Newton Polygons, and Polynomials over Hyperfields"
    author:
      - family: Baker
        given: Matthew
      - family: Lorscheid
        given: Oliver
    issued:
      date-parts:
        - [2018]
    URL: "https://arxiv.org/abs/1811.04966"
type: research-article

---

# Factoring Quadratics: Discriminants, Splitting, and the Genealogy of a Small Polynomial

## Abstract

Factoring quadratics is often treated as a local classroom procedure: find two numbers whose product is one coefficient and whose sum is another. That procedure is real, useful, and historically important, but it is also only the surface of the matter. A quadratic is the first polynomial for which factorization is not automatic. Linear polynomials are already irreducible unless a unit is separated off; quadratics are where the coefficient system begins to matter. The same expression can factor over one field and remain irreducible over another; it can split into two distinct linear factors, collapse into a repeated factor, define a quadratic field extension, become inseparable in characteristic two, or behave pathologically over a ring with zero divisors. The degree-two case is therefore a minimal laboratory for algebraic structure.

This paper develops factoring quadratics as a problem about *splitting relative to a coefficient universe*. Over a field of characteristic not equal to two, the discriminant \(\Delta=b^2-4ac\) is the complete invariant for whether \(ax^2+bx+c\) factors: it splits if and only if \(\Delta\) is a square in the field. Over characteristic two, the same story becomes Artin--Schreier theory rather than square-root theory. Over \(\mathbb Z\), Gauss's lemma ties integer factorization to rational factorization, but over more general rings one must separate roots, linear divisors, idempotents, zero divisors, content, and unique factorization. Geometrically, factoring a quadratic is the degeneration of a conic, the decomposition of a binary quadratic form, or the splitting of a finite degree-two algebra into simpler pieces.

The genealogy runs from Old Babylonian procedures for completing the square through al-Khwārizmī's rhetorical algebra, the symbolic transformations of Viète and Descartes, Gauss's arithmetic of binary quadratic forms, Galois-theoretic splitting fields, and modern exact polynomial factorization algorithms. The frontier is no longer the solution of degree-two equations as such. It is the role of degree-two factorization as the simplest nontrivial case of larger research programs: computational algebra, class groups, quadratic forms, local-global principles, formal proof assistants, finite-field algorithms, hyperfields, tropical algebra, and factorization over nonclassical coefficient systems.

## 1. Introduction: the small polynomial that already knows too much

A quadratic polynomial seems too familiar to deserve research-level treatment. In elementary algebra, one learns to convert an expression such as \(x^2+5x+6\) into \((x+2)(x+3)\), or to use the quadratic formula when that search fails. But this familiar act hides a question that is much more structural than procedural: *in what algebraic world is the polynomial being asked to factor?* The answer changes the problem.

The expression \(x^2-2\) does not factor over \(\mathbb Q\), factors over \(\mathbb R\) as \((x-\sqrt2)(x+\sqrt2)\), factors over \(\mathbb F_7\) because \(2\) is a square modulo \(7\), and remains irreducible over \(\mathbb F_5\) because \(2\) is not a square modulo \(5\). The symbol sequence is the same, but the coefficient universe is not. Factoring is not a property of typography; it is a relation between a polynomial and the algebraic environment in which its possible factors are allowed to live.

The degree-two case is the first place where this dependence becomes visible. A nonconstant linear polynomial over a field is irreducible. A quadratic over a field is reducible exactly when it has a root, and it has a root exactly when its discriminant behaves appropriately. That compact criterion gives the misleading impression that everything important has already been exhausted. In fact, the discriminant criterion is a doorway. It leads to square classes, field extensions, separability, finite-field characters, ramification, conics, binary quadratic forms, Galois groups, local-global principles, and exact symbolic algorithms.

Factoring quadratics is also historically central. Ancient procedures for solving area problems were already, in modern terms, methods for handling quadratic equations by completing the square [@neugebauer-sachs-1945; @friberg-1981]. Al-Khwārizmī's *al-jabr wa-l-muqābala* gave systematic rhetorical rules for the positive quadratic cases and supplied geometric justifications [@alkhwarizmi-rosen-1831; @loc-alkhwarizmi]. Renaissance algebra transformed these procedures by introducing increasingly symbolic notation, and Descartes's analytic geometry recast equations as curves [@vieta-1591; @descartes-1637]. Gauss then made quadratic expressions arithmetic objects in their own right, especially through the theory of binary quadratic forms [@gauss-1801; @buell-1989]. In the twentieth century, polynomial factorization became an algorithmic problem central to coding theory, cryptography, computer algebra, and computational number theory [@berlekamp-1967; @cantor-zassenhaus-1981; @lll-1982; @vonzurGathen-panario-2001].

The aim of this paper is therefore not to teach the elementary factoring trick. It is to stabilize a research-level conception of what that trick is doing. A quadratic is small enough to compute completely but rich enough to expose the major themes of algebra: decomposition, invariance, base change, arithmetic obstruction, geometry, and algorithmic complexity.

## 2. Quadratics as algebraic objects

Let \(R\) be a commutative ring with identity. A univariate quadratic polynomial over \(R\) is an element

\[
  f(x)=ax^2+bx+c\in R[x]
\]

with \(a\neq 0\) in the relevant sense. If \(R\) has zero divisors, even the phrase "degree two" requires care: the formal degree may drop after multiplication by zero divisors or after passing to quotient rings. In most classical settings, \(R\) is a domain or a field, and \(a\neq 0\) simply means the degree is exactly two.

To factor \(f\) is to write it as

\[
  f(x)=g(x)h(x)
\]

where \(g,h\in R[x]\) are nonunits of lower degree. For a quadratic over a field \(F\), that means writing

\[
  ax^2+bx+c=a(x-r)(x-s)
\]

for some \(r,s\in F\), perhaps with \(r=s\). But this field-based picture should not be generalized too quickly. Over a general ring, linear factors need not behave as cleanly, and factorization may be nonunique. Over a field, however, degree arithmetic is rigid: a reducible quadratic must be a product of two linear factors.

There are three closely related but distinct questions:

1. Does \(f\) have a root in the coefficient system?
2. Does \(f\) have a linear factor in the coefficient system?
3. Does \(f\) split as a product of linear factors in the coefficient system?

Over a field, for a quadratic, these questions essentially coincide. If \(r\in F\) is a root, then \((x-r)\) divides \(f\), and the quotient is linear. Conversely, if \((x-r)\) divides \(f\), then \(f(r)=0\). Over a general commutative ring, the root-to-monic-linear-factor implication still holds by polynomial division by a monic polynomial, but other kinds of linear-looking decompositions can be distorted by zero divisors and nonunits.

A second distinction is between *solving* and *factoring*. Solving asks for values \(r\) such that \(f(r)=0\). Factoring asks for a product decomposition in \(R[x]\). Over a field these coincide for quadratics, but their conceptual orientations differ. Solving focuses on points; factoring focuses on decomposition. The same distinction reappears geometrically: roots are intersection points with the zero section, while factors are components of a divisor or scheme.

A third distinction is between *affine quadratics* and *quadratic forms*. The polynomial \(ax^2+bx+c\) is an affine univariate polynomial. The homogenized expression

\[
  aX^2+bXY+cY^2
\]

is a binary quadratic form. In one variable, factoring \(ax^2+bx+c\) is equivalent to factoring the homogenized form into linear forms after dehomogenizing at \(Y=1\). But the form-theoretic viewpoint is not merely notation. It connects the elementary discriminant \(b^2-4ac\) to arithmetic invariants, equivalence classes, class groups, and Gauss composition [@gauss-1801; @buell-1989; @bhargava-2004].

## 3. The field case in characteristic not two

Let \(F\) be a field with \(\operatorname{char}F\neq 2\), and let

\[
  f(x)=ax^2+bx+c\in F[x],\qquad a\neq 0.
\]

The discriminant is

\[
  \Delta=b^2-4ac.
\]

The core theorem is classical.

**Theorem.** Over a field \(F\) of characteristic not two, the quadratic \(ax^2+bx+c\) factors into linear factors over \(F\) if and only if \(\Delta\) is a square in \(F\). If \(\Delta=0\), it has one repeated root. If \(\Delta\neq 0\) is a square, it has two distinct roots. If \(\Delta\) is not a square, it is irreducible over \(F\).

The proof is the algebraic content of completing the square. Since \(2a\) is invertible,

\[
  ax^2+bx+c
  =a\left(x+\frac{b}{2a}\right)^2-\frac{\Delta}{4a}.
\]

Equivalently,

\[
  f(x)=a\left[\left(x+\frac{b}{2a}\right)^2-\left(\frac{d}{2a}\right)^2\right]
\]

whenever \(d^2=\Delta\). Then the difference-of-squares identity gives

\[
  f(x)=a\left(x+\frac{b-d}{2a}\right)\left(x+\frac{b+d}{2a}\right),
\]

or, in root form,

\[
  f(x)=a(x-r_+)(x-r_-),
  \qquad
  r_\pm=\frac{-b\pm d}{2a}.
\]

This theorem is sometimes presented as the quadratic formula, but its deeper meaning is square-class detection. The discriminant does not need to be numerically square in an absolute sense; it must be square in the coefficient field. Thus the same polynomial can move between irreducible, split, and repeated behavior under base change.

### 3.1. Square classes and splitting fields

If \(\Delta\) is not a square in \(F\), adjoining a square root produces the splitting field

\[
  F(\sqrt{\Delta}).
\]

The extension is either trivial or degree two, assuming \(\Delta\neq 0\). Thus every separable irreducible quadratic over a field of characteristic not two defines a quadratic field extension. Conversely, every quadratic separable extension of \(F\) can be represented by adjoining a square root of a nonsquare element, when \(\operatorname{char}F\neq 2\) [@artin-1991; @lang-2002; @cox-2012].

This is the first appearance of Galois theory. The Galois group of an irreducible separable quadratic is \(C_2\), acting by

\[
  \sqrt{\Delta}\mapsto -\sqrt{\Delta}.
\]

The two roots are exchanged by the nontrivial automorphism. The elementary \(\pm\) in the quadratic formula is already a Galois orbit.

### 3.2. Real, complex, rational, and finite fields

Over \(\mathbb R\), the square classes are determined by sign. A real quadratic with \(a\neq0\) splits over \(\mathbb R\) exactly when \(\Delta\geq0\). If \(\Delta<0\), it becomes split after base change to \(\mathbb C\), because \(\mathbb C\) is algebraically closed.

Over \(\mathbb Q\), the criterion is stricter: \(\Delta\) must be a square rational number. Since \(\Delta\in\mathbb Z\) for integer coefficients, an integral primitive quadratic factors over \(\mathbb Q\) exactly when \(\Delta\) is a square integer. Gauss's lemma then says that primitive factorization over \(\mathbb Q[x]\) is equivalent to factorization over \(\mathbb Z[x]\) up to units [@gauss-1801; @lang-2002]. Thus for primitive integer quadratics, rational reducibility and integer reducibility coincide.

Over a finite field \(\mathbb F_q\) of odd order, the same theorem is governed by the quadratic character. A nonzero \(\Delta\) is either a square or a nonsquare. The split, repeated, and irreducible cases are detected by

\[
  \chi(\Delta)=1,
  \qquad
  \Delta=0,
  \qquad
  \chi(\Delta)=-1,
\]

where \(\chi\) is the quadratic character of \(\mathbb F_q^\times\). Monic irreducible quadratics over \(\mathbb F_q\) are exactly the degree-two polynomials whose roots lie in \(\mathbb F_{q^2}\setminus\mathbb F_q\) and are paired by Frobenius. There are

\[
  \frac{q^2-q}{2}
\]

monic irreducible quadratics over \(\mathbb F_q\), because \(q^2-q\) elements of \(\mathbb F_{q^2}\) are outside \(\mathbb F_q\), and each irreducible quadratic accounts for a two-element Frobenius orbit.

Finite-field factorization is much larger than the quadratic case, but the quadratic case already displays the general philosophy: factoring over a finite field is the task of decomposing Frobenius orbits on roots [@berlekamp-1967; @cantor-zassenhaus-1981; @vonzurGathen-panario-2001].

## 4. Characteristic two: from square roots to Artin--Schreier theory

The usual discriminant formula conceals an assumption: division by \(2\). In characteristic two, completing the square changes character because \(2=0\). The derivative of

\[
  x^2+px+q
\]

is \(p\), not \(2x+p\). Thus separability and factorization behave differently.

Let \(F\) be a field of characteristic two and consider the monic quadratic

\[
  f(x)=x^2+px+q.
\]

There are two main cases.

If \(p=0\), then

\[
  f(x)=x^2+q.
\]

This has derivative zero. It is inseparable. It factors as a repeated linear factor exactly when \(q\) is a square in \(F\), since in characteristic two

\[
  (x+r)^2=x^2+r^2.
\]

If \(F\) is perfect, every element has a square root in characteristic two finite fields, so \(x^2+q\) is always a square of a linear polynomial. But over an imperfect field, \(q\) need not be a square, and \(x^2+q\) can be irreducible while still inseparable.

If \(p\neq0\), set \(x=py\). Then

\[
  x^2+px+q=p^2(y^2+y)+q.
\]

Thus \(f\) has a root in \(F\) exactly when the Artin--Schreier equation

\[
  y^2+y=\frac{q}{p^2}
\]

has a solution in \(F\). Over a finite field \(\mathbb F_{2^m}\), the map

\[
  A(y)=y^2+y
\]

has image precisely the elements of absolute trace zero. Therefore \(x^2+px+q\) with \(p\neq0\) splits over \(\mathbb F_{2^m}\) exactly when

\[
  \operatorname{Tr}_{\mathbb F_{2^m}/\mathbb F_2}\left(\frac{q}{p^2}\right)=0.
\]

This is the characteristic-two replacement for the discriminant square criterion. The obstruction is not a square class but an additive trace class. In characteristic not two, quadratic separable extensions are Kummer extensions \(F(\sqrt d)\) when suitable roots of unity are present. In characteristic two, separable quadratic extensions are Artin--Schreier extensions generated by a root of \(y^2+y=\alpha\). The elementary failure of the high-school quadratic formula in characteristic two is thus not a defect; it is a first encounter with a different cohomological classification of extensions.

## 5. Integer coefficients, content, and Gauss's lemma

For a polynomial

\[
  f(x)=ax^2+bx+c\in\mathbb Z[x],
\]

there are several possible coefficient systems: \(\mathbb Z\), \(\mathbb Q\), \(\mathbb R\), \(\mathbb C\), \(\mathbb Z/n\mathbb Z\), or a number field. A classroom factoring problem usually means factorization over \(\mathbb Z[x]\), but the algebraic criterion is most naturally stated over \(\mathbb Q[x]\).

The content of an integer polynomial is the greatest common divisor of its coefficients. A polynomial is primitive if its content is \(1\). Gauss's lemma says that the product of primitive polynomials is primitive, and that a primitive polynomial factors over \(\mathbb Q[x]\) if and only if it factors over \(\mathbb Z[x]\) up to multiplication by rational units. Therefore, for primitive integer quadratics, the discriminant square criterion over \(\mathbb Q\) is enough.

If \(f\) is primitive and \(\Delta=b^2-4ac\), then

\[
  f \text{ reducible over } \mathbb Z[x]
  \quad\Longleftrightarrow\quad
  \Delta \text{ is a square in } \mathbb Z.
\]

This statement is compact but important. It explains why the school method of looking for integer pairs works when it works: it is a bounded search implementation of a rational reducibility criterion. It also explains why the quadratic formula may produce irrational roots even for integer coefficients: the splitting field may be a genuine quadratic extension of \(\mathbb Q\).

The rational root theorem is a related but slightly different tool. If a primitive integer polynomial has a rational root \(r=m/n\) in lowest terms, then \(m\mid c\) and \(n\mid a\). For quadratics, finding one rational root is enough to factor the polynomial. The rational root theorem therefore gives a finite search for factorization over \(\mathbb Q\). The discriminant criterion gives a direct invariant. The two methods agree because both are detecting the same reducibility relation.

The integer setting also anticipates algebraic number theory. If \(\Delta\) is not square, the roots live in \(\mathbb Q(\sqrt\Delta)\). The element

\[
  \frac{-b+\sqrt\Delta}{2a}
\]

may be integral or nonintegral depending on the arithmetic of the quadratic order. Thus a quadratic polynomial with integer coefficients naturally leads to quadratic fields, orders, discriminants, ideals, and norms.

## 6. Factoring over rings: where the clean story breaks

The field case is clean because every nonzero coefficient is invertible and degree behaves additively. Over a general commutative ring \(R\), factoring quadratics becomes subtler. The same formal expression can acquire extra decompositions because \(R\) has zero divisors, nilpotents, nontrivial idempotents, or nonunique factorization.

A root \(r\in R\) of a monic polynomial still gives a factorization by \((x-r)\), because division by a monic polynomial works over any commutative ring. But a product decomposition of a quadratic need not be controlled by a single discriminant square class. Units and nonunits interfere with the leading coefficient. Zero divisors can make degrees collapse. Nilpotents can produce factorizations that disappear after reduction, or prevent factorizations from lifting uniquely.

Consider the conceptual difference between fields and quotient rings. Over a field, \(f=gh\) with \(\deg f=2\) forces \(\deg g=\deg h=1\), if both are nonconstant. Over a ring with zero divisors, leading coefficients can multiply to zero, so degree additivity can fail. This makes the naive inference from "quadratic" to "two linear factors" unsafe.

Over unique factorization domains, however, much of the field story can be recovered. If \(R\) is a UFD with fraction field \(K\), Gauss's lemma generalizes: primitive factorization in \(R[x]\) can be studied in \(K[x]\). Thus a quadratic over a UFD can often be tested by asking whether its discriminant is a square in the fraction field and whether the resulting factors can be cleared back to primitive factors over \(R\). But if \(R\) is not a UFD, factorization of coefficients and factorization of polynomials can diverge.

This is one reason quadratics are useful pedagogically and theoretically: they are the first place where one can feel exactly which hypotheses are doing work. In a field, the discriminant theorem is complete. In a UFD, it is mediated by content and fraction fields. In a general ring, one must reason more locally, often prime by prime or through the structure of \(\operatorname{Spec}R\).

## 7. Geometry: roots, components, conics, and finite algebras

There is a geometric meaning to factoring a quadratic. Over a field \(F\), the equation

\[
  ax^2+bx+c=0
\]

defines a degree-two subscheme of the affine line \(\mathbb A^1_F\). The coordinate algebra is

\[
  A=F[x]/(ax^2+bx+c).
\]

If \(f\) splits with two distinct roots, then

\[
  A\cong F\times F.
\]

The scheme is two reduced \(F\)-points. If \(f\) has a repeated root, then

\[
  A\cong F[\varepsilon]/(\varepsilon^2)
\]

after translation and scaling: a nonreduced double point. If \(f\) is irreducible and separable, then \(A\) is a quadratic field extension of \(F\): geometrically, one degree-two point rather than two degree-one points. Over an algebraic closure, that point splits into two conjugate geometric points.

Thus the discriminant stratifies the moduli of quadratic algebras. Distinct roots, repeated roots, and irreducible roots are not just computational outcomes; they are different geometric types. The discriminant-zero locus is the ramification or degeneracy locus. Away from it, the algebra is étale; on it, the algebra becomes nonreduced.

Homogenization gives the binary quadratic form

\[
  Q(X,Y)=aX^2+bXY+cY^2.
\]

Factoring \(Q\) into linear forms is equivalent to splitting the corresponding degree-two divisor on \(\mathbb P^1\). Over an algebraically closed field, every binary quadratic form factors. Over the base field, the question is whether the two geometric linear factors are individually defined over that field or only over a quadratic extension. This is the projective version of the same splitting problem.

For ternary quadratic forms, the geometric picture becomes the theory of conics. A homogeneous quadratic in three variables defines a plane conic. A reducible conic is a union of two lines, possibly conjugate over an extension field or coincident as a double line. The determinant of the associated symmetric matrix gives a discriminant-like condition for degeneracy. This is the geometric enlargement of the univariate story: factoring is component decomposition, and the discriminant detects singularity or degeneration.

## 8. Binary quadratic forms and arithmetic factorization

The univariate quadratic \(ax^2+bx+c\) becomes, after homogenization, a binary quadratic form

\[
  [a,b,c]=aX^2+bXY+cY^2.
\]

Its discriminant is again

\[
  D=b^2-4ac.
\]

But in the theory of binary quadratic forms, the question is not merely whether a single form factors into linear forms. One studies equivalence classes under changes of variables by \(\mathrm{SL}_2(\mathbb Z)\) or \(\mathrm{GL}_2(\mathbb Z)\), representation of integers by forms, reduction theory, and composition.

Gauss's theory of binary quadratic forms in *Disquisitiones Arithmeticae* is one of the great transformations in the history of quadratic algebra [@gauss-1801]. It turns expressions of degree two into arithmetic objects with a group law. For a fixed discriminant \(D\), suitable equivalence classes of primitive forms compose, and this composition is deeply connected to ideal class groups of quadratic orders. The elementary discriminant of a quadratic polynomial thereby becomes the discriminant of an arithmetic order.

This is a major conceptual shift. The school problem asks whether one expression factors. Gauss's theory asks how all quadratic expressions of a given discriminant are organized. Factorization becomes part of a larger theory of representation and class formation. A prime \(p\) is represented by a form of discriminant \(D\) precisely when it has a certain splitting behavior in a quadratic order. Thus factoring quadratics connects to quadratic reciprocity, ideal factorization, and the arithmetic of number fields.

Modern work continues this trajectory. Bhargava's higher composition laws reinterpret and generalize Gauss composition using more flexible algebraic structures [@bhargava-2004]. Although that research reaches far beyond elementary quadratics, it is genealogically continuous with the same core act: organizing degree-two algebraic data by discriminant, equivalence, and composition.

## 9. Completing the square as a historical and conceptual operation

Completing the square is often remembered as a derivation trick for the quadratic formula. Historically and conceptually, it is more than that. It is a normalization procedure. It translates a mixed linear-quadratic expression into a pure square plus a residual invariant.

For

\[
  ax^2+bx+c,
\]

the substitution

\[
  x\mapsto x-\frac{b}{2a}
\]

removes the linear term, leaving

\[
  ax^2-\frac{\Delta}{4a}.
\]

Thus all characteristic-not-two quadratics are equivalent, by translation and scaling, to a difference between a square and a discriminant term. The factorization question becomes: can that residual term itself be expressed as a square?

Old Babylonian mathematics did not use symbolic algebra in the modern sense, but many tablet problems can be interpreted as procedures for area-and-length situations whose solution amounts to completing a square [@neugebauer-sachs-1945; @friberg-1981]. Al-Khwārizmī's ninth-century algebra made such procedures systematic in rhetorical form. His work classified quadratic equations into positive canonical types and solved them using operations of restoration and balancing, with geometric demonstrations [@alkhwarizmi-rosen-1831; @loc-alkhwarizmi].

The phrase "completing the square" therefore marks a continuity between geometry and algebra. In geometric terms, one literally completes a square area. In symbolic algebra, one performs a coordinate translation. In modern algebraic geometry, one diagonalizes or normalizes a quadratic form when the relevant scalar \(2\) is invertible. The same operation lives simultaneously as a diagram, a rule, a formula, and a change of coordinates.

## 10. Genealogy: from rhetorical rules to structural algebra

The development of quadratic factorization is not a straight line from ignorance to formula. It is a sequence of transformations in what counts as an algebraic object.

### 10.1. Old Babylonian problem algebra

Old Babylonian mathematics worked in a sexagesimal place-value system and used tables, reciprocal methods, and problem procedures. Many problems that modern readers write as quadratics were posed in terms of lengths, widths, areas, sums, and products. The typical task was not "factor this polynomial" but "find the side" or "find the length and width" given relations among geometric quantities [@neugebauer-sachs-1945; @friberg-1981].

This matters because the earliest quadratics were not objects to decompose. They were situations to resolve. The product-sum form of a monic quadratic,

\[
  x^2+bx+c=(x-r)(x-s),
\]

is naturally tied to the problem of recovering two quantities from their sum and product. The modern factoring rule is therefore an algebraic compression of an older arithmetic-geometric practice.

### 10.2. Greek geometric algebra and the square

Greek mathematics did not develop symbolic polynomial algebra in the later sense, but Euclidean geometry contains identities that modern algebra writes as polynomial relations. The square of a sum, the difference of squares, and the relation between rectangles and squares are geometric facts before they are symbolic formulas. The identities

\[
  (u+v)^2=u^2+2uv+v^2
\]

and

\[
  u^2-v^2=(u-v)(u+v)
\]

are precisely the identities behind completing the square and difference-of-squares factoring. The quadratic is therefore historically entangled with the material geometry of areas.

### 10.3. Al-Khwārizmī and rhetorical algebra

Al-Khwārizmī's *Compendious Book on Calculation by Completion and Balancing*, composed in the Abbasid scholarly milieu, is a decisive point in the genealogy of algebra [@alkhwarizmi-rosen-1831; @loc-alkhwarizmi]. Its equations are rhetorical rather than symbolic; quantities are named in words rather than manipulated as modern expressions. But the text gives systematic procedures for quadratic types and explains them geometrically.

The restriction to positive quantities is not a mere deficiency. It reflects a different algebraic ontology. Negative coefficients, zero, arbitrary parameters, and symbolic transformations were not yet the default setting. Quadratic rules were organized by meaningful positive forms. Later symbolic algebra would unify these cases into one expression \(ax^2+bx+c=0\), but that unification required new notational and conceptual infrastructure.

### 10.4. Fibonacci, abacus algebra, and transmission

The medieval Latin abacus tradition, including Leonardo of Pisa's *Liber Abaci*, transmitted and transformed algebraic techniques into European commercial and scholarly contexts [@fibonacci-sigler-2002]. Quadratic problems appeared in practical settings involving trade, inheritance, partnership, and measurement. Again, the point was usually not factorization as an abstract operation but solution of determinate problems.

The continuity with modern factoring lies in the recurrence of sum-product and area-completion structures. The discontinuity lies in notation. Without symbolic parameters and polynomial expressions, the general theorem cannot easily be separated from families of problem types.

### 10.5. Renaissance symbolic algebra: Cardano and Viète

Cardano's *Ars Magna* is most famous for cubic and quartic equations, but it belongs to the broader Renaissance transformation of algebra into a discipline of equations [@cardano-witmer-1993]. Quadratics became the base case against which higher-degree equations were understood. The cubic formula, for instance, repeatedly reduces certain steps to quadratic extraction.

Viète's analytic art introduced systematic use of letters for both unknowns and parameters [@vieta-1591]. This was not a cosmetic change. Once coefficients can be arbitrary symbols, the quadratic becomes a family

\[
  ax^2+bx+c
\]

rather than a list of numerical problem types. The discriminant can then be recognized as an invariant expression built from parameters. Symbolic notation makes it possible to ask not only "what is the answer?" but "what structure controls all answers of this form?"

### 10.6. Descartes and analytic geometry

Descartes's *La Géométrie* joined algebraic equations to geometric curves and helped normalize the practice of moving all terms to one side of an equation [@descartes-1637]. This transition matters for factoring because a polynomial set equal to zero becomes an object whose roots, signs, and factors can be studied. Descartes's rule of signs, although not a factorization theorem, belongs to the same emerging view of polynomials as structured expressions with roots that can be counted, bounded, transformed, and classified.

The Cartesian shift also makes visible the geometric meaning of factorization. A product equation \(gh=0\) describes a union of loci. For quadratics in two variables, factorization means that a conic degenerates into lines. For univariate quadratics, it means that a degree-two divisor decomposes into degree-one pieces.

### 10.7. Gauss, discriminants, and arithmetic structure

Gauss transformed the quadratic from an equation-solving object into an arithmetic object. In the theory of binary quadratic forms, discriminants classify families of forms, and composition gives a group-like structure [@gauss-1801; @buell-1989]. This is a profound enlargement of factoring. The question is no longer only whether a polynomial splits, but how primes split, how integers are represented, how forms compose, and how equivalence classes organize arithmetic.

The discriminant becomes a bridge between local expression and global arithmetic. It determines congruence behavior, ramification, and class-group structure. The elementary \(b^2-4ac\) is thus one of the earliest invariants a student meets, but it is also a shadow of deep number-theoretic structure.

### 10.8. Galois, Dedekind, and structural algebra

Galois theory reframes polynomial factorization as symmetry. Roots may not lie in the base field, but they live in a splitting field, and the automorphism group of that field records how roots can be permuted while preserving algebraic relations [@cox-2012]. For irreducible separable quadratics, the Galois group is the two-element group. The simplicity of this case is instructive: factorization over the base field fails exactly because the two roots are conjugate rather than individually visible.

Dedekind's algebraic number theory further shifts attention from elements to ideals. In quadratic fields, primes can split, ramify, or remain inert. This trichotomy mirrors the quadratic discriminant trichotomy: distinct roots, repeated root, irreducible polynomial modulo a prime. Factoring quadratics modulo primes is therefore tied to prime decomposition in number fields.

### 10.9. Twentieth-century computation

In the twentieth century, factoring polynomials became a central task in computational algebra. Berlekamp's algorithm gave a linear-algebraic method for finite fields [@berlekamp-1967]. Cantor and Zassenhaus introduced randomized methods that became fundamental in finite-field factorization [@cantor-zassenhaus-1981]. The Lenstra--Lenstra--Lovász lattice basis reduction algorithm made polynomial factorization over the rationals computationally efficient in a new way [@lll-1982]. Later work connected fast finite-field factorization to modular composition and other deep algorithmic primitives [@kedlaya-umans-2011; @guo-narayanan-umans-2016].

Quadratics are not computationally hard in themselves. But they sit at the base of these algorithms as test cases, subroutines, and conceptual atoms. Irreducible quadratics define degree-two finite-field extensions; discriminants test square classes; modular factorization of integer polynomials begins with reductions modulo primes; and exact symbolic systems must handle all the edge cases: repeated roots, characteristic two, non-square discriminants, coefficient domains, and normalization of units.

## 11. Algorithmic views of quadratic factorization

An algorithm for factoring quadratics depends on the coefficient domain.

Over a field of characteristic not two, the abstract algorithm is:

1. Compute \(\Delta=b^2-4ac\).
2. Decide whether \(\Delta\) is a square in \(F\).
3. If it is, choose \(d\in F\) with \(d^2=\Delta\) and output the two linear factors.
4. If it is not, declare the polynomial irreducible over \(F\).

The computational complexity is therefore pushed into the square-detection and square-root-extraction problem in \(F\). Over \(\mathbb R\), this is numerical sign and square root. Over \(\mathbb Q\), it is rational square testing. Over \(\mathbb F_q\), it is quadratic character computation and finite-field square root extraction. Over algebraic number fields, it becomes arithmetic in field representations.

Over \(\mathbb Z\), one can compute the discriminant and test whether it is an integer square. If the polynomial is primitive, that is complete for reducibility over \(\mathbb Z[x]\). If not primitive, factor out the content first. This is the exact version of the school method, but it is less ad hoc: the search for two integers is replaced by an invariant test.

Over characteristic two, the algorithm uses the Artin--Schreier map. For \(x^2+px+q\), if \(p=0\), test whether \(q\) is a square. If \(p\neq0\), test whether \(q/p^2\) lies in the image of \(y\mapsto y^2+y\). Over finite fields of characteristic two, this means testing trace zero.

Modern computer algebra systems must implement these distinctions. A command such as `factor(x^2+1)` is incomplete without a domain: over \(\mathbb Z\), it is irreducible; over \(\mathbb Q\), irreducible; over \(\mathbb R\), irreducible as a product of real linear factors but reducible into real irreducible quadratics only trivially; over \(\mathbb C\), it splits; over \(\mathbb F_2\), \(x^2+1=(x+1)^2\). The domain is part of the input, even when the interface hides it.

## 12. Quadratic factorization and finite fields

Finite fields make the dependence on the coefficient universe especially explicit. For odd \(q\), every monic quadratic over \(\mathbb F_q\) has the form

\[
  x^2+bx+c.
\]

It splits if and only if \(b^2-4c\) is a square. Counting factorization types is straightforward:

- \(q\) monic quadratics have a repeated root, namely \((x-r)^2\) for \(r\in\mathbb F_q\).
- \(q(q-1)/2\) monic quadratics split into two distinct roots, corresponding to unordered pairs \(\{r,s\}\) with \(r\neq s\).
- \((q^2-q)/2\) monic quadratics are irreducible.

These counts reflect the Frobenius action on roots. A root \(\alpha\in\mathbb F_{q^2}\setminus\mathbb F_q\) has conjugate \(\alpha^q\), and the polynomial

\[
  (x-\alpha)(x-\alpha^q)
\]

has coefficients in \(\mathbb F_q\). Irreducible quadratics are precisely these two-element Frobenius orbits.

This perspective scales. General finite-field factorization decomposes roots into Frobenius orbits of various sizes. Algorithms such as Berlekamp's and Cantor--Zassenhaus's exploit algebraic structure in \(\mathbb F_q[x]/(f)\), gcd computations, exponentiation, and linear algebra [@berlekamp-1967; @cantor-zassenhaus-1981; @vonzurGathen-panario-2001]. In this setting, quadratics are not hard instances but minimal examples of the orbit-decomposition principle.

Finite fields also show why irreducible quadratics are constructive objects. If \(f\) is irreducible of degree two over \(\mathbb F_q\), then

\[
  \mathbb F_q[x]/(f)
\]

is a concrete model of \(\mathbb F_{q^2}\). Thus "failure to factor" over the base field creates a new field. Irreducibility is not merely obstruction; it is extension-building.

## 13. Local behavior and modular factorization

For integer quadratics, reducing modulo primes gives local information. Let

\[
  f(x)=ax^2+bx+c\in\mathbb Z[x]
\]

and let \(p\) be a prime not dividing problematic denominators or content. The reduction \(\bar f\in\mathbb F_p[x]\) may split, have a double root, or remain irreducible. For odd \(p\), this is governed by the Legendre symbol

\[
  \left(\frac{\Delta}{p}\right).
\]

If \(\Delta\) is a quadratic residue modulo \(p\), the polynomial splits modulo \(p\). If \(\Delta\equiv0\pmod p\), it has a repeated root modulo \(p\). If \(\Delta\) is a nonresidue, it is irreducible modulo \(p\).

This modular behavior is the polynomial analogue of prime splitting in quadratic fields. In the quadratic field \(K=\mathbb Q(\sqrt\Delta)\), a prime \(p\) typically splits, ramifies, or remains inert according to whether \(\Delta\) is a square, zero, or nonsquare modulo \(p\). Thus the discriminant controls both polynomial factorization modulo primes and ideal factorization in quadratic orders.

This local view is central to computational factorization over \(\mathbb Q\). Algorithms often factor a polynomial modulo suitable primes and then lift information back to characteristic zero. For quadratics, the direct discriminant test is simpler, but the same philosophy appears: understand global factorization by studying reductions in simpler coefficient systems.

## 14. Repeated roots, separability, and the discriminant locus

A quadratic has a repeated root exactly when its discriminant vanishes, at least over characteristic not two. This is not a minor exceptional case. It is the first example of the discriminant as a singularity detector.

For

\[
  f(x)=ax^2+bx+c,
\]

repeated roots occur when \(f\) and its derivative \(f'\) have a common root. In characteristic not two,

\[
  f'(x)=2ax+b.
\]

The common-root condition is equivalent to \(\Delta=0\). More generally, the discriminant of a polynomial is, up to a unit, the square of the product of pairwise root differences:

\[
  \operatorname{disc}(f)=a^{2n-2}\prod_{i<j}(r_i-r_j)^2.
\]

For \(n=2\), this reduces to \(b^2-4ac\). The discriminant vanishes precisely when roots collide.

Geometrically, the discriminant-zero locus is where the finite algebra \(F[x]/(f)\) stops being étale. In families of quadratics parameterized by \((a,b,c)\), the hypersurface \(b^2-4ac=0\) separates the generic separable behavior from the degenerate double-root behavior. This is the smallest instance of a discriminant variety.

In characteristic two, the discriminant formula loses information because \(4ac=0\), and \(b^2\) alone does not classify factorization. The derivative criterion remains more robust: repeated-root behavior is controlled by the common divisor of \(f\) and \(f'\). If \(f'=0\), the polynomial is inseparable. Thus the characteristic-two case teaches that discriminants are not magic expressions independent of context; they are algebraic packages whose meaning depends on structural assumptions.

## 15. The frontiers: why quadratics still matter

No one is trying to solve the quadratic equation for the first time. The formula is ancient relative to modern algebra. The research relevance of factoring quadratics lies elsewhere: degree two is the smallest nontrivial site where broad algebraic phenomena can be isolated.

### 15.1. Polynomial factorization algorithms

The general problem of factoring polynomials over finite fields remains algorithmically rich. Berlekamp's algorithm, Cantor--Zassenhaus, Kaltofen--Shoup methods, and Kedlaya--Umans modular-composition techniques belong to a long line of work improving asymptotic complexity and practical performance [@berlekamp-1967; @cantor-zassenhaus-1981; @kedlaya-umans-2011; @vonzurGathen-panario-2001]. Recent complexity questions ask which algebraic primitives would be equivalent to breaking certain exponent barriers for finite-field factorization [@guo-narayanan-umans-2016]. Quadratics are not the bottleneck, but every implementation must correctly handle them, and irreducible quadratics are the simplest nontrivial extension-building polynomials.

### 15.2. Derandomization and deterministic finite-field factorization

Randomized algorithms are highly effective for polynomial factorization over finite fields. Deterministic algorithms, especially with good complexity over large fields, are more delicate. This connects to broader questions in computational number theory and complexity theory. Quadratic residue testing is easy in finite fields of odd order, but the general problem of deterministic factorization exposes much deeper structure. The degree-two case is the visible base of a tower whose higher levels remain active research terrain.

### 15.3. Quadratic forms, class groups, and composition laws

The arithmetic of quadratic forms remains alive. Gauss composition has been reinterpreted through ideals, algebraic groups, orbits, and higher composition laws [@gauss-1801; @bhargava-2004; @lam-2005]. Binary quadratic forms sit at the intersection of elementary number theory, algebraic number theory, arithmetic geometry, and representation theory. The discriminant is a compact invariant, but the structures organized by discriminants are extensive.

### 15.4. Local-global principles

Quadratic forms over fields are governed by local-global phenomena. The Hasse--Minkowski theorem for quadratic forms says that a quadratic form over \(\mathbb Q\) represents zero nontrivially if and only if it does so over \(\mathbb R\) and every \(\mathbb Q_p\). Although univariate quadratic factorization is simpler, it belongs to the same world of local square classes, Hilbert symbols, and completions [@lam-2005]. Asking whether a discriminant is a square globally can be refined by asking how it behaves in each local field.

### 15.5. Hyperfields, tropical algebra, and generalized signs

In ordinary algebra, factorization occurs over rings and fields. Recent work on hyperfields and related structures generalizes what coefficients and roots can mean. Baker and Lorscheid use hyperfields to give conceptual treatments of Descartes' rule of signs and Newton polygons [@baker-lorscheid-2018]. In such contexts, even familiar polynomial questions change form. A quadratic over a hyperfield or tropical semiring is not merely an ordinary polynomial with unusual notation; the operations themselves have changed. Factoring quadratics in these settings can reveal how much of classical algebra depends on additive inverses, total order, or single-valued addition.

### 15.6. Formal verification and exact symbolic systems

Proof assistants and computer algebra systems need exact, domain-aware algebra. A verified theorem about factoring quadratics must specify its coefficient structure, characteristic assumptions, square-root operation, normalization conventions, and edge cases. Characteristic two, nonfields, repeated roots, and content are not pedagogical nuisances; they are specification obligations. The quadratic is therefore a useful benchmark for formalized algebra: small enough to verify completely, rich enough to force serious attention to hypotheses.

### 15.7. Cryptography, coding theory, and extension fields

Irreducible polynomials over finite fields are used to construct extension fields. Degree-two extensions are elementary but ubiquitous. Coding theory, elliptic-curve computations, pairing-based cryptography, and finite-field arithmetic all depend on reliable polynomial factorization and irreducibility testing. Berlekamp's original work was deeply connected to coding theory [@berlekamp-1967]. In this computational world, an irreducible quadratic is not a failed factorization; it is a machine for building \(\mathbb F_{q^2}\).

## 16. A compact classification table

For reference, the main factorization criteria can be summarized as follows.

| Coefficient setting | Quadratic form | Factorization criterion |
|---|---|---|
| Field \(F\), \(\operatorname{char}F\neq2\) | \(ax^2+bx+c\), \(a\neq0\) | Splits iff \(b^2-4ac\) is a square in \(F\). |
| Algebraically closed field | Any quadratic | Always splits, with repetition allowed. |
| \(\mathbb R\) | \(ax^2+bx+c\) | Splits over \(\mathbb R\) iff \(b^2-4ac\ge0\). |
| \(\mathbb Q\) | rational coefficients | Splits iff discriminant is a rational square. |
| Primitive \(\mathbb Z[x]\) quadratic | integer coefficients | Reducible over \(\mathbb Z[x]\) iff discriminant is an integer square. |
| \(\mathbb F_q\), \(q\) odd | finite field | Split/repeated/irreducible according as discriminant is square/zero/nonsquare. |
| \(\mathbb F_{2^m}\), \(p\neq0\) | \(x^2+px+q\) | Splits iff \(\operatorname{Tr}(q/p^2)=0\). |
| General ring \(R\) | \(ax^2+bx+c\) | No single discriminant criterion without further hypotheses; zero divisors, units, and content matter. |

This table is useful only if read structurally. It is not a list of unrelated tricks. It records which algebraic features replace one another as the coefficient universe changes: square classes over odd-characteristic fields, sign over \(\mathbb R\), rational square classes over \(\mathbb Q\), Frobenius orbits over finite fields, Artin--Schreier traces in characteristic two, and local ring structure over general bases.

## 17. Conclusion: factoring as articulation of the coefficient world

Factoring a quadratic is the act of asking whether a degree-two expression can be decomposed into degree-one expressions without leaving the chosen algebraic world. That last clause is everything. Over one world the factors exist; over another they do not. The polynomial is not alone. It is always paired with a coefficient domain, a notion of unit, a geometry of roots, and a theory of allowable extensions.

The elementary discriminant criterion is powerful because it condenses this dependence into one invariant, but only under appropriate hypotheses. In characteristic not two over a field, \(b^2-4ac\) tells the whole story. In characteristic two, the story becomes Artin--Schreier. Over integers, content and Gauss's lemma intervene. Over rings, roots, linear factors, and product decompositions separate. Geometrically, the same distinction appears as two points, a double point, or a conjugate degree-two point. Arithmetically, it becomes prime splitting and class groups. Computationally, it becomes domain-sensitive symbolic factorization.

The quadratic is therefore not merely the second-degree case. It is the first nontrivial grammar of algebraic decomposition. To understand it deeply is to see how elementary algebra opens onto field theory, number theory, algebraic geometry, and computation. The school exercise was never just a trick; it was a small visible face of the general problem of how mathematical objects split.
