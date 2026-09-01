---
name: verdier-duality-on-sd-site
type: theorem
class: autoequivalence
status: sketch
lean: RelationalInfinityTopoi.verdier_duality_on_sd_site
depends-on:
  - verdier-duality-functor
  - sd-ambidexterity
  - sd-constructible-stack
---

The [Verdier-duality functor](../morphisms/verdier-duality-functor.md) $\mathbb{D}$ on [SD-constructible](../teaching/explanations/constructibility.md) sheaves of a [stratified directed ∞-site](../objects/stratified-directed-infinity-site.md) is well-defined, an involution up to canonical equivalence — $\mathbb{D}^2 \simeq \mathrm{id}$ — and it acts on the [SD-constructible stack](../objects/sd-constructible-stack.md) as an autoequivalence.

## Statement

There is a natural autoequivalence

$$\mathbb{D} \;:\; \mathrm{Sh}_{\mathrm{Constr}}(\mathcal{S}, \mathcal{H})^{\mathrm{op}} \;\xrightarrow{\sim}\; \mathrm{Sh}_{\mathrm{Constr}}(\mathcal{S}, \mathcal{H})$$

with $\mathbb{D}(F)(i) := \underline{\mathrm{Hom}}(F(i), \omega_i)$ for $\omega_i$ the dualizing object at $i$, satisfying the involutive property $\mathbb{D}^2 \simeq \mathrm{id}$.

## Proof sketch

Existence of $\mathbb{D}$ as a *bifunctor* — i.e. a contravariant assignment $F \mapsto \mathbb{D}(F)$ — is immediate from the existence of dualizing sheaves $\omega_i$ at every position. The involutive property $\mathbb{D}^2 \simeq \mathrm{id}$ is exactly the [SD-ambidexterity theorem](sd-ambidexterity.md): under ambidexterity, the limit-and-colimit interchange that $\mathbb{D}^2$ performs is canonically trivial.

## Status

Sketch. Depends on `sd-ambidexterity` being promoted past `sketch` first; the dualizing-sheaf construction also requires its own treatment that the source drafts skip.

## Comparison

This is the SD-site analogue of predication categories' Verdier-duality theorem on a bitopological site (see [`predication-categories/dependency-audit.md`](../../../../theories/predication-categories/dependency-audit.md) — `verdier-duality-bitopological-site` is in the load-bearing list). The two are connected by the [Heyting-closure shadow](heyting-closure-shadow.md): both Verdier dualities project to the same algebraic-shadow involution on the underlying Heyting algebra of subobjects.
