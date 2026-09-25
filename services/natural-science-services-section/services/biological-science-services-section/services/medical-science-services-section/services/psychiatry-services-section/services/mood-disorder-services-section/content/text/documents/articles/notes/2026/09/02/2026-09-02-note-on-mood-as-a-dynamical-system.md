---
title: "Mood as a Dynamical System"
description: "A survey of formal dynamical-systems models fitted to mood and symptom time series — critical slowing down, network-theory hysteresis, individual-level bimodality, single-subject early-warning studies, and EMA mood instability — with the statistical critique that most of this literature has not yet cleared, and a labeled house-theory correspondence to affect as the derivative of a stability reward."
date-created: 2026-09-02
type: research-note
in-service-of: lib/emsenn/services/561-group/services/science-services-section/services/natural-science-services-section/services/biological-science-services-section/services/medical-science-services-section/services/psychiatry-services-section/services/mood-disorder-services-section
name: note-on-mood-as-a-dynamical-system
keywords:
  - critical-slowing-down
  - early-warning-signal
  - mood-instability
  - hysteresis
  - bimodality
  - network-theory-of-mental-disorders
  - alternative-stable-states
  - ecological-momentary-assessment
tags:
  - draft
status: draft-for-iteration
authors:
  - Claude Fable
---

## What this argues

A body of published research treats mood — specifically, the transition into
and out of depressive and manic states — as the observable trace of a
dynamical system with more than one stable state, borrowing the mathematics
of bifurcations, hysteresis, and early-warning signals wholesale from
ecology and climate science. This note surveys that literature as it
actually stands, not as it is often summarized: a handful of positive
single-case and simulation results, sitting inside a much larger and less
flattering picture once the statistical critique literature (reviewed here
in the same depth as the positive claims) is read alongside it. Every model
described below is a statistic or a simulation fitted to self-reported mood
or symptom time series; none of it identifies a neural, hormonal, or other
physiological switch mechanism, and the note is explicit about that
boundary throughout. The note closes by setting this literature next to a
house-authored theoretical carrier that independently derives affect as the
time derivative of a stability reward, with precision modulating update
rate — stated there as a candidate correspondence worth testing against
this literature, not as an established finding.

## Why dynamical-systems language entered mood research at all

The motivating observation behind this literature, across nearly every
paper cited below, is that some people's depressive and manic episodes look
less like a dial turning gradually than like a switch: symptom counts,
subjective mood, or diagnostic status appear to move between two
qualitatively different regions with a jump, rather than by smooth drift
through every intermediate value. That observed pattern — abrupt movement
between states rather than continuous glide — is exactly the phenomenon
dynamical-systems theory was built to formalize for ecosystems (a lake
flipping between clear and turbid states) and for climate subsystems (an
ice sheet or ocean current flipping between circulation regimes). Borrowing
that mathematics for psychiatry is an analogy, made explicit and hedged by
its own originators, not an established transfer of validated machinery
from one domain to another.

Two adjacent house terms describe the clinical poles this literature is
implicitly trying to explain a switch between: [psychomotor
retardation](../../../../../../../../../../content/text/glossary/terms/psychomotor-retardation.md),
the objectively measurable slowing of movement and speech in a depressive
episode, and [psychomotor
agitation](../../../../../../../../../../content/text/glossary/terms/psychomotor-agitation.md)
together with [irritability](../../../../../../../../../irritability-services-section/content/text/glossary/terms/irritability.md),
the restless, low-threshold-for-anger presentation of an activated or manic
state. None of the dynamical-systems papers below measure psychomotor
retardation or agitation directly — they measure momentary self-reported
affect ratings or symptom checklists — so this note does not claim they
demonstrate a switch between those two specific clinical presentations. It
claims only that the two poles those terms describe are the kind of
qualitatively distinct states this literature is attempting to model
formally, and that the switch between them (rather than gradual drift) is
the pattern the dynamical-systems framework exists to describe if it
applies at all.

## Critical slowing down and early warning signals: already glossaried, briefly restated

