---
name: llm-endpoint-record
description: LLM endpoint record
type: definition
class: record
instantiates: [agent-record]
specializes: [agent-record]
depends-on: [agent-record, fiber, witness, scope, boundary, cost-discipline]
see-also: [routable-llm-endpoint-as-swarm-participant, endpoint-as-outbound-swarm-participant, monetary-cost-as-quantale-extension, rate-limit-as-time-windowed-availability-predication, dispatch]
title: llm-endpoint-record
---

# LLM endpoint record

The substrate-record holding one routable external LLM endpoint's identity, capability, cost, and availability.
An `LLMEndpointRecord` is a specialization of [`AgentRecord`](agent-record.md) restricted to *outbound-only* handedness: the swarm dispatches to the endpoint; the endpoint never initiates and never admits substrate envelopes.

Per [endpoint-as-outbound-swarm-participant](../../endpoint-as-outbound-swarm-participant/endpoint-as-outbound-swarm-participant.md), endpoints are not [confederation](../../architecture/confederation/confederation.md) peers — they have no substrate, no event log, no rule-system version, no governance over their own admission discipline.
They are *outbound-handed swarm participants*, recorded in the sovereign node's flatfile so that [dispatch](../morphisms/dispatch.md) can route work to them via the same `office ⊙ task-requirement` algebra used for human or code agents.

## Required fields

Every conforming realization SHALL hold, for each `LLMEndpointRecord`:

### Identity

- **`name`** — canonical identifier within the substrate (e.g., `cerebras-llama-3.3-70b`).
- **`type`** — fixed at `llm-endpoint`.
  Distinguishes this record from a human or code agent.
- **`provider`** — the upstream service (`cerebras`, `nvidia-nim`, `groq`, `mistral-la-plateforme`, `huggingface-router`, …).
- **`model-name`** — the provider-side model identifier the endpoint dispatches to.
- **`model-version`** — version string, when the provider exposes one.
- **`base-url`** — the OpenAI-compatible endpoint URL the runtime calls.
- **`auth-env-var`** — environment-variable name carrying the API key.
  The substrate stores the variable *name*, not the secret; the runtime resolves the secret at dispatch time.

### Handedness

- **`handedness`** — fixed at `outbound-only`.
  Per [swarm-participation-handedness](../../swarm-participation-handedness/swarm-participation-handedness.md), this is what makes the endpoint a swarm participant *receivable by* dispatch but not *receivable from* — the endpoint cannot initiate work, cannot admit envelopes, cannot sign witnesses.

### Capability

