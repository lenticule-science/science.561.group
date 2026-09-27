# One Request, One Payment

This chapter walks through a single paid request from start to finish. It uses
version 2 of the protocol, the current one, released in December 2025
[@x402v2spec; @coindesk2025v2]. The details are technical, but the shape is
simple, and the shape is what matters for the rest of the book.

## The three parties

An x402 payment involves three roles.

- **The client** wants something. It might be a person's browser, a script, or
  an AI agent partway through a task.
- **The resource server** has something to sell: a web page, a data feed, an
  answer from a model, a file. It sets the price and decides what it will
  accept.
- **The facilitator** checks payments and puts them on the blockchain for the
  server. It is optional. A server that runs its own blockchain connection can
  do the facilitator's job itself. Most do not, for the same reason most shops
  use a card processor instead of connecting to the card network directly.

No party needs an account with another. The client does not sign up with the
server. The server does not know who the client is, only that it paid.

## Step 1: the client asks

The client sends an ordinary web request. Nothing about it says "I intend to
pay". It is the same request a browser sends for any page.

## Step 2: the server names its price

If the resource is not free, the server answers with status 402 instead of the
resource. It attaches a header named `PAYMENT-REQUIRED`. The header carries a
small structured message, and its central part is a list called `accepts`: the
ways the server will take payment. Each entry in that list states:

- **the scheme**, meaning the kind of payment. The common one is `exact`: pay
  this exact amount now.
- **the network**, meaning which blockchain. Version 2 names networks in a
  standard format called CAIP-2, so `eip155:8453` means Base, a blockchain built
  by Coinbase, and a longer identifier beginning `solana:` means Solana.
- **the amount**, in the smallest unit of the token. USDC has six decimal
  places, so an amount of `10000` is one cent.
- **the asset**, meaning which token, given as its address on that network.
- **payTo**, the address that will receive the money.
- **maxTimeoutSeconds**, how long the offer stands.

The message also describes the resource: its address, a description, and what
kind of content it returns. A server can list several entries, for example the
same price on Base and on Solana, and let the client choose.

## Step 3: the client signs

The client picks an entry it can pay and signs a payment. It does not send
money yet. It signs a precise, limited permission.

On Base and similar networks, the permission uses a feature built into USDC
called transfer with authorization, defined in a standard named EIP-3009. The
signed message says, in effect: *move this many units of USDC from my address
to this address, valid after this moment and before that one, and here is a
random number that makes this permission usable once*. Anyone may submit the
signed message to the blockchain, but it can only ever do what it says: that
amount, to that payee, in that window, one time.

A paper check is a fair comparison. The check names the payee and the amount;
anyone can carry it to the bank, but no one can change it or cash it twice.
The difference is that a bank takes days to clear a check, and the blockchain
settles the transfer in seconds.

The client puts the signed permission in a header named `PAYMENT-SIGNATURE`
and sends the original request again.

## Step 4: the server checks, and the payment settles

The server passes the payment to its facilitator. The facilitator offers two
operations, `verify` and `settle`.

- **Verify** checks that the signature is valid, that the amount and payee
  match the price, that the payer has the funds, and that the permission has
  not been used. A facilitator run by a regulated company also screens the
  payer's address against sanctions lists here. Coinbase's facilitator, for
  example, runs checks against the US Treasury's list of sanctioned addresses
  and declines "sanctioned or high-risk addresses" [@cdpfacilitator].
- **Settle** submits the signed transfer to the blockchain and reports the
  result.

The facilitator pays the small network fee for submitting the transfer, which
is why the client needs only USDC and not a second token for fees. Coinbase's
facilitator does the first 1,000 settlements each month free and charges
$0.001 for each after that [@cdpfacilitator].

## Step 5: the server delivers

When settlement succeeds, the server sends the resource with status 200 and a
`PAYMENT-RESPONSE` header. That header carries a receipt: whether the payment
succeeded, the payer's address, the network, and the transaction identifier,
which anyone can look up on the blockchain.

The client now has what it asked for and a public record that it paid.

## What is missing, on purpose

The flow leaves out several things a card payment includes.

- **There is no account.** The server never learns a name, an email or a card
  number. It learns a blockchain address, which is a pseudonym.
- **There is no chargeback.** A blockchain transfer cannot be reversed by a
  bank. If the server takes the money and sends nothing, the client's remedy
  is outside the protocol. Chapter 8 returns to this.
- **There is no subscription.** Each request pays for itself. Version 2 adds
  optional sessions, so a client that has paid can skip the full exchange for
  a while, but the basic unit is still one request [@x402v2launch].
- **There is no identity requirement.** The protocol does not care whether the
  client is a person, a script or an agent. It cannot tell, and neither can
  anyone watching the blockchain. Chapter 6 shows why this matters for
  counting.

## Other schemes

`exact` is the simplest scheme, not the only one. Coinbase's facilitator also
supports two others on its EVM networks [@cdpfacilitator]:

- `upto` lets a client authorize a maximum, with the server charging what the
  request actually used, which suits metered work such as a model that charges
  by length of answer;
- `batch-settlement` gathers many payments into one blockchain transaction to
  cut costs further.

The protocol leaves room for more schemes without changing the core exchange.

## What changed in version 2

The first version of x402, released in May 2025, used headers named
`X-PAYMENT` and `X-PAYMENT-RESPONSE`. Version 2, released on 11 December 2025,
made several changes [@x402v2launch; @coindesk2025v2]:

- **Headers.** Three standard headers without the `X-` prefix, which the web
  now discourages for new headers.
- **Networks.** Standard CAIP-2 network names, so one format works across
  blockchains.
- **Extensions.** Optional extras, such as the discovery information a catalog
  can read, declared with a schema.
- **Sessions.** Wallet-based sessions and identity, so a client need not pay
  in full on every request.
- **Routing.** Payment addresses chosen per request, and support for more than
  one facilitator.

The specification also describes carrying the same messages outside ordinary
web requests. It names the Model Context Protocol (MCP), which AI assistants
use to call tools, and the Agent2Agent protocol (A2A), which Google introduced
so that agents could talk to each other [@x402v2spec].

## What this chapter established

- A paid request has three parties: client, resource server and, usually, a
  facilitator.
- The server answers 402 with a price. The client signs a limited, single-use
  transfer and retries. The facilitator verifies and settles, and the server
  delivers with a receipt.
- There is no account, no chargeback and no subscription; each request pays
  for itself.
- Version 2 standardized the headers and network names and added extensions
  and sessions.
