---
title: "Two Angular Selection Mechanisms in a Siloxane–Zeolite Composite: Bragg Multiplexing, Quadrupolar Photoselection, and the Eigenvalue Stratification of the Four-Valued Charge"
date: 2026-07-25
kind: design-note
---


## Abstract

Angle-addressed state in this substrate is not lenticular optics, and the correction is
physical rather than terminological. Lenticular imaging is geometric-optics ray shadowing
through a macroscopic lens array, requiring features large compared to the wavelength; the
structures in question are sub-nanometre, three orders below the ultraviolet. The correct
family is angle-multiplexed volume holography, where selectivity is diffractive and
intrinsic to the medium's own periodicity.

That correction propagates further than the analogy. An Ewald-sphere estimate shows the
$J_{26}$ lattice cannot Bragg-diffract ultraviolet light either: its reciprocal lattice
vectors exceed $2|\mathbf{k}|$ by roughly two orders of magnitude. The lattice diffracts
X-rays and is optically sub-wavelength. What it contributes optically is not diffraction but
**point symmetry** — $D_{2d}$, non-cubic, hence a nonvanishing rank-2 dielectric anisotropy.

So the medium carries two independent angular mechanisms at two separated length scales.
**Bragg multiplexing** lives on a mesoscale domain periodicity $\Lambda \sim \lambda/2n
\approx 120\,\text{nm}$ and yields $M \sim L\theta_{\text{range}}/\Lambda$ near-independent
pages. **Quadrupolar photoselection** lives at the bond, writes only the $\ell = 2$ sector,
and yields six real dimensions per voxel regardless of how many angles are used.

The second mechanism carries the four-valued charge, and the correspondence is exact rather
than illustrative. Quotienting the $\ell=2$ sector by rotation gives the ordered-spectrum
cone, which is the closed positive Weyl chamber of $A_2$. Its four faces are the four
corners; the evidence bits $\langle \text{pos}, \text{neg}\rangle$ are the strict
inequalities of the two simple roots; $\mathrm{kHeight}$ is the dimension of the occupied
face; and the knowledge order $\le_k$ is the face poset. Since the face lattice of a
$d$-dimensional simplicial cone is $2^d$, and the $A_{n-1}$ chamber has dimension $n-1$, this
suggests the charge is four-valued **because space is three-dimensional** — stated below as a
conjecture, with the algebraic half verified and the physical half not.

Under this identification $\top$ is the chamber *interior*, hence generic, and consistency is
a measure-zero degeneracy maintained by work. The medium also carries two continuous
coordinates on the chamber — a magnitude and a Lode angle — that the four-valued charge
discards.

We then separate two claims that have been travelling together and are not the same. The
readouts of both mechanisms are classically compatible, so **the KCBS value $\sqrt5$ is not
available from this substrate**: a classical orientational distribution achieves the
independence bound $\alpha(C_5) = 2$, and the contextual excess $\sqrt5 - 2$ requires
coherence the medium does not offer. What *is* available is sheaf-theoretic contextuality —
the failure of a global section — supplied classically by disclination holonomy. These are
different notions of contextuality and only one of them is instantiated here.

---

## 1. Why lenticular optics is the wrong family

A lenticular print works by refraction through an array of cylindrical lenses of pitch
$\sim 10^2\,\mu\text{m}$ sitting above an interlaced image. The mechanism is geometric: rays
from different directions strike different sub-image strips, and the lens array is a
*separate physical layer* from the data. Geometric optics requires feature size
$a \gg \lambda$, since the ray picture is the $\lambda/a \to 0$ limit.

The structures proposed as the angular gate — silica tetrahedra with $109.47°$ O–Si–O
angles, $J_{26}$ cells built from them, Si–O–Si hinges — have $a \sim 0.5$–$1\,\text{nm}$.
At $\lambda = 355\,\text{nm}$ this is $\lambda/a \sim 400$. There is no ray picture at that
ratio and no facet shadowing: the field does not resolve individual facets, it sees an
effective medium. Any argument of the form "the beam strikes this facet and not that one"
fails by three orders of magnitude.

