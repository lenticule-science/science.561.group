+++
title = "How My Projects Relate"
author = ["emsenn"]
tags = ["personal", "Teraum", "Brave-Old-World", "Past-the-Garden-Green", "The-Delvers", "qtMUD", "Fyreside", "The-Okaga"]
draft = false
+++

<div class="ox-hugo-toc toc local">
<div></div>

- [Introduction](#introduction)
- [Teraum](#teraum)
- [Brave Old World](#brave-old-world)
- [Tales from Teraum](#tales-from-teraum)
- [Past the Garden Green](#past-the-garden-green)
- [The Delvers](#the-delvers)
- [Manuals](#manuals)
- [Emacs Stuff](#emacs-stuff)
- [qtMUD](#qtmud)
- [Fyreside](#fyreside)
- [The Okaga](#the-okaga)
- [Assorted Projects](#assorted-projects)
- [Conclusion](#conclusion)

</div>
<!--endtoc-->


## Introduction {#introduction}

Like many who have the time and means to put their computers to productive use, I have a lot of projects I'm working on. A lot of them are related to each other: some in obvious ways, others in ways that are a little more hard-to-see.

One of the primary interests behind my projects is my interest in telling funny fantasy stories - I've always enjoyed them as a way of looking at our own world. Another is my interest in communication - I know that's kind of broad, so I'll say I think my specific interests are in how the words and tools we use to conduct communication affect our thinking.

I'd like to develop all of these interests in some way, across my projects, while still feeling like I'm working on something productive, useful, or at the least, entertaining.


## Teraum {#teraum}

I think the right project to look at, to serve as the basic point-of-reference, is **_Teraum_**, my fantasy setting and its implementation as a collection of resources for playing tabletop role-playing games. Obviously working on Teraum meets me "tell funny fantasy stories" desire, but why do I want to focus on implementing it as a collection of resources for tabletop role-playing? (Instead of, say, a novel.)

Well, personally, I like tabletop role-playing games, and when I play them, I tend to set them on Teraum. But more pragmatically, I think I'll have better luck feeling productive by implementing them this way instead of as a novel: tabletop RPGs are popular enough that there's a market for materials for them, and it's easier to make a 12-page adventure sheet and self-publish that, than write and publish a full novel.

The important thing here is that it makes me _feel_ productive, even if, objectively, (financially,) the novel would be a more productive use of time. There is, of course, the matter that adventure materials are lower-risk, simply because I can release 10 of them, instead of 1 novel.

Why not short stories, then? Well, as I said, I have an interest in tabletop role-playing myself, so they're of more use to me than short stories, which is one thing. But also, I think that writing materials for role-playing games will let me better explore my interests in communication. After all, from an abstract perspective, tabletop RPG adventures are "Here's a constructed problem, solve it as a group," and as the person running the session or a player, that's a fun communication exercise.

Oh - I've been talking just about adventures (the actual guidelines for a session of play,) but I also plan on developing lots of associated resource books, that provide extra details about towns, people, creatures, and so on. Those wouldn't be so fast to write as the adventures, but they'd fill it out and make the project more commercial, and I enjoy that sort of writing, anyway. But - to be clear - the primary focus with Teraum is writing adventures:

_**Teraum** is my primary project._


## Brave Old World {#brave-old-world}

I mentioned that Teraum is resources for tabletop role-playing, but I never specified what game ruleset I'd want to use.

**_Brave Old World_** is my own custom ruleset based on the Dungeon World, but made to let the gameplay language blend in with normal English - the intention being so that natural-sounding sentences like "Climbing the wall surrounding the Culthbert Ciderworks grounds after hours risks being caught by one of their guards," can translate to in-game mechanics, like "If a player climbs the walls at night, they have to roll two six-sided die and, if they get a result of six or less, they get caught by a guard." (This is simplified, but hopefully conveys the point.)

Brave Old World, as a project, supports Teraum - it helps inform the language I'll need to use in the adventures and reference books. So, as I develop Teraum adventures, I'll need to develop parts of Brave Old World to go with it: refine the core rules, add supplements, and so on.

So, put another way, _**Teraum** will be dependent on **Brave Old
World**_.


## Tales from Teraum {#tales-from-teraum}

Sometimes I have specific stories in the Teraum setting I want to tell. **_Tales from Teraum_** are those stories, implemented as, well, normal short stories.

So, _**Tales from Teraum** supplements **Teraum**._


## Past the Garden Green {#past-the-garden-green}

**_Past the Garden Green_** is another specific story set in the Teraum setting, but I'd like to implement it as a radioplay (podcast) for kids.

_**Past the Garden Green** supplements **Teraum**_.


## The Delvers {#the-delvers}

**_The Delvers_** is another specific story set in the Teraum setting, written as a novel or novella.

_**The Delvers** supplements **Teraum**_.


## Manuals {#manuals}

Handling all this writing means I benefit from having a pretty explicit writing process, which I plan to record in my **_Writing Manual_**.

That manual will have the mechanical methods I use to accomplish writing, implemented through the Emacs software. I also have another manual, a **_Style Manual_**, which covers the tone and content of the writing.

In order to share this writing, I'll need to be able to get it into well-formatted documents, which is what my **_Publishing Manual_** is for.

So, _**Teraum and its supplements** are dependent on the **Writing Manual**, **Style Manual**, and **Publishing Manual**._


## Emacs Stuff {#emacs-stuff}

To be able to implement those manuals, I'll need to _have_ a mechanical process for writing and publishing documents - something I accomplish, for now, with the software Emacs. **_Emacs Stuff_** is my collection of configurations and resources for that software, which enable me to use it as I want.

_The **Manuals** are dependent on **Emacs Stuff**._


## qtMUD {#qtmud}

I have some other projects that might have started related to Teraum, but have since grown apart - the most notable being **_qtMUD_**, my attempt at implementing a _multi-user dimension_ engine: a game engine specifically built for running text-based role-playing games. (Prior to wanting to implement Teraum as a collection of tabletop roleplaying game resources, I wanted to implement it as a MUD.)

Because it is implemented using the literate programming paradigm, _**qtMUD** is dependent on the **Writing**, **Style**, and **Publishing Manuals**._


## Fyreside {#fyreside}

**_Fyreside_** is a library written for the qtMUD engine, to help demonstrate its features. It's a card game where the cards are things from the Teraum setting.

_**Fyreside** is dependent on **qtMUD** and supplements **Teraum** and
**qtMUD**._


## The Okaga {#the-okaga}

**_The Okaga_** is another library written for qtMUD, this time a scifi role-playing game; a more traditional MUD.

_**The Okaga** is dependent on and supplements **qtMUD**._


## Assorted Projects {#assorted-projects}

Thinking of it, those are all my projects with any sort of real dependency on each other, but isn't the limit of what I'll find myself working on. For example, I'll want to design CSS and PDF styles to go with the various types of document.


## Conclusion {#conclusion}

Writing **Teraum** is my primary project. **Tales from Teraum**, **The Delvers**, and **Past the Garden Green** supplements that.

**Teraum** is dependent on **Brave Old World**.

Writing **qtMUD** is a secondary project.

**Fyreside** is dependent on **qtMUD** and supplements **Teraum** and **qtMUD**.

**The Okaga** is dependent on and supplements **qtMUD**.

**Teraum and its supplements** and **qtMUD and its supplements** are dependent on the **Writing Manual**, **Style Manual**, and **Publishing Manual**.

The **Manuals** are dependent on **Emacs Stuff**.