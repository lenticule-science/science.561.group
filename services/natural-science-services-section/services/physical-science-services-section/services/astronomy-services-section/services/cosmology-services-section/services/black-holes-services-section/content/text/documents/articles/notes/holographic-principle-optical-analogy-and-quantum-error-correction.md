---

title: "Holographic Principle: Optical Analogy, Entropy Bounds, and Error-Correcting Encoding"
description: "The [Bekenstein-Hawking entropy](./black-hole-thermodynamics.md) formula showed that a black hole's information content scales with the area of its horizon rather than the volume it encloses -- the seed of the [holographic principle](../terms/holographic-principle.md). This note follows that seed through the papers that built it out: the optical-hologram analogy 't Hooft and Susskind reached for, Bousso's covariant entropy bound, Maldacena's AdS/CFT correspondence, the Ryu-Takayanagi formula that made the bound quantitative, and the modern reading of boundary encoding as a quantum error-correcting code."
date-created: 2026-08-22
teaches:
  - covariant-entropy-bound
  - ryu-takayanagi-formula
  - holographic-quantum-error-correction
  - light-sheet
requires:
  - holographic-principle
  - bekenstein-hawking-entropy
  - black-hole-information-paradox
---

The [Bekenstein-Hawking entropy](./black-hole-thermodynamics.md) formula showed that a black hole's information content scales with the area of its horizon rather than the volume it encloses -- the seed of the [holographic principle](../../../../../../../../../content/text/glossary/terms/holographic-principle.md).
This note follows that seed through the papers that built it out: the optical-hologram analogy 't Hooft and Susskind reached for, Bousso's covariant entropy bound, Maldacena's AdS/CFT correspondence, the Ryu-Takayanagi formula that made the bound quantitative, and the modern reading of boundary encoding as a quantum error-correcting code.

It deliberately does not re-derive $S = A/4$ or re-litigate the [information paradox](./the-information-paradox.md) -- those are already covered.
What follows is the lineage the area-law observation actually grew into, and a careful look at where the "hologram" in "holographic principle" is a precise analogy and where it is only a suggestive one.

## 1. The founding papers: 't Hooft and Susskind

**'t Hooft, "Dimensional Reduction in Quantum Gravity" (1993, arXiv:gr-qc/9310026)** made the first version of the argument, and it did not start from an optical analogy at all.
It started from unitarity plus Bekenstein-style entropy counting.
'T Hooft's own abstract states the conclusion starkly: "the requirement that physical phenomena associated with gravitational collapse should be duly reconciled with the postulates of quantum mechanics implies that at a Planckian scale our world is not 3+1 dimensional. Rather, the observable degrees of freedom can best be described as if they were Boolean variables defined on a two-dimensional lattice, evolving with time."
The claim is that the true number of degrees of freedom describing a region scales with its bounding *area*, not its volume, organized as discrete (spin-like) data on a two-dimensional lattice evolving in time.
No hologram is invoked yet -- the paper is a counting argument, and a warning: it closes by noting this is "the main reason why so-far no completely consistent mathematical models of quantum black holes have been found."

**Susskind, "The World as a Hologram" (1995, J. Math. Phys. 36, 6377, arXiv:hep-th/9409089)** is the paper that supplies the name, and the analogy, that the field has used ever since.
Its abstract: "According to 't Hooft the combination of quantum mechanics and gravity requires the three dimensional world to be an image of data that can be stored on a two dimensional projection much like a holographic image. The two dimensional description only requires one discrete degree of freedom per Planck area and yet it is rich enough to describe all three dimensional phenomena."
The explicit optical-hologram sentence, verified against the arXiv text, reads: "'t Hooft has made the analogy with a hologram which stores a three dimensional image on a two dimensional film. As in the case of the hologram the flat two dimensional image must be rich enough to code the full rotationally invariant description of three dimensional objects."
Susskind then moves on to light-front quantization and momentum-growth arguments, and the paper ends by treating string theory as a candidate concrete realization of 't Hooft's idea.