The mechanism that *does* operate at $a \ll \lambda$ with genuine angular selectivity is
diffraction from a periodic index modulation — volume holography, with Kogelnik coupled-wave
selectivity. This is the correct family, and it is well instrumented.

## 2. The $J_{26}$ lattice cannot Bragg-diffract ultraviolet either

Bragg diffraction requires a reciprocal lattice vector $\mathbf{G}$ reachable on the Ewald
sphere:

$$|\mathbf{G}| \le 2|\mathbf{k}|, \qquad |\mathbf{k}| = \frac{2\pi n}{\lambda}.$$

At $\lambda = 355\,\text{nm}$ with $n \approx 1.45$:

$$|\mathbf{k}| \approx 0.026\,\text{nm}^{-1}, \qquad 2|\mathbf{k}| \approx 0.051\,\text{nm}^{-1}.$$

For a lattice of period $a \approx 0.75\,\text{nm}$ the smallest reciprocal vector is

$$|\mathbf{G}| = \frac{2\pi}{a} \approx 8.4\,\text{nm}^{-1},$$

exceeding $2|\mathbf{k}|$ by a factor of about $165$. No optical diffraction order exists.
The same lattice satisfies the condition comfortably for Cu K$\alpha$ ($|\mathbf{k}| \approx
41\,\text{nm}^{-1}$, $2|\mathbf{k}| \approx 82\,\text{nm}^{-1} > 8.4$), which is why zeolite
frameworks are characterized by X-ray diffraction and not by visible or UV scattering.

**So the $J_{26}$ geometry is optically invisible as a diffracting structure.** It is
sub-wavelength in the strict sense: the light sees a homogenized effective medium.

### 2.1 What the lattice does contribute

Homogenization does not erase symmetry. The effective dielectric tensor of a sub-wavelength
periodic medium inherits the point group of the lattice, and the point group determines
which rank-2 tensors are allowed.

This is where the tetrahedra drop out and the gyrobifastigium enters. An ideal silica
tetrahedron has point group $T_d$, which is cubic; every rank-2 tensor invariant under a
cubic group is proportional to $\delta_{ij}$. **A tetrahedral unit has identically zero
linear dichroism and zero birefringence.** The $109.47°$ angles contribute nothing at rank 2
— which is the same reason cubic crystals are elastically anisotropic (rank 4) but optically
isotropic (rank 2).

$J_{26}$ has point group $D_{2d}$, order 8, non-cubic and uniaxial. Its permitted dielectric
tensor is

$$\varepsilon = \operatorname{diag}(\varepsilon_\perp, \varepsilon_\perp, \varepsilon_\parallel)$$

along the $S_4$ axis. That axis exists precisely because the two triangular prisms are joined
at a relative quarter-turn: the twist that makes the solid space-filling is the same twist
that reduces the symmetry from cubic and permits birefringence. The optical anisotropy and
the space-filling property have a common cause.

## 3. The two mechanisms, separated

| | Bragg multiplexing | quadrupolar photoselection |
|---|---|---|
| length scale | $\Lambda \sim \lambda/2n \approx 120\,\text{nm}$ | the bond, $\sim 0.2\,\text{nm}$ |
| physical origin | mesoscale domain periodicity | transition-dipole orientation |
| selectivity law | $\Delta\theta \sim \Lambda/L$ (Kogelnik) | $\cos^2\alpha$ |
| angular sharpness | narrow, near-orthogonal channels | broad, two harmonics only |
| capacity | $M \sim L\theta_{\text{range}}/\Lambda$ | $\dim = 6$ per voxel |
| numeric estimate | $L = 100\,\mu\text{m} \Rightarrow M \sim 10^2$–$10^3$ | $6$ (one-photon), $15$ (two-photon) |

The two are independent because they occupy separated bands in spatial frequency: one
requires a modulation at $|\mathbf{G}| \approx 2|\mathbf{k}|$, the other requires no
periodicity at all.

**The capacity limits have different characters, and this is the more interesting
difference.** Bragg capacity is sample-limited: more thickness, more pages. Quadrupolar
capacity is *rank*-limited. One-photon absorption goes as $|\hat\mu\cdot\hat E|^2 =
\cos^2\alpha$, whose expansion on the orientation sphere contains only $\ell = 0$ and
$\ell = 2$. A single write pulse can therefore imprint only the monopole and quadrupole
moments — $1 + 5 = 6$ real dimensions — *no matter how many directions are used*. Writing
from a thousand angles does not exceed six. Two-photon absorption goes as $\cos^4$, reaching
$\ell \le 4$, for $1 + 5 + 9 = 15$.

