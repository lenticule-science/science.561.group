# Who Built It, and Who Governs It

A protocol is only useful if many unrelated parties follow it. The story of
x402's first sixteen months is mostly a story of one company building a
protocol and then working to make it not its own.

## A timeline

| date | event |
|---|---|
| May 2025 | Coinbase releases x402, naming AWS, Anthropic, Circle and NEAR as collaborators, with an open-source reference implementation |
| September 2025 | Coinbase and Cloudflare announce they will form an x402 Foundation |
| October 2025 | A token called PING, created entirely through x402 payments, drives a jump in weekly transactions of about 10,000% [@chainalysis2026] |
| 11 December 2025 | Version 2 of the protocol is released [@coindesk2025v2] |
| February 2026 | Stripe begins accepting x402 payments |
| 18 March 2026 | Stripe and Tempo publish the Machine Payments Protocol, and Stripe says it will support both it and x402 [@stripe2026mpp] |
| 2 April 2026 | The Linux Foundation announces it will host the x402 Foundation [@coindesk2026lf] |
| 1 July 2026 | Cloudflare announces its Monetization Gateway, which charges for web resources through x402 [@cloudflare2026gateway] |
| 14 July 2026 | The x402 Foundation launches operationally under the Linux Foundation [@lf2026] |

## Coinbase's reasons

Coinbase runs a cryptocurrency exchange, a set of developer products, and the
Base network. It also helped create USDC and shares in its economics. A
protocol that makes USDC the ordinary way for software to pay for things on
the web serves every part of that business: more USDC in use, more
transactions on Base, more developers using Coinbase's tools, and more
settlements through Coinbase's facilitator.

Coinbase has been open about the problem it set out to solve. At the
Foundation's launch, Lincoln Murr of Coinbase said: "x402 was started at
Coinbase to solve a real problem – AI agents had no native way to pay"
[@lf2026].

A protocol that serves one company's interests is hard to adopt for that
company's competitors. Stripe, Google, Visa and Mastercard have little reason
to build their agent payment plans on a standard Coinbase controls. The
second half of the timeline is Coinbase addressing that.

## From company project to foundation

In September 2025 Coinbase and Cloudflare announced a foundation to steward
the protocol. In April 2026 the Linux Foundation, a nonprofit that hosts
widely shared software such as the Linux kernel and Kubernetes, announced it
would host the x402 Foundation. The foundation launched operationally on 14
July 2026 [@lf2026]. It had 17 premier members:

- **card networks and processors:** Adyen, American Express, Fiserv,
  Mastercard, Stripe and Visa;
- **cloud and web companies:** Amazon Web Services, Cloudflare, Google and
  Shopify;
- **crypto companies and foundations:** Circle, Coinbase, the Monad
  Foundation, MoonPay, Ripple, the Solana Foundation and the Stellar
  Development Foundation.

Seventeen general members joined as well, from crypto infrastructure firms
and blockchain foundations to KakaoPay and World Liberty Financial, plus
several associate members.

Jim Zemlin, the Linux Foundation's chief executive, framed the purpose this
way: "AI agents and automated systems are becoming active participants in the
global economy, yet they have lacked a native, secure way to transact"
[@lf2026].

The membership list shows how the protocol changed status in a year. Visa,
Mastercard and American Express run the card networks that stablecoin
payments might someday compete with. Stripe publishes a rival protocol.
Google publishes a protocol for authorizing agent purchases. All of them
joined.

## Why rivals join a standard

It can look strange for companies to join a standard started by a
competitor. There are three ordinary reasons.

**Standards are cheaper shared.** If every payment company defined its own
402 format, every seller would have to support all of them and every agent
would have to speak all of them. A shared format grows the whole market,
including each member's part of it.

**Membership buys a voice.** A premier member of a foundation helps decide
what the next version says. A company outside the foundation must adapt to
whatever the members decide.

**Joining costs little and hedges much.** Nobody knows yet which agent
payment protocols will carry real volume. Joining x402's foundation while
building or backing another protocol lets a company be present wherever the
volume goes. Stripe accepts x402 and publishes its own protocol. Google backs
x402 and publishes AP2. Chapter 5 shows that these protocols mostly solve
different parts of the problem, which makes hedging easier.

## What the foundation does not change

A neutral foundation governs the specification. It does not govern the
infrastructure that most x402 payments pass through.

- **Coinbase runs the dominant facilitator**, and settlement through it
  depends on its screening policies and pricing.
- **Base, Coinbase's network, is one of the two main blockchains** for x402
  traffic. In mid-2026 reports put Solana ahead by count of transactions.
- **Circle issues USDC** and can freeze tokens at an address.
- **Discovery depends partly on catalogs run by interested parties.** One
  widely used x402 explorer is operated by a foundation member and charges
  for its own data through x402 [@mcglynn2026].

None of this is unusual. Card payments follow open standards and still flow
through a few large processors and networks. It does mean that "open
protocol" describes the rules, not who carries the traffic.

## What this chapter established

- Coinbase released x402 in May 2025, released version 2 in December 2025,
  and moved the protocol into a Linux Foundation body that launched in July
  2026.
- The foundation's members include the card networks, the largest cloud
  providers, Stripe, Google and major crypto companies, several of which back
  other agent payment protocols too.
- Rivals join because shared standards grow the market, membership buys a
  voice, and joining hedges an uncertain outcome.
- The foundation governs the specification. The facilitators, networks and
  stablecoin issuers that carry most payments remain a small set of
  companies.