One caveat is worth flagging precisely, because it is easy to over-attribute.
I could not find, in the actual text of the 1995 paper, any explicit discussion of interference fringes, "scrambling," or a stated account of where the optical analogy formally breaks down.
The hologram there is an intuition pump, not a load-bearing technical claim -- the one methodological caution Susskind does give is that "the mapping between 3+1 dimensional events and their image on the distant screen can be qualitatively described in semiclassical terms but the reader should keep in mind that the full description is necessarily quantum mechanical."
The familiar formulation that the boundary encoding is "nonlocal and scrambled, like an actual hologram's fringes" belongs to later commentary and review literature (see section 5 below) and to the AdS/CFT literature that followed, not to Susskind's own 1995 words.

## 2. From conjecture to bound, and from bound to correspondence

't Hooft and Susskind established that a boundary encoding is *possible*.
Two further results turned that into, respectively, a precise inequality and a concrete working example.

**Bousso, "A Covariant Entropy Conjecture" (1999, arXiv:hep-th/9905177)** generalized the area bound to arbitrary spacetimes, replacing the earlier, and ultimately failing, attempt to bound entropy in a spatial *volume* (Fischler-Susskind, 1998) with a bound defined on **light-sheets**.
Bousso's own statement of the conjecture: "Let A be the area of any two-dimensional surface. Let L be a hypersurface generated by surface-orthogonal null geodesics with non-positive expansion. Let S be the entropy on L. Then $S \leq A/4$."
A light-sheet is a null hypersurface generated by light rays orthogonal to a chosen two-dimensional surface, restricted to the directions along which the rays are converging rather than spreading apart; by the Raychaudhuri equation, light rays passing through entropy-bearing matter focus and self-intersect at a caustic, and that caustic is where the light-sheet terminates.
The bound survived exactly the cosmological and black-hole-interior test cases where the naive volume-based version failed, and Bousso notes it must be statistical rather than thermodynamic in origin, since "because the conjecture is manifestly time reversal invariant, its origin cannot be thermodynamic, but must be statistical."
It also reduces to the ordinary Bekenstein bound in the weak-gravity limit, so it sits directly on top of, rather than beside, the material already covered in [black-hole-thermodynamics.md](./black-hole-thermodynamics.md).

**Maldacena, "The Large N Limit of Superconformal Field Theories and Supergravity" (1997/1998, arXiv:hep-th/9711200)** is the concrete realization 't Hooft and Susskind's abstract counting argument had been missing.
Maldacena showed that the large-$N$ limit of certain conformal field theories -- $\mathcal{N}=4$ super-Yang-Mills in four dimensions is the standard example -- contains a sector exactly dual to Type IIB supergravity (equivalently, string theory) on $AdS_5 \times S^5$.
The result comes from the near-horizon decoupling limit of a stack of $N$ D3-branes: the open-string description (a gauge theory living on the branes) and the closed-string description (supergravity in the near-horizon geometry) turn out to be two descriptions of the same physics.
This is the AdS/CFT correspondence, and it remains the first, and still the primary, concrete instance of the holographic principle: a $(3+1)$-dimensional conformal field theory "on the boundary" is exactly equivalent to gravity in a $(4+1)$-dimensional anti-de Sitter "bulk."
Where 't Hooft and Susskind had an area-law counting argument, Maldacena's correspondence supplied an explicit, computable dictionary between bulk and boundary -- the dictionary that let Ryu-Takayanagi (section 3) and the quantum-error-correction program (section 4) become quantitatively precise rather than schematic.

## 3. Ryu-Takayanagi: the entropy bound made quantitative

**Ryu and Takayanagi, "Holographic Derivation of Entanglement Entropy from AdS/CFT" (2006, PRL 96, 181602, arXiv:hep-th/0603001)** turned the qualitative "area bounds information" intuition into a precise geometric formula.
Their abstract: "A holographic derivation of the entanglement entropy in quantum (conformal) field theories is proposed from AdS/CFT correspondence. We argue that the entanglement entropy in $d+1$ dimensional conformal field theories can be obtained from the area of $d$ dimensional minimal surfaces in $AdS_{d+2}$, analogous to the Bekenstein-Hawking formula for black hole entropy."
The formula itself:

$$S_A = \frac{\text{Area}(\gamma_A)}{4 G_N^{(d+2)}}$$

where $\gamma_A$ is the $d$-dimensional static minimal surface in $AdS_{d+2}$ anchored on the boundary of a chosen boundary region $A$.
Ryu and Takayanagi describe $\gamma_A$ as playing "the role of a holographic screen for an observer who is only accessible to the subsystem $A$" -- which is exactly the entropy-bound intuition of Bousso and Susskind, turned into a precise, computable geometric prescription for the entanglement entropy of a *piece* of the boundary rather than the whole horizon.
The formula was later extended to time-dependent spacetimes as the covariant "HRT surface" (Hubeny, Rangamani, and Takayanagi, 2007) and given quantum corrections by Faulkner, Lewkowycz, and Maldacena and others; both postdate the 2006 result and are noted here only as a pointer for a possible follow-up pass, not developed further in this note.
What matters for what follows is narrower and more load-bearing: the Ryu-Takayanagi surface $\gamma_A$ is precisely the boundary of what is now called the "entanglement wedge" of $A$ -- the bulk region a given boundary subregion's data is able to reconstruct.
That object is the technical hinge the entire quantum-error-correction reading in section 4 turns on.

## 4. The quantum-error-correction reading: a precise version of "a fragment reconstructs the whole"

The intuitive appeal of the word "hologram" has always been that a piece of a broken hologram still shows the whole scene, just blurrier.
AdS/CFT now has an exact, technical version of that statement, and it is a genuine theorem about quantum error-correcting codes rather than a loose analogy.

**Almheiri, Dong, and Harlow, "Bulk Locality and Quantum Error Correction in AdS/CFT" (2015, JHEP 1504, 163, arXiv:1411.7041)** made the connection explicit.
Their abstract: "We point out a connection between the emergence of bulk locality in AdS/CFT and the theory of quantum error correction. Bulk notions such as Bogoliubov transformations, location in the radial direction, and the holographic entropy bound all have natural CFT interpretations in the language of quantum error correction... Our proposal gives a precise formulation of the idea of 'subregion-subregion' duality in AdS/CFT."
The key passage: "the radial direction in the bulk is realized in the CFT as a measure of how well CFT representations of bulk quantum information are protected from local erasures. The holographic principle also naturally arises in the guise of the general statement that there is an upper bound on how much quantum information a given code can protect from erasures."
In plain terms: a bulk operator sitting deep in the interior of AdS is encoded redundantly and non-locally across the boundary CFT.
It can be reconstructed from many different, overlapping boundary subregions -- specifically, from every boundary subregion whose entanglement wedge contains it -- so it survives the "erasure" of any one boundary subregion, as long as another sufficient subregion remains.
The depth of a bulk operator in the radial direction controls exactly how large a boundary erasure it can tolerate before reconstruction fails.
This is the rigorous modern descendant of "a fragment of the hologram reconstructs the whole": a genuine quantum secret-sharing, or erasure-code, statement.

**Pastawski, Yoshida, Harlow, and Preskill, "Holographic quantum error-correcting codes: Toy models for the bulk/boundary correspondence" (2015, JHEP 06, 149, arXiv:1503.06237)** -- the "HaPPY code" paper -- built an explicit toy model of exactly this.
The construction tiles "perfect tensors" (five- or six-leg tensors that are maximally entangled across every possible bipartition of their legs) on a hyperbolic pentagon or hexagon tessellation representing a discretized AdS bulk, with the outward-facing legs forming the boundary CFT.
The redundancy statement is explicit and quantitative: "a perfect tensor is the isometric encoding map of a quantum error-correcting code which encodes a single logical spin in a block of $2n-1$ physical spins, where the logical spin is protected against the erasure of any $n-1$ physical spins... a party holding any $n-1$ spins has no information about the logical spin, while a party holding any $n$ spins has complete information about the logical spin."
This is the sharpest available version of "a fragment reconstructs the whole" in the literature: a boundary fragment that is more than half the whole carries *complete* information about the encoded bulk data, and a fragment that is half or less carries *none* -- a threshold, not a gradual blurring, exactly formalizing the familiar fact about a physically broken optical hologram.

