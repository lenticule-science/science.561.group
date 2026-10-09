---
title: "Grothendieck Sites: Locality Without Points"
author:
  - family: emsenn
date: 2026-07-10
lang: en-US
csl: https://www.zotero.org/styles/chicago-author-date
references:
  - id: leray1946
    type: article-journal
    author:
      - family: Leray
        given: Jean
    title: "L'anneau d'homologie d'une représentation"
    container-title: "Colloque de topologie algébrique"
    publisher: Centre national de la recherche scientifique
    publisher-place: Paris
    issued: {year: 1946}
  - id: cartanserre1955
    type: article-journal
    author:
      - family: Cartan
        given: Henri
      - family: Serre
        given: Jean-Pierre
    title: "Un théorème de finitude concernant les variétés analytiques compactes"
    container-title: "Comptes rendus de l'Académie des sciences"
    volume: 241
    page: 322-324
    issued: {year: 1955}
  - id: grothendieck1957
    type: article-journal
    author:
      - family: Grothendieck
        given: Alexander
    title: "Sur quelques points d'algèbre homologique"
    container-title: "Tohoku Mathematical Journal"
    volume: 9
    issue: 2
    page: 119-221
    DOI: 10.2748/tmj/1178244839
    issued: {year: 1957}
  - id: sga4
    type: book
    author:
      - family: Artin
        given: Michael
      - family: Grothendieck
        given: Alexander
      - family: Verdier
        given: Jean-Louis
    title: "Théorie des topos et cohomologie étale des schémas (SGA 4), Tome 1"
    publisher: Springer-Verlag
    publisher-place: Berlin
    collection-title: Lecture Notes in Mathematics
    collection-number: 269
    DOI: 10.1007/BFb0081551
    issued: {year: 1972}
  - id: milne1980
    type: book
    author:
      - family: Milne
        given: James S.
    title: "Étale Cohomology"
    publisher: Princeton University Press
    publisher-place: Princeton, NJ
    issued: {year: 1980}
  - id: maclanemoerdijk1992
    type: book
    author:
      - family: Mac Lane
        given: Saunders
      - family: Moerdijk
        given: Ieke
    title: "Sheaves in Geometry and Logic: A First Introduction to Topos Theory"
    publisher: Springer-Verlag
    publisher-place: New York
    DOI: 10.1007/978-1-4612-0927-0
    issued: {year: 1992}
  - id: stacks2026
    type: book
    author:
      - literal: The Stacks Project Authors
    title: "The Stacks Project"
    URL: https://stacks.math.columbia.edu
    accessed: {date-parts: [[2026, 7, 10]]}
    issued: {year: 2026}
  - id: lurie2009
    type: book
    author:
      - family: Lurie
        given: Jacob
    title: "Higher Topos Theory"
    publisher: Princeton University Press
    publisher-place: Princeton, NJ
    DOI: 10.1515/9781400830558
    issued: {year: 2009}
  - id: bhattscholze2015
    type: article-journal
    author:
      - family: Bhatt
        given: Bhargav
      - family: Scholze
        given: Peter
    title: "The pro-étale topology for schemes"
    container-title: "Astérisque"
    volume: 369
    page: 99-201
    URL: https://arxiv.org/abs/1309.1198
    issued: {year: 2015}
  - id: scholze2026
    type: manuscript
    author:
      - family: Scholze
        given: Peter
    title: "Lectures on Condensed Mathematics"
    URL: https://arxiv.org/abs/2605.03658
    issued: {year: 2026}
  - id: clausenscholze2026
    type: manuscript
    author:
      - family: Clausen
        given: Dustin
      - family: Scholze
        given: Peter
    title: "Condensed Mathematics and Complex Geometry"
    URL: https://arxiv.org/abs/2605.11731
    issued: {year: 2026}
type: research-article

---

# Introduction

