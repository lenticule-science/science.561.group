import ObsmetrologiaManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Sheaf and cohomology overview" =>

# Sheaf And Cohomology

Status: recovered mathematics and frontier witness.

Modules: `Sheaf`, `DFrame`, `AssocSheaf`,
`SettlingCohomologyH1`, `Positing.Value`,
`Cohomology.FrobeniusTQFT`, `AperiodicOrder.Tiling.Moduli`,
`SettlingLocalConstancy`, `BigradedCohomology`,
`BigradedSettlingCohomology`, `CohomologicalEquivalence`,
`CRDTCohomologicalCALM`, `InconsistencySheaf`,
`NegativeParaconsistentSheaf`, `Site`.

This family explains how local-to-global mathematics is recovered from settling.
It also carries some of the most important bridges to distributed consistency,
cohomological obstruction, and classification.

`Sheaf`, `AssocSheaf`, and `Positing.Value` document how
fixed settling regimes become sheaf-like objects. `SettlingCohomologyH1`,
`BigradedCohomology`, and `BigradedSettlingCohomology` record the cohomological
side. `CRDTCohomologicalCALM` connects the sheaf/cohomology story to convergence
and monotonicity.

`DFrame`, `Site`, `InconsistencySheaf`, and
`NegativeParaconsistentSheaf` document the site and evidence-sensitive variants.
`Cohomology.FrobeniusTQFT`, `AperiodicOrder.Tiling.Moduli`, `SettlingLocalConstancy`, and
`CohomologicalEquivalence` are higher bridges that need careful status labels.

Reader warning: sheaf language here must always say what the base is, what the
sections are, and which settling operation produced the local-to-global regime.
