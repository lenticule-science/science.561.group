---
description: A crypto faucet is a website or app that gives visitors a small, unearned amount of a cryptocurrency, usually gated by a CAPTCHA or a timer rather than any task, to introduce them to holding and moving that currency.
identity: crypto-faucet
name: Crypto faucet
provenance:
  date-created: 2026-09-05
references:
  andresen2010faucet:
    authors:
      - Gavin Andresen
    title: The Bitcoin Faucet (launched June 2010, giving 5 BTC per visitor)
    year: 2010
---
A crypto faucet gives away a small amount of a cryptocurrency to any visitor who completes a low-effort anti-bot check, typically a CAPTCHA or a wait timer, with no task performed and nothing sold. The first documented faucet is Gavin Andresen's Bitcoin Faucet, launched in June 2010, which gave 5 BTC to any visitor who solved a CAPTCHA and distributed roughly 19,700 BTC before closing in 2012 [@andresen2010faucet]. A faucet's giveaway is funded by its operator (Andresen loaded the original faucet with his own coin) rather than by any advertiser or requester, which is what separates it from an attention-economy reward.

A crypto faucet is distinguished from an attention-economy surface (a ZBD poll, a Brave Rewards ad) by what funds the payout: a faucet's operator gives away value it already holds, usually to bootstrap adoption of a currency or a wallet, while an attention-economy surface pays out of revenue a third party (an advertiser, a data buyer) paid for the user's attention. A faucet is also distinguished from an airdrop by timing and mechanism: a faucet pays repeatedly, in small amounts, to any visitor who clears its anti-bot check; an airdrop is a one-time distribution to a defined population (token holders, an identified citizenry) with no per-visit check at all.

The engineering consequence is that a faucet's economics do not scale with a person's attention or labor the way a poll or an ad does: a faucet pays the same trivial amount regardless of how long a visitor stays, so a catalog of no-buy channels should record a faucet's payout as a one-time or rare event per person rather than a recurring rate, and should expect most faucets from any given era to eventually close once their operator's initial giveaway is exhausted.
