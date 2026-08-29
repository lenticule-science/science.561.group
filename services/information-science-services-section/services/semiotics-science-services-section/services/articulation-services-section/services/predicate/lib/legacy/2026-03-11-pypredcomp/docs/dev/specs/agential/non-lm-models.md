---
title: "Non-LM models as substrate cells"
description: "Markov / decision-forest / classifier / GNN models live as substrate cells: weight storage, training-event records, inference invocation contract. Tier-2 model artefacts inherit federation, signing, witness, and retraction from the substrate."
kind: spec
status: normative
version: "0.2"
---

# Non-LM models as substrate cells

The Tier-2 surface defined in [`process/computation-tiers.md`](../process/computation-tiers.md) §1 needs a concrete way for non-LM model artefacts (Markov chains, decision forests, small classifiers, graph neural networks, etc.) to live alongside every other substrate entity.
This spec is that contract.

The captain's idea is in [`beyond-language-models-for-agent-computation.md`](../../../../engineering/triage/operations/command/ideas/triage/beyond-language-models-for-agent-computation.md); the framing is committed by [`decisions/cheapest-sufficient-computation-tier.md`](../../decisions/cheapest-sufficient-computation-tier.md).

The key structural commitment: a model is **not** an external blob managed by a separate ML service.
A model is a substrate cell with a weight payload (or a content-addressed pointer to one) and a typed inference contract.
It inherits federation, signing, witness chains, retraction, and stratification by the same rules as any other cell.

## 1. Model record

```json
{
  "kind": "model",
  "id": "<sha256>",
  "slug": "model:dispatch-router-rfc-v3",
  "model-family": "decision-forest",
  "model-architecture": "<architecture-tag>",
  "input-shape": {
    "fiber-projection": "task:<id>",
    "predicates": ["kind", "priority", "requested-skills", "deadline-by-ord"]
  },
  "output-shape": {
    "predicate": "dispatch-to",
    "value-domain": "office:*",
    "confidence": "bilattice-with-threshold"
  },
  "weights-cell": "cell:<sha256>",
  "weights-content-hash": "<sha256>",
  "weights-byte-size": 184320,
  "training-event": "event:<sha256>",
  "training-corpus-cursor": {"ord-low": 12000, "ord-high": 41872},
  "training-loss": {"final": 0.013, "metric": "mean-cross-entropy"},
  "confidence-threshold": 0.78,
  "expected-capability": [
    {"predicate": "respond", "target-pattern": "task:*"}
  ],
  "supersedes": "model:dispatch-router-rfc-v2",
  "retired-at-ord": null
}
```

