---
id: cyber-intelligence
description: "Intelligence concerning adversary cyber capabilities, operations, and intent — and the use of cyber operations as an intelligence collection method."
aliases: [cyber intelligence, CYBINT, cyber threat intelligence]
instance-of: collection-disciplines
requires: [attribution, all-source-analysis]
enables: [counterintelligence, operational-security]
date-created: 2026-03-06
date-modified: 2026-03-29
---

Cyber intelligence operates at the intersection of intelligence and information warfare, encompassing both intelligence *about* cyber threats (adversary capabilities, operations, intent) and intelligence *collected through* cyber operations (computer network exploitation as a collection method). The distinction matters: the first is an analytical product; the second is a collection discipline.

## Intelligence about cyber threats

Cyber threat intelligence assesses adversary capabilities and intent in the cyber domain:

- **Adversary cyber capabilities.** What malware tools, infrastructure, and techniques does the adversary possess? How sophisticated are their offensive cyber operations?
- **Adversary cyber intent.** What targets is the adversary interested in? What effect do they intend to achieve (espionage, disruption, destruction)?
- **Attribution.** Who conducted a specific cyber operation? [Attribution](./attribution.md) in cyberspace is particularly difficult because attackers can operate through proxy infrastructure, use tools associated with other actors, and obscure their identity through technical means
- **Vulnerability assessment.** What vulnerabilities in friendly systems could the adversary exploit?

The U.S. Cyber Command (USCYBERCOM), the [NSA](../institutions/nsa.md)'s Cybersecurity Directorate, and the FBI's Cyber Division are the primary organizations producing and acting on cyber intelligence.

## Cyber as collection method

Computer network exploitation (CNE) — gaining access to adversary computer systems to collect intelligence — has become a major collection discipline alongside traditional [HUMINT](./humint.md) and [SIGINT](./sigint.md). CNE can provide access to:

- Adversary communications (email, messaging, voice-over-IP)
- Documents, databases, and files stored on adversary systems
- Network architecture and technical infrastructure
- Credentials and access that enable deeper penetration

The Stuxnet operation (attributed to the U.S. and Israel, c. 2007–2010) demonstrated that cyber operations could produce physical effects — destroying Iranian nuclear centrifuges — blurring the line between intelligence collection and military action.

## Challenges

Cyber intelligence faces distinctive challenges:

**Speed.** Cyber operations occur at machine speed; the intelligence cycle's human-dependent processes (analysis, decision-making, tasking) are often too slow to match the threat timeline.

**Attribution.** The adversary can disguise the origin of cyber operations through proxy infrastructure, false flags, and shared tools. Attribution requires correlating technical indicators with [all-source analysis](./all-source-analysis.md) from HUMINT, SIGINT, and other disciplines.

**Dual-use.** The same technical capabilities used for intelligence collection can be used for military attack. This blurs the intelligence-operations boundary and raises questions about authorities, oversight, and escalation that the existing [oversight framework](../doctrine/oversight-framework.md) was not designed to address.

**Vulnerability equities.** When the intelligence community discovers a vulnerability in widely used software, it faces a dilemma: exploit the vulnerability for intelligence collection (keeping it secret), or disclose it for defensive purposes (patching the vulnerability). The Vulnerabilities Equities Process (VEP) adjudicates these decisions, but the tension between offensive exploitation and defensive disclosure is structural.

## Related terms

- [SIGINT](./sigint.md) — the collection discipline cyber intelligence most closely relates to
- [Attribution](./attribution.md) — the analytical function most challenged in the cyber domain
- [Counterintelligence](./counterintelligence.md) — the defensive function against adversary cyber collection
- [Operational security](./operational-security.md) — the protection of friendly systems from adversary cyber operations
