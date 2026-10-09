---
type: concept
class: authentication-discipline
depends-on: [authentication-method, account, session, identity-key, identity-key-custody, signature, signature-binds-witness-to-identity]
see-also: [authentication-as-modal-restriction, user, session-establishment]
---

# Authentication flow

The substrate's *concrete user-agent-to-substrate exchange* by which an [authentication-method](authentication-method.md) is presented and verified. Where [authentication-method](authentication-method.md) catalogs *what* authentication options exist, this concept specifies *how* a user-agent (browser, native client, hardware token, IoT device) actually performs the authentication ritual against the substrate's HTTP / WebSocket / direct-connection surfaces.

In the substrate's hyperdoctrine setting, an authentication flow is *the operational protocol that transitions an [account](account.md)'s [bilattice accessibility relation](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/bilattice-accessibility-relation.md) for the requesting user-agent from $\bot$ (uninformed) to $\mathbf{t}$ (told-true) by producing a verifiable signature*. Per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), the resulting [session](session.md) is the modal restriction $\Box_R$ of the account's capability fiber along the user-agent's accessibility cell.

## Why this concept exists

[authentication-method](authentication-method.md) lists kinds (password, MFA, SSO, OAuth, public-key, biometric, recovery). [identity-key-custody](../../teaching/explanations/identity-key-custody.md) handles where the substrate's own private keys live. But neither specifies *the user-agent-to-substrate protocol* for any concrete flow. Without that, two implementations of "WebAuthn authentication" can be wire-incompatible — same authentication method, different flows.

This concept fixes the substrate-level flow primitives and lists the canonical realizations.

## The substrate-level flow primitives

Every authentication flow uses these substrate-level primitives:

- **Challenge.** The substrate emits a fresh nonce (canonical-form bytes), recorded as a substrate predication `auth-challenge:{nonce}` with a short TTL.
- **Response.** The user-agent computes a method-specific response over the challenge — for public-key, an Ed25519 signature; for password, the password+nonce hash; for OAuth, an authorization-code-exchange-result.
- **Verification.** The substrate verifies the response per the authentication method's discipline. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), public-key verification is structurally bound; per [authentication-method](authentication-method.md), other methods have their own verification.
- **Session establishment.** On verified response, the substrate admits a `session:{id}` cell with the authenticated-account binding, the authentication-method-used predication, and a session-validity ordinal range. Per [session-establishment](session-establishment.md), the session establishment discipline produces a substrate predication tying the session to the authenticated identity.

## Canonical authentication flows

### Public-key (substrate-native)

The cleanest flow. The user-agent holds an Ed25519 keypair (per [identity-key-custody](../../teaching/explanations/identity-key-custody.md)), the substrate has the corresponding public-key in the account's authentication-method records.

1. User-agent connects, requests `/auth/challenge?account={account-hash}`.
2. Substrate emits a fresh nonce $n$, records `auth-challenge:{n}` with TTL = 60s.
3. Substrate returns the nonce to the user-agent.
4. User-agent signs $n$ with its private key, produces signature $\sigma$.
5. User-agent POSTs `/auth/respond` with `{nonce: n, signature: σ, account-hash: ...}`.
6. Substrate verifies $\sigma$ against the account's recorded public-key. On success: admit `session:{id}` cell, return session-id to user-agent.
7. User-agent uses session-id (typically as cookie) on subsequent requests.

Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the session is structurally bound to the user-agent's identity-key holder. Per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), this is the strongest binding among the flows.

### WebAuthn (browser-mediated public-key)

Public-key flow mediated by browser's WebAuthn API. The user's keypair is held in a hardware token (YubiKey, TouchID, etc.); the browser proxies challenge/response.

1. User-agent fetches `/auth/webauthn/challenge?account={account-hash}`.
2. Substrate emits WebAuthn-formatted challenge per [@w3c-webauthn-l3].
3. Browser invokes `navigator.credentials.get(challenge)` — user authorizes the keypair.
4. Browser POSTs the WebAuthn assertion to `/auth/webauthn/respond`.
5. Substrate verifies per WebAuthn spec, admits session.