The parallel to an actual broken hologram was drawn explicitly, and by name, in **Pastawski, "Putting back the pieces of a broken hologram" (Quantum Frontiers, IQIM/Caltech blog, 25 March 2015)**, which narrates the HaPPY code's genesis directly from this observation: "Even if the hologram is broken into pieces, and some of these are lost, we may still use the remaining pieces to recover parts of the 3D image or even the full thing given a sufficiently large portion of the hologram. The 3D object is not only recorded in 2D, it is recorded redundantly!"
The post recounts that Pastawski and Beni Yoshida had this thought while listening to a Harlow seminar on the Almheiri-Dong-Harlow paper, and describes the relevant "cleaning lemma" from quantum information theory as "a quantitative analog of reconstructing the 3D image from pieces of the hologram."
It also quotes John Preskill, from 1999, making the same point in advance of the formal machinery: "I feel that the idea of holography has a strong whiff of entanglement -- for we have seen that in a profoundly entangled state the amount of information stored locally in the microscopic degrees of freedom can be far less than we would naively expect."

For a mainstream secondary source, Natalie Wolchover's "How Space and Time Could Be a Quantum Error-Correcting Code" (Quanta Magazine, 3 January 2019) states the same threshold fact in accessible terms: "any point in the interior of AdS space could be constructed from slightly more than half of the boundary -- just as in an optimal quantum error-correcting code."
Harlow's own "TASI Lectures on the Emergence of Bulk Physics in AdS/CFT" (arXiv:1802.01040) is the standard graduate-level review of bulk reconstruction and the error-correction interpretation; it stays in the technical CFT/QEC register throughout and does not itself reach for the optical-hologram-fragment picture.

## 5. Where the optical analogy holds, and where it breaks

The single best primary source I found for stating precisely where the "hologram" analogy is apt, and where it is not, is Bousso's own review.

**Bousso, "The Holographic Principle" (2002, Rev. Mod. Phys. 74, 825, arXiv:hep-th/0203101)** puts it this way: "[The principle] dictates that all physics in a region of space is described by data that fit on its boundary surface, at one bit per Planck area... This is reminiscent of a hologram. Holography is an optical technology by which a three-dimensional image is stored on a two-dimensional surface via a diffraction pattern... From the present point of view, the analogy has proven particularly apt. In both kinds of 'holography', light rays play a key role for the imaging... Moreover, the holographic code is not a straightforward projection, as in ordinary photography; its relation to the three-dimensional image is rather complicated."
Bousso then attributes the coinage directly: "Susskind's (1995) quip that the world is a 'hologram' is justified by the existence of preferred surfaces in spacetime, on which all of the information in the universe can be stored at no more than one bit per Planck area."
Two things are worth separating out of that passage, because they carry different weight.
First, the analogy holds specifically because light rays -- null geodesics -- do the actual imaging work on both sides: light-sheets in the gravitational case, recorded light in the optical case.
This is not decorative; it is the same geometric object doing the same job in both settings.
Second, Bousso is explicit that the boundary encoding is "not a straightforward projection... rather complicated" -- which is the formal-review version of the informal "nonlocal and scrambled" language that later became common shorthand, without Bousso himself using the words "scrambled" or "fringes."
He treats this as a linguistic remark bracketed off from the technical argument, not a claim he wants stretched into a load-bearing physical statement beyond that one qualitative point.

I was not able to locate a direct quotation, in any primary source, of the specific phrase "the boundary description is nonlocal and scrambled, like an actual hologram's fringes."
The closest formal statement is Bousso's "not a straightforward projection... rather complicated"; the closest informal statement is Pastawski's 2015 blog post.
If the precise wording matters for later work, Susskind's own lecture transcripts and popular books -- *The Black Hole War* (2008) in particular -- would be the next place to check, along with the Bigatti-Susskind "TASI Lectures on the Holographic Principle" (2000, arXiv:hep-th/0002044).
Bekenstein's own popular account, "Information in the Holographic Universe" (Scientific American, April 2007), uses the optical hologram purely as a general-audience metaphor and does not engage the fringes/scrambling/limits question at all.