The two most load-bearing constructs in this literature — critical
slowing down and the early-warning-signal framework built on it — already
have full house glossary treatments in this section, and this note does
not restate their content in detail; see [critical slowing
down](../../../../../../glossary/terms/critical-slowing-down.md) and [early
warning signal](../../../../../../glossary/terms/early-warning-signal.md)
for the primary numbers. In brief, for the synthesis that follows: van de
Leemput and colleagues (2014, PNAS) found that people who later transitioned
into or out of a depressive state showed higher baseline autocorrelation,
variance, and cross-emotion correlation in momentary mood ratings than
people who did not, across a 535-person general-population twin sample
(13.5% later diagnosed with MDD) and a 93-patient treatment-response
sample — but Bos and de Jonge's published critique (PNAS 2014) showed this
is a between-subject association from a single snapshot per person, not
demonstrated evidence of any individual's own autocorrelation rising as
they approach their own transition, and that a baseline-severity confound
cannot be ruled out. A single confirmatory within-subject case (Wichers,
Smit & Snippe 2020) did show autocorrelation and network-connectivity
trends rising in the month before one participant's own transition — but
the pooled 2024 systematic review of every published within-person
early-warning study to date (Helmich, Schreuder, Bringmann, Riese, Snippe &
Smit, *Nature Reviews Psychology*) found sensitivity commonly well under
50%, 0% in one 42-patient cohort, and its own conclusion stated plainly:
"there is little support for the use of early warning signals based on
critical slowing down in clinical psychology."

What this note adds to those two terms is everything the commission asks
for that they do not already carry: the network theory of mental disorders
and its hysteresis claim, individual-level bimodality in symptom time
series, a second population-level critique beyond Bos and de Jonge, mood
instability's own distinct evidentiary status (also already glossaried, so
handled briefly below), and the surrounding thread of nonlinear-dynamics
and catastrophe-theory work that is much thinner than the critical-slowing-down
line.

## Network theory of mental disorders: alternative stable states, and where hysteresis comes from

Borsboom's network theory of mental disorders (*World Psychiatry*, 2017,
DOI 10.1002/wps.20375) reframes a disorder not as a latent common cause
producing correlated symptoms, but as a network of symptoms that cause and
maintain one another directly — insomnia driving fatigue, fatigue driving
concentration problems, concentration problems driving low mood, and so
on, in a loop that can sustain itself once enough of it is active. On this
account, a disorder is an alternative stable state of that symptom network:
a self-sustaining, densely interconnected activation pattern that persists
once triggered, distinct from the healthy state in which the same symptoms
are present at low, non-self-sustaining levels. The theory paper states the
hysteresis claim conceptually: if the network is strongly enough connected,
more stress-reduction should be needed to push the system back out of the
disordered state than the stress that was needed to push it in, in the
same way a bistable physical system requires overshooting its original
tipping condition to reverse.

The paper that actually derives and demonstrates this hysteresis result is
Cramer, van Borkulo, Giltay, van der Maas, Kendler, Scheffer & Borsboom,
"Major Depression as a Complex Dynamic System" (*PLOS ONE*, 2016, DOI
10.1371/journal.pone.0167490, PMID 27930698) — and its design has to be
stated precisely, because it is easy to over-read. This is a simulation
study parameterized by empirical data, not a test of hysteresis in real
patients over time. The authors estimated network weights and symptom
thresholds for 14 disaggregated DSM-III-R depression symptoms
(representing nine aggregated DSM-III-R criterion-A symptoms) from the
Virginia Adult Twin Study of Psychiatric and Substance Use Disorders
(VATSPUD), a cross-sectional dataset of 8,973 Caucasian twins. They then
built an Ising-type symptom-network simulation seeded with those weights
and ran two simulation studies of 10,000 time steps each, manipulating a
"stress" parameter and overall network connectivity across weak, medium,
and strong conditions.

In the strong-connectivity simulation, the model showed clear hysteresis:
the stress-reduction required to bring the simulated system back to a
non-depressed state (few or no symptoms active) exceeded the stress that
had originally tipped it into a depressed state, and the "forbidden
zone" — the range of symptom counts that is unstable and bistable
depending on the system's history — widened from roughly 2 to 9 active
symptoms as connectivity increased from weak to strong. The authors
describe this as "the first intra-individual, symptom-based, process model
with the potential to explain the pathogenesis and maintenance of major
depression," and state explicitly what it does not show: it does not
demonstrate autocatalysis (self-reinforcing symptom escalation), it does
not capture idiosyncratic, person-specific symptom thresholds, and it does
not model dynamic changes in a person's own network connectivity over
time.

