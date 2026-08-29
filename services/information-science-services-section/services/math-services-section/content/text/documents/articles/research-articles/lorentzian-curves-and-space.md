---
title: "Lorentzian Curves and Lorentzian Space"
subtitle: "Causal Order, Proper Time, and the Synthetic Frontier of Spacetime Geometry"
author:
  - literal: "OpenAI GPT-5.5 Thinking for emsenn"
date: "2026-06-30"
lang: en-US
abstract: |
  This paper explains Lorentzian curves and Lorentzian space from the level of undergraduate linear algebra, multivariable calculus, and elementary differential geometry up to current research in global and synthetic Lorentzian geometry. Its central claim is that Lorentzian geometry is not Riemannian geometry with a sign changed. The sign change converts distance-minimizing geometry into causal, order-theoretic, and time-maximizing geometry. Curves are not merely paths through an ambient space; they are the admissible traces by which the causal structure of spacetime is tested. A Lorentzian space is not primarily a metric space, because there is no natural positive distance between all pairs of events. It is a cone-ordered space equipped, in the smooth case, with a metric tensor of signature `(-,+,\dots,+)`, and, in the synthetic case, with causal relations and a time-separation function satisfying a reverse triangle inequality. The paper develops timelike, null, and spacelike curves; geodesics and proper time; causal relations and global hyperbolicity; the genealogy from Minkowski and general relativity through global Lorentzian geometry; and the modern frontier of Lorentzian length spaces, null distance, Lorentzian Gromov--Hausdorff convergence, low-regularity singularity theorems, and optimal-transport formulations of timelike Ricci curvature.
