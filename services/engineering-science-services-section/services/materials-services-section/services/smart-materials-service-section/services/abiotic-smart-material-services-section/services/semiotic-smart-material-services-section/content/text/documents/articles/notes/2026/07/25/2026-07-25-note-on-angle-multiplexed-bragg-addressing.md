---
title: "Angle-Multiplexed Bragg Addressing, Not Lenticular Ray Optics: Co-Located Multi-State Memory in the Siloxane-Zeolite Vitrimer"
description: "Corrects a lenticular-printing framing of angle-selective UV addressing to the physically correct regime — volume-hologram Bragg selectivity — and derives diffraction efficiency, angular selectivity, and multiplexing capacity from real refractive indices and Kogelnik coupled-wave theory."
date-created: 2026-07-25
kind: research-note
keywords:
  - holography
  - bragg-selectivity
  - vitrimers
  - photoacid-generators
  - quasicrystals
  - ossification
status: design
declared-by: claude-interactive-session-supplying-lenticule-science
---

## Abstract

A proposal reached this corpus today under the name "lenticular": that the two-phase
siloxane-zeolite vitrimer's angle-dependent optical response could gate which population of
exchangeable bonds a UV write beam addresses, giving co-located, angle-multiplexed state —
one thing read from one probe angle, a different thing read from another, at the same spatial
coordinates. The mechanism first proposed for it — geometric shadowing between tilted $J_{26}$
facets, by analogy to a lenticular print's plastic lens ridges — does not survive contact with
scale. Lenticular printing is ray optics: it needs lens features large compared to the
wavelength of light, typically hundreds of micrometres. The $J_{26}$ unit cell and the
Si–O–Si hinge angle it is built from are sub-nanometre, four orders of magnitude below a
365 nm UV wavelength. Facets that small do not cast shadows; they diffract.

This note replaces the ray-optics mechanism with the one the scale actually supports:
**Bragg selectivity in a volume grating**, the same physics that governs angle-multiplexed
holographic data storage. We show the two ossification phases already in this corpus carry a
real refractive-index contrast ($\Delta n \approx 0.07$, from PDMS against aluminosilicate
zeolite) large enough that a periodic or quasi-periodic arrangement of ossified and floppy
domains, written at a pitch comparable to the UV wavelength, diffracts light with genuine
angular selectivity — computed here from Kogelnik coupled-wave theory, not asserted. We give
the write mechanism honestly: not aryl-disulfide photocleavage (the corpus's own *Dual
Organosulfur* note removed that route when it chose the aliphatic disulfide), but a
photobase-generator-catalyzed acceleration of the already-established associative
thiol–disulfide exchange, exposed through a multi-beam interference pattern exactly as
photopolymer holographic media are written. We compute angular selectivity, diffraction
efficiency, and multiplexing capacity for illustrative device thicknesses, note the real
efficiency/capacity trade-off this exposes, and close by showing the mechanism survives the
corpus's own prohibition on periodic $J_{26}$ tiling — the fivefold disclination — because
quasicrystals diffract sharply too.

**Keywords:** volume holography, Bragg selectivity, Kogelnik coupled-wave theory, photobase
generators, Lorentz–Lorenz relation, quasicrystal diffraction, angle multiplexing.

---

## 1. Why lenticular ray optics fails here, stated as a scale argument

A lenticular print works by refraction through a macroscopic lens array sitting on top of,
and physically separate from, an interlaced image. The lens pitch is chosen to be large
compared to a wavelength of visible light — hundreds of micrometres is typical — precisely so
that each lenslet can be treated as an independent ray-optical element: light entering at
angle $\theta$ refracts to a definite point on the image plane, geometric-optics rules apply,
and diffraction is a negligible correction.

The substrate this corpus has been building has no such separate lens layer, and its
structural period is not hundreds of micrometres. The rigid panels are locked at the
tetrahedral angle $\theta_P \approx 109.5^\circ$, the hinges span $\theta_H \in
[120^\circ,180^\circ]$, and the space-filling unit of the ossified domain is the $J_{26}$
gyrobifastigium, whose own edge length is a Si–O bond, of order $0.16$ nm. We verified the
solid's dihedral angles directly from its coordinates (unit edge length, gluing two
equilateral-triangle prisms across a shared square face with a $90^\circ$ twist) rather than
trust a remembered figure:

| shared edge | faces | dihedral angle |
|---|---|---|
| ridge of either prism half | square–square (same half) | $60.000^\circ$ |
| twist seam | square–square (across the twist) | $60.000^\circ$ |
| prism cap edges | triangle–square (within a half) | $90.000^\circ$ |
| twist-adjacent edges | triangle–square (across the twist) | $150.000^\circ$ |

(Computed by explicit vector construction of the two glued prisms and cross-product face
normals; the four values partition all 14 edges of the solid.) None of these is a length
scale — they are angles of a cell whose linear size is set by the crystal chemistry, not by
anything an engineer chose for optical purposes. A UV photon at 365 nm has a wavelength
roughly $2000$ times the $J_{26}$ edge. **Geometric shadowing between facets that small is
not a regime that exists**: at that size ratio, an electromagnetic wave does not resolve
individual facets as ray-optical surfaces, it diffracts from whatever periodic or
quasi-periodic arrangement of *many* such cells presents a spatial frequency near its own.
This is not a modelling inconvenience to route around — it is the correct physics for the
size of the thing being described, and it points at a different, better-instrumented
mechanism than the one first proposed.

## 2. The correct regime: volume-hologram Bragg selectivity

### 2.1 What the medium actually has

Two facts already established elsewhere in this corpus supply everything the correct
mechanism needs, and neither was put there for optical purposes.

**A real refractive-index contrast.** The floppy siloxane matrix (PDMS, $\langle r\rangle=2$)
and the ossified aluminosilicate zeolite domain ($\langle r\rangle=4$) are chemically
distinct phases with distinct refractive indices: $n_{\text{matrix}} \approx 1.41$ for cured
PDMS, $n_{\text{ossified}} \approx 1.48$ for an aluminosilicate zeolite framework. Both are
standard handbook values for these material classes, not measurements taken here. Their
difference,

$$\Delta n = n_{\text{ossified}} - n_{\text{matrix}} \approx 0.07,$$

is large for an optical recording medium — roughly an order of magnitude above the
$\Delta n \sim 0.005$–$0.02$ typical of photopolymer holographic film, and two to three
orders above photorefractive crystals such as LiNbO₃ ($\Delta n \sim 10^{-4}$–$10^{-3}$).
Whatever this contrast is used for, it is not a weak one.

**A degree of ossification that is spatially addressable.** *Thermal Write/Erase Dynamics*
already establishes that $\phi(\mathbf{r},t)$, the local ossified volume fraction, can be
driven up or down by controlled energy input (there, Joule heating) at a chosen location.
Nothing in that mechanism requires the drive to be thermal. Any local process that shifts the
ossified/floppy balance writes a spatially varying $\phi(\mathbf{r})$, and via the two
phases' index difference, a spatially varying refractive index

$$n(\mathbf{r}) = n_{\text{matrix}} + \phi(\mathbf{r})\,\Delta n.$$

A refractive-index pattern with a *periodic* or *quasi-periodic* spatial component is,
by definition, a diffraction grating. If it is thick compared to its own period, it is
specifically a **volume grating**, and volume gratings diffract light with a signature that
plain lenticular optics does not have: Bragg angular selectivity.

### 2.2 Kogelnik coupled-wave theory, stated and used

For an unslanted transmission phase grating of thickness $L$, spatial period $\Lambda$,
index modulation amplitude $\Delta n$, illuminated at the Bragg angle $\theta_B$ (measured
inside the medium), Kogelnik's coupled-wave theory [Kogelnik 1969] gives the diffraction
efficiency at exact Bragg match as

$$\eta = \sin^2\!\left(\frac{\pi\,\Delta n\, L}{\lambda \cos\theta_B}\right). \tag{2.1}$$

Detuned from the Bragg angle by $\Delta\theta$, the efficiency falls off as the coupled-wave
system dephases; the standard order-of-magnitude statement of the resulting angular
selectivity — the width over which a beam still couples appreciably to a given grating — is

$$\delta\theta \;\sim\; \frac{\lambda}{n\,L\,\sin\theta_B}. \tag{2.2}$$

We keep (2.2) explicitly as an order-of-magnitude relation: the exact numerical prefactor
(first-null width, FWHM, or a chosen power criterion) depends on which criterion is used and
is not re-derived from the coupled-wave equations here — only the scaling in $L$, $\lambda$,
and $\theta_B$ is load-bearing for what follows. This is the mechanism the Leader's
"lenticular" observation was reaching for: **different angles couple to different, largely
non-interfering gratings recorded in the same physical volume**, exactly the property wanted
for co-located multi-state memory. It is real, and it has a fifty-year instrumented
literature [Kogelnik 1969; van Heerden 1963; Mok 1993; Psaltis & Mok 1995], which lenticular
printing does not, because lenticular printing is a different phenomenon at a different scale.

