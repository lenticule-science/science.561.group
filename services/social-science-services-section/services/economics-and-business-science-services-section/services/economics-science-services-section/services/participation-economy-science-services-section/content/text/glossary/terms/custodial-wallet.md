---
description: A custodial wallet is a crypto account whose private keys are held by a third-party operator rather than by the account holder, so the operator, not the holder, has technical control over the funds.
identity: custodial-wallet
name: Custodial wallet
date-created: 2026-09-05
---
A custodial wallet is a crypto account in which the operating platform holds the private keys, not the account holder. The holder sees a balance and can request transfers or withdrawals, but the operator is the party that can actually sign a transaction moving the funds; ZBD's own wallet is a documented example, described in the founder's own seed post for this program as a custodial wallet appropriate as a beginner's starting point, with the stated aim of eventually transitioning to self-custody once there is anything to hold (source: the founder's Hive post, 2026-09-05 seed for this program).

A custodial wallet is distinguished from a non-custodial (self-custody) wallet by where the private keys live: a non-custodial wallet's keys are generated and held only on the user's own device, so the user, not any operator, is the sole party who can sign a transaction, and no operator can freeze, reverse, or lose the funds on the user's behalf. A custodial wallet is not distinguished from a bank account by much: like a bank, the operator can restrict withdrawals, require identity verification before releasing funds, or become insolvent, and the holder's claim is a claim against the operator, not a cryptographic fact the holder alone controls.

The engineering consequence is that a custodial wallet's identity requirement is usually tied to its withdrawal or cash-out step rather than its signup step: a person may be able to earn and accumulate a balance with only an email address, but the operator commonly requires stronger identity (a phone number, a government ID) before releasing funds, so a no-buy catalog must record identity requirements separately for earning versus withdrawing on any custodial surface.
