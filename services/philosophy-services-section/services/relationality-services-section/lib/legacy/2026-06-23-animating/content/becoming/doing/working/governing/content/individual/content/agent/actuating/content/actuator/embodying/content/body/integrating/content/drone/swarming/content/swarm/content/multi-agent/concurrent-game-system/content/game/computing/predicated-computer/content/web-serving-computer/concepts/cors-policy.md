---
type: concept
class: web-protocol
depends-on:
  - endpoint
  - trust-boundary
  - federation-envelope
  - witness
  - bilattice-accessibility-relation
  - four-bilattice
  - modal-necessity-operator
  - predication-fiber-algebra
see-also:
  - middleware
  - cors-as-bilattice-graded-origin-accessibility
  - federation-trust-bilattice-graded
  - governance-as-modal-restriction
  - http-method-discipline-via-fibration-generators
  - status-code-classes-as-four-bilattice-values
  - bearer-token
---

# CORS policy

The *substrate-recorded cross-origin admission policy* on an [endpoint](endpoint.md) or scope: which web origins (scheme + host + port) are admitted to issue requests against the substrate from a browser context, with what credentials, on which methods, on which custom headers.

Per [cors-as-bilattice-graded-origin-accessibility](../theorems/cors-as-bilattice-graded-origin-accessibility.md) (proved), the policy is *not* a Boolean allow-list: it is structurally a [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) $R_{\mathrm{cors}} : O \times E \to \mathbf{FOUR}$ from web origins $O$ to policy-bearing endpoints $E$, valued in the [four-bilattice](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/four-bilattice.md). The preflight `OPTIONS` response is the [modal necessity operator](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/modal-necessity-operator.md) $\Box_{R_{\mathrm{cors}}}$ applied to the requested (method, header, credential) cell — i.e., the substrate's restriction of the requested cross-origin permission along the origin's accessibility row. Boolean allow-lists cannot represent the $\bot$ (origin unknown to policy) and $\top$ (origin admitted-and-denied by overlapping declarations) cells distinctly, and therefore cannot accurately reflect CORS states that arise during onboarding, revocation, and policy reconciliation.

## Policy fields and their math roles

A CORS policy declares six field families, each mapping to a fixed coordinate of $R_{\mathrm{cors}}$:

- **Allowed origins ↔ the $O$-axis cells assigned $\mathbf{t}$.** The set of `Origin:` values admitted, as a finite list, a pattern (`*.example.com`), or the wildcard `*` (with restrictions when credentials are involved). Each entry assigns one or more cells of $R_{\mathrm{cors}}$ a $\mathbf{t}$ value at the endpoint coordinate.
- **Allowed methods ↔ the method coordinate of the endpoint's CORS-permission cell.** Reflected on preflight `OPTIONS` responses as `Access-Control-Allow-Methods`. Per [http-method-discipline-via-fibration-generators](../theorems/http-method-discipline-via-fibration-generators.md), each HTTP method is a fibration generator; CORS restricts which generators a cross-origin caller may invoke.
- **Allowed headers ↔ the header coordinate of the cell.** Which non-simple headers the cross-origin request may carry (`Authorization`, `Content-Type: application/json`, custom `X-*` headers). Each header dimension extends the cell's coordinate space.
- **Credentials admission ↔ the credential coordinate.** Whether `Cookie`, `Authorization`, or client TLS credentials may be sent (`Access-Control-Allow-Credentials: true`). The credential dimension binds the cell to the principal-evidence coordinate per [bearer-token-as-bound-evidence-vector](../theorems/bearer-token-as-bound-evidence-vector.md).
- **Exposed response headers ↔ the response-projection coordinate.** Which response headers the cross-origin script may read (`Access-Control-Expose-Headers`). This is the dual: not what the browser may *send*, but what it may *observe* in the response.
- **Preflight cache ↔ time-accessibility for $R_{\mathrm{cors}}$.** `Access-Control-Max-Age=N` is, per [cache-control-as-modal-necessity-along-time-accessibility](../theorems/cache-control-as-modal-necessity-along-time-accessibility.md), the substrate's claim that $R_{\mathrm{cors}}$ is stable along the time-accessibility relation $R_{\le N}$. A substrate that rotates CORS policy faster than the declared `Max-Age` violates its own necessity claim — same doctrine failure as a `Cache-Control` violation.