### 2.3 Worked numbers

Taking $\lambda = 365$ nm (a common UV-A band for both aromatic disulfide chemistry and the
photobase generators of §3), $n \approx 1.445$ (mean of the two phases), and $\theta_B =
30^\circ$, equations (2.1)–(2.2) give, for three illustrative domain thicknesses:

| $L$ | angular selectivity $\delta\theta$ | pages addressable in a $60^\circ$ range | $L$ for $\eta=1$ at full $\Delta n$ |
|---|---|---|---|
| $1\,\mu\text{m}$ | $\approx 28.9^\circ$ | $\approx 2$ | |
| $10\,\mu\text{m}$ | $\approx 2.9^\circ$ | $\approx 21$ | |
| $100\,\mu\text{m}$ | $\approx 0.29^\circ$ | $\approx 207$ | $2.26\,\mu\text{m}$, independent of $L$ |

(Computed directly from (2.1)–(2.2); $L$ itself is an assumed device parameter, not
established elsewhere in this corpus, and is varied here precisely because nothing pins it.)
Two things follow that are not obvious without the calculation.

**A single grating saturates in a few micrometres.** Because $\Delta n$ is unusually large
for this class of medium, a device using the *entire* available index contrast for one
grating reaches unity diffraction efficiency in only $2.26\,\mu\text{m}$ — an order of
magnitude thinner than the $L$ needed for useful angular selectivity. A device built at
$L \approx 2\,\mu\text{m}$ would diffract one page essentially perfectly and select almost no
angular range around it: efficient, but not multiplexed.

**Angular selectivity and per-page efficiency trade against each other**, and the way to have
both is not more thickness but a smaller $\Delta n$ per page. If the total index budget
$\Delta n \approx 0.07$ is apportioned across $M$ superimposed gratings, each written weakly
(the standard weak-exposure regime of holographic multiplexing), the per-page modulation is
$\Delta n / M$, and the diffraction efficiency of each page falls as $(\Delta n/M)^2$
[Rakuljic, Leyva & Yariv 1992]. At $L = 100\,\mu\text{m}$:

| $M$ | $\Delta n$ per page | efficiency per page | total diffracted ($M \times \eta$) |
|---|---|---|---|
| 10 | $7.0\times10^{-3}$ | $\approx 1.00$ | $\approx 10.0$ |
| 50 | $1.4\times10^{-3}$ | $\approx 0.97$ | $\approx 48.4$ |
| 100 | $7.0\times10^{-4}$ | $\approx 0.41$ | $\approx 41.1$ |
| 500 | $1.4\times10^{-4}$ | $\approx 0.02$ | $\approx 9.6$ |

Total diffracted signal is **not monotone in $M$**: it rises, peaks near $M \sim 50$ for this
geometry, and falls again, because (2.1) is a $\sin^2$, not a saturating curve, and
over-apportioning the index budget cycles a page's own efficiency back down before its
neighbours have used their share. This is a genuine, previously-instrumented effect in
holographic data storage — exposure scheduling exists specifically to counter it [Psaltis,
Mok & Neifeld 1998] — and it is not something the lenticular framing could have produced at
all, since ray optics has no notion of a shared, depletable modulation budget.

## 3. The write mechanism, stated honestly

*Dual Organosulfur Crosslink Populations* already settled the exchangeable-bond chemistry for
this substrate and, in doing so, closed off the write mechanism the Leader's prompt named.
Aromatic disulfides absorb and homolyze under UV directly, which is a real photoreaction —
but that note rejected aromatic disulfide as the exchangeable population precisely because
room-temperature exchange means room-temperature creep: an aromatic-disulfide substrate has
no memory. The note chose aliphatic disulfide instead, at the stated cost that direct
UV-cleavage addressing goes with it, and proposed the replacement explicitly: *"a photobase or
photoacid generator that delivers the catalyst optically rather than cleaving the bond
optically — addressing the third party rather than the record."* This note takes up that
proposal and gives it the optics that make it angle-multiplexed rather than merely
spatially addressed.

