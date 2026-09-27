# Counting the Market

How big is the x402 economy? Published answers range from about $15 million to
well over $100 million in total payments, and from "hundreds of millions of
transactions" to "demand is just not there yet". This chapter explains why the
answers differ and what the careful ones say.

## Why the chain makes counting easy, and wrong

Every x402 payment settles as a transfer on a public blockchain. Anyone can
download every transfer and add them up, and many people do. That is a rare
thing in payments. Nobody outside Visa can count Visa's transactions.

But a blockchain records transfers, not intentions. It shows that one address
sent another address 0.01 USDC through a facilitator. It does not show:

- whether the two addresses belong to different people;
- whether anything was delivered in return;
- whether the payer was a person, a script, or an AI agent;
- whether the payment was a purchase, a test, or an attempt to make a
  protocol look busy.

Four kinds of activity inflate the raw count.

1. **Self-payment.** A seller pays its own endpoint, to test it or to make it
   look popular.
2. **Wash trading.** Addresses pay each other in circles to create the
   appearance of volume, often to promote a token or a project.
3. **Developer tests.** Builders pay small amounts to check that their code
   works.
4. **Token launches.** In October 2025 a token called PING was created
   entirely through x402 payments: each payment of 1 USDC minted a share of
   the token. Speculators paid in large numbers. Chainalysis, a blockchain
   analysis firm, reported that x402 transactions on Base rose more than
   10,000% in a single week during this episode [@chainalysis2026]. Those
   were real payments, but they bought a token, not a service.

## The figures, and what each counts

The table below lists the most cited figures in September 2026, with what each
actually measures.

| figure | what it counts | source |
|---|---|---|
| "over 100M payments" since May 2025 | every settlement, unfiltered | the x402 project [@x402v2launch] |
| more than 100 million cumulative transactions on Base through early 2026 | Base only, unfiltered | Chainalysis [@chainalysis2026] |
| $135.7 million across 178.3 million transactions, to 21 April 2026 | every settlement, unfiltered | Visa and Artemis [@visaartemis2026] |
| $15.0 million across 109.6 million transactions, same period | settlement after removing activity that resembles wash trading or testing | Visa and Artemis [@visaartemis2026] |
| $52.7 million across 198.9 million settlements on Base, Solana and Polygon, May 2025 to September 2026 | every settlement on three chains | TRM Labs [@pymnts2026trm] |
| $25.6 million of that | after removing self-dealing and other anomalous flows | TRM Labs [@pymnts2026trm] |
| 0.6% to 7.5% of that value | the share TRM judged plausibly paid by AI agents | TRM Labs [@pymnts2026trm] |
| about $28,000 a day, about 131,000 transactions a day, average about $0.20, roughly half "gamed" | daily activity in March 2026 | CoinDesk, using Artemis data [@reynolds2026] |
| daily volume down 93% from the start of 2026 | daily settlement, mid-August 2026 | CCN, citing Helios Analytics [@ccn2026] |

Read together, the careful figures agree more than the headlines suggest.

**Filtered commerce is a few tens of millions.** Visa and Artemis found $15
million of plausible commerce in x402's first eleven months. TRM found $25.6
million in its first sixteen months. Removing wash trading and tests cut the
dollar total by about 89% in the first study and by about half in the second.

**Transaction counts shrink less than dollars.** In the Visa and Artemis
study, filtering removed 39% of transactions but 89% of value. The genuine
payments are many and small. The inflating ones are fewer and larger.

**The agent share is small and uncertain.** TRM's range, 0.6% to 7.5% of
filtered value, is wide because, in its words, a conventional script "can
execute exactly the same sequence" as an agent [@pymnts2026trm]. Nothing on
the chain marks a payment as agentic.

**Activity peaked early and has fallen.** Daily settlement volume approached
$800,000 on many days in late 2025 and sometimes passed $1 million. By
mid-August 2026 the seven-day average was about $41,800, down 93% since the
start of the year [@ccn2026]. Much of the 2025 peak was token speculation and
testing that did not continue.

