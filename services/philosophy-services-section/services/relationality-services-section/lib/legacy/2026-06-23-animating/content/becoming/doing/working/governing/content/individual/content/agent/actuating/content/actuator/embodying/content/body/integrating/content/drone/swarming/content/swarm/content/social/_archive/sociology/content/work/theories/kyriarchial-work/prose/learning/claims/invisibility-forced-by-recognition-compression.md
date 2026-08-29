---
type: theorem
class: structural-impossibility
status: proof-sketch
symbol: "|\\mathcal{T}| < V(W) \\;\\Longrightarrow\\; \\mathrm{Inv}(W, R) \\neq \\emptyset \\;\\wedge\\; \\mathrm{Inv}(W, R) \\text{ is power-structured}"
depends-on:
  - articulation-work
  - invisible-labor
  - emotional-labor
  - reproductive-labor
  - requisite-variety
  - good-regulator-theorem
  - legibility-and-metis
  - classification-residuals
  - sociology-of-quantification
  - audit-society
  - kyriarchism
realizes:
  - structural-account-of-invisibility
  - cybernetic-feminist-identity
date-created: 2026-05-17
---

# Recognition compression forces invisibility; power structures determine whose

A theorem stating that no recognition system can render all work visible, and that *which* work becomes invisible is determined by the power-relations encoded in the recognition system's design.
The proof is a chained application of seven published results — Conant and Ashby (1970) on the good-regulator theorem, Ashby (1956) on requisite variety, Espeland and Stevens (2008) on the sociology of quantification, Bowker and Star (1999) on classification residuals, Scott (1998) on legibility and *metis*, Goodhart (1975) and Campbell (1976) on measurement under feedback, Strathern (2000) and Power (1997) on audit cultures — together with the forty-year feminist-CSCW empirical record of which workers' work falls into the structurally-forced residual.

The substantive consequence: "make work visible by better measurement" is *structurally impossible*, only *redistribution* of invisibility is available.
The political fight over which work is recognized is first-order, not corrective.

**What this contributes.** The substantive insight that recognition systems necessarily produce a power-structured residual is *Scott's* at book length (1998); the cybernetic apparatus that gives the residual its mathematical inevitability is *Ashby's* (1956) and *Conant-Ashby's* (1970); the classification-side of the residual is *Bowker-Star's* (1999); the audit-feedback dynamics are *Goodhart's* (1975), *Campbell's* (1976), *Power's* (1997), *Strathern's* (2000); the empirical record of which workers' work falls into the residual is the forty-year *feminist-CSCW tradition's*.
What is contributed here is the **formalization**: bringing the substantive argument into a precise categorical statement — a recognition function $R : \mathrm{Mor}(W) \to \mathcal{T} \cup \{*\}$, a defined residual $\mathrm{Inv}(W, R)$, lemmas chained into a stated theorem — that lets the corollaries be formally *derived* rather than separately asserted, that admits a quantitative refinement (Open downstream §1), and that provides preconditions checkable against specific historical recognition systems (Corollaries 3, 4, 6, 7 specialize the theorem to articulation work, reproductive labor, algorithmic management, and the recognition-design work-category respectively).
The formalization does for Scott's argument what Lawvere did for set theory and Joyal-Street did for string diagrams: it brings a body of substantive work into a frame where it composes with neighboring mathematical structures and supports formal derivation.
The substantive idea is not new here; the categorical apparatus through which the idea connects to the rest of mathematical work-theory is.

## Setup

Let $W$ be a category of work-acts: objects are states of some work-substrate; morphisms are work-acts that transition states.
A *recognition system* on $W$ is a pair $(R, \mathcal{T})$ where:

- $\mathcal{T}$ is a finite set of *recognized work-types*.
- $R : \mathrm{Mor}(W) \to \mathcal{T} \cup \{*\}$ is the *recognition function*, with $*$ denoting "not recognized as a work-type."

Define:

- $V(R) := R^{-1}(\mathcal{T}) \subseteq \mathrm{Mor}(W)$ — the *visible* morphisms.
- $\mathrm{Inv}(W, R) := R^{-1}(\{*\}) \subseteq \mathrm{Mor}(W)$ — the *invisible* morphisms.

Denote by $V(W)$ the *variety* of $\mathrm{Mor}(W)$ in Ashby's sense — the count of distinguishable disturbances the substrate presents to a regulator.

Examples of recognition systems: the formal accounting of an organization (visible = wage labor; invisible = household reproduction); the labor-law classification "work" / "non-work" (visible = employed time; invisible = caregiving, study, commuting, sleep-as-recovery); the productivity-tracking dashboard (visible = keystroke counts; invisible = thinking, talking, articulating); the algorithmic-management classifier (visible = log events; invisible = workarounds, repair, collegial assistance); the ERP system (visible = ticketed work; invisible = the articulation that makes tickets coherent); the state's employment statistics (visible = formal employment; invisible = informal labor, subsistence production).

## Statement

**Theorem (recognition compression forces invisibility; power determines whose).**

*Let $(R, \mathcal{T})$ be a recognition system on a work-category $W$ with $|\mathcal{T}| < V(W)$ — the case for any practical recognition system on any non-trivial work-substrate.
Then:*

(i) $\mathrm{Inv}(W, R) \neq \emptyset$ — invisibility is non-eliminable.

