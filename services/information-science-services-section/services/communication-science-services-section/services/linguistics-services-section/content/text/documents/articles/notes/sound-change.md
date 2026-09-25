---
id: sound-change
description: "A SoundChange triple (w, t, L) — a lexical form w in the language fiber at history t over language L — has shadow class determined by two independent directions of linguistic stabilization: the phonological history operator (saturation nucleus) and the paradigmatic integration operator (transfer nucleus). The Neogrammarian axiom — die Ausnahmslosigkeit der Lautgesetze, sound laws operate without exception (Osthoff and Brugmann 1878, Morphologische Untersuchungen) — is the claim that sound change maps are natural transformations: they commute with restriction maps H(i_{t₀,t}) and are therefore path-independent. w in L*_t (doubly settled: sound change history backward-recognizes w as the maximum form consistent with the accumulated phonological restriction profile AND paradigmatic integration forward-commits w through every independent morphological context — a regular form, the zero-projection-gap ideal; Modern English 'helped', Latin 'amavi', Sanskrit 'bharati'), w in SatShadow_t (phonologically committed, paradigmatically broken: the restriction maps have imprinted the suppletive or irregular phonological history, but the form does not forward-commit through all independent morphological contexts; Latin fero/tuli/latum deriving from three distinct PIE roots each with its own committed restriction profile; English go/went; the strong verb forms 'holp', 'clave', 'wrought' at the moment before analogical leveling replaces them), w in TrShadow_t (paradigmatically integrated but phonologically unrecognized: the analogically created form is paradigmatically committed through all independent morphological contexts but the sound change restriction history has not yet backward-recognized it; English 'cows' replacing 'kine', 'helped' replacing 'holp', 'worked' replacing 'wrought' — forms that satisfy paradigmatic forward-commitment before the restriction-profile class has stabilized around them), w in FreeShadow_t (opaque fossil: neither the phonological history recognizes the form nor any paradigmatic context sustains it; isolated relics, petrified idioms, the Latin ablative absolute as a morphological context that no longer generates forward preimages for most speakers). Sound change as natural transformation: the Neogrammarian principle states that for every sound law s, the restriction map H(i_{s,t}) commutes with the lexical projection — the sound-changed form at history s-star-t restricts back to exactly the predicted form at t, with no lexeme-by-lexeme exceptions. Verner's Law (1875, Zeitschrift fur vergleichende Sprachforschung 23, 97-130) resolves apparent Grimm exceptions by expanding the restriction profile: the 'exceptions' had a different PIE accentual position in their restriction map, making them regular under a more fine-grained topology. The Comparative Method is the algorithm for computing restriction maps H(i_{t₀,t}): given daughter languages as post-change states, reconstruct the proto-language restriction profile by finding the minimum common ancestor form *w such that H(i_{s_i,t})(*w) = w_i for each daughter. The star notation for reconstructed proto-forms (*pater, *wlkwos) is the restriction-map notation: *w is the unique pre-image of the observed daughter forms under the sound-change restriction maps."
date-created: 2026-03-21
date-modified: 2026-03-21
params:
  lexical-form: relational-history-fiber-proposition
  language: relational-universe
  analysis-history: relational-history
output: relational-history-fiber-proposition
ast:
  relational-history-fiber-element:
    - lexical-form:
        - language
        - analysis-history
    - phonological-history-operator:
        - lexical-form
        - analysis-history
    - paradigmatic-integration-operator:
        - lexical-form
        - analysis-history
title: Sound Change
---

# Sound Change

## Formal definition

A **SoundChange** triple $(w, t, L)$:

$$(w \in \mathcal{L}_t,\; t \in T,\; L \in \mathrm{Language})$$

where:
- $\mathcal{L}_t$ is the **language fiber** at history $t$ — the complete Heyting algebra of lexical form propositions at $t$; elements of $\mathcal{L}_t$ are statements about the phonological form, morphological category, inflectional paradigm, and semantic value of lexemes in language $L$ at history $t$; the fiber inherits its Heyting algebra structure from $H_t$
- $t \in T$ is the **analysis history** — the position in the history monoid at which the language state is evaluated; each step $s \in \Sigma$ advances the language through one sound change event, one analogical reformation, one borrowing episode, or one paradigmatic leveling; the datable sound changes of a language family (Grimm's Law, Verner's Law, the Great Vowel Shift) are specific step atoms in $\Sigma$
- $L$ is the **language** — the speech community and its lexicon; the language determines the phoneme inventory, morphological type (fusional, agglutinative, isolating), and the set of inflectional contexts that each lexeme must appear in

