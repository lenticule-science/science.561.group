---
title: Feeling Rules of the Fediverse
description: An affect-theory memo arguing the Fediverse teaches emotion through architecture, distributing the authority to decide who may speak, who must be buffered, and which harms justify cutting a server off, producing an affective regime organized around consent, boundary-making, anti-corporate suspicion, mutual care, accessibility labor, and anxiety about scale. Reads it as an affective commons under infrastructural constraint whose dominant feeling rule is manage your visibility so others can opt in rather than be captured.
keywords: ["fediverse", "affect-theory", "feeling-rules", "consent", "care-labor", "content-warnings", "emotion", "accessibility"]
---

# Feeling Rules of the Fediverse  
**Affect-theory research memo, current to June 11, 2026**

## Abstract

The Fediverse teaches emotion through architecture. ActivityPub does not simply “decentralize social media”; it distributes the authority to decide who may speak, who must be buffered, which publics may touch, and which harms justify cutting a server off. The result is an affective regime organized around consent, boundary-making, anti-corporate suspicion, mutual care, accessibility labor, and a recurring anxiety about scale. Its dominant feeling rule is not “be happy” or “maximize engagement,” but **manage your visibility so others can opt in rather than be captured**.

This is not inherently liberatory. Federation can shelter queer, trans, disabled, racialized, activist, and small-interest publics; it can also overburden them with moderation, accessibility, explanation, and safety work. Defederation can be collective self-defense; it can also become opaque exile. Content warnings and alt text can enact care; they can also become status tests, shame rituals, or unevenly enforced respectability rules. The Fediverse is best understood as an affective commons under infrastructural constraint: it replaces the platform’s universal feed with many local negotiations over what people owe one another emotionally.

## Core thesis

The Fediverse’s feeling rules emerge from the collision of four layers:

1. **Protocol facts:** ActivityPub distributes activities between actors, inboxes, outboxes, and servers; it does not, by itself, solve moderation, consent, privacy, discovery, or governance. The W3C spec defines client-to-server and server-to-server flows, including actors’ inboxes/outboxes and delivery addressing, but leaves many social norms and enforcement choices to implementations and instances. ([w3.org](https://www.w3.org/TR/activitypub/))  
2. **Software affordances:** Mastodon, Pixelfed, PeerTube, Lemmy, Misskey, Akkoma, GoToSocial, BookWyrm, WriteFreely, Owncast, WordPress ActivityPub, Ghost ActivityPub, Bonfire, Threads, and bridges encode different emotional grammars: image care, video trust, forum conflict, microblog intimacy, livestream presence, blog broadcast, or cross-protocol anxiety. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))  
3. **Instance governance:** Each server’s admins and moderators set local rules, block or limit other servers, handle reports, and decide how “safe,” “open,” “free,” “anti-fascist,” “queer-friendly,” “professional,” “artistic,” “academic,” or “low-drama” the local atmosphere should feel. Studies of Mastodon moderation show that instance size, theme, geography, and growth shocks shape moderation practices and moderator workload. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges))  
4. **Affective norms:** “Be kind,” “CW politics,” “add alt text,” “block early,” “don’t bring Twitter here,” “defederate fascists,” “please boost,” and “fedi hugs” are not just etiquette; they are feeling rules in Arlie Hochschild’s sense: shared norms about what one should feel, display, suppress, and owe others in a situation. Hochschild’s feeling rules describe how people manage the gap between actual feeling and socially expected feeling. ([ucpress.edu](https://www.ucpress.edu/books/the-managed-heart/paper?utm_source=chatgpt.com))

Through Sara Ahmed’s affective economies, Fediverse emotions “stick” to objects and signs: “Twitter-like,” “Meta,” “quote-post,” “CW,” “alt text,” “blocklist,” “local timeline,” “search,” “bridge,” and “federation” accumulate histories of fear, hope, shame, care, resentment, and defense as they circulate. Ahmed’s account of affective economies treats emotions not as private possessions but as effects of circulation between bodies and signs. ([voidnetwork.gr](https://voidnetwork.gr/wp-content/uploads/2016/08/Affective-economies-by-Ahmed-Sara-1.pdf?utm_source=chatgpt.com))

The cruel optimism is this: many users attach to the Fediverse because it promises a kinder, slower, non-corporate social web, yet the practices that sustain that promise—volunteer moderation, content labeling, instance administration, trust-and-safety triage, anti-scraping vigilance, onboarding, and conflict mediation—can themselves become exhausting obstacles to flourishing. Berlant’s cruel optimism names an attachment to something desired that also impedes flourishing. ([dukeupress.edu](https://www.dukeupress.edu/cruel-optimism?utm_source=chatgpt.com))

---

## 1. Scope: the Fediverse is not Mastodon

Mastodon remains the largest and most culturally visible ActivityPub microblogging implementation; FediDB’s software page, retrieved in this session, listed Mastodon at 9,015 servers and 8,575,586 accounts, but registered-account counts are not active-user counts and Fediverse statistics are measurement-contingent. ([fedidb.org](https://fedidb.org/software?utm_source=chatgpt.com)) The Fediverse includes multiple genres of software: Pixelfed for image sharing, PeerTube for video, Lemmy/Mbin/Kbin-style social news and forums, Misskey/Sharkey/Iceshrimp forks for expressive microblogging, Pleroma/Akkoma for lightweight and customizable microblogging, GoToSocial for small-instance microblogging, BookWyrm for social reading, WriteFreely and WordPress ActivityPub for blogging, Owncast for livestreaming, Ghost ActivityPub for publishing, Bonfire for experimental social networking, Threads for Meta’s ActivityPub integration, and Bridgy Fed for cross-protocol bridging. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

The affective point: **each software genre teaches a different “good user.”** A good Pixelfed user captions images; a good PeerTube admin curates followed platforms and handles video abuse reports; a good Lemmy moderator manages community-level conflict; a good GoToSocial user treats public posting as a conscious choice; a good WordPress ActivityPub publisher understands that a blog can become a federated profile; a good Bridgy Fed user understands consent and translation between protocols. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

---

## 2. Theoretical frame

### 2.1 Feeling rules

Hochschild’s “feeling rules” ask: what emotions are appropriate here, and what emotional labor is required to make oneself fit? On the Fediverse, the recurring rule is: **do not externalize your affective intensity into other people’s timelines without giving them control.** This appears as content warnings, alt text norms, limited search, locked accounts, unlisted posts, local-only posting, anti-dunking norms, and the acceptability of blocking without debate.

### 2.2 Affective economies

Ahmed helps explain why “Twitter,” “Meta,” “quote post,” “search indexing,” and “algorithm” become sticky signs. They condense experiences of harassment, extraction, virality, context collapse, billionaire ownership, and corporate capture. Conversely, “local,” “mutual aid boost,” “fedi hugs,” “CW,” and “alt text” accumulate positive value as signs of care—but can also become disciplinary signs.

### 2.3 Cruel optimism

The Fediverse’s promise is that smaller, federated, self-governed spaces can make social media livable. The cruelty is that this livability often depends on unpaid or underpaid care labor by admins, moderators, accessibility advocates, marginalized users, and technically skilled volunteers. Terranova’s “free labor” frame is useful here: internet culture is materially sustained by unpaid or under-recognized productive activity, and Fediverse maintenance intensifies that dynamic by moving trust-and-safety work from a centralized firm to local volunteers. ([web.mit.edu](https://www.web.mit.edu/schock/www/docs/18.2terranova.pdf?utm_source=chatgpt.com))

### 2.4 Platform affect

Unlike engagement-maximizing platforms, many Fediverse spaces cultivate an anti-viral affect: slowness, consent, opt-in visibility, and suspicion toward growth. But the network still produces affective publics: groups organized by shared moods, crises, solidarities, hashtags, boosts, and blocklists. Papacharissi’s work on affective publics is useful because political and social belonging online is often organized less by stable institutions than by circulating feelings, stories, and mediated attachments. ([tandfonline.com](https://www.tandfonline.com/doi/abs/10.1080/1369118X.2015.1109697?utm_source=chatgpt.com))

---

## 3. Dominant feeling rules of the Fediverse

| Feeling rule | What users are taught to feel | What users are taught to do | Failure mode |
|---|---|---|---|
| **Consent over capture** | Caution about involuntary exposure. | Use CWs, unlisted posts, locked accounts, local-only posts where available, and limited search norms. Mastodon CWs collapse post content by default; GoToSocial defaults new accounts to unlisted because public posting should be conscious. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/)) | Consent becomes over-policing; users shame each other over ambiguous topics. |
| **Care is technical** | Care should be materially encoded. | Add alt text, format hashtags accessibly, mark media sensitive, approve followers, curate local timelines. Hachyderm explicitly links good community membership with CWs, alt text, mutes, blocks, and mental-health boundaries. ([instances.social](https://instances.social/hachyderm.io)) | Care becomes a compliance test, disproportionately burdening disabled, neurodivergent, multilingual, or exhausted users. |
| **Refusal is legitimate** | Blocking is not cowardice; it is boundary work. | Block early, mute, filter, limit, suspend, defederate. Defederation is a two-way server-level cut-off used for spam, coordinated abuse, or value conflicts. ([carnegieendowment.org](https://carnegieendowment.org/research/2025/03/fediverse-social-media-internet-defederation)) | Refusal becomes opaque exile or guilt by association. |
| **Localness matters** | One’s home server should feel like a shelter or neighborhood. | Read local rules, respect local culture, learn the local timeline. Instance governance research shows rules and moderation formalize as communities scale. ([arxiv.org](https://arxiv.org/abs/2606.05069?utm_source=chatgpt.com)) | Local shelter becomes parochialism, clique governance, or admin paternalism. |
| **Do not import platform trauma** | Twitter/X is felt as speed, dunking, algorithmic abuse, harassment, and context collapse. | Avoid quote-dunking, main-character dynamics, mass callouts, algorithmic growth tactics, and search-based harassment. Mastodon limits full-text search partly to prevent searching controversial terms to harass users. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/network/)) | “Don’t bring Twitter here” can silence racialized or activist expressive practices by mislabeling them hostile. ([techpolicy.press](https://techpolicy.press/the-whiteness-of-mastodon)) |
| **Accessibility is community membership** | Not adding alt text can be felt as exclusion. | Caption images; use CWs and sensitive-media flags where relevant. Pixelfed federates sensitive media/CW semantics; Mastodon and Hachyderm document alt text and CWs as participation norms. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html)) | Accessibility becomes moralized as individual virtue while tooling remains uneven. |
| **Anti-corporate vigilance** | Suspicion toward surveillance capitalism, ads, growth hacks, and Meta/Threads. | Defederate or limit corporate servers; debate bridges; refuse indexing and scraping. IFTAS warned admins that Threads federation could increase reports, compliance exposure, and the number of accounts able to view members’ content. ([about.iftas.org](https://about.iftas.org/2023/12/20/moderating-the-fediverse-threads-from-instagram/)) | Anti-corporate feeling can become purity politics or block ordinary users trapped on corporate platforms. |
| **Mutual aid deserves amplification** | Boosting is care, not just reach. | “Please boost” circulates fundraisers, safety alerts, migration calls, and community support. | Boost obligations can create compassion fatigue and status competition over whose emergencies count. |

---

## 4. Affective affordances: timelines, boosts, quotes, CWs, alt text, visibility

| Affordance | Protocol/software fact | Feeling taught | Social effect |
|---|---|---|---|
| **Home timeline** | A following-based feed rather than a universal algorithmic feed. | “I chose these people; my feed is relational.” | Encourages intimacy and responsibility; can narrow discovery. |
| **Local timeline** | Posts from one’s instance; Mastodon 4.5 lets admins make the local feed a visitor homepage. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2025/11/mastodon-4.5/)) | “This place has a mood.” | Makes instance culture visible; can intensify local conformity. |
| **Federated timeline** | Posts known to one’s server through federation. | “The outside is nearby but partial.” | Produces federation anxiety: what is missing, blocked, delayed, or imported? |
| **Boost / Announce** | ActivityPub includes shares/Announce collections; Mastodon boosts distribute posts without added commentary. ([w3.org](https://www.w3.org/TR/activitypub/)) | “Amplify without appropriating.” | Supports mutual aid and praise; limits critique attached to the original post. |
| **Quote post absence/presence** | Mastodon historically avoided quote-posting; Mastodon 4.5 introduced quote posts with author controls, disabling/limiting quotes, and revocation. ([blog.djnavarro.net](https://blog.djnavarro.net/posts/2022-11-03_what-i-know-about-mastodon/?utm_source=chatgpt.com)) | Absence taught anti-dunking; presence teaches controlled commentary. | May ease migration and discussion; risks reintroducing pile-on dynamics. |
| **Content warnings** | Mastodon CWs collapse post content by default; Pixelfed uses sensitive/summary behavior to conceal media and content until clicked. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/)) | “Let others opt in.” | Creates care and pacing; also creates disputes over which topics must be hidden. |
| **Alt text** | Mastodon, Pixelfed, GoToSocial, and related clients support image descriptions; Mastodon issue history shows long-running user demand for warnings before posting uncaptioned media. ([github.com](https://github.com/mastodon/mastodon/issues/5644?utm_source=chatgpt.com)) | “Access is part of posting.” | Extends participation for screen-reader users; may become shame-based enforcement. |
| **Unlisted posts** | GoToSocial defaults new accounts to unlisted; Mastodon and Akkoma distinguish public/unlisted visibility in timelines/search behavior. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/)) | “Not everything public must be promoted.” | Allows semi-public speech; creates confusion about search, hashtags, and travel. |
| **Locked accounts / follower approval** | Owncast private mode requires follower approval; BookWyrm has manual follower approval and granular privacy controls. ([owncast.online](https://owncast.online/docs/social/)) | “Audience is relational, not automatic.” | Supports safety; can reduce discoverability and increase gatekeeping. |
| **Limited full-text search** | Mastodon’s full-text search is limited for safety and cannot search arbitrary text across the entire database. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/network/)) | “Search can be weaponized.” | Reduces search-based harassment; frustrates discovery, archiving, and research. |
| **Defederation/blocklists** | Community-level blocklists prevent whole communities from interacting; studies find wide variation in goals, criteria, transparency, and moderator philosophies. ([arxiv.org](https://arxiv.org/html/2506.05522v1)) | “Safety may require cutting ties.” | Can protect vulnerable communities; can also isolate users without meaningful process. |

---

## 5. What a “good Fediverse person” feels and does

A “good Fediverse person” is expected to feel:

- **Careful before publicness:** They should ask who might be forced to see a post.
- **Suspicious of virality:** They should not chase outrage or algorithmic dominance.
- **Hospitable but bounded:** They should welcome newcomers while defending local norms.
- **Accessible by default:** They should caption images, avoid inaccessible hashtag formatting, and mark media thoughtfully.
- **Anti-fascist or at least anti-harassment:** Many communities treat fascism, racism, transphobia, and targeted harassment as not merely opinions but threats to public life.
- **Non-corporate or corporate-skeptical:** They should understand why Meta, Twitter/X, scraping, ads, and platform capture feel dangerous.
- **Moderation-literate:** They should know that admins are not abstract platform employees but often exhausted volunteers.

They are expected to do:

- Read instance rules.
- Add alt text.
- Use CWs when local norms expect it.
- Boost mutual aid without quote-dunking.
- Block/mute/filter instead of demanding universal debate.
- Avoid main-character pile-ons.
- Ask before importing public posts into hostile audiences.
- Accept that another instance may have different norms.
- Understand that public ActivityPub posts may travel beyond one’s imagined audience.

This moral subject is not neutral. It often reflects the history of queer, trans, disabled, neurodivergent, anti-fascist, free-software, academic, art, and activist communities, but also the demographics and politics of early Mastodon adoption. Roach’s “Whiteness of Mastodon” critique argues that entrenched norms around CWs, tone, and acceptable affordance use can inhibit users of color from experimenting with platform practices and can punish forms of Black digital expression by treating them as disorderly or “Twitter-like.” ([techpolicy.press](https://techpolicy.press/the-whiteness-of-mastodon))

---

## 6. Cross-software affect map

| Software / network position | Dominant affective style | Typical feeling rules | Tensions |
|---|---|---|---|
| **Mastodon** | Consentful microblogging; local shelter; anti-viral etiquette. | CWs, alt text, block early, avoid dunking, respect instance rules. | Norms can become moralized; quote posts reopened a long-standing anti-dunking debate. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/)) |
| **Pixelfed** | Image-sharing without Instagram-style corporate affect. | Caption images, mark sensitive media, value chronological/privacy-friendly feeds. Pixelfed documents sensitive media and CW-like summary behavior. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html)) | Visual culture increases alt-text labor; federation of images raises scraping and consent anxieties. |
| **PeerTube** | Trust-based video commons. | Follow like-minded platforms; moderate video abuse; control redundancy and remote mirroring. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation)) | Video moderation is high-cost; bandwidth and hosting costs make “commons” materially fragile. |
| **Lemmy / Mbin / Kbin** | Forum agonism and community moderation. | Respect community rules; expect stronger debate, voting, and moderator removal actions. Lemmy models communities as ActivityPub Groups and federates posts/comments/mod actions. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html)) | Reddit-like affect imports conflict, voting resentment, brigading fears, and defederation wars. |
| **Misskey / Sharkey / Iceshrimp forks** | Expressive, playful, emoji-rich, often anime/furry/Japanese-origin interface cultures. | Emoji reactions, rich chat, antennas, animated text, custom instance identity. ([fediverse.party](https://fediverse.party/en/misskey/)) | Mastodon-centric norms can misread Misskey-style expression as noise or unseriousness. |
| **Pleroma / Akkoma** | Lightweight, customizable, sometimes more permissive or technically experimental. | Local moderation, custom emoji reactions, quote posts, MRF policies. Akkoma documents message rewrite policies that can drop, reject, delist, expire, or rewrite activities. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/configuration/cheatsheet/)) | More permissive cultures may be read by other servers as unsafe; powerful admin filters can be opaque. |
| **GoToSocial** | Small-server privacy and boundary consciousness. | Public posting should be deliberate; default unlisted for new accounts; strict respect for local blocks where possible. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/)) | Small-instance intimacy can mean dependence on one admin and fragile infrastructure. |
| **BookWyrm** | Slow social reading, review, and literary community. | Track books with privacy controls; federate trusted reading communities. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/)) | Book data, reviews, and interpersonal taste can become surprisingly intimate and identity-laden. |
| **WriteFreely / WordPress ActivityPub / Ghost ActivityPub** | Blog-to-feed publication; newsletter/RSS affect meets social replies. | Follow authors/sites; expect long-form posts to arrive in home feeds. WordPress ActivityPub makes a blog and its authors federated profiles. ([wordpress.org](https://wordpress.org/plugins/activitypub/)) | Blog authors may not expect microblog-style replies, quote dynamics, or moderation obligations. |
| **Owncast** | Livestream presence and event affect. | Follow a stream, receive go-live notices, approve followers in private mode, show Fediverse engagement in chat. ([owncast.online](https://owncast.online/docs/social/)) | Live events intensify moderation urgency and parasocial attachment. |
| **Threads federation** | Corporate scale entering an anti-corporate commons. | Opt-in federation for public adult accounts; other servers decide whether to interact. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/)) | Meta changes the affective weather: fear of capture, moderation mismatch, compliance concerns, and resentment. |
| **Bridgy Fed / bridges** | Cross-protocol desire and boundary anxiety. | Bridge deliberately; understand that accounts become visible across contexts. Bridgy Fed connects websites, the Fediverse, and Bluesky bidirectionally “as much as possible.” ([fed.brid.gy](https://fed.brid.gy/)) | Bridges trigger consent disputes: did one public expect this other public? |

---

## 7. Worked examples

### Example A: “CW politics” as care, refusal, and discipline

A politics CW says: “I believe this matters, but I will not force it into your sensorium.” Hachyderm’s documentation frames CWs as an opt-in buffer for psychologically safer conversation, and its instance listing encourages CWs for violence, food/eating, substance use, politics, and spoilers. ([community.hachyderm.io](https://community.hachyderm.io/docs/mastodon/user/content-warnings/))

Affectively, the CW performs humility: “My urgency is not the only urgency.” But CW politics can also become a demand that marginalized users hide the conditions of their own survival. The tension is especially sharp around racism, trans rights, genocide, sexual assault, and state violence. The care rule—buffer distress—can conflict with the justice rule—do not make oppression unspeakable.

**Finding:** CW politics is not one norm. It is a negotiated boundary between trauma care, attention politics, and public accountability.

### Example B: Alt text as accessibility, status, and burden

Alt text is one of the Fediverse’s clearest care rituals. It turns access into a posting practice. Hachyderm’s “good community member” guidance explicitly asks users to add alt text so screen-reader users can participate fully. ([instances.social](https://instances.social/hachyderm.io)) Mastodon users have requested UI warnings before posting media without alt text since at least 2017. ([github.com](https://github.com/mastodon/mastodon/issues/5644?utm_source=chatgpt.com)) Pixelfed’s 2026 changelog includes “better alt text federation,” showing that accessibility is also an interoperability issue, not just a virtue signal. ([github.com](https://github.com/pixelfed/pixelfed/blob/dev/CHANGELOG.md?utm_source=chatgpt.com))

But alt text also becomes a shame technology: a post without description can be read as careless, hostile, or newbie-coded. This is not simply bad; shame can enforce access norms where platforms have historically neglected disabled users. But shame distributes unevenly. People with fatigue, cognitive disability, language barriers, crisis conditions, or limited client support may be disciplined for failing care.

**Finding:** Alt text is care labor that becomes sustainable only when tooling, education, and community patience share the burden.

### Example C: No quote-posting, then quote-posting with consent controls

Mastodon’s long absence of quote posts taught users that amplification should not be fused to public commentary. The norm “no dunking” was a technical-pedagogical effect: if you wanted to criticize, you could post separately, reply, or screenshot, but not easily drag a target into your audience. Mastodon 4.5, released November 6, 2025, introduced quote posts with controls: authors can limit or disable quoting and revoke use of their post in a quote. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2025/11/mastodon-4.5/))

Affectively, this is a compromise between migration pressure and inherited safety norms. The network admits that quote-posting is useful for commentary, citation, and discussion, but tries to encode consent into the affordance.

**Finding:** The quote-post shift shows that Fediverse feeling rules are not fixed. They are redesigned under pressure from users, competitors, and cross-software interoperability.

### Example D: Defederating Threads / Meta

Threads’ ActivityPub beta began in March 2024 for public profiles of users aged 18+ who opt in to sharing with other ActivityPub servers. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/)) IFTAS warned Fediverse admins that Threads federation could increase local and remote reports, expose communities to Meta/Instagram compliance regimes, and expand the number of accounts able to view members’ content. ([about.iftas.org](https://about.iftas.org/2023/12/20/moderating-the-fediverse-threads-from-instagram/)) Carnegie’s 2025 analysis notes that over 800 servers joined the Fedipact, pledging to defederate from Threads, as an expression of disapproval toward Meta’s moderation and privacy practices. ([carnegieendowment.org](https://carnegieendowment.org/research/2025/03/fediverse-social-media-internet-defederation))

The affective economy is clear: **Meta sticks to surveillance, scale, extraction, moderation failure, and “embrace, extend, extinguish.”** But Threads also sticks to people: friends, audiences, journalists, artists, and institutions who may be reachable through federation. This produces a split feeling rule:

- “Defend the commons from corporate capture.”
- “Do not punish ordinary users for being where their networks are.”

**Finding:** Threads federation transforms anti-corporate feeling from identity into governance: admins must make concrete block, limit, or federate decisions.

### Example E: Defederation as grief, relief, and exile

Defederation can feel like relief to the blocking server: danger has been pushed away. It can feel like abandonment to users on the blocked server: friends, audiences, and support networks disappear. Carnegie describes defederation as a server-level two-way block; Colglazier, TeBlunthuis, and Shaw’s quasi-experimental study found defederation caused a drop in activity for accounts on blocked servers but no evidence of an effect on message toxicity. ([carnegieendowment.org](https://carnegieendowment.org/research/2025/03/fediverse-social-media-internet-defederation))

This matters affectively: defederation is often justified as harm reduction, but its measurable effects may be isolation more than transformation. That does not make it wrong. It means the emotional truth of safety and the empirical effect on toxicity are not identical.

**Finding:** Defederation is less a cure than a boundary. It protects some relations by severing others.

---

## 8. Federation anxiety

The Fediverse produces a specific anxiety that centralized platforms mostly hide: **where is my post, really?** Users must think about:

- Which server hosts my account?
- Which servers receive my post?
- Which servers block mine?
- Which replies are missing?
- Which timeline shows this?
- Is this public, unlisted, followers-only, mutuals-only, direct, or local-only?
- Will search find this?
- Will a bridge copy it?
- Will Threads see it?
- Will a researcher scrape it?
- Will my admin protect me?
- Will my server still exist next year?

Mastodon 4.5’s “Fetch All Replies” feature explicitly addresses the confusion of replies appearing on one server but not another, checking for missing replies on page load and periodically afterward. ([blog.joinmastodon.org](https://blog.joinmastodon.org/2025/11/mastodon-4.5/)) This is a technical patch to an affective problem: conversation feels broken when federation is partial.

---

## 9. Local moderation as affective shelter

Local moderation creates shelter by making rules close enough to contest, understand, and culturally inhabit. Hachyderm’s rule explainer makes this explicit: “Don’t be a dick,” no fascism, no colonialism, no racism, no homophobia, no transphobia, and safe space commitments to LGBTQIA+ and neurodivergent users. ([community.hachyderm.io](https://community.hachyderm.io/docs/rule-explainer/)) Hachyderm also frames mental-health boundaries, mutes, blocks, CWs, and alt text as being a good community member. ([instances.social](https://instances.social/hachyderm.io))

But shelter depends on admin capacity. Spencer-Smith and Tomaz’s 2025 study of Mastodon growth after Musk’s Twitter takeover found that moderation challenges varied by instance characteristics and that tensions between centralization/decentralization and Global North-South differences cut across the network. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges)) Community-level blocklist research similarly finds moderators balancing proactive safety, reactive reports, false positives, transparency, and limited tooling. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Interpretation:** Local moderation is affectively powerful because it replaces “the platform” with “our people.” It is fragile because “our people” may be a handful of volunteers.

---

## 10. When care becomes coercive

Care becomes coercive when:

- CW demands expand without shared rationale.
- Accessibility norms are enforced through public shaming more than tooling.
- “Be kind” is used to suppress anger at injustice.
- “Tone” becomes a proxy for race, gender, class, disability, or neurotype discipline.
- Admin decisions are justified as safety but lack process or appeal.
- Blocklists are imported without context, receipts, or local deliberation.
- Newcomers are expected to intuit norms that long-term users learned through years of conflict.

The key distinction is not care versus freedom. It is **care with consent, explanation, and accountability** versus care as domination. This is where Ahmed is especially useful: the sign “unsafe” can stick to bodies and practices unevenly. A Black callout practice, a trans survival post, a sex worker’s account, a neurodivergent communication style, or a non-Anglophone norm can become marked as “too much,” “hostile,” “NSFW,” “drama,” or “Twitter-like” even when it is community-making for its participants. Roach’s critique of Mastodon’s whiteness directly warns that entrenched norms can inhibit users of color from experimenting with affordances and making identity salient. ([techpolicy.press](https://techpolicy.press/the-whiteness-of-mastodon))

---

## 11. When safety becomes exclusion

Safety becomes exclusion when boundaries are treated as self-evidently virtuous rather than situated decisions with costs. Examples:

- A small instance blocks a large instance to avoid harassment; users lose friends, audiences, and support.
- A blocklist marks a server unsafe; innocent users inherit the server’s reputation.
- A CW norm protects trauma survivors; activists experience enforced invisibility.
- A “no corporate accounts” rule protects local culture; public-interest organizations lose a channel.
- A bridge is blocked to preserve consent; users lose cross-network contact with communities that migrated elsewhere.

This is why blocklist transparency matters. The 2025 community-level blocklist study found wide variation in goals, criteria, and transparency, and moderators wanted better tools for receipts, category filters, collaboration, and contextual metrics. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

---

## 12. When refusal becomes community health

Refusal becomes healthy when it is:

- Specific rather than totalizing.
- Proportionate to harm.
- Explained when explanation does not increase vulnerability.
- Reversible where possible.
- Paired with internal care.
- Accountable to the affected community.
- Not dependent on endless debate with bad-faith actors.

Defederation from fascist, harassment, spam, or coordinated-abuse instances is one of the Fediverse’s most important safety mechanisms. Carnegie’s governance analysis frames defederation as both individual server choice and collective action, while noting that it can cut off whole servers. ([carnegieendowment.org](https://carnegieendowment.org/research/2025/03/fediverse-social-media-internet-defederation))

**Normative conclusion:** Refusal is not the opposite of openness. In federated systems, refusal is one of the conditions that lets openness survive.

---

## 13. Political economy and infrastructure costs

The Fediverse shifts costs rather than abolishing them. It reduces dependence on ad-driven corporate platforms, but it creates new burdens: hosting, storage, bandwidth, legal compliance, moderation, upgrades, spam defense, DDoS defense, backups, observability, user support, and conflict mediation. PeerTube makes this visible because video bandwidth and redundancy are material; its docs describe platform following, moderation, abuse reports, video blocks, and redundancy controls. ([docs.joinpeertube.org](https://docs.joinpeertube.org/admin/moderation)) Owncast similarly requires SSL, stable server identity, and follower approval mechanisms for private mode. ([owncast.online](https://owncast.online/docs/social/))

The anti-corporate feeling rule—“we are not the product”—is therefore incomplete. A better rule is: **someone is paying, someone is maintaining, someone is moderating, and someone is absorbing the emotional overflow.** Terranova’s free-labor frame helps prevent romanticizing this as pure community. ([web.mit.edu](https://www.web.mit.edu/schock/www/docs/18.2terranova.pdf?utm_source=chatgpt.com))

---

## 14. Research risks and methodological cautions

1. **Mastodon overrepresentation:** Most research still uses Mastodon as the empirical proxy for the Fediverse. This memo cites Mastodon heavily because the literature does; that is a limitation.
2. **Public data ethics:** A 2025 study found a disconnect between Mastodon instance policies that may prohibit research data collection and academic studies that do not consistently adhere to those policies. ([arxiv.org](https://arxiv.org/abs/2505.07606))
3. **Statistics are unstable:** Fediverse counts depend on crawlers, NodeInfo availability, stale instances, spam accounts, and definitions of “active.”
4. **Norms differ by language and region:** English-language Mastodon discourse should not stand in for Japanese Misskey culture, Brazilian instances, German co-ops, queer art servers, or PeerTube education servers.
5. **Public posts are not ethnographic consent:** Even when technically public, many Fediverse users explicitly reject scraping, search indexing, and decontextualized research.
6. **Affective interpretation can overgeneralize:** “Fedi culture” is not singular. Instance culture may matter more than network-wide mythology.

---

## 15. Open questions

- Can quote posts with consent controls preserve anti-dunking norms at scale, or will familiar pile-on dynamics return?
- What accessibility practices are most sustainable for users with fatigue, cognitive disability, crisis conditions, or multilingual audiences?
- How should blocklists provide receipts without creating harassment maps?
- Can local moderation scale without professionalizing into the same alienated trust-and-safety labor found on corporate platforms?
- What happens when Threads federation normalizes ActivityPub for hundreds of millions while long-standing Fediverse communities block or limit it?
- How do Misskey, Pixelfed, Lemmy, PeerTube, BookWyrm, and Owncast communities define “good citizenship” differently from Mastodon?
- Can bridges be consentful across protocols with different visibility models?
- When does “don’t bring Twitter here” protect a community, and when does it become racialized, classed, or ableist respectability politics?
- What forms of governance make defederation accountable without requiring vulnerable admins to litigate every boundary?
- How can researchers study the Fediverse without violating instance norms against scraping and indexing?

---

## Annotated bibliography

**W3C ActivityPub Recommendation, 2018.** The protocol baseline: actors, inboxes, outboxes, client-to-server and server-to-server federation. Essential for separating protocol affordance from software culture. ([w3.org](https://www.w3.org/TR/activitypub/))

**Mastodon documentation: posting, content warnings, search, Mastodon 4.5.** Documents CW behavior, sensitive media, limited full-text search, and the 2025 introduction of quote posts with consent controls. Useful for analyzing how Mastodon encodes opt-in visibility. ([docs.joinmastodon.org](https://docs.joinmastodon.org/user/posting/))

**Pixelfed ActivityPub docs.** Shows that image-sharing federation includes sensitive-media and summary/CW behavior, making visual care and consent federated concerns rather than Mastodon-only customs. ([pixelfed.github.io](https://pixelfed.github.io/docs-next/spec/ActivityPub.html))

**PeerTube documentation.** Important for video-specific affect: platform following, trusted indexes, abuse reports, video blocking, comment approval, redundancy, and privacy/bandwidth concerns. ([docs.joinpeertube.org](https://docs.joinpeertube.org/api/activitypub))

**Lemmy federation documentation.** Shows how forum-like communities map to ActivityPub Groups, with posts, comments, moderator actions, user blocks, and community-level governance. Useful for distinguishing Lemmy affect from Mastodon affect. ([join-lemmy.org](https://join-lemmy.org/docs/contributors/05-federation.html))

**GoToSocial documentation.** Strong example of small-server privacy norms: default unlisted posting, mutuals-only visibility, and caution that other implementations may not respect privacy equally. ([docs.gotosocial.org](https://docs.gotosocial.org/en/latest/user_guide/posts/))

**Akkoma / Pleroma documentation.** Documents expressive features, quote support, custom emoji reactions, and Message Rewrite Policies, showing that the Fediverse includes more technically configurable moderation and expression systems than Mastodon. ([docs.akkoma.dev](https://docs.akkoma.dev/stable/configuration/cheatsheet/))

**BookWyrm documentation.** Social reading case: trusted communities, granular privacy controls, federated reviews, book metadata sharing, and cross-service interoperability. ([docs.joinbookwyrm.com](https://docs.joinbookwyrm.com/))

**WriteFreely and WordPress ActivityPub documentation.** Long-form publishing case: blogs become federated profiles; followers receive posts in home feeds; publication shifts from website/RSS/newsletter affect into social-feed affect. ([writefreely.org](https://writefreely.org/docs/main/writer/federation))

**Owncast documentation.** Livestreaming case: followers get go-live notifications, engagement appears in chat, and private mode requires follower approval. Useful for studying liveness and parasocial immediacy in ActivityPub. ([owncast.online](https://owncast.online/docs/social/))

**Bonfire federation guide.** Emerging/experimental case emphasizing interoperability, privacy controls, custom boundaries, and FEP experimentation. ([docs.bonfirenetworks.org](https://docs.bonfirenetworks.org/federation-interoperability.html))

**Bridgy Fed and EFF bridging guide.** Cross-protocol case: websites, Bluesky, and Fediverse accounts can become visible and interactive across networks; this raises consent, context, and translation questions. ([fed.brid.gy](https://fed.brid.gy/))

**Meta Engineering, “Threads has entered the fediverse,” 2024; IFTAS Threads moderation note, 2023; Carnegie defederation analysis, 2025.** Core sources for Threads federation and its governance/affective consequences: opt-in public-profile federation, increased moderation burden, compliance concerns, and Fedipact-style refusal. ([engineering.fb.com](https://engineering.fb.com/2024/03/21/networking-traffic/threads-has-entered-the-fediverse/))

**Spencer-Smith & Tomaz, “Labour pains,” Internet Policy Review, 2025.** Empirical interviews with admins/moderators after the post-Musk Twitter migration; crucial for moderation labor, growth stress, and Global North-South tensions. ([policyreview.info](https://policyreview.info/articles/analysis/content-moderation-challenges))

**Zhang et al., “Understanding Community-Level Blocklists in Decentralized Social Media,” 2025.** Mixed-methods study of Mastodon blocklists and moderators; central for analyzing defederation, transparency, false positives, collaborative moderation, and safety/openness trade-offs. ([arxiv.org](https://arxiv.org/html/2506.05522v1))

**Colglazier, TeBlunthuis & Shaw, “The Effects of Group Sanctions on Participation and Toxicity,” 2024.** Quasi-experimental evidence that defederation reduced activity on blocked servers but did not show evidence of reducing message toxicity. Important corrective to purely moral accounts of defederation. ([arxiv.org](https://arxiv.org/abs/2404.02109?utm_source=chatgpt.com))

**Muralidharan, Ahn & Truong, “Federating Governance,” 2026.** Current study of how Mastodon rules scale with instance size; useful for showing that decentralization does not eliminate familiar scaling pressures in community governance. ([arxiv.org](https://arxiv.org/abs/2606.05069?utm_source=chatgpt.com))

**Lisker & Mihaljević, “Data Ethics in the Fediverse,” 2025.** Warns that researchers often fail to align data practices with instance policies. Essential for ethically studying affective publics that may reject scraping. ([arxiv.org](https://arxiv.org/abs/2505.07606))

**Mayworm, DeVito, Delmonaco, Thach & Haimson, “Content Moderation Folk Theories and Platform Spirit,” 2024.** Not Fediverse-specific, but important for marginalized users’ interpretations of moderation systems and “platform spirit.” Helps explain why users arrive with platform trauma. ([sealab.sites.northeastern.edu](https://sealab.sites.northeastern.edu/portfolio/content-moderation-folk-theories-and-perceptions-of-platform-spirit-among-marginalized-social-media-users/))

**Roach, “The Whiteness of Mastodon,” Tech Policy Press, 2022.** A crucial critique of Mastodon norms around CWs, tone, and “Twitter-like” behavior as potentially racialized and exclusionary. ([techpolicy.press](https://techpolicy.press/the-whiteness-of-mastodon))

**Hochschild, _The Managed Heart_ / feeling rules.** The theoretical anchor for emotion management, what one “ought” to feel, and social expectations around emotional display. ([ucpress.edu](https://www.ucpress.edu/books/the-managed-heart/paper?utm_source=chatgpt.com))

**Ahmed, “Affective Economies” and _The Cultural Politics of Emotion_.** Explains how emotions circulate, stick to signs, and align subjects with/against others. Key for “Meta,” “Twitter,” “CW,” “blocklist,” and “fedi” as affective signs. ([voidnetwork.gr](https://voidnetwork.gr/wp-content/uploads/2016/08/Affective-economies-by-Ahmed-Sara-1.pdf?utm_source=chatgpt.com))

**Berlant, _Cruel Optimism_.** Frames the Fediverse’s desired object—a livable, non-corporate social web—as potentially sustaining and exhausting at once. ([dukeupress.edu](https://www.dukeupress.edu/cruel-optimism?utm_source=chatgpt.com))

**Terranova, “Free Labor,” 2000.** Key for understanding unpaid moderation, administration, accessibility, and community-maintenance labor as productive digital labor, not merely volunteer enthusiasm. ([web.mit.edu](https://www.web.mit.edu/schock/www/docs/18.2terranova.pdf?utm_source=chatgpt.com))
