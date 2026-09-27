# Payment Required

## A code with no job

Every time a browser asks a web server for something, the server answers with
a three-digit number before anything else. The number says how the request
went. 200 means "here it is". 404 means "there is nothing here". 500 means
"something broke on my side". Most people have seen 404; few have seen the
others, because browsers handle them quietly.

These numbers are part of HTTP, the Hypertext Transfer Protocol, the set of
rules every web browser and web server follows. HTTP groups its codes by
their first digit. Codes in the 400s mean the request itself was the problem:
the client asked for something it may not have, or asked in the wrong way.
401 means "you need to sign in". 403 means "you may not have this". And 402
means "Payment Required".

For almost the whole history of the web, 402 did nothing. The formal
specification of HTTP/1.1, published by the Internet Engineering Task Force
(IETF) in January 1997, gave it one sentence: "This code is reserved for
future use" [@rfc2068]. Every revision since has kept that sentence. The
current specification, RFC 9110 from June 2022, still says "The 402 (Payment
Required) status code is reserved for future use" [@rfc9110].

Reserved codes are not unusual. Protocol designers leave room for things they
expect to need. What is unusual about 402 is how specific the reservation was.
The designers did not reserve a code for some unknown future purpose. They
named the purpose, payment, and then waited a quarter of a century for a way
to carry it out.

## What the first web had in mind

The idea is older than the 1997 specification. In the early 1990s, the team
at CERN that built the first web software kept a short list of status codes
and what each meant. Its entry for 402 reads: "The parameter to this message
gives a specification of charging schemes acceptable. The client may retry the
request with a suitable ChargeTo header" [@w3c-status-codes].

That sentence describes almost exactly how x402 works today. The server says
how it will accept payment. The client pays and asks again, carrying proof in
a header, which is a labeled line of extra information attached to a request.
The difference is that in the early 1990s there was no ChargeTo header, no
agreed way to fill one in, and nothing on the other end to settle the charge.
The web's designers knew what they wanted. They did not have the money.

## Why charging small amounts failed

Through the late 1990s and early 2000s, companies and researchers tried to
build what they called micropayments: charges of a few cents or less, made
with a click, for a page, an article or a song.

Digital-cash systems such as DigiCash issued electronic tokens a user could
spend. Millicent, from Digital Equipment Corporation, was designed for charges
of a fraction of a cent. A W3C working group drafted a standard way for web
pages to show a price. Newspapers, music services and payment startups tried
variations for another decade.

None of them lasted. The usual explanation is cost, and it is part of the
story. Card networks charge a fixed fee per transaction plus a percentage, so
a ten-cent charge can cost more to process than it earns. Accounts had to be
opened and funded. Fraud had to be handled. Every one of those costs fell on
each payment, however small.

Two essays from the period argued that cost was not the deepest problem. Nick
Szabo, a computer scientist, wrote in 1999 that the real obstacle was what he
called mental transaction costs [@szabo1999]. Deciding whether an article is
worth three cents takes a moment of attention, and that moment is worth more
than three cents to most people. Clay Shirky, a writer on internet culture,
made the argument bluntly in 2000 in "The Case Against Micropayments"
[@shirky2000]. People dislike making many small, unpredictable decisions about
money. Any charge big enough to matter to the seller is big enough to make the
buyer stop and think. People prefer a flat price they decide on once.

The market agreed with Szabo and Shirky. The web's economy settled on three
ways of paying for things that avoid small decisions:

- **advertising**, where the reader pays with attention and the advertiser
  pays the publisher;
- **subscriptions**, where the reader decides once a month or once a year;
- **bundles**, where one price covers many things.

402 stayed reserved.

## What changed

Two things changed in the 2020s, and x402 depends on both.

The first is the money. A stablecoin is a digital token that its issuer
promises to redeem for a fixed amount of an ordinary currency, usually one US
dollar. Stablecoins live on blockchains, shared public ledgers that record
every transfer. On some blockchains a transfer now costs a fraction of a cent
and completes in seconds. That removes the fixed per-payment cost that sank
the card-based micropayment schemes. Chapter 3 explains how.

The second change is the buyer. Szabo's and Shirky's arguments are about
people. They say nothing about a computer program that has been given a
budget and a task. A program does not feel the moment of doubt before spending
three cents. It checks the price against its rules and pays or does not. When
the buyer is software, the mental transaction cost the micropayment skeptics
identified drops away, because there is no mind to spend it.

Software that acts on a person's behalf, choosing steps and calling services
to reach a goal, is now usually called an AI agent. Agents built on large
language models became common in 2024 and 2025. They search, read, write code
and call other programs' interfaces. Many of those interfaces are sold by
subscription with a human sign-up flow, which an agent cannot easily complete.
An agent that meets a paywall mid-task has, until recently, had to stop and
ask its person for help.

x402 is an attempt to let it pay instead.

## Not the first attempt

x402 is not the first protocol to give 402 a job. In 2020 Lightning Labs, a
company that builds software for Bitcoin's Lightning Network, published a
scheme it first called LSAT and later renamed L402 [@lsat2020; @l402spec]. A
server using L402 answers a request with 402 and a Lightning invoice. The
client pays the invoice and retries with proof of payment and a credential
the server can check. L402 uses Bitcoin rather than dollar stablecoins, and it
has a committed community of users. Chapter 5 compares it with x402.

What set x402 apart when it appeared in May 2025 was its backing and its
money. It came from Coinbase, one of the largest US cryptocurrency companies.
It settled in USDC, a dollar stablecoin. Within a year it had the support of
the major card networks, the largest cloud providers and a Linux Foundation
body to govern it. Chapter 4 tells that part of the story.

## What this chapter established

- HTTP 402, "Payment Required", has existed since the 1990s, and every
  specification since 1997 has left it "reserved for future use".
- The web's first designers imagined a client paying and retrying with proof;
  there was no money to make that work.
- 1990s micropayment schemes failed on per-payment costs and, more deeply, on
  the attention a person must spend to decide on each small payment.
- Cheap stablecoin transfers remove the first obstacle. Software buyers remove
  the second.