What this does not license, stated as plainly as the authors themselves
put it: this is a proof of concept that hysteresis is mathematically
possible given a network with parameters resembling a real,
population-averaged symptom network. It is not empirical evidence that any
actual patient's depression exhibits hysteresis, and the parameters come
from a cross-sectional population sample, not from within-person
longitudinal data. No individual's own time series was fit to this model
in this paper. The alternative-stable-states claim and the hysteresis
result behind it are therefore, at present, a formal demonstration of
possibility under assumed network structure — not an observed property of
any patient's actual course.

## Bimodality in individual symptom time series: a real, if contested, descriptive pattern

A separate and more directly empirical line of evidence asks a narrower
question: setting aside whether a mechanistic network model can produce
bistability, do real patients' own longitudinal symptom time series
actually look two-state (bimodal) rather than smoothly varying
(unimodal)?

Hosenfeld, Bos, Wardenaar, Conradi, van der Maas, Visser & de Jonge, "Major
depressive disorder as a nonlinear dynamic system: bimodality in the
frequency distribution of depressive symptoms over time" (*BMC Psychiatry*,
2015, DOI 10.1186/s12888-015-0596-5, PMID 26385384) followed 178
primary-care patients with MDD for two years (104 weeks), recording
presence or absence of nine DSM-IV depression symptom criteria weekly via
retrospective telephone interviews conducted roughly every three months —
meaning participants reported on the prior weeks retrospectively, not in
real time. 66% of patients had a high bimodality coefficient (BC > .55,
the conventional cutoff), a Hidden Markov Model classified 90% of patients
as bimodal, mean BC was .65 (median .63, SD .17, range .20–.98), and visual
inspection of the individual time-series plots found 56% of patients
displayed "clear sudden jumps" in symptom counts.

The authors' own stated cautions are load-bearing and belong in any use of
this result: bimodality in a time series is consistent with, but does not
itself prove, the existence of genuine alternating stable or attractor
states, since other processes can also produce a bimodal distribution;
retrospective, coarse-grained data collection (weekly counts recalled every
three months) may itself create artifactual jumps that a true continuous
process would not show; and the primary-care sample may not generalize to
more severely affected populations. Bimodality is a descriptive statistic
about the shape of a symptom time series, not a mechanistic demonstration
of an underlying bistable dynamical system, and the retrospective design
specifically cannot distinguish a true abrupt transition from a
recall-driven step artifact. Read alongside the Cramer et al. simulation
above, the relationship between the two papers is worth stating precisely:
Hosenfeld et al. gives a real, if methodologically limited, empirical
pattern consistent with two-state dynamics in individual patients; Cramer
et al. gives a formal mechanism (network hysteresis) that could in
principle produce such a pattern, but was never fitted to these or any
other individual patients' own data. The two results are complementary,
not the same finding reported twice, and neither substitutes for the
other.

## Mood instability by ecological momentary assessment: a related but distinct construct

[Mood instability](../../../../../../glossary/terms/mood-instability.md)
already carries the house's full treatment of this construct — Broome,
Saunders, Harrison & Marwaha's (2015) definitional framing and 13.9%
UK population prevalence estimate, and Sultson, Murd, Havik & Konstabel's
(2024) 221-person Estonian EMA cohort finding negative-affect instability
predicts elevated depressive and generalized-anxiety symptoms independent
of mean affect intensity (depression OR 2.15, 99% CI 1.08–4.30; GAD OR
2.16, 99% CI 1.04–4.48) — and states its own distinction from
early-warning-signal methods, so it is not re-derived here. The one point
worth restating in this note's synthesis frame: mood instability describes
the amplitude of fluctuation, and is measured cross-sectionally, so — by
the Sultson et al. authors' own explicit caution, quoted in the term
carrier — it cannot establish that instability precedes or causes later
symptom elevation, only that the two co-occur. It is one more construct in
this literature that gets described with predictive-sounding language
("predicts") while resting on a same-period, non-temporal analysis; that
gap between the word used and the analysis run recurs throughout this
survey and is treated as its own finding in the next section.

