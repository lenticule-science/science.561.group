---
type: theorem
class: engineering-claim
status: proved
depends-on: [canonical-form, settling-quiescence, predication-fiber-algebra, jung-rivieccio-duality, paired-priestley-space, closure-fixed-points-priestley-correspondence, settlement-via-closure-2-monad]
see-also: [hash-injectivity-under-canonical-form, determinism-via-fiber-functoriality]
---

# Canonical form is the Priestley-dual presentation of a closure-fixed-point

**Claim.** For any substrate value $v$ in the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p$ that is at [settling quiescence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/concepts/settling-quiescence.md) — i.e., $\mathrm{cl}(v) = v$, a closure-fixed-point — the substrate's [canonical form](teaching/explanations/canonical-form.md) is the byte-encoding of the Priestley-dual presentation of $v$. Per [closure-fixed-points-priestley-correspondence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-fixed-points-priestley-correspondence.md), the closure-fixed-point sub-algebra $A_p^{\mathrm{cl}}$ corresponds to a closed subspace $K_p \subseteq X_p$ of the [paired Priestley space](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/paired-priestley-space.md); per [jung-rivieccio-duality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md), the duality is contravariant equivalence. The canonical form's byte-encoding is the deterministic enumeration of the prime-filter points in $K_p$ that correspond to $v$, presented in the dual space's structural order.

This is what makes the substrate's canonical-form discipline structurally well-defined: same value $v$ produces same dual presentation $K_p^v$ produces same byte enumeration produces same canonical bytes.

## Why this holds

Per [closure-fixed-points-priestley-correspondence](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-fixed-points-priestley-correspondence.md), for a bounded distributive lattice $A$ with a closure operator $\mathrm{cl}$, the closure-fixed-point sub-meet-semilattice $A^{\mathrm{cl}}$ corresponds to a closed Priestley subspace $K \subseteq \mathrm{Spec}(A)$. The argument extends to the [predication fiber algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md) $A_p = \mathbf{L}^{\bowtie E \times E}$ (a distributive bilattice) via [jung-rivieccio-duality](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md):

$$\mathbf{DBiLat}^{\mathrm{op}} \;\simeq\; \mathbf{PairedPriSp}.$$

A value $v \in A_p^{\mathrm{cl}}$ corresponds to a clopen up-set in the paired Priestley dual $X_p$. The substrate's canonical-form serialization is then:

1. Compute the dual presentation $X_p^v \subseteq X_p$ — the clopen up-set corresponding to $v$.
2. Enumerate the prime-filter points of $X_p^v$ in the dual space's structural order ($\leq_t$ first, then $\leq_k$ within each $\leq_t$-stratum).
3. Encode each enumerated point in the substrate's chosen serialization (canonical-JSON in the typical substrate).
4. Concatenate per the carrier's structural rules (object-keys-sorted, arrays-in-semantic-order).

Per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), the substrate's settlement reaches a unique closure-fixed-point — so the value $v$ being canonicalized is structurally well-defined. Per the duality's equivalence-of-categories, distinct values produce distinct dual presentations. Per the deterministic enumeration recipe, distinct duals produce distinct byte-encodings. The chain *value $\to$ dual $\to$ canonical bytes* is therefore injective.

## Engineering consequence

- **Canonical form is structurally complete.** Every value in the substrate's value-domain has a canonical form — there is no class of values for which canonicalization is ill-defined. Per the duality's equivalence, every fiber-algebra value has a Priestley dual; per the closure-fixed-point correspondence, every quiescent value has a clopen-up-set dual.
- **Canonical form is structurally unique.** Two values with the same dual are the same value (duality is an equivalence); two duals that produce the same byte-enumeration are the same dual (the enumeration is deterministic). Distinct values have distinct canonical forms.
- **Carrier-specific hooks correspond to dual-presentation choices.** A predication-cell carrier vs. a judgment carrier vs. an RPC envelope encode the same dual-space points in different concrete syntaxes; the substrate's canonical-form discipline ensures all encodings are deterministic relative to the same underlying dual.
- **Canonicalization is computable in fiber-algebra time.** Per the bilattice-algebra structure, computing the dual presentation is bounded by the fiber's size; the enumeration recipe runs in size of the dual. For finite fiber-algebras (the typical substrate), canonicalization is polynomial-time.

## What the theorem rules out

- **Canonical form on non-quiescent values.** A "canonical form" computed on a value $v$ that is *not* at the closure-fixed-point ($\mathrm{cl}(v) \neq v$) is not the Priestley-dual presentation of a stable value — re-applying $\mathrm{cl}$ would produce a different value with a different dual. The substrate refuses to canonicalize non-quiescent values; per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md), values are first settled, then canonicalized.
- **Implementation-dependent serialization.** A canonicalization rule that depends on the implementation's runtime (host endianness, default locale, OS time-zone) is not a deterministic dual-enumeration — it varies across hosts. The substrate's canonical-form rule fixes every choice without admitting implementation freedom.
- **Carrier-coupled identity.** A "canonical form" specific to a particular carrier (this content's canonical form is one thing as JSON, another as binary) does not identify the underlying value — it identifies (value, carrier) pairs. The substrate's discipline is that the *value* has the canonical form; carriers are deterministic encodings of it.

## What the theorem requires

- The substrate's value-domain is a distributive bilattice (per [predication-fiber-algebra](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/objects/predication-fiber-algebra.md)).
- The closure operator $\mathrm{cl}$ is monotone, inflationary, and idempotent (per [closure-operator](../../../../../../../humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-operator.md)).
- The value being canonicalized is at the closure-fixed-point (settled per [settlement-via-closure-2-monad](settlement-via-closure-2-monad.md)).
- The canonicalization rule provides a deterministic enumeration recipe over the Priestley dual.

## Position

Together with [hash-injectivity-under-canonical-form](hash-injectivity-under-canonical-form.md) and [determinism-via-fiber-functoriality](determinism-via-fiber-functoriality.md), this theorem grounds the substrate's content-identity discipline in the bilattice-Priestley duality. Canonical form is a structural property of the value's dual; hash injectivity is the cryptographic-fingerprinting of that dual; determinism is the runtime presentation of the fibration's functoriality. Three engineering surfaces of the same dual-equivalence structure.
