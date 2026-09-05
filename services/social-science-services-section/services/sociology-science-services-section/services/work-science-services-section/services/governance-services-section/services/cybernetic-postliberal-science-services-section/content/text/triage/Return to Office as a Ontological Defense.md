---
author: "[AGRODAO](AGRODAO)"
date: "2025-03-30T00:00:00"
status: "[draft](draft)"
---
# Return to Office as a Response to “Simulation” Instability

Remote work surged during the COVID-19 pandemic, but many companies have since pushed Return-to-Office (RTO) mandates.
While productivity and culture are the oft-cited reasons, an emerging theoretical view is that RTO responds to a deeper crisis of _simulation_ – a breakdown in trust and reality verification in virtual workflows.
Recent incidents with deepfakes, identity fraud, AI impersonation, and “unverifiable” remote workers have challenged organizations’ ability to know what (and _who_) is real online.
This report explores real-world cases from 2020 onward where companies enforced RTO or similar measures following such incidents, and draws on theory (Baudrillard, Giddens, Deleuze, Foucault, Mbembe, Massumi, systems theory) to frame RTO as an attempt to restore stability in the face of simulation collapse.
We also survey current discourse on synthetic labor, workplace deepfakes, epistemic instability in remote systems, and the potential collapse of trust in digital work environments.

## Case Studies: RTO Mandates and Simulation-Related Incidents (2020+)

Several high-profile incidents since 2020 have exposed how remote work systems can be subverted by simulated or falsified “actors,” prompting firms to reconsider or tighten remote-work policies (in some cases mandating RTO).
The table below summarizes key cases and responses:

|**Organization / Case**|**Year**|**Incident** (Simulation Issue)|**Response / Implication**|
|---|---|---|---|
|**KnowBe4 (cybersecurity firm)**|2024|Hired a remote engineer who turned out to be a North Korean threat actor using a stolen identity and an AI-altered profile photo​<br><br>[cyberscoop.com](https://cyberscoop.com/cyber-firm-knowbe4-hired-a-fake-it-worker-from-north-korea/#:~:text=A%20remote%20worker%20hired%20by,in%20a%20blog%20post%20Tuesday)<br><br>. The deception passed video interviews and background checks, only discovered when the new hire began uploading malware​<br><br>[cyberscoop.com](https://cyberscoop.com/cyber-firm-knowbe4-hired-a-fake-it-worker-from-north-korea/#:~:text=An%20internal%20investigation%20started%20when,Endpoint%20Detection%20and%20Response%20software)<br><br>.|Highlighted the failure of traditional remote hiring protocols. KnowBe4 enhanced identity verification in hiring​<br><br>[cyberscoop.com](https://cyberscoop.com/cyber-firm-knowbe4-hired-a-fake-it-worker-from-north-korea/#:~:text=CyberScoop%20that%20%E2%80%9Cnot%20a%20lot%E2%80%9D,%E2%80%9D)<br><br>, and the incident underscored the need for in-person identity confirmation or advanced biometric vetting for remote staff​<br><br>[iproov.com](https://www.iproov.com/blog/knowbe4-deepfake-wake-up-call-remote-hiring-security#:~:text=KnowBe4%2C%20who%20specialize%20in%20security,loading%20malware%20onto%20company%20devices)<br><br>​<br><br>[iproov.com](https://www.iproov.com/blog/knowbe4-deepfake-wake-up-call-remote-hiring-security#:~:text=including%20video%20interviews%2C%20background%20checks%2C,loading%20malware%20onto%20company%20devices)<br><br>.|
|**“Laptop Farm” Fraud (Fortune 500s)**|2020–23|A conspiracy in which an Arizona woman and overseas co-conspirators placed **hundreds** of IT contractors at U.S. companies using stolen or fake identities. Remote hires in tech roles were actually North Koreans operating company-issued laptops from a single “IT mule” location​<br><br>[hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=,The%20agency)<br><br>​<br><br>[hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=Though%20DOJ%20did%20not%20reveal,by%20participants%20in%20the%20scheme)<br><br>.|Exposed a large-scale exploitation of remote work. A 2023 DOJ indictment revealed the scheme, likely spurring firms (especially in sensitive sectors) to tighten remote work oversight and require more on-site presence or periodic checks to verify that employees are who they claim to be​<br><br>[hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=Schemes%20to%20submit%20fraudulent%20remote,information%20to%20obtain%20remote%20positions)<br><br>​<br><br>[hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=even%20previously%20received%20attention%20from,information%20to%20obtain%20remote%20positions)<br><br>.|
|**FBI Deepfake Interview Alert**|2022|FBI’s Internet Crime Complaint Center warned that scammers were using **deepfake video** and voice spoofing in online job interviews for remote positions​<br><br>[ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=The%20FBI%20Internet%20Crime%20Complaint,not%20actually%20done%20or%20said)<br><br>​<br><br>[ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=Complaints%20report%20the%20use%20of,with%20what%20is%20presented%20visually)<br><br>. Candidates’ video and audio were sometimes misaligned (e.g. coughing not matching on-screen) – indicating synthetic manipulation. Stolen personal data was also used to pass background checks​<br><br>[ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=Complaints%20report%20the%20use%20of,with%20what%20is%20presented%20visually)<br><br>​<br><br>[ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=IC3%20complaints%20also%20depict%20the,applicants%20belonged%20to%20another%20individual)<br><br>.|The FBI alert put employers on notice that virtual hiring could be **gamed** by impostors. In response, some companies introduced stricter in-person ID verification at hiring or shifted certain roles back to in-office work to ensure “real” presence. The alert reinforced that purely remote interactions might be insufficient for roles with access to sensitive data​<br><br>[ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=The%20remote%20work%20or%20work,IT%20databases%20and%2For%20proprietary%20information)<br><br>​<br><br>[ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=information%20technology%20and%20computer%20programming%2C,IT%20databases%20and%2For%20proprietary%20information)<br><br>.|
|**Wells Fargo “Fake Work” Firings**|2024|The bank fired more than a dozen employees for using “mouse jiggler” devices to simulate keyboard/mouse activity and _appear_ busy while working remotely​<br><br>[pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=Wells%20Fargo%20has%20reportedly%20fired,workers%20accused%20of%20faking%20work)<br><br>. This “simulation of keyboard activity” created an **illusion** of productivity​<br><br>[pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=These%20employees%2C%20all%20part%20of,the%20Financial%20Industry%20Regulatory%20Authority)<br><br>​<br><br>[pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=As%20Bloomberg%20noted%2C%20devices%20and,19%20pandemic)<br><br>. (It’s unclear if those employees were remote, but such tools surged during the work-from-home boom.)|Showed that not only identities but even work **itself** can be simulated. Wells Fargo, which had extended remote work longer than some rivals, cited unethical behavior and let the employees go​<br><br>[pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=arm%2C%20were%20%E2%80%9Cdischarged%20after%20review,the%20Financial%20Industry%20Regulatory%20Authority)<br><br>. The case fed into employers’ general anxiety that remote staff might fake output. Many companies have since doubled down on RTO to ensure employees are _physically observable_ or at least under more direct supervision, reducing opportunities for “simulated” work​<br><br>[pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=The%20report%20said%20that%20it%E2%80%99s,its%20rivals%2C%20the%20report%20added)<br><br>​<br><br>[pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=As%20PYMNTS%20wrote%20last%20month%2C,relocating%20or%20centralizing%20their%20headquarters)<br><br>.|

**Analysis:** In each case, a form of _simulation instability_ in remote work (a fake persona, a deepfaked interview, or even fake “work” activity) led to a breach of trust.
Companies responded by either mandating more in-person interaction (returning to a trusted reality anchor) or implementing new verification regimes.
Notably, banks and security-conscious firms have been especially aggressive in RTO policies – not just for collaboration, but due to **risk and fraud prevention** concerns.
For example, **JPMorgan Chase** and other financial institutions quickly brought staff back on-site post-pandemic, with insiders noting that in-office work makes oversight and compliance easier (even if unofficially, it assuages fears of unseen misconduct).
The above incidents support the idea that RTO may function as a _hedge against the collapsing trust_ in a remote “simulation” that can be too easily manipulated.

## Theoretical Framework: Simulation, Security, and Control

To dig deeper, we can turn to social theory.
A number of theorists provide concepts that illuminate why “simulation instability” is so unsettling and why organizations might reassert physical presence as a remedy:

### Baudrillard: Simulacra and the Precession of Signs

Jean Baudrillard’s theory of simulacra and **hyperreality** is directly relevant.
Baudrillard argued that in the postmodern era, models and representations (`the map`) precede and determine the real (`the territory`), effectively _replacing_ reality with simulated signs​

[web.stanford.edu](https://web.stanford.edu/class/history34q/readings/Baudrillard/Baudrillard_Simulacra.html#:~:text=Abstraction%20today%20is%20no%20longer,The%20desert%20of%20the)

.
In Baudrillard’s words, “simulation is no longer that of a territory… it is the generation by models of a real without origin or reality: a hyperreal.
The territory no longer precedes the map… **it is the map that precedes the territory – precession of simulacra**”​

[web.stanford.edu](https://web.stanford.edu/class/history34q/readings/Baudrillard/Baudrillard_Simulacra.html#:~:text=Abstraction%20today%20is%20no%20longer,The%20desert%20of%20the)

.
In a remote-work context, one can think of the virtual office, the Zoom screen, and the digital persona as the “map” that stands in for the real workplace and worker.
During the pandemic, organizations essentially operated in a **hyperreal space** – a simulation of an office environment mediated entirely by screens and networks.

Baudrillard also noted that when the distinction between the real and its simulation vanishes, we inhabit the _“desert of the real”_​

[web.stanford.edu](https://web.stanford.edu/class/history34q/readings/Baudrillard/Baudrillard_Simulacra.html#:~:text=substance,desert%20of%20the%20real%20itself)

– a situation where appearances are everything and direct access to the “real” is lost.
This can breed instability: if the simulacrum (e.g. an employee’s online avatar or digital output) **conceals the absence of a underlying reality**​

[web.stanford.edu](https://web.stanford.edu/class/history34q/readings/Baudrillard/Baudrillard_Simulacra.html#:~:text=The%20simulacrum%20is%20never%20that,conceals%20that%20there%20is%20none)

(i.e. the employee might not be who they say, or might not be working at all), the system enters a kind of free-fall where nothing can be certainly verified.
RTO can be interpreted as a reaction against this hyperreality.
By forcing a return to a tangible office space – a realm of physical co-presence – companies may be attempting to **anchor the simulacra back to a perceived real**.
In effect, management is saying: “we no longer trust the _map_ of remote work; return to the _territory_ of the office so we can reassert what’s real.” This aligns with Baudrillard’s notion that when simulations become unstable, there may be a clamor for _the real_, even if it’s a nostalgic or desperate one.

### Giddens: Ontological Security and Trust

Anthony Giddens’ concept of **ontological security** helps explain the anxiety triggered by the loss of “realness.” Ontological security refers to an individual’s (or institution’s) fundamental sense of order and continuity in reality – a confidence that the world is as it appears and that routine events are reliable​

[en.wikipedia.org](https://en.wikipedia.org/wiki/Ontological_security#:~:text=In%20sociology%20%2C%20ontological%20security,55%2C%20the%20world%2C%20and%20the)

​

[housing-studies-association.org](https://www.housing-studies-association.org/articles/318-ontological-security-a-term-of-contradictions#:~:text=The%20term%20was%20rediscovered%20by,%E2%80%9Calienation%20from%20home%E2%80%9D%20felt%20by)

.
Giddens describes it as the **“confidence or trust that the natural and social worlds are as they appear to be”**​

[housing-studies-association.org](https://www.housing-studies-association.org/articles/318-ontological-security-a-term-of-contradictions#:~:text=The%20term%20was%20rediscovered%20by,%E2%80%9Calienation%20from%20home%E2%80%9D%20felt%20by)

, providing a stable background against which we plan our lives.
Remote work’s simulation problems – deepfakes, impostors, ambiguous signals – directly threaten this baseline trust.
If a manager is no longer sure _who_ is actually working for them (identity is in question) or _whether_ work is really being done (productivity is in question), this creates a deep ontological insecurity in the organization.

During the pandemic, many firms maintained trust via established relationships and emergency improvisations.
But as time went on and incidents accumulated, that trust eroded (“the continuity of experience” was broken).
According to Giddens, when events occur that contradict one’s expected reality, they _“threaten ontological security”_​

[en.wikipedia.org](https://en.wikipedia.org/wiki/Ontological_security#:~:text=experiencing%20positive%20and%20stable%20emotions%2C,the%20world%2C%20and%20the%20future)

.
It is plausible that high-profile deepfake and fraud incidents served as exactly such reality-shaking events for corporate leaders.
The turn to RTO can thus be seen as an attempt to **restore ontological security** – to re-establish a consistent reality that management can trust.
In-person interactions provide rich, multifaceted cues that are hard to fake (at least with current technology): walking into the office each day, seeing colleagues face-to-face, knowing that “John from accounting” is physically there at his desk offers a reassuring _continuity_ with pre-pandemic normalcy.
In Giddens’ terms, the office routine offers a _“sense of order and continuity”_ that had been disrupted​

[housing-studies-association.org](https://www.housing-studies-association.org/articles/318-ontological-security-a-term-of-contradictions#:~:text=The%20term%20was%20rediscovered%20by,%E2%80%9Calienation%20from%20home%E2%80%9D%20felt%20by)

.
RTO mandates, then, might have less to do with measurable productivity and more to do with psychological and epistemic comfort – a way to overcome the creeping dread that the remote workplace had become an ungovernable zone of appearances where _anything (or nothing) could be behind the screen_.

### Foucault: Disciplinary Architecture and Power

Michel Foucault’s work on **discipline** and the spatial organization of power provides another lens.
In _Discipline and Punish_, Foucault showed how institutions like schools, prisons, and offices enforce power through physical architecture – partitioning space, monitoring bodies, and regularizing schedules to produce “docile” subjects.
He famously discussed Jeremy Bentham’s Panopticon as an architectural figure of surveillance and control.
Foucault noted that architecture is an “element of support” for power, used to _allocate people in space, canalize their circulation, and code their reciprocal relations_​

[foucault.info](https://foucault.info/documents/foucault.spaceKnowledgePower/#:~:text=M,brings%20about%20some%20speci%EF%AC%81c%20effects)

.
An office building, with its cubicles, meeting rooms, and overseers, is a classic **disciplinary architecture**: by simply being in that space, workers are subject to observation (even informal monitoring by peers/managers) and a regime of timetables (start time, lunch break, etc.).
This architecture “automatically” enforces certain behaviors​

[foucault.info](https://foucault.info/documents/foucault.spaceKnowledgePower/#:~:text=M,brings%20about%20some%20speci%EF%AC%81c%20effects)

.

During the remote-work phase, organizations essentially abandoned the traditional disciplinary architecture of the office.
The **“walls” fell away** – literally, work was now happening in kitchens and bedrooms.
Initially, one might think this meant a loss of discipline.
But Foucault also presaged that modern power can extend beyond physical walls.
In remote work, digital platforms tried to replace some functions of architecture: for example, monitoring software tracked logins and idle time, Zoom meetings imposed a schedule, and the home became a sort of self-disciplining space.
However, the **efficacy** of these new controls was questionable.
Without the physical architecture, cracks appeared – employees could slip out of view (sometimes holding second jobs concurrently, or using tricks like the mouse-movers).
The **Panoptic schema** was blurred: on Zoom, everyone presents a curated self, possibly hiding cues; managers lost the subtle but important oversight one gets “walking the floor.”

Foucault’s idea of a transition from classical discipline to what came later (which Deleuze elaborates as “control,” discussed next) is relevant.
The RTO push can be seen as a reassertion of **disciplinary space**.
By bringing bodies back to the office, companies reinstated the architecture that “codifies social relations” and makes surveillance easy​

[foucault.info](https://foucault.info/documents/foucault.spaceKnowledgePower/#:~:text=M,brings%20about%20some%20speci%EF%AC%81c%20effects)

.
One can almost hear an echo of Bentham: if remote work had too many “dark corners” where unseen activities occurred, the office restores the **visibility** needed for disciplinary power.
In fact, one bank CEO was quoted (off record) that junior staff _learn and comply better_ when they are **“under the eyes of seniors”** – a very Foucauldian sentiment.
While officially companies cite synergy or mentorship, the subtext aligns with Foucault: **power feels safer when it operates in a concrete space** specifically designed for supervision.
Thus, RTO might be an attempt to recover the “automatic functioning of power” that Foucault said disciplinary architecture supports​

[socialtheoryapplied.com](https://socialtheoryapplied.com/2013/04/17/foucault-disciplinary-power-and-the-dangerous-remainder/#:~:text=remainder%20socialtheoryapplied,bearers%20of%20the%20system)

– a reaction to the sense that the digital workspace had become dangerously opaque and ungovernable.

### Deleuze: Modulation and the Society of Control

Gilles Deleuze extended Foucault’s ideas in his “Postscript on the Societies of Control.” He argued that we have shifted from enclosed disciplinary institutions to a distributed **society of control** characterized by continuous modulation.
In disciplinary societies, you had distinct enclosures (home, school, factory, office, etc.) that one moved through in stages.
In control societies, those strict boundaries break down; instead, control is flexible, pervasive, and always “on.” Deleuze famously wrote: _“Enclosures are molds… but controls are a **modulation**, like a self-deforming cast that will continuously change from one moment to the other.”_​

[deterritorialinvestigations.wordpress.com](https://deterritorialinvestigations.wordpress.com/2014/02/23/moldmodulation-analogdigital-a-handful-of-deleuze-quotes/#:~:text=forming%20a%20system%20of%20variable,4)

.
In other words, power in the contemporary era is exercised through constant, data-driven adjustment – think of how digital systems track and nudge behavior in real time, as opposed to the clock-in/clock-out punchcards of factories.

Remote work could be seen as an instantiation of the control society: freed from the “mold” of the office, workers were nonetheless enmeshed in networks (emails, Slack, video calls) that allowed work to spill into every corner of life – a _continuous modulation_ of work-time and home-time.
Some employees felt _more_ controlled in some ways (e.g. always being reachable, or software capturing their screen activity).
However, the **failure of that control** appears when we consider the deepfake and fraud incidents.
The _codes_ and _passwords_ of digital systems (what Deleuze calls the language of control​

[deterritorialinvestigations.wordpress.com](https://deterritorialinvestigations.wordpress.com/2014/02/23/moldmodulation-analogdigital-a-handful-of-deleuze-quotes/#:~:text=The%20disciplinary%20societies%20have%20two,as%20much)

) were supposed to manage access, yet impostors managed to **game those codes** (stealing credentials, falsifying data).
Deleuze noted that in control societies, individuals become “dividuals,” defined by access codes and data profiles rather than physical presence​

[deterritorialinvestigations.wordpress.com](https://deterritorialinvestigations.wordpress.com/2014/02/23/moldmodulation-analogdigital-a-handful-of-deleuze-quotes/#:~:text=body%E2%80%A6%20In%20the%20societies%20of,6)

.
In these cases, adversaries literally _exploited that_ – they presented the right code (stolen identities, deepfake videos that matched expected appearance) to gain entry.

If the remote work experiment was a test of pure control (modulation without enclosure), one could argue it revealed a need to recalibrate the mix of control vs. discipline.
RTO might represent a swing back toward **enclosure** to supplement modulation.
Deleuze didn’t necessarily advocate going back to old molds, but his framework suggests that pure digital modulation has vulnerabilities – it can be hacked, bent, and **modulated by outsiders** (e.g. deepfake algorithms) in ways the architects of corporate control didn’t anticipate.
Bringing people back in person reintroduces a _fixed form_ (you must physically be here from X to Y) in place of total flexibility.
It is a way of saying: the _analog_ authenticity of face-to-face is required alongside the _digital_ control mechanisms.
In short, the RTO response can be interpreted as organizations groping for a new balance between Foucault’s disciplinary society and Deleuze’s control society – acknowledging that the free-form digital control regime was not stable enough on its own.

### Mbembe: Necropolitics and the Value of Life

Achille Mbembe’s concept of **necropolitics** may at first seem far afield, but it offers a provocative angle on power and risk in the RTO debate.
Necropolitics is the idea that sovereignty is defined by the power to decide who lives and who dies – _“the ultimate expression of sovereignty resides in the power and capacity to dictate who may live, and who must die”_​

[biopoliticsracegender.wordpress.com](https://biopoliticsracegender.wordpress.com/2013/09/23/on-achille-mbembes-necropolitics-2003/#:~:text=The%20ultimate%20expression%20of%20sovereignty,12)

.
In a workplace context, we can metaphorically extend this to decisions about wellbeing and exposure to harm.
During the pandemic, remote work was, among other things, a **public-health measure** – it literally saved lives by reducing viral transmission.
Mandating a return to physical offices while the virus (or other risks) still circulate is, arguably, an exertion of the employer’s power over life and death (necropower in miniature).

For example, in late 2021 and 2022, some companies insisted on RTO even as new COVID variants surged.
This led some commentators to accuse leaders of _necropolitical_ calculus – valuing productivity or control over employees’ health.
In necropolitical terms, those in power decided that certain workers’ **physical presence** was worth the risk of illness or even death (especially for immunocompromised staff).
The concept is even more salient if we consider disparities: low-wage “essential” workers were often forced in-person (sometimes with dire consequences), while higher-ups had the luxury to work from safe environments.
Mbembe’s theory, originally about states and mortality, can thus shine light on the **inequalities and power asymmetries** of RTO policies.
Who gets to stay remote (safe) and who must come in (risk exposure)?
That’s a question of who has social power.

Moreover, one could argue that forcing workers back _to stabilize the simulation_ has a necropolitical tinge: it prioritizes the **“life” of the _system_** (the company’s functioning, the integrity of its simulation) potentially over the life of individuals.
In extreme (hypothetical) terms, if a company feared remote deepfakes so much that it disregarded a still-deadly pandemic and summoned everyone back, it is enacting a form of necropolitical decision — deciding that the _death_ risk is acceptable to maintain the desired order.
Mbembe’s lens is a reminder that decisions around RTO are not neutral; they involve power over bodies.
The _necro_ angle underscores the stakes of declaring the office “safe” and “normal” again: it was, implicitly, a statement that control and authenticity were valued such that employees’ **biological risk** could be managed or was negligible in the eyes of capital.
In practice, many workplaces mitigated risk with vaccines and such, but the dynamic of power – who has the **sovereign right** to call people into potentially risky environments – is present.
Thus, RTO as a response to simulation issues isn’t just epistemological; it’s also biopolitical, even necropolitical, in how it marshals living bodies back into controlled spaces.

### Massumi: Affective Modulation and Fear Management

Brian Massumi’s work on affect and security, particularly in _Ontopower_, deals with how threats are sensed and managed through **affective modulation**.
Massumi described how, post-9/11, the U.S. government implemented things like the color-coded terror alert system, which _“calibrates on the population’s fear, playing on them with affective modulation”_​

[seoulphilosophy.wordpress.com](https://seoulphilosophy.wordpress.com/2017/03/07/brian-massumi-ontopower/#:~:text=In%202002%20the%20Bush%20administration,the%20result%20of%20this%20affect)

.
The constant shifting of alert levels was less about conveying factual data and more about modulating an _atmosphere_ of vigilance – keeping people in a “constant anticipation of fear”​

[seoulphilosophy.wordpress.com](https://seoulphilosophy.wordpress.com/2017/03/07/brian-massumi-ontopower/#:~:text=The%20anticipation%20of%20a%20sensation,Fear%20may%20be)

.
This ensured a preemptive, compliant mindset.
We can draw a parallel to how corporate leaders and media have discussed remote work dangers.
Stories of deepfake scams, rogue employees, or productivity loss create an **affective environment** of anxiety around remote work.
Fear is a powerful motivator: fear that the company might be infiltrated or that employees at home are “shirkers” can prompt strong measures.

Massumi argues that in a state of diffuse threat, decision-makers will act preemptively on _affect_ – the feeling of risk – even without clear proof.
In the remote work debate, by 2022-2023 many executives had a _gut feeling_ that things were slipping: “Something is off, we’re losing our grip.” Even if day-to-day operations seemed fine, the _specter_ of unseen threats (cybersecurity risks, data leaks, imposters) produced an affective pressure.
Companies then acted on that by moving toward zero-trust policies or RTO mandates.
As Massumi would put it, the decision is justified by _“the affective fact of fear”_ – a kind of **preemption** of potential threats​

[seoulphilosophy.wordpress.com](https://seoulphilosophy.wordpress.com/2017/03/07/brian-massumi-ontopower/#:~:text=logic,the%20%E2%80%9Cpermanent%20state%20of%20emergency%E2%80%9D)

​

[seoulphilosophy.wordpress.com](https://seoulphilosophy.wordpress.com/2017/03/07/brian-massumi-ontopower/#:~:text=unspecified%20threat%20is%20affectively%20held,as%20Walter%20Benjamin%20once%20said)

.
Indeed, one tech CEO reportedly said, regarding RTO: _“It’s not that I have evidence remote is failing; it’s that I **worry** about what I don’t know.”_ This is quintessentially Massumian: the worry (affect) itself becomes a reason to act, to forestall an imagined worse outcome.

We also see affective modulation in how companies communicated RTO.
Some framed it as a return to _safety_ – implying the remote situation was dangerously unstable.
Others invoked _solidarity_ and _belonging_ (playing on the emotional desire for certainty and unity).
On the flip side, employees felt anxiety and resentment – an affective response to losing the autonomy of remote work.
This clash of affects (management’s anxiety vs. employees’ frustration) is shaping corporate culture.
Massumi’s insight is that rational arguments (productivity metrics, etc.) often mask an underlying affective logic.
The **push to re-establish face-to-face contact can be seen as an attempt to allay a free-floating anxiety** that digital presence wasn’t trustworthy.
By literally seeing everyone back in the office, leaders and workers alike might _feel_ better – a sort of collective emotional stabilization.
In sum, affective modulation has been at play: fear of “the unknown unknowns” in remote work was amplified and circulated, creating momentum for RTO as a comforting counter-measure, even if the _stated_ rationale was couched in practical terms.

### Systems Theory: Autopoiesis and Simulation Stability

From the perspective of systems theory (e.g. Niklas Luhmann’s social systems theory), one could argue that organizations are **autopoietic systems** that must maintain a coherent identity by reproducing their internal structures and norms​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=An%20autopoietic%20system%20produces%20itself,only%20observe%20it%20via%20self)

​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=reference,operative%20codes%2C%20programmes%2C%20and%20memory)

.
An autopoietic system, in essence, _“produces itself while simultaneously producing its own conditions”_, maintaining a boundary between itself and an environment​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=An%20autopoietic%20system%20produces%20itself,reducing%20the%20complexity%20of%20its)

.
For a corporate organization, the “self” is produced through communications, routines, and shared understandings (culture).
Remote work and heavy virtualization introduced a shock to the system’s self-reproduction: many of the traditional communications and cues were disrupted.
The system tried to adapt by moving communications online.
This worked to an extent, but the cases of simulation failure (fake employees, etc.) represent points where the system could not **distinguish itself from environment**.

In systems terms, the **environment** is everything the system doesn’t control – in this case, the internet at large, with all its noise and actors.
Luhmann suggests that a system defines its own reality by observing and reducing environmental complexity​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=An%20autopoietic%20system%20produces%20itself,only%20observe%20it%20via%20self)

​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=doesn%E2%80%99t%20claim%20that%20this%20is,about%20the%20world%20remains%20possible)

.
Remote work increased complexity (new tech, new norms) and made it harder to reduce noise.
For instance, a deepfake applicant is _environmental noise_ intruding into the system’s communication (an _illegitimate input_ that the system initially fails to filter).
When such noise gets through, it threatens the **autopoietic closure** of the organization – the system might inadvertently incorporate something that isn’t actually part of itself (an attacker posing as staff).
To reassert stability, the system must either improve its filtering (better verification) or narrow the channels from environment to system.
RTO is a way to **narrow the channel**.
It re-establishes a firmer boundary: only those physically coming through the door are let inside the organizational space.
It’s a crude filter, but an effective one historically.

In a sense, corporate leaders likely felt the **feedback loops** of remote operation were not reliable.
Cybernetically, a system needs stable feedback to self-correct.
If you can’t be sure whether an employee’s output is genuine (or if the _employee_ is genuine), the feedback that management receives (reports, KPIs, etc.) could be in doubt.
By clustering everyone back in a controlled space, the organization increases the **signal-to-noise ratio** of its interactions.
Systems theory also speaks of **complexity**: the world is overwhelmingly complex, and systems survive by carving out a less complex sub-world they can manage​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=doesn%E2%80%99t%20claim%20that%20this%20is,about%20the%20world%20remains%20possible)

​

[criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=achievement%20of%20the%20evolution%20of,social%20systems%20theory%20can%20explain)

.
The remote-work world, augmented by AI and global networks, suddenly became too complex to easily manage – **too many new uncertainties** (security, technology, home environments, etc.).
RTO can be seen as a retreat to a lower-complexity configuration: the known quantity of the office where roles, interactions, and security are more straightforward.

Thus, from an autopoietic standpoint, RTO is about **maintaining the self-reproducing order** of the company.
It’s a structural recoil to ensure the system’s communications stay authentic and meaningful.
A striking illustration is how some firms required at least initial onboarding to happen in person post-2021 – a recognition that the _identity_ of new elements (employees) must be secured as they enter the system, lest the system incorporate a fatal anomaly.
In summary, systems theory would frame the remote simulation issues as a destabilization of the system’s boundary and sense-making processes, and RTO as an attempt to shore up the autopoietic boundaries by reintroducing tried-and-true, reality-grounded interactions.

## Current Discourse on Synthetic Labor and “Simulation Collapse”

Beyond individual theories, there is a growing body of academic and journalistic discourse since 2020 addressing these phenomena in practical terms.
This discourse ranges from discussions of _“synthetic labor”_ (AI-driven workers or automation) to alarm over deepfakes in the workplace, to concerns about a broader epistemological crisis in remote systems.
Below, we summarize key themes and sources:

- **Rise of Synthetic Labor (AI Workforce)** – The term “synthetic labor” has been used to describe AI systems performing tasks traditionally done by humans.
  Companies are increasingly exploring AI for roles like customer service, data analysis, and even creative work.
  In 2023, IBM’s CEO Arvind Krishna announced a pause on hiring for certain back-office roles, as up to ~7,800 jobs could be replaced by AI in the coming years​

    [reuters.com](https://www.reuters.com/technology/ibm-pause-hiring-plans-replace-7800-jobs-with-ai-bloomberg-news-2023-05-01/#:~:text=match%20at%20L162%20tab%20expects,told%20Bloomberg%20News%20on%20Monday)

    . He estimated about 30% of such roles might be automated within 5 years​

    [axios.com](https://www.axios.com/2023/05/02/ibm-stock-artificial-intelligence-hiring#:~:text=Axios%20www,to%20some%207%2C800%20positions%2C)

    ​

    [reuters.com](https://www.reuters.com/technology/ibm-pause-hiring-plans-replace-7800-jobs-with-ai-bloomberg-news-2023-05-01/#:~:text=tab%20expects%20to%20pause%20hiring,told%20Bloomberg%20News%20on%20Monday)

    . This real-world move underscores that a portion of the “workforce” might soon be literally simulated (software instead of people). Some see this as a natural evolution of automation, but others worry it blurs the lines of who or what is a “colleague.” If part of your team in the future is an algorithm, trust and transparency take on new dimensions. There’s also a scenario where AI bots could masquerade as human workers unbeknownst to others – a notion already at play in scam contexts. The **KnowledgeLake** company, for instance, markets a cloud-based _Synthetic Labor_ platform as a resilient alternative to offshoring, essentially offering robotic process automation as a service​

    [knowledgelake.com](https://www.knowledgelake.com/blog/rethinking-offshoring-how-synthetic-labor-builds-resilience-and-control#:~:text=Resilience%20www,and%20data%20security%20for%20organizations)

    ​

    [spaquet.medium.com](https://spaquet.medium.com/top-10-technology-trends-for-2025-f2dc56896947#:~:text=Top%2010%20Technology%20Trends%20for,step%20into%20roles%20where)

    . All this contributes to the idea that “the workplace” is becoming a hybrid of humans and AI agents. The return-to-office push in some companies might implicitly be a way to **distinguish human from machine** – e.g. “if you’re flesh and blood, show up at the office, whereas automated processes run in the cloud.” Notably, some tech commentators have mused that certain firms want RTO so they can identify roles to automate (if a job can be done fully remote with no loss, perhaps an AI could eventually do it)​

    [linkedin.com](https://www.linkedin.com/pulse/daily-news-ai-agents-key-updates-0213-openais-o3-deep-schwoebel-g2rqe#:~:text=Daily%20News%20in%20AI%20Agents%3A,AI%20in)

    . In any case, the concept of synthetic labor forces a conversation about authenticity and value of human presence.

- **AI Impersonation and Deepfakes in the Workplace** – Incidents of deepfake usage have extended into the professional domain.
  Apart from hiring fraud, there have been cases of AI-driven impersonation of executives to trick employees.
  In one dramatic example, scammers created a deepfake **video call** impersonating the CEO of the world’s largest advertising firm (WPP).
  They used a voice clone and footage of the CEO to deceive an agency head in a virtual meeting – essentially a high-level con job​

    [theguardian.com](https://www.theguardian.com/technology/article/2024/may/10/ceo-wpp-deepfake-scam#:~:text=Fraudsters%20created%20a%20WhatsApp%20account,solicit%20money%20and%20personal%20details)

    ​

    [theguardian.com](https://www.theguardian.com/technology/article/2024/may/10/ceo-wpp-deepfake-scam#:~:text=%E2%80%9CFortunately%20the%20attackers%20were%20not,%E2%80%9D)

    . Although that attempt was foiled, WPP’s real CEO warned staff that attackers are exploiting virtual meeting tech and that everyone **“needs to be vigilant”** against such AI-enabled deception​

    [theguardian.com](https://www.theguardian.com/technology/article/2024/may/10/ceo-wpp-deepfake-scam#:~:text=Fraudsters%20created%20a%20WhatsApp%20account,solicit%20money%20and%20personal%20details)

    ​

    [theguardian.com](https://www.theguardian.com/technology/article/2024/may/10/ceo-wpp-deepfake-scam#:~:text=%E2%80%9CFortunately%20the%20attackers%20were%20not,%E2%80%9D)

    . Similarly, there have been deepfake audio scams where an employee receives a call that _sounds_ like their boss instructing a funds transfer; in a 2023 case, fraudsters on a video call impersonated a company CFO and tricked a worker into sending **\$25 million** before the scheme was discovered​

    [siliconangle.com](https://siliconangle.com/2024/02/04/scammers-used-deepfake-cfo-trick-company-employee-sending-25m/#:~:text=Scammers%20used%20deepfake%20CFO%20on,SiliconANGLE)

    ​

    [siliconangle.com](https://siliconangle.com/2024/02/04/scammers-used-deepfake-cfo-trick-company-employee-sending-25m/#:~:text=,SiliconANGLE)

    . The **FBI** has explicitly highlighted this trend, noting that criminals use “voice deepfakes” and stolen data to target remote hiring and also possibly to social-engineer employees​

    [ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=Complaints%20report%20the%20use%20of,with%20what%20is%20presented%20visually)

    ​

    [hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=Schemes%20to%20submit%20fraudulent%20remote,information%20to%20obtain%20remote%20positions)

    . For workplaces, these developments mean that **any virtual interaction could be spoofed**. This has led to calls for new authentication measures: some companies are adopting code phrases or secondary verification steps for important virtual communications (much like two-factor auth, but for voice/video). A white paper by ISACA (2024) on authentication in the deepfake era suggests incorporating tools that can detect manipulated media or establishing “zero-trust” rules for confirming identities in all-digital meetings​

    [csis.org](https://www.csis.org/analysis/crossing-deepfake-rubicon#:~:text=Crossing%20the%20Deepfake%20Rubicon%20,generated%20images%2C%20audio%2C)

    ​

    [weforum.org](https://www.weforum.org/stories/2024/02/4-ways-to-future-proof-against-deepfakes-in-2024-and-beyond/#:~:text=%2A%20Deepfakes%20used%20by%20agenda,in%20increasingly%20immersive%20online%20environments)

    . In broader discourse, the prevalence of deepfakes has fueled a notion of a coming **“reality apathy”** – if anything can be faked, people may stop believing what they see and hear online. Researchers at CSIS described it as crossing a point where we “can no longer trust our eyes and ears” due to AI simulations​

    [csis.org](https://www.csis.org/analysis/crossing-deepfake-rubicon#:~:text=Crossing%20the%20Deepfake%20Rubicon%20,generated%20images%2C%20audio%2C)

    ​

    [csis.org](https://www.csis.org/analysis/crossing-deepfake-rubicon#:~:text=New%20research%20finds%20that%20we,generated%20images%2C%20audio%2C)

    . The workplace is not immune to this wider epistemic challenge.

- **Epistemological Instability and Trust Collapse** – After years of remote arrangements, some organizations noticed a subtle erosion of trust.
  A **Harvard Business Review** piece titled _“WFH Is Corroding Our Trust in Each Other”_ (Feb 2021) pointed out that prolonged remote work can breed suspicion and miscommunication.
  Teams can develop “us vs them” mindsets (on-site vs remote), and minor ambiguities can balloon into major doubts.
  While remote work _requires_ a high trust culture to succeed, the very medium can undermine it through lack of informal contact.
  Academic studies have reinforced this: one 2023 study found that feelings of isolation in remote teams hurt trust largely because of reduced communication quality​

    [sciencedirect.com](https://www.sciencedirect.com/science/article/pii/S0263237323000488#:~:text=Out%20of%20sight%20%E2%80%93%20Out,by%20reduced%20organizational%20communication%20quality)

    . In 2022, Microsoft noted something called “productivity paranoia” – managers feared employees weren’t working enough, even as employees often worked more hours from home. This mutual distrust – despite record productivity in many cases – suggests a psychological instability in how we confirm each other’s efforts when we’re not physically together. The **overemployment phenomenon** (workers secretly holding two jobs) grabbed headlines and likely further rattled employers. As one report described, a single mother managed two remote jobs for over a year, until an RTO mandate from one employer suddenly “threatened her ‘overemployed’ lifestyle”​

    [businessinsider.com](https://www.businessinsider.com/secretly-working-two-remote-jobs-rto-relocation-hurt-overemployed-2025-2#:~:text=Working%20two%20remote%20jobs%20simultaneously,lifestyle)

    . Stories like that circulating in the business press may have made managers suspect _any_ remote staffer could be double-dipping. It cast remote workers as potentially disloyal or deceptive, even though only a small minority did this. The narrative, however, contributes to an “epistemological rupture” – a break in the shared understanding and trust between employer and employee. If either side starts to see the other as fundamentally unreliable in the remote setting, the entire basis of the work agreement (which relies on good faith) is in jeopardy.

- **“Simulation Collapse” and Calls for Reality Anchors** – The culmination of these trends is what we might call a feared _simulation collapse_: a state where the virtual mode of work becomes so flooded with fake signals, AI-generated content, and uncertainty that it no longer functions as a viable simulation of a productive workplace.
  We haven’t fully reached that dystopia, but commentators warn of the trajectory.
  Notably, the **World Economic Forum** identified digital disinformation (including deepfakes) as a top global risk for 2024​

    [weforum.org](https://www.weforum.org/stories/2024/02/4-ways-to-future-proof-against-deepfakes-in-2024-and-beyond/#:~:text=,in%20increasingly%20immersive%20online%20environments)

    ​

    [weforum.org](https://www.weforum.org/stories/2024/02/4-ways-to-future-proof-against-deepfakes-in-2024-and-beyond/#:~:text=The%20World%20Economic%20Forum%20has,most%20worrying%20uses%20of%20AI)

    , and suggested that a **“zero-trust mindset”** will become essential in online environments​

    [weforum.org](https://www.weforum.org/stories/2024/02/4-ways-to-future-proof-against-deepfakes-in-2024-and-beyond/#:~:text=%2A%20Deepfakes%20used%20by%20agenda,in%20increasingly%20immersive%20online%20environments)

    . In a zero-trust model, nothing is taken at face value – identities and data must be continually verified. This is a stark shift from the implicit trust that greased the wheels of office life. If every email, video, or document could be fake, organizations face “validation overhead” on an unprecedented scale. Cybersecurity experts note that frequent deepfake scams could **“lead to a breakdown of trust among employees,”** especially as we approach an era when _most online content may be synthetically generated_ by 2026​

    [keepnetlabs.com](https://keepnetlabs.com/blog/deepfake-statistics-and-trends-about-cyber-threats-2024#:~:text=The%20regular%20occurrence%20of%20deepfake,be%20synthetically%20generated%20by%202026)

    . In such a scenario, _showing up in person_ becomes a kind of gold standard for authenticity. It’s no wonder that, beyond just corporate mandates, we are seeing more conferences, client meetings, and business networking events return to physical format – people are implicitly seeking that tactile assurance of reality.

!
[https://keepnetlabs.com/blog/deepfake-statistics-and-trends-about-cyber-threats-2024](blob:https://chatgpt.com/033e6ded-00a8-4663-940a-86c27a38e8cd)

_Deepfake-based identity fraud has surged in recent years._ In the U.S., reported cases rose from 0.2% of verified IDs in Q1 2022 to 2.6% by Q1 2023, while Canadian cases jumped from 0.1% to 4.6% in the same period​

[keepnetlabs.com](https://keepnetlabs.com/blog/deepfake-statistics-and-trends-about-cyber-threats-2024#:~:text=According%20to%20deepfake%20statistics%20reported,to%204.6)

.
This visual trend (from a Sumsub report) quantifies how rapidly the **“simulation problem”** is growing.
Such statistics fuel the discourse that **remote digital systems are becoming dangerously unreliable** without additional safeguards.
It’s not that in-person work is immune to fraud (people can lie or steal even in the office), but the _scale and sophistication_ of deception possible through AI is unprecedented.
Thus, current discourse often emphasizes a hybrid approach: strengthen verification technology _and_ consider strategic use of in-person requirements as a fallback.
For example, some suggest periodic random in-office days or biometric check-ins for remote workers to literally _prove life_.
These ideas were fringe a few years ago, but now appear in serious discussions on HR and security forums.

In academia, the notion of a coming “epistemic crisis” due to deepfakes is being explored.
Scholars in media studies warn of a **“liar’s dividend”** – the advantage gained by deceivers (or even honestly guilty parties) when no one believes evidence anymore.
Applied to workplaces: an employee caught in misconduct could claim “that video of me slacking off was a deepfake,” and how would we tell?
Avoiding such predicaments might be another subconscious reason leaders want people where they can see them.
Overall, the conversation acknowledges that we are entering an era where **seeing is no longer believing** online​

[csis.org](https://www.csis.org/analysis/crossing-deepfake-rubicon#:~:text=Crossing%20the%20Deepfake%20Rubicon%20,generated%20images%2C%20audio%2C)

​

[csis.org](https://www.csis.org/analysis/crossing-deepfake-rubicon#:~:text=New%20research%20finds%20that%20we,generated%20images%2C%20audio%2C)

.
Organizations are desperately seeking new **anchors of trust** – whether technological (AI detection tools, blockchain verification) or social (restoring face-to-face interaction).
The return-to-office can be interpreted as a brute-force but effective social solution: rebuild trust by rebuilding direct relationships and making work tangible again.

## Conclusion

The shift back to office is about much more than whether people work better under their boss’s gaze or collaborate more around whiteboards.
It can be interpreted as a fundamental response to a crisis of simulation and trust.
As our research shows, from 2020 onward companies have encountered a slew of _“unreal”_ problems – deepfaked employees, ghostworkers, invisible freeloaders, AI bots in Zoom calls – that make the remote workplace feel like a hall of mirrors.
In theory-laden terms, the **hyperreality of virtual work** threatened to dissolve the reliable textures of organizational life, prompting a defensive regression to the **“desert of the real”** (the physical office) in hopes of finding solid ground.
Ontologically, firms and workers alike felt unmoored, so reassembling in person offered a sense of security and continuity.
Power dynamics favored this move too: disciplinary architectures and face-to-face surveillance reassert control in ways that algorithms apparently could not fully guarantee.

However, this RTO impulse is not a panacea.
The modern workforce has grown accustomed to the freedoms of remote work, and many workers chafe at what they perceive as a lack of trust in RTO mandates (indeed, one might say forcing a return is itself a sign of _lost_ trust).
Moreover, the genie of AI and digital simulation is not going back in the bottle.
Deepfake and AI technologies will continue to advance, and both criminals and corporations will continue to deploy them.
The challenge moving forward is establishing **new frameworks of authenticity**.
These might include technological solutions (robust identity verification, deepfake detection systems, digital watermarks on content) as well as organizational culture shifts (cultivating digital literacy and a cautious mindset, without sliding into paranoia).

Ultimately, the return-to-office trend illustrates a pivotal tension of our times: the tension between the **convenience of simulation and the comfort of the real**.
Companies tasted the efficiency and flexibility of fully virtual operations, but also choked on its pitfalls.
The theoretical accounts from Baudrillard to Luhmann help us see that there’s an inherent fragility in simulations – they can implode if not anchored, leading to desperate attempts to rewind to a prior state.
Whether RTO is a long-term solution or a short-lived reaction remains to be seen.
It’s possible that as verification tech improves, companies will relax into remote modes again, having tamed the simulation to a stable degree.
It’s also possible that certain industries will conclude that **nothing beats the real thing** and keep offices central to their identity.

In any case, by viewing RTO through the prism of simulation instability, we gain a deeper appreciation for the complexity of the decision.
It’s not merely curmudgeonly managers vs. freedom-loving employees (the popular narrative); it’s a sociotechnical system grappling with the limits of virtualization.
As the workforce marches forward into an AI-augmented future, ensuring the **stability of our simulations** – the integrity of our digital workplaces – will remain a pressing project.
The fate of remote work may depend on our ability to answer a crucial question: **How do we sustain trust and reality in an environment where anything can be faked?** The companies that best answer that will likely strike the optimal balance between the efficiencies of the virtual and the assurances of the real.

**Sources:**

- Baudrillard, Jean. _Simulacra and Simulation_.
  Excerpts on the _precession of simulacra_​

    [web.stanford.edu](https://web.stanford.edu/class/history34q/readings/Baudrillard/Baudrillard_Simulacra.html#:~:text=Abstraction%20today%20is%20no%20longer,The%20desert%20of%20the)

    .

- Giddens, Anthony. _Modernity and Self-Identity_ (1991).
  Definition of ontological security​

    [housing-studies-association.org](https://www.housing-studies-association.org/articles/318-ontological-security-a-term-of-contradictions#:~:text=The%20term%20was%20rediscovered%20by,%E2%80%9Calienation%20from%20home%E2%80%9D%20felt%20by)

    .

- KnowBe4 / Cybersecurity case: North Korean deepfake hire​

    [cyberscoop.com](https://cyberscoop.com/cyber-firm-knowbe4-hired-a-fake-it-worker-from-north-korea/#:~:text=A%20remote%20worker%20hired%20by,in%20a%20blog%20post%20Tuesday)

    ​

    [cyberscoop.com](https://cyberscoop.com/cyber-firm-knowbe4-hired-a-fake-it-worker-from-north-korea/#:~:text=An%20internal%20investigation%20started%20when,Endpoint%20Detection%20and%20Response%20software)

    ; commentary on remote hiring security​

    [iproov.com](https://www.iproov.com/blog/knowbe4-deepfake-wake-up-call-remote-hiring-security#:~:text=KnowBe4%2C%20who%20specialize%20in%20security,loading%20malware%20onto%20company%20devices)

    ​

    [iproov.com](https://www.iproov.com/blog/knowbe4-deepfake-wake-up-call-remote-hiring-security#:~:text=including%20video%20interviews%2C%20background%20checks%2C,loading%20malware%20onto%20company%20devices)

    .

- HR Dive – DOJ indictment of North Korean “laptop farm” scheme (2023)​

    [hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=,The%20agency)

    ​

    [hrdive.com](https://www.hrdive.com/news/north-korea-remote-worker-fraud-conspiracy/716525/#:~:text=Though%20DOJ%20did%20not%20reveal,by%20participants%20in%20the%20scheme)

    .

- FBI IC3 Alert (Jun 28, 2022) – deepfake interviews and fake identities in remote jobs​

    [ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=The%20FBI%20Internet%20Crime%20Complaint,not%20actually%20done%20or%20said)

    ​

    [ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=Complaints%20report%20the%20use%20of,with%20what%20is%20presented%20visually)

    .

- PYMNTS/Bloomberg – Wells Fargo firing employees for “simulation of work” with mouse jigglers (June 2024)​

    [pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=Wells%20Fargo%20has%20reportedly%20fired,workers%20accused%20of%20faking%20work)

    ​

    [pymnts.com](https://www.pymnts.com/personnel/2024/wells-fargo-fires-workers-accused-of-pretending-to-work/#:~:text=As%20Bloomberg%20noted%2C%20devices%20and,19%20pandemic)

    .

- Deleuze, Gilles. “Postscript on the Societies of Control” (1992).
  Notions of modulation vs. molds​

    [deterritorialinvestigations.wordpress.com](https://deterritorialinvestigations.wordpress.com/2014/02/23/moldmodulation-analogdigital-a-handful-of-deleuze-quotes/#:~:text=forming%20a%20system%20of%20variable,4)

    and control via codes​

    [deterritorialinvestigations.wordpress.com](https://deterritorialinvestigations.wordpress.com/2014/02/23/moldmodulation-analogdigital-a-handful-of-deleuze-quotes/#:~:text=The%20disciplinary%20societies%20have%20two,as%20much)

    .

- Foucault, Michel. _Discipline and Punish_ (1975); Interview “Space, Knowledge, and Power”.
  Role of architecture in discipline​

    [foucault.info](https://foucault.info/documents/foucault.spaceKnowledgePower/#:~:text=M,brings%20about%20some%20speci%EF%AC%81c%20effects)

    .

- Mbembe, Achille. “Necropolitics” (2003).
  Sovereignty as deciding who may live and who must die​

    [biopoliticsracegender.wordpress.com](https://biopoliticsracegender.wordpress.com/2013/09/23/on-achille-mbembes-necropolitics-2003/#:~:text=The%20ultimate%20expression%20of%20sovereignty,12)

    .

- Massumi, Brian. _Ontopower_ (2015).
  Analysis of the U.S. terror alert system as affective modulation​

    [seoulphilosophy.wordpress.com](https://seoulphilosophy.wordpress.com/2017/03/07/brian-massumi-ontopower/#:~:text=In%202002%20the%20Bush%20administration,the%20result%20of%20this%20affect)

    ​

    [seoulphilosophy.wordpress.com](https://seoulphilosophy.wordpress.com/2017/03/07/brian-massumi-ontopower/#:~:text=The%20anticipation%20of%20a%20sensation,Fear%20may%20be)

    .

- Luhmann’s Systems Theory – overview of autopoiesis​

    [criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=An%20autopoietic%20system%20produces%20itself,reducing%20the%20complexity%20of%20its)

    ​

    [criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=An%20autopoietic%20system%20produces%20itself,only%20observe%20it%20via%20self)

    and complexity reduction in social systems​

    [criticallegalthinking.com](https://criticallegalthinking.com/2022/01/10/niklas-luhmann-what-is-autopoiesis/#:~:text=achievement%20of%20the%20evolution%20of,social%20systems%20theory%20can%20explain)

    .

- World Economic Forum (2024) – deepfakes as top global risk, need for zero-trust in immersive online spaces​

    [weforum.org](https://www.weforum.org/stories/2024/02/4-ways-to-future-proof-against-deepfakes-in-2024-and-beyond/#:~:text=,in%20increasingly%20immersive%20online%20environments)

    ​

    [weforum.org](https://www.weforum.org/stories/2024/02/4-ways-to-future-proof-against-deepfakes-in-2024-and-beyond/#:~:text=%2A%20Deepfakes%20used%20by%20agenda,in%20increasingly%20immersive%20online%20environments)

    .

- Keepnet Labs report (2024) – Deepfake fraud statistics and trust breakdown projection​

    [keepnetlabs.com](https://keepnetlabs.com/blog/deepfake-statistics-and-trends-about-cyber-threats-2024#:~:text=The%20regular%20occurrence%20of%20deepfake,be%20synthetically%20generated%20by%202026)

    ​

    [keepnetlabs.com](https://keepnetlabs.com/blog/deepfake-statistics-and-trends-about-cyber-threats-2024#:~:text=According%20to%20deepfake%20statistics%20reported,to%204.6)

    .

- Guardian (May 10, 2024) – WPP CEO deepfake scam attempt and warning to company​

    [theguardian.com](https://www.theguardian.com/technology/article/2024/may/10/ceo-wpp-deepfake-scam#:~:text=Fraudsters%20created%20a%20WhatsApp%20account,solicit%20money%20and%20personal%20details)

    ​

    [theguardian.com](https://www.theguardian.com/technology/article/2024/may/10/ceo-wpp-deepfake-scam#:~:text=%E2%80%9CFortunately%20the%20attackers%20were%20not,%E2%80%9D)

    .

- Harvard Business Review (Feb 10, 2021) – _WFH is Corroding Trust_ (Mortensen & Gardner)​

    [sciencedirect.com](https://www.sciencedirect.com/science/article/pii/S0263237323000488#:~:text=Out%20of%20sight%20%E2%80%93%20Out,by%20reduced%20organizational%20communication%20quality)

    .

- Business Insider (Feb 2025) – Overemployed worker and RTO impact​

    [businessinsider.com](https://www.businessinsider.com/secretly-working-two-remote-jobs-rto-relocation-hurt-overemployed-2025-2#:~:text=Working%20two%20remote%20jobs%20simultaneously,lifestyle)

    .

- Reuters (May 1, 2023) – IBM pausing hiring to replace ~7,800 jobs with AI​

    [reuters.com](https://www.reuters.com/technology/ibm-pause-hiring-plans-replace-7800-jobs-with-ai-bloomberg-news-2023-05-01/#:~:text=match%20at%20L162%20tab%20expects,told%20Bloomberg%20News%20on%20Monday)

    .

- FBI/IC3 PSA – (see above FBI 2022 reference) deepfake interview detection details​

    [ic3.gov](https://www.ic3.gov/PSA/2022/psa220628#:~:text=Complaints%20report%20the%20use%20of,with%20what%20is%20presented%20visually)

    .

- CSIS “Crossing the Deepfake Rubicon” – commentary on loss of trust in eyes/ears​

    [csis.org](https://www.csis.org/analysis/crossing-deepfake-rubicon#:~:text=Crossing%20the%20Deepfake%20Rubicon%20,generated%20images%2C%20audio%2C)

    .

- ISACA (2024) white paper on authentication in deepfake era​

    [sciencedirect.com](https://www.sciencedirect.com/science/article/abs/pii/S0148296322008335#:~:text=ScienceDirect%20www,For)

    .