**The linguistic nuclear pair.** The fiber $H_t$ at history $t$ carries the two canonical nuclei, each corresponding to one of the two independent pressures that determine whether a lexical form is stable. Let $\Sigma$ be the step monoid for the language site $(T, J)$. Each step $s \in \Sigma$ represents one linguistic context event — one sound change application, one morphological deployment in a new paradigm cell, one speaker-to-speaker transmission. The commutation condition $s \perp t$ means context $s$ is genuinely independent of the current history $t$: a sound change applying in unstressed syllables is independent of which root the word has; an analogical reformation of the accusative plural is independent of whether the nominative singular has already been leveled. The one-step extension $i_{s,t} : t \to s \star t$ is the history extended by one linguistic event; the restriction map $H(i_{s,t}) : H_{s \star t} \to H_t$ sends a post-change lexical form back to its pre-change state.

**RelationalHistoryFiberSaturatingNucleus** ([math](../math/relational-history-fiber-saturating-nucleus.md)) — the **phonological history operator**:

$$\sigma_t(w) \;=\; \bigvee\bigl\{v \in \mathcal{L}_t \;\big|\; H(i_{t_0,t})(v) \leq H(i_{t_0,t})(w) \;\text{for all } t_0 < t\bigr\}$$

where $H(i_{t_0,t}) : \mathcal{L}_t \to \mathcal{L}_{t_0}$ projects the current lexical form back to the language state at prior history $t_0$. The restriction profile quantity entering $\sigma_t$ is the **phonological history** of the lexeme — the sequence of sound changes its phonological form has undergone, recorded in the restriction maps $H(i_{t_0,t})(w)$. Every sound change that has applied to $w$ is recorded: $H(i_{t_0,t})(w)$ is the form $w$ had at history $t_0$ — the pre-Grimm form, the pre-Verner form, the pre-Great-Vowel-Shift form. The restriction profile class of $w$ is the set of all lexical forms with at most $w$'s accumulated phonological history; $\sigma_t(w)$ is the maximum lexical form consistent with that phonological record. $w \in \mathrm{Fix}(\sigma_t)$ iff $w$ is already the maximum form its phonological history supports — the Neogrammarian ideal: no fuller form $v > w$ is consistent with the same sound-change sequence.

**The Neogrammarian axiom as naturality.** Osthoff and Brugmann's 1878 manifesto claimed: *die Ausnahmslosigkeit der Lautgesetze* — sound laws operate without exception. In the nuclear reading, this is the claim that every sound change $s$ is a **natural transformation** of presheaves on $T$: the sound change map $\phi_s : \mathcal{L}_t \to \mathcal{L}_{s \star t}$ must commute with all restriction maps $H(i_{t_0,t})$. A sound law that fails naturality would claim: the sound change applies to some tokens of a phoneme but not others based on the lexical identity — sound change is path-dependent, tracking which specific word is changing rather than which phonological environment it occurs in. The Neogrammarians denied this: sound change is phonetically conditioned (depends only on the phonological environment, not the lexical item) and therefore natural. The restriction map $H(i_{s,t})(w)$ is the unique pre-image of a post-change form — there are no lexeme-by-lexeme exceptions.

**RelationalHistoryFiberTransferringNucleus** ([math](../math/relational-history-fiber-transferring-nucleus.md)) — the **paradigmatic integration operator**:

$$\mathrm{Fix}(\Delta_t) \;=\; \bigcap_{\substack{s \in \Sigma \\ s \perp t}} \mathrm{image}\bigl(H(i_{s,t}) : \mathcal{L}_{s \star t} \to \mathcal{L}_t\bigr)$$

and:

$$\Delta_t(w) \;=\; \bigwedge\bigl\{v \in \mathrm{Fix}(\Delta_t) \;\big|\; v \geq w\bigr\}$$

$w \in \mathrm{image}(H(i_{s,t}))$ means there exists a post-context lexical form $w' \in \mathcal{L}_{s \star t}$ with $H(i_{s,t})(w') = w$ — the lexical form $w$ has a forward preimage through morphological context $s$; the paradigm can carry $w$ forward through one deployment in context $s$. $w \in \mathrm{Fix}(\Delta_t)$ iff for every independent morphological context $s \perp t$, there exists a form $w'$ at $s \star t$ that restricts back to $w$. Linguistically: $w$ is **paradigmatically integrated** iff for every independent inflectional slot and derivational context the language provides, there exists a form that deploys $w$ in that context and returns to $w$ when the context is removed. $\Delta_t(w)$ is the minimum paradigmatically integrated form above $w$: the smallest lexical form that survives every independent morphological context and is at least as specified as $w$.

