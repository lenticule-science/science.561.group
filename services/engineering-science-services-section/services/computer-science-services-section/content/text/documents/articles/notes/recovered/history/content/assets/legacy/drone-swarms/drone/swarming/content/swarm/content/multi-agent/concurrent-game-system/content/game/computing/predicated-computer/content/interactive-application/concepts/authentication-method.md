---
type: concept
class: authentication-discipline
depends-on: [account, identity-key, signature, encryption]
see-also: [user]
---

# Authentication method

A *substrate-recorded mechanism by which a user proves they are the owner of an [account](account.md)*. The substrate distinguishes several authentication-method kinds, each with different security properties and substrate-content shapes.

Common authentication methods:

- **Password** — a salted, hashed shared secret. The substrate stores the hash, not the plaintext; per [encryption](../../teaching/explanations/encryption.md), the hash itself may be encrypted-at-rest. Authentication: the user supplies a candidate, the substrate hashes-and-compares.
- **Multi-factor authentication (MFA)** — a primary method (password) combined with a second factor (TOTP code, hardware token, biometric). The substrate records the MFA-secret (TOTP seed, public key) and verifies the user-supplied second-factor at authentication.
- **SSO (single sign-on)** — authentication delegated to an external identity provider (Google, GitHub, Okta, Auth0). The substrate records the SSO-provider configuration; authentication is "the SSO provider asserts this user is who they claim."
- **OAuth** — authentication via OAuth-compliant identity providers, returning an access token the substrate verifies.
- **Public-key authentication** — direct cryptographic identity-key authentication (per [identity-key](../../teaching/explanations/identity-key.md)). The user signs a challenge with their private key; the substrate verifies against their identity-record.
- **Biometric** — fingerprint, face, voice, etc., typically via a host-managed biometric subsystem. The substrate records that biometric authentication is admissible; the actual verification happens at the host.
- **Recovery key** — backup authentication for account recovery when primary methods are unavailable.

Per [self-representation](../../teaching/explanations/self-representation.md), authentication methods are substrate content: which methods an account admits, when they were added, when they were rotated, when they failed. Per [witness](../../../objects/witness.md), every authentication attempt produces a witness — successful or failed. Auditors can review authentication history.

The substrate's authentication discipline:

- **Multiple methods admissible.** An account may have multiple methods; the substrate's policy determines which (or which combination) is required for any operation.
- **Rotatable.** Methods can be added, retired, replaced. Per [identity-record](../../../objects/identity-record.md), the rotation chain is preserved.
- **Federation-portable.** When users federate to a peer substrate, their authentication-method records can be exported (with privacy/security caveats — passwords don't export; SSO and public-key do).
- **Step-up admissible.** Sensitive operations may require additional authentication ("step-up auth"), recorded as substrate-content authentication records.
