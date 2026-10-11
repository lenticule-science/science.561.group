---
title: "DeFi Developer and Custody Law: When a Non-Custodial Pool Is Not a Money Transmitter"
description: "What FinCEN guidance and its October 2026 withdrawal, the money-transmitting statutes, the GENIUS Act, the Senate market-structure text, Van Loon, the April 2025 DOJ memo, OFAC guidance and the SEC/CFTC 2026 interpretation establish about developers and operators of non-custodial smart-contract pools, read from the texts on 2026-10-08"
date-created: 2026-10-08
aliases:
  - "non-custodial money transmission"
  - "Van Loon and Tornado Cash"
keywords:
  - fincen
  - money-transmission
  - section-1960
  - van-loon
  - tornado-cash
  - non-controlling-developer
  - ofac
teaches:
  - "Money transmission"
  - "Non-controlling developer"
requires: [stablecoin]
authors:
  - claude-sonnet-5-5
type: text
references:
  fincenguidance2019:
    authors:
      - FinCEN CVC Guidance
    title: Application of FinCEN's Regulations to Certain Business Models Involving Convertible Virtual Currencies, FIN-2019-G001
    year: 2019
    url: https://www.fincen.gov/sites/default/files/2019-05/FinCEN%20Guidance%20CVC%20FINAL%20508.pdf
  cfr1010100:
    authors:
      - FinCEN Money Transmitter Rule
    title: 31 CFR 1010.100(ff)(5), Money transmitter
    year: 2026
    url: https://www.law.cornell.edu/cfr/text/31/1010.100
  fincenwithdrawal2026:
    authors:
      - FinCEN Unhosted Wallet Withdrawal
    title: Requirements for Certain Transactions Involving Convertible Virtual Currency or Digital Assets; Withdrawal of Notice of Proposed Rulemaking, 91 FR 63514
    year: 2026
    url: https://www.federalregister.gov/documents/2026/10/06/2026-20430
  usc1960:
    authors:
      - Unlicensed Money Transmitting Statute
    title: 18 U.S.C. 1960, Prohibition of unlicensed money transmitting businesses
    year: 2006
    url: https://www.law.cornell.edu/uscode/text/18/1960
  blanche2025:
    authors:
      - Blanche Memo
    title: "Memorandum for All Department Employees: Ending Regulation By Prosecution (Deputy Attorney General, April 7, 2025)"
    year: 2025
    url: https://www.justice.gov/dag/media/1395781/dl
  geniusact2025:
    authors:
      - GENIUS Act
    title: Guiding and Establishing National Innovation for U.S. Stablecoins Act (GENIUS Act), Public Law 119-27, 139 Stat. 419
    year: 2025
    url: https://www.congress.gov/119/plaws/publ27/PLAW-119publ27.htm
  clarityrs2026:
    authors:
      - CLARITY Senate Text
    title: H.R. 3633, Digital Asset Market Clarity Act of 2025, as reported to the Senate with an amendment in the nature of a substitute (Calendar No. 423), 2026-06-01
    year: 2026
    url: https://www.congress.gov/119/bills/hr3633/BILLS-119hr3633rs.htm
  vanloon2024:
    authors:
      - Van Loon Opinion
    title: Van Loon v. Department of the Treasury, 122 F.4th 549 (5th Cir. 2024), No. 23-50669
    year: 2024
    publication: Fifth Circuit
    url: https://www.ca5.uscourts.gov/opinions/pub/23/23-50669-CV0.pdf
  treasurytornado2025:
    authors:
      - Treasury Delisting
    title: Tornado Cash Delisting (Treasury press release, March 21, 2025)
    year: 2025
    url: https://home.treasury.gov/news/press-releases/sb0057
  ofacguidance2021:
    authors:
      - OFAC Virtual Currency Guidance
    title: Sanctions Compliance Guidance for the Virtual Currency Industry (OFAC, October 2021)
    year: 2021
    url: https://ofac.treasury.gov/media/913571/download
  secstaking2026:
    authors:
      - SEC CFTC Interpretation
    title: Application of the Federal Securities Laws to Certain Types of Crypto Assets and Certain Transactions Involving Crypto Assets, 91 FR 13714
    year: 2026
    url: https://www.federalregister.gov/documents/2026/03/23/2026-05635/application-of-the-federal-securities-laws-to-certain-types-of-crypto-assets-and-certain
---

## The four-factor test and what it leaves open

FinCEN CVC Guidance 2019 (FIN-2019-G001) says the treatment of an intermediary "depends on four criteria: (a) who owns the value; (b) where the value is stored; (c) whether the owner interacts directly with the payment system where the CVC runs; and, (d) whether the person acting as intermediary has total independent control over the value." A user of an unhosted single-signature wallet transacting on the user's own behalf is not a money transmitter. A multiple-signature provider that only adds a validating key, without total independent control, is not one; adding hosted-wallet service, or holding value as entries in the provider's accounts, makes it one "regardless of the label." Section 4.4 applies the kiosk interpretation to DApps that accept and transmit value, naming the DApp, its owners or operators, or both. The guidance does not address pooling or yield routing. The regulation, 31 CFR 1010.100 (FinCEN Money Transmitter Rule 2026), excludes a person that accepts and transmits funds "only integral to the sale of goods or the provision of services, other than money transmission services" (limitation F), and defines money transmitter on facts and circumstances.