**Caveat on composition.** The rank limit applies to a single pulse. In the depletion regime
successive pulses act multiplicatively on the orientational distribution, and products of
$\ell \le 2$ functions contain higher harmonics, so a long write sequence can populate
$\ell > 2$. The bound above is on the *instantaneous* write operator, not on the reachable
set under arbitrarily many pulses. How fast higher harmonics accumulate under realistic
depletion is not estimated here.

## 4. The $\ell = 2$ sector carries the four-valued charge

The $\ell = 2$ sector is the space of traceless symmetric $3\times3$ real tensors,
$\dim = 5$. Write $Q$ for an element.

### 4.1 The quotient by rotation is a Weyl chamber

Take the quotient by the rotation group, since the invariant content of $Q$ is its spectrum.
A traceless symmetric real $3\times3$ tensor is diagonalized by $SO(3)$, so

$$\{\text{traceless symmetric } 3\times3\} \big/ SO(3) \;\cong\;
\{(\lambda_1, \lambda_2, \lambda_3) \in \mathbb{R}^3 : \textstyle\sum_i \lambda_i = 0,\;
\lambda_1 \ge \lambda_2 \ge \lambda_3\}.$$

The unordered version of that set — the plane $\sum \lambda_i = 0$ carrying the $S_3$ action
by permutation of coordinates — is the Cartan subalgebra $\mathfrak{h}$ of
$\mathfrak{sl}(3)$ with its Weyl group. Imposing the ordering picks out one fundamental
domain. So:

> **The space of $\ell=2$ states modulo rotation is the closed positive Weyl chamber of the
> root system $A_2$.**

This is a two-dimensional simplicial cone bounded by two walls, the vanishing loci of the two
simple roots:

$$W_1 = \{\lambda_1 = \lambda_2\}, \qquad W_2 = \{\lambda_2 = \lambda_3\}.$$

### 4.2 The two evidence bits are the two simple-root inequalities

A point of the chamber lies in a unique open face, determined by which of the two defining
inequalities are strict. Define

$$p = [\lambda_1 > \lambda_2], \qquad n = [\lambda_2 > \lambda_3].$$

Evaluating the four cases:

| face | eigenvalues | $(p,n)$ | corner | $\dim$ |
|---|---|---|---|---|
| apex | $\lambda_1 = \lambda_2 = \lambda_3 = 0$ | $\langle 0,0\rangle$ | $\bot$ | $0$ |
| wall $W_2$ | $\lambda_1 > \lambda_2 = \lambda_3$ (prolate) | $\langle 1,0\rangle$ | $t$ | $1$ |
| wall $W_1$ | $\lambda_1 = \lambda_2 > \lambda_3$ (oblate) | $\langle 0,1\rangle$ | $f$ | $1$ |
| interior | all distinct (biaxial) | $\langle 1,1\rangle$ | $\top$ | $2$ |

The bit pair $\langle \text{pos}, \text{neg}\rangle$ of the four-valued charge is therefore
not an encoding chosen for the tensor — it is the pair of strict inequalities that says which
face of the chamber the state occupies. Positive evidence is a strictly dominant eigenvalue;
negative evidence is a strictly subordinate one.

Two immediate consequences:

**$\mathrm{kHeight}$ is the dimension of the face.** Reading the last column against the
$(p,n)$ column, $\mathrm{kHeight} = p + n = \dim(\text{face})$, giving $\bot \mapsto 0$,
$\{t,f\} \mapsto 1$, $\top \mapsto 2$. It counts strict inequalities, equivalently walls the
state is *off*.

**$\le_k$ is the face poset.** The closure order on faces of a cone — apex in the closure of
each wall, each wall in the closure of the interior, the two walls incomparable — is exactly
the Hasse diagram of the knowledge order. The knowledge order is not modelled by the
stratification; it *is* the face lattice.

### 4.3 Why the logic is four-valued

