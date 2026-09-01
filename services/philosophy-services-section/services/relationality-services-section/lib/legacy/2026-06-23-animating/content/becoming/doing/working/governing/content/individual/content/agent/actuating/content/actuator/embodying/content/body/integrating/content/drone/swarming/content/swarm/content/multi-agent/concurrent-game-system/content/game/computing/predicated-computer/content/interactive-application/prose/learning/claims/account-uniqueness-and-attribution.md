---
type: theorem
class: engineering-claim
status: proved
depends-on: [account, account-record, register-account, authenticate-user, signature-binds-witness-to-identity, settlement-determinism, equality-via-equalizer, paraconsistent-equality, predicate-converse, predicate-specialization, predication-hyperdoctrine, knowledge-order]
see-also: [identity-record, mfa-as-twist-product-fusion, form-validation-as-paraconsistent-comprehension]
---

# Account handles are unique within scope and attribution is non-repudiable

**Claim.** For any [scope](../../teaching/explanations/scope.md), the substrate guarantees:

1. **Handle uniqueness.** Within the scope's [predication hyperdoctrine](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-hyperdoctrine.md), the predicate $p_{\mathrm{handle}}$ on $H \times \mathrm{Account}$ — *handle $h$ is the handle of account $a$* — has its converse-equality cell carry [paraconsistent-equality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md) $\Delta^k_{\mathrm{Account}}$ on the diagonal of $\mathrm{Account}$, so a handle witnesses *exactly one* account up to substrate identity. Two registrations of the same handle within the scope therefore force their account cells onto the diagonal $\Delta_{\mathrm{Account}}$, identifying the would-be second account with the first; [register-account](../morphisms/register-account.md) detects the diagonal collapse and refuses.

2. **Authentication-attribution binding.** Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), every witness produced under the account's identity-record is non-repudiably attributable to the holder of the account's bound private key.

The two together are the substrate's *account-as-attribution-anchor* guarantee: an account handle uniquely identifies a substrate identity within scope (because the handle predicate is converse-functional in the predication hyperdoctrine's equalizer sense), and operations under that identity are non-repudiable.

## Why this holds

**Part 1: Uniqueness as converse-equalizer collapse.** The handle predicate $p_{\mathrm{handle}}$ is structurally a [predicate-specialization](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-specialization.md) of the universal predicate on $H \times \mathrm{Account}$. The substrate's "no two accounts share a handle within scope" invariant is exactly the statement that $p_{\mathrm{handle}}$ is *converse-functional*: if $p_{\mathrm{handle}}(h, a_1) = \mathbf{t}$ and $p_{\mathrm{handle}}(h, a_2) = \mathbf{t}$, then $a_1 = a_2$.

Per [equality-via-equalizer](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/equality-via-equalizer.md), the equalizer of $\mathrm{id}$ and the [predicate-converse](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/predicate-converse.md) on a predicate is a specialization onto the diagonal sub-support of its entity set. Applied to the *pullback* $p_{\mathrm{handle}} \circ p_{\mathrm{handle}}^{\mathrm{conv}}$ — "there exists a handle $h$ such that both $a_1$ and $a_2$ have it" — the equalizer carves out the cells where $a_1 = a_2$. Per [paraconsistent-equality](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paraconsistent-equality.md), this carving is realized in the substrate's hyperdoctrine as $\Delta^k_{\mathrm{Account}}$ — the [knowledge-order](../../../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/knowledge-order.md)-Lawvere image taking $\top$ on the diagonal and $\bot$ off it. Stable under $\vee_k$-merge, federation-safe.

The substrate's per-scope invariant is then the structural commitment

$$p_{\mathrm{handle}} \circ p_{\mathrm{handle}}^{\mathrm{conv}} \;\leq_k\; \Delta^k_{\mathrm{Account}}$$

— "any two accounts that share a handle are identified by the substrate's paraconsistent equality." [Register-account](../morphisms/register-account.md)'s validation step is the substrate's check that this inequality is preserved by the proposed insertion: the candidate account-record's handle is queried against $p_{\mathrm{handle}}^{\mathrm{conv}}$; if the query returns any existing account at $\top$, registration of a *distinct* account at the same handle would push $p_{\mathrm{handle}} \circ p_{\mathrm{handle}}^{\mathrm{conv}}$ above $\Delta^k_{\mathrm{Account}}$ at an off-diagonal cell — a structural inconsistency in the hyperdoctrine — and the substrate refuses.

Per [settlement-determinism](../../../theorems/settlement-determinism.md), the equalizer evaluation is deterministic. Per [federation-convergence](../../../theorems/federation-convergence.md), two substrates running the check against the same prior state converge on the same diagonal carving via $\vee_k$-merge of per-substrate handle predicates. The federation-safe choice of *paraconsistent* equality (over classical $\Delta^t$) is what makes the converged state stable: a federated substrate that admitted a duplicate before the merge surfaces the duplicate as $\top$ (both confirmed and now contradicted) per [paraconsistency-as-substrate-discipline](../../../theorems/paraconsistency-as-substrate-discipline.md), rather than silently picking a winner.

**Part 2: Attribution.** Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), the substrate's signature scheme provides existential unforgeability: a signature that verifies against a known identity-record's public key was produced by the holder of the corresponding private key. Per [account-record](../objects/account-record.md), the account binds to an identity-record; per [authenticate-user](../morphisms/authenticate-user.md), authentication produces a witness signed by the account's identity-key. Therefore every substrate operation attributed to the account is non-repudiably bound to whoever holds the private key.

## Engineering consequence

- **Per-account audit.** Auditors can ask "what did account $a$ do?" and get a complete witness chain via the account's identity-record's signed witnesses.
- **Cross-substrate handle resolution.** Per [federation-convergence](../../../theorems/federation-convergence.md), federated substrates agree on which account holds which handle; users can be addressed by handle across the federation.
- **Identity rotation preserves attribution.** Per [identity-record](../../../objects/identity-record.md)'s rotation discipline, an account whose identity-key rotates preserves attribution back through the predecessor chain. Historical witnesses verify against the rotated-from key.

## What the theorem rules out

- A substrate that admits duplicate handles within scope loses per-handle attribution; the substrate's discipline is to enforce uniqueness at registration.
- An account whose identity-record's private key is shared across multiple holders loses per-individual attribution. Per [identity-record](../../../objects/identity-record.md), each identity-record has one holder.
- A substrate that admits unsigned witnesses for account operations loses non-repudiation. Per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md), substrate operations crossing trust boundaries must be signed.

## What the theorem requires

- The substrate's [register-account](../morphisms/register-account.md) enforces handle uniqueness within scope.
- Per [identity-record](../../../objects/identity-record.md), each account binds to an identity-record with off-substrate private-key custody.
- The signature scheme provides existential unforgeability per [signature-binds-witness-to-identity](../../../theorems/signature-binds-witness-to-identity.md).
- Per [federation-convergence](../../../theorems/federation-convergence.md), federated substrates converge on the canonical account-handle mapping.