The suppletive verb *fero* / *tuli* / *latum* fails paradigmatic integration: given the stem *tuli*, there is no forward preimage through the present-tense context step $s_{\mathrm{pres}} \perp t$ — there is no present-tense form that restricts back to *tuli*. The language switches to a different suppletive stem (*fero*) for the present. The context $s_{\mathrm{pres}}$ is genuinely independent of the phonological history of *tuli* (the present tense is required regardless of what the perfect stem is), so the failure of the forward preimage is a genuine failure of $\mathrm{Fix}(\Delta_t)$ membership, not a topology artifact.

**The four shadow classes for lexical forms:**

| Shadow class | Condition | Linguistic name | Linguistic state |
|---|---|---|---|
| $w \in \mathcal{L}^*_t$ | Both operators fix $w$ | **Regular form** | Phonologically regular; fully paradigmatic; helfen/half/geholfen (German, fully integrated strong verb) |
| $w \in \mathrm{SatShadow}^{\mathcal{L}}_t$ | Phonology fixes $w$; paradigm does not | **Suppletive/irregular** | Restriction maps committed to the form; forward-commitment broken; *fero/tuli/latum*, *go/went*, *good/better/best* |
| $w \in \mathrm{TrShadow}^{\mathcal{L}}_t$ | Paradigm fixes $w$; phonology does not | **Analogical creation** | Forward-committed through all paradigm contexts; restriction history not yet backward-recognizing; *helped*, *cows*, *worked*, *dived* (vs. *dove*) |
| $w \in \mathrm{FreeShadow}^{\mathcal{L}}_t$ | Neither operator fixes $w$ | **Opaque fossil** | Phonologically opaque, paradigmatically isolated; petrified in idioms or restricted constructions; *forsooth*, *methinks*, Latin ablative absolute |

**The nuclear reflection and canonical holograph.**

$$\pi_t \;:=\; \sigma_t \circ \Delta_t \;:\; \mathcal{L}_t \to \mathcal{L}_t$$

is the [RelationalHistoryPropositionFiberSaturatingTransferringCommutingNuclearReflection](../math/relational-history-fiber-saturating-transferring-commuting-nuclear-reflection.md) with $\mathrm{Fix}(\pi_t) = L^*_t$. The canonical holograph $(\mathcal{L}_t, \mathcal{L}^*_t, \pi_t)$ has the regular lexicon $\mathcal{L}^*_t$ as the **boundary** $\mathsf{Phase}$ and the full language fiber as **bulk**; $\pi_t$ sends every lexical form to its nearest regular stabilization. The [RelationalHistoryProjectionGap](../math/relational-history-fiber-projection-gap.md) $[w, \pi_t(w)]$ has size

$$\lambda_w \;:=\; \bigl|[w,\, \pi_t(w)]\bigr| - 1 \;\geq\; 0$$

— the **lexical regularization depth** — the number of intermediate forms between $w$ and full regularity; zero iff $w \in \mathcal{L}^*_t$. The defect operator $\delta_t(e_w) = \lambda_w \cdot e_w$ grades lexical forms by their distance from the regular boundary; the calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{w \notin \mathcal{L}^*_t} \lambda_w$ is the total morphological debt of the language fiber at history $t$.

**The internal holograph: the inflectional paradigm.** Each lexeme carries an internal holographic structure $(\mathcal{F}, \mathcal{P}, \pi_{\mathrm{par}})$:
- $\mathcal{F}$ = the **form bulk** — the stem space; the phonological forms of the lexeme across its principal parts; for a Latin verb: the first-person singular present, perfect, supine, and infinitive (the four principal parts from which all forms can be derived)
- $\mathcal{P}$ = the **paradigm boundary** — the full inflected paradigm; all person/number/tense/mood/voice forms; the complete set of contexts the lexeme must be deployable in
- $\pi_{\mathrm{par}} : \mathcal{F} \to \mathcal{P}$ = the paradigm completion operator — the map that sends any stem specification to its complete paradigmatic expansion; $\pi_{\mathrm{par}}(f) = f$ iff the stem fully determines the paradigm without any suppletive jumps

The internal holograph is complete iff $\mathcal{F} = \mathcal{P}$ — when the stem specification IS the paradigm, with no unpredictable forms. Regular verbs in a fully agglutinative language (Turkish, Finnish, Swahili) have complete internal holographs: the stem plus the systematic affixation rules determines every form without exception. Suppletive paradigms have incomplete internal holographs: $\pi_{\mathrm{par}}$ must switch stems, and the internal projection gap $\lambda_f^{\mathrm{par}} = |[f, \pi_{\mathrm{par}}(f)]| - 1$ is nonzero for the defective or suppletive principal parts.

