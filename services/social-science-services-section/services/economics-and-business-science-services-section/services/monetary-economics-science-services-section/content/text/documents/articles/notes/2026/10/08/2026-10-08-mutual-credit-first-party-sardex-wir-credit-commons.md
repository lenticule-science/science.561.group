---
title: "Mutual Credit at Scale: Sardex, WIR, Credit Commons, HoloFuel and Unyt"
description: "What the first-party surfaces of Sardex, WIR, the Credit Commons protocol, Holo and Unyt establish about mutual credit: scale, limits, federated ledgers with balance-of-trade accounts, multilateral set-off, and what remains unlaunched"
date-created: 2026-10-08
aliases:
  - "mutual-credit-first-party"
  - "credit-commons-and-sardex"
keywords:
  - mutual-credit
  - sardex
  - wir
  - credit-commons
  - holofuel
  - unyt
  - clearing
teaches:
  - "Mutual Credit at Scale: Sardex, WIR, Credit Commons, HoloFuel and Unyt"
requires: []
authors:
  - claude-sonnet-5-5
type: text
references:
  sardexfirstparty2026:
    authors:
      - Sardex SpA
    title: "SardexPay site: 15-year news item (2025-06-21) and home page"
    year: 2026
    url: https://www.sardexpay.net/news/15-anni/
  laurasartori2016:
    authors:
      - Laura Sartori
      - P. Dini
    title: "From complementary currency to institution: A micro-macro study of the Sardex mutual credit system"
    year: 2016
    publication: London School of Economics and Political Science Research Online (London School of Economics and Political Science)
    publisher: London School of Economics and Political Science
    doi: 10.1425/84070
    url: https://doi.org/10.1425/84070
  wirfirstparty2026:
    authors:
      - WIR Bank
    title: WIR Bank 2025 annual report review page (gb.wir.ch)
    year: 2026
    url: https://gb.wir.ch/de/2025/rueckblick
  jamesstodder2009:
    authors:
      - James Stodder
    title: "Complementary credit networks and macroeconomic stability: Switzerland's Wirtschaftsring"
    year: 2009
    publication: Journal of Economic Behavior & Organization
    publisher: Elsevier BV
    doi: 10.1016/j.jebo.2009.06.002
    url: https://doi.org/10.1016/j.jebo.2009.06.002
  creditcommonsrepo2026:
    authors:
      - Credit Commons Docs
    title: "Credit Commons Microservices (gitlab.com/credit-commons-software-stack): fundamentals document and README"
    year: 2026
    url: https://gitlab.com/credit-commons-software-stack/credit-commons-microservices
  paolodini2026:
    authors:
      - Paolo Dini
      - Tomaž Fleischman
    title: Neutral Settlement Layer for Interoperability between Different Forms of Local Monetary and Financial Expression
    year: 2026
    publication: International Journal of Community Currency Research
    doi: 10.26034/zh.ijccr.2025.8310
    url: https://doi.org/10.26034/zh.ijccr.2025.8310
  holodocs2026:
    authors:
      - Holo Hosting
    title: "Holo Hosting: Pricing and currency page"
    year: 2026
    url: https://holo.host/resources/currency/
  unytdocs2026:
    authors:
      - Unyt
    title: "Unyt site: how it works, roadmap, FAQ"
    year: 2026
    url: https://unyt.co/roadmap/
---
Mutual credit is the older and larger cousin of every on-chain credit scheme: accounts that trade within limits straddling zero, no asset entering or leaving the ledger, the sum of all balances equal to zero. The on-chain projects mostly reinvent it; this note reads what the operating systems and the protocol authors themselves say.

## Sardex: scale from the company

Sardex SpA states, for 2025-06-20, fifteen years of operation, 10,000 firms, more than one billion credits transacted and a network across 15 Italian regions; it describes its offer as "credito senza il peso degli interessi", credit without interest, to be repaid by selling to other members ([Sardex SpA 2026](https://www.sardexpay.net/news/15-anni/)). The company is a joint-stock company with paid-in capital of 187,862 EUR, and its pages list a governance page and a code of ethics. Annual turnover by year and the credit-limit rules were not on the pages read, and the English site returned 404.

The academic account is an interview study of circuit members and founders: trust was and remains fundamental to creating and operating the mutual credit system, and Sardex became a mediator of exchanges and an institution at regional level ([Sartori & Dini 2016](https://doi.org/10.1425/84070)). The mechanism that makes it work is a human broker network, not code: the company onboards, vets and sets limits.

## WIR

The WIR bank's review page for its 2025 financial year describes mortgages, deposits, private customers and the VIAC pension fintech in words and carries no WIR-franc turnover or participant figure ([WIR Bank 2026](https://gb.wir.ch/de/2025/rueckblick)); the sibling figures page returned 404 and the PDF annual report was not opened. The classic study treats WIR as a complementary credit network and its relation to macroeconomic stability ([Stodder 2009](https://doi.org/10.1016/j.jebo.2009.06.002)); neither register held its abstract, so only the bibliographic record was read. Scale figures for WIR are therefore not stated here.

## Credit Commons: federation by tree and balance of trade

The Credit Commons protocol is a ledger API plus a topology. Nodes are web services with accounts; nodes connect in a tree with no peer links, each node has at most one rootwards account, and that account is the Balance-of-Trade account, which members of a branch commit to bring back toward zero in the long run. A payment crossing nodes is recorded on every intermediate node as a transfer between two of that node's own accounts, and the parents store no trader names ([Credit Commons Docs 2026](https://gitlab.com/credit-commons-software-stack/credit-commons-microservices)). Limits straddle zero (for example plus or minus 100); a transaction is valid only if the payee ends below the maximum and the payer above the minimum, and the limits are set by governance or negotiation. Integrity between nodes is a hash chain over each transaction's id, version and entries. Each branch node has a conversion rate to its parent, so units are local.

The repository's last commit in the clone is 2021-02-22, the "what we need" section is empty, and its author's own blog says development will have to come from government, philanthropy, users or volunteers. No deployed network or user count was found. It is a specification and a reference implementation, not a running economy.

A 2026 paper proposes the layer such a tree needs: multilateral set-off of mutual debts between non-convertible currencies, simulated on a dataset of more than 40,000 companies, where up to 95 percent of net internal debt is settled inside communities and the rest in outside money ([Dini & Fleischman 2026](https://doi.org/10.26034/zh.ijccr.2025.8310)). That is a simulation result, not a deployment.

## HoloFuel and Unyt

Holo states that HoloFuel, designed as the mutual-credit utility currency for accounting inside the hosting network, "has not launched"; hosting is priced in national currencies, HOT was a 2018 pre-sale voucher, and Holo Limited does not offer token exchange or redemption ([Holo Hosting 2026](https://holo.host/resources/currency/)). Unyt says its engine was built to power HoloFuel and now offers configurable currencies (including mutual credit with credit limits, fees and membership requirements), smart agreements, atomic multi-currency trades and EVM token bridging, running on participants' devices on Holochain; its roadmap dates Unyt and the Circulo community mutual-credit currency to 2025-09 and bridging to 2026-01 and 2026-02 ([Unyt 2026](https://unyt.co/roadmap/)). Source code and usage figures for Unyt were not read. The Holochain search of the scholarly register returned no study of HoloFuel or mutual credit.

## What this tells a pooled-credit design

Every system that is running (Sardex) has an organisation setting limits; every system that is only a protocol (Credit Commons) is unrun; the system that planned a currency for a network (HoloFuel) has not launched it eight years after its pre-sale. The recurring design objects are the limit pair around zero, the balance-of-trade account that makes a group's net position visible, and set-off between ledgers.