The face lattice of a $d$-dimensional simplicial cone with $d$ walls is the Boolean lattice
$2^d$. For $A_{n-1}$ the chamber has dimension $n-1$, so the face lattice is $2^{n-1}$, graded
by dimension with face counts $\binom{n-1}{j}$.

For $n = 3$: four faces, counts $1, 2, 1$ — one $\bot$, two incomparable middles, one $\top$.
That is $\mathbf{FOUR} = 2 \times 2$, including the multiplicity of the height-1 layer, which
is why there are exactly two intermediate truth values rather than one or three.

> **Conjecture.** The four-valued charge is four-valued because space is three-dimensional.
> A quadrupolar order parameter in $\mathbb{R}^n$ carries a $2^{n-1}$-valued charge, with
> $n-1$ independent evidence bits given by the strict simple-root inequalities.

I state this as a conjecture rather than a theorem because I have verified the face-lattice
count and the $n=3$ case explicitly and have not checked that the physical realization
(photoselection writing into $\ell=2$) survives in other dimensions, where the relation
between the second spherical-harmonic sector and the traceless symmetric tensors differs. The
purely algebraic half — that the ordered-spectrum cone for traceless symmetric $n \times n$
has face lattice $2^{n-1}$ — follows from the chamber being simplicial with $n-1$ walls.

### 4.4 $\top$ is the chamber interior, hence generic

The interior is open and dense in the chamber; the walls have codimension 1 in it and the apex
codimension 2. Pulling back to the tensor space, the biaxial set is open and dense, uniaxial
has codimension 2, and the isotropic point codimension 5. A tensor drawn from any absolutely
continuous distribution is biaxial with probability 1.

**Contradiction is the generic condition of the medium; consistency is a degeneracy.**
Holding a voxel at $t$ or $f$ means pinning it to a wall — a measure-zero locus requiring
continuous work against perturbation — while relaxation drives it into the interior. This
inverts the reading in which $\top$ is a fault to be cleared: clearing $\top$ means moving the
state onto a wall and holding it there.

### 4.5 What the tensor carries that the four-valued charge does not

Within the chamber the state has two continuous coordinates, and only their *face* is visible
to the four-valued charge. In the standard invariants of a deviatoric tensor these are the
radial and angular coordinates on the chamber:

$$\rho = \sqrt{\operatorname{tr} Q^2}, \qquad
\mu = \frac{3\lambda_2}{\lambda_1 - \lambda_3} \in [-1, 1],$$

where $\mu$ is the Lode parameter of continuum mechanics ($\mu = -1$ prolate, $+1$ oblate,
$0$ maximally biaxial), and the pair $(\rho, \mu)$ are Haigh–Westergaard coordinates on the
deviatoric plane restricted to the fundamental $60°$ wedge.

So the medium implements a **graded** four-valued charge. The grading $\rho$ is a magnitude of
evidence that $\mathbf{FOUR}$ does not carry: two states can both be $\top$ and differ by
orders of magnitude in how strongly they are $\top$. The angular coordinate $\mu$ interpolates
continuously between the two walls, so a state can be *nearly* $t$ without being $t$ — it sits
in the interior, so its charge is $\top$, while its Lode angle is close to the $t$ wall.

This is a genuine mismatch and worth stating as one. A discrete four-valued readout of this
medium discards $\rho$ entirely and reports $\top$ for the whole interior, collapsing a
two-parameter family to one symbol. Any claim that the substrate *implements* the four-valued
charge is a claim about the face lattice only, and is silent about the two coordinates that
actually vary.

### 4.6 One pulse moves the state off exactly one wall

A single linearly polarized pulse along $\hat E$ imprints

$$\Delta Q \;\propto\; \hat E \hat E^{\mathsf T} - \tfrac13 I,$$

which is uniaxial: it lands on a wall, height 1. Depletion at $\hat E$ gives the same tensor
with opposite sign — the other wall.

A sum of two uniaxial tensors with non-parallel axes is generically biaxial, and no single
uniaxial tensor is biaxial. So $\bot \to \top$ requires **two** pulses at non-collinear
polarizations and is unreachable in one. In chamber terms: one pulse can make one simple-root
inequality strict, and moving into the interior requires making both strict. The rule that a
single witnessed transition flips exactly one bit is a consequence of the tensor algebra
rather than a stipulation.