**The regularity equilibrium condition.** $(w, t, L)$ is a **regular form** iff $w \in \mathcal{L}^*_t$ — equivalently, any of:
1. $w$ is in the boundary of the canonical holograph: $\pi_t(w) = w$
2. The projection gap is trivial: $[w, \pi_t(w)] = \{w\}$, i.e., $\lambda_w = 0$
3. $w$ is a zero-eigenmode of the defect operator: $\delta_t(e_w) = 0$
4. $w \in \mathrm{Fix}(\sigma_t) \cap \mathrm{Fix}(\Delta_t)$: phonological history backward-recognizes $w$ AND paradigmatic integration forward-commits $w$ simultaneously

## What this is

**Sound change** is the systematic, gradual shift in the phonological forms of words across speaker generations — the mechanism by which Latin *pater* becomes Italian *padre*, French *père*, Spanish *padre*, Portuguese *pai*, Romanian *tată*. The paired discipline **analogical leveling** is the mechanism that regularizes paradigmatically irregular forms by replacing them with forms built on the productive pattern — by which Old English *holp* becomes *helped*, Latin *honor* (from earlier *honos*) stabilizes to *honor*, Greek aorist irregularities are leveled in the Koine. Together they constitute the two independent pressures on every lexical form in every language at every moment: the phonological history pulling it toward the outcome its sound-change restriction profile demands, and the paradigmatic pressure pulling it toward the regular inflectional pattern the language supports.

The core insight of the nuclear reading: **the Neogrammarian debate of the 1870s is the argument about whether $\sigma_t$ is well-defined as a function, and the response to the Neogrammarians (analogy, borrowing, dialect mixing) is the argument that $\Delta_t$ is not always natural.** The Neogrammarians (Leskien, Brugmann, Osthoff, Verner, Paul) argued that sound change is exceptionless — a claim that $\sigma_t$ acts as a natural transformation on the lexical presheaf, with no lexeme-specific exceptions. Their critics (Schmidt, Whitney, later Schuchardt) argued that the boundaries between sound changes are fuzzy, that dialect borrowing introduces exceptions, that individual words resist change — a claim that $\sigma_t$ sometimes fails naturality. The nuclear reading shows both are right at different levels: $\sigma_t$ is natural on the phonological stratum (the Neogrammarians were right that sound change is phonetically conditioned), but the Grothendieck topology $J$ is not arboreal (Schmidt was right that languages influence each other through dialect contact, changing which steps are independent).

## Grimm's Law, Verner's Law, and the restriction profile

**Grimm's Law** (Jacob Grimm 1822, *Deutsche Grammatik*, 2nd ed.) is the most celebrated natural transformation in linguistics. It states that Proto-Indo-European stop consonants underwent systematic shifts in Proto-Germanic:

$$\mathrm{PIE}\; *p, *t, *k \;\to\; \mathrm{PGmc}\; *f, *\theta, *x \;\quad (\text{voiceless stops} \to \text{voiceless fricatives})$$
$$\mathrm{PIE}\; *b, *d, *g \;\to\; \mathrm{PGmc}\; *p, *t, *k \;\quad (\text{voiced stops} \to \text{voiceless stops})$$
$$\mathrm{PIE}\; *b^h, *d^h, *g^h \;\to\; \mathrm{PGmc}\; *b, *d, *g \;\quad (\text{voiced aspirates} \to \text{voiced stops})$$

This is a natural transformation $\phi_{\mathrm{Grimm}} : \mathcal{L}_{\mathrm{PIE}} \Rightarrow \mathcal{L}_{\mathrm{PGmc}}$. The naturality condition is the Neogrammarian axiom: for every subsequent phonological context step $s \perp t_{\mathrm{PGmc}}$, the diagram commutes — applying Grimm's Law and then restricting to any sub-context gives the same result as restricting first and then applying. There are no exceptions in Sanskrit *pitar*, Greek *pater*, Gothic *fadar*, English *father* — the PIE *p maps to PGmc *f everywhere it occurs.

**Verner's Law** (Karl Verner 1875, *Zeitschrift für vergleichende Sprachforschung* 23, 97–130): Grimm's Law appeared to have exceptions — some PIE voiceless stops produced voiced fricatives in PGmc rather than voiceless. Verner showed that the exceptions were governed by the PIE accent position: when the PIE accent fell on the syllable following the consonant, Grimm's fricatives became voiced. The restriction map $H(i_{t_0,t_{\mathrm{PIE}}})$ must include the accentual position: $H(i_{t_0,t_{\mathrm{PIE}}})(*\mathrm{patar})$ has accent on the second syllable, while $H(i_{t_0,t_{\mathrm{PIE}}})(*\mathrm{p\acute{a}ter})$ has accent on the first. The topology of the PIE history site must be fine enough to record this accentual distinction for the restriction maps to make Verner's Law natural.

