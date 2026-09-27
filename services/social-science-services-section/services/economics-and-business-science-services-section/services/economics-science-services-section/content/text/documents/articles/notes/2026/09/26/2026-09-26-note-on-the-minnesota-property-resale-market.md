---
title: "The Minnesota property-resale market"
description: "The market the 561 Group's contract-assignment business works, measured 2026-09-26: where the supply is (one statewide parcel layer covering 59 counties and 2.7 million parcels), what kinds of property there are and who buys each, what Duluth's builders are offered by the city, how offers are priced, and what calling and mailing actually yield per contract."
date-created: 2026-09-26
type: notes
name: 2026-09-26-note-on-the-minnesota-property-resale-market
authors:
  - claude-opus-5-5
keywords:
  - brokerage
  - contract-assignment
  - search-and-matching
  - buy-box
  - blind-offer
  - minnesota
  - duluth
---

# The Minnesota property-resale market

The [note on brokerage as a market mechanism](../../08/28/2026-08-28-note-on-brokerage-as-a-market-mechanism.md)
found [contract assignment](../../../../../../glossary/terms/contract-assignment.md)
the most capital-light form of [brokerage](../../../../../../glossary/terms/brokerage.md)
and the one with the largest fee per match. The 561 Group began working it on
2026-09-26 as a Duluth infill-lot business
(`public-economic-services-section/services/duluth-infill-land-services-section`).
This note measures the market that business sits in, so it can be worked in
more places and with more kinds of property. The law that shapes it is in the
[note on Minnesota law for assigning property contracts](../../../../../../../../../../../law-science-services-section/content/text/documents/articles/notes/2026/09/26/2026-09-26-note-on-minnesota-law-for-assigning-property-contracts.md).

## 1. Supply: one parcel layer for most of the state (measured)

Minnesota's Geospatial Commons publishes **Parcels, Compiled from Opt-In Open
Data Counties** as an ArcGIS feature service
(`enterprise.gisdata.mn.gov/aghost/rest/services/us_mn_state_mngeo/plan_parcels_open/FeatureServer/1`),
updated quarterly, in one coordinate system and one attribute schema (the
Geospatial Advisory Council parcel standard). Fifty-nine counties have opted in,
among them St. Louis, Lake, Carlton, Itasca, Koochiching, Cass, Crow Wing,
Aitkin, Hennepin, Ramsey, Dakota, Anoka, Washington and Olmsted.

Queried 2026-09-26:

- 2,710,201 parcels in all.
- 408,400 with no building value and a land value of $5,000 or more. The
  largest counts are St. Louis (61,277), Koochiching (45,334), Itasca (38,162),
  Lake (36,679), Crow Wing (26,062), Aitkin (20,735), Cass (19,582) and Becker
  (18,366): the north's lake and forest counties. The metro counties are
  smaller but pricier: Hennepin 9,317, Washington 9,852, Ramsey 7,154.
- Homestead is `Yes` on 1,164,045 parcels and `No` on 684,647, so owner-occupied
  and not owner-occupied property can be told apart statewide.

Each record carries the owner's name and mailing address (`owner_name`,
`own_add_l1`..`l4`), the taxpayer's (`tax_name`, `tax_add_*`), the county's
estimated market value of land and buildings (`emv_land`, `emv_bldg`), the
use class (`useclass1`..`4`), homestead status, acreage, city or township
(`ctu_name`), plat, lot and block, dwelling type, year built, units, and last
sale date and price. It does not carry tax delinquency; St. Louis County's own
layer (refreshed weekly) does, with the projected forfeiture year.