### 4.7 Tomographic completeness

A readout along $\hat n$ returns the scalar $\hat n^{\mathsf T} Q \hat n$. Since $\dim Q = 5$,
five directions in general position determine $Q$ completely, and fewer never do. So five
angular probes are necessary and sufficient to read a voxel.

## 5. What kind of contextuality is actually available

Two distinct claims have been travelling together in this corpus under one word, and they
must be separated.

### 5.1 The KCBS value is not available

The KCBS scenario places five rank-1 projectors on $\mathbb{C}^3$ in a 5-cycle of
orthogonality. The classical independence bound is $\alpha(C_5) = 2$; the quantum value is
$\sqrt5$; the excess $\sqrt5 - 2$ lies in $\mathbb{Q}(\sqrt5)$.

The excess requires the state to be a *coherent* qutrit state, not a probability
distribution. The voxel state described here is a classical orientational distribution
$f(\Omega)$ with quadrupole moment $Q$. Every readout $\hat n^{\mathsf T} Q \hat n$ is a
moment of that single distribution, so all readouts admit a joint distribution by
construction, and the sum over any exclusivity graph obeys the classical bound.

**This substrate as specified achieves $\alpha(C_5) = 2$ and cannot achieve $\sqrt5$.** The
measurement *geometry* of KCBS is instantiated — five directions, quadratic forms, the right
observable sector — and the *value* is not.

The formalization already draws this line and should be credited with it.
`QuantumContextuality/KCBS.lean` states in its own header that it builds "the
**possibilistic** layer" only — the five contexts, the exclusivity support, and
$\alpha(C_5) = 2$ as a finite decidable fact — and that "the *value* half (the quantum bound
$\sqrt5$, the contextual fraction) is real-valued and left for a sibling module,
`QuantumContextuality.KCBSValue`," which is not built. So the Lean library asserts exactly
the classical bound and no more. The overclaim is confined to prose notes that attribute the
excess $\sqrt5 - 2$ to the substrate; those should be read as claims about the measurement
geometry, and the arithmetic does not transfer.

What would be required: coherence in the $\ell = 2$ sector, i.e. a quantum superposition of
orientational states surviving at operating temperature. Nothing in the proposed chemistry
supplies that, and room-temperature orientational coherence in a polymer network is not
plausible on any timescale relevant here.

### 5.2 Sheaf-theoretic contextuality is available, classically

The Abramsky–Brandenburger formulation defines contextuality as the failure of a presheaf of
local sections over a cover of measurement contexts to admit a global section. This admits
purely classical instances — including possibilistic and logical ones — and does not require
coherence.

A disclination supplies exactly this. Around a defect line, the local orientational field is
well defined on every simply connected patch, but the holonomy of transport around the loop
is a nontrivial element of the order-parameter space's fundamental group, so no single-valued
global lift exists. That is a genuine failure of a global section, it is classical, and it is
topological.

For a uniaxial nematic the order-parameter space is $\mathbb{RP}^2$ with
$\pi_1 = \mathbb{Z}/2$, which supports the half-integer disclinations that have no analogue
in a vector field. Whether the fivefold defect of interest in this corpus is realizable in
that classification, and what its holonomy group actually is, I have not worked out — the
$\mathbb{Z}/2$ statement is standard nematic theory and the fivefold claim is not derived
from it.

**So: no global section, yes. Quantum contextual excess, no.** Both have been called
contextuality; only the first is on offer, and the distinction determines whether the
`KCBSValue` frontier is closable by this substrate at all. On the reading here it is not.

## 6. The fiber, against what the formalization actually carries

§4.5 left a mismatch: the chamber carries $(\rho, \mu)$ continuously while the charge sees
only the face. The formalization's fiber structure resolves half of it and locates the other
half precisely.

### 6.1 What the settling sheaf's fiber is

`Site/Sheaf.lean` defines `Sheaf` with a single field `section_ : Valuation`, and a
`Valuation` is `PredicationCell → Charge`. So the fiber of the settling sheaf over a cell is
$\mathbf{FOUR}$ — four elements, no grading.