Per [self-representation](../../teaching/explanations/self-representation.md), the CORS policy is substrate content; the substrate cannot apply CORS that is not declared. Per [witness](../../../objects/witness.md), every CORS-bearing exchange (preflight, simple cross-origin, credentialed cross-origin) is recorded, so an auditor can verify the policy was honored.

## The four CORS bilattice values

Each value expresses a *real* CORS state the substrate encounters; their distinct treatment is what Boolean allow-lists cannot reproduce:

- $\mathbf{t}$ — **origin admitted**: the policy explicitly permits the origin (literal match, pattern match, or wildcard with conditions met). Wire response: `200 OK` with the full `Access-Control-Allow-*` header set.
- $\mathbf{f}$ — **origin denied**: the policy explicitly revokes the origin (deny-listed, security-incident response, retired tenant). Wire response: `403 Forbidden`, or `200` *omitting* the `Access-Control-Allow-*` headers (browser refuses the actual request when preflight does not affirm). The $\mathbf{f}$ carries *negative evidence* — a logged governance decision.
- $\bot$ — **origin unknown**: the policy carries no statement about this origin. Per CORS's client-side closed-world default, the browser treats $\bot$ as forbidden, but the substrate's $\bot$ is *epistemically distinct* from $\mathbf{f}$: it carries no negative evidence. A subsequent governance decision can move $\bot$ to $\mathbf{t}$ or $\mathbf{f}$ without contradicting prior policy. Wire response: omits `Access-Control-Allow-Origin`.
- $\top$ — **origin admitted-and-denied**: two overlapping declarations contradict (e.g., wildcard `*.example.com` admits, specific `evil.example.com` denies; or two operators recorded contradictory governance decisions). Per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md), the policy must resolve the $\top$-cell before responding. Wire response: `5xx` until governance reconciles, *not* a silent collapse to $\mathbf{t}$ or $\mathbf{f}$.

CORS is the browser-context specialization of the substrate's general [trust-boundary](../../teaching/explanations/trust-boundary.md) discipline: where general trust is per-peer in the [federation-envelope](../../teaching/explanations/federation-envelope.md), CORS is per-origin and *enforced by the client browser*. The substrate's role is to declare the policy; the browser's role is to enforce it on the client side.

## Preflight as $\Box_{R_{\mathrm{cors}}}$

A browser's preflight request is `OPTIONS /resource` with `Origin: https://o.example.com`, `Access-Control-Request-Method: PUT`, `Access-Control-Request-Headers: Authorization, Content-Type`. Per [http-method-discipline-via-fibration-generators](../theorems/http-method-discipline-via-fibration-generators.md), `OPTIONS` is the converse-self-adjoint introspection — it asks "what can be done at this resource?". The CORS-augmented `OPTIONS` further restricts that introspection to "what can be done *by this origin* at this resource, with these headers and credentials?". This is exactly the modal-necessity restriction of the cross-origin permission cell along the request's accessibility-relation row — the [predication fiber algebra](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) value at fiber $A_p$ for $p$ encoding (method, headers, credentials, audience), restricted along $R_{\mathrm{cors}}(o, -)$.

## Composition with federation trust

CORS composes with the parent's federation-trust discipline under a single modal calculus. When a browser request carries a credential bound to a federated peer (per [bearer-token-as-bound-evidence-vector](../theorems/bearer-token-as-bound-evidence-vector.md)), the effective accessibility is the *knowledge-meet* of the CORS cell and the federation-trust cell:

$$R_{\mathrm{eff}}(o, e) \;=\; R_{\mathrm{cors}}(o, e) \wedge_k R_{\mathrm{fed}}(\mathrm{peer}(o), e).$$

The $\wedge_k$ is the bilattice's knowledge meet: the safest information both relations agree on. A request admitted by CORS but denied by federation-trust resolves to $\bot$ (no joint knowledge) or $\mathbf{f}$ (joint denial), depending on which side carried negative evidence — *not* to $\mathbf{t}$. Per [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md), this composition is exactly the modal-restriction calculus the substrate already uses for governance.