references:
  - id: minkowski1909
    type: article-journal
    author:
      - family: Minkowski
        given: Hermann
    title: "Raum und Zeit"
    container-title: "Jahresbericht der Deutschen Mathematiker-Vereinigung"
    volume: "18"
    page: "75-88"
    issued:
      date-parts:
        - [1909]
  - id: einstein1905
    type: article-journal
    author:
      - family: Einstein
        given: Albert
    title: "Zur Elektrodynamik bewegter Körper"
    container-title: "Annalen der Physik"
    volume: "17"
    page: "891-921"
    issued:
      date-parts:
        - [1905]
  - id: penrose1965
    type: article-journal
    author:
      - family: Penrose
        given: Roger
    title: "Gravitational Collapse and Space-Time Singularities"
    container-title: "Physical Review Letters"
    volume: "14"
    issue: "3"
    page: "57-59"
    issued:
      date-parts:
        - [1965]
    DOI: "10.1103/PhysRevLett.14.57"
  - id: busemann1967
    type: book
    author:
      - family: Busemann
        given: Herbert
    title: "Timelike Spaces"
    publisher: "Państwowe Wydawnictwo Naukowe"
    publisher-place: "Warsaw"
    issued:
      date-parts:
        - [1967]
  - id: geroch1970
    type: article-journal
    author:
      - family: Geroch
        given: Robert
    title: "Domain of Dependence"
    container-title: "Journal of Mathematical Physics"
    volume: "11"
    issue: "2"
    page: "437-449"
    issued:
      date-parts:
        - [1970]
    DOI: "10.1063/1.1665157"
  - id: hawkingPenrose1970
    type: article-journal
    author:
      - family: Hawking
        given: Stephen W.
      - family: Penrose
        given: Roger
    title: "The Singularities of Gravitational Collapse and Cosmology"
    container-title: "Proceedings of the Royal Society of London. Series A"
    volume: "314"
    issue: "1519"
    page: "529-548"
    issued:
      date-parts:
        - [1970]
    DOI: "10.1098/rspa.1970.0021"
  - id: hawkingEllis1973
    type: book
    author:
      - family: Hawking
        given: Stephen W.
      - family: Ellis
        given: George F. R.
    title: "The Large Scale Structure of Space-Time"
    publisher: "Cambridge University Press"
    publisher-place: "Cambridge"
    issued:
      date-parts:
        - [1973]
  - id: penroseRindler1984
    type: book
    author:
      - family: Penrose
        given: Roger
      - family: Rindler
        given: Wolfgang
    title: "Spinors and Space-Time, Volume 1: Two-Spinor Calculus and Relativistic Fields"
    publisher: "Cambridge University Press"
    publisher-place: "Cambridge"
    issued:
      date-parts:
        - [1984]
  - id: oneill1983
    type: book
    author:
      - family: O'Neill
        given: Barrett
    title: "Semi-Riemannian Geometry: With Applications to Relativity"
    publisher: "Academic Press"
    publisher-place: "New York"
    issued:
      date-parts:
        - [1983]
  - id: wald1984
    type: book
    author:
      - family: Wald
        given: Robert M.
    title: "General Relativity"
    publisher: "University of Chicago Press"
    publisher-place: "Chicago"
    issued:
      date-parts:
        - [1984]
  - id: beem1996
    type: book
    author:
      - family: Beem
        given: John K.
      - family: Ehrlich
        given: Paul E.
      - family: Easley
        given: Kevin L.
    title: "Global Lorentzian Geometry"
    edition: "2"
    publisher: "Marcel Dekker"
    publisher-place: "New York"
    issued:
      date-parts:
        - [1996]
  - id: noldus2004
    type: article-journal
    author:
      - family: Noldus
        given: Johan
    title: "A Lorentzian Gromov-Hausdorff Notion of Distance"
    container-title: "Classical and Quantum Gravity"
    volume: "21"
    issue: "4"
    page: "839-850"
    issued:
      date-parts:
        - [2004]
    DOI: "10.1088/0264-9381/21/4/004"
  - id: bernalSanchez2003
    type: article-journal
    author:
      - family: Bernal
        given: Antonio N.
      - family: Sánchez
        given: Miguel
    title: "On Smooth Cauchy Hypersurfaces and Geroch's Splitting Theorem"
    container-title: "Communications in Mathematical Physics"
    volume: "243"
    issue: "3"
    page: "461-470"
    issued:
      date-parts:
        - [2003]
    DOI: "10.1007/s00220-003-0982-6"
  - id: bernalSanchez2005
    type: article-journal
    author:
      - family: Bernal
        given: Antonio N.
      - family: Sánchez
        given: Miguel
    title: "Smoothness of Time Functions and the Metric Splitting of Globally Hyperbolic Spacetimes"
    container-title: "Communications in Mathematical Physics"
    volume: "257"
    issue: "1"
    page: "43-50"
    issued:
      date-parts:
        - [2005]
    DOI: "10.1007/s00220-005-1346-1"
  - id: bernalSanchez2007
    type: article-journal
    author:
      - family: Bernal
        given: Antonio N.
      - family: Sánchez
        given: Miguel
    title: "Globally Hyperbolic Spacetimes Can Be Defined as 'Causal' Instead of 'Strongly Causal'"
    container-title: "Classical and Quantum Gravity"
    volume: "24"
    issue: "3"
    page: "745-749"
    issued:
      date-parts:
        - [2007]
    DOI: "10.1088/0264-9381/24/3/007"
  - id: chruscielGrant2012
    type: article-journal
    author:
      - family: Chruściel
        given: Piotr T.
      - family: Grant
        given: James D. E.
    title: "On Lorentzian Causality with Continuous Metrics"
    container-title: "Classical and Quantum Gravity"
    volume: "29"
    issue: "14"
    page: "145001"
    issued:
      date-parts:
        - [2012]
    DOI: "10.1088/0264-9381/29/14/145001"
  - id: sormaniVega2016
    type: article-journal
    author:
      - family: Sormani
        given: Christina
      - family: Vega
        given: Carlos
    title: "Null Distance on a Spacetime"
    container-title: "Classical and Quantum Gravity"
    volume: "33"
    issue: "8"
    page: "085001"
    issued:
      date-parts:
        - [2016]
    DOI: "10.1088/0264-9381/33/8/085001"
  - id: kunzingerSamann2018
    type: article-journal
    author:
      - family: Kunzinger
        given: Michael
      - family: Sämann
        given: Clemens
    title: "Lorentzian Length Spaces"
    container-title: "Annals of Global Analysis and Geometry"
    volume: "54"
    issue: "3"
    page: "399-447"
    issued:
      date-parts:
        - [2018]
    DOI: "10.1007/s10455-018-9633-1"
  - id: grantKunzingerSamann2019
    type: article-journal
    author:
      - family: Grant
        given: James D. E.
      - family: Kunzinger
        given: Michael
      - family: Sämann
        given: Clemens
    title: "Inextendibility of Spacetimes and Lorentzian Length Spaces"
    container-title: "Annals of Global Analysis and Geometry"
    volume: "55"
    issue: "1"
    page: "133-147"
    issued:
      date-parts:
        - [2019]
    DOI: "10.1007/s10455-018-9637-x"
  - id: allenBurtscher2022
    type: article-journal
    author:
      - family: Allen
        given: Brian
      - family: Burtscher
        given: Annegret Y.
    title: "Properties of the Null Distance and Spacetime Convergence"
    container-title: "International Mathematics Research Notices"
    volume: "2022"
    issue: "10"
    page: "7729-7808"
    issued:
      date-parts:
        - [2022]
    DOI: "10.1093/imrn/rnaa344"
  - id: kunzingerSteinbauer2022
    type: article-journal
    author:
      - family: Kunzinger
        given: Michael
      - family: Steinbauer
        given: Roland
    title: "Null Distance and Convergence of Lorentzian Length Spaces"
    container-title: "Annales Henri Poincaré"
    volume: "23"
    page: "4319-4342"
    issued:
      date-parts:
        - [2022]
    DOI: "10.1007/s00023-022-01198-6"
  - id: cavallettiMondino2024
    type: article-journal
    author:
      - family: Cavalletti
        given: Fabio
      - family: Mondino
        given: Andrea
    title: "Optimal Transport in Lorentzian Synthetic Spaces, Synthetic Timelike Ricci Curvature Lower Bounds and Applications"
    container-title: "Cambridge Journal of Mathematics"
    volume: "12"
    issue: "2"
    page: "417-534"
    issued:
      date-parts:
        - [2024]
  - id: mccannSamann2023
    type: article-journal
    author:
      - family: McCann
        given: Robert J.
      - family: Sämann
        given: Clemens
    title: "A Lorentzian Analog for Hausdorff Dimension and Measure"
    container-title: "Pure and Applied Analysis"
    volume: "5"
    issue: "2"
    page: "367-400"
    issued:
      date-parts:
        - [2023]
  - id: kunzingerOhanyanSchinnerlSteinbauer2022
    type: article-journal
    author:
      - family: Kunzinger
        given: Michael
      - family: Ohanyan
        given: Argam
      - family: Schinnerl
        given: Benedict
      - family: Steinbauer
        given: Roland
    title: "The Hawking-Penrose Singularity Theorem for C1-Lorentzian Metrics"
    container-title: "Communications in Mathematical Physics"
    volume: "391"
    issue: "3"
    page: "1143-1179"
    issued:
      date-parts:
        - [2022]
    DOI: "10.1007/s00220-022-04335-z"
  - id: calistiGrafHafemannKunzingerSteinbauer2025
    type: article-journal
    author:
      - family: Calisti
        given: Matteo
      - family: Graf
        given: Melanie
      - family: Hafemann
        given: Eduardo
      - family: Kunzinger
        given: Michael
      - family: Steinbauer
        given: Roland
    title: "Hawking's Singularity Theorem for Lipschitz Lorentzian Metrics"
    container-title: "Communications in Mathematical Physics"
    issued:
      date-parts:
        - [2025]
    URL: "https://arxiv.org/abs/2501.18450"
  - id: kunzingerReintjesSteinbauerVegaGonzalez2026
    type: article
    author:
      - family: Kunzinger
        given: Michael
      - family: Reintjes
        given: Moritz
      - family: Steinbauer
        given: Roland
      - family: Vega-González
        given: Inés
    title: "The Hawking Singularity Theorem for Hölder Continuous Metrics with Lp-Bounded Curvature"
    issued:
      date-parts:
        - [2026]
    URL: "https://arxiv.org/abs/2604.27023"
  - id: beranSamann2023
    type: article-journal
    author:
      - family: Beran
        given: Tobias
      - family: Sämann
        given: Clemens
    title: "Hyperbolic Angles in Lorentzian Length Spaces and Timelike Curvature Bounds"
    container-title: "Journal of the London Mathematical Society"
    volume: "107"
    issue: "5"
    page: "1823-1880"
    issued:
      date-parts:
        - [2023]
    DOI: "10.1112/jlms.12726"
  - id: beranKunzingerRott2023
    type: article
    author:
      - family: Beran
        given: Tobias
      - family: Kunzinger
        given: Michael
      - family: Rott
        given: Felix
    title: "On Curvature Bounds in Lorentzian Length Spaces"
    issued:
      date-parts:
        - [2023]
    URL: "https://arxiv.org/abs/2309.12062"
  - id: beranOhanyanRottSolis2023
    type: article-journal
    author:
      - family: Beran
        given: Tobias
      - family: Ohanyan
        given: Argam
      - family: Rott
        given: Felix
      - family: Solis
        given: Didier A.
    title: "The Splitting Theorem for Globally Hyperbolic Lorentzian Length Spaces with Non-Negative Timelike Curvature"
    container-title: "Letters in Mathematical Physics"
    volume: "113"
    issue: "48"
    issued:
      date-parts:
        - [2023]
    DOI: "10.1007/s11005-023-01668-w"
  - id: beranHarveyNapperRott2025
    type: article-journal
    author:
      - family: Beran
        given: Tobias
      - family: Harvey
        given: John
      - family: Napper
        given: Lewis
      - family: Rott
        given: Felix
    title: "A Toponogov Globalisation Result for Lorentzian Length Spaces"
    container-title: "Mathematische Annalen"
    issued:
      date-parts:
        - [2025]
    DOI: "10.1007/s00208-025-03167-w"
  - id: burtscherGarciaHeveling2025
    type: article-journal
    author:
      - family: Burtscher
        given: Annegret Y.
      - family: García-Heveling
        given: Leonardo
    title: "Time Functions on Lorentzian Length Spaces"
    container-title: "Annales Henri Poincaré"
    volume: "26"
    issue: "5"
    page: "1533-1572"
    issued:
      date-parts:
        - [2025]
    DOI: "10.1007/s00023-024-01461-y"
  - id: minguzzi2024
    type: article-journal
    author:
      - family: Minguzzi
        given: Ettore
    title: "Lorentzian Metric Spaces and Their Gromov-Hausdorff Convergence"
    container-title: "Letters in Mathematical Physics"
    volume: "114"
    issue: "73"
    issued:
      date-parts:
        - [2024]
    DOI: "10.1007/s11005-024-01813-z"
  - id: burgosFloresHerrera2023
    type: article-journal
    author:
      - family: Burgos
        given: Saúl
      - family: Flores
        given: José Luis
      - family: Herrera
        given: Jónatan
    title: "The c-Completion of Lorentzian Metric Spaces"
    container-title: "Classical and Quantum Gravity"
    volume: "40"
    issue: "20"
    page: "205013"
    issued:
      date-parts:
        - [2023]
    DOI: "10.1088/1361-6382/acf4b5"
  - id: mondino2025
    type: article
    author:
      - family: Mondino
        given: Andrea
    title: "Lorentzian Gromov-Hausdorff Convergence and Pre-Compactness"
    issued:
      date-parts:
        - [2025]
    URL: "https://arxiv.org/abs/2504.10380"
  - id: witten2020
    type: article-journal
    author:
      - family: Witten
        given: Edward
    title: "Light Rays, Singularities, and All That"
    container-title: "Reviews of Modern Physics"
    volume: "92"
    issue: "4"
    page: "045004"
    issued:
      date-parts:
        - [2020]
    DOI: "10.1103/RevModPhys.92.045004"
