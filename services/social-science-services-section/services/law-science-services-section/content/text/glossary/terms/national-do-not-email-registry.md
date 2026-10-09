---
description: "The US do-not-email registry the FTC declined to build in 2004, because the list would help spammers harvest valid addresses and email senders could not be authenticated."
identity: national-do-not-email-registry
name: National Do Not Email Registry
date-created: 2026-09-26
relations:
  contrasts-with: national-do-not-call-registry
  mandated-by: can-spam-act
references:
  ftc2004dne:
    authors: [U.S. Federal Trade Commission]
    title: "National Do Not Email Registry: A Report to Congress"
    year: 2004
    url: https://www.ftc.gov/reports/can-spam-act-2003-national-do-not-email-registry-federal-trade-commission-report-congress
  ftc2004press:
    authors: [U.S. Federal Trade Commission]
    title: "New System to Verify Origins of E-mail Must Emerge Before 'Do Not Spam' List Can Be Implemented"
    year: 2004
    url: https://www.ftc.gov/news-events/news/press-releases/2004/06/new-system-verify-origins-e-mail-must-emerge-do-not-spam-list-can-be-implemented-ftc-tells-congress
---
The [CAN-SPAM Act](can-spam-act.md) asked the Federal Trade Commission to report
on a national do-not-email registry. In June 2004 the FTC told Congress not to
build one: without a way to authenticate who sent an email, the registry would
probably increase spam.

## The reasons given

- **Harvesting.** A list of real addresses is valuable to spammers. Anyone who
  can query it can learn which addresses are live.
- **Weak safeguards.** The FTC considered scrubbing marketers' lists centrally,
  storing only one-way hashes of addresses, and seeding the list with decoy
  addresses to catch abusers. It judged none of them enough while a sender's
  origin could be forged.
- **Spammers ignore law already.** The senders the list targeted were the ones
  least likely to consult it.

The FTC named sender authentication as the precondition for any workable list.

## What has changed since 2004

- **Sender authentication.** Email authentication (SPF, DKIM, DMARC) is now
  widespread, and IETF drafts such as Web Bot Auth let automated agents sign
  their requests.
- **Private lookups.** k-anonymity range queries let a client check a hashed
  address without revealing it and without the operator releasing the list
  (see Have I Been Pwned's range API).
- **Accountable senders.** The main new senders of unwanted mail are AI agents
  run by identifiable platforms that face public pressure to comply, not
  anonymous spammers.

Those changes answer much of the 2004 objection for the case of AI agents.
