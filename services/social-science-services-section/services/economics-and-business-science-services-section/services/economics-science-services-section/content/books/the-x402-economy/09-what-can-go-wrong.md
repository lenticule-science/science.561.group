# What Can Go Wrong

Every payment system is attacked, and a new one is attacked where it is new.
This chapter collects what is known in September 2026 about x402's weak
points. It covers risks to sellers, risks to buyers, and risks to the system
as a whole.

## What security researchers found

Two academic studies published in May 2026 examined x402 in detail. Both
tested their attacks against real software, and both disclosed their findings
to the affected projects.

The first, by Zelin Li, Qin Wang and Zhipeng Wang, presented five attacks
[@li2026attacks]. They targeted:

- the checks that decide whether a payment authorizes a request;
- the link between a payment and the service it pays for;
- the protection against reusing a payment;
- the way web servers handle payment headers;
- the gap between a web request, which is answered at once, and blockchain
  settlement, which completes a moment later.

The authors demonstrated the attacks on local test chains, on Base's test
network and against live endpoints.

The second, by Shengchen Ling and six colleagues, analyzed x402 systematically
and named four classes of flaw [@ling2026freeriding].

- **Cross-resource substitution.** A payment made for one resource is
  accepted for another. A buyer pays the price of the cheap item and receives
  the expensive one.
- **Duplicate-settlement race.** One payment is presented twice, fast enough
  that both requests are served before the first settlement is recorded.
- **Allowance overdraft.** Where a buyer has authorized spending up to a
  limit, the limit is exceeded, or reused beyond what was intended.
- **Denial of settlement.** The seller delivers on a payment that then fails
  to settle, because the buyer moved the funds or the authorization expired.

Against official libraries and production deployments, the authors found that
in some configurations all of a paid resource could be obtained without
paying. They proposed specific fixes and a combined defense with a small cost
in speed.

These are the usual growing pains of a payment protocol. Card payments went
through decades of similar discoveries. They also show where the design is
delicate: at the joins between the web request, the signed permission and the
blockchain.

## What sellers should do

The studies' lessons for a seller reduce to a few practices, most of them
already in careful implementations:

- **bind each payment to the exact resource and request**, so a payment for
  one thing cannot be spent on another;
- **settle before delivering**, or accept the risk of delivering on a payment
  that fails;
- **remember every payment already accepted**, and refuse to serve one twice;
- **keep the payment software current**, since the reference libraries have
  changed in response to these findings;
- **price with abuse in mind**: an item that costs a lot to produce should
  not be reachable by any path that skips its own payment.

## What buyers should fear

Chapter 8 covered the main risks to buyers:

- **prompt injection** that steers an agent to pay;
- **a stolen key** that empties a wallet;
- **a seller who takes payment and delivers nothing.**

One more belongs here. An address that has made many payments is a public
profile of its owner's activity, and that profile can be read by anyone.

## Fake activity

Chapter 6 showed how much x402 activity was not commerce. Wash trading and
self-payment are not only measurement problems. They are a kind of fraud.

- **Wash trading** makes a project, a token or a seller look busier than it
  is, to attract investors or buyers.
- **Self-payment** can plant a seller in catalogs that list by usage.

CoinDesk's March 2026 report, using Artemis data, estimated that roughly half
of x402 activity at the time was "gamed" [@reynolds2026]. A catalog that ranks
sellers by payment count invites exactly this. Buyers who rely on popularity
signals should prefer those that are hard to fake: distinct payers who return
over time, rather than raw call counts.

## Money laundering and sanctions

A payment system that needs no account attracts people who cannot open one
legally. TRM Labs' 2026 Crypto Crime Report found that illicit cryptocurrency
flows reached a record in 2025. It found that stablecoins carried 95% of the
funds flowing to sanctioned entities that year [@trm2026crime]. That report
covers crypto broadly, not x402 specifically. It explains why regulators watch
any new stablecoin payment rail.

x402 has two points of control that address this.

- **Facilitators screen.** Coinbase's facilitator checks payer addresses
  against the US Treasury's sanctions list and other risk indicators, and
  declines payments from sanctioned or high-risk addresses [@cdpfacilitator].
  A seller using such a facilitator inherits that screening.
- **Issuers can freeze.** Circle can freeze USDC held at an address, and does
  so in response to legal orders. Tokens at a frozen address cannot move.

Both controls are real, and both have limits. A seller can settle payments
itself and skip facilitator screening. Screening lists only catch known
addresses. And TRM's analysis of x402 found that "agentic commerce will need
agentic compliance": because a script and an agent leave the same record,
existing monitoring built around people does not fit [@pymnts2026trm].

## Concentration

Chapter 4 noted that a few companies carry most x402 traffic:

- Coinbase runs the main facilitator and the Base network;
- Circle issues the stablecoin almost every payment uses;
- Cloudflare carries a large share of the web traffic where prices are
  checked.

Each is a point where a policy change, an outage or a legal order reaches
most of the market at once.

This is not a hidden flaw; it is how payments usually look. It does mean that
an x402 seller depends on companies other than its customers. A facilitator
can stop serving a category of business. An issuer can freeze an address. A
network can change its fees. Sellers who care can use more than one
facilitator, which version 2 supports, and accept payment on more than one
network.

## What this chapter established

- Two 2026 studies found flaws where the web request, the signed permission
  and blockchain settlement meet. Among them: payments reused, payments
  applied to the wrong resource, allowances overdrawn, and delivery on
  payments that fail.
- Sellers should bind payments to requests, settle before delivering, track
  accepted payments and keep software current.
- Wash trading and self-payment distort both statistics and catalogs.
- Facilitator screening and issuer freezes are the main controls against
  sanctioned or illicit use, and both have limits.
- A few companies carry most of the market, so their policies reach nearly
  every seller.
