---
title: "The price ladders of the band's own region"
description: "Producer-to-retail price ladders for the three materials the first territory readout found unmeasured — manoomin, Lake Superior commercial fish, and Lake Superior agate — built from first-party seller, agency, and regulator surfaces and run through derive-value-chain-shares.mjs, with what still was not found."
date-created: 2026-09-05
type: note
name: 2026-09-05-note-on-the-price-ladders-of-the-band-region
status: draft-for-review
authors:
  - claude-sonnet-5
keywords:
  - hopeium
  - territorial-economy
  - chain-position
  - manoomin
  - lake-trout
  - agate
  - price-ladder
---

# The price ladders of the band's own region

Thirty rows and five ladders (`2026-09-05-band-region-price-ladder-measurement.json`) answer the first territory readout's three price gaps, from first-party seller, regulator, and agency pages read 2026-09-05. Every ladder ran cleanly through `derive-value-chain-shares.mjs` this session (exit status 0, all five requests).

## Manoomin

One runnable ladder: producer to retail for cultivated (paddy) wild rice. The producer figure is not a market transaction but the USDA Risk Management Agency's 2025-crop-year non-organic price election, $1.65/lb (published 2024-09-11); retail is KC's Best Wild Rice's $6.99/lb 1 lb bag of MN Cultivated Long Grain. Farm-gate share of retail: 55/233 (≈24%) — a federal insurance benchmark standing in for an actual sale, stated as such.

Hand-harvested lake (non-paddy) manoomin has four retail witnesses — Native Harvest $24.00/lb, Giiwedinong (1855 Treaty) $16.00/lb, KC's Best $16.99/lb, Frink $28.99/lb — but no producer or processor figure: the 2022 1854 Treaty Authority buyers-and-processors list names a Bemidji buyer who states only that it "will pay a competitive price." No ladder could be built for this sub-chain; it stays retail-only rows.

**Not found:** a green-rice buyer price from any named buyer; a wholesale/processor price for cultivated rice distinct from the 1 lb retail figure; Red Lake Nation Foods' own price (its site defers to the Nawapo.com reseller, which also shows no price); Minnesota wild-rice license fees — mn.gov/elicense returned a Radware captcha rather than the fee schedule, and a $25/$15/$30 figure from search-engine synthesis alone was refused as a row.

## Lake Superior commercial fish

Three runnable ladders, one per species. The producer (dockside, in-the-round) side comes from the Minnesota DNR's 2024 Lake Superior Commercial Fishing Summary PDF (downloaded, read with `pdftotext`), which states an explicit average price per pound for every species: lake trout $1.19, lake whitefish $1.22, cisco $0.60. Retail comes from Bodin Fisheries' dated price list (as of January 2019): fresh whole lake trout and whitefish at $4.95/lb, smoked lake herring chunks at $5.95/lb (no fresh-herring price is listed, so smoked stands in for cisco's retail position). Farm-gate share of retail: lake trout ≈24%, whitefish ≈25%, cisco ≈10%. The roughly five-year gap between the 2024 dock price and the January-2019 retail price is carried in every ladder's `rangeNote` as a stated caveat, not resolved by assumption.

**Not found:** Dockside Fish Market's own prices — docksidefishmarket.com did not resolve (DNS timeout) and no secondary source states a figure; Northern Waters Smokehaus and Russ Kendall's Smoke House prices — neither publishes pricing online; Wisconsin DNR and Michigan DNR ex-vessel data — report pages identified, not fetched, this session; any wholesale/distributor price distinct from dock and retail.

## Lake Superior agate

One runnable three-position ladder: rough (Old Miners Outpost, $28.50/lb) to a tumbled/polished loose specimen (Science Museum of Minnesota store, $10.00/piece, 0.5–2 oz) to finished jewelry (Vikse Designs sterling ring, $235.00 — the lowest of an eight-piece $235–$465 collection; Michigan Rocks & Minerals' wire-wrapped pendant at $225.00 is a comparable second witness, cited in `rangeNote` rather than as a second contested price, since the operation forbids two prices at the final retail position). The middle position changes unit from pound to piece — a real seam, flagged in `rangeNote` rather than hidden by an invented conversion.

**Not found:** an unset, unmounted cabochon priced by a named seller (three candidate collections returned empty, 404, or 403); a slabbed-but-untumbled price; any wholesale price at any stage; a USGS report specific to Lake Superior agate; any Minnesota DNR collection-volume or value figure beyond "large, exceptionally beautiful agates may be worth hundreds of dollars."

## What this measurement is, plainly

No genuinely contested same-position price — two sources pricing the identical good differently — turned up this session; where two sellers' prices diverged, they were different products or item classes (hand-harvested versus cultivated rice, fresh versus smoked fish, a ring versus a pendant), carried as `rangeNote` context rather than forced into a false disagreement. All five ladders are, for now, comparisons across time (fish), across a federal benchmark and a market price (rice), or across a unit change (agate) — real gaps for the next pass to close, not defects hidden inside a clean number.
