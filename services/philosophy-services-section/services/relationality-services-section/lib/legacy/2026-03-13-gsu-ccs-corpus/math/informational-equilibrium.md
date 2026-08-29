---
id: informational-equilibrium
name: InformationalEquilibrium
description: "Definition and conjecture: R = U_G(R) is the informational equilibrium of the closure sorter — the unique state where applying U_G yields no new objects, so the universe can extract no further information from itself by self-sorting."
defines: InformationalEquilibrium
---

### Definition — Informational Equilibrium {#informational-equilibrium}

#### The Distinction from the Fixed-Point Theorem {#informational-equilibrium-vs-fixed-point}

The Theorem of Self-Generation (§self-generation) establishes that $R = U_G(R)$:
the Relational Universe is the least fixed point of its own closure operator. The proof
is Knaster-Tarski, applied via the depth-filtration tower (§depth-filtration).

**Informational equilibrium is a different claim.** The fixed-point theorem says $R$
*exists* and is *minimal* among fixed points. Informational equilibrium asks what the
fixed point *means* from the perspective of a self-sorting system:

> At the fixed point, $U_G$ applied to $R$ produces nothing that $R$ does not already
> contain. The closure sorter (§closure-sorting) cannot extract new information from $R$
> by applying its own sorting criterion to $R$.

This is not just that $U_G(R) = R$ as a set equation. It is that the *information content*
of $U_G(R)$ — measured by what new objects $U_G$ would produce — is zero relative to $R$.
The universe has reached the state where self-application of $U_G$ is informationally
idle.

#### Definition {#informational-equilibrium-def}

Let $\mathcal{U}$ be a candidate relational universe and $U_G$ the closure operator
(§closure-operator). The **informational gain** of $U_G$ applied to $\mathcal{U}$ is:
$$
\mathrm{IG}(U_G, \mathcal{U}) \;:=\; |U_G(\mathcal{U}) \setminus \mathcal{U}|,
$$
the number of new objects produced. (For infinite universes, this is the cardinality or
density measure of new objects; the precise formulation uses the depth filtration.)

$\mathcal{U}$ is in **informational equilibrium** with respect to $U_G$ if and only if
$$
\mathrm{IG}(U_G, \mathcal{U}) = 0,
$$
equivalently $U_G(\mathcal{U}) = \mathcal{U}$.

#### Conjecture — Uniqueness of Equilibrium {#informational-equilibrium-conjecture}

**Conjecture.** Among all relational universes $\mathcal{U}$ containing the atoms
$(T, \{H_t\})$, the Relational Universe $R$ is the *unique* universe in informational
equilibrium with $U_G$ that is minimal: no proper sub-universe of $R$ containing the
atoms is also in equilibrium.

This restates the minimality clause of the fixed-point theorem in informational language:
$R$ is not merely one fixed point — it is the one from which no information can be removed
while preserving equilibrium.

#### What Equilibrium Excludes {#informational-equilibrium-exclusions}

Informational equilibrium has three immediate consequences:

1. **No free information.** At equilibrium, every object in $R$ is already required by
   $U_G$'s sorting criteria — nothing in $R$ is surplus to what the closure conditions
   demand. The universe contains exactly the information its own structure requires.

2. **No missing information.** Equally, $U_G$ cannot produce anything outside $R$ from
   materials inside $R$. The universe is closed under the generation of information from
   itself.

3. **Self-description.** The criteria by which $U_G$ sorts — the seven closure conditions
   (§closure-sorting) — are themselves expressible as objects in $R$ at equilibrium.
   The sorting criterion is internal to the sorted universe. There is no need for an
   external metalanguage to specify what $R$ should contain; $R$ specifies this itself.

#### Relation to the Address Bound and Address Entropy {#informational-equilibrium-address}

The nucleus sorter's address bound (§nucleus-sorting, §nucleus-sorting-difference) says
that position in $R$ cannot be erased: carrying a history $t$ is carrying information that
cannot be discarded. Informational equilibrium says something complementary at the universe
level: the universe $R$ carries exactly the information that the closure operator $U_G$
requires and no more. The address bound is a *lower bound* on the information a
position-holder must carry; informational equilibrium is the *upper bound* on the
information a self-sorting universe can contain without becoming oversized relative to
its own generation criteria.

Together they bound the information content of $R$ from both sides.

#### Relation to the Hyperverse {#informational-equilibrium-hyperverse}

The same definition applies one level up. The Relational Hyperverse $\mathcal{H}$
(§relational-hyperverse) is the informational equilibrium of $U_\mathcal{H}$: the
unique minimal relational universe in which $U_\mathcal{H}(\mathcal{H}) = \mathcal{H}$.
At the hyperverse level, the "objects" being sorted are relational universes, and
informational equilibrium means that $\mathcal{H}$ generates no new relational universe
by applying $U_\mathcal{H}$ to itself — it already contains every universe its own
structure requires.

**Status.** The uniqueness conjecture follows from the minimality clause of the
fixed-point theorem (§self-generation) once the informational gain function is
formalized as a measure internal to $R$. The exclusion consequences (§informational-equilibrium-exclusions)
are informal; each requires a precise formulation of "information content" in the
sheaf-theoretic setting.
