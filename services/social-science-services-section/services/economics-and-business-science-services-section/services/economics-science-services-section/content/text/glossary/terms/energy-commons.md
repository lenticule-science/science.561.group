---
description: A Tidepool instrument that finances a member's net-energy-positive asset from the float as a tally draw repaid in attested kilowatt-hours saved, with an option to weight allocation by the net energy an offer returns.
identity: energy-commons
name: Energy commons
date-created: 2026-10-08
relations:
  requires:
    - energy-return-on-investment
  uses:
    - tally-credit
    - common-pool-resource
---
The **energy commons** lets the pool's float finance a heat pump, insulation, rooftop solar or stove efficiency for a member as a [tally credit](../../../../../monetary-economics-science-services-section/content/text/glossary/terms/tally-credit.md) draw whose repayment is denominated in attested kilowatt-hours saved. Meter readings are told as cells under the attestation discipline of the joule index, and kWh are converted to money at the index on the day. The draw's price is the avoided energy cost. An EROEI-scored allocation option lets cells tell the net energy their offer returns, and the default allocation of [consensus by withdrawal](./consensus-by-withdrawal-allocation.md) may weight by it. The boundaries at which an asset is net-energy-positive, [energy return on investment](./energy-return-on-investment.md) for the asset, and the tariff and net-metering readings, are owned by the solar-economics science section. Joules per settled row is this instrument's own unit of account for the pool's survival line.

Specification: [Tidepool §3 B11, The Energy Commons](../../../../../../../../../../../public-services-section/services/public-economic-services-section/services/public-business-services-section/services/public-financial-services-section/services/public-blockchain-finance-services-section/services/public-blockchain-yield-pool-finance-services-section/content/text/documents/articles/specifications/2026/10/08/2026-10-08-specification-of-the-tidepool-protocol.md#b11-the-energy-commons). Lean: `ObsmetrologiaEconomics.EnergyCommons.{repayKwh, repay_conserves_kwh, eroei_weight_nonneg}`.
