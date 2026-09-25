---
type: morphism
class: process
depends-on: [in-situ-monitoring]
title: In-process monitoring (morphism)
description: "The morphism that takes the running AM build (process state at time $t$) to a stream of measurements: thermal, optical, acoustic, electrical."
---

# In-process monitoring (morphism)

The morphism that takes the running AM build (process state at time $t$) to a stream of measurements: thermal, optical, acoustic, electrical. Conceptually parallel to [deposition](./predication-deposition.md) — both are functions of build time — but distinguished by being *passive* (does not affect the build) rather than *active* (creates material).

**Type signature.**

$$
\text{In-process monitoring} : \text{BuildState}(t) \;\longrightarrow\; \text{Measurement stream}
$$

where the measurement stream is a function of layer index, position within layer, and sensor channel.

**Composability.** The monitoring morphism composes with downstream analysis:

$$
\text{BuildState} \xrightarrow{\text{monitor}} \text{Measurements} \xrightarrow{\text{detect}} \text{Anomalies} \xrightarrow{\text{decide}} \text{ControlAction or ReportAction}
$$

Each arrow is a separable subsystem; the modularity of this chain is the source of the field's productivity.

**Sensors used.** Catalog in [in-situ-monitoring](./predication-in-situ-monitoring.md). The morphism abstracts over sensor choice.

**Latency tiers.**

- *Microsecond loop:* photodiode pyrometry to laser-power feedback (research; see Druzgalski 2020).
- *Layer loop (seconds):* thermography between layers to next-layer parameter adjustment.
- *Build loop (hours-days):* end-of-build inspection determines acceptance or rejection.
- *Pedigree archive (forever):* per-build dataset retained for downstream qualification.

**Why it is a morphism, not an object.** Monitoring is *what happens* during the build, not *what exists*. Sensors and software are objects; the act of measuring is the morphism.

**Open challenge.** The detect-decide-act loop is mature for catastrophic failures (spaghetti, recoater jam). It is not mature for *subtle* defects (small porosity, sub-surface crack initiation) which require offline analysis. Closing this loop is the [in-situ-defect-detection](./predication-in-situ-defect-detection.md) frontier.

## Earlier material

**Sensors used.** Catalog in [in-situ-monitoring](../../../../../../../content/text/documents/articles/research/2026/07/31/lenticule-import/library/applied-sciences/technology/fabrication/material-science/additive-manufacturing/archive/teaching/explanations/in-situ-monitoring.md). The morphism abstracts over sensor choice.
