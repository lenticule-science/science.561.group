# The Other Rails

x402 is one of several protocols published since 2025 for payments made by
software. News coverage often presents them as a race. Read closely, most of
them answer different questions. This chapter describes each and then sorts
them by the question it answers.

## Agentic Commerce Protocol (ACP)

OpenAI and Stripe released the Agentic Commerce Protocol on 29 September
2025, under the Apache 2.0 license, alongside a feature that let ChatGPT users
in the United States buy from Etsy sellers without leaving the chat
[@stripe2025acp].

ACP is about checkout: a person shopping through an AI assistant.

1. The assistant collects the buyer's choice of product and payment method.
2. It hands the merchant a narrowly scoped payment token.
3. The merchant charges that token through its usual payment processor.

The merchant remains the seller of record, with its own refund and support
obligations. Card payments, disputes and consumer protections work as they do
for any online purchase.

ACP assumes a person is present and choosing. It is not designed for a
program paying a few cents for a data lookup in the middle of a task.

## Agent Payments Protocol (AP2)

Google published the Agent Payments Protocol on 16 September 2025 with more
than 60 partners, among them Adyen, American Express, Mastercard, PayPal,
Coinbase and Worldpay [@google2025ap2].

AP2 is about authorization. Its central object is the mandate, a signed record
of what a person told an agent it may buy. A mandate might say "buy this
jacket in size M when the price drops below $120". The merchant and the
payment network can check the mandate and know a real person approved this
purchase within these limits.

AP2 does not move money itself. It works with cards, bank transfers and
stablecoins, and Google and Coinbase published an extension that uses x402 as
the stablecoin rail beneath AP2's mandates.

## Machine Payments Protocol (MPP)

Stripe and Tempo, a blockchain for payments that Stripe backed, published the
Machine Payments Protocol on 18 March 2026 [@stripe2026mpp]. Like x402, MPP
lets any web address answer a request with a payment demand. It supports two
kinds of payment:

- stablecoins on the Tempo network;
- cards and buy-now-pay-later through Stripe's "Shared Payment Tokens", which
  let an agent use a person's card without seeing the card number.

MPP is the closest thing x402 has to a direct competitor. It solves the same
problem, a request carrying its own payment, with a different network and
with cards included. Stripe also accepts x402, so a seller using Stripe can
offer both.

## L402

L402, from Lightning Labs, is the oldest protocol here. It was first published
in 2020 under the name LSAT [@lsat2020; @l402spec].

It uses the same 402 status as x402, with Bitcoin's Lightning Network in place
of stablecoins.

1. The server answers with a Lightning invoice and a credential called a
   macaroon.
2. The client pays the invoice and gets back a secret, the preimage, as
   proof.
3. It retries with the macaroon and the preimage together.

The server can check them without looking anything up.

L402's strengths are the Lightning Network's speed and Bitcoin's independence
from any single issuer. Its weaknesses, for many sellers, are that it prices
in Bitcoin rather than dollars and that Lightning payments need the payer to
have a funded channel. The two protocols are close enough in design that some
tools support both.

## The card networks' programs

Visa and Mastercard have each built programs for agents that pay with cards.

- **Visa** calls its protocol the Trusted Agent Protocol.
- **Mastercard** calls its program Agent Pay.

Both do two things. They authenticate the agent, so a merchant can tell a
registered AI platform from an unknown bot. And they tokenize the card, so
the agent carries a limited stand-in rather than the card number.

These programs do not create a new way to move money. The money still moves
over card networks. They answer a trust question: is this agent who it says
it is, and is it allowed to use this card? Both networks are also premier
members of the x402 Foundation.

## Sorting them by question

The protocols stop looking like rivals when sorted by the question each one
answers.

| question | protocols |
|---|---|
| Did a person authorize this purchase, within what limits? | AP2 (mandates); ACP (checkout with the person present) |
| How does one web request carry its payment? | x402, MPP, L402 |
| Is this agent who it claims to be, and may it use this card? | Visa's Trusted Agent Protocol, Mastercard's Agent Pay |
| What money moves, over which network? | stablecoins on Base, Solana and other chains (x402); stablecoins on Tempo, or cards (MPP); Bitcoin over Lightning (L402); cards (ACP, the card programs) |

A single purchase can use several at once. An agent might hold an AP2 mandate
from its person, meet an x402 price at a data service, and pay in USDC on
Base. A shopping assistant might use ACP to check out and a card network's
agent program to prove who it is.

The real competition is narrower than the headlines. On the second row,
"how does a request carry its payment", x402, MPP and L402 compete directly.
On the fourth, stablecoins compete with cards. Card payments bring chargebacks,
fraud protection and universal acceptance. Stablecoin payments bring low fixed
costs, settlement in seconds and no account. For a ten-dollar purchase by a
person, cards usually win. For a one-cent purchase by a program, stablecoins
usually do.

## What this chapter established

- ACP (OpenAI and Stripe) handles checkout for a person shopping through an
  assistant.
- AP2 (Google) handles proof that a person authorized an agent's purchase.
- MPP (Stripe and Tempo) competes with x402 directly and adds cards.
- L402 (Lightning Labs) predates x402 and pays in Bitcoin over Lightning.
- The card networks' programs authenticate agents and tokenize cards.
- Most of these protocols divide the problem between them; direct
  competition is among x402, MPP and L402, and between stablecoins and cards.
