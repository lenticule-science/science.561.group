# The Law

This chapter describes the law around x402 in the United States as of
September 2026, and says plainly where it is unsettled. It is not legal
advice. A business planning to accept or make payments through x402 should
ask a lawyer who practices in payments.

## The GENIUS Act

The central US law is the Guiding and Establishing National Innovation for
U.S. Stablecoins Act, known as the GENIUS Act, enacted on 18 July 2025
[@geniusact]. It is the first federal statute written for stablecoins.

The Act defines a "payment stablecoin" and says who may issue one. Only a
permitted payment stablecoin issuer may issue a payment stablecoin in the
United States. There are three routes to that status:

- a subsidiary of an insured bank, approved by the bank's federal regulator;
- a federal qualified issuer, approved by the Office of the Comptroller of the
  Currency (OCC);
- a state qualified issuer, approved by a state regulator.

The Act also sets rules for reserves, redemption and supervision. The rules
are written for issuers, not for the businesses that accept their tokens.

**Timing.** Federal regulators had until 18 July 2026 to write rules
implementing the Act. The Act takes effect on 18 January 2027, or 120 days
after final rules are issued if that comes first. The OCC published its
proposed rule in the Federal Register on 2 March 2026, with comments closing
on 1 May 2026 [@occ2026]. So in September 2026 the law is enacted, the rules
are being finished, and the regime is not yet in force.

**What it means for x402.** For a seller or a buyer, the Act mostly changes
the money, not the payment. Once in force, it defines which dollar tokens are
payment stablecoins issued under US supervision. A seller that accepts USDC is
accepting a token whose issuer must meet the Act's requirements once they
apply. The Act does not, by itself, regulate a web server that answers 402.

## Sanctions

US persons, including US companies, may not deal with people and entities on
the Treasury Department's sanctions lists. That obligation does not depend on
the payment method. A US seller that takes an x402 payment from a sanctioned
address has the same problem as one that takes a wire transfer from a
sanctioned person.

Facilitators that screen payments reduce the risk, as Chapter 9 described
[@cdpfacilitator]. Screening by a facilitator is a service the seller relies
on, not a transfer of the seller's legal obligation.

## What is not settled

Several questions a careful seller would ask have no clear answer in the
sources this book relied on. They are listed here so a reader knows what to
take to a lawyer or accountant.

- **Money transmission.** US states license businesses that transmit money
  for others. Whether a facilitator that submits a buyer's signed transfer to
  a seller is transmitting money, and under which states' laws, is not
  settled by any source read for this book. It is more clearly not a question
  for a seller that only receives payments for its own services.
- **Tax on small receipts.** A seller receiving thousands of one-cent payments
  a day has income to report. How receipts in a stablecoin are recorded and
  valued, and what records the tax authorities expect, depend on rules for
  digital assets that were still being clarified in 2026.
- **Consumer protection and disputes.** Card and bank payments to consumers
  come with legal dispute rights. A stablecoin transfer from a person's own
  wallet has no chargeback. How consumer-protection law applies when a
  person's agent pays a seller that fails to deliver is an open question.
- **Liability for an agent's purchases.** If an agent spends outside its
  owner's wishes, the question of who bears the loss is partly a matter of
  contract between the owner and whoever runs the agent or its wallet. It is
  partly a question the law has not answered. Google's AP2 protocol exists
  largely to produce evidence for exactly this dispute: a signed record of
  what the person authorized [@google2025ap2].

## Outside the United States

Other jurisdictions have their own stablecoin regimes, and a seller serving
buyers abroad may be subject to them. The European Union regulates stablecoins
under its Markets in Crypto-Assets Regulation (MiCA). Hong Kong has a
stablecoin licensing ordinance. This book does not cover them. They show that
stablecoin regulation arrived in several major markets within a few years of
each other, and that x402's money is becoming a regulated instrument
everywhere it is used.

## What this chapter established

- The GENIUS Act, enacted in July 2025, defines payment stablecoins and who
  may issue them. It takes effect by January 2027, and regulators were
  finishing its rules in 2026.
- The Act regulates issuers, not x402 sellers, but it defines the money most
  x402 payments use.
- Sanctions obligations apply regardless of payment method; facilitator
  screening helps but does not transfer the obligation.
- Money transmission, tax on micro-receipts, consumer dispute rights and
  liability for agents' purchases remain unsettled.
