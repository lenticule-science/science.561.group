---
title: "Stablecoin and Yield Law: What the GENIUS Act Allows by Construction"
description: "What the GENIUS Act text, the 2026 Treasury and OCC proposals, the Senate market-structure text and the SEC/CFTC 2026 interpretation establish about who may issue a payment stablecoin, who may pay yield on one, and where a non-issuer yield-routing cooperative stands, read from the statute and the Federal Register on 2026-10-08"
date-created: 2026-10-08
aliases:
  - "GENIUS Act and yield"
  - "payment stablecoin yield prohibition"
keywords:
  - genius-act
  - payment-stablecoin
  - stablecoin-yield
  - clarity-act
  - digital-asset-service-provider
teaches:
  - "GENIUS Act"
requires: [stablecoin, staking-yield]
authors:
  - claude-sonnet-5-5
type: text
references:
  geniusact2025:
    authors:
      - GENIUS Act
    title: Guiding and Establishing National Innovation for U.S. Stablecoins Act (GENIUS Act), Public Law 119-27, 139 Stat. 419
    year: 2025
    url: https://www.congress.gov/119/plaws/publ27/PLAW-119publ27.htm
  treasurysection32026:
    authors:
      - Treasury Section 3 NPRM
    title: GENIUS Act Regulations on Payment Stablecoin Issuance, Offer, and Sale (NPRM), 91 FR 53368
    year: 2026
    url: https://www.federalregister.gov/documents/2026/08/18/2026-16796/genius-act-regulations-on-payment-stablecoin-issuance-offer-and-sale
  frgeniusdocket2026:
    authors:
      - Federal Register GENIUS Docket
    title: Federal Register documents matching "GENIUS Act", newest first (API read 2026-10-08)
    year: 2026
    url: https://www.federalregister.gov/api/v1/documents.json?conditions[term]=%22GENIUS+Act%22&order=newest
  occgeniusnprm2026:
    authors:
      - OCC GENIUS NPRM
    title: Implementing the GENIUS Act for the Issuance of Stablecoins by Entities Subject to the Jurisdiction of the OCC (NPRM), 91 FR 10202
    year: 2026
    url: https://www.federalregister.gov/documents/2026/03/02/2026-04089/implementing-the-guiding-and-establishing-national-innovation-for-us-stablecoins-act-for-the
  clarityrs2026:
    authors:
      - CLARITY Senate Text
    title: H.R. 3633, Digital Asset Market Clarity Act of 2025, as reported to the Senate with an amendment in the nature of a substitute (Calendar No. 423), 2026-06-01
    year: 2026
    url: https://www.congress.gov/119/bills/hr3633/BILLS-119hr3633rs.htm
  senaterollcall2342026:
    authors:
      - Senate Roll Call
    title: U.S. Senate roll call vote 119th Congress 2nd session, vote 234, 15 Sep (H.R. 3633)
    year: 2026
    url: https://www.senate.gov/legislative/LIS/roll_call_lists/vote_menu_119_2.xml
  hr3633actions2026:
    authors:
      - Congress.gov HR3633 Actions
    title: H.R. 3633 actions, Congress.gov API (read 2026-10-08)
    year: 2026
    url: https://api.congress.gov/v3/bill/119/hr/3633/actions
  secstablecoin2026:
    authors:
      - SEC CFTC Interpretation
    title: Application of the Federal Securities Laws to Certain Types of Crypto Assets and Certain Transactions Involving Crypto Assets, 91 FR 13714 (Releases 33-11412; 34-105020)
    year: 2026
    url: https://www.federalregister.gov/documents/2026/03/23/2026-05635/application-of-the-federal-securities-laws-to-certain-types-of-crypto-assets-and-certain
---

## What the statute fixes

The GENIUS Act 2025 defines a payment stablecoin as a digital asset used or designed to be used as a means of payment or settlement whose issuer is obligated to redeem it for a fixed amount of monetary value and represents that it will hold a stable value (Section 2(22)). Only three kinds of person are permitted issuers: a subsidiary of an insured depository institution, a federal qualified issuer, or a state qualified issuer (Section 2(23)). Issuing a payment stablecoin in the United States without being one is unlawful (Section 3(a)), with a $1,000,000 fine and five years for knowing participation (Section 3(f)). The offer-and-sale prohibition on digital asset service providers starts three years after enactment, which the Treasury Section 3 NPRM 2026 dates as July 18, 2028 (Section 3(b)(1)). Section 2(24) lists a "cooperative organization" among the persons the Act reaches.

