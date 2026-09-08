---
description: Abuse handling is the operational practice by which a service operator receives, triages, and acts on reports that a user of the service is misusing it, most often communicated between mail systems in the machine-readable Abuse Reporting Format.
identity: abuse-handling
name: Abuse handling
provenance:
  date-created: 2026-09-08
references:
  shaferallmancunningham2010:
    authors:
      - Y. Shafranovich
      - J. Levine
      - M. Kucherawy
    title: An Extensible Format for Email Feedback Reports
    publication: RFC 5965
    publisher: IETF
    year: 2010
    url: https://www.rfc-editor.org/rfc/rfc5965.html
  klyneloughneynottingham2012:
    authors:
      - J. Falk (ed.)
      - M. Kucherawy (ed.)
    title: "Creation and Use of Email Feedback Reports: An Applicability Statement for the Abuse Reporting Format (ARF)"
    publication: RFC 6650
    publisher: IETF
    year: 2012
    url: https://www.rfc-editor.org/rfc/rfc6650.html
---
Abuse handling is the operational practice by which a service operator receives, triages, and acts on reports that a user of the service is sending unwanted mail, hosting harmful content, or otherwise misusing the service, most often communicated between mail systems in the machine-readable Abuse Reporting Format (RFC 5965) under the applicability statement RFC 6650 sets out. RFC 6650 describes the format's most common deployment: a private bilateral arrangement in which a receiving mail system forwards a copy of a recipient's spam complaint back to the sending system as a structured feedback report, letting the sending system's own abuse desk act on signal it would not otherwise see.

Abuse handling differs from content moderation in what triggers it: abuse handling responds to a complaint or automated signal about a specific account or message after the fact, most commonly delivered as a structured report from another operator, while content moderation is the broader, often proactive practice of evaluating content against a service's own policy before or independent of any external complaint. It differs from email deliverability policy in role: deliverability policy determines whether a message is accepted or filtered by a receiving system, while abuse handling is the sending operator's own process for responding once misuse has been reported. See [email-deliverability](./email-deliverability.md).

Every service capability described in this section's glossary — mail relay, mailing-list redistribution, hosting, a content delivery network's edge cache — creates a channel a user can misuse, so abuse handling is not an optional addition to a communication service but a standing operational cost proportional to the number of users and the number of distinct capabilities the operator runs. A small, volunteer-run collective offering the same capability set as a large commercial provider carries the same per-user abuse-handling burden without that provider's paid abuse-desk staffing, which is the labor-economics fact this section's economics seat states as `cost-of-abuse-handling`.