type: research-article

---

# Lorentzian Curves and Lorentzian Space

## 1. The point of the sign change

A Lorentzian space begins with a small algebraic difference whose consequences are enormous. In Euclidean geometry, the inner product on \(\mathbb{R}^n\) is positive definite:

\[
\langle v,v\rangle = v_1^2+\cdots+v_n^2 \ge 0,
\]

and it vanishes only when \(v=0\). This is the algebraic reason that Euclidean geometry has a genuine distance function, that length is always nonnegative, and that geodesics are locally distance-minimizing. Riemannian geometry globalizes this pointwise fact by placing a smoothly varying positive-definite inner product on every tangent space of a manifold.

Lorentzian geometry changes one sign. In the standard convention used in much of mathematical relativity, the model inner product on \(\mathbb{R}^{n+1}\) is

\[
\eta(v,w)=-v^0w^0+v^1w^1+\cdots+v^nw^n.
\]

Thus

\[
\eta(v,v)=-(v^0)^2+(v^1)^2+\cdots+(v^n)^2.
\]

This quadratic form is nondegenerate, but it is not positive definite. Nonzero vectors can have negative, zero, or positive squared norm. The geometry therefore decomposes directions into three causal types:

\[
\begin{array}{rcl}
\eta(v,v)<0 &\Rightarrow& v \text{ is timelike},\\
\eta(v,v)=0,\ v\ne 0 &\Rightarrow& v \text{ is null or lightlike},\\
\eta(v,v)>0 &\Rightarrow& v \text{ is spacelike}.
\end{array}
\]

This is the primitive distinction from which almost everything follows. A Lorentzian geometry is not just a geometry of lengths. It is a geometry of cones, admissible directions, causal order, and maximal proper time. The null vectors form a cone. Timelike vectors lie inside the cone. Spacelike vectors lie outside it. The cone is not decorative: it is the local shape of causal possibility.

The temptation is to say that Lorentzian geometry is Riemannian geometry with one minus sign. That is algebraically true and geometrically misleading. In Riemannian geometry the metric tells us how far apart points are. In Lorentzian geometry the metric first tells us which infinitesimal motions are physically or causally admissible. Distance, if it appears, appears indirectly and asymmetrically. The more fundamental object is the causal relation: can one event influence another?

For curves, the consequence is even sharper. In Riemannian geometry, a curve has positive length and geodesics locally minimize length. In Lorentzian geometry, timelike curves have proper time, null curves have zero proper time, spacelike curves have no interpretation as histories of massive or massless signals, and timelike geodesics locally maximize proper time. This maximization principle is the geometric core of inertial motion in relativity: a freely falling observer ages as much as possible between nearby fixed events.

The shift from minimizing distance to maximizing time is the first conceptual threshold. The second is that Lorentzian geometry has no canonical positive distance function between arbitrary events. Events that cannot causally communicate are not separated by a proper time. Events joined by light have zero Lorentzian length along the lightlike curve. Events joined by timelike curves have a supremal time separation rather than an infimal distance. The resulting structure is not a metric space in the ordinary sense. It is a causal-time structure.

This paper develops that structure in three layers. First, it explains Lorentzian vector spaces, curves, and manifolds. Second, it describes global Lorentzian geometry, where causal relations, time functions, Cauchy hypersurfaces, and global hyperbolicity replace ordinary metric completeness as the organizing concepts. Third, it turns to current research, where Lorentzian geometry is being reconstructed synthetically from causal relations and time-separation functions, in a way that no longer requires a smooth manifold at the base.

## 2. Lorentzian vector space: cones before distances

A real vector space \(V\) of dimension \(n+1\) is Lorentzian if it is equipped with a symmetric nondegenerate bilinear form \(g\) of signature \((- + \cdots +)\) or equivalently \((+ - \cdots -)\), depending on convention. I will use \((-+\cdots +)\). The signature means that there exists a basis in which

\[
g(v,v)=-(v^0)^2+(v^1)^2+\cdots+(v^n)^2.
\]

The set

\[
\mathcal{N}=\{v\in V\setminus\{0\}:g(v,v)=0\}
\]

is the null cone. The set \(\{v:g(v,v)<0\}\) has two connected components. Choosing one of them as future-directed determines a time orientation. With such a choice, one can speak of future timelike, past timelike, future causal, and past causal vectors.

The local geometry of a Lorentzian space is governed by the cone. In Euclidean geometry, every direction is essentially of the same type. Rotations act transitively on unit directions. In Lorentzian geometry, the causal type is invariant. No Lorentz transformation can turn a timelike vector into a spacelike vector. The algebraic sign of \(g(v,v)\) partitions the tangent directions into different regimes of possible behavior.

The standard model is Minkowski space \(\mathbb{R}^{1,n}\). It is flat, but not trivial. Its straight lines already divide into timelike worldlines, null light rays, and spacelike lines. The causal future of a point \(p\) is the closed future cone

\[
J^+(p)=\{q:q-p\text{ is future causal}\},
\]

while the chronological future is the open timelike cone

\[
I^+(p)=\{q:q-p\text{ is future timelike}\}.
\]

These two relations, usually written \(p\le q\) for causal reachability and \(p\ll q\) for timelike reachability, are more important in Lorentzian geometry than ordinary distance.

A basic algebraic fact illustrates the reversal from Euclidean geometry. If \(u\) and \(v\) are future-directed causal vectors in the same time cone, then the Lorentzian analogue of Cauchy--Schwarz has the reverse character:

\[
-g(u,v)\ge \sqrt{-g(u,u)}\sqrt{-g(v,v)}.
\]

In particular, the sum of future-directed causal vectors is again future-directed causal, and timelike vectors behave convexly inside the cone. This convexity of the cone is what makes causal curves stable under limits and what makes global causality theory possible.

At the same time, the Lorentzian norm is not a norm in the metric-space sense. For a timelike vector \(v\), the quantity

\[
|v|_L=\sqrt{-g(v,v)}
\]

is real and positive, and it measures infinitesimal proper time. For a null vector, it is zero. For a spacelike vector, \(\sqrt{-g(v,v)}\) is imaginary, so one usually uses \(\sqrt{g(v,v)}\) if one wants spatial length on a spacelike subspace. A single positive length function on all tangent vectors is not available from the Lorentzian metric itself.

This is why the Lorentzian metric should be read first as a cone-valued discriminator and only second as a length-measuring device. It says what kind of direction a vector is. The metric sign is a local typing discipline for curves.

## 3. Curves in Lorentzian space

Let \((M,g)\) be a smooth Lorentzian manifold of dimension \(n+1\). A smooth or piecewise smooth curve