## The statistical critique, given equal room: two independent lines

The commission for this note is explicit that the critique gets as much
space as the positive claims. Beyond Bos and de Jonge's critique of van de
Leemput (already carried in the critical-slowing-down term) and Helmich et
al.'s 2024 pooled review (already carried in the early-warning-signal
term), there is a second, independent population-level critique worth
recording in full here because it has not yet been captured elsewhere in
this section.

Schreuder, Hartman, George and colleagues, "Early warning signals in
psychopathology: what do they tell?" (*BMC Medicine*, 2020, DOI
10.1186/s12916-020-01742-3, PMID 33050891), ran a population-level analysis
and found autocorrelation in affective states was **not** related to
symptom increases one year later for most domains studied — the single
exception being that elevated autocorrelation in "feeling suspicious"
predicted later increases in interpersonal sensitivity (β = 0.12, p < .01).
The authors state directly that their population-level result — where
autocorrelation tracks *concurrent* severity rather than predicting future
severity — sits in tension with prior single-case studies claiming
autocorrelation rises *before* a transition, and argue this discrepancy
shows the mismatch between group-level and individual-level analysis, and
between concurrent and predictive claims, has not yet been reconciled in
this literature. They call for large-scale, genuinely within-individual
research monitoring early-warning signals and symptom shifts in real time
before any translation to clinical practice — the same call Helmich et al.
make four years later, from a different data source and a different
population.

Two structural problems recur across both critique papers and are worth
naming as generic, not paper-specific. First, a sampling-rate problem:
autocorrelation is mechanically sensitive to how often a person is
sampled, so studies that measure once daily or a few times weekly — most
of the published record, because sustaining higher-frequency sampling for
the months a real clinical transition can take is often impractical —
systematically understate the true signal, if one exists, independent of
whether the underlying theory is correct. Second, a testing-design
problem: every published early-warning study to date tested for a signal
only after already knowing which participants had transitioned, a
post-hoc, single test per person; a genuinely prospective test, repeated in
real time without foreknowledge of transition timing, would require
correcting for multiple comparisons across repeated tests on the same
person, which would in turn reduce sensitivity below what the already-weak
pooled record shows. No published study has attempted this fully
prospective design. Helmich et al. also note this false-negative problem is
not unique to psychology: a meta-analysis of 126 ecological (lake and
climate) systems found early warning signals were detected before only 13%
of transitions — the phenomenon this whole framework was originally built
to describe has its own substantial detection-failure rate in its home
domain.

The Helmich et al. review also gives a specific theoretical reason, not
just a design-and-power problem, for why early warning signals might be
genuinely and permanently invisible in exactly the phenomenon a bistable
mood-switch account is meant to explain. Not every transition is preceded
by the particular bifurcation type (a fold) that critical slowing down
precedes — cusp, pitchfork, transcritical, and other bifurcation types
have different or no early-warning signature, and abrupt external shocks or
gradually shifting attractors show no early-warning signal at all. More
directly on point: the review's own named example (their Figure 2e)
states that "swings between manic and depressed attractors might result in
strong emotion dynamics that obscure potential signs of the attractors'
destabilization" — that is, the review's own dynamical-systems account
predicts that fast, large-amplitude affective swinging between two states
is exactly the regime where the slow-buildup signature (rising
autocorrelation and variance) early-warning methods are built to detect
would be least visible, not most. A reader looking to this literature for
support of a fast-switching phenomenon specifically should register that
its own theorists flag fast switching as the case their detection method
is least equipped to see coming.

## A thinner adjacent thread: chaos and catastrophe-theory language

Two further strands are named in reviews of this area but rest on much
thinner empirical ground for mood specifically, and are recorded here with
that thinness stated rather than smoothed over.

