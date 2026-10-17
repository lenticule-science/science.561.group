---
description: A storage or communication system's property of remaining unremovable or unblockable by a specifically named removal mechanism — domain seizure, host compulsion, notice-and-takedown, or a sanctions listing that cuts payment rails — never resistance to removal in the abstract.
identity: censorship-resistance
name: Censorship Resistance
date-created: 2026-09-08
provenance:
  sources:
    - /home/emsenn/info/lib/emsenn/services/561-group/services/science-services-section/services/engineering-science-services-section/services/computer-science-services-section/services/distributed-systems-science-services-section/content/text/documents/articles/notes/2026/09/08/2026-09-08-note-on-the-study-of-distributed-and-content-addressed-storage-for-censorship-resistance.md
references:
  clarke2001:
    authors:
      - Ian Clarke
      - Oskar Sandberg
      - Brandon Wiley
      - Theodore W. Hong
    title: "Freenet: A Distributed Anonymous Information Storage and Retrieval System"
    publication: Designing Privacy Enhancing Technologies, Springer LNCS 2009
    year: 2001
    url: https://link.springer.com/chapter/10.1007/3-540-44702-4_4
  dingledine2004:
    authors:
      - Roger Dingledine
      - Nick Mathewson
      - Paul Syverson
    title: "Tor: The Second-Generation Onion Router"
    publication: 13th USENIX Security Symposium
    year: 2004
    url: https://www.usenix.org/legacy/publications/library/proceedings/sec04/tech/dingledine.html
---
Censorship resistance is a system's property of remaining unremovable or unblockable by a specifically named removal mechanism — domain seizure, host compulsion, a notice-and-takedown regime such as DMCA, or a sanctions listing that cuts off payment processors — rather than resistance to removal in the abstract, since no system is resistant to every conceivable adversary.

Ian Clarke, Oskar Sandberg, Brandon Wiley, and Theodore W. Hong's [Freenet](https://link.springer.com/chapter/10.1007/3-540-44702-4_4) (Designing Privacy Enhancing Technologies, Springer LNCS 2009, 2001) names resistance to a single actor identifying or removing all copies as an explicit design goal: a network of identical nodes collectively storing and routing requests so no single node, and no single legal or physical actor compelling that node, can remove every copy. Roger Dingledine, Nick Mathewson, and Paul Syverson's [Tor](https://www.usenix.org/legacy/publications/library/proceedings/sec04/tech/dingledine.html) (USENIX Security 2004) targets a related but distinct property — resistance to identifying who requested or published content, via layered circuit encryption and distributed directory servers rather than a single rendezvous point an adversary could compel — which is resistance to deanonymization, not resistance to content removal itself.

The consequence is that a claim of censorship resistance is only as strong as the removal mechanism it was engineered against: a system resistant to a single hosting provider's compulsion is not thereby resistant to a payment processor's sanctions compliance or to a domain registrar's seizure, each of which removes a different single point of control. Evaluating any candidate storage mechanism for a threatened corpus therefore requires stating, term by term, which of these named mechanisms it removes the single point of failure for, and which it leaves untouched — [eclipse and Sybil attacks](./sybil-attack.md) are the failure mode by which an adversary can substitute identity-flooding for legal or infrastructural compulsion and achieve an equivalent result against a system that only accounted for the latter.
