---
description: Early warning signal (EWS) names a family of statistical indicators — most centrally critical slowing down's rising autocorrelation and variance, but also rising network connectivity between symptoms — used to detect an approaching transition in a monitored system before it occurs. In psychopathology research this has been tested as a way to flag an approaching shift into or out of a depressive or manic mood state from repeated momentary self-report, with mixed empirical support.
identity: early-warning-signal
name: Early Warning Signal
date-created: 2026-09-02
references:
  wichers2020:
    authors:
      - Marieke Wichers
      - Anna C. Smit
      - Evelien Snippe
    title: "Early Warning Signals Based on Momentary Affect Dynamics can Expose Nearby Transitions in Depression: A Confirmatory Single-Subject Time-Series Study"
    year: 2020
    publication: Journal for Person-Oriented Research
    doi: 10.17505/jpor.2020.22042
  helmich2024:
    authors:
      - Marlies A. Helmich
      - Marieke J. Schreuder
      - Laura F. Bringmann
      - Harriette Riese
      - Evelien Snippe
      - Anja C. Smit
    title: Slow down and be critical before using early warning signals in psychopathology
    year: 2024
    publication: Nature Reviews Psychology
    doi: 10.1038/s44159-024-00369-y
relations:
  measures:
    - critical-slowing-down
---
An early warning signal is any statistical indicator, derived from repeated measurements of a system over time, that is proposed to rise or change characteristically before that system undergoes a bifurcation-type transition between stable states. Critical slowing down's rising autocorrelation and variance are the most commonly used early warning signals, but rising cross-correlation or network connectivity between the monitored variables — for instance, between different momentary emotions or symptoms — is also used as a complementary signal. The framework is borrowed from ecology and climate science, where early warning signals have been studied as candidate predictors of ecosystem collapse and climate tipping points, and carried into psychopathology as a candidate method for personalized prediction of mood-state transitions from repeated ecological momentary assessment (EMA).

A small number of studies have tested early warning signals within a single monitored person, tracking one individual's own autocorrelation, variance, and network-connectivity trend up to and through their own transition. In one confirmatory single-subject study (Wichers, Smit & Snippe, 2020), a participant tapering off antidepressants was monitored three times daily for 164 days; autocorrelation and network connectivity in momentary 'feeling down' rose significantly in the month before the participant's own symptom transition (autocorrelation trend r = 0.51, network-connectivity trend r = 0.42, both p < 2.2×10⁻¹⁶), peaking roughly a month before the participant's own subjective sense of relapse risk, which only emerged in the final week. The authors were explicit that a single confirmed case cannot establish generalizability, that the parallel variance signal did not replicate once the affect items were aggregated into one composite score, and that a temporal association between rising autocorrelation and a later transition does not establish which, if either, caused the other.

A 2024 systematic review of every published within-person early-warning-signal study to date (Helmich, Schreuder, Bringmann, Riese, Snippe & Smit, 2024) found the pooled record far weaker than that single confirmatory case. Across the independent within-person cohorts they tabulated, sensitivity for detecting an actual transition was commonly well under 50% and in one 42-patient remitted-MDD cohort was 0%, while specificity ranged widely; the reviewers' own summary lines include 'EWS hardly predict transitions towards mental health conditions' and 'the low sensitivity of EWS poses a substantial challenge for clinical applications.' They identify two structural problems with the method itself, not only with any one study. First, a sampling-rate problem: autocorrelation is sensitive to sampling frequency, so longer intervals between assessments mechanically produce lower measured autocorrelation regardless of the underlying dynamics, and most published studies sampled only once daily or a few times a week — frequencies that 'likely impaired their ability to detect EWS' — while the higher sampling frequency needed for genuine detection is often impractical to sustain for the months a real clinical transition can take to develop. Second, a false-positive problem: every published study tested for an early warning signal only after already knowing which participants had transitioned, a post-hoc, single test per person; a genuinely prospective design, testing repeatedly in real time without knowing in advance whether or when a transition will occur, 'would require multiple tests for each monitored individual, resulting in a higher number of false alarms compared to post-hoc investigations,' and the multiple-testing correction needed to control those false alarms would in turn reduce sensitivity further. No published study has yet attempted a fully prospective test. The reviewers note this problem is not unique to psychology: a meta-analysis of 126 ecological systems found early warning signals were detected before only 13% of transitions. These per-study figures are drawn from one direct reading of the review; they could not be independently cross-checked against a second channel, so they should be read as sourced from a single reading, not as cross-verified.

Early warning signal is the broader, applied concept: it names the attempt to use a statistical signature — most often critical slowing down's rising autocorrelation and variance — as a predictive monitoring tool, whereas critical slowing down itself names the dynamical-systems phenomenon such signals are trying to detect. A signal can fail to behave as an early warning signal even where critical-slowing-down theory in principle applies: not every transition is preceded by the bifurcation type (a fold) that critical slowing down precedes, and fast swings between manic and depressed states can themselves produce strong emotion dynamics that obscure the slow-buildup signature early-warning methods are built to detect, rather than exposing it. None of this literature identifies a neural, hormonal, or other physiological mechanism for a mood switch; every method reviewed here is a formal statistic fitted to a self-reported mood or symptom time series, not an identified biological switch mechanism. The consequence for research design is that any claim of clinical utility for an early warning signal requires a genuinely prospective test — repeated real-time monitoring without foreknowledge of transition timing, with multiple-testing correction applied — and that no published study meets this standard yet; a post-hoc test on known transitions overstates the signal's real predictive value.