`Cohomology/InconsistencySheaf.lean` adds one. Its sections are cochains
`PredicationCell → Int` **vanishing off the `dTop` mask**, so over a $\top$-cell the fiber is
$\mathbb{Z}$, and the short exact sequence

$$0 \to \mathcal{F}_U \to \mathcal{F}_U^{(k)} \to \mathcal{F}_U^{(\top)} \to 0$$

exhibits it as the cokernel, split as
$\mathcal{F}_U^{(k)} \cong \mathcal{F}_U^{(t)} \oplus \mathcal{F}_U^{(\top)}$ because the
masks are disjoint.

Matching against the chamber:

| chamber datum | formalization | status |
|---|---|---|
| which face | `Charge` | present, and by §4.2 this is the face poset |
| radial $\rho = \sqrt{\operatorname{tr}Q^2}$ | $\mathbb{Z}$-multiplicity of $\mathcal{F}^{(\top)}$ | present over $\top$ only, and integral rather than real |
| angular $\mu$ (Lode) | — | **absent** |

So the "extra structure" of §4.5 is not wholly missing: the inconsistency sheaf is the
magnitude coordinate, restricted to the top face and valued in $\mathbb{Z}$. What has no
counterpart is the angular coordinate — *which way a contradiction leans*. A $\top$-cell whose
Lode angle sits near the $t$ wall is contradictory-but-leaning-positive, and
$\mathcal{F}^{(\top)}$, being $\mathbb{Z}$-valued, counts it with multiplicity and records no
lean.

The natural completion is therefore a sheaf valued in the closed chamber itself, whose
face-map recovers `Charge` and whose radial coordinate recovers the inconsistency
multiplicity. That is one real-valued function of adding, not a redesign.

### 6.2 The splitting is pointwise, not in families

The direct-sum decomposition holds because `dT ∩ dTop = ∅` — the masks partition cells by
charge value. That is unimpeachable at a fixed valuation.

It does not survive deformation. In the chamber, the walls lie in the closure of the
interior, so a state can degenerate from interior to wall *continuously* as $\mu \to \pm1$.
Under the mask decomposition the same event is a discontinuous jump of a cell from the
`dTop` summand to the `dT` summand. So the splitting is not natural in a family: a
one-parameter family of valuations crossing a wall has no continuous lift to the direct sum.
Whether that matters depends on whether the corpus ever needs families of valuations rather
than one at a time, which I have not checked.

### 6.3 A third $H^1$, nonabelian

Two $H^1$'s are already in play and have been confused before: the cycle rank of the cover
nerve (`CoordinationCohomology.H1rank = (cells + components) − entities`, graphic-matroid
nullity, $\mathbb{Z}$-valued) and the gluing obstruction for `Charge`-valued cochains
(`SettlingCohomologyH1`).

A chamber-valued sheaf carries a third, and it is not of either kind. The chamber's symmetry
group is the Weyl group $W = S_3$, acting by permuting eigenvalues. Transition functions on a
cover can therefore act by $W$, and the classification of such chamber-torsors is the
**nonabelian** Čech cohomology $H^1(\mathcal{U}; \underline{S_3})$ — a pointed set, not a
group, and not a rank.

Its useful shadow is abelian. Composing with the sign homomorphism $\mathrm{sgn} : S_3 \to
\mathbb{Z}/2$ gives a class in $H^1(\mathcal{U}; \mathbb{Z}/2)$ whose nonvanishing is exactly
the obstruction to choosing, globally and consistently, *which wall is $t$ and which is $f$*.
The transposition $\lambda_1 \leftrightarrow \lambda_3$ exchanges prolate with oblate, so a
loop with that monodromy returns positive evidence as negative.

This is the $\mathbb{Z}/2$ nematic disclination in its usual guise —
$\pi_1(\mathbb{RP}^2) = \mathbb{Z}/2$ for the uniaxial order-parameter space — and it is a
genuine failure of a global section in the sense of §5.2, obtained classically. It is not
measured by any cycle rank, and an instrument computing `H1rank` will report nothing about
it.

### 6.4 The write head cannot address the dervish