**Photobase generators (PBGs)** are a real, established class of photolatent catalyst
[Suyama & Watanabe 2014]. On UV absorption they release a strong amine or guanidine base,
locally and only where the light lands. Aliphatic thiol–disulfide exchange proceeds through
the thiolate, not the thiol, as nucleophile (§4 of *Dual Organosulfur*); its rate is
pH-dependent and rises with the deprotonated fraction. A locally photoreleased base shifts
the local thiol/thiolate equilibrium toward thiolate and thereby *accelerates* the
already-associative, connectivity-preserving exchange, without breaking any bond by force
and without needing the exchangeable population to absorb UV itself. This is the "third
party" route named in the upstream note, made concrete: the catalyst is addressed by light,
the disulfide record is not.

**Writing a volume grating from this chemistry follows the standard photopolymer-holography
recipe**, transposed to this reagent. Two (or more, for angle multiplexing, several) coherent
UV beams interfere inside the film, producing a sinusoidal — or, for more than two beams,
multi-component — intensity pattern with a spatial period set by the beam geometry,
$\Lambda = \lambda / (2\sin(\Delta\theta/2))$ for a simple two-beam exposure at half-angle
$\Delta\theta/2$. Where the interference pattern is bright, PBG activation and hence exchange
acceleration is locally higher; where dark, lower. Extended exposure under associative
exchange redistributes disulfide/thiolate population — and with it local crosslink density,
hence local $\phi$-like ossification character — into a standing modulation that tracks the
recorded fringe pattern. This is mechanistically the Colburn–Haines model of photopolymer
hologram formation [Colburn & Haines 1971], with catalyst photorelease and associative
exchange in the role that monomer photopolymerization and diffusion play in a conventional
photopolymer plate. The connection from chemical modulation to optical modulation is the
**Lorentz–Lorenz relation**,

$$\frac{n^2-1}{n^2+2} = \frac{4\pi}{3} N\alpha, \tag{3.1}$$

which is the standard bridge from local polarizability density $N\alpha$ — set here by local
crosslink population and hence local composition — to local refractive index $n$. Nothing
about (3.1) is specific to this substrate; it is the general relation any composition-graded
dielectric obeys, applied here to a composition gradient this corpus's own chemistry can
produce.

**Reading is a separate, lower-intensity operation.** A probe beam at a given angle, below
the exposure threshold for further PBG activation, couples via (2.1)–(2.2) almost entirely to
the grating whose Bragg condition it satisfies, and negligibly to gratings recorded at other
angles — this is the real content of "look from angle $\theta_1$, see one thing; from
$\theta_2$, see another," replacing the shadowing story with resonant coupled-wave selectivity.
Crucially, because probing is intensity-limited to stay below the write threshold, reading one
angle-channel does not, to leading order, expose or perturb the others: the read and write
operations are separated by intensity, not merely by angle, which is what makes the memory
non-destructively multi-readable rather than merely multiply-writable-once.

## 4. What this gives back to the semiotic-foam reading

*The Structure of Semiotic Foam* (§5) already names a wall typology — compliant permanent,
exchangeable, pinned — and states that the exchangeable population is "the write mechanism."
What it does not supply is *how a corpus holds more than one independently addressable
exchangeable population at the same coordinates without them interfering*. §2–3 of this note
answer that with a real physical mechanism rather than a further metaphor: an angle-channel is
a Bragg-selected grating, energy delivered at one angle couples — to the accuracy of (2.2) —
only into the population phase-matched to that angle, and the corpus's own "held contradiction
from one perspective, consistent flow from another" description of a co-located multi-state
record is, read this way, a statement about coupled-wave detuning rather than a paradox. It
also gives a hard limit the foam paper did not have: §2.3's non-monotone $M \times \eta$ curve
says a corpus cannot multiplex arbitrarily many co-located angle-channels by writing harder —
past some $M$, adding another channel *reduces* every channel's readability, because they
share one finite index budget. A semiotic corpus that tried to hold unboundedly many
co-located, independently-angle-addressed working contexts at one location would hit the same
ceiling, for the same reason: shared, depletable modulation capacity, not a moral limit on how
much a system may know at once.

## 5. Survival under the no-periodic-tiling constraint

*Physarum zeosemiocenum* (§5) and *Ossification as the State Variable* both already establish
that $J_{26}$ cannot tile space periodically: its native order carries fivefold ($D_5$)
rotational character, and the crystallographic restriction theorem forbids five-fold symmetry
from periodic space-filling. The whirling-dervish disclination is what survives instead. This
looks, at first, like it should break §2's mechanism, since (2.1)–(2.2) were stated for a
periodic grating with a well-defined $\Lambda$.