A Grothendieck site is a formal account of locality.  Classical topology begins
with a set of points and regards an open cover as a family of subsets whose union
is the whole.  This is too rigid for algebraic geometry: the local probes that
reveal an algebraic object need not be literal subsets, and a useful quotient,
extension, or field-valued test may have no adequate point-set description.  The
site replaces the primitive relation “is an open part of” with the more general
relation “is an admissible local presentation of.”  What matters is not that an
object is assembled from pieces lying inside it, but that information compatible
on a specified family of maps into it descends uniquely to the whole.

Formally, a site is a pair \((\mathcal C,J)\): a category \(\mathcal C\) and a
Grothendieck topology \(J\).  For each object \(U\), \(J(U)\) specifies which
sieves on \(U\) are covering.  A sieve is a class of arrows into \(U\) closed
under precomposition: once \(V\to U\) is admitted as a local test, every map
\(W\to V\to U\) is admitted as well.  Equivalently, it is a subpresheaf of the
representable presheaf \(h_U=\operatorname{Hom}_{\mathcal C}(-,U)\).  This
formulation is important.  It makes a cover not merely a list of arrows but its
entire stable field of refinements.

The axioms express the minimum coherence demanded of locality.  The maximal
sieve covers \(U\); the pullback of a cover along any arrow \(V\to U\) covers
\(V\); and covering can be checked locally along a cover.  The last condition,
often called transitivity or local character, says that refinement is not an
external bookkeeping operation: a locally covering choice of locally covering
choices is again covering.  Many working sites are presented more economically
by a *pretopology*, a declared class of covering families satisfying analogous
identity, base-change, and composition axioms.  The sieves containing one of
those families generate the Grothendieck topology [@sga4; @stacks2026].

A presheaf \(F\colon\mathcal C^{op}\to\mathbf{Set}\) is a sheaf for \(J\) when
every matching family on every covering sieve has one and only one amalgamation.
For a cover \(\{U_i\to U\}\) stable under fibre products, this is the familiar
equalizer condition

\[
 F(U)\longrightarrow \prod_iF(U_i)\rightrightarrows
 \prod_{i,j}F(U_i\times_UU_j).
\]

The category \(\operatorname{Sh}(\mathcal C,J)\) of such sheaves is a
Grothendieck topos.  Thus “site” names the presentation—generally far from
unique—while “topos” names the resulting category of local data.  This
distinction prevents a persistent error: a Grothendieck topology is not a
topology on the objects of \(\mathcal C\), and a site is not usually the object
whose cohomology one computes.  It is the controlled interface through which a
geometry exposes its local forms.

There are two useful levels of generality here.  A *coverage* may initially
declare only certain families to cover; closure under the cover axioms produces
a pretopology or a topology.  A *basis* is a smaller coverage that generates
the same sheaf theory.  Conversely, the sieve formulation is canonical and
does not require fibre products or a preferred list of generating covers.
This flexibility is not cosmetic: it lets one use concrete charts in a proof
while retaining a definition invariant under arbitrary refinement.  It also
explains why “the topology” on a category is a partially ordered datum: making
more sieves covering strengthens the sheaf condition and normally produces a
smaller category of sheaves.

The basic contravariance should be read geometrically.  An arrow \(V\to U\)
is a probe of \(U\); a presheaf sends it to a restriction map \(F(U)\to F(V)\).
The cover axioms tell us which collections of probes jointly determine a value
on \(U\).  In particular, a site is a disciplined way to ask an object what it
looks like after every admissible change of local perspective.  This is why the
same formalism works for Zariski opens, étale maps, manifolds, formal spectra,
and compact test spaces even though those local probes have very different
ontologies.

# Conceptual genealogy of the term

The immediate ancestor of the site is sheaf theory.  Jean Leray's work during
the 1940s introduced sheaves in the study of topology, and the Cartan--Serre
theory of coherent analytic sheaves made them an instrument for converting local
holomorphic data into global finiteness and cohomology statements
[@leray1946; @cartanserre1955].  In this setting locality still meant ordinary
open subsets of a topological space.  The sheaf condition, however, had already
isolated the decisive pattern: restrictions, compatibility on overlaps, and
unique gluing.