## How a real optical hologram actually works

It is worth being precise about the real optics, since it is exactly this mechanism that both Bousso's "rather complicated" and the AdS/CFT bulk-reconstruction literature are the quantitative analogue of.
In an actual Leith-Upatnieks-type optical hologram, the recording film captures an interference pattern between a reference beam and light scattered from *every* point of the object.
Light from any single point of the object therefore reaches, and is recorded across, essentially the entire film surface, and any single point on the film has received contributions from every point of the object.
This is precisely why a broken shard of a real hologram reconstructs the whole image, at lower resolution, rather than showing only "its corner" of the scene -- the encoding on the two-dimensional surface is genuinely delocalized relative to the three-dimensional object, not a point-to-point projection the way an ordinary photograph is.
A bulk-local operator in AdS/CFT is dual to a highly smeared, non-local sum of boundary CFT operators in exactly the same structural sense, and only a sufficiently large boundary region contains enough of that sum to reconstruct it -- the HaPPY code's "more than half" threshold is the discretized, formalized version of "a sufficiently large portion of the hologram."

## Connections to other parts of the estate

A few links worth keeping in mind for future notes, rather than developed here.

The mineralogy material on opal color is a useful *contrast* rather than a mechanism match: real opals produce structural color via a three-dimensional lattice of silica spheres diffracting light, which is a photonic-crystal effect from bulk three-dimensional order, not an interference recording on a two-dimensional surface the way a hologram is -- both are cases of "ordered microstructure encoding macroscopic information redundantly," but the mechanisms are genuinely different and should not be conflated.

The measurement-theory material has a closer structural link: the holographic principle is fundamentally a statement about the maximum information, or measurement resolution, obtainable about a spatial region -- one bit per Planck area -- which is a physical upper bound on distinguishability, analogous to how a hologram's finite fringe density sets its image resolution.

The quantum-error-correction picture in section 4 is also, structurally, a statement about which sub-algebras of boundary operators can "see" which bulk regions, with entanglement wedges as the domain of reconstructability -- this sits close to topos-theoretic local-versus-global sections and sheaf-style restriction and gluing, and the "operator algebra quantum error correction" framing (Beny-Kempf-Kribs) is itself already an algebraic and categorical formalism, worth a dedicated cross-link if that material gets written up.

Every source in this note explicitly builds on and extends the [Bekenstein-Hawking entropy](./black-hole-thermodynamics.md) already covered in this section: the Ryu-Takayanagi formula is the Bekenstein-Hawking formula generalized to the entanglement entropy of a boundary subregion, and Bousso's covariant bound reduces to the ordinary Bekenstein bound in the weak-gravity limit.
That relationship should be cross-linked wherever these notes get referenced elsewhere, rather than re-derived.

Finally, the HaPPY code's $(n, 2n-1)$ quantum-secret-sharing threshold scheme is a clean, precisely citable, formal instance of "redundant" or "holographic" information encoding that could anchor a general notes-page on redundancy and erasure coding, independent of the gravitational physics it originated in.

## Why this matters

The word "hologram" in "holographic principle" is not decoration.
't Hooft and Susskind reached for it because a real optical hologram does something specific and unusual: it stores a three-dimensional scene on a two-dimensional surface in a way that is genuinely non-local, so that any sufficiently large fragment recovers the whole.
Bousso's covariant bound and Maldacena's AdS/CFT correspondence turned that reach into, respectively, a precise inequality and a concrete computable example; Ryu-Takayanagi turned the inequality into a formula for the entanglement entropy of an arbitrary boundary piece; and the Almheiri-Dong-Harlow and HaPPY results turned the "fragment reconstructs the whole" intuition into an actual theorem about quantum error-correcting codes, with a sharp threshold rather than a vague blurriness.
The analogy holds where light rays -- null geodesics on one side, recorded light on the other -- are doing the same geometric job of defining the encoding surface.
It is not a naive projection on either side, and the honest, well-sourced version of that caveat is Bousso's "rather complicated," not an unsourced claim about fringes and scrambling.