The Act takes effect on the earlier of January 18, 2027 or 120 days after the primary regulators issue any final implementing regulation (Section 20). The Federal Register GENIUS Docket 2026 read on 2026-10-08 contains proposals from the OCC, FDIC, NCUA, Treasury and the Federal Reserve and one Treasury interim final procedural rule on state certifications; it contains no final rule under Sections 3, 4 or 5. The effective date therefore resolves to January 18, 2027 unless a final rule lands before about September 20, 2026, which none did.

## The yield prohibition is an issuer prohibition

Section 4(a)(11) says no permitted payment stablecoin issuer or foreign payment stablecoin issuer shall pay the holder any form of interest or yield "solely in connection with the holding, use, or retention" of the stablecoin. It binds issuers. The Act does not define "yield" or "solely in connection with". The OCC GENIUS NPRM 2026 adds, in proposed 12 CFR 15.10(c)(4), a rebuttable presumption that an issuer pays prohibited yield when it has an arrangement with an affiliate or "related third party" that in turn pays yield to holders of that issuer's coin, where a related third party is a person offering yield "as a service" or a white-label principal; the OCC asks in Questions 37 and 38 whether the prohibition should be broader and which rewards it should cover. Nothing in the proposals read addresses a person who is neither the issuer nor the issuer's contractual counterparty and who receives yield that arises from lending a holder's own coin in an open protocol and passes it, by the holder's own signed transaction, to a cooperative.

## Who is a service provider, and the carve-outs

A digital asset service provider is a person that, for compensation or profit, exchanges, transfers or custodies digital assets or participates in issuance services, but the definition "does not include" a distributed ledger protocol, developing such protocols or self-custodial interfaces, an immutable and self-custodial software interface, validators, or "participating in a liquidity pool or other similar mechanism for the provisioning of liquidity for peer-to-peer transactions" (Section 2(7)(B)). Section 3(h)(1) exempts direct transfers between two individuals and transactions through a wallet that facilitates an individual's own custody. The Treasury Section 3 NPRM 2026 restates those exemptions nearly verbatim in proposed 12 CFR 1523.4(c), proposes that issuers for profit are also service providers, and proposes to define "issue" by the first transfer that gives a non-issuer the right to use, transfer or redeem the coin.

## The Senate text would extend a yield bar to service providers

The CLARITY Senate Text 2026, Section 404(c), would bar a "covered party" (a digital asset service provider and its affiliates) from paying a U.S. customer yield solely for holding payment stablecoins or in a manner "economically or functionally equivalent to the payment of interest or yield on an interest-bearing bank deposit", while allowing activity-based rewards including liquidity provision, posting collateral, governance, validation and staking, and allowing them to be calculated by balance, duration or tenure (Section 404(c)(2)-(3)). The bill failed cloture on the motion to proceed 49 to 50 on September 15, 2026 (Senate Roll Call 2026), and the Congress.gov HR3633 Actions 2026 record shows only a motion to reconsider after that. It is not law. If it returned in this form, who is a covered party would turn on the GENIUS Section 2(7)(B) carve-outs already in force.

## Securities status

The SEC CFTC Interpretation 2026 states that a permitted issuer's coin is excluded from "security" by statute after the effective date, that other stablecoins "may meet the definition of 'security' depending on the facts and circumstances", that the Commission interprets sales of "Covered Stablecoins" as not securities offers, and that staff statements have no legal force and are superseded. The release does not mention lending or yield-bearing vault tokens.

## Where the house documents stand

The economics specification's three claims hold against the text: no house-issued redeemable dollar token (Section 3(a)); the yield prohibition names issuers (Section 4(a)(11)); and the SEC position on yield-bearing stablecoins is open. Two additions follow from the primary sources. First, the prohibition is defined by redemption at a fixed amount plus a stable-value representation, so a tally or credit unit that its issuer does not promise to redeem at a fixed amount of money is outside the payment stablecoin definition by its terms. Second, the service-provider carve-out for liquidity-pool participation and for immutable self-custodial interfaces is a statutory basis the specification does not cite.