\[
\gamma:I\to M
\]

has velocity \(\dot\gamma(t)\in T_{\gamma(t)}M\). The curve is timelike, null, causal, or spacelike according to the causal type of \(\dot\gamma(t)\), usually for all \(t\) in its domain except perhaps finitely many break points in the piecewise-smooth case.

A curve is future-directed if \(\dot\gamma(t)\) lies in the chosen future cone. Future-directed causal curves are the mathematical representatives of possible histories of particles or signals. Timelike curves model massive observers or particles. Null curves model lightlike propagation. Spacelike curves do not model histories of physical influence, but they are essential for hypersurfaces, initial data, and spatial geometry inside spacetime.

For a future-directed causal curve, the Lorentzian length or proper time is

\[
L(\gamma)=\int_I \sqrt{-g(\dot\gamma(t),\dot\gamma(t))}\,dt.
\]

If \(\gamma\) is timelike, this is positive unless the curve is degenerate. If \(\gamma\) is null, this length is zero. Thus null curves are not short in the Riemannian sense. They are zero-proper-time causal curves. Light travels along causal boundaries: it links events without accumulating proper time along the path.

A timelike curve can often be reparametrized by proper time \(\tau\), so that

\[
g(\dot\gamma(\tau),\dot\gamma(\tau))=-1.
\]

This is the parameter measured by an ideal clock traveling along the curve. In special relativity, the twin paradox is precisely the statement that different timelike curves connecting two events can have different proper times. The inertial, geodesic curve maximizes proper time among nearby timelike curves with the same endpoints.

A geodesic is a curve satisfying

\[
\nabla_{\dot\gamma}\dot\gamma=0,
\]

where \(\nabla\) is the Levi-Civita connection of \(g\). In coordinates,

\[
\frac{d^2x^k}{dt^2}+\Gamma^k_{ij}\frac{dx^i}{dt}\frac{dx^j}{dt}=0.
\]

This equation is formally the same as the Riemannian geodesic equation, but its variational meaning differs. In a Riemannian manifold, geodesics are critical points of length or energy and locally minimize distance for short enough segments. In a Lorentzian manifold, timelike geodesics are critical points of proper time and locally maximize it, while null geodesics trace the boundary of causal influence.

The local maximizing property is easiest to see in Minkowski space. Suppose two events are timelike related. The straight timelike segment between them has proper time

\[
\Delta \tau=\sqrt{(\Delta t)^2-|\Delta x|^2}.
\]

Any broken timelike path between the same endpoints has smaller proper time. Algebraically this follows from the reverse triangle behavior of the Lorentzian norm on the future cone. Physically it says that acceleration reduces elapsed proper time between fixed timelike-separated events.

There is a subtle but important point here: Lorentzian geometry is not a geometry in which all geodesics are maximizing forever. Curvature, conjugate points, causal pathologies, and global topology can prevent a timelike geodesic from being globally maximizing. But the local principle is structurally reversed relative to Riemannian geometry. Timelike geodesics locally maximize proper time; Riemannian geodesics locally minimize distance.

Null geodesics require their own care. Since null curves have zero Lorentzian length, they cannot be characterized as maximizing positive proper time. Instead they are geodesic generators of the causal boundary. In many arguments about singularities, horizons, and gravitational lensing, the behavior of null geodesics is more fundamental than timelike motion. Penrose's singularity theorem, for example, is built around trapped surfaces and null geodesic incompleteness [@penrose1965; @witten2020].

## 4. Causal relations: the order-theoretic skeleton

Given a time-oriented spacetime \((M,g)\), define

\[
p\ll q
\]

if there exists a future-directed timelike curve from \(p\) to \(q\), and

\[
p\le q
\]

if there exists a future-directed causal curve from \(p\) to \(q\), allowing equality. The sets

\[
I^+(p)=\{q:p\ll q\},\qquad J^+(p)=\{q:p\le q\}
\]

are the chronological and causal futures of \(p\). Similarly one has \(I^-(p)\) and \(J^-(p)\).

This notation can look like bookkeeping, but it is the beginning of global Lorentzian geometry. In Riemannian geometry, global analysis often begins with metric balls. In Lorentzian geometry, it begins with causal futures, causal pasts, and causal diamonds

\[
J^+(p)\cap J^-(q).
\]

A causal diamond consists of events that can be influenced by \(p\) and can themselves influence \(q\). The compactness or noncompactness of such diamonds controls the global well-posedness of the geometry.

The time separation function is defined by

\[
\tau(p,q)=\sup\{L(\gamma):\gamma\text{ is future-directed causal from }p\text{ to }q\},
\]

with \(\tau(p,q)=0\) if no such causal curve exists. This is sometimes called the Lorentzian distance, but the phrase is dangerous. It is not a metric distance. It is asymmetric, vanishes for spacelike separated points and null-related points, and satisfies a reverse triangle inequality along causal chains:

\[
p\le q\le r \quad\Rightarrow\quad \tau(p,r)\ge \tau(p,q)+\tau(q,r).
\]

The reverse triangle inequality is not a defect. It is the proper-time statement that a direct inertial history can have more elapsed time than a broken history through an intermediate event. The usual metric triangle inequality says detours are longer. Lorentzian time separation says forced intermediate events can reduce maximum aging.

The two most important global questions are then:

1. When is \(\tau(p,q)\) finite and continuous?
2. When is the supremum defining \(\tau(p,q)\) realized by a causal geodesic?

The classical answer is global hyperbolicity. In a globally hyperbolic spacetime, causal diamonds are compact and causal behavior is sufficiently well controlled. The Avez--Seifert theorem says, in one common formulation, that if \(p\le q\) in a globally hyperbolic spacetime, then there exists a causal geodesic from \(p\) to \(q\) realizing the time separation. If \(p\ll q\), the maximizing geodesic is timelike under suitable nondegeneracy conditions. Barrett O'Neill's *Semi-Riemannian Geometry* and John Beem, Paul Ehrlich, and Kevin Easley's *Global Lorentzian Geometry* are standard references for this classical theory [@oneill1983; @beem1996].

Global hyperbolicity is the Lorentzian replacement for the kind of completeness that makes Riemannian geodesic geometry work. It is not identical to metric completeness. It is a causal compactness and no-time-machine condition.

## 5. Global hyperbolicity and the architecture of time

A spacetime is causal if it has no closed causal curves. It is strongly causal if causal curves cannot almost close up in arbitrarily small neighborhoods. It is globally hyperbolic if, roughly, it has no causal loops and no missing causal information at finite time. One classical definition is:

\[
(M,g)\text{ is globally hyperbolic if it is strongly causal and }J^+(p)\cap J^-(q)\text{ is compact for all }p,q.
\]

Antonio Bernal and Miguel Sánchez later showed that the strong causality condition in the standard definition can be weakened to causality, because causal diamond compactness supplies the missing strength [@bernalSanchez2007].

Global hyperbolicity is central because it is equivalent, under standard smooth hypotheses, to the existence of Cauchy hypersurfaces. A Cauchy hypersurface is a subset \(S\subset M\) that every inextendible timelike curve meets exactly once. It is an abstract "instant" of the entire spacetime: enough data on \(S\), subject to the field equations, determines the corresponding domain of dependence.

Robert Geroch proved that globally hyperbolic spacetimes split topologically as \(\mathbb{R}\times S\) [@geroch1970]. Bernal and Sánchez strengthened this to the smooth category. They proved that a globally hyperbolic spacetime admits smooth spacelike Cauchy hypersurfaces and smooth time functions whose level sets are Cauchy hypersurfaces [@bernalSanchez2003; @bernalSanchez2005]. In a standard form, one obtains