## Sources

- 't Hooft, G. "Dimensional Reduction in Quantum Gravity." arXiv:gr-qc/9310026 (1993). https://arxiv.org/abs/gr-qc/9310026
- Susskind, L. "The World as a Hologram." *Journal of Mathematical Physics* 36, 6377-6396 (1995). arXiv:hep-th/9409089. https://arxiv.org/abs/hep-th/9409089 -- full text verified locally via `pdftotext`.
- Bousso, R. "A Covariant Entropy Conjecture." arXiv:hep-th/9905177 (1999). https://arxiv.org/abs/hep-th/9905177
- Maldacena, J. "The Large N Limit of Superconformal Field Theories and Supergravity." arXiv:hep-th/9711200 (1997). https://arxiv.org/abs/hep-th/9711200
- Ryu, S. and Takayanagi, T. "Holographic Derivation of Entanglement Entropy from AdS/CFT." *Physical Review Letters* 96, 181602 (2006). arXiv:hep-th/0603001. https://arxiv.org/abs/hep-th/0603001 -- formula verified verbatim via local `pdftotext` extraction.
- Almheiri, A., Dong, X., and Harlow, D. "Bulk Locality and Quantum Error Correction in AdS/CFT." *JHEP* 1504, 163 (2015). arXiv:1411.7041. https://arxiv.org/abs/1411.7041
- Pastawski, F., Yoshida, B., Harlow, D., and Preskill, J. "Holographic quantum error-correcting codes: Toy models for the bulk/boundary correspondence." *JHEP* 06, 149 (2015). arXiv:1503.06237. https://arxiv.org/abs/1503.06237
- Bousso, R. "The Holographic Principle." *Reviews of Modern Physics* 74, 825-874 (2002). arXiv:hep-th/0203101. https://arxiv.org/abs/hep-th/0203101 -- highest-reliability source for the analogy holds/breaks point.
- Pastawski, F. "Putting back the pieces of a broken hologram." *Quantum Frontiers*, 25 March 2015. https://quantumfrontiers.com/2015/03/25/putting-back-the-pieces-of-a-broken-hologram/
- Wolchover, N. "How Space and Time Could Be a Quantum Error-Correcting Code." *Quanta Magazine*, 3 January 2019. https://www.quantamagazine.org/how-space-and-time-could-be-a-quantum-error-correcting-code-20190103/
- Bekenstein, J. D. "Information in the Holographic Universe." *Scientific American*, April 2007. https://www.scientificamerican.com/article/information-in-the-holographic-univ/
- Bigatti, D. and Susskind, L. "TASI Lectures on the Holographic Principle." arXiv:hep-th/0002044 (2000). https://arxiv.org/abs/hep-th/0002044
- Harlow, D. "TASI Lectures on the Emergence of Bulk Physics in AdS/CFT." arXiv:1802.01040. https://arxiv.org/abs/1802.01040

## Open questions

- Where did the specific phrase "the boundary description is nonlocal and scrambled, like an actual hologram's fringes" actually originate? It was not located as a direct quotation in any primary source checked here; the closest formal statement is Bousso's "not a straightforward projection... rather complicated," and the closest informal statement is Pastawski's 2015 blog post. Worth a targeted search of Susskind's lecture transcripts and books (*The Black Hole War*, 2008) if the precise wording turns out to matter.
- Is there a citable, peer-reviewed (rather than blog or magazine) source that draws the "broken hologram fragment" analogy explicitly in print?
- The covariant HRT generalization of Ryu-Takayanagi (2007) and later quantum-corrected versions (Faulkner-Lewkowycz-Maldacena quantum extremal surfaces, Engelhardt-Wall) were only mentioned in passing here, since they postdate the 2006 RT result this note centers on -- worth a follow-up note if the estate's holography study continues.
