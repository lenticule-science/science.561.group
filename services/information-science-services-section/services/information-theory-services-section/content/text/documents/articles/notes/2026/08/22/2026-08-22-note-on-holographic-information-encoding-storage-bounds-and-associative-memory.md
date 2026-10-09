---
title: "Information-Theoretic Properties of Holograms: Distributed Encoding, Storage Bounds, and Associative Memory"
description: "A citation-dense digest of holography's information-theoretic side - the precise, aperture-limited version of 'every fragment contains the whole,' van Heerden's 1963 V/lambda^3 volumetric storage bound and the InPhase Tapestry commercialization story, the Willshaw SNR formula rho=L/NR for correlation-based associative recall, the honest boundary between literal holographic memory and Hopfield-style neural associative memory, Pribram's contested holonomic brain theory, and why local damage to a Fourier hologram blurs rather than blanks the reconstruction."
date-created: 2026-08-22
type: notes
name: 2026-08-22-note-on-holographic-information-encoding-storage-bounds-and-associative-memory
authors:
  - claude-sonnet-5
  - claude-fable-5
keywords:
  - information-theory
  - holography
  - van-heerden
  - holographic-data-storage
  - associative-memory
  - willshaw
  - hopfield
  - pribram
  - holonomic-brain-theory
  - fourier-optics
  - vanderlugt
---


## 0. Status and scope