Alexander Grothendieck's 1957 *Sur quelques points d'algèbre homologique*
supplied the homological language necessary to make sheaf cohomology portable.
It treated sheaves alongside modules in the setting of abelian categories,
derived functors, and spectral sequences [@grothendieck1957].  The conceptual
shift was not yet a new notion of cover; it was the recognition that the
machinery of global invariants depends primarily on the category of coefficients
and its exactness properties, rather than on an underlying point set.  This
opened the way for a more radical reassignment of what “local” could mean.

The decisive pressure came from algebraic geometry and arithmetic.  The Zariski
topology of a scheme is indispensable but too coarse for phenomena such as
finite separable field extension, Galois action, and the cohomological methods
needed for the Weil conjectures.  An étale morphism behaves locally like a
covering map, yet it is not an inclusion of an open subset.  Grothendieck's
solution was to let such morphisms, and later flat or faithfully flat morphisms,
serve as covers.  He thereby detached the word “topology” from a lattice of
subsets and attached it to a stable calculus of arrows.

The material developed in the 1963–64 Séminaire de Géométrie Algébrique,
published as *SGA 4* under Michael Artin, Grothendieck, and Jean-Louis Verdier
in 1972, gave the definitive classical formulation: sites, topoi, morphisms of
topoi, sheaf cohomology, descent, and étale cohomology form a single formal
system [@sga4].  The name “site” is intentionally infrastructural rather than
substantial.  A site is a place where sheaves may be placed, not an alternative
name for a space.  That emphasis also explains why different sites may yield
equivalent topoi: their categories of probes may differ while their locally
gluable information is the same.

Subsequent development clarified two complementary aspects.  First, the
canonical topology on a category is the finest Grothendieck topology for which
all representable presheaves are sheaves; a topology with this property is
called subcanonical.  It records when the objects of \(\mathcal C\) themselves
already behave like geometric probes under the Yoneda embedding.  Second,
Grothendieck topoi acquired intrinsic characterizations through Giraud-style
axioms: one can recognize a sheaf topos by categorical properties without being
given a site.  Saunders Mac Lane and Ieke Moerdijk's *Sheaves in Geometry and
Logic* made this dual viewpoint—the syntactic presentation by a site and the
semantic object given by a topos—central to modern exposition
[@maclanemoerdijk1992].

The word now denotes a mature piece of categorical vocabulary, but its
genealogy remains visible in its structure.  A site retains Leray's gluing,
Grothendieck's homological portability, the algebraic geometer's non-open local
maps, and Verdier's use of topoi as the ambient setting for cohomological
operations.  It is therefore better understood as a formalization of *descent*
than as a generalized topology in the thin sense of open-set membership.

The historical transition also changes the role of points.  A point of an
ordinary space is an elementary local observer, but schemes already require
generic points and residue fields that are not well described by ordinary local
Euclidean intuition.  A Grothendieck topos may have enough points, too few
points, or no points in the ordinary sense; nevertheless its sheaves and
cohomology remain meaningful.  This made “space” a categorical notion: its
observable content is encoded by how local data glue.  In algebraic geometry
this was an expansion of geometry, not an abandonment of it, because the
resulting topoi retained concrete relations to schemes, fields, and morphisms.

The development after *SGA 4* therefore branched rather than simply
standardized.  Étale, flat, crystalline, syntomic, Nisnevich, and later
pro-étale topologies each encode a different local equivalence principle.  A
cover is never merely a technical convention: declaring a map locally
surjective determines which obstructions are visible and which forms become
locally trivial.  The plurality of sites is precisely what allows one geometric
object to support several complementary cohomology theories.

# Practical applications today

