import InfomaterialManual.DocSetup

open Verso.Genre Manual InlineLean

#doc (Manual) "Sheaf and cohomology overview" =>

# Sheaf And Cohomology

Status: recovered mathematics and frontier witness.

Modules: `Sheaf`, `DFrame`, `SettlingAssociatedSheaf`,
`SettlingCohomologyH1`, `SettlingOverValueCategory`,
`SettlingFrobeniusTQFT`, `SettlingModuliStack`,
`SettlingLocalConstancy`, `BigradedCohomology`,
`BigradedSettlingCohomology`, `CohomologicalEquivalence`,
`CRDTCohomologicalCALM`, `InconsistencySheaf`,
`NegativeParaconsistentSheaf`, `BitopologicalSettlingSite`.

This family explains how local-to-global mathematics is recovered from settling.
It also carries some of the most important bridges to distributed consistency,
cohomological obstruction, and classification.

`Sheaf`, `SettlingAssociatedSheaf`, and `SettlingOverValueCategory` document how
fixed settling regimes become sheaf-like objects. `SettlingCohomologyH1`,
`BigradedCohomology`, and `BigradedSettlingCohomology` record the cohomological
side. `CRDTCohomologicalCALM` connects the sheaf/cohomology story to convergence
and monotonicity.

`DFrame`, `BitopologicalSettlingSite`, `InconsistencySheaf`, and
`NegativeParaconsistentSheaf` document the site and evidence-sensitive variants.
`SettlingFrobeniusTQFT`, `SettlingModuliStack`, `SettlingLocalConstancy`, and
`CohomologicalEquivalence` are higher bridges that need careful status labels.

Reader warning: sheaf language here must always say what the base is, what the
sections are, and which settling operation produced the local-to-global regime.
