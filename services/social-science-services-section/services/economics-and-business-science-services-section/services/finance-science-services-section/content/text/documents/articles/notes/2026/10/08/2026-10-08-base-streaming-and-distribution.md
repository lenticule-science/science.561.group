---
title: "Base Streaming and Distribution"
description: "Superfluid CFA and GDA, Sablier Lockup and Flow, Allo v2 and Yearn TokenizedStrategy on Base: addresses, TVL, upgrade model and audit links"
date-created: 2026-10-08
aliases:
  - "base-streaming-and-distribution"
keywords:
  - superfluid
  - sablier
  - streaming
  - base
teaches:
  - "Base Streaming and Distribution"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  superfluidcontracts2026:
    authors:
      - Superfluid Contracts
    title: Superfluid host, CFA, GDA and Super USDC on Base and Gnosis
    year: 2026
    url: https://github.com/superfluid-org/protocol-monorepo/blob/dev/packages/metadata/networks.json
  sabliercontracts2026:
    authors:
      - Sablier Contracts
    title: Sablier Lockup v4.0 and Flow v3.0 on Base
    year: 2026
    url: https://docs.sablier.com/guides/lockup/deployments
  allocontracts2026:
    authors:
      - Allo Contracts
    title: Allo v2 on Base
    year: 2026
    url: https://github.com/allo-protocol/allo-v2
  yearntokenized2026:
    authors:
      - Yearn Tokenized Strategy
    title: Yearn v3 TokenizedStrategy on Base
    year: 2026
    url: https://github.com/yearn/tokenized-strategy
---

This note states what first-party reads on 2026-10-08 establish about the Base primitives that move money over time or among many recipients: Superfluid, Sablier, Allo v2 and Yearn's TokenizedStrategy.

## Superfluid

Superfluid Contracts 2026 gives the Base deployment: a host that registers two agreements, the constant flow agreement (CFA) for one-to-one per-second streams and the general distribution agreement (GDA) for pool-based pro-rata distribution. The host asked for the CFA hash returned the CFA address and for the GDA hash returned the GDA address. All three are upgradeable UUPS proxies. Super USDC (USDCx) wraps Circle USDC and carries 216,478.53 units on Base. Superfluid's Base TVL on DeFiLlama is $1.25M on this date, so the rails exist but carry little money. The audit directory lists reports from PeckShield, Halborn and Trail of Bits, and two 2026 audits (a collaborative audit in January and a public contest in May). The distribution pool concept (GDA) is the primitive that splits a stream among pool members by units, which is the shape of paying yield to members pro rata.

## Sablier

Sablier Contracts 2026 gives SablierLockup v4.0 (fixed-schedule vesting streams as NFTs; 1,227 streams created) and SablierFlow v3.0 (open-ended, rate-based streams with a debt accounting; 5 streams created). Both are verified and not proxies. Sablier's Base TVL is $5,522 in Lockup and $39,857 in Flow. No audit files appear in the cloned repositories and the admin address could not be read, so neither is claimed.

## Allo v2 and Yearn

Allo Contracts 2026 finds an Allo proxy on Base whose registry and owner can be read, with no verified source on Sourcify and no audit link found. Yearn Tokenized Strategy 2026 finds the Yearn v3 TokenizedStrategy singleton verified on Base, audited by yAcademy, Statemind and ChainSecurity. A strategy built on it is an ERC-4626 vault whose accounting lives in that one verified contract; a strategy author writes only the deposit, free and report hooks.

## Not found

Octant v2 addresses (search row empty), the Superfluid SUP token, Sablier audit reports, and the Superfluid and Sablier admin owners were not read.