`QuantumContextuality/DisclinationLink.lean` builds the fivefold disclination as a
combinatorial object: a five-step cone loop closing at the sixth traversal, thirty steps, with
link coordinate $i \bmod 5$ and frame coordinate $i \bmod 6$ jointly determining the step by
coprimality, and consecutive-step adjacency descending onto the pentagon. That defect lives in
the *lattice* — it is a rotational defect of the tiling.

The $Q$-tensor defect classification is a different space with a different fundamental group.
For a biaxial state the order-parameter manifold is $SO(3)/D_2$, and since $SO(3)/D_2 =
SU(2)/Q_8$ with $SU(2)$ simply connected,

$$\pi_1(SO(3)/D_2) = Q_8,$$

the quaternion group of order 8 — standard biaxial-nematic defect theory. On the walls the
state is uniaxial and the group drops to $\pi_1(\mathbb{RP}^2) = \mathbb{Z}/2$.

$Q_8 = \{\pm1, \pm i, \pm j, \pm k\}$ has element orders $1, 2, 4$ only. **There is no element
of order 5**, so a fivefold disclination cannot be realized as a defect of the orientational
$Q$-field, in either the biaxial or the uniaxial stratum.

This does not refute the disclination module, which never claimed to be a $Q$-tensor defect.
It separates two things the corpus has been treating as one, and the separation has a
consequence for §3: the write head addresses $Q$, the $\ell = 2$ orientational field. The
dervish is carried by the lattice. **So no polarization or angle of the write beam can
create, move, or discharge the fivefold defect.** If the defect is to be actuated at all, the
actuator has to couple to the crystalline domain — strain, thermal, or growth — and not to the
orientational channel this note has been developing.

Note also that the fundamental group *jumps* between strata, $\mathbb{Z}/2$ on the walls and
$Q_8$ in the interior. So the sheaf of defect classes is not locally constant across the
chamber, which is the precise sense in which the fiber structure is not uniform: it is a
stratified rather than a locally constant sheaf, and the stratification is the face poset of
§4.2.

## 7. Consequences and checks

**The Bragg channel is a classical address space.** Its pages are near-orthogonal modes,
compatible, jointly readable, with a joint distribution. Nothing contextual lives there. If
angular addressing is used for capacity, it is ordinary multiplexing.

**The two mechanisms impose opposing constraints on domain size.** Bragg multiplexing
*requires* mesoscale periodicity at $\Lambda \approx \lambda/2n \approx 120\,\text{nm}$.
Quadrupolar photoselection requires the medium stay sub-wavelength and homogenized, which
fails once domains approach $\lambda/4n \approx 60\,\text{nm}$ and begin to scatter. These
are within a factor of two of each other. A composite tuned for Bragg capacity is close to
the size at which scattering degrades the orientational channel, and whether both can operate
in one sample is a genuine design question rather than a matter of adjustment.

**Checkable, in order of cost:**

1. Measure the composite's birefringence as a function of domain size. The prediction is
   near-zero for tetrahedrally coordinated homogeneous material and nonzero once $D_{2d}$
   domains form and align, rising with alignment order and falling once scattering sets in.
   A null result at all sizes kills §2.1.
2. Measure the angular dependence of write efficiency. The prediction is $\cos^2$ with only
   $\ell \le 2$ content for one-photon; fitting an $\ell = 4$ component to a single-pulse
   response would falsify the rank limit of §3.
3. Test whether the five-direction readout of §4.5 reconstructs $Q$, by writing a known
   biaxial state and inverting.
4. Whether the five KCBS directions are linearly independent in the $\ell = 2$ sector — a
   finite computation on the five tensors $\hat n_i \hat n_i^{\mathsf T} - I/3$. If they are,
   the minimal tomographically complete direction set coincides with the exclusivity-graph
   direction set. This would be a statement about the geometry only, and by §5.1 carries no
   implication about the value.

## 8. Status of claims

