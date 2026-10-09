---
name: "Report"
type: "page"
date-created: 2026-03-20
description: A Report is a five-tuple (Auth, Scope, Δ, τ, Rec) — an author Auth with investigative standing over the subject domain, a Scope specifying the subject matter, a findings differential Δ recording what became settled during the reporting…
---

A Report is a five-tuple (Auth, Scope, Δ*, τ, Rec) — an author Auth with investigative standing over the subject domain, a Scope specifying the subject matter, a findings differential Δ* recording what became settled during the reporting interval, a temporal interval τ = [t₀, t₁] specifying the period covered, and a Recipient Rec to whom the report is addressed. The defining invariant: investigative standing. A report is an assertive speech act whose author was positioned to observe, investigate, or assess the subject — and whose findings are therefore authoritative, not merely opined. Without standing, the speech act is an assertion or an opinion; with standing, it is a report. The core structure is temporal-differential: a report conveys what changed — what became known, settled, or decided — during the interval [t₀, t₁]. This is the formal structure of the relational machine's Observation Layer: the machine's output at each step is Γ(H*_{t'}) ∖ Γ(H*_t) — the global sections newly settled since the previous step. A report is the institutionalized packaging of this differential into an assertive speech act addressed to a recipient.

Table of contents

- [Formal definition](#formal-definition)

- [Assertive speech acts and investigative standing](#assertive-speech-acts-and-investigative-standing)

- [Domain instances](#domain-instances)

[Scientific paper: the canonical knowledge report](#scientific-paper-the-canonical-knowledge-report)

- [Audit report: financial and compliance reporting](#audit-report-financial-and-compliance-reporting)

- [Military intelligence: the staff estimate and situation report](#military-intelligence-the-staff-estimate-and-situation-report)

- [Ship&rsquo;s log: the continuous maritime report](#ships-log-the-continuous-maritime-report)

- [Parliamentary and committee reports](#parliamentary-and-committee-reports)

- [Investigative journalism and legal investigation](#investigative-journalism-and-legal-investigation)

- [Report and Record: a note on the relationship](#report-and-record-a-note-on-the-relationship)

- [Nuclear reading](#nuclear-reading)

- [Open questions](#open-questions)


## Formal definition

A **Report** is a five-tuple R=(Auth,Scope,Δ∗,τ,Rec)\mathcal{R} = (\mathrm{Auth}, \mathrm{Scope}, \Delta^*, \tau, \mathrm{Rec}):

R=(Auth:Reporter,  Scope:SubjectDomain,  Δ∗:FindingsDifferential,  τ=[t0,t1]:Interval,  Rec:Recipient)\mathcal{R} = (\mathrm{Auth} : \mathrm{Reporter},\; \mathrm{Scope} : \mathrm{SubjectDomain},\; \Delta^* : \mathrm{FindingsDifferential},\; \tau = [t_0, t_1] : \mathrm{Interval},\; \mathrm{Rec} : \mathrm{Recipient})

where:

- $\mathrm{Auth}$ is the **author/reporter** — the agent who produces the report; $\mathrm{Auth}$ must have *investigative standing* over $\mathrm{Scope}$: the authority, access, qualification, and/or appointment that positions $\mathrm{Auth}$ to report on the subject matter; standing is what distinguishes a report from an assertion — a report claims not just &ldquo;this is the case&rdquo; but &ldquo;I was in a position to know this is the case&rdquo;; the standing predicate is typically satisfied by one of: professional qualification (auditor, doctor, expert witness), institutional appointment (inspector, officer, committee member), access granted by authority (the investigator given access to the site), or role-constituted epistemic access (the captain who commanded the voyage)

- $\mathrm{Scope}$ is the **subject domain** — the specific matter over which the report ranges; $\mathrm{Scope}$ delimits what is within the report (findings about the subject matter) and what is outside (matters not investigated, not covered, or disclaimed); $\mathrm{Scope}$ has two dimensions: *breadth* (what topics or entities are covered) and *depth* (to what level of detail the investigation extended)

- Δ∗\Delta^* is the **findings differential** — the core content of the report; Δ∗\Delta^* is not a static description of $\mathrm{Scope}$ at a moment but a *differential*: what became known, established, or settled during the interval $\tau = [t_0, t_1]$; the differential structure is fundamental: every report answers the question &ldquo;what changed?&rdquo; even when it appears to describe a static state (what the current financial position is = what changed from the prior period; what the patient&rsquo;s condition is = what changed since last examination)

- $\tau = [t_0, t_1]$ is the **temporal interval** — the period covered by the report; t0t_0 is the start of the reporting period (when investigation began, or the start of the period whose events are described); t1t_1 is the end (when the investigation concluded, or the end of the period described); the report is committed at some time $\tau_{\mathrm{commit}} \geq t_1$ (the report is written after the period it covers); the distinction between the period covered [t0,t1][t_0, t_1] and the commitment time $\tau_{\mathrm{commit}}$ matters: a historical report committed at $\tau_{\mathrm{commit}}$ may cover events from [t0,t1][t_0, t_1] long before $\tau_{\mathrm{commit}}$

- $\mathrm{Rec}$ is the **recipient** — the party to whom the report is addressed; the recipient specification is not incidental — it determines the appropriate form, depth, classification level, and mode of address; a medical report addressed to the patient differs from one addressed to the specialist; a committee report addressed to Parliament differs from one addressed to the public; a military intelligence estimate addressed to the commander differs from one addressed to allied forces; the recipient is constitutive of what the report is, not merely where it is sent

**Five invariants.** $\mathcal{R}$ is a report iff:

- **Investigative standing is held**: $\mathrm{Auth}$ was positioned to know, observe, or assess $\mathrm{Scope}$ during $\tau$. Standing is not self-declared — it is institutionally recognized or role-constituted. A person who did not investigate cannot report; they can assert. The standing predicate is what makes the report&rsquo;s findings authoritative rather than merely sincerely asserted. Without standing, the speech act is an opinion, even if correct.

- **The findings are differential**: Δ∗\Delta^* is defined relative to a baseline — what was known or settled before t0t_0 — and records what is newly known or newly settled at t1t_1. A report that merely restates prior settled facts without identifying new information is not a report but a summary or recapitulation. The differential structure is the operational heart of the report concept.

- **The temporal interval is specified**: the report covers a determinate period [t0,t1][t_0, t_1]; events or facts outside this period are not within the report&rsquo;s findings differential, even if the reporter is aware of them. An undated report — one without a specified interval — is epistemically uninterpretable: its findings cannot be placed in the correct historical context.

- **The recipient is specified**: $\mathrm{Rec}$ is not &ldquo;everyone&rdquo; — the report is addressed to a determinate party or class of parties. Reports addressed to all possible recipients are public reports or disclosures; they are a special case with $\mathrm{Rec} = \mathrm{Public}$, not the absence of a recipient. The recipient specification triggers appropriate form, classification, and mode of distribution.

- **The report is committed**: like a [Record](../../documents/articles/notes/undated/record.md), the report must be committed — actually written, issued, or delivered — to be a report. A report that is drafted but not delivered is an *unreleased report*, not a report simpliciter. The commitment is the act that brings the report into existence as an institutional fact. An oral report delivered verbally and not written is a report only if it satisfies an institutional standard for oral reports (formal briefing to the commander, testimony in court, oral examination before a committee).

## Assertive speech acts and investigative standing

A report is an **assertive speech act** in Searle&rsquo;s taxonomy: it represents the world as being a certain way. The assertive direction of fit is word-to-world: the report is correct iff the world is as the report describes. This contrasts with:

- **Commissives** (promises, contracts): world-to-word direction — the speaker changes the world to match the commitment

- **Declarations** (status-function declarations): both directions — the speech act itself changes the world to match the declared status

- **Directives** (orders, requests): attempting to get the recipient to change the world

- **Expressives** (apologies, thanks): no direction of fit

But a report is not any assertive speech act — it is one backed by *investigative standing*. Searle&rsquo;s sincerity condition (the speaker believes what they assert) is necessary but not sufficient: the reporter must not only believe the findings but have been in a position to establish them. This is the epistemic-deontological structure of the report: it combines an assertive speech act with a normative qualification requirement.

The **standing predicate** can be analyzed as follows. $\mathrm{Auth}$ has investigative standing over $\mathrm{Scope}$ during $\tau$ iff at least one of:

- **Positional access**: $\mathrm{Auth}$ occupied a position (office, role) that gave them access to the relevant information about $\mathrm{Scope}$ during $\tau$; the captain has positional access to the ship&rsquo;s events; the auditor granted access to the accounts has positional access

- **Professional qualification**: $\mathrm{Auth}$ possesses professional credentials that qualify them to assess $\mathrm{Scope}$; a doctor can report on a patient&rsquo;s clinical condition because of medical qualification; an expert witness has professional standing in their domain

- **Investigative appointment**: $\mathrm{Auth}$ was formally appointed to investigate $\mathrm{Scope}$ during $\tau$; the parliamentary committee was constituted to investigate the matter; the inspector-general was appointed to audit the unit

- **Direct observation**: $\mathrm{Auth}$ was present and observing during the relevant events; eyewitness testimony is a form of positional access granted by physical co-presence

Importantly, standing is subject-matter-specific and period-specific: an expert on one matter has standing in that domain but not in unrelated ones; the captain who commanded the voyage has standing to report on that voyage but not on the prior voyage they did not command.

## Domain instances

### Scientific paper: the canonical knowledge report

A **scientific paper** is a report in the full technical sense:

- $\mathrm{Auth}$: the authors, with standing established by their methodology section (what they did to investigate) and institutional affiliation (their professional qualification)

- $\mathrm{Scope}$: the research question, precisely delimited; the paper&rsquo;s scope is bounded by what the study addressed

- Δ∗\Delta^*: the **Results** section — what was newly found during the study period; the Discussion section contextualizes the differential in relation to prior knowledge (making the differential nature of the findings explicit)

- $\tau = [t_0, t_1]$: the study period (from data collection start to completion); reported in the **Methods** section

- $\mathrm{Rec}$: the journal&rsquo;s readership (the scientific community in the domain), filtered by the peer review process (which constitutes the journal as the appropriate standing to distribute the report to the community)

The **peer review process** is the institutional mechanism for verifying investigative standing: reviewers assess whether the methodology justifies the standing claim — whether what the authors did actually positions them to report the findings they report. A rejected paper fails because the methodology does not establish sufficient standing for the findings claimed.

**Replication**: the norm that scientific findings should be replicable is a norm about standing: a finding that no one else can establish by following the same methodology is a finding without reproducible standing — it may be correct, but its standing is not transferable to other investigators. Reproducibility is the public verifiability of the standing predicate.

### Audit report: financial and compliance reporting

A **financial audit report** is a formal report by a qualified auditor on an entity&rsquo;s financial statements:

- $\mathrm{Auth}$: the auditing firm, with standing established by professional qualification (CPA, CA) and engagement appointment (the auditor was engaged by the board under the relevant statute)

- $\mathrm{Scope}$: the financial statements of the entity for the relevant period — balance sheet, income statement, cash flow statement

- Δ∗\Delta^*: the **auditor&rsquo;s opinion** — what the auditor found about whether the financial statements fairly present the entity&rsquo;s position in accordance with applicable standards; this is a differential over the prior period&rsquo;s audit

- $\tau = [t_0, t_1]$: the financial year under audit

- $\mathrm{Rec}$: the shareholders (the principals to whom the directors are accountable) and, for public companies, the public

The audit report&rsquo;s standing structure is particularly rich: the auditor&rsquo;s standing derives from (1) professional qualification (the audit firm is licensed), (2) independence (the auditor must not have conflicts of interest with the entity), (3) access (the entity must grant the auditor access to records and personnel), and (4) engagement (the auditor must be formally appointed). Remove any of these and the audit opinion is not a valid report.

**Qualified opinions**: when the auditor cannot establish full standing over some element of $\mathrm{Scope}$ (access was restricted, records were missing, a material uncertainty exists), the report is *qualified* — the standing limitation is disclosed, and the finding is limited to what the available standing supports. This is the formal mechanism for handling partial standing.

### Military intelligence: the staff estimate and situation report

Military staffs produce several canonical report forms:

**Situation Report (SITREP)**: a regular update on the tactical or operational situation. Δ∗\Delta^* = what changed since the last SITREP. $\tau$ = the period since the last report. $\mathrm{Auth}$ = the commanding officer or designated intelligence officer, with standing by command position. $\mathrm{Rec}$ = the higher command.

**Commander&rsquo;s Estimate of the Situation** (US Army FM 5-0): the formal intelligence report produced before a significant operation. Structure: (1) Mission; (2) Situation and Courses of Action; (3) Analysis of Opposing Courses of Action; (4) Comparison of Own Courses of Action; (5) Decision. The estimate is not an order — it is an assertive report on the operational situation, with a recommended decision. Δ∗\Delta^* = what the commander assesses about the current situation relative to prior knowledge. The recommendation is a proposal, not the report itself.

**Intelligence Estimate (National Intelligence Estimate in the US system)**: produced by the intelligence community, with standing established by the community&rsquo;s analytical resources and access to classified information. The NIE is the canonical case where standing is explicitly contested: dissenting opinions are recorded when individual agencies do not share the estimate&rsquo;s findings — each dissent represents a claim that the standing of the majority finding does not extend to the dissenting agency&rsquo;s assessment.

**The need-to-know principle**: military and intelligence reports are distributed on a **need-to-know** basis — the recipient ($\mathrm{Rec}$) must have both the appropriate security clearance (institutional recognition of the recipient&rsquo;s trustworthiness) and a specific operational need for the information. This is a constraint on $\mathrm{Rec}$: the report is not addressed to all cleared personnel, but only to those who need it for their role. The need-to-know restriction is a formal specification of $\mathrm{Rec}$ narrowed by operational role.

### Ship&rsquo;s log: the continuous maritime report

The **ship&rsquo;s log** is the captain&rsquo;s ongoing record of all significant events during a voyage — courses steered, weather observed, personnel changes, cargo events, incidents encountered. The log is the canonical continuous report:

- $\mathrm{Auth}$: the master, with standing by command authority over the vessel; the master has positional access to all significant events aboard

- $\mathrm{Scope}$: all events affecting the safety and operation of the vessel during the voyage

- Δ∗\Delta^*: the events of the current watch or day — what happened since the last entry; the log is a sequence of differential entries

- $\tau = [t_0, t_1]$: the period of the current entry (watch, day, or event)

- $\mathrm{Rec}$: the shipowner, the relevant maritime authority, and potentially courts (the log is evidentiary)

In maritime law, the ship&rsquo;s log is **presumptive evidence** of what occurred: courts give substantial weight to contemporaneous log entries over later testimony, because the log was made by an officer with standing at the time of the events, without the distortions of memory. This is the legal instantiation of the standing predicate&rsquo;s epistemic force: standing at the time of observation produces more reliable findings than standing at the time of testimony (where memory and interest intervene).

**Failure to maintain the log**: a master who fails to maintain the log loses the evidentiary benefit and may face liability for the failure itself. The log is not merely useful — it is an obligation that comes with the standing of command. Standing and the duty to report are co-constitutive: the position that gives investigative standing also creates the obligation to exercise it.

### Parliamentary and committee reports

A **parliamentary committee report** is produced by a committee appointed by the legislature to investigate a specific matter:

- $\mathrm{Auth}$: the committee, with standing established by parliamentary appointment and the conduct of hearings (the committee took evidence from witnesses, examined documents, received expert testimony)

- $\mathrm{Scope}$: the terms of reference — the specific matter the committee was constituted to investigate

- Δ∗\Delta^*: the committee&rsquo;s findings and recommendations — what the committee found during its inquiry that was not previously settled in the legislative record

- $\tau = [t_0, t_1]$: the period of the inquiry

- $\mathrm{Rec}$: Parliament (the institution that appointed the committee) and, on publication, the public

The committee report&rsquo;s standing is collectively held: no single member has standing to report on the matter, but the committee as a constituted body does. This is the institutional generation of standing: appointment creates the standing that individual members lack.

**Dissenting and minority reports**: when committee members disagree with the majority findings, they may file dissenting or minority reports. These are sub-reports within the committee&rsquo;s report, each with the same $\tau$ and $\mathrm{Scope}$ but different Δ∗\Delta^* (different findings) and $\mathrm{Auth}$ (the dissenting members). The existence of dissenting reports marks the report as contested: the standing is shared, but the findings are not.

### Investigative journalism and legal investigation

A **journalistic investigation** produces findings with standing established by the investigation: access to sources, documents, and sites; the investigative process itself creates the standing. The investigative article is a report; the opinion piece is not. The distinction tracks the standing predicate precisely.

In law, an **expert witness report** is a formal report by a qualified expert on a specific technical matter:

- Standing is established by professional qualification, recognized methodology, and access to the relevant materials (case documents, physical evidence, the parties themselves)

- The report must disclose the basis for the expert&rsquo;s findings — the methodology section establishes the standing predicate

- Courts can exclude expert testimony that fails the standing test: *Daubert v. Merrell Dow Pharmaceuticals* (1993) established that expert testimony must be based on sufficient facts or data, reliable principles and methods, and the proper application of those methods

**The epistemic asymmetry of the report**: the recipient typically cannot independently verify the reporter&rsquo;s findings — that is why the reporter&rsquo;s standing matters. The audit report is relied upon because shareholders cannot audit the company themselves; the expert witness report is relied upon because the judge cannot assess the technical matter independently; the intelligence estimate is relied upon because the decision-maker does not have access to the underlying intelligence. The standing predicate is what justifies reliance in conditions of epistemic asymmetry.

## Report and Record: a note on the relationship

A report, when committed, becomes a [Record](../../documents/articles/notes/undated/record.md) in the sense that it is a committed fact — a triple $(K, V, \tau_{\mathrm{commit}})$ where $K$ is the report&rsquo;s identifier, $V$ is the report&rsquo;s content, and $\tau_{\mathrm{commit}}$ is the moment of commitment. But the report is not merely a record: the record concept applies to any committed fact; the report concept additionally requires investigative standing, a findings differential, a specified interval, and a recipient. Every report is a record; not every record is a report.

The distinction matters for evidentiary value: a record is valuable because it is a committed fact that persists; a report is additionally valuable because it was produced by an agent with standing, which gives its findings authority beyond mere persistence.

## Nuclear reading

In the relational hyperverse, a report R=(Auth,Scope,Δ∗,τ,Rec)\mathcal{R} = (\mathrm{Auth}, \mathrm{Scope}, \Delta^*, \tau, \mathrm{Rec}) has a direct formal instantiation in the relational machine&rsquo;s **Observation Layer**:

**The Observation Layer is a report-generating machine**: the relational machine&rsquo;s output at each step from $t$ to t′t&#x27; is:

Δ∗(t,t′)=Γ(Ht′∗)∖Γ(Ht∗)\Delta^*(t, t&#x27;) = \Gamma(H^*_{t&#x27;}) \setminus \Gamma(H^*_t)

the global sections newly settled since the previous step. This is the findings differential Δ∗\Delta^* with:

- τ=[t,t′]\tau = [t, t&#x27;] (the interval covered by the step)

- $\mathrm{Scope}$ = the subject matter of the fiber $H$ (all propositions in the fiber&rsquo;s domain)

- $\mathrm{Auth}$ = the relational machine itself, with standing established by its Engine (which processed HtH_t through the composite nucleus $\pi_t = \sigma_t \circ \Delta_t$) — the machine&rsquo;s standing is its epistemic access to the fiber&rsquo;s settled content

- $\mathrm{Rec}$ = any agent that receives the machine&rsquo;s output (a locale receiving the observation, a human operator, a connected peer machine)

**The relational machine is an ideal reporter**: its standing is perfect (it has access to all elements of HtH_t), its methodology is transparent (the composite nucleus $\pi_t$), its temporal interval is precise (from history $t$ to t′t&#x27;), and its findings are exactly the newly settled sections (not previously in Γ(Ht∗)\Gamma(H^*_t), now in Γ(Ht′∗)\Gamma(H^*_{t&#x27;})).

**Investigative standing in the fiber**: $\mathrm{Auth}$ has investigative standing over $\mathrm{Scope}$ at $\tau$ iff there exists a sub-fiber HtAuth⊆HtH^\mathrm{Auth}_t \subseteq H_t such that:

- $\mathrm{Auth}$ has access to HtAuthH^\mathrm{Auth}_t (the scope of their investigation is a sub-fiber they can read)

- $\mathrm{Auth}$ has run the nuclear processing within HtAuthH^\mathrm{Auth}_t (they have processed their scope through the relevant nuclei)

- $\mathrm{Auth}$&rsquo;s findings Δ∗\Delta^* are exactly Γ(Ht′∗,Auth)∖Γ(Ht∗,Auth)\Gamma(H^{*, \mathrm{Auth}}_{t&#x27;}) \setminus \Gamma(H^{*, \mathrm{Auth}}_t) — the newly settled global sections within their scope

A reporter without standing has not processed the relevant sub-fiber: they are reporting on Δ∗\Delta^* of a sub-fiber they did not have access to. Their report is an assertion about a differential they did not compute — it may be correct by accident but lacks the epistemic grounding that standing provides.

**The recipient specification**: $\mathrm{Rec}$ specifies which agent receives the machine&rsquo;s output. In the relational machine architecture, the Observation Layer can be connected to different downstream recipients. The need-to-know principle corresponds to the restriction of Γ(Ht′∗)∖Γ(Ht∗)\Gamma(H^*_{t&#x27;}) \setminus \Gamma(H^*_t) to the sub-fiber relevant to the recipient&rsquo;s scope — the recipient receives only the portion of the findings differential relevant to their domain.

**Report as assertive global section**: the report $\mathcal{R}$, when committed, is a global section of the sheaf over the history site: a compatible family of elements $(s_t)_{t \in T}$ such that ρt′→t(st′)=st\rho_{t&#x27; \to t}(s_{t&#x27;}) = s_t for all t≤t′t \leq t&#x27; — a consistent statement that can be read at any history and will give a coherent account of what was settled during [t0,t1][t_0, t_1]. The global section property is what makes the report coherent: it is not a local claim about a single history but a claim that can be consistently evaluated across all histories extending the reporting period.

**The differential as the core invariant**: the sheaf-theoretic expression of the report&rsquo;s differential structure is: the report at t1t_1 is not Γ(Ht1∗)\Gamma(H^*_{t_1}) (the full settled fiber) but Γ(Ht1∗)∖Γ(Ht0∗)\Gamma(H^*_{t_1}) \setminus \Gamma(H^*_{t_0}) (what is newly settled relative to the baseline). This is why reports are always indexed to a period: the findings are meaningful only relative to the prior state. An undated report (one without specified t0t_0) is equivalent to Γ(Ht1∗)∖Γ(Hε∗)\Gamma(H^*_{t_1}) \setminus \Gamma(H^*_\varepsilon) — a report relative to the empty history — which is the full settled fiber, which is not a differential but a complete history.

## Open questions

- Whether the standing predicate can be formalized as a sub-sheaf condition: $\mathrm{Auth}$ has standing over $\mathrm{Scope}$ at $\tau$ iff there is a sub-sheaf $\mathcal{F}^\mathrm{Auth} \hookrightarrow \mathcal{F}$ (an inclusion of the author&rsquo;s accessible fiber into the full fiber) such that $\mathrm{Auth}$ processed the sub-sheaf through the appropriate nuclei during $\tau$ — and whether this sub-sheaf inclusion is a monomorphism in the category of sheaves on the history site.

- Whether the distinction between reports and assertions (the standing predicate) corresponds to a sheaf-theoretic distinction between morphisms in the topos: a report is a morphism from the reporter&rsquo;s sub-sheaf to the settled fiber; an assertion is a morphism from the assertion&rsquo;s context to the fiber without the sub-sheaf condition. If so, reports are a subset of global elements of the sheaf, filtered by the monomorphism condition.

- Whether **peer connection** between relational machines (noted as unformalized in `relational-machine.md`) corresponds to a formal report exchange: machine $A$ sends Γ(Ht′∗)∖Γ(Ht∗)\Gamma(H^*_{t&#x27;}) \setminus \Gamma(H^*_t) to machine $B$, where $B$ must assess AA&rsquo;s standing before incorporating the received differential into its own fiber — the standing assessment is the precondition for $B$ updating HBH_B with information from AA&rsquo;s report.

- Whether the distinction between **classified and unclassified reports** (distribution restricted vs. public) corresponds to the restriction of global sections to a sub-site: a classified report is a global section of the sheaf restricted to the sub-site defined by the cleared recipients; the unclassification of a report is the extension of the global section to the full site.

- Whether the temporal differential structure of reports — Γ(Ht′∗)∖Γ(Ht∗)\Gamma(H^*_{t&#x27;}) \setminus \Gamma(H^*_t) — has a formal relationship to sheaf cohomology: whether the &ldquo;gap&rdquo; between successive settled fibers is measured by a cohomological invariant, and whether increasing report frequency (smaller intervals [t0,t1][t_0, t_1]) corresponds to a finer filtration of the cohomological computation.
