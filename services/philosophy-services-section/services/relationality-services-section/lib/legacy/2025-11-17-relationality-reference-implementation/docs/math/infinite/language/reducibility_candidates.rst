Reducibility Candidates
=======================

Definition — ***Reducibility Candidates***
-----------------------------------------

For each type ``A``, define a set ``⟦A⟧`` of closed terms as follows:

- ``⟦⊤⟧ = { t \mid ⊢ t : ⊤`` and ``\mathrm{SN}(t) }``;
  ``⟦⊥⟧ = { t \mid ⊢ t : ⊥`` and ``\mathrm{SN}(t) }``.
- ``⟦A ∧ B⟧ = { t \mid ⊢ t : A ∧ B, \mathrm{SN}(t)``, and
  ``π₁ t ∈ ⟦A⟧`` and ``π₂ t ∈ ⟦B⟧ }``.
- ``⟦A ∨ B⟧ = { t \mid ⊢ t : A ∨ B, \mathrm{SN}(t)``, and for every
  closed ``u`` with ``x:A ⊢ u : C`` and ``u[x:=v] ∈ ⟦C⟧`` whenever
  ``v ∈ ⟦A⟧``, and for every closed ``w`` with ``y:B ⊢ w : C`` and
  ``w[y:=v] ∈ ⟦C⟧`` whenever ``v ∈ ⟦B⟧``, we have
  ``\mathrm{case}\ t\ \mathrm{of}\ \mathrm{inl}\ x↦u\ |\ \mathrm{inr}\ y↦w ∈ ⟦C⟧`` }.
- ``⟦A ⇒ B⟧ = { t \mid ⊢ t : A ⇒ B``, ``\mathrm{SN}(t)``, and for all
  ``u ∈ ⟦A⟧`` we have ``t\,u ∈ ⟦B⟧ }``.
- ρ-closure: if ``t ∈ ⟦A⟧`` then ``ρ(t) ∈ ⟦A⟧``.

