---
title: "The first territory readout for the band's own region"
description: "The economist office's first four territory catalog rows for the North Shore node of the Turtle Island taxonomy (manoomin, rivercane, Lake Superior lake trout/cisco, Lake Superior agate), read for chain position per chain-position.md: what position the region holds on each material's value chain today, what position knowledge could add, and what was not found."
date-created: 2026-09-05
type: note
name: 2026-09-05-note-on-the-first-territory-readout-for-the-band-region
status: draft-for-review
authors:
  - claude-sonnet-5
keywords:
  - hopeium
  - territorial-economy
  - chain-position
  - benefit-sharing
  - manoomin
  - rivercane
  - lake-trout
  - agate
---

# The first territory readout for the band's own region

Four resource rows were written this session against `territory-catalog-row.schema.json`, all naming the North Shore node of the Turtle Island taxonomy (`.../lake-superior-ecological-adaptation-services-section/services/north-shore-ecological-adaptation-services-section`, the Duluth/St. Louis River estuary region the founder named directly): `2026-09-05-territory-catalog-manoomin.json`, `2026-09-05-territory-catalog-rivercane.json`, `2026-09-05-territory-catalog-lake-trout.json`, and `2026-09-05-territory-catalog-agate.json`. Per chain-position.md, "a territorial economy is measured by which chain position it holds and could hold," not by what grows there; this note reads each row that way. All four rows carry `benefitSharingRecord: null` and `identity.issuer: "unknown"` — no holder is named, because none has agreed to a benefit-sharing register entry yet (rung 5 of the hopeium bootstrap, still ahead).

## Manoomin

**Held today: unknown.** No first-party source states what share of retail value a harvester in this territory actually keeps. Minnesota's wild-rice regulation (DNR) sets season, licensing, and a green-rice rule, and exempts tribal members with valid ID from the state license, but says nothing about sale terms or price. Red Lake Nation Foods — a different band's reservation enterprise — is cited only as the reference-implementation market for hand-harvested and cultivated wild rice; it is not evidence of this territory's own position.

**Could hold, through knowledge:** the harvester-to-processor-brand position Red Lake Nation Foods already occupies, rather than selling raw grain to a licensed buyer at the farm-gate cell. That move needs a named holder and a benefit-sharing record first.

**Not found:** any published farm-gate-to-retail percentage for Lake Superior basin wild rice, the kind chain-position.md's narcotics rows publish for coca; no dated price-ladder data at all for this material.

## Rivercane

Rivercane is catalogued here as **knowledge**, not as a species present in this territory. Arundinaria gigantea is native to the Southeast; nothing found this session places it on the North Shore or in the St. Louis River estuary. Its row exists because the founder's Pheží Ocháǧe note identifies the tiyóšpaye's own structural form with the canebrake — one genet with many culms, extension by living transplant never by seed, persistence only in relationship — a reading of the band's kinship, not a claim about this place's flora.

**Held today: none.** There is no harvest, so there is no chain position to hold.

**Could hold:** nothing is projected here on purpose. The Pheží Ocháǧe note's own caution — "the band's grass is the grass that was there to be tended," relation to the place actually lived in, never an inherited map — forbids treating this row as a plan to introduce rivercane on the North Shore. The row documents a form of knowledge the region's catalog carries, not a future product.

**Not found:** any market, and no Southeastern benefit-sharing precedent (the Eastern Band of Cherokee Indians' basketry economy, the Rivercane Restoration Alliance) transfers to this territory; it belongs to a different place and different peoples.

## Lake Superior lake trout (co-managed with cisco/lake herring)

**Held today: unknown**, but the shape of the chain is visible. Minnesota limits Lake Superior to 25 total commercial licenses; lake trout may be taken commercially only under special permit (incidental live catch and untagged dead fish must be returned); cisco/lake herring runs an annual quota near 10 percent of total biomass, down from a historical high near 19 million pounds a year. No source states what a licensed fisher is paid at the dock versus what a market charges at retail.

**Could hold, through knowledge:** the direct-to-retail position Dockside Fish Market (Grand Marais, on the North Shore) already runs at small scale — "from our boat to your table," selling fresh and smoked lake trout, whitefish, and herring locally rather than through a distant wholesale buyer. Once a real dock price and a real retail price are both measured, `derive-value-chain-shares.mjs` (already fabricated in this section) could compute this chain's producer share directly; that measurement was not attempted this session.

**Not found:** ex-vessel (dock) price data for Minnesota's Lake Superior commercial catch — the one PDF found, the DNR's 2024 commercial fishing summary, could not be read as text this session — and no published chain-position percentage for this fishery.

## Lake Superior agate

**Held today: unknown**, and this row is not yet settled by Cistern's two-witness discipline: only one independent first-party source (Minnesota DNR) was found and read this session, so the row carries a single witness, not two.

**Could hold, through knowledge:** a finishing position — tumbling, slabbing into cabochons, face-polishing — rather than selling raw stones, since the DNR's own page names these as the value-adding lapidary techniques. No seller, buyer, or price was found to confirm this position is actually held by anyone in this territory today.

**Not found:** a second independent witness; any market or seller page; any price or volume figure for Lake Superior agate at any stage from beach to finished jewelry.

## What this readout is, plainly

Three of the four materials show a region positioned, so far as any source states, at or before the farm-gate/dock cell — raw grain, raw fish, raw stone, sold or given to whoever buys, with no published figure for what share comes home. The fourth, rivercane, holds no position at all here and should not be made to hold one. None of the four can move up the chain, or gain a named holder, without an actual benefit-sharing agreement (rung 5 of the bootstrap); this readout states where each material stands before that agreement exists, so the next one can be measured against it.

## Read through the value-chain reader (2026-09-05, after the price ladders landed)

The research analyst's ladders (`../../../../../../../../data/records/2026-09-05-band-region-price-ladder-measurement.json`) were run through `@red-cup-engineering/derive-value-chain-shares-service` 0.1.0 by the executive session; the readings are in `../../../../../../../../data/records/2026-09-05-band-region-value-chain-readings.json`.
Every ladder has two positions, producer and retail, because no wholesale or processor price was found, so each producer share is a share of retail across an unmeasured middle, not of a full ladder.

| Material | Producer | Retail | Producer's share of retail |
|---|---|---|---|
| cultivated (paddy) wild rice | $1.65 a pound (USDA RMA 2025 price election) | $6.99 a pound (KC's Best) | 23.6 percent |
| Lake Superior lake trout | $1.19 a pound at the dock (MN DNR 2024 summary) | $4.95 a pound fresh whole (Bodin Fisheries) | 24.0 percent |
| Lake Superior whitefish | $1.22 a pound at the dock | $4.95 a pound fresh whole | 24.6 percent |
| Lake Superior cisco | $0.60 a pound at the dock | $5.95 a pound smoked chunks | 10.1 percent |
| Lake Superior agate | $28.50 a pound rough (Old Miners Outpost) | $235 a finished ring (Vikse Designs) | not comparable: the units differ (pound, piece, ring), so the reader's 12.1 percent is a ratio of quoted prices, not a share of one unit |

Against the narcotics fixtures the same reader runs on (coca paste under one percent of the street price), the band's region holds roughly a quarter of retail at the dock or farm gate on unprocessed food and a tenth where the retail product is processed (smoked).
The hand-harvested lake rice a harvester sells green is still unmeasured; the paddy figure is a cultivated-rice price election, stated as such in its evidence label.
What the readings say for the program's claim: the position to hold is the processing step (smoking, finishing, milling), which is where three quarters of the price sits and where the readout said the territory could move through knowledge.
