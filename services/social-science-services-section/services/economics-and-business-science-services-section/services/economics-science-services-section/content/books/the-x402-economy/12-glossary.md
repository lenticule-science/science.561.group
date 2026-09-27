# Glossary {.unnumbered}

**A2A (Agent2Agent protocol).** A protocol for AI agents to exchange messages
and hand tasks to one another, introduced by Google. x402 version 2 names it
as a way to carry payment messages.

**Address.** The public identifier of a wallet on a blockchain. Payments are
sent to and from addresses. An address is a pseudonym: it does not name its
owner, but every payment it makes is public.

**Agent (AI agent).** A program, usually built on a large language model,
that pursues a goal by choosing steps and calling other programs and services
on a person's behalf.

**AP2 (Agent Payments Protocol).** Google's protocol, published in September
2025, for proving that a person authorized an agent's purchase, using signed
records called mandates.

**ACP (Agentic Commerce Protocol).** The protocol OpenAI and Stripe published
in September 2025 for checkout through an AI assistant, with the merchant
charging a scoped payment token.

**Base.** A low-fee blockchain network built by Coinbase on top of Ethereum;
one of the two main networks for x402 payments.

**Bazaar.** Coinbase's catalog of x402 services, which lists an endpoint after
a payment to it settles through Coinbase's facilitator.

**Blockchain.** A shared public ledger, maintained by many computers, that
records transfers of tokens. Records are permanent and anyone can read them.

**CAIP-2.** A standard format for naming blockchain networks, such as
`eip155:8453` for Base. x402 version 2 uses it.

**Calls per payer.** The number of paid requests each distinct buyer makes to
a service. Near one suggests sampling; tens or more suggest recurring use.

**Chargeback.** A reversal of a card payment ordered by the card issuer after
a dispute. x402 payments have no chargeback.

**EIP-3009 (transfer with authorization).** A standard that lets the holder of
a token such as USDC sign a transfer that someone else submits to the
blockchain. x402's `exact` scheme uses it on Base and similar networks.

**exact, upto, batch-settlement.** x402 payment schemes. `exact` pays a fixed
amount now. `upto` authorizes a maximum, with the seller charging what was
used. `batch-settlement` gathers many payments into one blockchain
transaction.

**Facilitator.** The optional party that verifies an x402 payment and submits
it to the blockchain for a seller, often screening the payer against
sanctions lists.

**GENIUS Act.** The US law, enacted in July 2025, that defines payment
stablecoins and who may issue them. It takes effect by January 2027.

**HTTP.** The Hypertext Transfer Protocol, the rules web browsers and servers
follow to request and deliver pages and data.

**HTTP status code.** The three-digit number a web server returns with every
answer, such as 200 (success), 404 (not found) or 402 (payment required).

**L402.** Lightning Labs' protocol for HTTP 402 payments over Bitcoin's
Lightning Network, first published in 2020 as LSAT.

**Mandate.** In AP2, a signed record of what a person has authorized an agent
to buy.

**MCP (Model Context Protocol).** A protocol AI assistants use to call
external tools and data sources. x402 version 2 names it as a way to carry
payment messages.

**Micropayment.** A payment small enough, typically under a dollar and often
under a cent, that processing costs and the buyer's attention have
historically outweighed it.

**MPP (Machine Payments Protocol).** The protocol Stripe and Tempo published
in March 2026 for payments carried by requests, in stablecoins or cards.

**Prompt injection.** Text written to steer an AI agent against its
instructions, for example by telling it to pay an attacker.

**Resource server.** In x402, the server that sells something and answers
unpaid requests with 402.

**Self-payment.** A payment from a seller to itself, for testing or to make a
service look used. It inflates raw counts of x402 activity.

**Solana.** An independent blockchain designed for speed and low fees; one of
the two main networks for x402 payments.

**Stablecoin.** A token on a blockchain whose issuer promises to redeem it at
a fixed value, usually one US dollar, and holds reserves to back the promise.

**USDC.** A dollar stablecoin issued by Circle. Nearly all x402 payments are
made in it.

**Wallet.** Software that holds the secret key for a blockchain address and
signs transfers from it.

**Wash trading.** Payments between addresses controlled by the same party,
made to create the appearance of activity.

**x402.** The open protocol, started by Coinbase in 2025 and now stewarded by
the x402 Foundation at the Linux Foundation, that gives HTTP 402 a meaning: a
server answers with a price, the client pays in a stablecoin and retries, and
the server delivers.