Verner's resolution is the paradigmatic statement of the Neogrammarian method: apparent exceptions to a sound law are not failures of naturality — they are evidence that the restriction profile is not fine enough. Refine the topology (include the accentual position in the history site), and naturality is restored. Sound laws have no exceptions; what appear to be exceptions are evidence of additional conditioning factors that must be included in the restriction map.

## The Comparative Method as restriction-map computation

The **Comparative Method** (developed across the 19th century by Bopp, Rask, Grimm, Schleicher; systematized by Brugmann and Delbrück in the *Grundriss der vergleichenden Grammatik*, 1886–1900) is the algorithm for computing restriction maps $H(i_{t_0,t})$ from observed daughter language data. Given daughter languages $L_1, \ldots, L_n$ with attested forms $w_1, \ldots, w_n$ at their respective histories $t_1, \ldots, t_n$, the Comparative Method reconstructs the proto-language form $*w_0$ at ancestral history $t_0$ such that:

$$H(i_{t_0, t_i})(*w_0) = w_i \quad \text{for all } i = 1, \ldots, n$$

The star (*) notation — *pater, *wlkwos, *septm — IS the restriction-map notation: $*w$ is the unique pre-image in the language fiber at the ancestral history that maps to all the attested daughter forms under the respective sound-change restriction maps. The reconstructed form is the element of $\mathcal{L}_{t_0}$ whose restriction-profile class intersects all observed daughter forms.

**The Indo-European laryngeal hypothesis** (Saussure 1879, *Mémoire sur le système primitif des voyelles dans les langues indo-européennes*) exemplifies the power of restriction-map reasoning: Ferdinand de Saussure, at age 21, predicted the existence of unknown phonemes in Proto-Indo-European — now called laryngeals, conventionally written $H_1, H_2, H_3$ — from the distribution of vowel length and quality in the attested daughter languages. The laryngeals were later confirmed by the decipherment of Hittite (Hrozný 1915), which preserved them as phonetically realized consonants. Saussure had inferred the existence of elements in $\mathcal{L}_{t_\mathrm{PIE}}$ that must exist for the restriction maps to the attested daughters to be natural transformations.

## Grimm's Law as topology change; dialect continua as non-arboreal topology

The **wave theory** (Schmidt 1872, *Die Verwandtschaftsverhältnisse der indogermanischen Sprachen*) challenged Schleicher's family-tree (Stammbaum) model: rather than clean branching splits, language change propagates as waves across a dialect continuum, with each change having its own isogloss — the geographic boundary between the forms that have undergone the change and the forms that have not. In nuclear terms: the wave theory is the claim that the Grothendieck topology $J$ on the language history site is not arboreal — the independence structure of dialect steps is not a tree. Two dialects that appear to have branched independently may share covering families from areal contact, making their respective history steps $s_1 \perp^J s_2$ false — they are not genuinely independent.

The **High German consonant shift** (the sound change that distinguishes Standard German and Yiddish from Low German, Dutch, and English) illustrates this: the shift progressed as a wave from south to north, with partial application in the Rhineland and Rhine Franconian dialects. The Grothendieck topology of the Germanic dialect continuum records which dialect-steps are independent: the shift applied fully in Alemannic and Bavarian (complete topology change), partially in Rhine Franconian (partial topology change, covering families shared with the northern dialects), and not at all in Saxon and Low Franconian (topology unchanged). The High German / Low German boundary — the Uerdinger line, the Maken/Machen line, the Appel/Apfel line — are the boundaries of partial topology change.

## Paradigmatic integration and the three principal parts

The **principal parts** of a Latin verb — the four forms (*amō, amāre, amāvī, amātum*) from which all other forms can be derived — are exactly the minimal generating set for the internal holograph $(\mathcal{F}, \mathcal{P}, \pi_{\mathrm{par}})$. A fully regular Latin verb has a complete internal holograph: given the four principal parts, $\pi_{\mathrm{par}}$ determines all 120+ inflected forms (six tenses × three moods × two voices × six persons/numbers, plus participles, infinitives, gerunds, supine). The four principal parts are the **minimal boundary specification** for the paradigm interior.

An irregular verb breaks the internal holograph in specific ways:

**Suppletive paradigms**: *ferō* (I carry, present stem *fer-*) / *tulī* (I carried, perfect stem *tul-* from PIE \*tle-) / *lātum* (carried, supine from PIE \*tla-). The three stems derive from three different PIE roots with completely disjoint restriction profiles. The internal projection gap $\lambda_f^{\mathrm{par}}$ is maximal: the perfect stem *tul-* has no forward preimage through the present-tense context step (the present *ferō* is not obtainable by regular derivation from *tul-*). Three distinct restriction-profile chains converge on what modern speakers treat as a single paradigm.