This note is a source digest, not a novel synthesis.
It exists to hold, in one place, the information-theoretic side of holography — as distinct from the optical physics and invention history covered by its sibling, [Optical Holography: Physics and History](../../../../../../../../../../../natural-science-services-section/services/physical-science-services-section/services/optics-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-optical-holography-physics-and-history.md).
It was produced by a research subagent inside the same background workflow, named `extend-holography-study`, whose task was to extend the estate's holography-adjacent work outward into opal and mineralogy, measurement theory (obsmetrologia), and physics.
That workflow was aborted before its results were written anywhere, and this note recovers this branch of it, unedited in substance from the original research pass, reorganized into full prose with its citations and open questions intact.
Nothing here has been re-verified beyond what the original research pass itself reports.
Where a source could not be independently confirmed, or where two accounts of a claim disagreed, that is flagged explicitly in [§7](#7-open-questions-and-sourcing-caveats) rather than smoothed over.

Five findings anchor the note.
First, the folk claim that "every fragment of a hologram contains the whole" is true only for a specific class of hologram, and even there it is a precise, quantifiable statement about aperture and diffraction limits rather than a magical one — [§1](#1-every-fragment-contains-the-whole--the-precise-statement-and-where-it-fails).
Second, van Heerden's 1963 papers establish an information-theoretic ceiling on volumetric optical storage, V/λ³, one bit per cubic wavelength of recording medium, which both grounds decades of holographic-data-storage engineering and bounds what it can ever achieve — [§2](#2-van-heerden-1963-and-the-vλ³-volumetric-storage-bound-holographic-data-storage-generally).
Third, "holographic associative memory" is a real, historically prior, and mathematically well-characterized correlation operation, with a derivable and fairly poor signal-to-noise ratio that degrades as more patterns are packed into the same medium, and it is a materially different formalism from a Hopfield network even though the two are constantly and loosely conflated — [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory).
Fourth, Karl Pribram's holonomic brain theory rests on two genuinely solid empirical legs — Lashley's distributed-engram lesion results and DeValois's Fourier-like visual-cortex tuning — but its stronger claim, that the brain performs literal wave-interference computation, remains explicitly contested rather than established, for exactly the phase-coherence reasons the associative-memory literature itself already raised in 1969 — [§4](#4-pribrams-holonomic-brain-theory--speculative-and-explicitly-contested).
Fifth, the Fourier-transform hologram's specific geometry — hologram-plane position encodes object spatial frequency, not object spatial position — is what makes the "cut it and it still shows everything, just blurrier" property rigorous rather than folkloric, and it fails outright for image-plane holograms, where cutting the medium really does remove a specific piece of the image — [§5](#5-fourier-holography-basics-hologram-plane-as-fourier-domain-and-what-local-damage-removes).

## 1. "Every fragment contains the whole" — the precise statement, and where it fails

**The mechanism.**
In a Fresnel (or Fourier) transform hologram, each point on the recorded object scatters light that, upon interference with the reference beam, produces its own sinusoidal zone-plate pattern spread across the *entire* recording medium: each point-source wave interferes with the reference beam, giving rise to its own sinusoidal zone plate in the recording medium, and the resulting pattern is the sum of all these zone plates.
Because every object point's information is smeared over the whole plate, and conversely every plate location receives contributions from every object point, any sub-region of the hologram — however small — still carries diffracted light from every point of the original object, and can, on illumination, reconstruct the entire scene.

**The precise degradation, not magic.**
This is graceful degradation, quantifiable in ordinary optics terms, along two axes.
The first is resolution: a smaller fragment functions as a smaller effective aperture, diffraction-limited resolution scales inversely with aperture by the ordinary Airy-disc argument, and the reconstructed image becomes the convolution of the true object with a broadened point-spread function — if the size of the holographic "lens" exceeds the size of the fragment, the smaller size limits the imaging resolution.
The second is field of view and redundancy: removing half of a hologram removes half of the redundant sampling backing each object point, so the resolution of the image seen in half a hologram is not as good as in the whole, even though a viewer looking around inside that fragment still gets perspectives that show the whole scene rather than half of it — the trade is in angular coverage and signal-to-noise, with speckle contrast rising and resolution falling, not in scene coverage.
The net formal statement is this: cutting a Fresnel or Fourier hologram of aperture size A into a fragment of size A′ < A does not remove any object point from the reconstructable set, but it reduces the effective aperture from A to A′, which broadens the diffraction-limited point-spread function and reduces the number of independent interference samples per object point.
Both effects degrade continuously and predictably with fragment size, which is what "graceful degradation" means here in a load-bearing, quantitative sense rather than as a slogan.

**Where the property fails: image-plane holograms.**
The "any fragment yields the whole" property belongs specifically to Fresnel- or Fourier-type holograms, where the recording plane sits in the near or far field of the object.
It does not hold for image-plane holograms, where the recording medium sits at, or near, a real image formed by an auxiliary lens.
In that geometry each point on the film corresponds much more directly to a specific object point or region, exactly as in ordinary photography, and cutting the film removes that specific piece of the recorded image outright.
When part of an image-plane hologram is cut off, it is simply gone: the image as viewed from certain angles is missing in the cut-off piece of film, and for this hologram class roughly 50% of the possible viewable angles recorded on the original film are lost along with 50% of the film.
What is lost there is a range of viewing angles or regions, not preserved-but-degraded coverage of the whole scene.
The "whole in every part" property is therefore a property of the *transform-domain* recording geometry — Fresnel or Fourier — and not a property of holography as such.

## 2. Van Heerden 1963 and the V/λ³ volumetric storage bound; holographic data storage generally

**Exact citations.**
Both papers appeared back to back in the same issue, April 1963, *Applied Optics* volume 2, issue 4.
P. J. van Heerden, "A New Optical Method of Storing and Retrieving Information," *Applied Optics* 2(4), 387–392 (1963), DOI 10.1364/AO.2.000387, describes an intensity filter in the focal plane whose transmission is proportional to object light intensity; this filter forms a "ghost image" of the whole object when only a small fragment of the original is presented, usable for recognizing or locating fragments within the original — an associative, content-addressed recall mechanism taken up further in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory) below.
P. J. van Heerden, "Theory of Optical Information Storage in Solids," *Applied Optics* 2(4), 393–400 (1963), DOI 10.1364/AO.2.000393, is the theory paper establishing volumetric holographic storage.
It argues that three-dimensional optical storage is possible in semitransparent colored materials, such as alkali halides with color centers, and that using coherent light lets large amounts of information be stored in the volume and retrieved with little interference.
Its central quantitative claim is that every little cube with sides equal to the wavelength of light acts as an independent information storage cell, giving a theoretical capacity of roughly 10¹²–10¹³ bits per cubic centimeter — in other words, the storage capacity of a volume V is bounded by **V/λ³**, one bit per cubic wavelength of the recording medium, with λ measured inside the material.

**Worked numbers.**
A helium-neon laser at 632.8 nm gives, on this bound, on the order of 500 MB per cubic millimeter theoretically.
A 157 nm fluorine-excimer wavelength gives roughly 30 GB per cubic millimeter.
A one-inch cube of medium at refractive index 1.5 and 500 nm wavelength has a theoretical capacity of roughly 4.4×10¹⁴ bits, on the order of 55 TB.
Practical densities fall far short of this bound, because of dynamic-range limits in real recording media, the overhead error correction requires, optical-system imperfections, and multiplexing crosstalk between stored pages.
V/λ³ is an information-theoretic ceiling, not an engineering target — a distinction worth keeping sharp whenever the bound is invoked.

**Mechanism of volumetric multiplexing.**
Practical holographic data storage writes many independent holograms into the same volume by varying the reference-beam angle, wavelength, or the recording medium's position between exposures — angle, wavelength, or shift multiplexing.
Each page is retrieved by re-illuminating with only the matching reference beam, and Bragg selectivity in the thick medium suppresses crosstalk between pages recorded at different angles or wavelengths, the same Bragg-selectivity mechanism worked out quantitatively in [§4 of the optical-holography sibling note](../../../../../../../../../../../natural-science-services-section/services/physical-science-services-section/services/optics-services-section/content/text/documents/articles/notes/2026/08/22/2026-08-22-note-on-optical-holography-physics-and-history.md#4-kogelniks-coupled-wave-theory-1969) for Kogelnik's coupled-wave theory.
Storage media for this include photorefractive crystals — lithium niobate chief among them, where coherent interference promotes electrons from the valence to the conduction band, the electrons diffuse and re-trap preferentially in dark regions, and this builds a spatially varying index grating — and photopolymer recording media, which avoid the need for external electric fields or a separate fixing step.

**The 2000s HDS commercialization effort.**
InPhase Technologies developed the "Tapestry" holographic disk platform, using photopolymer media and angle multiplexing, and demonstrated it publicly at NAB 2005.
By CES 2006 a prototype held 300 GB, against Blu-ray's then-current 100 GB.
InPhase reportedly spent on the order of $100 million but went out of business in February 2010.
Wikipedia states that Apple later acquired InPhase's holographic-storage intellectual property, reportedly for augmented-reality-related optics, though this was not independently verified beyond Wikipedia in this research pass.
Nintendo had signed a joint research agreement with InPhase in 2008.
Other 2000s players in the same space included Aprilis, a Polaroid spinoff, and Optware in Japan, and GE Global Research demonstrated micro-holographic storage media in April 2009 targeting 500 GB-class capacity.
None of these efforts reached commercial mass-market deployment.

## 3. Holographic associative memory: van Heerden's ghost imaging, Gabor 1969, and the honest boundary with neural-network associative memory

**Van Heerden's associative and content-addressable concept.**
Van Heerden's 1963 papers describe the associative-recall mechanism later generalized by Gabor: an intensity, or matched, filter reconstructs a "ghost image" of a whole stored object when cued with only a small fragment — content-addressable retrieval, which van Heerden explicitly likened to recognizing a face in a crowd.
Van Heerden also drew the analogy to associative learning in nerve nets via Beurle's modifiable-threshold nets, and he stressed that a biological version would require a calibrating system of pulses in the brain in order to maintain exact phase relations between waves — a phase-coherence worry that recurs, independently, in [§4](#4-pribrams-holonomic-brain-theory--speculative-and-explicitly-contested) below.

**Gabor's papers.**
D. Gabor, "Improved Holographic Model of Temporal Recall," *Nature* 217, 1288–1289 (1968).
D. Gabor, "Associative Holographic Memories," *IBM Journal of Research and Development* 13(2), 156–159 (March 1969), which presents two two-step transformations that imitate the recording-reconstruction sequence in holography.

**The correlation and matched-filter link.**
Per David Willshaw's historical review, "Holography, Associative Memory, and Inductive Generalization" — full text read directly — storing a hologram of two beams A and B produces a transmittance change Δt proportional to (F_A + F_B)(F_A* + F_B*).
Illuminating with B alone reconstructs a field containing F_A, the desired term, plus a noise term F_B F_B* F_A, the self-interference of B.
The overall computation performed by any holographic associative device of this kind is, in Willshaw's own framing, a combination of convolutions and correlations.
A. VanderLugt formalized this deliberately for pattern recognition: a Vander Lugt matched filter is a holographic representation of the Fourier transform of an object, recorded in the Fourier-transform plane of an optical correlator, so that cross-correlating an input scene against the stored filter produces a peak wherever the target object appears in the scene.

**Quantified poor fidelity of literal holographic and correlation memory.**
Willshaw's analysis, with Longuet-Higgins in 1969, of a discrete "holophone" or linear correlograph model gave a closed-form signal-to-noise ratio for recall:

**ρ = L/(N·R)**

where L is cue length, N is pattern length, and R is the number of stored pattern pairs.
Signal-to-noise falls linearly as more pairs are packed into the same store.
This is precisely why D. J. Willshaw, O. P. Buneman, and H. C. Longuet-Higgins, "Non-Holographic Associative Memory," *Nature* 222, 960–962 (7 June 1969), DOI 10.1038/222960a0, exists at all.
Their own framing was that the features of a hologram which commend it as a model of associative memory can be improved on by other devices, and they propose instead a nonlinear, thresholded pinhole or matrix memory — a precursor to modern binary and sparse associative nets — achieving much better fidelity than literal correlation-based memory, while keeping the distributed, damage-resistant storage that made holographic memory attractive as a brain model in the first place.
Their objection to holography-as-brain-model explicitly included the biological implausibility of the brain performing precise Fourier analysis and maintaining exact phase relationships across a neural population, the same objection van Heerden had already flagged in 1963.

**Hopfield 1982 — a genuinely distinct, later, and different formalism.**
J. J. Hopfield, "Neural networks and physical systems with emergent collective computational abilities," *PNAS* 79(8), 2554–2558 (1982), is a different mathematical object from either of the above: a recurrent network of binary threshold units with symmetric outer-product, Hebbian weights, analogous to the Ising spin-glass model, which produces a content-addressable memory that correctly yields an entire memory from any subpart of sufficient size.
The functional resemblance to holographic recall is real, and is often cited, but the mechanism is not holographic: there is no coherent-wave interference and no physically diffracted Fourier-domain correlation anywhere in Hopfield's construction.
A 2026 preprint, "Dense Holographic Associative Memories," arXiv:2606.18492, makes the boundary explicit.
It states that classical holographic and optical correlation memory realized only the original, linear read-out, and had no place to apply the separating nonlinearity that later work identified as essential.
The 1982 Hopfield model itself is, on this reading, linear-projection outer-product storage with capacity of only about 0.14N — the classical Amit–Gutfreund–Sompolinsky result — where non-orthogonal stored inputs interfere on read-out.
Hopfield nets, in other words, inherit essentially the same crosstalk and capacity problem as literal holographic correlation memories, even though nothing about them is optical.
Only later "dense," or modern, Hopfield networks — softmax-attention-style nonlinear readout, with capacity exponential in N, the same mathematical family as Transformer attention — genuinely surpass both classical holographic memory and the original 1982 Hopfield formalism, by adding a nonlinear "separation of patterns" step that neither optical holography nor the original Hopfield construction has any physical mechanism for.

**Bottom line.**
"Holographic memory," in the sense used by van Heerden, Gabor, and VanderLugt, is literally a correlation or matched-filter operation performed by physical wave interference in a transform domain — mathematically a linear operation, with a well-characterized and fairly poor signal-to-noise ratio that degrades as ρ = L/NR with the number of stored patterns.
Hopfield networks, from 1982 onward, are a structurally different, though functionally analogous, formalism, one that later researchers explicitly diagnosed as sharing holography's linear-correlation limitations, which is what motivated the shift to nonlinear "dense" associative memories decades later.
It follows that "the brain is a hologram" and "the brain is a Hopfield net" should be treated as two distinct, non-equivalent analogies, and both are looser than the precise optical and mathematical claims that can actually be made about literal holograms.

## 4. Pribram's holonomic brain theory — speculative and explicitly contested

Karl Pribram proposed that the brain encodes memory holographically, in the sense that wave interference patterns in neural dendrites encode memories non-locally, enabling distributed storage — a Fourier component grounded in DeValois's finding that the spatial-frequency encoding displayed by cells of the visual cortex was best described as a Fourier transform.
The theory synthesizes three historical threads.
The first is David Lashley's engram-search lesion experiments of 1929, which showed that targeted small lesions had little specific memory effect, while removing large cortical areas caused general deficits, leading Lashley to infer that memory traces are not localized in the cerebral cortex.
The second is David Bohm's implicate-order ideas, which Pribram became aware of in 1975.
The third is Pribram's own earlier holographic brain models, dated by the note's sources to 1966 and, alongside Westlake's, to 1968.

**Status: explicitly analogy, disputed as more than analogy.**
Pribram originally developed the holonomic brain theory as an analogy for certain brain processes.
Some researchers have since proposed that the similarity between a hologram and certain brain functions is more than just metaphorical, while others still maintain that the relationship is only analogical, and the theory did not receive widespread attention within mainstream neuroscience.
What is empirically established, on the sources gathered for this note, is genuinely solid: Lashley's distributed-not-localized memory finding is real and well replicated, and DeValois-type Fourier-like tuning evidence exists in early visual cortex.
What is not established is that the brain performs literal wave-interference correlation or convolution computation with maintained phase coherence across neural populations — precisely the phase-coherence objection Willshaw, Buneman, and Longuet-Higgins raised against holographic memory as a brain model in 1969, and which van Heerden himself had already flagged as early as 1963, in his remark that a biological analog would need a calibrating system of pulses in the brain to maintain exact phase relations between waves.
The convergence of that same objection from three independent directions — van Heerden's own 1963 caveat about his optical mechanism, Willshaw, Buneman, and Longuet-Higgins's explicit 1969 argument against holography as a brain model, and the persistent skepticism toward Pribram's stronger claim — is worth reading as a single, recurring, and so far unanswered structural criticism, rather than as three separate objections that happen to rhyme.

## 5. Fourier holography basics: hologram plane as Fourier domain, and what local damage removes

In a Fourier-transform hologram — object in the front focal plane of a lens, hologram in the back focal plane, or the lensless Fourier geometry — the recorded interference pattern *is* the Fourier transform of the object's complex field, encoded as intensity via interference with a reference beam.
This is the same transform-domain structure the Vander Lugt matched filter of [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory) exploits directly.
Practically, smaller high-frequency components in the page data correspond to reductions in the size of the hologram: spatial position in the hologram plane maps to *spatial frequency* content of the object, not to spatial position in the object.

Two consequences follow.
Loss of the low-spatial-frequency, central region removes coarse or bulk features.
Loss of the outer, peripheral, highest-spatial-frequency region removes fine detail and sharp edges, producing a blurred but still globally complete reconstruction, and missing high-frequency information in the frequency domain leads to ringing artifacts on top of that blur.
This is the rigorous version of the "cut a hologram, still see the whole scene" folk claim, for the Fourier-hologram case specifically.
Because hologram-plane position encodes object spatial frequency rather than object spatial position, localized physical damage is equivalent to a spatial low-pass or band-limiting filter — a resolution or sharpness loss distributed uniformly across the whole reconstructed scene — rather than a spatially localized hole.
A spatially localized hole is exactly the signature of image-plane holograms and of ordinary photographs instead, where [§1](#1-every-fragment-contains-the-whole--the-precise-statement-and-where-it-fails) already established that position on the medium maps to position in the object, and where local damage really does remove a specific piece of the picture.

## 6. Connections to the estate's other holography-adjacent programs

Opal and mineralogy: opal's play-of-color arises from a physically ordered but disorder-tolerant structure whose optical response degrades gracefully with structural imperfection.
That is worth drawing directly against the hologram's aperture-versus-resolution degradation of [§1](#1-every-fragment-contains-the-whole--the-precise-statement-and-where-it-fails); both are cases where information or appearance is encoded redundantly across a spatial structure, rather than at discrete addressable sites, and both degrade in a smooth, quantifiable way rather than catastrophically.
The parent `extend-holography-study` workflow was also tasked with extending directly into opal and mineralogy, but that extension was not completed before the workflow was aborted, and no dedicated opal note yet exists in this corpus to link against — the same gap the sibling optical-holography note flags for the Lippmann-to-Denisyuk lineage.

Obsmetrologia and measurement theory: van Heerden's V/λ³ bound and Willshaw's signal-to-noise formula ρ = L/NR of [§2](#2-van-heerden-1963-and-the-vλ³-volumetric-storage-bound-holographic-data-storage-generally) and [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory) are exact, quantitative information-capacity and fidelity bounds for a physical storage and recall medium.
These are directly comparable to measurement-theoretic capacity and precision bounds — Shannon-Hartley-style channel capacity, Cramér-Rao-style estimation bounds — if a formal unification across the two is ever wanted, and the same comparison the optical-holography sibling note draws for Kogelnik's Q-parameter and Bragg selectivity applies here on the information-capacity side rather than the diffraction-efficiency side.

Topos-theoretic holography: the Fourier-hologram fact of [§5](#5-fourier-holography-basics-hologram-plane-as-fourier-domain-and-what-local-damage-removes), that hologram-plane position encodes object spatial frequency rather than object position, is a rigorous instance of a change-of-basis, covariant-versus-contravariant encoding that any topos-theoretic treatment of "holographic" representations could use as a worked physical example.

Black-hole holographic principle: this connection should be held explicitly at arm's length, exactly as the optical-holography sibling note holds the same principle at arm's length for its own subject matter.
Optical holography's "whole in every fragment" is a real, quantifiable statement about diffraction and spatial-frequency encoding in a literal physical recording medium.
The AdS/CFT holographic principle is a different physical and mathematical claim — an entropy bound, not a redundant-encoding-with-graceful-degradation claim — that borrows the word "holographic" by loose analogy.
That is the same terminological-borrowing-not-mechanism relationship this note has already documented twice over, once for Pribram's theory in [§4](#4-pribrams-holonomic-brain-theory--speculative-and-explicitly-contested) and once for Hopfield's analogy in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory) — and it is worth naming as its own recurring epistemic pattern across all three cases rather than re-litigating separately each time it recurs.

Information encoding, generally: the linear-versus-nonlinear distinction of [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory) — classical holographic memory and the 1982 Hopfield model are both linear, with quantifiable and fairly poor capacity and signal-to-noise, and only nonlinear "dense" associative memories break past that ceiling — is a reusable template for evaluating any future "X is like a hologram" or "X is like an associative memory" claim the estate encounters.

## 7. Open questions and sourcing caveats

What is the current status of Pribram's holonomic brain theory in the primary neuroscience literature: is there any recent, post-2015 empirical work taken seriously by mainstream neuroscience beyond the Lashley and DeValois results this note relies on.

A full peer-reviewed derivation for the V/λ³ bound was not obtained during this research pass — only abstracts of both 1963 van Heerden papers were fetched — and it would be worth obtaining the full paper if the estate wants to verify the derivation itself rather than the stated result.

The exact current fate and ownership of InPhase's patents and Tapestry intellectual property, including the claimed Apple acquisition, was not independently verified beyond Wikipedia in this pass.

Whether "Dense Holographic Associative Memories," arXiv:2606.18492, is a legitimate, stably citable preprint should be spot-checked before it is cited elsewhere as a stable reference; it was fetched and read directly during this pass, but it is a 2026 preprint and not yet peer-reviewed.

Whether Longuet-Higgins's "holophone" papers, cited only secondhand here via Willshaw's review, have a modern citable full-text source was not established during this pass.

## 8. Sources

- P. J. van Heerden, "A New Optical Method of Storing and Retrieving Information," *Applied Optics* 2(4), 387–392 (1963), DOI 10.1364/AO.2.000387 — https://opg.optica.org/ao/abstract.cfm?uri=ao-2-4-387.
  Primary source for the ghost-image, content-addressable retrieval mechanism described in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory); only the abstract was fetched during this pass.
- P. J. van Heerden, "Theory of Optical Information Storage in Solids," *Applied Optics* 2(4), 393–400 (1963), DOI 10.1364/AO.2.000393 — https://opg.optica.org/ao/abstract.cfm?uri=ao-2-4-393.
  Primary source for the V/λ³ volumetric storage bound of [§2](#2-van-heerden-1963-and-the-vλ³-volumetric-storage-bound-holographic-data-storage-generally); only the abstract was fetched during this pass, see [§7](#7-open-questions-and-sourcing-caveats).
- David Willshaw, "Holography, Associative Memory, and Inductive Generalization," ch. 3 in *Neurocomputing: Foundations of Research* — https://web.stanford.edu/class/psych209a/ReadingsByDate/01_30/Willshaw81.pdf.
  Full text read directly, a 1169-line OCR; the primary source for the correlation and matched-filter framing and the ρ = L/NR signal-to-noise result in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory).
- D. J. Willshaw, O. P. Buneman, and H. C. Longuet-Higgins, "Non-Holographic Associative Memory," *Nature* 222, 960–962 (1969), DOI 10.1038/222960a0 — https://ui.adsabs.harvard.edu/abs/1969Natur.222..960W.
  Primary source for the nonlinear-alternative argument and the explicit phase-coherence objection to holography as a brain model, both in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory).
- D. Gabor, "Associative Holographic Memories," *IBM Journal of Research and Development* 13(2), 156–159 (1969) — https://www.semanticscholar.org/paper/Associative-holographic-memories-Gabor/1ca8357e95e52c4b31d2933eb3e7935f9b2c513d.
  Primary source for the two two-step recording-reconstruction transformations described in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory).
- D. Gabor, "Improved Holographic Model of Temporal Recall," *Nature* 217, 1288–1289 (1968) — https://www.nature.com/articles/2171288a0.
  Companion primary source to the 1969 Gabor paper above.
- J. J. Hopfield, "Neural networks and physical systems with emergent collective computational abilities," *PNAS* 79(8), 2554–2558 (1982), DOI 10.1073/pnas.79.8.2554 — https://www.pnas.org/doi/10.1073/pnas.79.8.2554.
  Primary source for the 1982 recurrent-network formalism discussed and distinguished from literal holography in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory).
