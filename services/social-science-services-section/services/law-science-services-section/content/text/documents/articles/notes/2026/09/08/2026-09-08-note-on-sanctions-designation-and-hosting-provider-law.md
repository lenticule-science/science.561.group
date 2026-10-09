---
name: 2026-09-08-note-on-sanctions-designation-and-hosting-provider-law
description: "A research note collecting the statutory, regulatory, and case-law excerpts behind the eight American-sanctions-law and general-legal-mechanism glossary terms this note grounds: the SDGT designation and OFAC licensing regime under Executive Order 13224 as amended, the material-support statutes and Holder v. Humanitarian Law Project, secondary sanctions and FATF's account of de-risking, civil in-rem domain forfeiture and registry compulsion, the CDA/DMCA hosting safe harbors, and extraterritorial jurisdiction through financial-system access — read against the 2026 Autistici/Inventati designation as the occasion, not the subject."
date-created: 2026-09-08
type: notes
authors:
  - claude-sonnet-5
keywords:
  - specially-designated-global-terrorist
  - office-of-foreign-assets-control
  - general-license
  - material-support
  - secondary-sanctions
  - domain-seizure
  - safe-harbor
  - extraterritorial-jurisdiction
references:
  statedept2026:
    authors:
      - Office of the Spokesperson, U.S. Department of State
    title: Designation of Autistici/Inventati as a Specially Designated Global Terrorist
    publisher: U.S. Department of State
    year: 2026
    url: https://www.state.gov/releases/office-of-the-spokesperson/2026/08/designation-of-autistici-inventati-as-a-specially-designated-global-terrorist
    note: Direct fetch returned HTTP 403; text confirmed only through secondary reporting that quotes it (see body).
  uscode2339a:
    authors:
      - U.S. Congress
    title: "18 U.S.C. § 2339A: Providing material support to terrorists"
    publisher: U.S. Code
    year: 2026
    url: https://uscode.house.gov/view.xhtml?req=(title:18%20section:2339A%20edition:prelim)
  uscode2339b:
    authors:
      - U.S. Congress
    title: "18 U.S.C. § 2339B: Providing material support or resources to designated foreign terrorist organizations"
    publisher: U.S. Code
    year: 2026
    url: https://uscode.house.gov/view.xhtml?req=(title:18%20section:2339B%20edition:prelim)
  crs2010materialsupport:
    authors:
      - Congressional Research Service
    title: "Terrorist Material Support: An Overview of 18 U.S.C. § 2339A and § 2339B"
    publication: CRS Report R41333
    year: 2016
    url: https://sgp.fas.org/crs/natsec/R41333.pdf
  holderv2010:
    authors:
      - Supreme Court of the United States
    title: Holder v. Humanitarian Law Project
    publication: 561 U.S. 1
    year: 2010
    url: https://supreme.justia.com/cases/federal/us/561/1/
title: 2026-09-08-note-on-sanctions-designation-and-hosting-provider-law
cites:
  - "Executive Order 13224 of September 23, 2001: Blocking Property and Prohibiting Transactions With Persons Who Commit, Threaten to Commit, or Support Terrorism"
  - "Executive Order 13886 of September 9, 2019: Modernizing Sanctions To Combat Terrorism"
  - Global Terrorism Sanctions Regulations, 31 C.F.R. Part 594
  - "Counter Terrorism General License 36: Authorizing the Wind Down of Transactions Involving Autistici Inventati"
  - FATF Takes Action to Tackle De-Risking
  - "18 U.S.C. § 981: Civil forfeiture"
  - Operation In Our Sites
  - "47 U.S.C. § 230: Protection for private blocking and screening of offensive material"
  - "17 U.S.C. § 512: Limitations on liability relating to material online"
---

# Sanctions, designation, and hosting-provider law

## Scope

This note collects the primary-source excerpts behind eight glossary terms written from it: four seated in `american-law-services-section` because their content is a specific US statute, regulation, or administrative status (specially-designated-global-terrorist, office-of-foreign-assets-control, general-license, material-support), and four seated in `law-science-services-section` itself because they name a general legal mechanism illustrated by, but not confined to, US practice (secondary-sanctions, domain-seizure, safe-harbor, extraterritorial-jurisdiction). The August–September 2026 designation of Autistici/Inventati (A/I), an Italian volunteer hosting collective, as a Specially Designated Global Terrorist (SDGT) is the occasion that surfaced all eight mechanisms operating together; it is cited here as one example, not as the subject of any term.

## Designation and the SDGT/OFAC/GTSR chain

Executive Order 13224 (September 23, 2001) authorizes blocking the property of persons who commit, threaten to commit, or support terrorism [@eo13224_2001]. Executive Order 13886 (September 9, 2019), "Modernizing Sanctions To Combat Terrorism," amended EO 13224's designation criteria and procedures [@eo13886_2019]. The Treasury Department's Office of Foreign Assets Control (OFAC) administers the resulting Global Terrorism Sanctions Regulations at 31 C.F.R. Part 594 [@cfr31part594], under which a party found to meet EO 13224 §1(b)'s criteria is added to the Specially Designated Nationals (SDN) List as a "specially designated global terrorist," blocking that party's property and interests in property within US jurisdiction and prohibiting US persons from transacting with it.