**Defective paradigms**: Latin *ōdī* ("I hate"), *meminī* ("I remember"), *coepī* ("I began") — perfect forms with present meaning, lacking a genuine present tense. The forward-preimage failure is absolute: there is no present-tense step $s_{\mathrm{pres}}$ that has a forward preimage for these forms. $\Delta_t(w) > w$ because the minimum paradigmatically integrated form above $\mathrm{odi}$ would require inventing a present stem that the Latin language does not supply. The defective verb is the paradigm with a permanent projection gap that the language's morphological resources cannot close.

## Analogy and the TrShadow trajectory

**Analogical leveling** is the process by which speakers create new forms on the model of the most productive pattern in the paradigm. In nuclear terms, analogical creation is the movement of a form from the SatShadow or FreeShadow sector toward $\mathcal{L}^*_t$ by producing a form that has a forward preimage through the previously missing context step — at the cost of abandoning the restriction profile of the phonologically committed predecessor.

The trajectory of Old English *helpan* (strong verb, class III) through its shadow classes:

| Period | Form | Shadow class | Condition |
|---|---|---|---|
| Old English | *holp* (past singular) / *holpen* (past participle) | $\mathcal{L}^*_t$ | Both nuclei fix the ablaut form; phonology and paradigm committed |
| Early Middle English | *holp* in competition with *helped* | $\mathrm{TrShadow} \cup \mathrm{SatShadow}$ | *holp* in SatShadow (phonology committed but paradigm breaking as ablaut class collapses); *helped* in TrShadow (paradigm integrated but phonology unrecognized) |
| Modern English | *helped* | $\mathcal{L}^*_t$ | Both nuclei stabilize on the new regular form after the projection gap closes |