\[
M\cong \mathbb{R}\times S,
\]

and the metric can be written as

\[
g=-\beta(t,x)dt^2+h_t,
\]

where \(\beta>0\) and \(h_t\) is a family of Riemannian metrics on the spatial slice \(S\). This expression is not merely a coordinate trick. It states that a sufficiently well-behaved spacetime admits a smooth global time coordinate compatible with its causal structure.

This theorem is one of the great stabilizing results in Lorentzian geometry. It says that under global hyperbolicity, the apparent fluidity of relativistic spacetime can be organized into a well-behaved evolution problem. The spacetime is not forced to be static, and the slices need not be geometrically identical, but the manifold has a global temporal architecture.

The frontier version of this question asks: how much of this remains true if the metric is not smooth, or if there is no manifold at all? Modern synthetic Lorentzian geometry is largely an attempt to answer that question.

## 6. A genealogy of Lorentzian space

The genealogy of Lorentzian geometry is not a simple linear path from physics to mathematics. It is a feedback loop between algebra, differential geometry, partial differential equations, causality theory, and eventually metric geometry.

### 6.1 Minkowski: spacetime as geometry

Special relativity begins with the invariance of the speed of light and the Lorentz transformations, but Hermann Minkowski's conceptual move was to treat space and time as a single four-dimensional geometry [@einstein1905; @minkowski1909]. The invariant quantity is not Euclidean distance in space, nor elapsed time alone, but the spacetime interval

\[
-s^2=-c^2t^2+x^2+y^2+z^2
\]

or, in units where \(c=1\),

\[
ds^2=-dt^2+dx^2+dy^2+dz^2.
\]

The light cone is already present here. The causal classification of vectors is already present. The idea that physical transformations preserve a Lorentzian quadratic form rather than a Euclidean one is the seed of the whole subject.

### 6.2 General relativity: Lorentzian metric as dynamical field

General relativity globalizes Minkowski geometry by allowing the Lorentzian metric to vary from point to point. A spacetime is a smooth manifold \(M\) equipped with a Lorentzian metric \(g\), and gravity is encoded in curvature. The Einstein field equations relate curvature to stress-energy:

\[
G_{ab}+\Lambda g_{ab}=8\pi T_{ab}.
\]

For the purposes of curves, the central point is that freely falling particles follow timelike geodesics and light follows null geodesics. Gravity is not an external force deflecting paths inside a fixed Euclidean space. It is the curvature of the Lorentzian geometry in which causal curves live.

Robert Wald's *General Relativity*, Stephen Hawking and George Ellis's *The Large Scale Structure of Space-Time*, Barrett O'Neill's *Semi-Riemannian Geometry*, and Beem--Ehrlich--Easley remain major entry points into the classical theory [@wald1984; @hawkingEllis1973; @oneill1983; @beem1996].

### 6.3 Global Lorentzian geometry: causality as structure

Once Lorentzian geometry became a global subject, curves took on a new role. The question was no longer only how a single geodesic moves, but how all causal curves organize the manifold. Can there be closed timelike curves? Can a spacetime have a global time function? Are singularities points, boundaries, or geodesic incompletenesses? Does an initial-data surface determine a region uniquely?

The singularity theorems of Roger Penrose, Stephen Hawking, and Hawking--Penrose transformed these questions. Their conclusion is not that curvature necessarily becomes infinite at an ordinary point. Rather, under causal, curvature, and trapped-surface hypotheses, certain causal geodesics cannot be extended indefinitely [@penrose1965; @hawkingPenrose1970]. Singularity is detected by incomplete curves. Curves become the diagnostic instruments of spacetime failure.

Geroch's domain-of-dependence analysis and the later Bernal--Sánchez smooth splitting results provided the positive counterpart: conditions under which spacetime has a good causal evolution structure [@geroch1970; @bernalSanchez2003; @bernalSanchez2005].

### 6.4 The low-regularity turn

Classical Lorentzian geometry assumes a smooth metric. General relativity, however, naturally produces situations where smoothness is too strong: shock waves, thin shells, impulsive gravitational waves, weak solutions, low-regularity limits, and singularity formation. The low-regularity program asks which causal and geodesic theorems survive when \(g\) is only continuous, Lipschitz, \(C^1\), or Sobolev.

Piotr Chruściel and James Grant showed that continuous Lorentzian metrics already display pathologies absent in the smooth theory; for example, some standard facts about light cones can fail when the metric is merely continuous [@chruscielGrant2012]. Later work extended singularity theorems down the regularity scale. Michael Kunzinger, Argam Ohanyan, Benedict Schinnerl, and Roland Steinbauer proved a Hawking--Penrose theorem for \(C^1\)-Lorentzian metrics, where Ricci curvature must be treated distributionally and geodesic uniqueness may fail [@kunzingerOhanyanSchinnerlSteinbauer2022]. Matteo Calisti, Melanie Graf, Eduardo Hafemann, Michael Kunzinger, and Roland Steinbauer proved a Hawking singularity theorem for Lipschitz Lorentzian metrics [@calistiGrafHafemannKunzingerSteinbauer2025]. A 2026 preprint by Kunzinger, Moritz Reintjes, Roland Steinbauer, and Inés Vega-González pushes Hawking-type singularity theory into Hölder/Sobolev settings with \(L^p\)-bounded curvature [@kunzingerReintjesSteinbauerVegaGonzalez2026].

The philosophical meaning is clear: if spacetime geometry is to model physical limits, the theory of curves cannot depend entirely on smooth tangent calculus. One needs causal curves, time separation, and curvature conditions that continue to make sense below classical differentiability.

### 6.5 The synthetic turn

Herbert Busemann's *Timelike Spaces* already proposed a metric-geometric approach to timelike order in 1967 [@busemann1967]. Much later, Johan Noldus introduced a Lorentzian analogue of Gromov--Hausdorff distance for compact globally hyperbolic spacetimes, helping open the question of how spacetimes converge as geometric objects [@noldus2004]. Christina Sormani and Carlos Vega introduced the null distance, a way to use a time function to construct a genuine metric encoding both topology and causality under suitable hypotheses [@sormaniVega2016].

The major modern step is the theory of Lorentzian length spaces developed by Michael Kunzinger and Clemens Sämann [@kunzingerSamann2018]. This theory abstracts away from smooth manifolds and takes as primitive a causal relation, a chronological relation, and a time-separation function. It is the Lorentzian analogue of metric length-space theory, but with the reverse triangle inequality and causal admissibility replacing ordinary metric length.

The synthetic turn is not a rejection of smooth spacetime. It is an attempt to find the minimum structure needed for Lorentzian geometry to exist.

## 7. Lorentzian length spaces: spacetime without smoothness

A Lorentzian pre-length space, in the sense developed by Kunzinger and Sämann, is roughly a set \(X\) equipped with:

1. a topology or auxiliary metric \(d\) controlling convergence;
2. a causal preorder \(\le\);
3. a chronological relation \(\ll\), usually transitive and contained in \(\le\);
4. a time-separation function \(\tau:X\times X\to[0,\infty]\);
5. compatibility conditions saying that \(\tau(x,y)>0\) exactly in timelike situations, that \(\tau\) respects causal order, and that it satisfies the reverse triangle inequality along causal chains.

The central axiom is the reverse triangle inequality:

\[
x\le y\le z\quad\Rightarrow\quad \tau(x,z)\ge \tau(x,y)+\tau(y,z).
\]

