---
title: "Duration"
description: "The measured or lived extent of a process, state, or activity in time — the span from start to finish, connecting Bergson's qualitative durée with operational time-tracking."
defines: duration
date-created: 2026-04-04
aliases: ["durations"]
instance-of: quality
applies-to: [task, process, endeavor, state, plan, work-unit]
part-of-stage: cross-cutting
extends: [time]
contrasts-with: [effort, deadline, schedule]
references:
  - id: bergson1889
    type: document
    title: Time and Free Will: An Essay on the Immediate Data of Consciousness
    author:
      - literal: Henri Bergson
    container-title: Dover Publications
    issued:
      - year: 1889
  - id: reinertsen2009
    type: document
    title: The Principles of Product Development Flow
    author:
      - literal: Donald G. Reinertsen
    container-title: Celeritas Publishing
    issued:
      - year: 2009
  - id: kahneman-tversky1979
    type: document
    title: Intuitive Prediction: Biases and Corrective Procedures
    author:
      - literal: Daniel Kahneman
      - literal: Amos Tversky
    container-title: TIMS Studies in Management Science
    issued:
      - year: 1979
  - id: hofstadter1979
    type: document
    title: Gödel, Escher, Bach: An Eternal Golden Braid
    author:
      - literal: Douglas R. Hofstadter
    container-title: Basic Books
    issued:
      - year: 1979
---

Duration is the span from the beginning to the end of a process, activity, or state — the extent of something in time, measured either as clock intervals or as lived, phenomenological experience.

Duration has two irreducible senses.
Henri Bergson (1889) distinguishes durée — lived duration, the continuous unfolding of becoming, the qualitative melody that cannot be broken into discrete instants — from clock time, which is spatialized, discrete, and reversible.
A task that takes "three days" in the calendar sense may have a very different durée: the experience of waiting, the subjective stretching or compression of time under stress, the intervals of absorbed focus punctuated by breaks.
Both are real.
Operational planning requires measured duration; understanding why estimates fail requires lived duration.

In work, duration is the wall-clock extent of a task from start to finish.
This is distinct from [effort](./effort.md), which is the potential work time consumed within that duration.
A task that runs for five days but involves only four hours of actual work has low effort-to-duration ratio, revealing waiting, context-switching, or dependency blocking.
The [schedule](./schedule.md) allocates duration to calendar intervals; the [deadline](./deadline.md) marks a boundary of duration; the [cadence](./cadence.md) repeats at regular duration intervals.

Reinertsen (2009) grounds duration in economics through cost of delay — the economic cost per unit of time that a task remains incomplete.
A task's duration directly converts to value forgone.
If a feature that would generate $1000/day in revenue is delayed by one day, the cost of delay is $1000.
Duration is thus not neutral; it is the lever on which cost of delay operates.
This is why flow efficiency — the ratio of potential work time to total duration — is a critical metric.
Reducing duration without increasing effort is pure gain.

Duration estimation fails systematically.
Kahneman and Tversky (1979) identify the planning fallacy: people underestimate task durations while correctly estimating base-rate durations for similar past tasks.
We know that estimates tend to be optimistic, yet we make optimistic estimates.
Hofstadter (1979) formulates Hofstadter's Law: "It always takes longer than you expect, even when you take into account Hofstadter's Law."
The law is not a joke but an observation of how duration compounds: tasks depend on other tasks, each adding slack, each multiplying uncertainty.
Small errors in estimation accumulate.
This is why PERT three-point estimation (optimistic, most likely, pessimistic) is more reliable than point estimates — it models duration as a distribution, not a number.

Duration is typically tracked on tasks and endeavors as estimated, actual, and remaining values.
The tracking stage compares estimated to actual duration, surfacing where estimates calibrate well and where they consistently fail.
The dispatch stage uses duration to sequence work — among equally important tasks, shorter durations may be prioritized to increase throughput, or longer durations may be prioritized to reduce total cycle time, depending on the system's optimization goal.

See [Planning and Scheduling Survey](../texts/planning-and-scheduling-survey.md) for the full theoretical grounding.
