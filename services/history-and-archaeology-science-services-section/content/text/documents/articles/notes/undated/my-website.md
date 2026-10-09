---
title: "my website"
author: ["emsenn"]
date: 2019-10-16
lastmod: 2020-02-11T14:12:56-05:00
tags: ["emsenn", "emsenn.net"]
draft: false
predecolonial: true
---
+++
title = "My website"
author = ["emsenn"]
date = "2019-10-16"
lastmod = "2020-02-12T11:42:41-05:00"
tags = ["emsenn", "emsenn.net"]
draft = false
predecolonial = true
description = "+++ title = \"My website\" author = [\"emsenn\"] date = \"2019-10-16\" lastmod = \"2020-02-12T11:42:41-05:00\" tags = [\"emsenn\", \"emsenn.net\"] draft = false predecolonial = true description = \"+++ title = \\\"my website\\\" author = [\\\"emsenn\\\"] date…"
aliases = ["My Website"]
specialization = "research"
+++

## Introduction {#introduction}

This document contains the configuration, data, and basic content for my personal website, available at [https://emsenn.net](https://emsenn.net).

It's meant to be built with [Hugo](https://gohugo.io).


## Personal Website {#personal-website}

My personal website is implemented using the [Hugo website generator](https://gohugo.io/), using my own [theme](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme).

This document has sections for the following:

-   The [configuration file](#hugo-configuration) that Hugo and my theme use.
-   Some of the pages on that website. They're exported from their [Org-mode source file](https://code.cyberearth.systems/emsenn/personal-website) into Hugo-compatible Markdown using [Ox-Hugo](https://ox-hugo.scripter.co). Additional pages, like those for my writing, are created by using Ox-Hugo on the appropriate Org-mode file.
-   Local data, such as an array of my recent activities or upcoming plans.

This document is largely just the content and configuration - to see how it is used, you'll want to look at the [theme documentation](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/).


### Hugo Configuration {#hugo-configuration}

This section contains the configuration I use for Hugo. To learn more about how any of these variables are used, read the documentation for the applied [Hugo theme](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/).

<a id="code-snippet--config.toml"></a>
```toml
baseURL = "https://emsenn.net/"
languageCode = "en-us"
enableEmoji = true
title = "emsenn"

theme = ["hugo-personal-website-theme"]
[taxonomies]
  category = "categories"
  narrative = "narratives"
  tag = "tags"
[markup.goldmark.renderer]
  unsafe= true
[params]
  author = "emsenn"
  email = "emsenn@emsenn.net"
  tribalHeritage = "Itázipčho (Sans Arc of the Lakota Sioux)"
  genderIdentity = "cis man"
  mainPages = ["contact", "support"]
  mainSections = ["catechisms", "collections", "curriculums", "essays", "fictions", "formal-documents", "games", "guides", "journal-entries", "letters", "lists", "logs", "media-criticisms", "plans", "poems", "radioplays", "records", "stories", "software", "transcripts", "writing-exercises"]
  makeVerb = "am decolonizing"
  makeThings = ["my thinking", "way of life"]
  makeFocus = "the potential to break imperialism"
  showHCard = false
  properName = "emsenn"
  pronounNominative = "they"
  pronounOblique = "them"
  pronounPossessive = "theirs"
  honorificPrefix = "M"
  canonicalURL = "https://emsenn.net"
  nickname = "emsenn"
  logo = "/imgs/emsenn-logotype.png"
  logoAlt = "The text '(ems), representing emsenn's logotype."
  givenName = "Morgan"
  familyName = "Sennhauser"
  locality = "Chapel Hill"
  region = "North Carolina"
  country = "United States of America"
  traditionalSovereignty = "Shoccoree"
  phoneNumber = "18143673660"
  photoUrl = "imgs/emsenn-logotype.png"
```


#### Built-in Variables {#built-in-variables}

The following variables come at the start of the configuration file, and are built-in to Hugo.


##### `baseURL` {#baseurl}

Available in templates through `.Site.BaseURL`.


##### `languageCode` {#languagecode}

Available in templates through `.Site.LanguageCode`.


##### `enableEmoji` {#enableemoji}


##### `title` {#title}


##### `author` {#author}


##### `email` {#email}


##### `theme` {#theme}


#### Theme Parameters {#theme-parameters}


##### `mainPages` {#mainpages}

Available through `.Site.Params.mainPages`, this list of strings indicates which pages are considered "main" on my website.


##### `mainSections` {#mainsections}


##### `makeVerb` {#makeverb}


##### `makeThings` {#makethings}


##### `makeFocus` {#makefocus}


##### `showHCard` {#showhcard}


##### `properName` {#propername}


##### `honorificPrefix` {#honorificprefix}


##### `canonicalURL` {#canonicalurl}


##### `nickname` {#nickname}


##### `logo` {#logo}


##### `logoAlt` {#logoalt}


##### `givenName` {#givenname}


##### `familyName` {#familyname}


##### `locality` {#locality}


##### `region` {#region}


##### `country` {#country}


##### `phoneNumber` {#phonenumber}


##### `photoURL` {#photourl}


### Native Content {#native-content}

The following sub-sections each represent a page on my website.


#### emsenn {#emsenn}

this is my website

please go forward with intention:

the things here were written by one living thing wishing to communicate with others.

useful pages:

-   [using my website](/stories/using-my-website)
-   [how to contact me](/contact)
-   [my recent and planned activities](../../research/2026/07/31/lenticule-import/historical-website/personal-summary)
-   [site overview](/site-overview)


#### using my website {#using-my-website}

on my website

most pages tell a story

(the telling (tale) is not the story)

before the tale is a header, like above

after the tale is a footer, like below


#### personal summary {#personal-summary}


#### site overview {#site-overview}


#### my work {#my-work}

my work is focused around personal decolonization and helping those in my community do the same

**_what does decolonization mean?_**

it means thinking and acting outside the current kyriarchal hegemony[^fn:1] that most communities live within

some aspects of decolonization are:

-   food sovereignty
-   sustainable production of material goods
-   enabling community self-determination


#### contact {#contact}

**_in a hurry?_**

send an email to [emsenn@emsenn.net](mailto:emsenn@emsenn.net).

**_representing a government?_**

check my [legal disclosures and policies](/legal).

**_want to give me money?_**

I have a page for [receiving financial support](/support).

Other communication channels are explained below.

<div class="ox-hugo-toc toc local">
<div></div>

- [personal and private](#personal-and-private)
    - [email](#email)
    - [matrix](#matrix)
- [public](#public)
    - [Microblogging](#microblogging)

</div>
<!--endtoc-->


##### personal and private {#personal-and-private}


###### email {#email}

you can **_send me an email_**.

my private email is [emsenn@emsenn.net](mailto:emsenn@emsenn.net).


###### matrix {#matrix}

I have an account on the Matrix homeserver at @emsenn:matrix.org.

I also run a small collection of channels: email me for details.


##### public {#public}


###### Microblogging {#microblogging}

I'm active within the _Fediverse_, a network of communication platforms

my main account is at [@emsenn@myasstodon.xyz](https://myasstodon.xyz/@emsenn)


#### support {#support}

I focus my life around personal decolonization and helping those in my community do the same

this is made possible with financial contributions from humans like you

**_thank you!_**


###### donate {#donate}

-   one-time:
    -   [PayPal](https://paypal.me/emsenn)
    -   [Ko-fi](https://ko-fi.com/emsenn)
-   recurring:
    -   [LiberaPay](https://liberapay.com/emsenn/donate)
    -   [Patreon](https://patreon.com/emsenn)

**_please note,_** as my work is released into the public domain, financial contributions do not provide access to any "exclusive" content

if there is another service through which you'd like to contribute, please [send an email](mailto:emsenn@emsenn.net)


###### details {#details}

I would like to avoid working except to provide decolonization actions and education

to do that, I need about \$600USD each month

as of February 11, 2020, I get \$2.30 each week from LiberaPay and \$22.00 each month from Patreon: about \$41.20 a month (or 6.8% of total expenses)


#### Services {#services}


##### Services Listing {#services-listing}


##### Tarot Reading {#tarot-reading}

I think **_tarot readings_** can be a wonderful problem-solving tool,
regardless of the beliefs of anyone involved: they're a great way for
_framing a question in a unique way_.

I've structured my tarot readings like my other consultation sessions: you can click the
button below to fill out a short form to apply.  If my service seems like a good fit, we
can schedule your session.  Otherwise, I'll try to refer you to more useful information.

Generally, I consider a tarot reading to be most useful when you _feel_ like you're
struggling with something, but can't seem to _think_ clearly about the problem.

If I accept you for a session, it'll take 30 to 40 minutes.  We'll meet through an online
video conference, but you don't have to use your microphone or video if you don't want.
Afterward, you'll get a brief reporting on the cards that were drawn, and a recording of
the session.

> "I wasn't interested in any of the mysticism behind tarot, but it didn't matter: emsenn's
> reading still helped me understand why I was butting heads with my coworker." --
> Anonymous Client

To apply for a session, please [send an email](../../research/2026/07/31/lenticule-import/historical-website/<mailto:emsen@emsenn.net>) containing the
following information:

-   Some **_personal information_**: the _name_ you'd like me to call you, and the _pronouns_
    you'd like me to use in reference to you.
-   A mention of **_this service_**: Put _Tarot Reading_ as your email's subject, or include
    it prominently in the body.


#### follow fridays {#follow-fridays}


##### 2019 {#2019}


###### 2019-10 October {#2019-10-october}

-    2019-10-25

    -   [@GwenfarsGarden@sunbeam.city](https://sunbeam.city/@GwenfarsGarden) posts about gardening in the UK, which is just different enough from gardening here to be really fascinating to me.

    -   [@ekaitz\_zarraga@mastodon.social](https://mastodon.social/@ekaitz%5Fzarraga) is making a Scheme static site generator

    -   [@indie@ecosteader.com](https://ecosteader.com/@indie) posts stuff about climate change and ecology that is new info to me, quite often

    -   [@tuxom@mastodon.at](https://mastodon.at/@tuxom) posts a LOT about climate change. Good for keeping your eyes open.

    -   [@ajroach42@retro.social](https://retro.social/@ajroach42) who does retrocomputing but focused on future use-cases.


###### 2019-07 July {#2019-07-july}

-    2019-07-05

    -   [@Kris@tabletop.social](https://tabletop.social/@Kris) is doing some interesting fantasy world-building stuff.
    -   [@ardydo@masto.donte.com.br](https://masto.donte.com.br/@ardydo) makes cool games that they share at [https://ardydo.itch.io/](https://ardydo.itch.io/).
    -   [@darius@friend.camp](https://friend.camp/@darius) cares about how we talk online; recently he released his instance's fork of Mastodon called [Hometown Fork](https://github.com/hometown-fork/hometown).


###### 2019-06 June {#2019-06-june}

-    2019-06-28

    -   [@twee@patch.cx](https://patch.cx/users/twee) has reasonable opinions about technology.
    -   [@\_emacsomancer@linuxrocks.online](https://linuxrocks.online/@%5Femacsomancer) has an interest in Old English and Emacs.
    -   [@maloki@elekk.xyz](https://elekk.xyz/@maloki) is involved with the communities of several ActivityPub-federated platforms and boosts a lot of commentary about contemporary issues within the communities using those platforms.

-    2019-06-21

    -   [@acciomath@mathstodon.xyz](https://mathstodon.xyz/@acciomath) is a young person about to enter an American university to study mathematics, and I like reading out how much thought they're putting into making sure they get something out of that education. More personally, I'm advocating they adopt a similar _Emacs_ + _Org-mode_ workflow to me.
    -   [Julio Biason](https://functional.cafe/@juliobiason) just wrote a bunch of blog posts about what they've learned with their three-decades working as a computer programmer. A lot of it seemed obvious to me as a hobbyist, but it's all being taken as very insightful by long-time professionals, so I think it'll be interesting to mull over why I perceive it so differently.


###### 2019-01 January {#2019-01-january}

-    2019-01-19

    -   [@IgnaceK@mastodon.social](https://mastodon.social/@IgnaceK), a real life friend of mine.
    -   [@starbreaker@pleroma.site](https://pleroma.site/@starbreaker), posts interesting stuff about writing and tech
    -   [@staticsafe@mastodon.zombocloud.com](https://mastodon.zombocloud.com/@staticsafe), posts cool stuff about tech and the people who use it.
    -   [@kaushalmodi@mastodon.technology](https://mastodon.technology/@kaushalmodi), always helpful with my Emacs questions.


#### reviews {#reviews}


##### of my writing {#of-my-writing}

> "I am really enjoying [emsenn's writing] which talks about organisation, activism, org-mode, LISP, Free Software and related issues in great detail, with great clarity and, it seems to me, a unified underlying vision. I don’t agree with everything they write, but each post has strong arguments and makes me think." - Reinder Dijkhuis, [Linklog for June 29, 2019](http://reinderdijkhuis.com/wordpress/2019/06/29/linklog-for-june-29-2019-massive-link-dump/)

<!--quoteend-->

> "reading emsenn's [I Cannot Trust Post-Modern Conservatives](https://emsenn.net/essays/i-cannot-trust-post-modern-conservatives/) and I keep nodding along and being impressed with the clarity of their writing. I've been one of those people that didn't have any beliefs and just wanted to argue but then I stopped being a dumb teenager" - [@y0x3y@hackers.town](https://hackers.town/@y0x3y)


#### legal disclosures and policies {#legal-disclosures-and-policies}

my legal policies aim to balance enabling my own freedom of action with the requirements placed on me by the law

depending on the action, this balance may be difficult to determine

please, **assume naivety and ignorance rather than malice:** explaining to me my fault and nicely requesting a change is more likely to receive a prompt response than sending legal threats


##### handling legal "threats" {#handling-legal-threats}

legal "threats" are indications that a party wishes to take legal action against me, without an appropriate justification

I reserve the right to publish and expose all legal threats made against me

they will be considered an attempt to harm me by abusing the legal system, and I will respond accordingly


##### Doe subpoenas {#doe-subpoenas}

if compelled by a Grand Jury, I may be required to disclose information about private correspondence and communications using a [Doe subpoena](http://en.wikipedia.org/wiki/Doe%5Fsubpoena)


##### gag-order subpoena {#gag-order-subpoena}

I will not recognize or respect unlawful gag-order subpoenas from Grand Juries which do not have the legal right to do so, and any unlawful gag-order will be considered a legal threat

subpoenas on which the "gag" is permanently (explicitly never expires) or indefinite (say they will expire upon further court order) are unlawful

what follows is a warrant canary - the text between "Begin warrant canary" and "End warrant canary" may be an [indication](https://en.wikipedia.org/wiki/Warrant%5Fcanary) of my receipt of legally "gagged" subpoenas.

begin warrant canary

```txt

```

end warrant canary


##### Digital Millenium Copyright Act {#digital-millenium-copyright-act}

I must follow the Digital Millenium Copyright Act

if you believe I am distributing copyright-protected work without authorization, **and you are the owner of the copyright, or authorized to act on their behalf**, you may [contact me](/contact)


#### Listing Descriptions {#listing-descriptions}


##### Catechisms {#catechisms}

These **_catechisms_** are questions-and-answers intended to teach others how my [personal directives](/directives) influence my holistic philosophy.


##### Collections {#collections}

These pages contain **_collections_** of information about a specific topic, such as reading lists, poetry books, and cookbooks.


##### Curriculums {#curriculums}

These paages contain **_curriculums_** for teaching oneself about a specific topic.


##### Directives {#directives}

This collection of _directives_ are a **_living_** _document_: it is subject to continued change and amendments.

These **_directives_** are guidelines for how I approach choices in my life.

These _directives_ cover a subject which is **_difficult_**: the language used may have flaws and may not accurately convey my intentions. It is suggested you assume I wrote the piece honestly and with sincere intentions.

Missing _directives_ are private, but no less important than those which I publicize.


##### Software {#software}

These are collections of **_software_**: statements in a programming language (or several) gathered together to enable a certain task (or set of tasks.)


##### Essays {#essays}

These are **_essays_** I've written at various times, about various topics.


##### Fictions {#fictions}

These are **_fictions_** I've written.


##### Games {#games}

These **_games_** are things I've made for folk to play. Have fun!


##### Guidebooks {#guidebooks}

These **_guidebooks_** are manuals for how I do the things I do. Not necessarily the things I do well, either.


##### Journal Entries {#journal-entries}

These **_journal entries_** are long-form descriptions of my activities or plans for a period of time.


##### Logs {#logs}


##### Poems {#poems}

These **_poems_** are bits of writing that I wrote.


##### Radioplays {#radioplays}

These **_radioplays_** are scripts for audio-based stories.


##### Transcripts {#transcripts}

These **_transcripts_** are the written or digitized form of a spoken or analog text.


##### Writing Exercises {#writing-exercises}

These are writing exercises I've completed.


#### now {#now}


#### plans {#plans}


#### collections {#collections}


##### education resources {#education-resources}


###### tools {#tools}

-    research

    -   [SciHub](https://mg.scihub.ltd/) enables on-the-fly research liberation

        (it removes paywalls from academic papers)


##### autonomous collectives {#autonomous-collectives}

this page is a collection of non-indigenous autonomous collectives I'm aware of: people who are currently living "in anarchy"

some of these collectives are just a couple people
some consist of tens-of-thousands

if you have a recommendation for this list, please email [emsenn@emsenn.net](mailto:emsenn@emsenn.net).


###### 100 Rabbits {#100-rabbits}

100 Rabbits is a "traveling design studio on a sailboat"

read more on their [website](https://100r.co/).


###### Internationalist Commune of Rojava {#internationalist-commune-of-rojava}

The Internationalist Commune of Rojava was organized in early 2017 to plan a future for a decolonized Africa and Middle East

Read more on their [website](https://internationalistcommune.com/)

As of October 10th, 2019, Turkey has been engaged in military action against the defensive militias of Rojava.


###### Vila Eloíse {#vila-eloíse}

Vila Eloíse is a "small queer rural house at Galiza (northwest of Spain)," which focuses on providing a space safe to traveling LGBTQIA+ individuals, additionally providing artistic working spaces

read more about them at their [blog](https://vilaeloise.home.blog), and follow their [microblog at queer.party](https://queer.party/@vilaeloise).


###### Youth Anarchist Collective of Cape Town {#youth-anarchist-collective-of-cape-town}

founded in the fall of 2019, the YAC-CT is "a small youth organisation in the Platformist tradition based on advocating for anarchist-communist solutions to the issues faced by South Africa"

read more about them through their self-maintained [profile on RiseUp](https://we.riseup.net/yac-ct/about-us), and follow their [microblog at anarchism.space](https://anarchism.space/@yac%5Fct)


##### North Carolina Groups {#north-carolina-groups}

This is a collection of groups I've found interesting in my area.


##### reading list {#reading-list}

the items in this list are sorted by main topic:

<div class="ox-hugo-toc toc local">
<div></div>

- [Botany](#botany)

</div>
<!--endtoc-->


###### Botany {#botany}

-   [Guide for Roadside Wildflower Viewing](https://theprairieecologist.files.wordpress.com/2020/01/a-field-guide-to-roadside-wildflowers-at-full-speed%5Fjanuary2020-1.pdf) is lampoon of highway/car culture.


#### Eco-Industrialism {#eco-industrialism}

It is not necessary that our society depend on constant consumption and growth to flourish. I believe we can restructure ourselves to work in cooperation with our global ecology, instead of through its exploitation.


##### What is "eco-industrialism"? {#what-is-eco-industrialism}

**_Eco-industrialism_** is a label for my social philosophy. It recognizes that:

1.  Humans must produce for themselves, food and goods, in order to live.
2.  Such production requires consumption.
3.  If we consume all our resources, we can't keep producing, so we can't keep living. (We'll go extinct.)
4.  So, human consumption needs to be sustainable.

It is an extension of the concepts prevalent in sustainable agriculture to all fields of human labor.


##### Why eco-industrialism? {#why-eco-industrialism}

Our social institutions are led by our existing industrial institutions: capitalistic conglomerate corporations. These corporations, liable to their shareholders, must work to secure greater profit. This pursuit of profit has led to decisions which have exploited our environment, causing a global harm to our ecology that is accelerating in severity.

We must restructure our means of industry so that sustainable use of our environment is prioritized over profit. Local democracies operating in confederation via recallable delegates (industrial unionism) seems like the only way to achieve that level of accountability, regardless of our level of technology or infrastructure.


##### How would we implement eco-industrialism? {#how-would-we-implement-eco-industrialism}

I am not sure. My notions of eco-industrialism intersect with the concepts of industrial unionism and eco-socialism, so their means are likely to be in-line with mine: removing support for exploitative industries while building democratic ones.


##### Where can I learn more? {#where-can-i-learn-more}

Here's some relevant Wikipedia articles:

-   [Agroecology](https://en.wikipedia.org/wiki/Agroecology) is sometimes used to refer to a synonymous philosophy, but has also been widely used to refer to a less-philosophical approach to industrial agriculture, and rarely extends outside agricultural industries.
-   [Eco-socialism](https://en.wikipedia.org/wiki/Eco-socialism) isn't inherently similar as a philosophy, however many of the means they recommend overlap with mine. Eco-socialism does not always imply such a focus on democratic institutions, for example, but they do advocate for sustainable industries.
-   [Industrial unionism](https://en.wikipedia.org/wiki/Industrial%5Funionism) is one method of achieving democratic workplaces, and one I advocate for.


### Native Data {#native-data}

The following data


#### Donation Means {#donation-means}

```toml
paypal = ["Paypal", "https://paypal.me/emsenn"]
kofi = ["Ko-fi", "https://ko-fi.com/emsenn"]
liberapay = ["LiberaPay", "https://liberapay.com/emsenn/donate"]
```


#### Activities {#activities}

```toml
[activities]
2020-01-29 = ["wrote about my [plans for my online presence](/stories/online-presence-spring-2020)"]
2020-01-28 = ["started revamping [my website](/software/my-website)"]
2019-10-21 = ["began to draft a [curriculum](/curriculums/eco-industrialism-curriculum) for teaching myself eco-industrialism"]
2019-10-16 = ["wrote about [eco-industrialism](../../research/2026/07/31/lenticule-import/historical-website/eco-industrialism)"]
2019-09-27 = ["planted my fall vegetables"]
2019-09-21 = ["attended a protest against UNC-CH's coal cogeneration plant"]
2019-09-20 = ["attended a climate crisis protest in Chapel Hill"]
2019-08-18 = ["joined the Raleigh-Durham branch of the I.W.W."]
2019-07-14 = ["added an [h-card](http://microformats.org/wiki/h-card) to my [homepage](https://emsenn.net)"]
2019-07-08 = ["wrote and released [Curated Thoughts on FOSStodon](/essays/curated-thoughts-on-fosstodon/), about a contemporary situation involving the intersection of the kyriarchy and free software communities"]
2019-07-07 = ["released an older essay, [A Few Bad Apples](/essays/few-bad-apples/), about why I judge all police for the actions of a few"]
2019-07-06 = ["wrote [There and Back Again (A Fediverse Journey)](/essays/there-and-back-again-a-fediverse-journey/)", "added my essays to my website"]
2019-06-09 = ["started re-doing my personal site in _Hugo_"]

[plans]
current = ["improving my personal website by joining the [IndieWeb](https://indieweb.org/)", "planning my spring garden"]

soon = ["scale up my vermicomposting", "decide if I want to continue making a computer game"]

```


#### Plans {#plans}

```toml
soon = [
  "Improve this website: join the ",
]
```


### Remote Data {#remote-data}


#### Webrings {#webrings}


##### Writers of the Fediverse {#writers-of-the-fediverse}

[^fn:1]: you might call it whiteness, capitalism, the West, or imperialism

I release as much of my work as I can for the _benefit of the commons_, so that anyone can use and change it however serves them best

I currently accept support through the following platforms
