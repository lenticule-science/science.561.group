---
type: reference
authors: [Lawvere, F. William; Schreiber, Urs]
year: 2013
name: lawvere-schreiber
venue: "nLab and Schreiber's lecture notes; original Lawvere axiomatization 1989, Schreiber's elaboration 2013"
---

## Full citation

F. W. Lawvere. *Categories of spaces may not be generalized spaces, as exemplified by directed graphs.* Revista Colombiana de Matemáticas 20 (1986), 179–185. (The 1989 / *Categories in Continuum Physics* axiomatization of cohesion.)

U. Schreiber. *Differential cohomology in a cohesive infinity-topos.* arXiv:1310.7930 (2013), and elaborations on the nLab.

## Status

Pending direct access. Cited via the framework's borrowed structure.

## Annotation

The Lawvere–Schreiber cohesive adjoint quadruple

$$\Pi^\to \dashv \Box_r \dashv \Diamond_l \dashv \nabla^\leftarrow$$

— Shape ⊣ Flat ⊣ Sharp ⊣ Crisp — is the axiomatic structure underlying the relational calculus' Movement IV ([RITM](../teaching/explanations/ritm.md)). The relational calculus *imports* this quadruple wholesale from the cohesive-topos literature; what the framework adds is the derivation showing that the quadruple is *forced* by the structure already in place after Movement III, rather than being posited.

The Lawvere–Schreiber axioms specify:

1. The two outer adjoints ($\Pi^\to, \nabla^\leftarrow$) are *connected* — preserving terminal objects.
2. The middle two ($\Box_r, \Diamond_l$) are *idempotent monads / comonads* whose images interpret the local-vs-global content.
3. The chain factorizes through a cohesive site.

The relational calculus' [Discipline / Regime / Filter / Profile](../teaching/explanations/discipline-regime-filter-profile.md) hierarchy is built on top of this — a Filter is defined as a discipline commuting with all four cohesive functors, and Filter-Induced Reflexive Reconstruction is the relational calculus' analogue of the cohesion-preservation property.

Schreiber's *Cohesive HoTT* §1–3 is the most directly cited section of the elaboration. The framework also draws on Shulman's contemporaneous work on cohesive HoTT for the homotopy-typed version of the same structure.