In present-day algebraic geometry, changing the site changes the questions a
scheme can answer locally.  The Zariski site uses open immersions and is suited
to ordinary local algebra of affine opens.  The étale site admits étale maps,
detecting finite separable and Galois-theoretic structure invisible to the
Zariski topology.  The fppf site uses faithfully flat morphisms locally of finite
presentation; the fpqc site allows faithfully flat quasi-compact covers.  These
are not four rival meanings of the same underlying space.  They are distinct
descent regimes, selected because different objects—torsors, finite group
schemes, quasi-coherent modules, or cohomological coefficients—become locally
trivial in different regimes [@milne1980; @stacks2026].

Étale cohomology is the paradigmatic application.  To a scheme \(X\), one
associates its small étale site \(X_{\acute et}\); the derived functors of global
sections on sheaves of abelian groups then produce \(H^i_{\acute et}(X,F)\).
For suitable torsion coefficients these groups carry arithmetic information
while retaining the formal tools of sheaf cohomology.  Étale fundamental groups,
Galois cohomology, comparison theorems, and the construction of \(\ell\)-adic
cohomology all depend on this move from a scheme to its site.  Here the site is
not a preliminary encoding to be discarded: it specifies what counts as a
locally constant coefficient system and therefore what monodromy can mean.

Descent is the second large application.  A sheaf is an object whose values
can be reconstructed from a cover and its overlaps.  A stack makes the same
principle valid when objects have nontrivial automorphisms, so that equality is
replaced by coherent isomorphism.  Moduli problems are consequently formulated
as stacks on a chosen site: principal bundles, vector bundles, curves, and
families of schemes may fail to have well-behaved sets of isomorphism classes,
but they can satisfy descent as groupoid- or higher-category-valued functors.
The choice between étale, smooth, fppf, and fpqc covers is a substantive
statement about how those families are allowed to glue.

Sites also organize the general machinery of ringed spaces.  A ringed topos is
a topos carrying a sheaf of rings; its modules have derived categories and
cohomology.  This makes a considerable portion of geometry look formally
uniform: ordinary spaces, schemes, analytic spaces, and many moduli objects are
studied by selecting a site and coefficient sheaf, then applying functorial
constructions to the associated topos.  The practical payoff is not that all
geometries are identical.  It is that pullback, pushforward, base change, and
local-to-global spectral sequences can be stated at the right level of
abstraction and then specialized.

There is also a computationally precise use.  Proof-assistant libraries encode
Grothendieck topologies through sieves or covering families, formulate sheaf
conditions as limit statements, and prove the equivalence between alternative
presentations of a topology.  The mathematical content does not become a
finite calculation—quantification over refinements and size constraints remains
real—but the site formalism exposes the definitions in composable categorical
forms.  The Stacks Project's systematic treatment of sites and sheaves, in
particular, functions as an operational reference for the hypotheses under
which a named topology, descent argument, or cohomological construction is
valid [@stacks2026].

The relation to the functoriality of geometry is equally practical.  A
continuous morphism of sites induces a geometric morphism of sheaf topoi, with
an inverse-image functor preserving finite limits and a direct-image functor in
the opposite direction.  These adjoint pairs are the categorical form of
pullback and pushforward.  Once coefficient categories are abelian or stable,
their derived versions produce the familiar higher direct images and base-change
maps.  The language is deliberately reusable: it allows a comparison theorem
to assert that two different local presentations compute the same invariant
without confusing the presentations themselves.

Classifying topoi provide a second, logically oriented application.  A
geometric theory determines a topos whose geometric morphisms from another
topos classify models of that theory in the latter.  Conversely, a suitable
site can be read as a presentation of a geometric theory: objects act as
contexts and covers express provable local disjunction.  This is a working tool
in categorical logic and a precise explanation of why the sheaf condition is
often described as “local truth.”  It does not identify mathematics with logic;
it identifies a shared descent structure underlying geometric construction and
geometric reasoning [@maclanemoerdijk1992].