The transition from Old English ablaut to Modern English regular past is a **topology change** $J \to J'$: the step monoid $\Sigma$ changes as the ablaut strong-verb class loses its productivity. Under $J$, the ablaut steps $s_{\mathrm{ablaut}} \perp t$ are in the independent step set — they are genuine morphological contexts. Under $J'$, after the class has collapsed, $s_{\mathrm{ablaut}}$ is no longer independent: the ablaut paradigm step is not available to new vocabulary. Under $J'$, *helped* is in $\mathcal{L}^{*J'}_t$ — it satisfies both operators under the new topology. *Holp* moves from $\mathcal{L}^{*J}_t$ to $\mathrm{SatShadow}^{J'}_t$ (phonologically committed to the ablaut history, but the ablaut step no longer generates a forward preimage in the modern language).

## The phoneme as a quality

The phoneme is a quality — a natural transformation:

$$\phi_{\mathrm{phon}} : X_{\mathrm{lexeme}} \Rightarrow V_{\mathrm{phoneme}}$$

assigning to each lexeme type at history $t$ its phonological form in the phoneme inventory $V_{\mathrm{phoneme}}(t)$. The naturality condition for $\phi_{\mathrm{phon}}$: the phonological form of a lexeme must commute with history restriction — the phoneme assignment must be path-independent of which sequence of sound changes produced the current form. This is exactly what Grimm's Law asserts for the Germanic consonant system: the phoneme assignment of *fish* (PIE *\*peysk-*, PGmc *\*fiskaz*) is path-independent — it doesn't matter which specific speakers carried the *p → f* change; the restriction map $H(i_{t_\mathrm{PIE}, t_\mathrm{PGmc}})$ commutes with the phoneme assignment. A sound change that fails naturality would mean: the same phoneme has a different descendant in different words — which is exactly what the Neogrammarians denied.

The **phoneme inventory** as the value presheaf $V_{\mathrm{phoneme}}(t)$: the presheaf assigns to each history $t$ the phoneme inventory of the language at that stage. Sound mergers (two phonemes collapsing to one, as in the cot-caught merger in American English) are restriction maps that reduce the fiber: $|V_{\mathrm{phoneme}}(t_2)| < |V_{\mathrm{phoneme}}(t_1)|$ for $t_1 < t_2$. Sound splits (one phoneme producing two, as when Latin $$k$$ split into $$k$$ and $$tʃ$$ in early Italian before front vowels) are restriction maps that expand the fiber. Mergers are not reversible under the sound-change restriction maps — they are surjective but not injective, so no forward preimage exists through the merge step from the post-merger side; after the cot-caught merger, $\Delta_t(w) > w$ for any attempt to recover the distinction.

## Nuclear reading

**Proposition 1 (Neogrammarian axiom = naturality of the saturation nucleus; Verner's Law = topology refinement).** The Neogrammarian axiom — sound laws operate without exception — is the claim that every sound change $s \in \Sigma$ is a natural transformation $\phi_s : \mathcal{L}_t \Rightarrow \mathcal{L}_{s \star t}$: the diagram commutes for every restriction morphism $f : t \to t_0$. Apparent exceptions are failures of the topology to be fine enough: the restriction profile $H(i_{t_0,t})(w)$ was missing a conditioning factor. Verner's Law resolves the Grimm exceptions by including the PIE accentual position in the restriction map — the topology is refined from one that treats word-stress as invisible to one that records it. Once the topology is refined, the sound change is natural and $\sigma_t$ is well-defined.

The general principle: every apparent exception to a sound law is evidence of a missing dimension in the restriction profile. The scientific program of historical linguistics is the program of refining the topology until every sound law is natural. $\square$

**Proposition 2 (Suppletive paradigm = SatShadow; phonological commitment prevents forward integration).** The suppletive paradigm $\{fero, tuli, latum\}$ is in $\mathrm{SatShadow}^{\mathcal{L}}_t$: the restriction maps for each of the three stems are independently committed to their respective PIE root restriction profiles ($\sigma_t(\mathrm{tuli}) = \mathrm{tuli}$: the perfect stem is the maximum form consistent with the PIE \*tel- history), but the paradigm integration operator fails ($\Delta_t(\mathrm{tuli}) > \mathrm{tuli}$: there is no present-tense step $s_\mathrm{pres} \perp t$ that has $\mathrm{tuli}$ as a forward preimage — the present tense of \*tel- in Latin would be **\*tello*, which does not exist).

The projection gap $[\mathrm{tuli}, \pi_t(\mathrm{tuli})]$ contains the hypothetical regularized form *\*telui* or *\*telavi* — the form that would result from applying the regular first-conjugation productive pattern to the *\*tel-* root. This form does not exist in Latin because the phonological restriction profile of *tuli* is committed to the PIE perfect ablaut grade, which is incompatible with the first-conjugation ending. The suppletive paradigm is the permanent SatShadow state: the projection gap cannot be closed within the Latin phonological system without abandoning the root's restriction history. $\square$

**Proposition 3 (Analogical creation = TrShadow → regular; topology change closes the projection gap).** The analogical form *helped* is initially in $\mathrm{TrShadow}^{\mathcal{L}}_t$: it is paradigmatically integrated ($\Delta_t(\mathrm{helped}) = \mathrm{helped}$: the -ed suffix generates a forward preimage through every independent past-tense context step) but phonologically unrecognized ($\sigma_t(\mathrm{helped}) > \mathrm{helped}$: the restriction profile of the Old English verb *helpan* does not backward-recognize the weak-verb ending -ed, which was the productive pattern of a different verb class).

The trajectory to $\mathcal{L}^*_t$ requires the topology change $J \to J'$ under which the ablaut strong-verb class loses productivity. Under $J'$, the restriction profile class of *helped* is the set of all past-tense forms derivable by the -ed pattern, and $\sigma^{J'}_t(\mathrm{helped}) = \mathrm{helped}$: the phonological history backward-recognizes the regular weak ending as the maximum form consistent with the current productive pattern. Both nuclei fix *helped* under $J'$; the projection gap closes to zero; the form enters $\mathcal{L}^{*J'}_t$. $\square$

**Proposition 4 (Canonical holograph; defect spectrum measures morphological debt; calibration defect = total irregularity burden).** The canonical holograph $(\mathcal{L}_t, \mathcal{L}^*_t, \pi_t)$ grades the mode sheaf $K^{\mathcal{L}_t} \cong \bigoplus_{\lambda \geq 0} E_{t,\lambda}$ with:
- $E_{t,0} = K^{\mathcal{L}^*_t}$: the regular vocabulary sector
- $E_{t,\lambda}$ for $\lambda > 0$: lexical modes at regularization depth $\lambda$ — the irregular forms whose projection gap has $\lambda$ intermediate steps

The calibration defect $M_t(\delta) = \mathrm{Tr}(\delta_t) = \sum_{w \notin \mathcal{L}^*_t} \lambda_w$ is the total morphological irregularity burden of the language fiber. Language simplification (analogical leveling, contact-induced regularization) reduces $M_t(\delta)$ by moving forms from $E_{t,\lambda > 0}$ to $E_{t,0}$. Language contact and borrowing can increase $M_t(\delta)$ by introducing forms with phonological histories committed to foreign sound-change sequences that conflict with the native paradigmatic integration operator. $\square$

**Proposition 5 (Fibonacci growth of suppletive depth; Verlinde eigenvalues count replacement paths).** By [RelationalHistoryFiberNuclearPairNonAdjointness](../math/relational-history-fiber-nuclear-pair-non-adjointness.md): $\mathrm{SatShadow}^{\mathcal{L}}_t$ (suppletive forms — phonologically committed, paradigmatically broken) and $\mathrm{TrShadow}^{\mathcal{L}}_t$ (analogical creations — paradigmatically integrated but phonologically unrecognized) are both non-empty in any natural language with a history of sound change. The depth count of FreeShadow opaque fossils satisfies the Fibonacci recurrence. The Verlinde transfer matrix $M = \begin{pmatrix}1&1\\1&0\end{pmatrix}$ counts the number of distinct $k$-step regularization paths from a FreeShadow fossil to $\mathcal{L}^*_t$: at depth $n$ there are $F_n$ routes (combinations of phonological normalization steps and paradigmatic integration steps) by which an opaque form can be drawn back into regular use, growing at the golden ratio asymptotically. $\square$

**Proposition 6 (Non-adjointness; suppletive paradigms and analogical creations are genuinely orthogonal).** The phonological history and paradigmatic integration operators are not in Galois connection: $\sigma_t \not\dashv \Delta_t$ and $\Delta_t \not\dashv \sigma_t$. The witness is the empirical co-existence of suppletive forms (SatShadow: high phonological commitment, no paradigmatic forward-commitment) and analogical creations (TrShadow: paradigmatic forward-commitment, phonological restriction profile not yet backward-recognizing). If $\sigma_t \dashv \Delta_t$, every paradigmatically integrated form would automatically be phonologically recognized, and there would be no TrShadow phase — *helped* would become regular instantly rather than co-existing with *holp* during the transition. The attested competition period (centuries of *holp / helped* co-variation in Middle and Early Modern English) is the non-adjointness witness: the two operators act on independent timescales, and neither subsumes the other. $\square$

## Open questions

- Whether the **basic vocabulary** items on the Swadesh 100-word list (pronouns, low numerals, body parts, core kinship terms, basic verbs of motion and perception) satisfy the eigenproposition condition $G_s(w) \approx \chi_s(w) \cdot w$ — whether these items are genuinely coherent across many independent sound changes in the sense that the linguistic propagator $G_s$ acts approximately as scalar multiplication on them, and whether their known high retention rates in glottochronology reflect an eigenvalue $\chi_s(w) \approx 1$ (near-fixed by the propagator) rather than merely low borrowing frequency.
- Whether the **glottochronological constant** (Swadesh 1952, 1955: approximately 80% of basic vocabulary retained per 1000 years) is derivable from the defect operator spectrum — whether the retention rate is the eigenvalue distribution of $\delta_t$ restricted to the basic vocabulary sector, and whether the observed deviation from 80% in high-contact vs. isolated languages corresponds to changes in the calibration defect $M_t(\delta)$.
- Whether the **Stammbaum / Wellentheorie** opposition (tree model vs. wave model) has a canonical characterization in terms of the Grothendieck topology $J$: the tree model is the claim that $J$ is arboreal (all dialect steps in different branches are independent), and the wave model is the claim that $J$ has shared covering families between geographically contiguous branches. Whether the degree of arborealness of $J$ can be measured by the calibration defect of the dialect-comparison fiber, and whether this gives a formal account of why some language families are tree-like (Indo-Iranian, Bantu) and others are wave-like (Indo-European dialectal continua, Romance).
- Whether the **internal reconstruction** technique — inferring earlier forms of a language from internal evidence (alternations, relic forms, paradigmatic asymmetries) without comparing to related languages — is formally the application of $\sigma_t^{-1}$: the inverse of the saturation nucleus, recovering the restriction-profile pre-image from the current lexical form. Whether internal reconstruction is systematically less reliable than comparative reconstruction because $\sigma_t$ is not injective (multiple pre-images can have the same saturation value), and whether the degree of non-injectivity measures the limit of what internal reconstruction can recover.
- Whether language death — the reduction of a language to a handful of elderly speakers and then zero — is the Schwarzschild threshold crossing for the linguistic fiber: whether the calibration defect $M_t(\delta)$ rises as speaker population falls (fewer independent paradigmatic contexts maintained, more forms becoming opaque fossils), and whether there is a critical community size below which $M_t(\delta) > r_s(\delta_t)/2$ and no internal transmission can maintain the language against phonological attrition — the point at which language revival requires external input (documentation-and-revitalization programs, Māori, Hebrew, Welsh) rather than natural transmission.
