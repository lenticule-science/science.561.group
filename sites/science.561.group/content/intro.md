---
title: "What would count as knowing?"
description: "A field guide to observations, estimates, proofs, and predictions—and the different kinds of uncertainty they carry."
date-created: 2026-10-12
kind: article
status: potential
tags:
  - scientific-method
  - evidence
  - obsmetrologia
  - four-valued-logic
  - prediction
---

# What would count as knowing?

**A measurement is not an inference. An inference is not a proof. A proof about
a model is not proof that the model describes the world.** Much of the trouble
in public scientific argument comes from compressing those sentences into
"the data proves it."

Lenticule Science studies how claims acquire evidence, how information changes
what can be inferred, and how a formal result may—or may not—be carried into
experimental and operating systems. Obsmetrologia is part of that research
program. Its mathematical ambition is not a license to call every forecast a
theorem. The interesting work begins by specifying the boundary between them.

## A weather example with actual stakes

Suppose an event pays out if an official weather station records a daily high
of at least 100°F. At 2:30 p.m., the last available observation is 96°F. A
forecast predicts cooling. What can we say?

- **Observation:** the station reported 96°F at the observation time.
  Publication lag, sensor quality, time zone, units, and missing samples still
  matter.
- **Estimate:** the available weather model makes crossing 100°F unlikely.
  This is a probability or confidence judgment conditional on a model and
  evidence. It is not an impossibility result.
- **Conditional bound:** if a justified upper bound for every remaining
  admissible temperature trajectory is *strictly below* 100°F, then crossing
  the threshold is impossible **within that constrained model**. A bound of
  exactly 100°F does not rule out an event whose rule says "at least 100°F."
- **Official settlement:** the market's named authority publishes the day's
  qualifying maximum under its own rule. A trader's interpretation of a
  nearby sensor is not that settlement record.

The third statement is stronger than the second only when the bounds and
their applicability have been established. The fourth may arrive after all
trading decisions are finished. Their distinction creates opportunities for
better decisions, but also sharply limits claims of certainty.

## What evidence says, and what futures permit

Two different questions should not be merged.

**Evidence question:** do we possess support or refutation for a particular
statement? A four-valued, paraconsistent reading can retain two independent
bits:

| Support | Refutation | Reading |
| --- | --- | --- |
| No | No | Neither: evidence is missing |
| Yes | No | Supported without recorded refutation |
| No | Yes | Refuted without recorded support |
| Yes | Yes | Both: competing evidence must be examined |

"Both" does not make every proposition true. "Neither" does not mean the
statement is false. This is about the *state of evidence*, not a four-choice
weather forecast. A correction should add or revise the attributable evidence;
it should not erase the fact that an earlier conflicting observation was made.

**Modal question:** relative to an explicit set of admissible futures, is
crossing the threshold impossible, still possible, or necessary? A future is
possible if at least one admissible trajectory meets the condition; necessary
if all do; and impossible if none do. These are conditional statements about
the admitted trajectories. If the set is poorly constrained, a perfectly
correct deduction from it may be useless for deciding a real event.

An estimated 1% chance is not the same as "impossible." A report of 100°F at
the wrong station is not the same as event settlement. A formally verified
upper bound is not a guarantee that the measurement process or weather model
was correct. Keep all three distinctions in view.

## What a reader should be able to check

A useful scientific account should let a skeptical reader reconstruct the
claim without guessing what "we know" meant:

1. **Question and rule.** What is the exact event, threshold, time window,
   observation source, and settlement authority?
2. **Evidence and provenance.** Which observation, with what timestamp,
   location, uncertainty, version, and known omissions, supports or refutes it?
3. **Method.** Is the conclusion a direct reading, statistical estimate,
   conditional theorem, simulation, laboratory finding, or proposed analogy?
4. **Assumptions and countercases.** What could change the conclusion? Does a
   missing observation, inconsistent instrument, alternative model, or revised
   event rule break it?
5. **Receiving.** Has somebody independently checked the relevant proof,
   reproduced the reported measurement, or observed the supposed operating
   behavior? If not, say what remains unverified.

This same discipline extends well beyond weather. Economic claims require
definitions of prices and transactions; claims about agency require models of
action and observation; mathematical constructions require exact premises and
proof obligations. A usable scientific language should connect these without
pretending the domains are identical.

**The point is not to replace uncertainty with impressive terminology. It is
to make uncertainty precise enough that new evidence can change the right
claim, for the right reason.**