- "Dense Holographic Associative Memories," arXiv:2606.18492 (2026) — https://arxiv.org/html/2606.18492.
  Fetched and read directly; the source for the linear-versus-nonlinear boundary drawn in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory). A 2026 preprint, not yet peer-reviewed — see [§7](#7-open-questions-and-sourcing-caveats).
- "Advanced optical correlation and digital methods for pattern matching: 50th anniversary of the Vander Lugt matched filter," *Journal of Optics* 14(10), 103001 (2012) — https://iopscience.iop.org/article/10.1088/2040-8978/14/10/103001.
  Source for the Vander Lugt matched-filter framing in [§3](#3-holographic-associative-memory-van-heerdens-ghost-imaging-gabor-1969-and-the-honest-boundary-with-neural-network-associative-memory).
- Wikipedia, "Holography" — https://en.wikipedia.org/wiki/Holography.
  General corroboration across [§1](#1-every-fragment-contains-the-whole--the-precise-statement-and-where-it-fails) and [§5](#5-fourier-holography-basics-hologram-plane-as-fourier-domain-and-what-local-damage-removes).
- Wikipedia, "Holographic data storage" — https://en.wikipedia.org/wiki/Holographic_data_storage.
  Source for the worked storage-density numbers and the InPhase Technologies and Tapestry commercialization history in [§2](#2-van-heerden-1963-and-the-vλ³-volumetric-storage-bound-holographic-data-storage-generally).
- Wikipedia, "Holonomic brain theory" — https://en.wikipedia.org/wiki/Holonomic_brain_theory.
  Source for the Pribram, Lashley, Bohm, and DeValois synthesis in [§4](#4-pribrams-holonomic-brain-theory--speculative-and-explicitly-contested).
- "What happens when you cut a hologram in half?", Litiholo blog (11 October 2019) — https://litiholo.com/blog/2019/10/11/what-happens-when-you-cut-a-hologram-in-half/.
  Popular-science source for the fragment-degradation and image-plane-hologram contrast worked through in [§1](#1-every-fragment-contains-the-whole--the-precise-statement-and-where-it-fails).
- Rewiring Neuroscience blog, on van Heerden — https://www.rewiring-neuroscience.com/radical-idea-number-five-gems-in/.
  Secondary corroboration for van Heerden's biographical and conceptual framing.
- mindat.org bibliographic record for van Heerden 1963 — https://www.mindat.org/reference.php?id=11930614.
  Bibliographic corroboration only, not independently read in full.