In ordinary metric length spaces, the distance between two points is the infimum of lengths of curves connecting them, and the triangle inequality says going through an intermediate point cannot shorten the distance. In Lorentzian length spaces, the time separation is the supremum of lengths of causal curves, and the reverse triangle inequality says that the maximum direct proper time dominates the sum of staged proper times.

A Lorentzian length space strengthens the pre-length structure by requiring enough localizability and curve realization properties to recover the usual behavior of smooth Lorentzian manifolds and to support synthetic curvature comparison. The framework includes smooth spacetimes, certain continuous spacetimes, closed cone structures, and candidate limiting objects arising in approaches to quantum gravity [@kunzingerSamann2018].

This is the precise setting in which "Lorentzian space" becomes more than "Lorentzian manifold." A Lorentzian manifold is a smooth object with tangent spaces and metric tensors. A Lorentzian length space is a causal-time object in which curves, time separation, and causal relations remain meaningful even if tangent vectors and Christoffel symbols do not.

In this framework, curves are not secondary. They are how the structure is tested. The time-separation function is defined through causal curves, and geodesics are understood as causal curves realizing time separation. A maximizing causal curve from \(x\) to \(y\) is a synthetic geodesic if its subsegments realize the appropriate time separations. The smooth equation \(\nabla_{\dot\gamma}\dot\gamma=0\) is replaced by a variational and order-theoretic property.

This replacement is not a weakening for its own sake. It is what allows one to talk about spacetime limits, causal sets, cone structures, and low-regularity metrics in a common language.

## 8. Curves as extremal causal traces

In smooth Lorentzian geometry, a curve has a velocity vector, and the metric classifies that vector pointwise. In synthetic Lorentzian geometry, one may not have tangent vectors. The curve must instead be characterized through the causal relation and the time-separation function.

A future-directed causal curve in a Lorentzian pre-length space is typically a locally Lipschitz or continuous map \(\gamma:I\to X\) that is monotone with respect to the causal preorder:

\[
s<t\quad\Rightarrow\quad \gamma(s)\le \gamma(t).
\]

Timelike behavior is encoded by the chronological relation \(\ll\) or by positivity of \(\tau\). The length of a causal curve can be defined by a partition formula analogous to metric length, but with \(\tau\):

\[
L_\tau(\gamma)=\inf \sum_i \tau(\gamma(t_i),\gamma(t_{i+1}))
\]

or by related formulations depending on the exact axioms and conventions. The point is that causal monotonicity and time separation replace the differential expression \(\sqrt{-g(\dot\gamma,\dot\gamma)}\).

The synthetic geodesic principle is then:

\[
\gamma \text{ is maximizing if } L_\tau(\gamma|_{[s,t]})=\tau(\gamma(s),\gamma(t))
\]

for relevant subintervals. This captures the Lorentzian content of geodesic motion without writing the geodesic equation.

Recent work has begun rebuilding more refined infinitesimal concepts in this setting. Tobias Beran and Clemens Sämann introduced hyperbolic angles between timelike curves, timelike tangent cones, and an exponential-map-like apparatus inside Lorentzian length spaces [@beranSamann2023]. This is important because angle comparison is one of the bridges from metric geometry to curvature. If one can define angles synthetically, one can formulate curvature bounds without smooth sectional curvature tensors.

This is a major research direction: reconstruct enough infinitesimal-looking geometry from order and time separation to recover comparison theorems, splitting theorems, and singularity mechanisms.

## 9. Time functions and the causal ladder

A time function on a spacetime is a function \(t:M\to\mathbb{R}\) that strictly increases along future-directed causal curves. A temporal function is a smoother and stronger object, often required to have timelike gradient. Time functions are crucial because they convert causal order into scalar monotonicity.

In a stably causal spacetime, time functions exist. In globally hyperbolic spacetimes, Cauchy time functions exist. Bernal and Sánchez proved powerful smoothability and splitting results for smooth spacetimes [@bernalSanchez2005]. The synthetic question is whether analogous results require a manifold.

Annegret Burtscher and Leonardo García-Heveling proved time-function existence theorems in Lorentzian pre-length spaces, including characterizations tied to \(K\)-causality, causal continuity, and global hyperbolicity [@burtscherGarciaHeveling2025]. This shows that parts of the causal ladder are not fundamentally smooth-manifold facts. They are consequences of causal order plus time-separation structure.

This matters for curves because a time function is a measuring device for causal monotonicity. It gives a scalar observable that must increase along every future causal curve. In the smooth case, such a function can be used to parametrize curves, construct null distances, and build global splittings. In the synthetic case, it may be one of the few available tools for turning order into analysis.

## 10. Null distance: making a metric from causal time

One of the difficulties in Lorentzian geometry is that there is no canonical positive-definite distance function on spacetime. Yet convergence theory, compactness arguments, and comparison with metric geometry often require a genuine metric. The null distance construction of Sormani and Vega addresses this by using a time function \(t\) to define the length of piecewise causal paths [@sormaniVega2016].

Given a generalized time function \(t\), the null length of a piecewise causal curve \(\beta\) with break points \(x_i\) is

\[
\widehat L_t(\beta)=\sum_i |t(x_i)-t(x_{i-1})|.
\]

The null distance is

\[
\widehat d_t(p,q)=\inf\{\widehat L_t(\beta):\beta\text{ piecewise causal from }p\text{ to }q\}.
\]

Under suitable anti-Lipschitz conditions, \(\widehat d_t\) becomes a genuine metric and encodes both topology and causality. Brian Allen and Annegret Burtscher developed properties of the null distance and its relation to spacetime convergence, including connections to integral current spaces [@allenBurtscher2022]. Kunzinger and Steinbauer extended null distance methods to Lorentzian length spaces and studied Gromov--Hausdorff convergence for warped product examples [@kunzingerSteinbauer2022].

The null distance is conceptually striking. It does not deny that spacetime is Lorentzian. Instead, it extracts from the Lorentzian causal structure a positive metric suitable for convergence questions. It is a bridge between causal geometry and metric geometry.

This bridge is delicate. The null distance depends on the time function. Different choices can yield different metric behavior. The frontier problem is to understand which choices are canonical enough, stable enough, or physically meaningful enough to support a robust theory of spacetime limits.

## 11. Lorentzian convergence and causal diamonds

Riemannian geometry has powerful compactness and convergence theories: Gromov--Hausdorff convergence, measured Gromov--Hausdorff convergence, intrinsic flat convergence, Ricci-limit spaces, and more. Lorentzian geometry cannot import these directly because the Lorentzian metric is not a positive distance.

Several strategies exist.

One strategy, beginning with Noldus, defines Lorentzian versions of Gromov--Hausdorff distance for causal spaces [@noldus2004]. Another strategy uses the null distance to convert suitable spacetimes into metric spaces [@sormaniVega2016; @allenBurtscher2022; @kunzingerSteinbauer2022]. Ettore Minguzzi has proposed an abstract approach to Lorentzian metric spaces and their Gromov--Hausdorff convergence, emphasizing constructions that avoid auxiliary positive-signature fields [@minguzzi2024]. Andrea Mondino's 2025 work develops Lorentzian Gromov--Hausdorff convergence using \(\epsilon\)-nets built from causal diamonds and relying only on the time-separation function [@mondino2025].

The causal-diamond approach is especially natural. In a globally hyperbolic spacetime, compact causal diamonds are the local-global units of causal geometry. They are Lorentzian analogues of metric balls, but they remember time orientation and causal accessibility. Reconstructing convergence from diamonds means respecting the native shape of Lorentzian geometry instead of forcing it into Riemannian clothing.

