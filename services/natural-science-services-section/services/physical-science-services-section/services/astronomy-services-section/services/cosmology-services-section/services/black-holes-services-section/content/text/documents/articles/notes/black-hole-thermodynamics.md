---

title: "Black Hole Thermodynamics"
description: "In the early 1970s, Jacob Bekenstein proposed something strange: [black holes](../terms/black-hole.md) have entropy. Stephen Hawking then showed something stranger: black holes have temperature."
date-created: 2026-03-31
teaches:
  - hawking-radiation
  - bekenstein-hawking-entropy
requires:
  - black-hole
  - event-horizon
---

In the early 1970s, Jacob Bekenstein proposed something strange: [black holes](../terms/black-hole.md) have entropy. Stephen Hawking then showed something stranger: black holes have temperature.

## The problem Bekenstein saw

Suppose you have a box of hot gas -- high entropy. You throw it into a black hole. The gas is gone. If the black hole has no entropy, you have just reduced the total entropy of the universe. The second law of thermodynamics forbids this.

Bekenstein's solution (1972-1973): the black hole *does* have entropy, and it increases when the gas falls in. He proposed that the entropy is proportional to the area of the [event horizon](../terms/event-horizon.md). The second law is saved by a generalized version: the total entropy of the universe (ordinary entropy plus black hole entropy) never decreases.

## The four laws of black hole mechanics

Even before Bekenstein's proposal, theorists had noticed a formal analogy between black hole mechanics and thermodynamics:

| Thermodynamics | Black hole mechanics |
|---|---|
| Temperature $T$ | Surface gravity $\kappa$ |
| Entropy $S$ | Horizon area $A$ |
| Energy $E$ | Mass $M$ |
| $dE = T\,dS + \text{work}$ | $dM = \frac{\kappa}{8\pi G}\,dA + \text{work}$ |
| $S$ never decreases | $A$ never decreases (classically) |

This was initially considered a mathematical coincidence. Hawking himself argued that black holes have no temperature -- they absorb everything and emit nothing.

## Hawking radiation

In 1974, Hawking applied quantum field theory to curved [spacetime](../../../terms/spacetime.md) near the horizon and found, to his own surprise, that black holes do radiate. The radiation is thermal, with a temperature:

$$T_H = \frac{\hbar c^3}{8\pi G M k_B}$$

Temperature inversely proportional to mass. A stellar-mass black hole has a temperature of about $10^{-8}$ kelvin -- negligible compared to the 2.725 K [cosmic microwave background](../../structure/terms/cosmic-microwave-background.md). But in principle, black holes radiate, lose mass, and eventually evaporate.

[Hawking radiation](../terms/hawking-radiation.md) completed the analogy. The four laws of black hole mechanics are not an analogy. They *are* thermodynamics. Surface gravity is temperature. Horizon area is entropy.

## The Bekenstein-Hawking entropy

The entropy of a black hole is:

$$S_{BH} = \frac{k_B c^3 A}{4 G \hbar}$$

Two things about this formula are remarkable.

First, entropy is proportional to *area*, not volume. In every other physical system, the number of microstates scales with volume. A black hole's information content is determined by its boundary. This observation is the seed of the [holographic principle](../terms/holographic-principle.md).

Second, the formula contains all four fundamental constants of physics: $G$ (gravity), $c$ (relativity), $\hbar$ (quantum mechanics), and $k_B$ (thermodynamics). This is the only known formula that unifies all four. Any theory of quantum gravity must reproduce it.

## The connection to information

In information-theoretic terms, entropy measures missing information -- the logarithm of the number of microstates compatible with the macroscopic description. The [Bekenstein-Hawking entropy](../terms/bekenstein-hawking-entropy.md) counts the number of internal microstates of the black hole, as seen from outside. A solar-mass black hole has about $10^{77}$ bits of entropy -- vastly more than the star that formed it.

This connection to [information theory](../../../../../../../../../../../../../../information-science-services-section/services/information-theory-services-section/content/text/documents/articles/teaching-articles/explanations/entropy-and-surprise.md) is not a metaphor. It is the deepest available clue about the relationship between gravity and quantum mechanics, and it leads directly to the [information paradox](./the-information-paradox.md).

## Why this matters

Black hole thermodynamics revealed that gravity, quantum mechanics, and thermodynamics are more deeply connected than anyone expected. The formulas are simple. The implications are not. They constrain every candidate theory of quantum gravity and point toward a fundamental relationship between spacetime geometry and information.