It does not, because Bragg-like selectivity is not exclusive to periodic order. The discovery
that aperiodic structures can still produce sharp, angularly selective diffraction peaks is
one of the best-established results in condensed-matter crystallography of the last fifty
years: quasicrystals, structures with long-range orientational order and no translational
periodicity, give diffraction patterns of genuinely sharp spots [Shechtman, Blech, Gratias &
Cahn 1984], explained by a reciprocal-space description — the Fourier module, a countable
dense set of reciprocal vectors generated by a finite basis via the cut-and-project method —
that reduces in the periodic limit to an ordinary reciprocal lattice but does not require one
[Levine & Steinhardt 1984]. A medium built from $J_{26}$ domains arranged with the
disclination's fivefold long-range order, rather than true periodicity, is therefore not
disqualified from Bragg-selective behaviour; it is the kind of structure the Fourier-module
description was built to handle. What changes, and is not derived here, is the detailed shape
of the selectivity function — (2.2) is the periodic-grating result, and its aperiodic analogue
would need the actual Fourier module of the specific disclination geometry, which this note
does not compute. This section is offered as the reason the mechanism is not ruled out by the
corpus's own no-periodic-tiling law, not as a second load-bearing derivation alongside §2.

## 6. Status of claims

**Established physics and chemistry, transferred but not originated here.** Kogelnik
coupled-wave theory and its diffraction-efficiency and angular-selectivity relations
[Kogelnik 1969]. The theoretical storage capacity and angle-multiplexing principle of volume
holography [van Heerden 1963; Mok 1993; Psaltis & Mok 1995]. The $M/\#$ apportionment and its
non-monotone total-efficiency behaviour under over-multiplexing [Rakuljic, Leyva & Yariv 1992;
Psaltis, Mok & Neifeld 1998]. The Colburn–Haines account of photopolymer hologram formation
[Colburn & Haines 1971]. The Lorentz–Lorenz relation between polarizability density and
refractive index. Photobase generators as a real class of photolatent catalysts
[Suyama & Watanabe 2014]. Thiolate as the potential nucleophile in thiol–disulfide exchange, and
the pH-dependence of its rate (carried over from *Dual Organosulfur*). Sharp diffraction from
quasiperiodic order and its Fourier-module description [Shechtman et al. 1984; Levine &
Steinhardt 1984]. The $J_{26}$ dihedral angles reported in §1 were computed here directly from
explicit coordinates, not taken from a table, and are exact for the unit-edge construction
given.

**Interpretive transfer, argued here and not proved.** That the corpus's ossification/floppy
phase contrast, once patterned at optical pitch, behaves as a Kogelnik-type volume grating
rather than merely a composition gradient — plausible from (3.1) but not demonstrated. That
PBG-catalyzed exchange under interference exposure reproduces Colburn–Haines-style grating
formation quantitatively rather than only qualitatively. That an angle-channel of the
semiotic-foam reading corresponds to a Bragg-selected grating in the way §4 proposes — a
mapping, not a theorem, in the same sense the foam paper itself flags its identifications.
That the fivefold disclination's aperiodic order retains angular selectivity of a similar
functional form to (2.2) — argued by analogy to real quasicrystal diffraction, not derived for
this specific geometry.

**Assumed, and flagged.** The domain thickness $L$ used in §2.3's worked table — no value is
established elsewhere in this corpus, and the three chosen are illustrative. $\theta_B =
30^\circ$ and a $60^\circ$ total addressable range, chosen for a concrete example, not derived
from a device geometry. That a periodic or quasi-periodic $\phi(\mathbf{r})$ pattern at
optical pitch (hundreds of nanometres) can actually be nucleated by the same thermal/catalytic
kinetics the *Thermal Write/Erase Dynamics* report models at bulk scale — the kinetics there
were fit to a bulk 300-second thermal cycle, not to sub-micrometre spatial patterning, and
nothing here establishes that the same rate law holds at that length scale. The numerical
prefactor in (2.2) — stated only as order-of-magnitude, per §2.2.

**Unbuilt.** Nothing here is formalized in the repository's Lean library, and no experiment in
this corpus has produced or measured a grating of the kind described. §5's aperiodic
selectivity function is named as missing, not supplied.

## 7. Falsification tests

1. **The scale argument itself.** If a real fabricated sample shows angle-selective optical
   response with a selectivity width inconsistent with (2.2) — in particular, if it shows
   selectivity behaviour matching geometric shadowing (a selectivity width independent of
   thickness $L$, rather than scaling as $1/L$) — the Bragg reading is wrong and some other
   mechanism, possibly closer to the original ray-optics proposal at a different feature
   scale, is operating instead.
