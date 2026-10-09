---
name: Magnetic Reconnection
date-created: 2026-09-03
references:
  vlasov1938:
    authors: ["Anatoly A. Vlasov"]
    title: "On Vibration Properties of Electron Gas"
    publication: "Zhurnal Eksperimentalnoi i Teoreticheskoi Fiziki"
    year: 1938
---

In ideal magnetohydrodynamics (MHD), a plasma's magnetic field lines are **frozen in**
to the fluid (Alfvén's frozen-in flux theorem): field lines are carried along with the
plasma and their topology — which line connects to which — cannot change. **Magnetic
reconnection** is a change of magnetic field-line topology that happens anyway, when the
frozen-in constraint breaks down locally, typically in a thin current sheet where
resistivity or kinetic effects become important even though the bulk plasma remains
nearly ideal. Reconnection converts magnetic energy into kinetic and thermal energy and
is the driving mechanism behind solar flares, coronal mass ejections, and magnetospheric
substorms. The classical estimate of its rate in a resistive current sheet is the
Sweet–Parker model; observed reconnection is typically much faster, which is why the
non-ideal (kinetic, Vlasov-level — Vlasov 1938) physics of the reconnection layer is the
active research question rather than the resistive-MHD estimate alone.

## In Obsmetrologia

`Obsmetrologia.KineticTheory.Plasma.ReconnectionCurvature` models magnetic reconnection
as a **non-Scott-continuous curvature event**. A `FieldLineFlow` is a field-line
connectivity-update operator together with the directed family of prior connectivity
stages whose limiting join is the eventual field-line configuration; **frozen-in flux**
is the update *commuting* with that limit join — [Scott-continuity](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/scott-continuity.md),
no discontinuous firing — and a **reconnection event** is the update *failing* to
commute with the join, a discontinuous topology change exactly at the limit stage. This
is a curvature event in the corpus's flow/curvature sense, and the module's two central
theorems give it teeth: `reconnection_event_implies_H1_nonzero` proves a reconnection
event forces non-vanishing settling cohomology (`cohomologyVanishes = false`), and
`flat_regime_forbids_reconnection_event` proves the flat, Scott-continuous (ideal-MHD)
regime admits no reconnection at all — the corpus's formal statement of the frozen-in
theorem above. Both carry axiom profile `propext`. An ideal (closure-operator) field-line
flow correspondingly never reconnects (`ideal_flow_has_no_reconnection`). The module's
own header is explicit about scope: this is the topology/curvature event of
reconnection — the discontinuity, its non-vanishing $H^1$, and the ideal-regime
prohibition — not the electrodynamics (magnetic helicity, the parallel electric field,
actual field-line braiding) or continuum MHD/particle-in-cell reconnection *rates*, which
sit above this discrete core as the continuum layer, not formalized here.

## See also

- [Boltzmann equation](./boltzmann-equation.md) — the collisional kinetic-theory sibling of this plasma physics
- [Scott continuity](../../../../../../../../../information-science-services-section/services/math-services-section/content/text/glossary/terms/scott-continuity.md) — the property whose failure defines a reconnection event