**Standard physics, transferred.** Geometric optics requiring $a \gg \lambda$; the Ewald
condition $|\mathbf{G}| \le 2|\mathbf{k}|$; Kogelnik angular selectivity; Neumann's principle
relating point group to permitted tensor rank, and the vanishing of rank-2 anisotropy under
cubic symmetry; $\cos^2$ photoselection and its $\ell \le 2$ content; the nematic $Q$-tensor
classification and its two invariants; the Lode parameter and Haigh–Westergaard coordinates;
the identification of the ordered-spectrum cone for traceless symmetric matrices with the
positive Weyl chamber of $A_{n-1}$, and the face lattice of a simplicial cone;
$\pi_1(\mathbb{RP}^2) = \mathbb{Z}/2$; the KCBS bounds $2$ and $\sqrt5$; the
Abramsky–Brandenburger global-section formulation.

**Computed here.** The Ewald estimate of §2 (to one significant figure). The identification
in §4.2 of $\langle \text{pos}, \text{neg}\rangle$ with the strict simple-root inequalities,
of $\mathrm{kHeight}$ with face dimension, and of $\le_k$ with the face poset — each checked
case by case against the four faces. The face-count $\binom{n-1}{j}$ giving multiplicities
$1,2,1$ at $n=3$. The genericity of $\top$. The two-pulse necessity for reaching the interior.

**Conjectured.** That the arity of the charge is $2^{n-1}$ in spatial dimension $n$ (§4.3).
The algebraic half is verified; whether the physical realization transfers to other dimensions
is not checked, and the $n=3$ agreement alone is weak evidence since $\mathbf{FOUR}$ was not
derived from a dimensional argument in the first place.

**Argued, not proved.** That the $\ell = 2$ identification is the *right* carrier for the
charge rather than one of several available. The claim in §5.1 that the substrate cannot reach
$\sqrt5$ rests on the state being a classical distribution, which is an assumption about the
physical system rather than a theorem.

**Not established.** Whether higher harmonics accumulate fast enough under
multi-pulse writing to exceed the rank bound in practice. Whether disulfide metathesis
produces sufficient $\Delta n$ for Bragg storage at all — this is the single unmeasured number
on which the entire Bragg channel depends, and no estimate is offered.

**Resolved since drafting.** The §4.5 tension is half-answered by §6.1: the inconsistency
sheaf supplies the radial coordinate over the top face, valued in $\mathbb{Z}$. Only the
angular coordinate is unaccounted for.

**Read from the formalization, not derived.** The fiber of the settling sheaf
(`Site/Sheaf.lean`: `section_ : Valuation`, `Valuation : PredicationCell → Charge`); the
$\mathbb{Z}$-valued sections of `Cohomology/InconsistencySheaf.lean` and its short exact
sequence; `CoordinationCohomology.H1rank`; the scope statement in
`QuantumContextuality/KCBS.lean` confining it to the possibilistic layer with `KCBSValue`
unbuilt; the combinatorial construction in `QuantumContextuality/DisclinationLink.lean`.

**Standard defect theory, transferred.** $\pi_1(SO(3)/D_2) = Q_8$ via $SO(3)/D_2 = SU(2)/Q_8$;
$\pi_1(\mathbb{RP}^2) = \mathbb{Z}/2$; the element orders of $Q_8$. The conclusion that no
fivefold $Q$-tensor disclination exists follows from the order count and is as solid as those
inputs.

**Argued here.** That the corpus's fivefold disclination and the $Q$-tensor defect group are
different objects (§6.4) — this rests on reading `DisclinationLink.lean` as a lattice
construction, which its own header supports but which I have not confirmed against the
`AperiodicOrder.Defect` module it imports. The nonabelian $H^1(\mathcal{U}; \underline{S_3})$
of §6.3 is a construction I am proposing, not one the library contains; whether it is the
right home for the wall-labelling obstruction is unverified.

---

## Prior work in this corpus

- *Dual Organosulfur Crosslink Populations in a Two-Phase Siloxane–Zeolite Network*
  (2026-07-25) — the aryl/aliphatic disulfide choice and the UV write-head conflict; §4.1
  there selected aliphatic, which removes the aryl absorption this note's write mechanism
  would otherwise use.
- *Ossification as the State Variable* (2026-07-25) — the domain-size constraint of §6
  couples to the coarsening rate rather than to $\phi$, which that note's state variable does
  not capture.
- *The Structure of Semiotic Foam* (2026-07-25) — the disclination and global-section
  material of §5.2.
