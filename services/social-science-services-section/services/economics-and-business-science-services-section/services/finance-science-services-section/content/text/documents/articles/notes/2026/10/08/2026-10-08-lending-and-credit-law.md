---
title: "Lending and Credit Law: Member Credit Lines, Mutual-Credit Clearing and Licenses"
description: "What Regulation Z, the Colorado Uniform Consumer Credit Code, the Colorado and Wyoming money transmitter statutes and the CDFI certification rule establish about whether a cooperative's member credit lines and mutual-credit clearing need a lending or money-transmission license, read from the texts on 2026-10-08"
date-created: 2026-10-08
aliases:
  - "member credit line licensing"
  - "mutual credit and money transmission"
keywords:
  - regulation-z
  - consumer-credit-code
  - money-transmitter-license
  - cdfi
  - mutual-credit
teaches:
  - "Member credit line licensing"
requires: [line-of-credit, tally-credit]
authors:
  - claude-sonnet-5-5
type: text
references:
  regz10263:
    authors:
      - Regulation Z Exemptions
    title: 12 CFR 1026.3, Regulation Z exempt transactions
    year: 2026
    url: https://www.law.cornell.edu/cfr/text/12/1026.3
  regz10262:
    authors:
      - Regulation Z Creditor
    title: 12 CFR 1026.2(a)(17), Regulation Z definition of creditor
    year: 2026
    url: https://www.law.cornell.edu/cfr/text/12/1026.2
  coloradouccc2024:
    authors:
      - Colorado UCCC
    title: C.R.S. 5-1-301 (definitions) and 5-2-301 (authority to make supervised loans), Colorado Uniform Consumer Credit Code
    year: 2024
    url: https://colorado.public.law/statutes/crs_5-2-301
  coloradomtl2024:
    authors:
      - Colorado Money Transmitters
    title: C.R.S. 11-110-103, 105 and 106, Colorado money transmitters
    year: 2024
    url: https://colorado.public.law/statutes/crs_11-110-103
  wyomingmta2026:
    authors:
      - Wyoming Money Transmitters Act
    title: Wyoming Money Transmitters Act, W.S. 40-22-101 et seq.
    year: 2026
    url: https://wyoleg.gov/statutes/compress/title40.pdf
  cdfi12cfr1805201:
    authors:
      - CDFI Certification Rule
    title: 12 CFR 1805.201, CDFI Program certification eligibility
    year: 2026
    url: https://www.law.cornell.edu/cfr/text/12/1805.201
---

## Federal consumer credit

Regulation Z does not apply to "an extension of credit primarily for a business, commercial or agricultural purpose" or "to other than a natural person" (Regulation Z Exemptions 2026, 12 CFR 1026.3(a)). Where it applies, it reaches a creditor, defined as a person "who regularly extends consumer credit that is subject to a finance charge or is payable by written agreement in more than four installments" and to whom the obligation is initially payable, and "regularly" means more than 25 extensions in the preceding calendar year (more than 5 if dwelling-secured) (Regulation Z Creditor 2026, 12 CFR 1026.2(a)(17)). A consumer credit line that carries no finance charge and is not payable in more than four installments is outside the creditor definition on its terms; a credit line to a member enterprise is outside Regulation Z as business credit; a line charged a finance charge, or repayable by installments, to natural persons for personal use, extended to more than 25 members in a year, is inside it. The Equal Credit Opportunity Act text, Regulation B, and CFPB actions of 2025 and 2026 were not read.

## State lending licenses

Colorado licenses the business of making "supervised loans", which are consumer loans, including revolving credit accounts, whose finance charge rate exceeds twelve percent per year (Colorado UCCC 2024, C.R.S. 5-1-301 and 5-2-301). A member line at or under twelve percent is not a supervised loan on that definition; the consumer-loan definition itself was not read, so whether a zero-rate member advance is a consumer loan is not established here. Other states' lending statutes were not read.

## Money transmission and mutual credit

Colorado defines money transmission as the sale or issuance of "exchange" or "engaging in the business of receiving money for transmission or transmitting money", where exchange is "any check, draft, money order, or other instrument for the transmission or payment of money or credit" and excludes the currency of any nation; a license is required, with exemptions for government, banks, savings and loan and credit unions, and telegraph companies (Colorado Money Transmitters 2024, C.R.S. 11-110-103, 105, 106). The statute read has no exemption for cooperatives or for virtual currency. Wyoming defines "monetary value" as "a medium of exchange whether or not redeemable in money" and money transmission as selling or issuing payment instruments or receiving money or monetary value for transmission, with a person offering services to Wyoming residents for personal, family or household use through the internet counted as engaged in the business, but states that the Act does not apply to "buying, selling, issuing, or taking custody of payment instruments in the form of virtual currency or receiving virtual currency for transmission", nor to a person that is not a money services business under 31 CFR 1010.100(ff) as of January 1, 2020 (Wyoming Money Transmitters Act 2026, W.S. 40-22-102, 103, 104). A mutual-credit unit that is a ledger entry among members and is redeemable only against other members' goods and services is a "medium of exchange" within the Wyoming definition; whether it is "virtual currency" depends on being a digital representation of value not recognized as legal tender, which an on-chain credit unit would be. California's Digital Financial Assets Law took effect for licensing on July 1, 2026 according to the search summaries read; its text and the DFPI FAQ returned 403 and were not read, and New York was not searched.

## The CDFI route

A CDFI must have "a primary mission of promoting community development", be an entity whose "predominant business activity is the provision, in arms-length transactions, of Financial Products and/or Financial Services", and serve a target market of investment areas or targeted populations; insured credit unions are deemed to meet the financing-entity test, other organizations are judged on financials and organizing documents (CDFI Certification Rule 2026, 12 CFR 1805.201(b)(1)-(3)). Eligibility items (4) through (6) and the award programs were not read; Native CDFI provisions were not read.

## What this gives a design

Colorado and Wyoming give a clear path for two choices. Member credit to enterprises is business credit outside Regulation Z. In Wyoming, an operator that only transmits virtual currency is outside the money transmitter statute by text; in Colorado, the statute read has no such exemption and the mutual-credit clearing leg, if it is an "instrument for the transmission or payment of money or credit" sold or issued, is inside the definition, so the Colorado design question is whether the pool issues and sells instruments or only records members' own transfers. Both outcomes depend on whether the pool receives and forwards member value or only executes members' own signed transactions; the four-factor test in FIN-2019-G001 is the federal statement of that line (see the custody note).