- **`provides-capabilities`** — a list of capability predicates the endpoint provides (e.g., `[text-generation, instruction-following, structured-output]`).
- **`work-types`** — list of work-type predicates the endpoint handles (drawn from the same taxonomy human and code agents draw from; shared vocabulary is what makes [`dispatch`](../morphisms/dispatch.md)'s composition produce non-$\bot$ rankings — fibers that share zero predicate-object pairs have nothing to fuse).
- **`context-window-tokens`** — integer, the model's input-context capacity.
- **`supports-tool-calling`** — boolean.
- **`supports-structured-output`** — boolean (typically: JSON schema grammar enforcement).
- **`grade`** — coarse capability tier (`small`, `mid`, `large`, `frontier`).
  Used by closure-rule predications that prefer higher-grade models for precision-sensitive work.

### Cost

Per [monetary-cost-as-quantale-extension](../../monetary-cost-as-quantale-extension/monetary-cost-as-quantale-extension.md), monetary cost is a second dimension of the [cost-discipline](../../../../../../../../../../../../../../../../engineering-services-section/content/text/glossary/concepts/cost-discipline.md)'s product Lawvere quantale.
Both dimensions are recorded as predications:

- **`cost-per-token-in`** — dollars per input token, in the cost quantale.
- **`cost-per-token-out`** — dollars per output token.
- **`monthly-budget-tokens`** — provider-side cap, when applicable; informs long-window budget tracking.

Free-tier endpoints carry $0$ in the dollar dimension; the settlement-fuel dimension still applies (an LLM call is a settling action and consumes substrate fuel regardless of its dollar cost).

### Availability

Per [rate-limit-as-time-windowed-availability-predication](../../rate-limit-as-time-windowed-availability-predication/rate-limit-as-time-windowed-availability-predication.md), rate-limit availability is a *tracking-stage observation* on the endpoint, not a static field.
The endpoint record carries the rate-limit *parameters* (max requests per window, max tokens per window, window duration); the *current budget* is held on a separate observation entity that the dispatch consults via walk-most-recent-first.

- **`rate-limit-rpm`** — provider-declared requests-per-minute cap.
- **`rate-limit-rpd`** — requests-per-day cap, where applicable.
- **`rate-limit-tpm`** — tokens-per-minute cap.
- **`rate-limit-tpd`** — tokens-per-day cap, where applicable.

The corresponding [observation](../../../../../../../../../../../humanities/theories/sociology/theories/work/theories/predicated-work/objects/observation.md) entities carry cells like:

```yaml
<endpoint-name>:
  rate-limit-budget:
    - window-start: 2026-05-04T14:00:00Z
      window-duration: PT1M
      requests-used: 12
      tokens-used: 4200
      observed-at: 2026-05-04T14:00:42Z
      observed-via: provider-header   # or self-counted, or 429-forced-zero
```

These observations are bilattice-graded by their `observed-via` cell: `provider-header` carries high evidence; `self-counted` carries medium evidence (substrate's count may diverge from provider's); `429-forced-zero` carries maximum evidence on `at-zero` plus a cooldown derived from `retry-after`.

### Provenance

- **`enrolled-at`** — substrate timestamp of the endpoint's enrollment.
- **`enrolled-by`** — reference to the [`AgentRecord`](agent-record.md) of the office that admitted the endpoint to the swarm.
- **`survey-cited`** — reference to the public-resource survey this enrollment was based on (e.g., [survey-of-free-cloud-model-endpoints-may-2026](../../../../../notes/2026/05/04/2026-05-04-survey-of-free-cloud-model-endpoints-may.md)).

## Invariants

- **No signing key.** Unlike a substrate-native `AgentRecord`, an `LLMEndpointRecord` SHALL NOT carry a `signing-key`.
  Endpoints cannot sign witnesses; their outputs enter the substrate via the boundary's `extract` operation, witnessed by the *dispatching* office (which is substrate-native and signs the admission).
  The witness chain is `dispatcher → endpoint-call → admitted-output`; the endpoint is named in the witness's `via` slot, never its `actor` slot.
- **Outbound-only.** No closure rule SHALL produce an envelope from an `LLMEndpointRecord`.
  Attempting to admit a message naming an endpoint as the `from` field SHALL produce a $\top$ on the envelope's authenticity cell and be rejected at the boundary.
- **Cost-witnessed.** Every dispatch settle-action against an endpoint SHALL emit a cost-witness on the cost-tracking channel, denominated in the product quantale (settlement fuel × dollars × tokens-against-budget).
  Endpoint dispatches without cost-witnesses are non-conformant — the substrate's dollar-cost ledger depends on the witness chain being complete.
- **Capability-bounded.** Endpoint capabilities are restricted to the `provides-capabilities` list.
  A dispatch attempting to route work requiring a capability the endpoint lacks SHALL fail at $\delta$-computation (Prop 2: $\mathbf{f}$ as $\odot$-absorber).
- **Identity-stable per provider terms.** Re-enrollment under a renamed model (e.g., when a provider deprecates `llama-3.3-70b` and renames to `llama-3.4-70b`) creates a new `LLMEndpointRecord`; the old record remains for audit but is marked `deprecated-at`.

## What an `LLMEndpointRecord` is not

- **Not a confederation peer.** Confederation peers are sovereign nodes; endpoints are not.
  The peer-record relation does not apply.
- **Not a session.** Each dispatch to an endpoint is its own [execution-event](../../../../../../../../../../../../../../social-science-services-section/services/social-theory-science-services-section/content/text/glossary/terms/execution-event.md).
  An endpoint has no sustained session in the substrate's sense.
- **Not the LLM model itself.** A model (e.g., `llama-3.3-70b`) is a model identity that may be served by multiple endpoints (Cerebras, Groq, NVIDIA NIM all serve `llama-3.3-70b` at different speeds and price points).
  Each `(model, provider)` pair is its own endpoint record.

## Position

`LLMEndpointRecord` is what makes the dispatch algebra reach across the boundary to external LLM inference without the algebra losing any of its discipline.
The dispatch's eligibility filter, capability-match, and cost-comparison all see endpoints as ordinary swarm participants; the only specialization is the runtime's settle-action — for an endpoint, the settle-action is an HTTPS call to `base-url`, with the response parsed into substrate predications via the boundary's `extract` operation, the dispatch office signing the admission witness.

The record composes with [`AgentRecord`](agent-record.md) (it specializes), [`OfficeRecord`](office-record.md) (the endpoint's effective office is a degenerate office whose only granted skill is `answer-inference-call`), [`Witness`](witness.md) (every call emits a cost-witness; the witness chain references the endpoint via `via`), and the boundary fiber (admission of the response).