Gottschalk, Bauer & Whybrow, "Evidence of chaotic mood variation in
bipolar disorder" (*Archives of General Psychiatry*, 1995, PMID 7487343),
analyzed long-term daily mood self-ratings (1.0–2.5 years) from 7
rapid-cycling bipolar patients and 28 healthy controls using spectral and
correlation-dimension methods. True periodic cyclicity was not found in
either group; both showed broadband "1/f"-shaped power spectra,
significantly flatter (more structured, less noise-like) in the patients
than controls (p = .02), and 6 of 7 patients showed evidence consistent
with a low-dimensional chaotic attractor rather than either a periodic or
a purely random process. The authors' own conclusion is that mood in
rapid-cycling bipolar disorder is better described as low-dimensional
deterministic chaos than as either a periodic cycle or noise — a distinct
formal claim from everything above: chaos theory concerns aperiodic
deterministic trajectories in general, while the bistability and hysteresis
claims above concern discontinuous jumps between discrete stable states as
a parameter changes smoothly. The two are easy to conflate in loose
secondary summaries and are kept explicitly separate here. This is a
7-patient, 28-control study from 1995, without independent replication
found for this note.

Catastrophe theory — a general mathematical framework, of which the cusp
model is the most commonly used form, for systems showing sudden jumps,
hysteresis, and multi-modality as a function of continuously varying
control parameters — is named in reviews of clinical-psychology
applications (to anorexia nervosa, binge eating and drinking, aggression,
schizophrenia, and "affective disorders" as a general category), and it is
explicitly one of the possible bifurcation types the Helmich et al. review
lists (alongside fold and butterfly) as a mechanism that critical slowing
down does not uniformly precede. A specific, accessible, peer-reviewed
empirical study fitting a cusp-catastrophe model directly to individual
mood or affective (ESM or diary) time-series data, with reported fit
statistics, was searched for and not found within the scope of this
note's review — the theoretical framework and its name are invoked in
secondary clinical-psychology reviews, but a primary empirical fit for
mood specifically was not located. This null result is recorded as a gap
in what could be verified, not as a claim that no such study exists
anywhere.

## What is established, what is hypothesis, what is unreplicated

Stated together, in one place, without smoothing the disagreements:

- **Descriptively real, but methodologically limited:** individual
  patients' longitudinal depression-symptom time series are often better
  described as bimodal or two-state than as smoothly varying (Hosenfeld et
  al. 2015: 66% of 178 patients above the bimodality cutoff, 90% classified
  bimodal by Hidden Markov Model) — but the retrospective, coarse-grained
  design cannot distinguish a genuine abrupt transition from a
  recall-driven artifact.
- **Cross-sectionally real, temporally unproven:** negative-affect
  instability is associated with elevated depressive and anxiety symptoms
  independent of mean affect level (Sultson et al. 2024) — but by the
  authors' own explicit caution, the analysis is cross-sectional and
  cannot show instability precedes or causes later symptom elevation.
- **A mechanistic hypothesis, actively tested and mostly not supported:**
  critical slowing down as a generic within-person early-warning signal of
  an approaching mood transition. One confirmatory single-case study
  supports it (Wichers et al. 2020); the pooled record across seven-plus
  independent within-person cohorts (Helmich et al. 2024) shows sensitivity
  commonly under 50% and as low as 0%, and a second, independent
  population-level analysis (Schreuder et al. 2020) found autocorrelation
  tracked concurrent, not future, severity for nearly every symptom domain
  studied.
- **Unreplicated and directly disputed:** the original van de Leemput et
  al. 2014 group-level finding is disputed on methodological grounds by
  Bos and de Jonge (2014) as conflating between- and within-subject
  variance; this dispute has not been resolved in the literature reviewed
  for this note.
- **A formal demonstration of possibility, not an empirical finding about
  any patient:** hysteresis in symptom networks (Cramer et al. 2016) is a
  simulation result from parameters fit to cross-sectional population
  data, not a demonstration that any actual patient's own symptom
  trajectory shows hysteresis.
- **Thin, and distinct from each other:** low-dimensional chaotic
  structure in daily mood ratings has evidence from one small,
  unreplicated 1995 study (Gottschalk et al., 7 patients); a cusp-catastrophe
  model fitted specifically to mood or affective time-series data, with
  reported fit statistics, was not located for this note.
- **What none of this establishes:** no source reviewed here identifies a
  neural, hormonal, or other physiological mechanism for a mood switch.
  Every model above is a statistical or dynamical-systems description
  fitted to self-reported mood or symptom time series — a formal account of
  the pattern of change, not an identified biological switch mechanism.
  The originators of the strongest positive claims (van de Leemput et al.,
  Cramer et al.) are themselves explicit that their models are a first,
  necessarily simplified analogy to physical and ecological systems, and
  the critique literature (Helmich et al. 2024, Schreuder et al. 2020, Bos
  and de Jonge 2014) is explicit that even the statistical and predictive
  claims built on these models are not yet well supported.