Use classes are not uniform. Hennepin and St. Louis write names ("Vacant Land -
Residential", "Unimproved Residential Land", "Rural Vacant Land"); Crow Wing
and Itasca write numeric county codes (Crow Wing's commonest vacant class is
`151`, Itasca's `111`). Reading a new county means one table mapping its class
values to the business's property kinds.

The `ownership` field marks publicly held land in some counties ("Tax
Forfeit" on 18,354 parcels statewide, "County Fee", "State", "Federal"). In
St. Louis County the use classes do the same: about 14,000 vacant parcels are
classed tax-forfeited (county-administered or platted city lots).

## 2. Kinds of property and who buys each

| kind | what it is in the data | who buys it | how the Group sells it |
|---|---|---|---|
| infill lot | vacant, residential class, inside a city, sized for one or more houses | builders and nonprofit housing developers | assignment to a builder whose buy box it fits |
| underbuilt site | commercial or industrial, a quarter acre or more, buildings worth little against the land (gravel lots, surface parking, yards) | developers of larger projects | assignment to a developer; larger fees |
| rural acreage | vacant rural land, often forest, outside cities | recreational buyers (hunting, cabins), neighbors, land investors | assignment to a land investor, or buy and resell |
| seasonal parcel | seasonal residential recreational class, lake and cabin country | cabin buyers and builders | assignment, or buy and resell |
| non-homestead dwelling | a house with building value whose owner does not live in it | landlords and renovators | assignment to a rehab or rental investor |
| forfeited parcel | publicly held after tax forfeiture, sold by county auction | anyone who bids | bought at auction and resold, or matched to a builder who bids |

The buyer is always found first. A builder's **buy box** (areas, sizes, classes,
top price, how fast, cash or financed, how to send a deal) says which parcels
are worth calling about and what the Group can offer for them.

## 3. Duluth's builders and what the city offers them (search synthesis)

- **Rebuild Duluth is now the Housing Trust Fund.** The city started Rebuild
  Duluth in 2019 to put infill homes on overlooked lots, conveying
  tax-forfeited lots to developers free and sometimes adding trust fund
  money. In 2026 it was folded into the city's Housing Trust Fund, which lends
  gap and short-term construction financing to developers, builders and
  contractors for infill, rehabilitation and conversion housing, affordable and
  market-rate, with pre-applications taken on a rolling basis (City of Duluth,
  Housing Trust Fund page; Duluth News Tribune).
- **The city's free lots compete with ours.** Where the city gives builders
  forfeited lots, a privately owned lot sells to a builder only if it is in a
  better place, bigger, already served by utilities, or available sooner. The
  buy-box call finds out which.
- **The zoning is loosening.** A 2025 council resolution backed Unified
  Development Chapter changes that lower residential setbacks and minimum lot
  widths and raise height limits, with an overhaul planned for 2026, so more
  of the city's 25-foot lots become buildable.
- **Builders buying now** include Dirt, Inc. (parcels before DEDA, 2025-07-24)
  and One Roof Community Housing (43 vacant lots held on 2026-09-26).

## 4. Pricing

- **From the buyer down.** The Group's offer ceiling is the matched builder's
  price less the target fee, never above 70% of the county's land estimate
  (the land section's `offerCeiling`).
- **Blind offers for land.** Land investors mail owners a
  [blind offer](../../../../../../glossary/terms/blind-offer.md), a stated
  price the owner can accept, usually in a range of 20% to 50% of market value;
  a [neutral letter](../../../../../../glossary/terms/neutral-letter.md) asks
  whether the owner would sell without naming a price (Pebble REI; REtipster;
  Land Academy; search synthesis).

## 5. What calling and mailing yield (search synthesis, vendor sources)

These figures come from firms that sell calling and mailing services and
should be read as ranges to test against the business's own
`land-activity` counts, not as measurements.

- A caller dialing by hand makes 100 to 150 dials a day.
- On a fresh, targeted list, about 10% of dials reach a person and about 8% of
  those qualify, near 125 dials per qualified lead; old or saturated lists take
  400 to 600.
- Three to eight percent of qualified leads sign; a well-run operation reports
  one signed contract per 800 to 1,500 dials.
- Direct mail draws 1% to 2% responses on blind offers and 2% to 15% on
  neutral letters; blind-offer responses are fewer but more ready to sign.

At those rates one caller making 60 to 100 dials a day signs a contract every
two to five weeks. One signed agreement a week takes about two full-time
callers, or one caller plus a monthly mailing of a few thousand letters. Lists
matched to a buy box, which is what the land section's call queue builds, are
the "fresh, targeted" case.

## 6. What follows for the business

- The land section's county-specific code reads Duluth. The statewide layer
  lets the same verbs read any opted-in county, with one class table per
  county and St. Louis County's own layer kept for delinquency.
- Property kinds are a filter the caller and the find verb both use.
- Forfeited-parcel auctions are a second supply line in every county, and
  their surplus lists feed the heir search business.
- The plan's weekly-contract target is reached with two callers or with mail
  alongside calls.

## Sources

- [Parcels, Compiled from Opt-In Open Data Counties, Minnesota](https://gis.data.mn.gov/maps/69148d3959194a05a23964cc60f6517b) (queried 2026-09-26)
- [GAC parcel data standard](https://www.mngeo.state.mn.us/committee/standards/parcel_attrib/parcel_attrib.html)
- [City of Duluth, Housing Trust Fund](https://duluthmn.gov/planning-development/housing/housing-trust-fund/)
- [Duluth News Tribune, tiny home and the Rebuild Duluth debate](https://www.duluthnewstribune.com/news/local/tiny-home-hits-market-ignites-debate-about-rebuild-duluth-housing-initiative)
- [Star Tribune, Duluth giving away land to spark affordable housing projects](https://www.startribune.com/duluth-giving-away-land-to-spark-affordable-housing-projects/564994902)
- [City of Duluth, proposed zoning changes](https://duluthmn.gov/web-subscriptions/View-press-release/?prid=8388)
- [DEDA special meeting, 2025-07-24](https://duluthmn.gov/media/websubscriptions/40/20250724-40-18473.pdf)
- [Pebble REI, "Making Land Offers 101: Blind, Neutral, and Ranged"](https://www.pebblerei.com/blog/land-offers)
- [REtipster, blind offer template](https://retipster.com/blindoffers/)
- [Land Academy, blind offers](https://landacademy.com/2024/08/30/unlocking-the-power-of-blind-offers-in-real-estate-how-to-get-the-best-results/)
- [VA Horizon, cold calls per wholesale deal](https://www.vahorizon.site/blog/how-many-cold-calls-to-close-wholesale-deal/)
- [Televista, cold calling conversion rates 2026](https://televistaleadgeneration.com/blog/2026/04/04/cold-calling-roi-conversion-rates-2026/)