The substrate's underlying mechanism is identical to substrate-native public-key; WebAuthn is a deployment-friendly wrapper.

### Magic-link (email-mediated)

For users without an installed identity-key. Authenticates via email-channel possession.

1. User enters email at `/auth/magic-link/start`.
2. Substrate looks up account by email, generates a fresh signing nonce, signs it with the substrate's own key, embeds in a one-time URL.
3. Substrate emits the URL to the email channel (per [federation-envelope](../../teaching/explanations/federation-envelope.md), this is a federation message to the email-interfacer).
4. User receives email, clicks link, browser GETs `/auth/magic-link/verify?token={signed-nonce}`.
5. Substrate verifies its own signature on the nonce, admits session.

Weaker than public-key (depends on email-channel security) but useful for first-time setup or kiosk scenarios.

### OAuth / OIDC (delegated)

Authentication delegated to an external identity provider (Google, GitHub, Okta).

1. User clicks "Sign in with X" at `/auth/oauth/start?provider=X`.
2. Substrate redirects to the provider's OAuth endpoint with substrate's client-id.
3. User authenticates with provider; provider redirects back with auth-code.
4. Substrate exchanges auth-code for access-token via provider's token endpoint.
5. Substrate fetches user profile from provider, matches to substrate account.
6. Substrate admits session, recording the OAuth-provider attestation as the authentication-method-used.

Per [doctrine-fidelity-via-faithful-interfacer-functor](../../../theorems/doctrine-fidelity-via-faithful-interfacer-functor.md), the OAuth provider is an external interfacer; the substrate's OAuth flow is faithful in the limited sense that the provider's user-attribution is preserved.

### Step-up

For sensitive operations (changing custody, admitting governance changes), an existing session may need step-up authentication — re-prove identity via a stronger method.

1. User attempts sensitive operation, substrate evaluates the operation's required-auth-strength.
2. If session's authentication-method strength < required, substrate emits `auth-step-up-required:{session, required-method}`.
3. User-agent runs the additional flow (typically public-key or WebAuthn).
4. Substrate updates the session with the higher-strength attestation.
5. Original operation proceeds.

## Kiosk / shared-device scenarios

When the user doesn't have their identity-key on the device:

- *Magic-link* via email or messaging app.
- *Cross-device QR* — substrate displays QR with auth-challenge; user scans with their phone, signs there, phone POSTs response.
- *Temporary credential* — short-lived password issued by the user's primary substrate, valid for limited operations on the kiosk.

Per [identity-key-custody](../../teaching/explanations/identity-key-custody.md), the substrate's discipline is to use the strongest method available; the kiosk fallback is policy on the account.

## Failure handling

Per [witness](../../../objects/witness.md), every authentication attempt — successful or failed — produces a witness. Per [audit-content-via-inconsistency-sheaf-cohomology](../../../theorems/audit-content-via-inconsistency-sheaf-cohomology.md), repeated failed attempts produce $\top$-cells in the inconsistency sheaf — surfacing potential attack patterns.

The substrate's rate-limiting and lockout policies are themselves substrate content: per-account, per-source-IP, per-method.

## Position

The authentication flow is the *user-facing seam* between the substrate's identity discipline and its session discipline. Per [session-establishment](session-establishment.md), the session establishment proceeds on a verified flow; per [authentication-as-modal-restriction](../theorems/authentication-as-modal-restriction.md), the resulting session's capability is the modal restriction along the flow's accessibility cell.

The concept composes with [authentication-method](authentication-method.md) (the catalog of methods), with [identity-key-custody](../../teaching/explanations/identity-key-custody.md) (where keys live for public-key flows), with [federation-envelope](../../teaching/explanations/federation-envelope.md) (magic-link and other email-mediated flows), and with [user](user.md) (the account's owner the flow authenticates).
