---
name: second-order-cybernetics
kind: structure
description: "The observer is included in the regulating system. The observation operation is one of the cell's internal operations, alongside σ and Δ."
of: operational-closure
attribution: "Heinz von Foerster"
---

**Second-order cybernetics** (von Foerster 1974) is the cybernetic framework in which the observer is included in the regulating system. The observation operation is itself one of the cell's internal operations, sitting alongside the regulating nuclei.

## Formal statement

A cell satisfies the second-order condition when its [operational-closure](../../operational-closure.md) explicitly includes an **observation operation** $\omega : A \to A$ as one of its internal operations:

$$
\sigma, \Delta, \omega \in H^*.
$$

The cell's content carries not only its regulating processes ($\sigma$, $\Delta$) but also its observing process ($\omega$). The observation operation produces the cell's internal model of its own state.

## What second-order adds beyond first-order

First-order cybernetics: a system $R$ regulates a disturbance $D$. The observer is external — they see $R$ and $D$ from outside.

Second-order cybernetics: the system $R$ includes its own observation as $\omega$ within it. The observer is one of $R$'s components. The system $R'$ that includes $\omega$ is therefore a regulator of itself (it regulates $D$, and it observes itself regulating).

The shift: from "system observed" to "system observing itself observing." The closure relation includes the observation in the closed-over set.

## Connection to operational-closure

Operational-closure required only $\sigma, \Delta \in H^*$. Second-order-cybernetics adds the requirement that the observation operation $\omega$ is also in $H^*$. This is operational-closure made explicit at the observational level: the cell observes itself with its own internal observation operation, and that observation is part of what the cell produces.

A cell with operational-closure but without $\omega \in H^*$ has [reflexive-deficit](../reflexive-deficit/reflexive-deficit.md): it operates on its own states but does not observe itself doing so. Adding $\omega$ to $H^*$ remedies the deficit.

## Connection to autopoiesis

Maturana-Varela autopoiesis is implicitly second-order: the autopoiesis-cell includes its own producing-nuclei $\sigma, \Delta$ as content. Observation is one of the producing-operations — what the cell observes is itself part of what it produces. So the [aperiodic-autopoiesis-cell](../../../../aperiodic-autopoiesis-cell.md) is naturally second-order; this $thing makes the observational aspect of that structure explicit.
