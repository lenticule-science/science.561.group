---
description: Domain name seizure is the removal of a domain name's DNS resolution, or the transfer of its registration, in response to a legal or regulatory order directed at the registry or registrar of record rather than at the operator of the service the domain names.
identity: domain-name-seizure
name: Domain name seizure
provenance:
  date-created: 2026-09-08
references:
  icann2012:
    authors:
      - ICANN
    title: Guidance for Preparing Domain Name Orders, Seizures & Takedowns
    publisher: ICANN
    year: 2012
    url: https://www.icann.org/en/system/files/files/guidance-domain-seizures-07mar12-en.pdf
  kopel2013:
    authors:
      - Karen Kopel
    title: "Operation Seizing Our Sites: How the Federal Government Is Taking Domain Names without Prior Notice"
    publication: Berkeley Technology Law Journal 28(3)
    year: 2013
    url: https://btlj.org/data/articles2015/vol28/28_AR/28-berkeley-tech-l-j-0859-0900.pdf
---
Domain name seizure is the removal of a domain name's DNS resolution, or the transfer of its registration, in response to a legal or regulatory order directed at the registry operator or the registrar of record, rather than at the operator of the service the domain names. ICANN's own guidance for law enforcement states the mechanism: the registry or registrar applies an EPP status such as `serverHold` to the domain object, removing it from the top-level domain's zone file so DNS resolution fails everywhere on the public Internet, without necessarily deleting the underlying registration record.

Domain name seizure differs from a hosting takedown in the layer it acts on: a hosting takedown removes content or access at the server where a site's files live, while a domain seizure acts at the naming layer, so a seized domain's underlying server and content can remain fully intact and reachable by an IP address or an alternate name even though the domain name itself no longer resolves. Kopel's analysis of the US Operation In Our Sites practice documents this distinction concretely: domains were seized ex parte, without prior notice to the registrant, including at least one case, rojadirecta.com/.org, where the seized domain's operator had already prevailed against the same underlying claim in a foreign court.

Because ICANN's practical leverage over a seizure order runs through its contracts with registries and registrars, a domain seized under this mechanism is unreachable by anyone relying on standard DNS resolution worldwide, regardless of where the domain's registrant, servers, or users are located, which is why a domain seizure is a more totalizing action against a service's public reachability than a takedown limited to one hosting provider or one jurisdiction's network. A service that depends on one domain name as its sole public identity, as [electronic-mail](./electronic-mail.md) and conventional [web-hosting](./web-hosting.md) both do, loses that identity entirely under a seizure, which is the structural reason an [onion-service](./onion-service.md) address, naming a rendezvous point rather than a registered domain, is not exposed to this same mechanism.
