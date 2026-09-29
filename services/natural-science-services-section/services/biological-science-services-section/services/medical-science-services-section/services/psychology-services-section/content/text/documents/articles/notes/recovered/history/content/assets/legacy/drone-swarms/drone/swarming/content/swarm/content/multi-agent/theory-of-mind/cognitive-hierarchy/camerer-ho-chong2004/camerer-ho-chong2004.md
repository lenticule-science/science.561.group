---
type: reference
class: foundational
status: active
authors: ["Colin F. Camerer", "Teck-Hua Ho", "Juin-Kuan Chong"]
year: 2004
venue: "The Quarterly Journal of Economics, vol. 119, no. 3"
title: "A cognitive hierarchy model of games"
---

# Camerer, Ho & Chong 2004 — Cognitive hierarchy

Camerer, C.F., Ho, T.-H., & Chong, J.-K.
(2004).
A cognitive hierarchy model of games. *The Quarterly Journal of Economics*, 119(3), 861-898.

The paper introducing the *cognitive hierarchy* (CH) model of strategic reasoning.
Building on Stahl-Wilson's level-$k$ framework (1994), CH posits that agents at level $k$ believe other agents are *distributed* over levels $0, 1, \ldots, k - 1$ according to a Poisson distribution with mean $\tau$.

The model fits experimental data on a wide range of strategic games (beauty contests, mixed-strategy games, dominance-solvable games) substantially better than Nash equilibrium predictions and modestly better than pure level-$k$.
Estimated $\tau$ is robustly around $1.5$ across populations and tasks.

Key contributions:

- **Quantitative model of bounded strategic reasoning.** The Poisson-distribution structure produces parsimonious one-parameter predictions.
- **Empirical validation across many games.** The model predicts behavior in beauty-contest, guessing-game, and other strategic experiments.
- **Behavioral game theory framework.** CH became a standard behavioral alternative to Nash-equilibrium prediction.
- **Connection to ToM.** Strategic reasoning depth maps directly to recursive ToM depth; CH provides a quantitative ToM-depth estimator.

Subsequent work extended CH to:

- Heterogeneous-population settings (different agents at different levels).
- Dynamic games (level may change with experience).
- Cross-cultural and cross-domain comparisons.
- Application to AI agent strategic reasoning (preliminary).

The empirical bound $\tau \approx 1.5$ has become the standard reference point for *bounded recursive reasoning* in human strategic interaction.
Whether AI agents exhibit similar or different bounds is active research.

Cited by: [cognitive-hierarchy](teaching/explanations/cognitive-hierarchy.md), [cognitive-hierarchy-bound](../theorems/cognitive-hierarchy-bound.md), [recursive-reasoning](../morphisms/recursive-reasoning.md).