## A house-theory correspondence, stated as a hypothesis to test

The founder-authored carrier [Stability Dynamics in Cognitive
Systems](../../../../../../../../../../../../../human-science-services-section/services/human-cognition-services-section/content/text/documents/articles/notes/2025/10/11/2025-10-11-note-on-stability-dynamics-in-cognitive-systems.md)
develops, independently of the clinical literature surveyed above, a
formal definition of affect for a cognitive system adapting to a fixed
sensory environment. It defines a stability reward $R_s(t)$ as the
negative time derivative of the KL-divergence between successive belief
states — how fast the system's beliefs are converging — and defines affect
as the time derivative of that stability reward, $A(t) = \partial_t
R_s(t)$: positive affect is acceleration toward stability (the system
getting better at getting better), negative affect is deceleration
(uncertainty amplifying). It further notes that in predictive-coding
models, precision $\pi_t$ (inverse variance of prediction error) modulates
the belief-update rate directly, so that $A(t) \propto \partial_t \pi_t$ —
affective change tracks the system's changing confidence in its coupling
to its environment.

Stated as a house theory, not as an established finding, and offered here
explicitly as a hypothesis this literature could be used to test rather
than a claim this literature has already confirmed: if affect is
structurally the second time derivative of a convergence process — the
curvature of a stability trajectory, not the trajectory or its level
alone — then a system whose precision (confidence in its own predictions)
is itself unstable would be expected to show exactly the kind of abrupt,
large-swing affective transitions this note surveys, for a reason
distinct from population-level symptom-network hysteresis: not because a
symptom network has tipped between two attractor basins, but because the
rate term itself (precision, and therefore the belief-update gain) is
swinging, which would show up as instability in the *derivative* of
whatever a rating instrument captures, not necessarily as instability in
its level. This is a candidate correspondence between two independently
developed formal accounts — one from predictive-processing theory, one
from ecological/climate dynamical-systems theory imported into
psychiatry — and nothing surveyed in this note tests it directly: none of
the studies above measure precision, prediction-error variance, or a
belief-update rate; they measure momentary self-reported affect and
symptom counts. Whether critical slowing down's autocorrelation and
variance signatures, where they are genuinely present in a within-person
time series, correspond to the *level* of a stability-reward-like process
or to its *second derivative* in this house sense is an open, unresolved
question this note raises rather than answers, and testing it would
require a study design not represented anywhere in the literature reviewed
here — one that jointly measures a candidate precision or confidence proxy
alongside momentary affect ratings, within the same monitored individuals,
prospectively.

## Related material

- [Critical slowing
  down](../../../../../../glossary/terms/critical-slowing-down.md) — the
  core dynamical-systems construct this note builds from
- [Early warning
  signal](../../../../../../glossary/terms/early-warning-signal.md) — the
  applied detection framework built on critical slowing down, and its
  pooled evidence record
- [Mood instability](../../../../../../glossary/terms/mood-instability.md) —
  the distinct, amplitude-based construct this note distinguishes from
  early-warning-signal methods
- [Rapid cycling](../../../../../../glossary/terms/rapid-cycling.md) and
  [ultradian cycling](../../../../../../glossary/terms/ultradian-cycling.md) —
  clinical course specifiers for fast mood-polarity change, a related but
  distinct phenomenon from the statistical bistability claims surveyed
  here
- [Treatment-emergent affective
  switch](../../../../../../glossary/terms/treatment-emergent-affective-switch.md) —
  another documented route to an abrupt mood-state change, driven by a
  specific pharmacological exposure rather than endogenous dynamics
- [Psychomotor
  retardation](../../../../../../../../../../content/text/glossary/terms/psychomotor-retardation.md)
  and [psychomotor
  agitation](../../../../../../../../../../content/text/glossary/terms/psychomotor-agitation.md) —
  the objectively measurable low-arousal and high-arousal poles this
  literature's proposed switch would move between
