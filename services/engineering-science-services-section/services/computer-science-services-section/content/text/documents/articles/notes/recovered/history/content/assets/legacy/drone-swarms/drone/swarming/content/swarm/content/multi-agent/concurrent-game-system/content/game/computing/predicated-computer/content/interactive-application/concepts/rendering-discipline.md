---
type: concept
class: ux-discipline
depends-on: [doctrine-fidelity, doctrine-fidelity-via-faithful-interfacer-functor, interfacer, predication-fibration, hash-discipline, canonical-form]
see-also: [message-data-model, form, document, list]
---

# Rendering discipline

The substrate's *commitment that user-visible output is a faithful projection of substrate content* — the discipline by which substrate predications become HTML, JSON, plain text, or other user-facing formats without losing structure. In the substrate's hyperdoctrine setting, rendering is *the extract direction of an [interfacer](../../teaching/explanations/interfacer.md) functor*, and per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the rendering is faithful — distinct substrate content produces distinct rendered output.

## Why this concept exists

The substrate's [doctrine-fidelity](../../teaching/explanations/doctrine-fidelity.md) covers the *admission* direction (external content → substrate predications) and requires that admissions be faithful. The matching *extract* direction — substrate predications → user-visible output — has been implicit. This concept makes it explicit, with the same faithfulness discipline applied symmetrically.

Without explicit rendering discipline, two implementations of "render this message as HTML" can produce different output for the same substrate content — breaking conformance, making cross-implementation comparison meaningless.

## The rendering pipeline

For any user-facing surface (web GUI, CLI, JSON API, push notification), rendering proceeds:

1. **Resolution.** Given an entity-hash or pattern, fetch the substrate predications in scope.
2. **Type dispatch.** Per the entity's `kind` predication (e.g., `message`, `form`, `document`), select the appropriate renderer.
3. **Predication walk.** The renderer traverses the entity's predications, building the output structure.
4. **Format emission.** The renderer emits the chosen format (HTML, JSON, text, etc.) — canonical for the format's conventions.
5. **Sanitization.** For formats that admit injection (HTML), apply content-security-policy sanitization; for plain text, escape control characters.
6. **Caching.** Per [cache-coherence-via-functorial-projection](../../../theorems/cache-coherence-via-functorial-projection.md), the rendered output keyed by content-hash is forever-coherent — the substrate may cache.

## Rendering as faithful interfacer

Per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the substrate's interfacers are faithful functors $I: \mathcal{S} \to \mathrm{Pred}(\mathcal{C})$ from external representation to substrate predications. The rendering operation is the *right adjoint* — the extract $E: \mathrm{Pred}(\mathcal{C}) \to \mathcal{S}$ — satisfying the counit law $\mathrm{extract}(\mathrm{apply}(\Delta, c)) = \mathrm{extract}(c) \oplus \Delta$.

For rendering specifically:

- $\mathcal{S}$ is the rendering format's category (HTML elements, JSON values, text spans).
- $I$ is the parsing direction — admitting external HTML/JSON/text into substrate predications.
- $E$ is the rendering direction — emitting substrate predications as HTML/JSON/text.
- The counit law: rendering substrate content, then re-parsing, recovers the original predications (modulo declared kernel like CSS classes that don't carry semantic content).

Per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the round-trip is faithful — rendering doesn't lose information that the substrate holds.

## Renderer kinds

The substrate's renderers are themselves substrate content — registered per `kind` predicate. Each renderer is a function `(predications) -> output-bytes` plus a content-type:

- **Message renderer.** Per [message-data-model](message-data-model.md), renders a `message` entity as an email-style view (header, body, attachments).
- **Form renderer.** Renders a `form` entity as input fields with submission button.
- **Document renderer.** Renders a `document` entity as flowing prose with embedded media.
- **List renderer.** Renders a `list` entity as an iterable view with per-item sub-rendering.
- **Structured-body renderer.** For `application/predicated.structured` content (per [message-data-model](message-data-model.md)), dispatches to the body's `kind` and applies the matching renderer.

Renderer registration is via substrate predication — adding a new entity kind requires admitting a renderer-record alongside.

## Rendering targets

A renderer may emit multiple targets per content-type:

- **HTML.** For browser display. Server-rendered (per `decisions/web-gui-server-rendered-html.md`); minimal client-side JavaScript.
- **JSON.** For API consumption. Canonical-JSON per [canonical-form](../../teaching/explanations/canonical-form.md).
- **Plain text.** For terminal display, accessibility, or text-only email.
- **Markdown.** For markdown-rendering surfaces (chat apps, documentation).
- **Print-friendly HTML.** For PDF generation.

Per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), each target's renderer is a separate interfacer; the substrate maintains all faithfully.

## Caching

Per [cache-coherence-via-functorial-projection](../../../theorems/cache-coherence-via-functorial-projection.md), rendered output keyed by canonical-form hash is structurally coherent — same substrate content produces same rendered output. The substrate's discipline:

- Cache key: `(renderer-version, content-type, target-format, content-canonical-hash)`.
- Cache entries are valid forever (no invalidation needed).
- Cache may be evicted for memory pressure (re-rendering reproduces same output).

This is the substrate's structural "render once, serve many" — no cache-invalidation hard problem because the cache is content-addressed.

## Sanitization

For HTML rendering specifically, sanitization is required to prevent XSS and content-injection. The substrate's discipline:

- The renderer emits a tree structure (DOM-like) rather than raw HTML strings.
- Sanitization is applied at tree-emit time: known-safe elements and attributes pass through; unknown or dangerous (script, iframe, javascript: URLs) are stripped.
- Content-Security-Policy headers are set by the HTTP layer based on the renderer's declared safety profile.

Per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), repeated sanitization-trigger events produce $\top$-cells in the inconsistency sheaf — surfacing potential XSS attack patterns.

## Per-user rendering

Rendering may depend on the requesting user's:

- Preferences (per [user-state-predications](user-state-predications.md), the user's `notification-preference`, `theme`, `locale`).
- Capabilities (per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), the session's $\Box_R$-restricted capability — fields the user isn't authorized to see are omitted).
- Device (mobile vs desktop affects layout, format choice).

Per the rendering pipeline, the user's session is part of the renderer's input; the same substrate content may render differently per user. Per [hash-injectivity-under-canonical-form](../../../theorems/hash-injectivity-under-canonical-form.md), the per-user rendering's cache key includes the user's relevant preferences.

## Position

Rendering discipline is the substrate's *user-output primitive*. Per [doctrine-fidelity](../../teaching/explanations/doctrine-fidelity.md), substrate content is faithfully represented; per this concept, the user-facing output is a faithful projection of that content; per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the projection is itself a faithful functor satisfying the counit law.

The concept composes with [interfacer](../../teaching/explanations/interfacer.md) (rendering is an interfacer's extract direction), with [message-data-model](message-data-model.md) (messages are a primary rendering target), with [form](form.md) (forms render as input fields), with [user-state-predications](user-state-predications.md) (per-user rendering), and with [cache-coherence-via-functorial-projection](../../../theorems/cache-coherence-via-functorial-projection.md) (rendering caches).
