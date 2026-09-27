# Selling to Machines

Chapter 3 showed that adding a price to a web service with x402 takes an
afternoon. This chapter looks at what happened to the sellers who did it:
what they sold, what they charged, who paid, and why most of them earned
almost nothing.

## What is for sale

The best public view of x402 sellers is Coinbase's Bazaar catalog. It is
incomplete, as Chapter 6 explained, but it lists each seller's price,
description and recent usage. The 561 Group read the whole catalog on
27 August 2026 [@bazaar2026measure].

**Prices are tiny.** Of the 14,781 active resources:

- the median price was one cent;
- the middle half of prices ran from $0.003 to $0.05;
- only two were free, and the most expensive was $1,000.

**Revenue is concentrated.** One seller of gift cards, which lets a buyer
spend crypto at ordinary shops, earned about $21,000 of the catalog's
$30,600 in thirty days. The ten highest earners took 78%. The remaining
sellers averaged under fifty cents a month.

**The most popular services are thin.** The resources with the most distinct
payers were simple lookups on the Ethereum blockchain:

- the balance of an address;
- the owner of a name;
- the current block number;
- the details of one transaction.

Each drew about 1,000 payers and about 1,000 calls.

That last pattern is worth a closer look.

## Calls per payer

A useful signal for any pay-per-request service is the number of calls each
paying customer makes. The 561 Group calls it calls per payer.

- **A ratio near one** means each buyer tried the service once and left. That
  is the pattern of people, or programs, sampling: a developer testing an
  integration, an agent exploring what exists, a demonstration.
- **A ratio of tens or hundreds** means buyers came back. That is the pattern
  of a service built into someone's workflow, where the payments recur
  because the need recurs.

The popular blockchain lookups in the Bazaar had ratios near one. Many payers
tried them; almost none returned. They were popular as samples, not as
products.

For a seller, calls per payer is a more honest early signal than revenue or
payer count. A hundred payers who each called once is a demonstration. Ten
payers who each call daily is a business.

## A case study: the ephemeris gateway

The 561 Group sold two products over x402 from July 2026. Both computed the
positions of the planets for a given moment.

- **The cheaper tier**, at $0.04, returned planetary positions, the moon's
  phase and the major angles between planets.
- **The precision tier**, at $0.32, used NASA's Jet Propulsion Laboratory
  ephemeris and returned a fuller set of astronomical and astrological
  values, with a cross-check between two calculation engines.

The service went live on 22 July 2026. The Group paid it twice itself to test
both tiers. Over the next four days two strangers paid it, one of them three
times. Then payments stopped for more than a month. The Group's records
disagree about whether one more payment arrived in late August, and about the
exact total, but agree that the total was about fifty cents.

The first explanation the Group reached was discovery: nobody could find the
service. The Bazaar lists an endpoint only after a payment settles through
Coinbase's facilitator, and this one never appeared in the catalog, even after
it had been paid. That looked like a closed loop: no listing, so no buyers, so
no listing.

The records showed that explanation was incomplete. Strangers had found the
service and paid for it. The question was not how to get a first customer but
why the customers did not return. When the Group looked at the market for the
cheaper tier, the answer was plain:

- **a free service covered much of the same ground.** It computed similar
  positions with no payment at all, and it was reachable through the same
  channels an AI assistant would use to find tools;
- **conventional astrology services priced by subscription** gave away a
  thousand or more calls a month before charging.

At four cents a call, the x402 tier was competing with free.

There was a deeper problem. The product was built for an AI agent that pays
mid-task, and very few agents have a task that needs a horoscope. The
precision tier had a better case, because nothing free matched its accuracy,
but it was labeled as astrology. The same calculations sold as positional
astronomy might serve navigation, observation planning or solar-panel siting,
buyers who value accuracy and do not look for horoscope tools.

## Lessons from the Bazaar and the gateway

**Check the nearest free substitute, not the nearest paid competitor.** A
machine buyer compares a price with the cost of getting the same answer
elsewhere, and elsewhere is often free. Before building distribution, a
seller should know whether a free tool or a generous free tier already
answers the same request.

**Sell what an agent needs in the middle of a task.** The services with
recurring demand are those an automated process keeps needing:

- current data;
- computation it cannot do itself;
- verification;
- access to something gated.

A product people enjoy but software never needs does not find machine buyers,
however easy it is to pay for.

**Measure calls per payer, and remove your own tests.** Early payers are often
the seller, its friends and curious developers. Count them separately.

**Distribution is necessary, not sufficient.** Listing in catalogs and
directories helps buyers find a service. The 561 Group's gateway was accepted
by an independent directory, 402index, in September 2026, but a listing cannot
create demand where none exists.

**Expect concentration.** In the Bazaar, a few sellers earned nearly
everything. That is common in young markets and in platform markets
generally. A new seller should plan for the median outcome, which is small.

## Publishers and the crawler market

Not every x402 seller runs an API. Cloudflare's Monetization Gateway, announced
in July 2026, lets any site behind Cloudflare charge per request for pages,
datasets, APIs or AI tool calls, with payment checked at Cloudflare's edge and
settled in stablecoins through x402 [@cloudflare2026gateway]. Cloudflare's own
examples of prices included one cent per request, a few cents per web search,
and a tenth of a cent plus one cent per megabyte.

This matters because it changes who the sellers are. An API seller must build
something an agent wants. A publisher already has pages that AI crawlers
fetch, whether or not the publisher wants them to. For publishers, x402 offers
a way to turn traffic that currently costs money into traffic that pays. Market
analysts in August 2026 pointed to the gateway as the most likely source of
new x402 demand in late 2026 [@ccn2026]. Whether crawler operators pay rather
than go elsewhere is not yet known.

## What this chapter established

- In the Bazaar, the median price was one cent, and a handful of sellers
  earned nearly all the revenue.
- Calls per payer separates sampling (near one) from recurring use (tens or
  more), and the most popular services were sampled rather than used.
- The 561 Group's own x402 service found a few paying strangers and then
  stopped selling; the cause was a free substitute and a weak fit with what
  agents need, not only discovery.
- Sellers should check the nearest free substitute, sell what agents need
  mid-task, measure calls per payer, and expect concentration.
- Cloudflare's gateway brings publishers into the market as sellers of pages
  to AI crawlers.
