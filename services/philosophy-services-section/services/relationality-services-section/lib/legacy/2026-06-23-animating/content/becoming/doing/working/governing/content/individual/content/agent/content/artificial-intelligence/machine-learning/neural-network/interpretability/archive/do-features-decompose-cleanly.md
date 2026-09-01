---
type: question
status: open
see-also:
  - teaching/explanations/sparse-autoencoder.md
  - ../objects/sparse-feature.md
  - ../theorems/sae-reconstruction-faithfulness-tradeoff.md
references:
  - references/templeton-scaling-mono2024.md
---

# Do features decompose cleanly?

## The question

The sparse-autoencoder program assumes that a network's
activations decompose into a *finite catalog of atomic
features* — a fixed set of conceptually distinct directions
each corresponding to a single concept. Do they?

The empirical record is mixed:

- Some features recovered by SAEs are *clean atoms* (the
  Golden Gate Bridge feature).
- Some are *splits* — the same concept appears across
  multiple slightly-different SAE directions.
- Some are *composites* — a single SAE direction fires for
  multiple distinct concepts.
- Some are *uninterpretable* — no clean human description.

The fraction in each category varies with SAE architecture,
expansion ratio, sparsity penalty, and the target network.
There is no convergence on a "true" feature decomposition.

## What clean decomposition would look like

If features decompose cleanly:

- A *canonical* feature catalog exists for the network,
  recoverable by any sufficiently powerful SAE.
- Each catalog entry has a clean human interpretation.
- Different SAE configurations recover (approximately) the
  same features, possibly at different granularities.
- Features at different layers correspond to features at
  other layers in identifiable ways.

If features decompose cleanly, mechanistic interpretability
has a *fundamental units* substrate that everything else can
build on.

## What non-clean decomposition would look like

If features decompose continuously or context-dependently:

- No canonical catalog; different decompositions are
  legitimate at different granularities or for different
  purposes.
- Many "features" are artifacts of the chosen decomposition
  rather than fundamental units.
- Cross-SAE comparisons are inherently approximate.
- Mechanistic interpretability becomes more like *physics*
  (continuous fields, no discrete atoms) than *chemistry*
  (discrete elements).

## Evidence pointing both ways

**For clean decomposition:**

- Many features (especially high-confidence ones like the
  Golden Gate Bridge feature) are stable across SAE
  configurations.
- Cross-model feature matching shows correspondence —
  similar concepts get similar features in different
  models.
- Steering with individual features produces interpretable
  behavior changes, suggesting features are real units the
  network uses.

**Against clean decomposition:**

- SAE feature catalogs grow with SAE expansion; the same
  network appears to have "more features" with bigger SAEs,
  with no apparent saturation.
- Many features have unclear interpretations even at
  high-quality SAE configurations.
- Cross-layer alignment of features is difficult.
- Some apparent features turn out to be SAE artifacts on
  closer inspection.

## Why this matters

If features decompose cleanly:

- The SAE program will eventually produce *the* catalog,
  the structural basis for understanding the network.
- Alignment proposals that depend on feature-level access
  (eliciting latent knowledge, deception detection) become
  more tractable.
- Scientific understanding of trained networks becomes
  achievable.

If features don't decompose cleanly:

- The SAE program is a useful but partial method, not the
  road to complete understanding.
- Alignment proposals depending on feature-level access
  must accept inherent imprecision.
- Mechanistic interpretability needs methodology beyond
  feature decomposition.

## Status

Open. The question is partly empirical (do features behave
as atoms in real networks?) and partly methodological
(how would we know?). The field is not converged. Active
work on cross-SAE comparison, automated interpretation
quality, and formal frameworks for feature decomposition is
underway.