## Operations on $R_{\mathrm{cors}}$ as bilattice moves

- **Onboarding origins ↔ $\bot \to \mathbf{t}$ move.** A new origin enters the policy at $\bot$ and is promoted to $\mathbf{t}$ by an explicit governance decision recorded as substrate content. The intermediate state (origin requested, governance pending) is structurally $\bot$ on the policy *and* $\bot$ on a separate request-tracking cell — distinct from the $\mathbf{f}$ of an explicitly denied origin.
- **Revocation ↔ $\mathbf{t} \to \mathbf{f}$ move with audit trail.** A revoked origin's accessibility cell is set to $\mathbf{f}$ by a governance decision; the prior $\mathbf{t}$ is preserved in the witness chain so an auditor can verify when admission was granted and when revoked. A Boolean policy that simply removes the entry loses this audit trail (the cell collapses to "absent" — $\bot$ in our framing — losing the explicit refusal).
- **Wildcard-plus-revocation ↔ a controlled $\top$.** A common policy shape — "admit `*.example.com` but deny `compromised.example.com`" — is exactly a $\top$-cell at the compromised origin: admitted by wildcard, denied by specific entry. Per [repair-as-top-cell-resolution](../../../theorems/repair-as-top-cell-resolution.md), the substrate's repair catalog must declare the resolution rule (priority: specific-overrides-wildcard, with witnessed resolution). Without an explicit resolution rule, the substrate is in $\top$ and must respond `5xx` rather than silently collapse.

## What the discipline refuses

- **Boolean allow-lists.** A pure allow-list (`origins: [list]`, request admitted iff `Origin ∈ list`) cannot represent $\bot$ vs $\mathbf{f}$ or $\top$ vs $\mathbf{t}$. Implementations that use this shape silently coerce the substrate's epistemic state.
- **Per-request dynamic CORS.** A "policy" computed per-request from runtime state outside the substrate (e.g., GeoIP-based admission) is not an accessibility relation in $R_{\mathrm{cors}}$ — it is a non-substrate-content dispatch. Per [self-representation](../../teaching/explanations/self-representation.md), CORS policy must be substrate content; runtime-derived policy is admissible only when the runtime input is itself substrate content (e.g., a federated threat-intel feed admitted via the parent's federation discipline).
- **Reflecting `Origin` without policy lookup.** The pattern `Access-Control-Allow-Origin: <verbatim Origin header>` regardless of policy is the absence of $R_{\mathrm{cors}}$: the substrate is not consulting an accessibility relation at all. This trivially satisfies any browser's CORS check; it provides no security and no audit. The wire response must reflect the substrate's actual policy verdict, not echo the request.
- **Credentialed-wildcard.** The CORS spec's prohibition on `Access-Control-Allow-Origin: *` with `Access-Control-Allow-Credentials: true` is the bilattice fact that the wildcard $\mathbf{t}$ on origin and the credentials' $\mathbf{t}$ on principal carry independent evidence; their join in the knowledge order is well-defined but the *projection* to a single response is information-collapsing. The wire response must specifically name the single admitted origin when credentials are admitted.
- **Silent suppression collapsing $\bot$ and $\mathbf{f}$ at the wire.** Some implementations omit `Access-Control-Allow-Origin` in both the unknown and denied cases. The substrate's audit trail must distinguish: a $\mathbf{f}$ response is a logged governance decision; a $\bot$ response is an absence of decision.

## Position

CORS is the web-server-platform's instantiation of the bilattice-graded accessibility-relation discipline at the browser-context boundary. Together with [federation-trust-bilattice-graded](../../../theorems/federation-trust-bilattice-graded.md) (peer-to-peer accessibility) and [governance-as-modal-restriction](../../agential-orchestration-platform/theorems/governance-as-modal-restriction.md) (the universal modal calculus over both), it completes the substrate's account of cross-boundary admission: CORS for browser context, federation-trust for substrate-to-substrate, governance for the calculus that composes them. All three are bilattice accessibility relations on the same `FOUR`-valued substrate apparatus; the wire-protocol differences are realizations of the same modal move at different boundary types.