The long-range goal is a compactness theory for spacetime: conditions under which a sequence of Lorentzian spaces has a convergent subsequence, and conditions under which curvature bounds, causal regularity, singularity theorems, or Einstein-equation-like structures survive in the limit.

## 12. Curvature without tensors

In smooth Lorentzian geometry, curvature is encoded by the Riemann tensor, Ricci tensor, scalar curvature, and sectional curvatures of nondegenerate two-planes. But in low-regularity and synthetic settings, tensors may not exist pointwise. One must define curvature indirectly.

In metric geometry, Alexandrov curvature bounds are defined by triangle comparison: compare triangles in a space to triangles in a constant-curvature model space. Lorentzian length spaces adapt this idea using timelike triangles and model Lorentzian spaces. The comparison must respect the reverse triangle inequality and the causal nature of side lengths.

Kunzinger and Sämann's original Lorentzian length-space paper introduced synthetic timelike curvature bounds by triangle comparison [@kunzingerSamann2018]. Beran, Kunzinger, and Rott have studied multiple formulations of curvature bounds and proved equivalences under suitable assumptions [@beranKunzingerRott2023]. Beran, Harvey, Napper, and Rott proved a Toponogov globalization result for Lorentzian length spaces, including applications to Bonnet--Myers and splitting-type results [@beranHarveyNapperRott2025]. Beran, Ohanyan, Rott, and Solis proved a splitting theorem for globally hyperbolic Lorentzian length spaces with nonnegative timelike curvature containing a complete timelike line [@beranOhanyanRottSolis2023].

The smooth Lorentzian splitting theorem says, roughly, that a timelike geodesically complete globally hyperbolic spacetime satisfying an appropriate nonnegative Ricci curvature condition and containing a complete timelike line splits as a product. The synthetic version replaces smooth Ricci curvature with comparison curvature and smooth geodesics with maximizing causal curves. This is exactly the pattern of modern synthetic geometry: preserve the theorem by identifying the structural hypotheses it truly uses.

Curvature comparison is not merely technical. It is the way Lorentzian spaces become geometric even when they are not smooth. It tells us how causal triangles bend.

## 13. Optimal transport and timelike Ricci curvature

A second route to synthetic curvature comes from optimal transport. In Riemannian metric-measure geometry, lower Ricci curvature bounds can be characterized by convexity of entropy along Wasserstein geodesics, leading to the Lott--Sturm--Villani and Ambrosio--Gigli--Savaré theories of \(CD(K,N)\) and \(RCD(K,N)\) spaces.

The Lorentzian analogue is much less straightforward because transport must respect causality, and the cost is built from time separation rather than positive distance. Fabio Cavalletti and Andrea Mondino developed optimal transport in Lorentzian synthetic spaces and formulated synthetic timelike Ricci curvature lower bounds with dimension upper bounds through entropy behavior along future-directed timelike geodesics of probability measures [@cavallettiMondino2024]. Their framework yields stability results and applications including volume comparison and synthetic Hawking-type singularity theorems.

This is one of the deepest current frontiers. It suggests that energy conditions in general relativity, which are usually expressed as pointwise tensor inequalities such as timelike Ricci lower bounds, may have synthetic metric-measure formulations. In a smooth spacetime, timelike Ricci curvature is related through Einstein's equations to matter-energy conditions. In a synthetic spacetime, one seeks an inequality expressed through transport, entropy, and causal separation.

The slogan is not that matter becomes probability. Rather, the large-scale convexity behavior of measures can encode curvature constraints that survive nonsmooth limits. This is exactly the sort of structure needed if one wants Lorentzian geometry to interact with weak solutions, quantum gravity heuristics, or spacetime limits.

Robert McCann and Clemens Sämann's Lorentzian analogue of Hausdorff dimension and measure also belongs to this metric-measure frontier. They define canonical volume measures on Lorentzian pre-length spaces and a geometric dimension sensitive to spacelike and null substructures [@mccannSamann2023]. This matters because a synthetic spacetime needs not only causal order and time separation, but also a reference measure if one wants analysis, curvature-dimension inequalities, or field equations.

## 14. Boundaries, incompleteness, and c-completion

Lorentzian geometry has a complicated relationship to boundary. In Riemannian geometry, metric completion often supplies missing limit points. In Lorentzian geometry, a boundary should remember causal approach: how curves can end, which pasts and futures they determine, and whether missing endpoints are spacelike, timelike, null, singular, or conformal.

The c-boundary and c-completion program encodes ideal boundary points using indecomposable past and future sets. In modern work, Saúl Burgos, José Luis Flores, and Jónatan Herrera have extended c-completion ideas to Lorentzian metric spaces, showing that the construction can be carried out in broad generality, including low-regularity settings [@burgosFloresHerrera2023].

This is again a curve-centered issue. Boundaries are detected by inextendible causal curves. A black hole event horizon, for example, is not a material surface in spacetime. It is a causal boundary: the boundary of the past of future null infinity in an asymptotically predictable spacetime. Singularities in the theorems are detected by incomplete causal geodesics. The entire boundary theory is therefore about what happens to causal curves when the ambient Lorentzian space fails to contain their natural endpoints.

Synthetic boundary theory remains an potential area because different completions preserve different data. A conformal boundary emphasizes null infinity and asymptotic causal structure. A c-boundary emphasizes chronological pasts and futures. A metric completion of a null distance emphasizes topological and metric convergence. A full Lorentzian theory of boundaries may need to coordinate several such completions.

## 15. The anatomy of a Lorentzian curve

It is useful to summarize what a Lorentzian curve carries, depending on the level of structure available.

In a smooth Lorentzian manifold, a sufficiently regular curve carries:

- a tangent vector \(\dot\gamma\);
- a causal type determined by \(g(\dot\gamma,\dot\gamma)\);
- an orientation relative to the time cone;
- a proper-time or null-length behavior;
- acceleration \(\nabla_{\dot\gamma}\dot\gamma\);
- geodesic status when that acceleration vanishes;
- conjugate-point and focal behavior governed by curvature.

In a low-regularity spacetime, some of this survives and some of it must be weakened. If the metric is continuous, causal cones are continuous but geodesic equations may be ill-behaved. If the metric is Lipschitz, geodesics can exist with better regularity, but curvature may be distributional or only weakly defined. If the metric is \(C^1\), Christoffel symbols are continuous but geodesic uniqueness can fail. Each regularity threshold changes what a curve can be asked to do.

In a Lorentzian length space, a curve carries:

- monotonicity with respect to \(\le\);
- chronological positivity with respect to \(\ll\) and \(\tau\);
- synthetic length computed from time separation;
- maximizing status relative to \(\tau\);
- possible angle/tangent-cone data if additional synthetic structure is available;
- behavior under causal diamonds, time functions, and convergence.

The unifying idea is this: a Lorentzian curve is an admissible trace through a causal-time structure. In smooth geometry, admissibility is checked by tangent cones. In synthetic geometry, admissibility is checked by order and time separation. The curve is where the local cone and the global order meet.

## 16. Lorentzian space as an ordered energetic geometry

The word "space" can mislead. In ordinary language, space is where things are located. In Lorentzian geometry, spacetime is not merely a container of locations; it is a regime of possible influence. The metric does not simply say how far apart events are. It says which event can precede which, what kind of curve can connect them, and how much proper time can be accumulated by such a connection.

A Lorentzian space therefore has three intertwined layers.

