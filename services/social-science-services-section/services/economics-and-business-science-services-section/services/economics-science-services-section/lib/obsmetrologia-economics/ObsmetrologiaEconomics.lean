import ObsmetrologiaEconomics.AllocationSolver
import ObsmetrologiaEconomics.AttentionAllocation
import ObsmetrologiaEconomics.BarrierSeries
import ObsmetrologiaEconomics.CurrencyCocone
import ObsmetrologiaEconomics.FloatDesk
import ObsmetrologiaEconomics.MeetPay
import ObsmetrologiaEconomics.PoolSplit
import ObsmetrologiaEconomics.Sleeve
import ObsmetrologiaEconomics.TallyCredit
import ObsmetrologiaEconomics.Withdrawal

/-!
# ObsmetrologiaEconomics

Economics over Obsmetrologia: attention allocation, the allocation solver, currency cocones, and pool splitting/ledger conservation.

Every module here imports the pure-mathematics package `Obsmetrologia`; nothing in
`Obsmetrologia` imports this package. Declarations keep their `Obsmetrologia.*` names.
-/