(ii) *The assignment* $R$ *is the output of a recognition-design work-category whose designers are positioned in the political-economic structure of the society in which* $R$ *operates; the partition* $\mathrm{Mor}(W) = V(R) \sqcup \mathrm{Inv}(W, R)$ *is therefore power-structured.*

(iii) *No refinement of* $R$ *(richer* $\mathcal{T}$, *more sensors, finer categories) can produce* $\mathrm{Inv}(W, R') = \emptyset$. *Refinement redistributes invisibility; it does not eliminate it.*

## Proof sketch

The proof chains seven published lemmas.

### Lemma 1 (Conant and Ashby 1970 — the good-regulator theorem)

*"Every good regulator of a system must be a model of that system."* For any system $S$ and any regulator $R$ that successfully regulates $S$ (in the sense of producing outputs that hold a goal variable within bounds), the regulator must contain an isomorphic copy of the relevant part of $S$'s state space.

*Specialization to recognition.* For $R$ to successfully recognize the work-acts in $W$ — to assign each morphism a type from $\mathcal{T} \cup \{*\}$ in a way that supports differential downstream action — $R$ must contain a model adequate to the variety of $W$.
By Conant-Ashby, if $R$'s model is *less* than the relevant part of $W$, regulation fails on the cells where the model under-represents the substrate.

### Lemma 2 (Ashby 1956 — the Law of Requisite Variety)

*"Only variety can absorb variety."* A regulator's variety must be at least the disturbance variety of the regulated.
Formally, if $V(D)$ is the variety of disturbances and $V(R)$ is the variety of regulator responses, then the variety of outcomes $V(O)$ satisfies $V(O) \geq V(D)/V(R)$.
Minimum outcome-variety (maximum regulation) requires $V(R) \geq V(D)$.

*Specialization to recognition.* The work-substrate $W$ presents disturbances $V(W)$ (the work-acts that occur and require classification).
The recognition system's variety is $V(R) = |\mathcal{T} \cup \{*\}| = |\mathcal{T}| + 1$.
If $|\mathcal{T}| + 1 < V(W)$, then by Ashby, the recognition system cannot distinguish all work-acts.
Some pair of distinct $f, g \in \mathrm{Mor}(W)$ must have $R(f) = R(g)$.

### Lemma 3 (Espeland and Stevens 2008 — quantification is constitutively simplifying)

Espeland and Stevens identify *commensuration* (the comparison of different entities according to a common metric) as the central social process underlying quantification, with *simplification* and *objectification* as constitutive features.
Simplification is not a contingent property of bad measurement; it is *what measurement does*.
A measure that did not simplify would not be a measure.

*Application.* Any recognition system $R$ that produces a finite taxonomy $\mathcal{T}$ is, by Espeland-Stevens, performing commensuration: it is asserting that all morphisms within $R^{-1}(t)$ count as "the same kind of work" for the system's purposes.
The fact that this assertion is *false at the morphism level* (the morphisms differ in respects the system cannot register) is constitutive of the assertion's being a recognition — it is what makes the taxonomy do work.

### Lemma 4 (Bowker and Star 1999 — classification residuals are structural)

In *Sorting Things Out*, Bowker and Star establish that every classification system has *residual categories* — "other," "miscellaneous," "not yet classified," "see notes" — and that residuals are *not eliminable* by improving the system.
Three reasons (ch. 1, ch. 5): (a) any finite classification leaves edges unclassified; (b) phenomena change faster than classifications update; (c) classifications encode the perspective of the classifier, so phenomena visible to other perspectives remain residual.

*Application.* The residual category in a recognition system is precisely $\mathrm{Inv}(W, R) = R^{-1}(\{*\})$.
Bowker-Star establish that this residual is non-empty by structural property of classification, not by accident or by failure of the classifier.
Moreover, Bowker-Star show (especially through their work on the ICD nosology and the Nursing Interventions Classification) that residuals are *systematically related* to the design perspective: which phenomena fall into the residual is determined by whose perspective the classification encodes.

### Lemma 5 (Scott 1998 — legibility produces a *metis* residual that is structurally populated by less-powerful groups' practical knowledge)

In *Seeing Like a State*, Scott argues that high-modernist projects of state legibility (scientific forestry, urban planning, cadastral mapping, collectivization, Tanzanian ujamaa villagization) systematically fail because the simplifications required for legibility destroy the *metis* — practical, contextual, local knowledge — that the prior arrangement depended on.
Scott's empirical record across the book's case studies:

- Scientific forestry (Prussia, 18th–19th centuries): the *Normalbaum* abstraction of forests as timber yields enabled state revenue extraction but destroyed the multi-use forest ecology that local users depended on; eventually destroyed the forests themselves.
- Cadastral mapping and rural settlement: state legibility required eliminating common lands, customary tenure, and complex inheritance patterns, transferring power from local communities to centralized authorities.
- The high-modernist city (Brasília, Chandigarh): planning for legibility produced cities that did not work as cities; the *favelas* and unplanned periphery housed the actual functional life.
- Soviet collectivization, Tanzanian ujamaa villagization, compulsory sedentarization: state-legible agriculture systematically destroyed the local knowledge required to farm the actual land.

Scott's central thesis: legibility's residual is *metis*, and *metis is systematically held by the less-powerful*.
State simplifications cannot capture metis without ceasing to be simplifications; but metis is what makes the underlying activity work.
So state-legible systems either capture (and destroy) metis or coexist parasitically with the metis they pretend to govern.

*Application to recognition.* Scott's argument is the substantive empirical version of the cybernetic claim.
Recognition systems are legibility projects.
Their residuals are populated by metis — the practical, contextual, local know-how that less-powerful workers have developed to make the substrate actually function.
Scott documents this at book length across multiple case studies; the cybernetic claim provides its formal ground.

### Lemma 6 (Goodhart 1975, Campbell 1976 — when a measure becomes a target, it ceases to be a good measure)

Goodhart's Law (originally published in a 1975 lecture, restated in Goodhart 1984): *"Any observed statistical regularity will tend to collapse once pressure is placed upon it for control purposes."* Campbell's Law (Campbell 1976): *"The more any quantitative social indicator is used for social decision-making, the more subject it will be to corruption pressures and the more apt it will be to distort and corrupt the social processes it is intended to monitor."*

Both are cybernetic-form statements: once $R$ becomes consequential, behavior on the substrate reorganizes to optimize for $R$.
The substrate now responds to $R$, so $R$'s variety must absorb not only the original disturbance variety but also the new behavior-shifts induced by $R$ itself — Ashby's law becomes a *moving target*.
The previously-adequate $R$ becomes inadequate.

*Application.* As any recognition system becomes consequential (compensation depends on it; reputation depends on it; resource allocation depends on it), behavior reorganizes around it.
Workers begin to perform the kind of work that $R$ recognizes (which is now over-counted) and stop performing the kind of work $R$ does not recognize (which is now even more invisible).
This produces a *moving residual*: the kinds of work pushed to $\mathrm{Inv}(W, R)$ shift over time as the substrate adapts, but the residual is never empty.

### Lemma 7 (Strathern 2000, Power 1997 — audit constitutes its object)

Marilyn Strathern's *Audit Cultures* and Michael Power's *The Audit Society* establish that once audit becomes pervasive, the relationship between auditor and audited becomes *constitutive* rather than descriptive: the audit creates the entities and behaviors it measures rather than passively recording pre-existing reality.
Strathern's formulation: "the measure becomes the measured."
Power: the audit society's universities, hospitals, and public services are now organizations whose primary activity is the production of auditable records, with the substantive work occurring in residual time around the audit's demands.

*Application.* Once $R$ becomes pervasive, the work-category $W$ itself reorganizes around $R$.
The morphisms that get performed are increasingly those that $R$ recognizes; the morphisms in $\mathrm{Inv}(W, R)$ are increasingly performed under conditions of denial that they are work at all.
The double-bind structure (Bateson 1972) emerges: workers performing $\mathrm{Inv}(W, R)$ work are told the work is valued, are required to perform it, and are denied recognition that it is work.

### Empirical premise (the feminist-CSCW invisibility record)

A forty-year empirical literature documents which morphisms get pushed to $\mathrm{Inv}(W, R)$ under specific historical recognition systems:

- Daniels 1987 ("Invisible Work"): women's unpaid domestic and community labor.
- Strauss 1985 ("Work and the Division of Labor"): articulation work in medical and scientific settings.
- Star and Strauss 1999 ("Layers of Silence, Arenas of Voice"): background work, indicator-summarization, and disembedding produce invisibility as structural feature.
- Suchman 1987 (*Plans and Situated Actions*) and 1995 ("Making Work Visible"): situated action, and the politics of visibility itself.
- Schmidt and Bannon 1992 ("Taking CSCW Seriously"): cooperative work systems fail when they automate substantive work but ignore articulation.
- Hochschild 1983 (*The Managed Heart*): emotional labor's structural uncountability.
- Hochschild 1989 (*The Second Shift*): the gendered distribution of household work after the paid workday.
- Glenn 1992 ("From Servitude to Service Work") and 2010 (*Forced to Care*): the racial division of paid reproductive labor.
- Federici 2004 (*Caliban and the Witch*) and 2012 (*Revolution at Point Zero*): the political history of capital's enclosure of reproductive work.
- Bowker and Star 1999 (*Sorting Things Out*): classification residuals and the invisible work of fitting things into categories.
- Star 1991 ("The Sociology of the Invisible"): the unified sociological program for invisibility as object of study.
- Star and Griesemer 1989 ("Institutional Ecology"): boundary objects coordinate distributed work whose underlying invisible-work cannot be made commensurate.

The empirical pattern across this literature: morphisms pushed to $\mathrm{Inv}(W, R)$ under specific historical recognition systems are systematically those performed by workers with less power in the kyriarchal structure — domestic, care, articulation, emotional, reproductive, infrastructural, classification-residual, boundary-spanning work, performed disproportionately by women, racialized workers, immigrants, and other marginalized groups.

### Assembly

(i) *Invisibility is non-eliminable.* By Lemma 2 (Ashby), $|\mathcal{T}| + 1 < V(W)$ implies the existence of distinct morphisms that $R$ cannot distinguish.
By Lemma 1 (Conant-Ashby), this means $R$ cannot successfully model the part of $W$ where collapse occurs, so regulation fails there.
By Lemma 3 (Espeland-Stevens) the collapse is constitutive of any classification, not a contingent design failure.
By Lemma 4 (Bowker-Star) the residual category in $R$ — that is, $\mathrm{Inv}(W, R)$ — is non-empty by structural property of classification.
By Lemma 5 (Scott), this residual is, in the legibility-projects Scott documents, systematically populated by *metis*.
So $\mathrm{Inv}(W, R) \neq \emptyset$ for any practical recognition system.

(ii) *The partition is power-structured.* By Lemma 4 (Bowker-Star), which phenomena fall into the residual is determined by whose perspective the classification encodes.
By Lemma 5 (Scott), the residual is empirically populated by metis held by less-powerful groups across multiple historical state-legibility projects.
By the feminist-CSCW empirical record, the residual under capitalist recognition systems is empirically populated by domestic, care, articulation, emotional, reproductive, infrastructural, classification-residual, and boundary-spanning work performed disproportionately by women, racialized workers, and others marginalized within the system that designs $R$.
The convergence across these published bodies of work establishes that $R$'s design is power-structured and that the partition $\mathrm{Mor}(W) = V(R) \sqcup \mathrm{Inv}(W, R)$ tracks the power-structure of the design context.

(iii) *Refinement redistributes, does not eliminate.* By Lemmas 6 (Goodhart-Campbell) and 7 (Strathern-Power), making $R$ richer or more consequential changes the substrate $W$ itself (behavior reorganizes around $R$; the audit constitutes its object).
The new substrate has its own variety, including new behaviors induced by $R$'s consequentiality; by Lemma 2 (Ashby) the recognition system's variety bound applies to this new substrate.
The residual reappears, now populated by different morphisms (typically: by the new workarounds, repairs, and articulation-acts that the previous $R$ pushed visibility-toward but the refined $R$'$$ does not yet capture; and by the algorithmic-decision logic of $R'$ itself, where applicable — see Corollary 6).
Total invisibility is not reduced; it is redistributed.

$\square$

## What this rules out

The theorem rules out a structurally well-defined class of projects:

**Comprehensive-measurement projects.** Any program promising to "make all work visible" through better instrumentation — quantified-worker dashboards (Ajunwa 2023), comprehensive ERP systems, productivity-tracking platforms, total-information-awareness regimes, agentic-orchestration systems claiming to render all work into trackable units — promises what Lemmas 1-5 jointly forbid.
Increasing $|\mathcal{T}|$ shifts which work is invisible (Lemma 6) but cannot eliminate the residual (Lemmas 1-5).
The promise is structurally impossible.

**Neutral-accounting reform projects.** Any program proposing to reform a recognition system by making it more "objective" or "complete" misunderstands the structure.
By Lemma 4 (Bowker-Star), all classifications encode a perspective; by Lemma 5 (Scott), high-modernist projects of perspective-elimination are precisely the ones that fail catastrophically.
The choice is never between a power-structured recognition system and a neutral one; it is between one power-structured system and another.

**Technocratic depoliticization projects.** Any framing that treats "what counts as work" as a technical question to be settled by better methodology — rather than as a political question to be settled by political contestation — evades the only available terrain.
By the empirical premise (the feminist-CSCW record), the technocratic framing is itself an artifact of the power-structure that designs the dominant recognition systems.

## Corollaries

### Corollary 1 — Better measurement is not a remedy (Goodhart, Campbell, Strathern, Power)

*Increasing $|\mathcal{T}|$ shifts which morphisms fall into $\mathrm{Inv}(W, R)$ but cannot eliminate the residual.
The substrate reorganizes around the richer $R$ (Goodhart-Campbell), and the new substrate has its own variety which the richer $R$ still cannot fully absorb.*

This is the formal version of the practitioner finding that "the measure becomes the measured" (Strathern 2000).
The "what gets measured gets done" management slogan is correct *and* implies the converse: what does not get measured does not get done, *or* gets done invisibly under conditions of denial, *or* migrates to workers with less standing to refuse it.

### Corollary 2 — Hawthorne effect generalized (Mayo 1933, Roethlisberger-Dickson 1939, Power 1997)

*Installing new measurement reorients which work is performed; workers optimize for what is measured.
Previously-visible work that becomes uncounted is now performed grudgingly or not at all; previously-invisible work that becomes counted produces a Goodhart shift (Lemma 6).
The total measure of invisibility is not reduced.*

The Hawthorne studies' classical finding — workers respond to *being attended to*, not to physical conditions per se — was framed as a methodological problem with experimental measurement.
Power's audit-society analysis (1997) extends this to all consequential measurement: the audit changes the audited.
The cybernetic-feminist reading: the Hawthorne effect is the mechanism by which any measurement redistributes invisibility.

### Corollary 3 — Articulation work is structurally invisible by design (Strauss 1985, Star-Strauss 1999, Schmidt-Bannon 1992)

*Strauss's articulation work — the work of getting work to mesh — falls into $\mathrm{Inv}(W, R)$ for any recognition system $R$ whose taxonomy $\mathcal{T}$ is built around substantive deliverables.
Articulation appears as the absence of breakdowns, not as a visible output.*

Strauss documented the empirical claim across medical-ward and scientific-laboratory ethnography.
The theorem provides the structural ground: articulation cannot be counted by a deliverable-taxonomy without becoming a deliverable itself, at which point the articulation-of-articulation becomes invisible (Lemma 4's residual now populated by the meta-articulation).
Schmidt and Bannon (1992) showed CSCW systems fail when they automate substantive work but ignore articulation; the failure is now visible as a structural prediction of the theorem.

### Corollary 4 — Reproductive-labor invisibility is structurally forced under capital (Federici 2004/2012, Dalla Costa-James 1972, Fortunati 1995, Folbre 2001)

*Any recognition system aligned with capital's value-extraction logic must push reproductive maintenance into $\mathrm{Inv}(W, R)$.
Counting reproductive labor as work would either require capital to pay wages for it (incompatible with the wage relation's design) or require recognizing relational-substrate work as belonging to the wage category (incompatible with the category's design).
By Lemma 4, the design choice forces the residual; by Lemma 5, the residual is then populated by metis (here, the practical knowledge of household reproduction held by women).*

Federici's historical-political claim (the witch-hunts as primitive accumulation of women's reproductive capacity; capital's continued externalization of reproduction onto unpaid women's labor) now has its structural ground.
The exclusion of reproductive labor from "work" is not historical contingency to be reformed away; it is what makes the capitalist recognition system *the capitalist recognition system*.
A recognition system that counted reproductive labor as wage-eligible work would not be a reformed capitalist system; it would be a different recognition system constituting a different mode of production.

### Corollary 5 — The political fight is first-order, not corrective (Suchman 1995)

*There is no neutral recognition system relative to which the feminist-CSCW critique is corrective.
The critique is the only available analysis of which work is invisible, because invisibility is forced by Ashby's Law before any political question arises.*

Suchman 1995 ("Making Work Visible") explicitly argued that making work visible is a political act, with consequences for recognition, valuation, and compensation.
The theorem strengthens this from a normative claim into a structural one: there is no apolitical alternative because there is no recognition system without a residual whose design is the operative political question.

### Corollary 6 — Algorithmic management relocates rather than reduces invisibility (Pasquale 2015, Ajunwa 2023, Fourcade-Healy 2024, Zuboff 2019)

*The quantified-worker regime (Ajunwa) and the ordinal society (Fourcade-Healy) increase the granularity of behavioral-data capture, making more low-level worker acts visible.
By the theorem, this does not reduce total invisibility.
The displaced invisibility appears in the algorithmic-decision system itself — the black box (Pasquale) where the new $R$'s logic is held — and in the algorithm-induced behavior shifts (Goodhart-Campbell applied to the new $R$).*

Pasquale's *Black Box Society* documents the opacity of algorithmic decision-systems; Ajunwa's *Quantified Worker* documents the surveillance side; Fourcade-Healy's *Ordinal Society* documents the ranking apparatus; Zuboff's *Surveillance Capitalism* documents the behavioral-prediction market.
The theorem provides their convergent structural claim: these are not new opacities to be fixed by algorithmic-transparency reforms; they are the relocated residual that the theorem requires must exist somewhere in the system.
Algorithmic-transparency reforms that increase $|\mathcal{T}|$ on the algorithm-decision substrate (auditable algorithms, explainable AI) will, by the theorem, produce their own residuals — likely in the data-pipeline construction, the training-set curation, and the feature-engineering choices.

### Corollary 7 — The recognition-design work-category is itself partially invisible (Bowker-Star 1999, Lampland-Star 2009)

*The recognition-design work-category $W'$ (whose substrate is $R$'s parameters and whose morphisms are decisions about $R$'s structure) is governed by its own recognition system $R'$, which by the theorem has its own $\mathrm{Inv}(W', R')$.
The work of designing recognition systems is structurally invisible to those affected by the systems — and partially invisible to the designers themselves.*

Bowker-Star's analysis of classification work (1999, esp. ch. 7-9 on the ICD and nursing classifications) and the Lampland-Star collection *Standards and Their Stories* (2009) document the work of designing classifications and standards — work that is itself rarely counted as work in the recognition systems the designers' organizations use.
The theorem extends recursively: at each meta-level, designing a recognition system is itself work governed by a meta-recognition system with its own residual.
Total invisibility is not eliminable at any level; it is displaced upward through the recognition hierarchy.

### Corollary 8 — Workers performing $\mathrm{Inv}(W, R)$ work face Batesonian double-binds (Bateson 1972; Hochschild 1983 on emotional labor's "feeling rules")

*Workers performing residual work that the system both requires and refuses to recognize receive contradictory signals: "your contribution is valued" while "your contribution is not counted."
By Bateson's double-bind analysis (Steps to an Ecology of Mind, 1972), repeated double-binds produce characteristic psychopathologies.
Hochschild's burnout finding for emotional-labor workers (1983) and Berardi's analysis of the soul-at-work (2009) document the specific psychopathologies in specific labor regimes.*

This corollary connects the theorem to occupational mental-health and the contemporary burnout epidemic.
The cybernetic-feminist reading: burnout in invisible-labor positions is not a defect of individual workers; it is the predictable psychopathological response to the structurally-forced double-bind that Lemma 7 (Strathern-Power) creates when audit cultures coexist with non-empty $\mathrm{Inv}(W, R)$.

## Status

`proof-sketch` because:

- Each of the seven lemmas is itself a published result with its own proof or empirical record; the theorem chains them but does not re-prove the individual lemmas.
  The chaining is what is established here.
- Lemma 2's "variety" notion requires careful treatment when $V(W)$ is taken as an effective rather than a literal count; a fully rigorous statement would specify how the substrate's distinguishable-acts variety is to be computed.
  The argument is robust under any reasonable specification, since for any human work-substrate the variety vastly exceeds any practical $|\mathcal{T}|$, but the formal specification is left open.
- The empirical premise (the feminist-CSCW record) is well-supported by the forty-year literature but is itself an empirical generalization, not a deductive consequence.
  The theorem is *conditional*: under the premise that $R$'s design is power-structured (which the empirical record establishes for every recognition system the feminist-CSCW tradition has examined), the partition is power-structured.
- The corollaries are presented as direct consequences but each could be developed into its own sub-theorem with more careful attention to the specific recognition systems at issue.

The directional content is what matters and follows from the cited lemmas: invisibility is forced (Ashby + Conant-Ashby + Bowker-Star + Scott + Espeland-Stevens), refinement redistributes rather than eliminates (Goodhart-Campbell + Strathern-Power), and the distribution of invisibility is power-structured (Bowker-Star + Scott + the feminist-CSCW record).

## Position in the published literature

The chained theorem assembles work from at least eight identifiable bodies of published literature:

- *Cybernetics and systems theory* (Wiener 1948/1950; Ashby 1956; Conant-Ashby 1970; Beer 1972/1974; Bateson 1972; Luhmann 1984).
- *Sociology of quantification* (Espeland-Stevens 2008; Porter 1995 *Trust in Numbers*; Desrosières 1993/1998 *The Politics of Large Numbers*).
- *Classification and infrastructure studies* (Bowker-Star 1999; Star 1991; Lampland-Star 2009).
- *Political-anthropological critique of state legibility* (Scott 1998).
- *Measurement-under-feedback / cybernetic-measurement* (Goodhart 1975/1984; Campbell 1976).
- *Audit cultures and the audit society* (Power 1997; Strathern 2000).
- *Feminist-CSCW invisibility tradition* (Strauss 1985; Daniels 1987; Star-Griesemer 1989; Hochschild 1983/1989; Suchman 1987/1995; Schmidt-Bannon 1992; Glenn 1992/2010; Federici 2004/2012; Bowker-Star 1999).
- *Contemporary algorithmic-governance critique* (Pasquale 2015; Eubanks 2018; Benjamin 2019; Zuboff 2019; Ajunwa 2023; Fourcade-Healy 2024).

Scott's *Seeing Like a State* is the closest book-length precedent for the substantive synthesis: Scott independently develops the legibility-residual argument and identifies the residual with metis held by less-powerful groups across multiple historical case studies.
Scott does not cite Ashby or Conant-Ashby and does not engage the cybernetic literature; conversely, Conant-Ashby do not engage Scott's case studies (which post-date them) or the feminist-CSCW tradition.
Bowker-Star explicitly connect classification residuals to power but do not invoke requisite variety.
Goodhart and Campbell state the cybernetic-form measurement claim but do not connect it to the feminist tradition.
Espeland-Stevens identify quantification as constitutively simplifying but do not invoke Ashby.

The theorem's contribution is the **categorical formalization** of an argument that has been substantively present in published work since 1956 (Ashby) and developed at book length by 1998 (Scott) and 1999 (Bowker-Star), but has not been brought into a single precise statement that:

1. *Defines its terms.* The recognition function $R : \mathrm{Mor}(W) \to \mathcal{T} \cup \{*\}$, the visible morphisms $V(R)$, and the residual $\mathrm{Inv}(W, R)$ are explicit set-theoretic objects.
  Specific recognition systems (wage labor, ERP, algorithmic management, ICD nosology) become specific functions to be analyzed; their residuals become specific sets to be characterized.
2. *Derives its corollaries.* Each of the eight corollaries follows by specialization of the theorem to a specific recognition system or by combining the theorem with a further cited result.
  The corollaries are not separately asserted; they are derived.
3. *Admits quantitative refinement.* The cardinality-based statement $|\mathcal{T}| < V(W)$ generalizes to entropy-based $H(\mathcal{T}) < H(W)$ statements (Open downstream §1), connecting the theorem to information theory and yielding lower bounds on $|\mathrm{Inv}(W, R)|/|\mathrm{Mor}(W)|$.
4. *Composes with neighboring categorical structures.* The recognition function $R$ is structurally a functor between the work-category $W$ and the discrete taxonomy $\mathcal{T} \sqcup \{*\}$; its kernel is a congruence; the residual is the preimage of a distinguished element.
  These are standard categorical constructions whose properties transfer.
5. *Is refutable in identifiable ways.* The theorem fails if any of its premises fails — if some practical recognition system can be exhibited with $|\mathcal{T}| \geq V(W)$ (no recognition system the surveyor is aware of meets this), or if the empirical premise (the feminist-CSCW record) is shown to misdescribe the population of $\mathrm{Inv}(W, R)$ in some specific historical case (this would be the productive form of disagreement).

Formalization is the contribution.
It is the same kind of contribution that Lawvere (1964) made by bringing set theory into category theory (the underlying set-theoretic content was Cantor's; the categorical apparatus made it compose with the rest of mathematics), that Lambek (1958) made by bringing grammar into category theory (the grammar was prior; the categorical reading made it compose with proof theory and computation), and that Joyal-Street (1991) made by formalizing monoidal categories as string diagrams (the diagrams were prior practice; the formalization made them rigorous compositional notation).
The theorem here does the analogous work for the body of feminist-CSCW invisibility scholarship and its cybernetic cousin: brings a substantive argument into a frame where it can be derived from, applied to, and refined by formal work in the rest of mathematical work-theory.

## Where used

- Connects to [articulation-work-and-invisible-labor-survey](../../../../texts/articulation-work-and-invisible-labor-survey.md) for the empirical record.
- Connects to [cybernetics-and-governance-survey](../../../governance/texts/cybernetics-and-governance-survey.md) for the cybernetic apparatus.
- Connects to [feminist-organizational-theory-survey](../../../governance/texts/feminist-organizational-theory-survey.md) for the broader feminist organizational analysis (Acker, Calás-Smircich, Martin, Federici, hooks).
- Connects to [platform-and-algorithmic-work-survey](../../../../texts/platform-and-algorithmic-work-survey.md) and [algorithmic-governance-and-governance-by-indicators-survey](../../../governance/texts/algorithmic-governance-and-governance-by-indicators-survey.md) for Corollary 6.
- Connects to [labor-process-theory-survey](../../../../texts/labor-process-theory-survey.md) for the Marx-Braverman frame in which Corollary 4 lands.
- Connects to [feedback-and-organizational-learning-survey](../../../../texts/feedback-and-organizational-learning-survey.md) for the cybernetic feedback machinery.
- Connects to [immaterial-labor-and-post-operaismo-survey](../../../../texts/immaterial-labor-and-post-operaismo-survey.md) for the Berardi connection in Corollary 8.

## Open downstream

- *Quantitative refinement.* Formalize $V(W)$ via information-theoretic entropy on the work-act distribution.
  A quantitative theorem would give $|\mathrm{Inv}(W, R)| / |\mathrm{Mor}(W)|$ as a function of the entropy gap $H(W) - \log|\mathcal{T}|$.
  Conjecture: for any practical work-substrate, this ratio is bounded below by a substantial constant.
- *Recursive recognition-design formalization.* Corollary 7 deserves its own statement as an iterated functor: the recognition-design work-category $W'$ has its own residual $\mathrm{Inv}(W', R')$, and the iteration $W \to W' \to W'' \to \cdots$ has its total-invisibility-measure conserved (or growing) at every step.
- *Double-bind formalization.* Corollary 8 deserves its own statement as a 2-cell in the work-category whose source is the "valued" claim and target is the "uncounted" reality, with no resolution morphism available — Bateson's pathological-feedback structure made categorical.
- *Algorithmic-relocation theorem.* Corollary 6 deserves its own statement: a recognition system $R$ refined via algorithmic instrumentation produces a new $R^{\mathrm{alg}}$ whose $\mathrm{Inv}$ is populated by the algorithm's decision-rules.
  The relocation can be formalized as a functor between the original recognition system and its algorithmic refinement, with the residual-mass conserved as a functorial invariant.
- *Specific historical recognition systems.* Each dominant recognition system (wage labor, social-security-classified work, ERP categories, platform-algorithmic classifications, household-economic intuitive sense, ICD nosology, Nursing Interventions Classification) admits a specific analysis of which morphisms its design pushes to $\mathrm{Inv}$ and what political configuration that pushing serves.
  The general theorem grounds these specific analyses without replacing them.
- *Constructive direction.* Scott (1998) ends with a constructive prescription: state simplifications should be designed with explicit awareness of metis they cannot capture, and policy should preserve the conditions under which metis can develop and operate.
  The theorem's constructive direction: recognition-system design should explicitly model its residual and contest its political distribution rather than denying its existence.
  The contemporary practice projects this gestures toward — participatory design (Greenbaum-Kyng 1991), feminist design justice (Costanza-Chock 2020), abolitionist design (Benjamin 2019) — would each merit their own analysis as attempts to design $R$ with explicit residual-awareness.

## Sources

**Cybernetics and systems theory:** - Ashby, W.
Ross. *An Introduction to Cybernetics*.
Chapman and Hall, 1956.
(Law of Requisite Variety.) - Conant, Roger C. and W.
Ross Ashby.
"Every Good Regulator of a System Must Be a Model of That System." *International Journal of Systems Science* 1(2), 1970, pp.
89–97.
(The good-regulator theorem.) - Wiener, Norbert. *Cybernetics: Or Control and Communication in the Animal and the Machine*.
MIT Press, 1948. - Wiener, Norbert. *The Human Use of Human Beings: Cybernetics and Society*.
Houghton Mifflin, 1950. - Beer, Stafford. *Brain of the Firm*.
Herder and Herder, 1972.
(Viable System Model; System 3*-audit as the function that fills the gap left by System 3.) - Beer, Stafford. *Designing Freedom*.
CBC Learning Systems, 1974. - Bateson, Gregory. *Steps to an Ecology of Mind*.
Ballantine Books, 1972.
(Double-bind.) - Luhmann, Niklas. *Social Systems*.
Stanford University Press, 1984; German original *Soziale Systeme*, Suhrkamp, 1984.

**Sociology of quantification, classification, and standardization:** - Espeland, Wendy Nelson and Mitchell L.
Stevens.
"A Sociology of Quantification." *European Journal of Sociology* 49(3), 2008, pp.
401–436. - Porter, Theodore M. *Trust in Numbers: The Pursuit of Objectivity in Science and Public Life*.
Princeton University Press, 1995. - Desrosières, Alain. *The Politics of Large Numbers: A History of Statistical Reasoning*.
Harvard University Press, 1998; French original *La politique des grands nombres*, La Découverte, 1993. - Bowker, Geoffrey C. and Susan Leigh Star. *Sorting Things Out: Classification and Its Consequences*.
MIT Press, 1999. - Star, Susan Leigh.
"The Sociology of the Invisible: The Primacy of Work in the Writings of Anselm Strauss."
In David R.
Maines (ed.), *Social Organization and Social Process: Essays in Honor of Anselm Strauss*, Aldine de Gruyter, 1991, pp.
265–283. - Star, Susan Leigh and James R.
Griesemer.
"Institutional Ecology, 'Translations' and Boundary Objects." *Social Studies of Science* 19(3), 1989, pp.
387–420. - Lampland, Martha and Susan Leigh Star (eds.). *Standards and Their Stories: How Quantifying, Classifying, and Formalizing Practices Shape Everyday Life*.
Cornell University Press, 2009.

**Political-anthropological critique of state legibility:** - Scott, James C. *Seeing Like a State: How Certain Schemes to Improve the Human Condition Have Failed*.
Yale University Press, 1998.

**Measurement-under-feedback (Goodhart's Law, Campbell's Law):** - Goodhart, Charles A.E. "Problems of Monetary Management: The U.K. Experience."
Papers in Monetary Economics, Reserve Bank of Australia, 1975; reprinted in Goodhart, *Monetary Theory and Practice: The U.K. Experience*, Macmillan, 1984. - Campbell, Donald T.
"Assessing the Impact of Planned Social Change." *Occasional Paper Series*, Public Affairs Center, Dartmouth College, 1976.

**Audit cultures and the audit society:** - Power, Michael. *The Audit Society: Rituals of Verification*.
Oxford University Press, 1997. - Strathern, Marilyn (ed.). *Audit Cultures: Anthropological Studies in Accountability, Ethics and the Academy*.
Routledge, 2000.

**Feminist-CSCW invisibility tradition:** - Strauss, Anselm.
"Work and the Division of Labor." *The Sociological Quarterly* 26(1), 1985, pp.
1–19. - Strauss, Anselm.
"The Articulation of Project Work: An Organizational Process." *The Sociological Quarterly* 29(2), 1988, pp.
163–178. - Star, Susan Leigh and Anselm Strauss.
"Layers of Silence, Arenas of Voice: The Ecology of Visible and Invisible Work." *Computer Supported Cooperative Work* 8(1–2), 1999, pp.
9–30. - Schmidt, Kjeld and Liam Bannon.
"Taking CSCW Seriously: Supporting Articulation Work." *Computer Supported Cooperative Work* 1(1–2), 1992, pp.
7–40. - Suchman, Lucy. *Plans and Situated Actions: The Problem of Human–Machine Communication*.
Cambridge University Press, 1987. - Suchman, Lucy.
"Making Work Visible." *Communications of the ACM* 38(9), 1995, pp.
56–64. - Daniels, Arlene Kaplan.
"Invisible Work." *Social Problems* 34(5), 1987, pp.
403–415. - Hochschild, Arlie Russell. *The Managed Heart: Commercialization of Human Feeling*.
University of California Press, 1983. - Hochschild, Arlie Russell. *The Second Shift: Working Parents and the Revolution at Home*.
Viking, 1989. - Glenn, Evelyn Nakano.
"From Servitude to Service Work: Historical Continuities in the Racial Division of Paid Reproductive Labor." *Signs* 18(1), 1992, pp.
1–43. - Glenn, Evelyn Nakano. *Forced to Care: Coercion and Caregiving in America*.
Harvard University Press, 2010. - Federici, Silvia. *Caliban and the Witch: Women, the Body and Primitive Accumulation*.
Autonomedia, 2004. - Federici, Silvia. *Revolution at Point Zero: Housework, Reproduction, and Feminist Struggle*.
PM Press, 2012. - Dalla Costa, Mariarosa and Selma James. *The Power of Women and the Subversion of the Community*.
Falling Wall Press, 1972. - Fortunati, Leopoldina. *The Arcane of Reproduction: Housework, Prostitution, Labor and Capital*.
Autonomedia, 1995; Italian original *L'arcano della riproduzione*, Marsilio, 1981. - Folbre, Nancy. *The Invisible Heart: Economics and Family Values*.
New Press, 2001.

**Contemporary algorithmic-governance critique (Corollary 6):** - Pasquale, Frank. *The Black Box Society: The Secret Algorithms That Control Money and Information*.
Harvard University Press, 2015. - Eubanks, Virginia. *Automating Inequality: How High-Tech Tools Profile, Police, and Punish the Poor*.
St. Martin's Press, 2018. - Benjamin, Ruha. *Race After Technology: Abolitionist Tools for the New Jim Code*.
Polity, 2019. - Zuboff, Shoshana. *The Age of Surveillance Capitalism*.
PublicAffairs, 2019. - Ajunwa, Ifeoma. *The Quantified Worker: Law and Technology in the Modern Workplace*.
Cambridge University Press, 2023. - Fourcade, Marion and Kieran Healy. *The Ordinal Society*.
Harvard University Press, 2024.

**Burnout and the psychopathology of invisible labor (Corollary 8):** - Berardi, Franco "Bifo". *The Soul at Work: From Alienation to Autonomy*.
Semiotext(e), 2009; Italian original *L'anima al lavoro*, DeriveApprodi, 2007.

**Constructive design directions (Open downstream):** - Greenbaum, Joan and Morten Kyng (eds.). *Design at Work: Cooperative Design of Computer Systems*.
Lawrence Erlbaum, 1991.
(Participatory design.) - Costanza-Chock, Sasha. *Design Justice: Community-Led Practices to Build the Worlds We Need*.
MIT Press, 2020.
(Design justice.) - Benjamin, Ruha. *Race After Technology* (2019), cited above.
(Abolitionist tools.)

**Classical organization-theory ancestor for Corollary 2 (Hawthorne):** - Mayo, Elton. *The Human Problems of an Industrial Civilization*.
Macmillan, 1933. - Roethlisberger, F.J. and William J.
Dickson. *Management and the Worker*.
Harvard University Press, 1939.