First, it has a topological layer: events can be close, curves can converge, and local neighborhoods make sense.

Second, it has a causal-order layer: some events can influence others, some cannot, and the relation is directed.

Third, it has a temporal-measure layer: when events are causally related, there may be a supremal proper time between them.

In smooth spacetime, these layers are generated by the metric tensor. In synthetic spacetime, they may be given directly. This is the deep reason Lorentzian length spaces are not merely generalized manifolds. They expose the hidden decomposition of the smooth metric into topology, causality, and time separation.

For a relational or information-theoretic reading, this is especially suggestive. A Riemannian metric says, in effect, how costly it is to move between nearby states. A Lorentzian structure says which transitions are admissible, which are boundary transitions, which are forbidden as causal histories, and how much internal time is accumulated by admissible traces. A curve is then not just a parametrized set of points. It is a history whose legitimacy is constrained by a cone order.

This viewpoint also clarifies why Lorentzian geometry interacts so naturally with computation, signal propagation, and partial orders. The causal structure of a globally hyperbolic spacetime is close in spirit to a domain of dependence relation. Data on a Cauchy hypersurface determines events in its domain. Signals propagate inside cones. Boundaries are determined by inextendible causal traces. The geometry is already a theory of constrained information flow.

## 17. Current frontiers

The current frontier of Lorentzian curves and Lorentzian space can be organized around several live problems.

### 17.1 A mature synthetic category of spacetimes

Lorentzian length spaces are now a powerful framework, but the category is still young compared with Riemannian length spaces. Researchers are still clarifying which axioms are minimal, which are technically convenient, which examples should be included, and how different proposals relate: Lorentzian pre-length spaces, Lorentzian metric spaces, closed cone structures, causal sets, null-distance metricizations, and low-regularity manifolds [@kunzingerSamann2018; @minguzzi2024].

The hard problem is to define a category broad enough to contain physically relevant limits, but rigid enough to prove theorems.

### 17.2 Stable convergence of causal geometry

A robust Lorentzian convergence theory should preserve causal relations, time separation, global hyperbolicity, curvature bounds, and perhaps field-equation-like constraints. Existing approaches use null distance, causal diamonds, Lorentzian Gromov--Hausdorff notions, and metric-measure convergence [@allenBurtscher2022; @kunzingerSteinbauer2022; @minguzzi2024; @mondino2025].

The deep issue is that ordinary Gromov--Hausdorff convergence forgets time orientation unless it is modified. A Lorentzian convergence theory must preserve directed causal structure, not merely topological nearness.

### 17.3 Low-regularity singularity theorems

Classical singularity theorems are curve-incompleteness theorems under energy, causality, and trapped-surface hypotheses. Modern low-regularity versions ask how little differentiability is needed for those conclusions. Work down to \(C^1\), Lipschitz, and Hölder/Sobolev regimes suggests that much of singularity theory is not essentially smooth [@kunzingerOhanyanSchinnerlSteinbauer2022; @calistiGrafHafemannKunzingerSteinbauer2025; @kunzingerReintjesSteinbauerVegaGonzalez2026].

The frontier problem is to coordinate weak curvature, weak geodesic behavior, causal maximizers, and distributional energy conditions in a single stable theory.

### 17.4 Synthetic curvature and comparison geometry

Triangle comparison, hyperbolic angles, Toponogov globalization, Bonnet--Myers phenomena, and splitting theorems are being rebuilt in Lorentzian length spaces [@beranSamann2023; @beranKunzingerRott2023; @beranHarveyNapperRott2025; @beranOhanyanRottSolis2023].

The frontier problem is to determine how far the classical toolbox of comparison geometry can be translated into the causal-time setting. The answer is not automatic because Lorentzian triangles, null sides, and reverse inequalities behave differently from Riemannian ones.

### 17.5 Optimal transport and energy conditions

The Cavalletti--Mondino program uses optimal transport to define synthetic timelike Ricci curvature bounds and dimension constraints [@cavallettiMondino2024]. This is potentially a route to nonsmooth energy conditions. If successful, it could connect general relativity, metric-measure geometry, entropy, and synthetic spacetime in a common language.

The frontier questions include stability, rigidity, relation to Einstein equations, relation to quantum energy inequalities, and compatibility with singularity theorems.

### 17.6 Boundaries and horizons

Causal boundaries, conformal boundaries, metric completions, and null-distance completions all capture different aspects of how curves fail to extend. Modern work on c-completion for Lorentzian metric spaces suggests that boundary theory can be generalized beyond smooth manifolds [@burgosFloresHerrera2023].

The frontier is to understand which completion is appropriate for which problem: black hole horizons, cosmological boundaries, singularity formation, causal set approximations, or convergence limits.

### 17.7 Lorentzian geometry beyond quadratic metrics

Classical Lorentzian manifolds use quadratic forms. But Finsler spacetimes, cone structures, sub-Lorentzian geometries, and control-theoretic causal systems suggest broader notions of causal admissibility. In these settings, curves may be constrained by cones not arising from a quadratic metric. The relevant geometry becomes one of ordered paths, reachability, and time cost.

This direction is mathematically natural because Lorentzian length spaces already separate causal order from smooth quadratic tensors. Once one does that, the door opens to causal geometries whose infinitesimal structure is not Riemannian or semi-Riemannian in the classical sense.

## 18. What an undergraduate should retain

For a reader with undergraduate mathematics, the main conceptual moves are these.

First, a Lorentzian inner product is an indefinite inner product with one time direction and several space directions. Because \(g(v,v)\) can be negative, zero, or positive, vectors have causal type.

Second, the null cone is the local causal boundary. Timelike vectors lie inside it, null vectors on it, spacelike vectors outside it.

Third, Lorentzian curves inherit their causal type from their tangent vectors. Future-directed causal curves are possible histories of influence. Timelike curves accumulate proper time. Null curves carry zero proper time but define causal boundaries.

Fourth, timelike geodesics locally maximize proper time. This is the opposite of the Riemannian habit that geodesics minimize distance.

Fifth, the Lorentzian time-separation function is not a metric. It is asymmetric, causal, and governed by a reverse triangle inequality.

Sixth, global Lorentzian geometry is organized by causal relations, causal diamonds, time functions, Cauchy hypersurfaces, and global hyperbolicity.

Seventh, the modern research frontier reconstructs these ideas without assuming smooth manifolds, using Lorentzian length spaces, null distance, synthetic curvature bounds, and optimal transport.

## 19. Conclusion: curves are the test objects of spacetime

A Lorentzian space is a geometry of admissible histories. Its most important structure is not a positive distance between all points, but a cone field or causal order distinguishing possible futures from impossible ones. Its curves are not arbitrary paths laid over a passive background. They are probes of the causal structure itself.

In smooth Lorentzian manifolds, the metric tensor produces tangent cones, proper time, geodesics, and curvature. In global Lorentzian geometry, causal curves define chronological and causal futures, time separation, causal diamonds, and global hyperbolicity. In singularity theory, incomplete causal geodesics diagnose spacetime breakdown. In synthetic Lorentzian geometry, causal curves and time separation become primitive enough to survive without smooth tangent spaces.

The frontier is therefore not a departure from the classical theory. It is a distillation of it. Modern Lorentzian geometry asks: how much spacetime remains when the differentiable metric is removed? The emerging answer is that a great deal remains if one preserves causal order, time separation, and the curve structures that bind them.

Lorentzian curves are where the algebraic sign change becomes lived geometry. Lorentzian space is the global regime in which those curves compose, maximize, fail, converge, and determine what can influence what.