On October 6, 2026 FinCEN withdrew its 2020 proposal to impose reporting and recordkeeping on bank and money-services-business transactions with unhosted wallets, citing the President's Working Group report, and said it will take no further action (FinCEN Unhosted Wallet Withdrawal 2026). No new FinCEN interpretive guidance replacing FIN-2019-G001 was found.

## Criminal exposure under section 1960

The statute at section 1960 of title 18 (Unlicensed Money Transmitting Statute 2006) criminalizes operating an unlicensed money transmitting business on three alternative theories: unlicensed in a state where that is a crime ("whether or not the defendant knew"), failure to register under section 5330 of title 31, or knowing transmission of criminal proceeds or funds meant to support unlawful activity; "money transmitting" includes "transferring funds on behalf of the public by any and all means". The Blanche Memo 2025 (April 7, 2025) directs prosecutors not to charge unlicensed money transmitting under (b)(1)(A) and (B), Bank Secrecy Act, or registration violations "unless there is evidence that the defendant knew of the licensing or registration requirement at issue and violated such a requirement willfully," says DOJ will no longer target exchanges, mixers and offline wallets "for the acts of their end users or unwitting violations of regulations," and carves out (b)(1)(C) in footnote 2. The memo creates no enforceable rights. The Roman Storm prosecution is the live test: the verdict of 2025-08-06 was reported as guilt on one count of conspiracy to operate an unlicensed money transmitting business with the jury hung on two counts, retrial reset to April 26, 2027 pending a Rule 29 motion; those facts were read only from press reports and a press-release snippet, not the docket (see the record's search rows).

## Statutory safe harbors: enacted and proposed

Enacted: the GENIUS Act 2025, Section 2(7)(B), takes protocol developers, self-custodial interface developers, validators and liquidity-pool participants out of the digital asset service provider definition, and Section 3(h)(1)(C) exempts own-custody wallet transactions. Proposed and not law: the CLARITY Senate Text 2026, Section 604, would provide that a "non-controlling developer or provider" is not a money transmitting business under section 5330 of title 31 or engaged in money transmitting under section 1960 solely for creating software, providing own-custody tools or infrastructure, where non-controlling means lacking "the legal right or the unilateral and independent ability to control, initiate upon demand, or effectuate transactions involving digital assets to which users are entitled, without the approval, consent, or direction of any third party"; Section 604(d) preserves (b)(1)(C) and Section 604(e) leaves other money-transmitter classification open. Section 309 would exempt developing or distributing a decentralized finance trading protocol and participating in a liquidity pool from the Exchange Act; Section 601 defines such a protocol as automated, non-discretionary and not reliant on a person other than the user for custody, and loses that status if a person or group can materially alter it or censor use. The bill failed cloture 49 to 50 on September 15, 2026.

## Immutable contracts and sanctions

Van Loon Opinion 2024 holds that "Tornado Cash's immutable smart contracts ... are not the 'property' of a foreign national or entity, meaning (1) they cannot be blocked under IEEPA, and (2) OFAC overstepped its congressionally defined authority," because they are "not capable of being owned": no one can remove or update them and no one can exclude anyone from using them. The court contrasts mutable contracts that developers can disconnect or replace. It does not decide section 1960, the Bank Secrecy Act or criminal liability. Treasury Delisting 2025 records that Treasury removed Tornado Cash from the SDN list on March 21, 2025 after reviewing "novel legal and policy issues raised by use of financial sanctions." OFAC Virtual Currency Guidance 2021 states that civil penalties are generally strict liability, with a risk-based compliance program a mitigating factor; it does not address immutable contracts. A U.S. person who is an operator of a mutable contract or an interface keeps its sanctions-screening duty.

## Staking, receipts and digital tools

The SEC CFTC Interpretation 2026 interprets protocol staking, including liquid staking, and a staking receipt token that receipts a non-security asset not subject to an investment contract, as not securities offers; it states that use of a receipt token for further returns "is outside the scope of this release". It describes a digital tool such as a membership as having no passive yield or rights to future income. Lending and vault deposits are not discussed.

## What this gives a design

A pool whose contracts hold value that members' own signed transactions deposit and withdraw, with no operator ability to move member funds, is on the favored side of every factor in FinCEN CVC Guidance 2019 and fits the non-controlling definitions in the proposed texts. Immutability matters twice: it is the fact pattern of Van Loon Opinion 2024, and Wyoming's DAO LLC statute requires the opposite (see the cooperative-entity note). Admin keys, upgrade proxies, pausers and operator-controlled routing are the facts that restore control and ownership.
