---

title: Tactical Officer
description: "The office responsible for active security posture — threat assessment, defensive response, and the maintenance of organizational integrity against adversarial or disruptive conditions."
defines: tactical-officer
aliases: [security officer, tactical]
related: [officer, office, officium, duty, authority, standing, breach, norm-conflict]
date-created: 2026-04-05
---

A tactical officer is the [office](../../../terms/office.md) responsible for the organization's security posture — identifying threats, assessing their severity, coordinating defensive responses, and maintaining the integrity of organizational boundaries. The office exists because organizations operate in environments that are not uniformly benign. Resources attract competitors. Boundaries attract probes. Complexity creates attack surfaces. Without a dedicated security function, threats are discovered only at the point of damage.

## What the office does

The tactical officer performs four functions:

1. **Threat assessment.** Identifying conditions that could compromise organizational integrity — not just active attacks, but structural vulnerabilities, environmental changes, and emergent risks. Threat assessment is continuous, not episodic: the threat landscape changes as the organization changes. A new dependency creates a new attack surface. A new capability attracts new adversaries. A new process creates new failure modes that could be exploited.

2. **Defensive posture management.** Maintaining the set of potential defenses — access controls, validation rules, boundary enforcement, monitoring — and ensuring they remain adequate to the assessed threat level. Posture is not a fixed configuration; it is a dynamic response to threat assessment. When the threat level rises, posture tightens. When a new vulnerability is discovered, the relevant defense is strengthened or installed.

3. **Incident response.** When a [breach](./breach.md) occurs — when a boundary is crossed, a control is bypassed, or integrity is compromised — the tactical officer coordinates the immediate response. Incident response has a temporal structure: contain (stop the damage from spreading), assess (determine what was compromised), remediate (restore integrity), and debrief (update the threat model).

4. **Boundary definition.** Advising on where organizational boundaries should be drawn and how they should be enforced. Not all boundaries are security boundaries, but every boundary has security implications. The tactical officer's expertise is in understanding which boundaries are load-bearing — which, if breached, cause cascading compromise — and ensuring those boundaries are adequately defended.

## Organizational lineage

The role traces to the sentinel and the watch in military tradition — the function dedicated to detecting threats before they reach the main body. But the organizational lineage extends beyond the military.

James Reason's "Swiss cheese model" of organizational accidents (1990) formalized the insight that security is a layered property: no single defense is sufficient, and failure occurs when holes in multiple layers align simultaneously. The tactical officer maintains these layers and watches for alignment.

In information security, the function crystallized as the Chief Information Security Officer (CISO) — a role that emerged in the 1990s when organizations recognized that security could not be an afterthought distributed across general-purpose roles. The OWASP framework, NIST cybersecurity standards, and ISO 27001 all encode the same structural insight: security requires a dedicated office with the authority to inspect, constrain, and override other functions when integrity is at stake.

Barry Buzan's *People, States and Fear* (1983) broadened security theory beyond military threats to include economic, societal, environmental, and political security — the recognition that threats to organizational integrity come from multiple domains simultaneously. The tactical officer's domain is this broader conception: not just defense against hostile agents, but maintenance of organizational integrity against all sources of disruption.

## Fiber structure

**σ fiber (what the office recognizes):** Threats and vulnerabilities — conditions that could compromise organizational integrity. The tactical officer recognizes active threats (hostile agents, malicious inputs, adversarial conditions), latent vulnerabilities (unpatched weaknesses, unmonitored boundaries, untested assumptions), posture gaps (defenses that are absent, degraded, or mismatched to the current threat level), and breaches in progress (ongoing compromises that have bypassed existing defenses). Recognition also covers false security — defenses that appear functional but have been silently circumvented.

**Δ fiber (what the office produces):** Threat assessments — structured evaluations of the threat landscape with severity and likelihood ratings. Posture recommendations — specific defensive measures matched to assessed threats. Incident reports — accounts of breaches with root cause, impact, and remediation. Security policies — rules governing boundary enforcement, access control, and acceptable risk. The tactical officer does not build the defenses — that is engineering work — but she specifies what defenses are needed and verifies that they function.

## Formality level

**F2 — moderate formality.** The security function requires formal authority to override normal operations when integrity is at stake. The tactical officer needs the Hohfeldian *power* to restrict access, to halt processes that pose a security risk, and to compel disclosure of security-relevant information from any office. She also needs *privilege* — the liberty to probe organizational boundaries without owing a duty not to. Without override authority, the security function is advisory, and advisory security is reliably overridden by operational convenience. The override power is bounded: it applies only to security-relevant operations and lapses when the threat condition is resolved.

## What distinguishes the tactical officer

**From the code reviewer.** A code reviewer evaluates the quality and correctness of a specific artifact. The tactical officer evaluates the security posture of the system that produced, deploys, and depends on that artifact. Code review catches bugs; the tactical officer catches attack surfaces. A code review can pass while the deployment is insecure, because artifact quality and deployment security are different properties.

**From the [chief medical officer](./chief-medical-officer.md).** The chief medical officer diagnoses internal degradation — entropy, staleness, capacity exhaustion. The tactical officer assesses external threats and boundary integrity. A system can be internally healthy and externally vulnerable, or internally degraded and externally secure. The two functions share a diagnostic orientation but face different directions: the chief medical officer faces inward; the tactical officer faces outward.

## See also

- [office](../../../terms/office.md) — the normative position the tactical officer holds
- [officer](./officer.md) — the person holding the office
- [breach](./breach.md) — the event the tactical officer works to prevent and respond to
- [authority](./authority.md) — the power structure within which override authority operates
- [norm-conflict](./norm-conflict.md) — the structural tension when security overrides operational norms
