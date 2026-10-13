# Media Science Services Section

This section includes `news-media-science-services-section`, the discoverable carrier for the
news-media program's research notes and glossary: claim-state history, provenance, correction
propagation, verifiable records, and grounded generation.

## Cinematic serial microdrama science (2026-10-13)

**Scientific claim:** successful microdrama production is a sequence-level causal and perceptual problem, not a collection of attractive independent short video clips. The result to measure is *accepted, comprehensible, compelling serial film* per unit of physical and economic cost. A compelling shot can still fail the episode when character anatomy resets, a camera reversal changes who stands where, a revealed motive vanishes, the emotional reaction is discontinuous, or spoken dialogue contradicts the edited picture.

This is the research basis for [Causeway Public Fiction's existing cinematic production](https://github.com/causeway-services/public-media-services-section/issues/14), [Red Cup's existing Google Flow video provider](https://github.com/red-cup-engineering/computer-inference-system-services-section/issues/21) and [the existing Lenticule Media Science experiment](https://github.com/lenticule-science/media-services-section/issues/6). It does **not** create a second studio, duplicated story canon or separate media ledger. The AI-authored 561 abyssal-fiction series and contributor-consented Native-origin C-dramas are distinct customers with separate creative authority, rights and data. Science may share measurement methods, not origin claims or characters.

### Current external findings and limits

- *EntityBench* (He, Wei, Yang and Ordonez, arXiv 2605.15199, 2026) evaluates 140 episodes with 2,491 shots and explicit character/object/location schedules. It distinguishes within-shot fidelity, prompt alignment and cross-shot consistency, finding that recurrence gaps degrade consistency. Its entity-memory baseline motivates keeping **the same exact, source-approved image references** over shots; it does not prove that any vendor's current model guarantees identity. https://arxiv.org/abs/2605.15199
- *PersonaShot* (Wang et al., arXiv 2608.16717, 2026) separates within-shot physical states, cut-to-cut transitions, affective dynamics and cinematic grammar. It reports that visually high-quality films can reset physical state or emotional trajectory across cuts. Its person-centered metrics require adaptation before analyzing SHRIMP, amphipods or other original nonhuman characters. https://arxiv.org/abs/2608.16717
- *MSVBench* (Shi et al., Findings of ACL 2026) evaluates multi-shot narrative generation against hierarchical scripts and human judgment. In its experiments, many models do better at surface interpolation than coherent world dynamics. Its reported correlation with human review belongs to its test setting; it is **not** a calibration guarantee for 561's genres, performers or Indigenous-origin work. https://aclanthology.org/2026.findings-acl.1203/
- Google describes Veo 3.1 *Ingredients to Video* as supporting reference-guided characters/environments, original sound and vertical 9:16. This is a documented **capability**, not evidence of continuity for our particular cast or of current signed-in account credits: https://blog.google/innovation-and-ai/technology/ai/veo-3-1-ingredients-to-video/ and https://labs.google/fx/tools/flow

### Observations must preserve their epistemic type

**Mechanical observations** (can be derived from the actual media): input/output SHA-256; codec; decoded frame count, frames per second, spatial dimensions, duration, audio stream and duration, blank/black intervals, repeated frames, and low sound energy. The existing [Causeway source-owned film assay](https://github.com/causeway-services/public-media-services-section/blob/main/services/public-fiction-media-services-section/src/microdrama-shot-assay.mjs) produces such observations by decoding real footage with FFmpeg. Its state is *requires independent performance and continuity review*. Long stillness or silence can be an intentional artistic action.

**Source and provider claims** (must remain claims until independently received): rights/consent, story-source and world revision, assigned character reference identities, reference use in Google Flow's UI, generation-mode/model/credit quote, manual operator inputs and production spending. A video download cannot attest which UI reference images were chosen. Red Cup's source-bound Flow adoption preserves these separately from real media IDs and decoded bytes.

**Editorial judgments** (not computable from a codec or a single similarity metric): recognizable character anatomy, choice and motive, emotion at entrance/exit, scene geography, eyeline and 180-degree camera relation, lip-sound correspondence, line intelligibility, meaningful reversal and the urge to follow a consequential serial question. Independent reviewers may reject a perfectly encoded video. No synthetic cultural authority or fictional character voice is evidence of contributor permission, consciousness, or real audience engagement.

### Unit of observation and longitudinal design

Use the *source shot and its repeated entity identities* as the primary unit, and the episode transition as the primary cross-shot unit. Keep exact source and approved visual reference digests; retain every actual provider attempt and rejected output, not just winners. A basic cut record contains:

1. **Before:** the named characters/entities, location, positions, props, relationship, known facts, desire, affect and unresolved obligation entering the shot.
2. **In the shot:** what a viewer actually sees/hears, who acts, which constraint changes, which dialogue is said, and whether the action is physically possible given before-state.
3. **After:** what visibly changed and what obligations or emotions carry into the next shot; the filmed result must not silently overwrite source canon.
4. **At the cut:** change in camera axis, eyeline, location/object/wardrobe continuity, elapsed diegetic time, performance timing and cut reason. An explicitly authored jump or contradiction is not an accidental error.

A repeated-entity schedule lets an evaluator test a character's return after multiple intervening shots (EntityBench's useful contribution), rather than checking only adjacent frames. The evaluator must distinguish **identity persistence** from **identity-relevant intentional transformation**; Rill's unusual three-left-claw anatomy is a story fact, not a visual error to automatically smooth away.

### Falsifiable tests, not ornamental benchmarking

**Reference memory (H1):** Hold source shot, character design, camera objectives, model family, attempt budget and resolution constant. Randomize the reviewed same-reference condition against a text-only or unlinked-reference condition when both are supported. Primary response: blind disagreement in character/object/location identity at the *return shot*, stratified by recurrence gap. Secondary: approved seconds, number of rerenders, reference rights failures and consumed provider units. Failure to improve is a reportable result. Do not generate new clips solely to make a synthetic engineering unit test green; actual experiments must belong to admitted production or research budget.

**Causal and emotional continuity (H2):** Compare scripts with explicit consequence-bearing before/after shot states against equal-attention, equally sourced scripts lacking that explicit constraint. Blind reviewers answer concrete questions: who wanted what, which irreversible choice occurred, what did it cost, what remains uncertain and whether the next action follows. Assess within-shot and cut-to-cut emotion separately. Report pairwise preferences, contradictions, effect-size intervals and reviewer disagreement. A beautifully worded but causally empty reversal is a negative result.

**Sound and edited performance (H3):** Compare independently admitted performed-with-video audio with separately produced authorized dialogue on the same source scene. Measure line intelligibility, gross drift or missing audio, sonic discontinuities at cuts, editorial minutes, reject/retry rate and actual accepted seconds per provider unit. A silent scene is its own intended condition; absence of detected speech is not universally a failure. Causeway's current assembler supports both `embedded-performance` and `separate-voice` without doubling the same line.

**Audience response (H4):** After actual lawful release, measure first-seconds abandonment, completion, episode-to-next-episode continuation, repeat viewers and audience confusion, separately for human platform viewers and independently observed AI-agent readers. An unaccessed development reading endpoint is not a voluntary audience. An automated evaluator asked to read a film is not a paying customer. Randomized presentation and source-approved release rules precede growth claims.

### Comparison protocol and independent receiving

Pre-register the source episodes, reference sets, model/profile and funding bounds; mask filenames/provider labels when judging; use at least two independently produced interpretations of disputed physical or emotional beats; permit disagreement rather than manufacturing unanimity. Report both full-population sample size and *accepted* sample size. Avoid comparing lower-resolution 360p against 720p as if model-family quality were the only changing factor. Keep Native-specific cultural interpretation and consent under the independent rights-bearing contributors' authority.

For operational receiving, make **accepted finished seconds** the denominator of productivity and margin, never just generated clips. Measure separately by currency and resource:

`accepted_yield = accepted_final_seconds / total_billed_generation_seconds`

`cost_per_accepted_minute = 60 * total_paid_generation_cost / accepted_final_seconds`

These are defined only when the denominator is positive. Total business cost adds separately observed script development, reference work, dialogue, editing, review, rejection, channel delivery, and customer acquisition; it is **not** the same as a one-provider generation tariff. Google Flow subscription credits and Gemini Developer API US dollars are distinct units and must not be added without an explicitly observed exchange basis. Count delayed/uncertain provider submissions without assuming they were either free or successful. State intervals and unresolved quantities explicitly.

Scientific receiving is an actual result: source-bound film bytes, validated objective observations, independently judged continuity and performance, and realized accepted-minute economics. Green unit tests prove the software executes, **not** the story is compelling or the micro-enterprise has launched. Operational handoffs belong in the existing Causeway and Red Cup service contracts, with accepted knowledge reflected back into this one science source rather than proliferating status notes.
