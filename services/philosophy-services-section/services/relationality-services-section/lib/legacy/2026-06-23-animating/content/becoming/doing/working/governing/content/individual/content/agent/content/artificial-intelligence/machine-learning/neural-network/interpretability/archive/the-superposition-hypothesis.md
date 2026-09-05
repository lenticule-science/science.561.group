---
type: narrative
status: active
see-also:
  - ../teaching/explanations/superposition.md
  - ../teaching/explanations/polysemanticity.md
  - ../theorems/superposition-feasibility.md
---

# The superposition hypothesis

The superposition hypothesis — that neural networks store
more features than they have dimensions, as overlapping
non-orthogonal directions exploiting feature sparsity — is
the structural diagnosis underlying contemporary mechanistic
interpretability. It explains polysemanticity, justifies
sparse-autoencoder methods, and bounds what interpretability
can be expected to recover.

## The puzzle

The empirical observation circa 2017-2020: most neurons in
trained networks are polysemantic. They fire for multiple
unrelated concepts. Per-neuron visualization produces
incoherent composites. Per-neuron interpretation fails as a
methodology.

The puzzle: *why*? Networks have plenty of capacity. Why
don't they use a clean one-feature-per-neuron encoding?

## The wrong answers

Several candidate explanations were considered and rejected:

- **Insufficient training.** Train longer, get cleaner
  neurons. Empirically false; polysemanticity persists at
  any training duration.
- **Wrong architecture.** Use a different activation
  function or layer norm. Empirically the issue is
  architecture-independent.
- **Researcher artifact.** Maybe neurons are interpretable
  but humans can't see it. Subsequent work with automated
  interpretation confirmed humans were right; neurons are
  multi-purpose.

## The right answer (2022)

Elhage et al.'s *Toy Models of Superposition* (2022): the
network has more features it needs to represent than it has
dimensions. With $f > d$, the only way to encode all
features is *non-orthogonally* — features as overlapping
directions, with neurons projecting onto multiple features.

The strategy works because features are *sparse*: each
feature is active on only a small fraction of inputs.
Non-orthogonal storage produces interference only when
multiple superposed features are simultaneously active —
which sparsity makes rare. The expected interference is
small enough that the network's downstream layers can
recover individual features despite the overlap.

## The toy-model evidence

The toy-model paper constructed networks with controlled
feature counts, sparsities, and bottleneck dimensions, and
observed:

- When features are dense (active on many inputs), the
  network stores at most $d$ features and suppresses
  extras.
- When features are sparse, the network stores all $f$
  features (even with $f \gg d$) using non-orthogonal
  encoding.
- A *phase transition* occurs as feature density crosses a
  threshold.

The toy-model phenomenon is precisely what the
[superposition-feasibility](../theorems/superposition-feasibility.md)
result describes.

## Implications

If the hypothesis is right (and the evidence is strong):

**For interpretability methods:**

- Per-neuron interpretation is structurally limited; switch
  to feature-level interpretation.
- Recovering features requires changing basis from the
  neuron basis to a sparse overcomplete dictionary —
  motivating SAEs.
- The dimensionality bound on features is wrong; the right
  bound is on simultaneously-active features, which can be
  much smaller than total features.

**For network architecture:**

- Network capacity is being used densely; widening layers
  yields diminishing returns until polysemanticity is
  resolved.
- Training-time interventions to enforce monosemanticity
  impose capacity costs (the
  [interpretability-tax](../theorems/interpretability-tax.md)).

**For alignment:**

- A network's "values" or "goals" may be encoded as
  features in superposition, not localized to specific
  components.
- Reading off what the network "really wants" requires
  feature-level decomposition, not neuron-level inspection.

## What's not yet proved

- That *real* trained networks operate in superposition. The
  toy-model results establish the phenomenon under
  controlled conditions; full validation on frontier models
  is incomplete.
- That superposition is *the* structural reason for
  polysemanticity in real networks (vs being one of several
  contributing factors).
- That every feature in a real network is recoverable in a
  sparse-overcomplete basis. Some features may evade SAE
  recovery for reasons not yet understood.

## The hypothesis's role

The superposition hypothesis is the *theoretical scaffold* of
contemporary mechanistic interpretability. Without it, the
field would still observe polysemanticity but lack a
structural explanation; with it, the field has a coherent
story for why per-neuron explanations fail, why SAEs work,
and what the limits of interpretability are. Whether the
scaffold survives in current form, or evolves into something
more refined, is an open question.