Analytic and differential settings use the same distinction to avoid a common
category mistake.  Ordinary sheaves on a manifold are already sheaves on its
open-set site, but a moduli problem over manifolds or complex spaces is often a
stack on a larger site.  The enlarged site records families and coordinate
changes, while the values record the objects being parameterized.  This is why
the site language enters deformation theory, gauge-theoretic moduli, and
algebraic stacks even when the objects ultimately studied have perfectly
familiar underlying spaces.

# Mathematical frontiers of the concept

The first frontier is higher descent.  In ordinary sheaf theory, matching values
on pairwise overlaps is sufficient because the target is a 1-category of sets.
For space-valued or \(\infty\)-groupoid-valued presheaves, compatibility includes
homotopies, homotopies between homotopies, and all higher coherence.  An
\(\infty\)-site supplies a Grothendieck topology on an \(\infty\)-category, and
an \(\infty\)-sheaf is required to satisfy descent with homotopy limits rather
than ordinary equalizers.  Hyperdescent strengthens this further by demanding
descent along hypercovers, which encode arbitrarily iterated overlaps.  Jacob
Lurie's *Higher Topos Theory* provides the foundational theory of the resulting
\(\infty\)-topoi, including their intrinsic characterizations and their relation
to ordinary topoi [@lurie2009].

This is not merely a categorical upgrade.  Derived algebraic geometry and
spectral algebraic geometry use higher sheaves to represent moduli problems
whose deformation theory is intrinsically homotopical.  Derived intersections,
for example, retain Tor-information that an ordinary fibre product erases; a
derived moduli functor must therefore glue not just objects and isomorphisms but
their full deformation complexes.  The site remains the locus of locality, but
the values being glued have become structured spaces, spectra, or derived rings.
An active technical question in particular settings is whether ordinary descent
already implies hyperdescent, and how accessibility, truncation, and
cohomological dimension control that implication.

A second frontier is the refinement of arithmetic localities.  Bhargav Bhatt
and Peter Scholze's pro-étale topology enlarges the étale site by allowing
pro-étale covers, obtaining a topos with improved topological behavior while
remaining tied to the étale geometry of schemes [@bhattscholze2015].  It has
become central to the treatment of \(\ell\)-adic sheaves and to perfectoid and
\(p\)-adic geometry, where inverse limits and continuous group actions are not
peripheral technicalities but part of the local structure.  The mathematical
work is to balance a rich enough class of covers to see limiting phenomena with
enough finiteness and coherence to preserve calculability of sheaves and their
derived categories.

Condensed mathematics moves the same design problem into analysis.  A condensed
set is, roughly, a sheaf of sets on a site of compact Hausdorff or extremally
disconnected compact Hausdorff test spaces equipped with a suitable
Grothendieck topology.  The point is to encode topological behavior by its
functor of compact probes in a category where algebra and homological algebra
are better behaved.  Peter Scholze's recent lectures and the 2026 work of Dustin
Clausen and Scholze on complex geometry develop this site-theoretic foundation
for analytic and derived constructions [@scholze2026; @clausenscholze2026].
The frontier is not a claim that every topological question has been reduced to
sheaf theory.  It is an effort to find sites whose descent categories admit
robust tensor products, derived functors, duality, and analytic comparison
results without discarding the topology that made those questions meaningful.

Finally, the theory remains self-reflective.  A given topos can have many sites
of definition, so one asks for small, coherent, subcanonical, or basis-like
presentations that preserve the desired sheaf category while making computation
possible.  Size issues matter: a category of all geometric probes may be too
large for naïve sheafification, while a badly chosen basis can hide necessary
refinements.  At the same time, questions of points versus pointless geometry,
logical classifying topoi, and the exact relation between geometric theories and
their sites continue to connect topology, logic, and algebraic geometry.  The
durable frontier is thus methodological as much as technical: construct the
right notion of local test, prove it supports descent, and let the resulting
sheaf category reveal the global object.