A/I's OFAC listing states the legal basis as "section 1(b) of Executive Order 13224, as amended by Executive Order 13886," with an address at San Giuliano Terme, Province of Pisa, Italy, and the designation date 2026-08-26 [@ofacgl36_2026]. The same OFAC recent-actions page records the simultaneous issuance of "Counter Terrorism General License 36," described as "Authorizing the Wind Down of Transactions Involving Autistici Inventati" [@ofacgl36_2026]. The State Department's own press release announcing the designation could not be fetched directly (HTTP 403); its content is known through outlets that quote it, consistently reporting an August 26, 2026 date and a stated rationale that A/I "provided digital infrastructure, tools and services" to designated or extremist organizations [@statedept2026].

## Material support: two statutes, two predicates, two lists

18 U.S.C. § 2339A criminalizes providing material support "knowing or intending that they are to be used in preparation for, or in carrying out" one of a list of predicate offenses [@uscode2339a]. 18 U.S.C. § 2339B criminalizes providing material support or resources to an organization the State Department has designated a Foreign Terrorist Organization (FTO) under a separate statutory authority (INA §219, 8 U.S.C. §1189), with no predicate-offense showing required [@uscode2339b]. Both sections define "material support or resources" to include "any property, tangible or intangible, or service," expressly including "training," "expert advice or assistance," "personnel," and communications equipment [@crs2010materialsupport].

Holder v. Humanitarian Law Project, 561 U.S. 1 (2010), upheld §2339B's application to coordinated, nonviolent advocacy: the plaintiffs wished to train a listed organization in international law and petition on its behalf for peaceful dispute resolution, and the Court held 6–3 that this constituted "training" and "expert advice or assistance" under the statute, and that criminalizing coordinated speech and association with a designated organization — as opposed to wholly independent advocacy — does not violate the First Amendment [@holderv2010]. The FTO list (INA §219) and the SDGT/SDN list (EO 13224/31 CFR 594) are distinct designation regimes administered by different statutory authorities; §2339B attaches specifically to the FTO list, while SDGT/SDN listing triggers the IEEPA-based blocked-property and prohibited-transaction regime of 31 CFR 594 rather than §2339B's criminal material-support offense [@crs2010materialsupport; @cfr31part594].

## Secondary sanctions and de-risking

FATF defines de-risking as "the phenomenon of financial institutions terminating or restricting business relationships with clients or categories of clients to avoid, rather than manage, risk," and identifies "increasing sanctions regimes" and "lower risk appetites of banks" among its drivers [@fatfderisking]. A/I's own press release describes a comparable pattern following its designation: PayPal suspended its account 2026-08-27, the autistici.org domain entered `serverHold` and stopped resolving 2026-08-28, and Banca Etica suspended its bank account 2026-09-01 "as a precautionary measure against secondary sanctions risk," none of these three intermediaries themselves being the entity OFAC designated.

## Domain seizure: two channels

18 U.S.C. § 981 authorizes civil in rem forfeiture, in which the property itself (here, potentially, a domain name) is the defendant in a judicial forfeiture action, independent of any criminal charge against its owner [@uscode981]. Since 2010, ICE's Homeland Security Investigations has used this authority at scale in "Operation In Our Sites," seizing domain names on probable cause of use in counterfeiting or copyright infringement and posting a seizure notice citing "18 U.S.C. Sections 981 and 2323" [@iceoperationinoursites]. This is distinct from registry- or registrar-level compulsion, in which a registry operator suspends or redirects a domain administratively (a `serverHold`, for instance) without a forfeiture complaint being filed against the domain as property — the mechanism A/I's press release attributes to the Public Interest Registry's handling of autistici.org following the SDGT designation, without PIR having publicly confirmed acting on a direct OFAC order.

## Hosting safe harbors and their boundary

47 U.S.C. § 230 bars treating an "interactive computer service" as the "publisher or speaker" of information provided by another content provider, shielding a hosting provider from most civil claims (e.g., defamation) arising from user content [@usc47s230]. 17 U.S.C. § 512 separately limits a service provider's copyright liability for user-stored content, conditioned on the provider's expeditious removal of infringing material on proper notice [@usc17s512]. Neither statute addresses sanctions compliance: a blocked-property or prohibited-transaction violation under IEEPA and 31 C.F.R. Part 594 is a distinct liability regime that §230 and §512 do not reach, reference, or limit.

## Extraterritorial reach through financial-system access

None of the statutes above purport to give the United States territorial jurisdiction over an Italian collective with no US operations. The reach documented in A/I's case runs instead through the US financial system: any bank, registrar, or payment processor that clears US-dollar transactions or depends on US-nexus infrastructure brings itself within reach of US sanctions enforcement by continuing to serve a designated party, which is what gives an SDGT/SDN listing extraterritorial practical effect without any direct assertion of US jurisdiction over the designated party itself.
