---
name: calibration-link
kind: closure-rule
description: "A closure-rule connecting observation-cells across observer-instruments. When two instruments observe the same predicate of the same body, the calibration-link enforces consistency between their bilattice values, propagating evidence between the instruments' fiber-restriction sub-settlements."
of: settlement
---

A **calibration link** is a closure-rule between observer-instruments: when two instruments $o_1, o_2$ observe the same predicate $p$ of the same celestial body $b$, the calibration-link enforces a consistency condition between $v(b, p, o_1)$ and $v(b, p, o_2)$.

## Structure

Concretely, a calibration-link between $o_1$ and $o_2$ on predicate $p$ is a function

$$
\kappa_{o_1, o_2, p} : \mathbf{L}_{o_1} \to \mathbf{L}_{o_2}
$$

mapping admissible $o_1$-values to admissible $o_2$-values such that, for any body $b$ observed by both instruments, $\kappa_{o_1, o_2, p}(v(b, p, o_1))$ and $v(b, p, o_2)$ are consistent in the bilattice (their knowledge-meet $\wedge_k$ is non-bottom).

The calibration-link is **closed** under iteration: applying $\kappa$ to a consistent pair produces a consistent pair. It is **idempotent** in the bilattice: re-applying does not add new evidence beyond what the first application produced.

## How calibration-links propagate evidence

When an observation-cell $(b, p, o_1)$ exists with value $v_1$, the calibration-link $\kappa_{o_1, o_2, p}$ implies an observation-cell $(b, p, o_2)$ with value at least $\kappa_{o_1, o_2, p}(v_1)$. This is closure: the existence of one observation forces the existence of a derived observation in the other instrument's fiber.

Across a network of instruments calibrated against each other, the transitive closure of calibration-links produces a globally consistent settlement state. Calibration networks are the substrate-realization of the "calibration ladder" of observational astronomy.

## Residuation-bridge view

A calibration-link admits a residuation-bridge presentation: see [calibration-link-as-residuation-bridge](library/calibration-link-as-residuation-bridge/calibration-link-as-residuation-bridge.md).