| Field | Meaning |
|---|---|
| `slug` | Lower-kebab-case identifier per [`decisions/slug-alphabet-lower-kebab.md`](../../decisions/slug-alphabet-lower-kebab.md). |
| `model-family` | One of `markov-chain`, `decision-forest`, `classifier`, `graph-neural-network`, or future families added by spec amendment. The architecture-tag inside the family is not constrained by this spec; out of scope. |
| `input-shape` | Names the fiber projection the model consumes and the predicates it reads from. Read paths are resolved through [`filesystem/presheaf-storage.md`](../filesystem/presheaf-storage.md). |
| `output-shape` | Names the predicate(s) the model writes to and the value domain. |
| `weights-cell` | The cell-id whose payload stores or points to the trained weights. Weights themselves are content-addressed bytes (per [`decisions/content-hash-via-sha256.md`](../../decisions/content-hash-via-sha256.md)). |
| `training-event` | The event that emitted these weights. The event chain is the model's audit trail. |
| `confidence-threshold` | The bilattice value (or the scalar mapped to it via the office's confidence calibration cell) at which the model's output is considered "sufficient" for tier-routing per [`process/computation-tiers.md`](../process/computation-tiers.md) §4. |
| `supersedes` | If non-null, the model-id this version replaces. The supersession chain is replay-discoverable. |
| `retired-at-ord` | If non-null, the event-ordinal at which the model was retracted. Retired models are not selected by the dispatch scheduler. |

## 2. Weights as substrate payload

Weights are stored as a cell whose body is the canonical serialised weight tensor (or hyperparameter dict for tree-based families).
The cell's id is the SHA-256 of the canonical weight bytes; the weight blob is referenced by `weights-cell` on the model record.

For weight blobs above an implementation-defined inline threshold, the cell stores the `weights-content-hash` and a content-addressed pointer into the OS's blob store; the canonical hash is the same in either case.
Replay reproduces the same weights byte-for-byte.

Weight serialisation is family-specific but must be canonical (deterministic byte ordering, fixed precision); the per-family canonicalisation is part of the family's implementation contract and is required to round-trip through the canonical-bytes test in [`conformance-vectors.md`](../conformance-vectors.md).

## 3. Training-event record

```json
{
  "kind": "training-event",
  "id": "<sha256>",
  "model": "model:dispatch-router-rfc-v3",
  "started-at-ord": 41801,
  "finished-at-ord": 41872,
  "training-corpus-cursor": {"ord-low": 12000, "ord-high": 41872},
  "training-corpus-stratum": "settled",
  "training-corpus-shape-cell": "cell:<sha256>",
  "hyperparameters-cell": "cell:<sha256>",
  "loss-trace-cell": "cell:<sha256>",
  "trained-by-session": "session:<id>",
  "produced-weights-cell": "cell:<sha256>",
  "supersedes-model": "model:dispatch-router-rfc-v2"
}
```

The training event names every input that determined the resulting weights:

- the substrate cursor range and stratum the corpus was drawn from,
- the corpus-shape cell that filtered the cursor range to the relevant cells,
- the hyperparameters cell,
- the session that ran the training (capability-fiber-attributed, per [`process/session-as-process.md`](../process/session-as-process.md)),
- the loss trace cell (per-epoch losses; an audit artefact, not used by inference).

Replay of the training-event from a clean cell store with the same source corpus and the same hyperparameters MUST produce the same weights cell-id.
This is what gives non-LM models the same byte-identity property as the rest of the substrate.
(Training algorithms whose internals are non-deterministic — e.g., stochastic GD with un-pinned RNG — must pin RNG state in the hyperparameters cell to satisfy this property; non-pinned training is rejected by the conformance vectors.)

## 4. Inference contract

Inference is invoked by the substrate's standard `respond` primitive against the model record:

```
respond(target=model:<slug>, payload={
  fiber-projection: <projection-spec>,
  cursor-ord: <ord>,
  stratum: "settled"
}, sender=session:<dispatcher-id>)
```

The substrate:

1. Verifies the sender's capability includes `expected-capability` from the model record.
2. Loads the weights cell (cached if hot; loaded from the cell store if cold).
3. Projects the input fiber per the model's `input-shape` against the requested cursor and stratum.
4. Runs the family-specific inference function.
5. Emits the output cell(s) at stratum `"asserted"` with `derived_from` chain `[model-id, weights-cell-id, input-projection-id]` and `computation-tier: tier-2`.
6. Witnesses the inference per the standard signing rules ([`security/signing-and-witnessing.md`](../security/signing-and-witnessing.md)).

Inference is **pure** in the sense of [`functional-runtime-platform/theorems/function-purity-replay-fidelity`](../../../../../../../theories/engineering/theories/tech/theories/computing/theories/predicated-computing/theories/functional-runtime-platform/theorems/function-purity-replay-fidelity.md): same model + same input projection → same output cells, byte-for-byte, on replay or on a peer node holding the same weights.

## 5. Inference output as fiber

Output cells from a Tier-2 model carry:

- The predicted predicate value (e.g., `dispatch-to: office:engineering`).
- A confidence cell at the same subject: `(task:<id>, dispatch-to-confidence, <bilattice-value>, t)` where the bilattice value is computed from the family's native confidence (probability, vote ratio, etc.) by the office's confidence-calibration cell.
- Standard `authored-by-session`, `derived_from`, `computation-tier` attribution.

Downstream closure rules consume the output cells exactly as if they had been authored by any other Tier-1 or Tier-3 source; the algebra does not branch on tier.

## 6. Confidence and the threshold

Confidence is encoded in the bilattice as the value field of a sibling cell (`<predicate>-confidence`).
The model record's `confidence-threshold` is the office's policy: outputs below threshold are emitted at value $\bot$ (no commitment); outputs at or above threshold are emitted at $t$.

A scheduler dispatching at Tier 2 reads back the confidence cell after inference; if $\bot$, it escalates per [`scheduling/tier-routing.md`](../scheduling/tier-routing.md) §5.

The threshold is a substrate cell, so policy can be tuned (and the tuning audited / replayed / federated) without re-training the model.

## 7. Federation

Models federate by the same rules as any other cell, with three additions specified by [`kernel/stratified-facts.md`](../kernel/stratified-facts.md) §5:

1. A peer's model record is absorbed at stratum `"asserted"` by default; using a peer's model for local inference requires a `(peer:<peer>, derivation-trust, model)` cell.
  Without trust, the receiving substrate may still inspect the model record but will not load its weights for inference.
2. Weight-cell payloads are content-addressed; if the local substrate already holds the same weight bytes (e.g., because both peers retrained from the same corpus), no transfer is needed.
3. Training-event records federate so that audit chains remain visible across peers, even when the actual weights are not propagated.

A peer running a different version of a model family (different architecture, incompatible weight encoding) surfaces the disagreement honestly: the model slug is the same; the weight cell-id is different; closure rules can be written to gate inference on a specific weights-cell-id when reproducibility matters.

## 8. Retraction

Retraction obeys the standard stratified-fact discipline:

- Retract a model by appending a new asserted cell `(model:<slug>, retired-at-ord, <ord>, t)`.
- The σ-pass detects dependent-invalidity for every saturated/settled cell whose `derived_from` chain includes the retracted model record or its weight cell.
  Per [`kernel/sigma-delta-passes.md`](../kernel/sigma-delta-passes.md), retraction-cells are emitted at the appropriate stratum.
- The dispatch scheduler stops selecting the retracted model on subsequent ticks.
- Replay through the event log up to the ordinal before retraction reproduces the pre-retraction inference outputs byte-identically; replay past the retraction reproduces the dependent-invalidity propagation.

A retracted model's weights cell remains in the cell store (per [`kernel/computational-model.md`](../kernel/computational-model.md) §6 — entities are reified by participation; old cells remain in the log forever); the retraction is a vocabulary-fold, not a deletion.

## 9. Supersession

A new training event may supersede an earlier model:

- The new model record's `supersedes` field names the prior model.
- The σ-pass automatically prefers the superseding model when the dispatch rule selects "model where target-pattern matches and supersession-chain leads to no further successor"; this is a closure-rule-level discipline, not a kernel privilege.
- The prior model is not retracted — it remains a valid Tier-2 invocation target if a closure rule explicitly references it (e.g., for A/B comparison during validation).

This is what lets the algebraic learning calculus run an indefinite progression of refinements while keeping the audit chain through every prior version.

## 10. Errors

| Code | Meaning |
|---|---|
| `PCS_MODEL_NOT_FOUND` | Referenced model slug doesn't exist or is retracted. |
| `PCS_MODEL_WEIGHTS_MISSING` | Model record is present but the weights cell is unreachable. |
| `PCS_MODEL_FAMILY_UNSUPPORTED` | The model's family is not implemented in the running runtime. |
| `PCS_MODEL_INPUT_SHAPE_MISMATCH` | The requested input projection doesn't match the model's declared input-shape. |
| `PCS_MODEL_TRAINING_NON_DETERMINISTIC` | A training event was rejected because RNG state was not pinned and replay would diverge. |
| `PCS_MODEL_TRUST_DENIED` | A peer's model was selected for inference but the local substrate lacks `derivation-trust` for that peer's model surface. |

## 11. Implementation

### Python (v0.8+)

- Model records as pydantic models.
- Weight blobs stored as content-addressed bytes via the cell store; per-family deserialisation in `pc_models.<family>` modules.
- Inference dispatched by the Tier-2 path of the scheduler ([`scheduling/tier-routing.md`](../scheduling/tier-routing.md)); per-family inference functions are pure Python with deterministic numerics (fixed precision, fixed reduction order).
- Architecture choice (specific scikit-learn / PyTorch / etc. backends) is per-family and out of scope here.

### Rust (v0.8+)

- Model records as serde structs.
- Per-family inference behind a `StatisticalModel` trait; runtime registry maps `model-family` strings to trait implementations.

## 12. Conformance

Non-LM models pass:

1. **Weights byte-identity.** A training event run twice from a clean store on the same corpus + hyperparameters produces the same weights cell-id.
2. **Inference replay.** Same weights + same input projection produces the same output cells across Python and Rust runtimes.
3. **Stratification.** Inference outputs are emitted at `"asserted"`; the σ-pass re-saturates downstream cells against them.
4. **Retraction propagation.** Retracting a model invalidates every settled cell whose `derived_from` chain includes the model record.
5. **Federation.** A model record exchanged between peers verifies its signature; weights load only when peer-trust is present; inference outputs from a trusted peer's model carry the peer attribution forward.
6. **Supersession.** A superseded model is no longer the default but remains invocable when explicitly named.

## 13. Out of scope (here)

- Specific architectures within each family (per-task choice of forest depth, GNN layers, Markov order, etc.).
- Training infrastructure beyond what the substrate exposes (GPU bring-up, dataset versioning beyond the cursor-range corpus pointer, distributed training topology).
- Tier-3 LLM weight storage or fine-tuning flow — covered by the v0.9 plan's existing LLM material.
- The stratified-facts machinery this spec composes against — that lives in [`kernel/stratified-facts.md`](../kernel/stratified-facts.md) and [`kernel/sigma-delta-passes.md`](../kernel/sigma-delta-passes.md).

## 14. Plan 9 / Unix analogue

| Unix concept | Non-LM model analogue |
|---|---|
| Loadable kernel module | Trained model record + weights cell |
| `.so` shared library | Weight cell loaded into runtime by family deserialiser |
| `ldconfig` | The model registry that resolves `model-family` to implementation |
| Reproducible build (Bazel, Nix derivation) | Training-event with pinned RNG and content-addressed corpus |
| `dpkg --remove` | Model retraction with dependent-invalidity propagation |
