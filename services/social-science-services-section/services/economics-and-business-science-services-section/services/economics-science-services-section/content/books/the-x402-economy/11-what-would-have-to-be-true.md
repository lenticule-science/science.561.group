# What Would Have to Be True

Books about new technology usually end with a forecast. This one ends with a
list of conditions instead. Nobody knows how large the x402 economy will
become. It is possible to say what would have to be true for it to become
large, and what a reader could watch to see whether those things are
happening.

## Where things stand

In September 2026 the picture from the previous chapters is this:

- **The protocol works.** It has settled hundreds of millions of payments.
  It has a second version and a neutral foundation whose members include the
  card networks, the largest cloud providers and the main payment companies.
- **The market is small.** Careful studies put genuine commerce in the tens
  of millions of dollars since May 2025, with a small and uncertain share
  paid by AI agents [@visaartemis2026; @pymnts2026trm].
- **Daily volume has fallen** by about 93% since the start of 2026, from a
  peak driven largely by token speculation [@ccn2026].
- **Most sellers earn almost nothing.** A few earn most of the revenue.

That is the position of a payment rail built ahead of the trade it expects.
The conditions below are what the trade would need.

## Condition 1: things worth buying in the middle of a task

A machine pays for something when a task it is doing needs it and cannot get
it free. The services that fit are those an automated process needs again and
again:

- current data;
- specialized computation;
- verification and checking;
- access to material that is otherwise gated.

The Bazaar in August 2026 was full of samples, services tried once and not
again. For the market to grow, it needs services that buyers return to.

**What to watch:** calls per payer in public catalogs. If the typical buyer
of a service calls it dozens of times rather than once, services are being
built into work rather than tried out.

## Condition 2: buyers trusted with budgets

Agents spend money only if people and businesses give them money to spend.
That takes trust: that an agent will buy what it should, at a fair price, and
will not be tricked into paying an attacker. The tools for that trust are
being built:

- signed mandates that record what a person authorized (AP2);
- card-network programs that authenticate agents;
- wallets that enforce spending rules outside the model.

**What to watch:** whether mainstream AI assistants and agent frameworks ship
with wallets and spending controls built in, and whether businesses give
agents standing budgets rather than approving each purchase.

## Condition 3: honest measurement

A market that cannot count itself cannot price itself. Sellers deciding
whether to build, investors deciding whether to fund, and regulators deciding
what to watch all need figures that separate commerce from noise. In 2026 the
most-quoted figure was a counter that had not changed in six months
[@mcglynn2026]. The careful figures came from analysis firms whose full
reports most readers never see.

**What to watch:** dated, filtered statistics published with their methods,
and catalogs that rank sellers by returning buyers rather than raw payment
counts.

## Condition 4: fixed weak points

The flaws researchers found in 2026 sit at the joins between web requests,
signed permissions and settlement [@li2026attacks; @ling2026freeriding].
Each has a fix. The market needs the fixes to reach the libraries most sellers
use, and needs sellers to update.

**What to watch:** whether later security studies find the same classes of
flaw in current deployments or new ones.

## Condition 5: recourse

x402 has no chargeback. For one-cent purchases that barely matters. For
larger purchases, and for purchases made by people through agents, the lack of
recourse is a reason to use a card instead. Escrow and refund arrangements
built on top of x402 could narrow that gap.

**What to watch:** whether refundable or escrowed payment schemes appear in
the protocol or its common extensions, and whether sellers adopt them.

## Condition 6: settled law

The GENIUS Act takes effect by January 2027 [@geniusact], and its issuer rules
define what a payment stablecoin is. Other questions, about money
transmission, tax on micro-receipts and consumer disputes, remain open.
Businesses that need legal certainty before they act are waiting for answers.

**What to watch:** final implementing rules for the Act, and guidance from
state regulators and tax authorities on receiving and spending stablecoins in
small amounts.

## Condition 7: crawlers that pay

Cloudflare's Monetization Gateway gives publishers a way to charge the AI
crawlers that already read their pages [@cloudflare2026gateway]. If crawler
operators pay rather than go around, publishers could become the largest
group of x402 sellers, with buyers who are already there.

**What to watch:** whether large AI companies' crawlers pay at gateways, and
whether publishers turn the gateway on.

## Where x402 might settle

Even if every condition holds, x402 need not carry every agent payment. For
purchases in the tens or hundreds of dollars, card payments bring fraud
protection and dispute rights that stablecoin transfers lack, and the card
networks are building agent programs of their own. The comparison in
Chapter 5 suggests a division:

- **cards**, with agent tokens and mandates, for larger purchases a person
  approves;
- **stablecoin rails such as x402**, for small, frequent purchases a program
  makes on its own.

The second category is the one the web never managed to serve. It is the one
the 402 status code was reserved for.

Whether that category becomes large depends on the conditions in this
chapter. None of them requires a new invention. All of them require time,
trust and evidence, and a reader can watch each one.

## What this chapter established

- x402 in 2026 is a working rail with a small market.
- Growth would need seven things:
  - services buyers return to;
  - buyers trusted with budgets;
  - honest measurement;
  - fixed weak points;
  - recourse;
  - settled law;
  - crawler operators that pay.
- Each condition has something observable to watch.
- A plausible division gives cards the larger purchases people approve, and
  stablecoin rails the small purchases programs make on their own.