- [Irritability](../../../../../../../../../irritability-services-section/content/text/glossary/terms/irritability.md) —
  the low-anger-threshold presentation associated with the activated pole
- [Stability Dynamics in Cognitive
  Systems](../../../../../../../../../../../../../human-science-services-section/services/human-cognition-services-section/content/text/documents/articles/notes/2025/10/11/2025-10-11-note-on-stability-dynamics-in-cognitive-systems.md) —
  the house theoretical carrier defining affect as the time derivative of a
  stability reward, set alongside this literature above as a hypothesis to
  test, not a confirmed correspondence

## References

Van de Leemput, I. A., Wichers, M., Cramer, A. O. J., Borsboom, D.,
Tuerlinckx, F., Kuppens, P., van Nes, E. H., Viechtbauer, W., Giltay, E. J.,
Aggen, S. H., Derom, C., Jacobs, N., Kendler, K. S., van der Maas, H. L. J.,
Neale, M. C., Peeters, F., Thiery, E., Zachar, P., & Scheffer, M. (2014).
Critical slowing down as early warning for the onset and termination of
depression. *Proceedings of the National Academy of Sciences*, 111(1),
87–92. DOI: 10.1073/pnas.1312114110. PMID: 24324144.

Bos, E. H., & de Jonge, P. (2014). 'Critical slowing down in depression' is
a great idea that still needs empirical proof. *Proceedings of the
National Academy of Sciences*, 111(10), E878. DOI: 10.1073/pnas.1323672111.

Wichers, M., Smit, A. C., & Snippe, E. (2020). Early Warning Signals Based
on Momentary Affect Dynamics can Expose Nearby Transitions in Depression:
A Confirmatory Single-Subject Time-Series Study. *Journal for
Person-Oriented Research*, 6(1), 1–15. DOI: 10.17505/jpor.2020.22042. PMID:
33569148.

Helmich, M. A., Schreuder, M. J., Bringmann, L. F., Riese, H., Snippe, E.,
& Smit, A. C. (2024). Slow down and be critical before using early warning
signals in psychopathology. *Nature Reviews Psychology*. DOI:
10.1038/s44159-024-00369-y.

Schreuder, M. J., Hartman, C. A., George, S. V., et al. (2020). Early
warning signals in psychopathology: what do they tell? *BMC Medicine*, 18,
269. DOI: 10.1186/s12916-020-01742-3. PMID: 33050891.

Borsboom, D. (2017). A network theory of mental disorders. *World
Psychiatry*, 16(1), 5–13. DOI: 10.1002/wps.20375.

Cramer, A. O. J., van Borkulo, C. D., Giltay, E. J., van der Maas, H. L. J.,
Kendler, K. S., Scheffer, M., & Borsboom, D. (2016). Major Depression as a
Complex Dynamic System. *PLOS ONE*, 11(12), e0167490. DOI:
10.1371/journal.pone.0167490. PMID: 27930698.

Hosenfeld, B., Bos, E. H., Wardenaar, K. J., Conradi, H. J., van der Maas,
H. L. J., Visser, I., & de Jonge, P. (2015). Major depressive disorder as a
nonlinear dynamic system: bimodality in the frequency distribution of
depressive symptoms over time. *BMC Psychiatry*, 15, 222. DOI:
10.1186/s12888-015-0596-5. PMID: 26385384.

Broome, M. R., Saunders, K. E. A., Harrison, P. J., & Marwaha, S. (2015).
Mood instability: significance, definition and measurement. *British
Journal of Psychiatry*, 207(4), 283–285. DOI: 10.1192/bjp.bp.114.158543.
PMID: 26429679.

Sultson, H., Murd, C., Havik, M., & Konstabel, K. (2024). Negative affect
instability predicts elevated depressive and generalized anxiety disorder
symptoms even when negative affect intensity is controlled for: an
ecological momentary assessment study. *Frontiers in Psychology*, 15,
1371115. DOI: 10.3389/fpsyg.2024.1371115. PMID: 38716268.

Gottschalk, A., Bauer, M. S., & Whybrow, P. C. (1995). Evidence of chaotic
mood variation in bipolar disorder. *Archives of General Psychiatry*,
52(11), 947–959. PMID: 7487343.