## The counter that did not move

One figure deserves its own warning. For much of 2026 the x402 project's
website showed a panel labeled "Last 30 Days" with four numbers: 75.41 million
transactions, $24.24 million in volume, 94,060 buyers and 22,000 sellers.
Those numbers were widely quoted as the market's current monthly size.

In September 2026 the writer Daniel McGlynn documented that the panel had
shown the same four numbers since March [@mcglynn2026]. Six months later, the
"last 30 days" had not changed. The page gave no timestamp, no method and no
breakdown by chain. Reports that cited it passed the stale figures along.

The 561 Group, which wrote this book, made the same mistake. An internal note
written in late September 2026 quoted the frozen numbers as the thirty days to
13 September. The note has since been corrected. The mistake is typical: a
number that looks official, carries a date label, and matches earlier
reporting is easy to repeat and hard to question.

## Catalogs are not markets

A different kind of miscount comes from catalogs. Coinbase runs a directory of
x402 services called the Bazaar, which lists an endpoint after its first
payment settles through Coinbase's facilitator. The 561 Group read the whole
catalog on 27 August 2026 [@bazaar2026measure]. It held 14,841 resources.
Over the previous thirty days they reported 292,674 calls from 42,316
distinct payers and about $30,600 in revenue.

The same day, a sample of the matching transfer events on Base suggested about
3.3 million such transfers a month. The Bazaar's reported calls were under a
tenth of that. The catalog lists only endpoints that opted in and that settled
through Coinbase's facilitator, and not every matching transfer on the chain
is an x402 payment at all. The two numbers measure different things, and
neither is "the market".

Revenue inside the catalog was also highly concentrated:

- one gift-card seller earned about $21,000 of the $30,600;
- the top ten resources together earned 78%;
- the other 14,771 active resources shared about $6,800, less than fifty
  cents each for the month.

## How to read an x402 statistic

A reader meeting an x402 figure can ask five questions of it.

1. **Raw or filtered?** A raw count includes self-payment, wash trading,
   tests and token mints. Ask whether anything was removed and how.
2. **Which chains?** Base, Solana and others each carry part of the traffic.
   A Base-only figure is not a total.
3. **Which period, and when was it measured?** A "last 30 days" figure should
   say which thirty days.
4. **Transactions or dollars?** Transaction counts favor many tiny payments.
   Dollar totals favor a few large ones. The two tell different stories.
5. **Payments or commerce?** A payment is a transfer. Commerce is a transfer
   in exchange for something delivered. The chain shows the first; only
   filtering and judgment estimate the second.

## What the careful numbers mean

Taken together, the careful measurements describe a real protocol with a small
market.

- **The infrastructure works.** Hundreds of millions of settlements moved
  without the protocol breaking.
- **Genuine commerce is tens of millions of dollars in total.** That is
  across all sellers and more than a year, which is small beside the
  protocol's backers or the card networks' daily volume.
- **Demand has fallen from a speculative peak.** Most of that peak was not
  commerce.
- **Agents are a minority of payers.** Nobody can yet say exactly how small a
  minority.

CoinDesk summarized the position in March 2026: the infrastructure is arriving
before the economy it is meant to serve [@reynolds2026]. The next chapter asks
what sellers found when they opened for business in that economy.

## What this chapter established

- Blockchains make x402 payments easy to count and easy to miscount, because
  self-payment, wash trading, tests and token mints look like purchases.
- Filtered studies find $15 million to $26 million of plausible commerce in
  the protocol's first eleven to sixteen months, with a small and uncertain
  share paid by agents.
- Daily volume fell about 93% from the start of 2026 to August.
- A widely quoted "last 30 days" counter showed the same numbers from March to
  September 2026.
- A catalog of sellers, such as the Bazaar, measures the catalog and not the
  market.