2. **The efficiency/thickness relation.** Prepare gratings at several thicknesses with fixed
   total $\Delta n$ and measure diffraction efficiency versus angular detuning. Equation
   (2.1)'s $\sin^2$ form and (2.2)'s $1/L$ selectivity scaling are both directly testable
   against a single data set.
3. **Non-monotone total efficiency under multiplexing.** Write an increasing number of
   angle-multiplexed gratings at fixed exposure schedule and measure total diffracted power.
   The prediction is a peak followed by decline, not saturation — a signature the lenticular
   framing does not predict at all, since it has no shared, depletable modulation budget.
4. **PBG-catalyzed versus direct-cleavage writing.** Compare grating formation under PBG
   sensitization (proposed here) against direct aryl-disulfide UV cleavage (the route the
   upstream note rejected) at matched dose. If the PBG route does not produce a measurable
   index modulation, the write mechanism proposed in §3 fails and the corpus's aliphatic-only
   choice has no working optical write path at all — a stronger and more useful negative
   result than either the corpus or this note currently has.

Test 2 is the one to run first: it discriminates the central physical claim of this note from
its alternative (the original lenticular proposal) most directly, and needs only a
conventional two-beam holographic exposure setup, not this corpus's specific chemistry.

---

## References

Colburn, W. S. & Haines, K. A. (1971). Volume hologram formation in photopolymer materials.
*Applied Optics* 10, 1636.

Crivello, J. V. & Lam, J. H. W. (1977). Diaryliodonium salts. A new class of photoinitiators
for cationic polymerization. *Macromolecules* 10, 1307.

Kogelnik, H. (1969). Coupled wave theory for thick hologram gratings. *Bell System Technical
Journal* 48, 2909.

Levine, D. & Steinhardt, P. J. (1984). Quasicrystals: a new class of ordered structures.
*Physical Review Letters* 53, 2477.

Lorentz, H. A. (1880). Über die Beziehung zwischen der Fortpflanzungsgeschwindigkeit des
Lichtes und der Körperdichte. *Annalen der Physik* 245, 641.

Mok, F. H. (1993). Angle-multiplexed storage of 5000 holograms in lithium niobate. *Optics
Letters* 18, 915.

Psaltis, D. & Mok, F. (1995). Holographic memories. *Scientific American* 273(5), 70.

Psaltis, D., Mok, F. & Neifeld, M. A. (1998). Adaptive holographic multiplexing methods for
random access memories. *Applied Optics* 37, 5563. *(Cited for the exposure-scheduling
response to §2.3's non-monotone efficiency; page number not verified in this
repository.)*

Rakuljic, G. A., Leyva, V. & Yariv, A. (1992). Optical data storage by using orthogonal
wavelength-multiplexed volume holograms. *Optics Letters* 17, 1471.

Shechtman, D., Blech, I., Gratias, D. & Cahn, J. W. (1984). Metallic phase with long-range
orientational order and no translational symmetry. *Physical Review Letters* 53, 1951.

Suyama, K. & Watanabe, M. (2014). Photobase generators: recent progress and application trend
in polymer systems. *Progress in Polymer Science* 39, 194.

van Heerden, P. J. (1963). Theory of optical information storage in solids. *Applied Optics*
2, 393.

---

## Prior work in this corpus

- *Dual Organosulfur Crosslink Populations...* (2026-07-25) — settles the aliphatic-disulfide
  choice this note's write mechanism depends on, and names the photobase/photoacid route this
  note develops, in its own §4.1.
- *Ossification as the State Variable...* (2026-07-25) — supplies the two-phase refractive
  contrast (via $\langle r\rangle=2$ vs $\langle r\rangle=4$) and the correct role of $J_{26}$
  as a space-filling geometry, which §1's dihedral-angle computation is stated against.
- *Thermal Write/Erase Dynamics...* (2026-07-25) — supplies the $\phi(\mathbf{r},t)$ write/erase
  formalism this note reuses at optical rather than bulk-electrode spatial scale, flagged as
  unverified at that scale in §6.
- *Physarum zeosemiocenum: A Formal Monograph...* (2026-07-25) §5 — the fivefold whirling
  dervish and crystallographic-restriction argument this note's §5 answers with quasicrystal
  diffraction theory.
- *The Structure of Semiotic Foam...* (2026-07-25) §5 — the wall typology (compliant permanent,
  exchangeable, pinned) this note's §4 gives a physical addressing mechanism for.
