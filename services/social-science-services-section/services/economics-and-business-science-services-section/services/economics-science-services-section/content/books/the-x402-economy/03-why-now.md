# Why Now

Chapter 1 ended with two changes: cheap digital dollars and buyers that are
programs. This chapter looks at each more closely, and at a third, quieter
change: the tools that let a seller add a price to a web service in an
afternoon.

## Digital dollars

A stablecoin is a token on a blockchain that its issuer promises to redeem at
a fixed value, almost always one US dollar. The issuer holds reserves, cash
and short-term government debt, against the tokens it has issued. Anyone
holding a token can send it to anyone else on the same blockchain without
asking a bank.

x402 settles almost entirely in one stablecoin, USDC, issued by the US
company Circle. When the blockchain analysis firm TRM Labs examined about 199
million x402 settlements made between May 2025 and September 2026, 99.6% of
the value was in USDC [@pymnts2026trm].

Three features of USDC matter to x402.

**It is a dollar.** A seller who prices a request at one cent receives one
cent's worth of a dollar token, not a volatile asset whose value might double
or halve by the end of the week. Earlier attempts to use Bitcoin for small web
payments had to explain to sellers why their revenue changed with the market.
A dollar stablecoin avoids that conversation.

**It can be moved by someone else's hand.** USDC implements the EIP-3009
standard, which lets a holder sign a transfer that a third party submits to
the blockchain. That is what lets a facilitator settle a payment the buyer
never broadcast. The buyer signs; the facilitator pays the network fee and
submits. Without this feature every buyer would need to hold a second token
just to pay network fees, which is exactly the sort of setup cost that sank
earlier schemes.

**It is regulated.** In the United States the GENIUS Act, signed on 18 July
2025, made a "payment stablecoin" a legally defined instrument that only
approved issuers may offer [@geniusact]. The law is not yet fully in force.
Chapter 10 covers the details. For a seller deciding whether to accept a
token, a law that defines who may issue it and what reserves they must hold
changes the question.

## Cheap, fast networks

A stablecoin moves on a particular blockchain, and blockchains differ greatly
in cost and speed. On Ethereum's main network, a single transfer can cost more
than the payment it carries. x402's early traffic went instead to networks
built for low fees:

- **Base**, a network built by Coinbase on top of Ethereum;
- **Solana**, an independent blockchain designed for speed.

On these networks a USDC transfer costs a small fraction of a cent and
confirms in seconds.

This is the change that removes the processing cost of Chapter 1. When moving
one cent costs a hundredth of a cent, a one-cent price makes sense for the
first time.

It did not make network fees disappear. It made them small enough to hide. A
facilitator absorbs them, or charges a flat tenth of a cent, or batches many
payments into one transaction. The buyer sees the price and nothing else.

## Buyers that are programs

The third change is on the buying side, and it is the one x402's backers talk
about most.

Much of the web's paid machinery assumes a person on the other end.

- **Sign-up** asks for an email address and a password.
- **Checkout** asks for a card number and a billing address, and sometimes a
  code sent to a phone.
- **Subscriptions** ask the buyer to choose a plan, on the assumption that the
  buyer will come back tomorrow and the day after.
- **Many services** add a check that the visitor is human, precisely to keep
  programs out.

AI agents do not fit that machinery. An agent asked to research a question
might want one article from a news archive, one lookup from a company
register, one answer from a specialized model, and one image, each from a
different seller, each once. Signing up for four subscriptions to make four
requests is absurd for a person and impossible for most programs.

Stripe, the payments company, described the problem this way when it
introduced its own agent payment protocol in 2026: "Making a purchase today
can require an agent to create an account, navigate a pricing page, choose
between subscription tiers, enter payment details, and set up
billing—steps that often require human intervention" [@stripe2026mpp].

x402 removes those steps. The agent meets a price in the 402 response, checks
it against its budget and rules, signs, and continues. The person who
deployed the agent set the budget once. The agent spends within it.

This is also where the old argument against micropayments stops applying.
Szabo and Shirky argued that people would not tolerate a stream of tiny
decisions. An agent makes the tiny decisions by rule, and the person makes one
decision, about the budget, the way they would about a subscription.

## Crawlers that take without paying

There is a second kind of machine buyer, and it did not ask to be one.
Companies that train and run AI models send programs called crawlers across
the web to read and copy pages. Publishers bear the cost of serving those
pages and, they argue, lose readers to AI answers built from them.

Cloudflare, which carries a large share of the web's traffic, has built
products around this problem. Its earlier Pay per crawl service let
publishers charge AI crawlers for pages, settled through conventional payment
rails. In July 2026 it announced the Monetization Gateway, which extends the
same idea to web pages, APIs, datasets and AI tool calls, and settles through
x402 in stablecoins [@cloudflare2026gateway]. The gateway checks payments at
the edge of Cloudflare's network, in more than 330 cities, before a request
reaches the publisher's own server. For a publisher already behind
Cloudflare, adding a price becomes a setting.

## Tools that make it an afternoon's work

The last change is ordinary but decisive. Coinbase released x402 with an
open-source reference implementation under the Apache 2.0 license. It included
libraries for common programming languages and plug-ins for popular web
frameworks. A developer with an existing web service could add a price to one
route with a few lines of configuration. Cloud companies and payment companies
followed:

- Stripe began accepting x402 payments in USDC on Base in early 2026;
- Cloudflare's gateway made pricing a network setting for its customers.

When accepting a payment is that easy, sellers try it. Chapter 6 shows that
many of them did, and Chapter 7 shows that trying is not the same as selling.

## What this chapter established

- x402 settles in dollar stablecoins, almost entirely USDC, which is stable in
  value, can be submitted by a third party, and is becoming a regulated
  instrument in the United States.
- Low-fee networks such as Base and Solana make a one-cent payment cost a
  fraction of a cent to settle.
- Software buyers cannot use sign-up and checkout flows built for people, and
  do not suffer the mental transaction costs that sank earlier micropayments.
- AI crawlers created a second, unwilling kind of machine buyer, and Cloudflare
  now offers publishers a way to charge them through x402.
- Open-source tools reduced accepting a payment to configuration.
