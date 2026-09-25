---
title: Plans
description: "In this new records file, there are two primary sections: a \"Log\" section that contains a chronologically-sorted hierarchy of journal and ledger entries, and a \"Compositions\" section that is organized into a hierarchy of document types…"
---
# Plans

## Reading

### TODO \[#B\] Read [Ways of Life 1: Original Affluence](~/dev/c/bib.org::*Ways of Life 1: Original Affluence)

### TODO \[#B\] Read [Ways of Life 2: Another Perspective](~/dev/c/bib.org::*Ways of Life 2: Another Perspective)

### TODO \[#B\] Read [Ways of Life 3: Indigenous Anarchism](~/dev/c/bib.org::*Ways of Life 3: Indigenous Anarchism)

### TODO \[#B\] Read [Pollution is Colonialism](~/dev/c/bib.org::*Pollution is Colonialism)

# Journal

## 2021-W40 {#w40}

### \[2021-10-09 Sat 14:36\] {#sat-1436}

In this new records file, there are two primary sections: a ***"Log"*** section that contains a chronologically-sorted hierarchy of *journal* and *ledger entries*, and a ***"Compositions"*** section that is organized into a hierarchy of document types and individual documents, each of which is constructed with entries from the *"Log"* section, along with contextualizing paragraphs.

### \[2021-10-09 Sat 14:55\] {#sat-1455}

Now that I've created a new records file, I want to bring in my old Emacs configuration. At the moment, it's poorly organized as chunks in my older records file, and has some stuff I don't use. I figure bringing it in will be a good test of my notion about creating log entries and using them for generating compositions, like my Emacsen.

I use [straight.el](https://github.com/raxod502/straight.el) as my Emacs package manager. If I remember right, I started using it because it was used by someone whose Emacsen influenced mine, at one point.

It's important to note that Git needs to be installed on whatever system is running Emacs; that's how straight.el bootstraps itself.

<div class="captioned-content">

<div class="caption">

The Elisp declarations that bootstrap straight.el, the Emacs package manager.

</div>

``` {#2021-10-09-straight-el-bootstrapping-elisp .elisp}
(defvar straight-install-script-path
  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

(defvar bootstrap-version)
(let ((bootstrap-file
   (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
  (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
    (url-retrieve-synchronously straight-install-script-path
     'silent 'inhibit-cookies)
  (goto-char (point-max))
  (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
```

</div>

### \[2021-10-09 Sat 18:34\] {#sat-1834}

To continue refining my Emacsen configuration, I'm going to pull in a few things that tweak how the software looks and acts, generally:

<div class="captioned-content">

<div class="caption">

The Elisp declarations that configure my Emacsen's interface.

</div>

``` {#2021-10-09-emacsen-interface-config-elisp .elisp}
(setq make-backup-files nil)
(add-to-list 'exec-path "~/bin")
(setq inhibit-startup-message t)
(setq visible-bell 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; LANDBACK\n")
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default truncate-lines t)
(setq-default line-spacing 1)
(setq sentence-end-double-space nil)
(global-visual-line-mode t)
(setq echo-keystrokes 0.1)
(setq fill-column 68)
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
```

</div>

<div class="captioned-content">

<div class="caption">

The Elisp declaration that sets up the Emacs theme Nano

</div>

``` {#2021-10-09-emacsen-nano-theme-elisp .elisp}
(straight-use-package '(nano-theme :type git :host github
                   :repo "rougier/nano-theme"
                   :config (load-theme 'nano t)))
```

</div>

There's also some user configuration that needs to be done:

<div class="captioned-content">

<div class="caption">

An elisp declaration to config an Emacsen's user.

</div>

``` {#2021-10-09-emacsen-user-config-elisp .elisp}
(setq user-mail-address "emsenn@emsenn.net")
(setq user-full-name "emsenn")
```

</div>

### \[2021-10-09 Sat 18:42\] {#sat-1842}

I want to hold off on bringing in too much of my Org-mode configuration without reading it over, but I'll go ahead and bring over some of the other packages I use:

<div class="captioned-content">

<div class="caption">

The Elisp declaration to install Beancount-mode with straight.el

</div>

``` {#2021-10-09-beancount-straight-el-elisp .elisp}
(straight-use-package '(beancount :type git :host github :repo "beancount/beancount-mode"))
```

</div>

<div class="captioned-content">

<div class="caption">

The Elisp declaration to install Org-WC with straight.el

</div>

``` {#2021-10-09-org-wc-straight-el-elisp .elisp}
(straight-use-package '(org-wc :type git :host github :repo "tesujimath/org-wc"))
```

</div>

<div class="captioned-content">

<div class="caption">

The Elisp declaration to install HTMLize with straight.el

</div>

``` {#2021-10-09-htmlize-straight-el-elisp .elisp}
(use-package htmlize :straight t)
```

</div>

Oh! And there's a bugfix I have in my configuration that I should probably carry with me:

<div class="captioned-content">

<div class="caption">

The Elisp declaration to resolve a bug with TLS in Emacs.

</div>

``` {#2021-10-09-tls-bugfix-elisp .elisp}
(if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
```

</div>

### \[2021-10-09 Sat 19:03\] {#sat-1903}

So it looks like my Org-mode configuration, in my old Emacsen, starts off as kind of a shell or frame, holding in some code snippets it pulls in. That seems reasonable enough to me, so I'm going to go ahead and copy in that frame, into the composition. Then I can copy in the basics of my Org-mode configuration stuff now, and not have to worry about the stuff related to publishing projects or anything.

Once I've got the basics, I want to go ahead and get a capture template set up for journal entries, and start thinking about what other sorts of entries will look like.

I used "shooting BBs at squirrels" as a recent kind of test entry, but since a couple days after I started, the squirrels have been staying away![^1]

### \[2021-10-09 Sat 19:14\] {#sat-1914}

So here's the basics of my Org-mode configuration:

<div class="captioned-content">

<div class="caption">

Elisp declarations configuring an Emacsen's Org-mode install.

</div>

``` {#2021-10-09-org-mode-config-elisp .elisp}
(setq org-directory "~/org")
(setq org-startup-folded 'fold)
(setq org-hide-block-startup 'hideblocks)
(setq org-catch-invisible-edits 'show-and-error)
(setq org-agenda-files (list "~/org"))
(setq org-export-with-section-numbers nil)
(setq org-export-with-smart-quotes nil)
(setq org-export-with-toc nil)
(setq org-html-htmlize-output-type 'nil)
(setq org-html-validation-link nil)
(setq org-html-html5-fancy t)
(setq org-log-done 'time)
(setq org-log-into-drawer 'LOGBOOK)
(setq org-image-actual-width '(400))
(org-babel-do-load-languages 'org-babel-load-languages
                 '((shell . t)))
```

</div>

There's also keybindings:

<div class="captioned-content">

<div class="caption">

Elisp declarations for configuratin an Emacsen's Org-mode keybindings.

</div>

``` {#2021-10-09-org-mode-keybindings-elisp .elisp}
("C-c l" . org-store-link)
("C-c a" . org-agenda)
("C-c c" . org-capture)
("C-c t" . org-toggle-link-display)
("C-c C-q" . counsel-org-tag)
("<f8>" . emacsen-org-capture-capture-at-point)
```

</div>

### \[2021-10-09 Sat 19:28\] {#sat-1928}

So I think setting up Org-mode capture templates works like this:

<div class="captioned-content">

<div class="caption">

A test of setting Org-mode capture templates

</div>

``` {#2021-10-09-capture-template-test .elisp}
(setq org-capture-templates
  `(("l" "Log Entry")
    ("lj" "Journal Entry" entry
     (file+datetree "~/org/emsenn.org")
     "* %U     \n\n%?\n"
     :clock-in t))))
```

</div>

So, in my Emacsen composition, I'm going to put the first line (and a closing parantheses, then I can write capture templates in my logs and add them as I go.

<div class="captioned-content">

<div class="caption">

Org-mode capture templates for log and journal entries.

</div>

``` {#2021-10-09-log-and-journal-org-mode-capture-templates .elisp}
("l" "Log Entry")
("lj" "Journal Entry" entry
 (file+datetree "~/org/emsenn.org")
 "* %U     \n\n%?\n"
 :clock-in t)
```

</div>

### \[2021-10-09 Sat 19:34\] {#sat-1934}

This is a test of the journal entry capture template. it appears to work! Do I automatically clock out when I'm finished? That's the question! (Yes, I do, apparently.)

## 2021-W41 {#w41}

### \[2021-10-10 Sun 08:47\] {#sun-0847}

So, as a refresher, I'm working with the following concepts within my record-keeping, at present:

- There is a chronological hierarchy containing my ***log***, which has different sorts of entries:
  - ***journal entries*** are long-form pieces of writing, like this one.
- There is a categorical hierarchy of ***compositions***, which are topic-oriented collections of *log entries*.

For example, the listing above is named `2021-10-10-record-file-organization`{.verbatim}, and was originally written as a *journal entry*. However, it is also *included* in the "Records File Organization" section of the *Personal Recordkeeping Manual*.

If, in the future, I write a more complete list, I can then go into the composition and substitute it out.

<div class="aside">

Actually in testing that it looks like perhaps the name stuck to the paragraph under the list, not the list itself.

- This is a test list
  - It has a purpose
    - But conveying information to the reader
      - isn't it
    - It's for testing Org-mode inclusions

Hmm, including that list when it's the last thing in the subtree worked just fine. And when this paragraph exists under it… So why does the first list not get included, instead "For example…" does?

**Solved!** It looks like it's because I was typoing the name in the inclusion, and so it was broken in an unpredictable way.

</div>

Okay, so, with the above in mind, I find myself in need of several types of log entries. Off-cuff, I can think of:

- Tasks, of some sort. Creating new log entry types, recording obligations to check the neighbor's mail.
- Ledger entries.
- Contact/communication logs.
- Reading logs.

The one of these that got me onto thinking about this, this morning, was reading logs. I'd like to have a place to take notes as I read through *Pollution is Colonialism*, but also I'd like a place to triage links I find on the Web, in a way that doesn't make it impossible to go back through and find them later.

In the past, I use Elisp declarations to manage my reading list: I would insert links into a list and then use functions to pull links back out, either randomly or by searching authors or tags. I don't have that Elisp anymore, and I don't know how often I actually searched through it. I tend to know what I want to read next.

All that to say, I think, that while my inclination is to focus on making discovery easy, my reasoning says that I should focus on making it easy to take notes, and compose them later.

An important thing to note is that often, I collect links by dropping them into one of a few channels in my (relatively new) Discord server.

Huh - if my records file is my settlement on computers, perhaps Discord can be viewed as my sailboat? It comes with me when I'm on the Web, since it is on the Web, and it's where I bring folk and resources into first before they get brought into the, say, harbour, which is where my capture templates take over, I suppose.

So, links find their way into my Discord channels. I might then have a *task* of going through those links and logging that I've seen them, and have made a decision either to read or not read them further, and why.

If I do decide to read them, they should somehow become tasks in their own right, that show up in certain views of my agenda.

Then, reading them should trigger log entries too, where I write any thoughts I have as I read along.

All these entries can get collected as a composition analysizing the specific piece.

That sounds sensible enough, but I think when it comes time to start doing it, I'm going to find myself with a lot of open questions.

### \[2021-10-10 Sun 12:39\] {#sun-1239}

Today Esther is giving my hair a "prune," as they referred to it: cutting split ends and any ends that look like they might split soon.

### \[2021-10-11 Mon 09:09\] {#2021-10-11-0909}

If you look at media from before 2020, a lot of it feels strange. People are in close groups, stores are fully stocked. that was only 2 years ago, and the rate of decline is increasing exponentially according to all research.

A question for others:

> Does today look like how you thought it would 2 years ago? What do you think 2 years from now will look like?

@RadioAngel answered:

> It doesn't. Before 2020 I was worried but I assumed such supply chain issues were 10-15 years out. Now I only expect things to get worse and try to prepare in whatever little ways I can. Right now that's ferments and learning how to garden. But I will be expanding on this soon.

I responded:

> This is about the same, for me, in terms of trajectory.
>
> What's fascinating is that while COVID can be pointed to as the primary cause of the acceleration of supply chain collapse (which is indeed 10-15 years ahead of the forecast,) climate collapse (which is also 10-15 years ahead of schedule) cannot be correlated the same way.
>
> It's fascinating to me that two totally unrelated events both occurred about 10-15 years ahead of the Western schedule.
>
> —
>
> It's also a reassurance; you were planning correctly prior to these years, it is simply that the plan you were given had a flawed schedule.
>
> And a bit of a worry: look how well we can be made to act in certain ways just by nudging the timeline of the future around by publishing or not publishing certain scientific reports.

### \[2021-10-11 Mon 11:29\] {#mon-1129}

My (white) partner had a good comment regarding how they see other white folk, uh, "celebrating," Indigenous Peoples Day:

"It's Indigenous Peoples' Day, not fucking Earth Day"

Getting close to your colonial idea of nature has nothing to do with Indigenous folk, ya racist shits

### \[2021-10-11 Mon 11:34\] {#mon-1134}

Over the weekend, Biden recognized today as Indigenous Peoples Day.

Currently, anti-protest measures such as LRADs are being used outside his home, against Indigenous elders.

<https://twitter.com/IENearth/status/1447570880276615175>

You got the day off? Take the time to go listen to Indigenous peoples, because ^— literally your government is drowning out their voices with sirens.

What's gonna follow is yet another link dump. (Here's an earlier one, related to the child war prisons that were maintained prior to using adoption services and foster care to conduct genocide: <https://ecosteader.com/@emsenn/106483402115361653>)

(And here's a bunch of links about decolonization, for good measure, since some of yall white folk seem keep to call yourself decolonial even though you cant tell me whose land youre on: <https://emsenn.substack.com/p/i-touched-a-nerve>)

- This Land podcast is a great crash course in land and family, from a native perspective <https://crooked.com/podcast-series/this-land/>
- All My Relations has been going on for a while: <https://www.allmyrelationspodcast.com/podcast>
- Indian Country Today is a great news outlet: <https://indiancountrytoday.com/news/celebrating-indigenous-peoples-day>
- Ruth Hopkins wrote something great: <https://www.mic.com/impact/slacker-syllabus-indigenous-peoples-day>

I might come back with more links as I find them.

Are you a selfish settler that only cares about other people when they're useful to you?

Than this is the perfect Indigenous Peoples' Day reading for you:

"The Importance of Indigenous Knowledge in Curbing the Loss  of Language and Biodiversity"

<https://academic.oup.com/bioscience/article/66/6/499/2754233>

Not seeing it yet?

"Indigenous Knowledge, Biodiversity Conservation and Development"

<http://www.ciesin.org/docs/004-173/004-173.html>

How about this U.N.-backed report that says nature on indigenous peoples’ lands is degrading less quickly than in other areas"

<https://ipbes.net/news/Media-Release-Global-Assessment>

You rely on biodiversity for resource and knowledge extraction. Without indigenous peoples, that biodiversity would be even more at-risk than it is at-present, threatening your settler-colonial futures.

I hope that sinks in: Settler-colonialism relies on Indigenous peoples, yet exterminates them. Sound familiar?

Don't worry, I'm sure Elon Bezos will invent a Mechanical Indian soon, right after the autonomous pollinator drones, and you'll all be able to invent your way out of this hole just like you've… never successfully done with any of the others you've dug.

(Fun fact, but modern European farms are sustained by petroleum-derived fertilizers imported from Africa and Asia, having previously been fertilized with deforestation-derived fertilizers imported from the Americas, since they've been steadily destroying their region's own biocapacity for like 10,000 years.)

### \[2021-10-11 Mon 14:26\] {#mon-1426}

In the past I've used a variety of metaphors to describe my relationship with computers. I think most often, I use the metaphor of a starship, which puts my relationship with computers mostly as a vessel to travel the Web with.

But right now that metaphor doesn't feel like it fits just right. There's some sense of it, still: the idea of inputting information into a log like I am feels similar to Star Trek, but I'm not sure where capture templates or compositions fit in with that notion.

Because log entries are triggered by hand, and all except journal entries are created entirely by hand, I'm finding myself stuck in some ways about what to track. A lot of things seem like a good idea to track, but of course, tracking them always takes some amount of time, and the ability to use my phone. (Since I have Emacs set up on my phone, it can be pretty easy to move into a capture template and fill it out, if there's not any text-entry involved.)

There's also a margin of error: I can track how much water I move from the bucket under the faucet, but water from the faucet sprays onto the area the bucket. And it's hard to know how much it is, proportional to how much goes in the bucket, or absolutely.

So it sounds like I need to come up with a question-list about whether or not to track something as a log entry, starting with those questions:

- Is it possible to make the entry while doing the action?
- How long does the entry take to make?
  - Does it require text-entry, or just selecting the entry and (when ready to clock-out), closing it?
- If the entry tracks hard data, how big is the margin of error on that data?
  - Will tracking it actually be useful, or is the MoE too big for seeing trends or whatever?

Oh that reminds me of something else I wanted to write down: how to publish documents from this file.

- [ ] Move the cursor to the headline of the document you want to publish
- [ ] Press `C-c C-e C-s`{.verbatim} to trigger exporting that subtree
- [ ] Press `h h`{.verbatim} to export it as HTML. It'll be in the `pub/`{.verbatim} subfolder.

I guess this indicates I need another capture template, too:

- Creating a new composition

### \[2021-10-12 Tue 08:45\] {#tue-0845}

Today Esther goes into work, an all-day shift, so I'm hoping to spend a lot of the afternoon tidying up around the house. That'll also probably result in some tinkering with how I record tidying and stuff in my Org-mode records. So far I've mostly been using this file to journal with, and I'm pretty satisfied. My big concern is changing things in a way that makes them more automatic, and then breaking those automations when I change things again, so I'm handling lots of things in a cludgy, manual way, until I'm sure that's how I want to handle them before they're automated.

### \[2021-10-13 Wed 08:58\] {#wed-0858}

On my phone, tags make Org-mode headlines too long.

This line changes that:

``` {#2021-10-13-org-tag-whitespace-elisp .elisp}
(setq org-tags-column 3)
```

### \[2021-10-14 Thu 20:37\] {#thu-2037}

So I've got a few small changes to make to my journal entry capture template:

<div class="captioned-content">

<div class="caption">

Org-mode capture templates for log and journal entries.

</div>

``` {#2021-10-14-log-and-journal-org-mode-capture-templates .elisp}
("l" "Log Entry")
("lj" "Journal Entry" entry
 (file+olp+datetree "Log" "~/org/emsenn.org")
 "* %U   :journal:\n\n%?\n"
 :clock-in t :clock-resume t :tree-type week)
```

</div>

(Organizing stuff by week, instead of month.)

I've been thinking and having each entry be a subtree doesnt really make sense, given Org-mode's capabilities. I'm picturing instead each week having a subtree for each day, but also an eighth, at the head, for routine tasks that occur most days of the week, most weeks, like cleaning, cooking, etc.

Then each day has two subtrees, for events and the journal.

I think it'll be… tricky to get these capture templates actually working, so maybe I'll re-structure what I have under this new model and then try and write them.

\[Update: this pretty immediately broke the ability to sensibly export ledgers from my notes so I guess I'm doing linear entries! Thats fine.\]

### \[2021-10-17 Sun 11:12\] {#sun-1112}

Okay, so a new week, a new way of organizing my Org-mode stuff. No longer is it in one file, though that might change.

Due to how Emacs works, I'm deciding to assume that each Emacsen only represents one Groundhog, which should make some design decisions easier.

At this point my focus is on documenting and reforming what I have so I can use it through the week, rather than recreating anything today.

# Ramblings

## 2021-W41 {#w41-1}

### Chat: Discord <span class="tag" tag-name="chat"><span class="smallcaps">chat</span></span> {#chat-discord}

Talkiing with @Mossbriar about our different relationships with animals, since I'm personally antagonistic to the local fauna and they have no reason to be. See <https://discord.com/channels/895026696267370496/895026696267370499/897459745982668811>

This led to me rambling:

> \[W\]e are a decade ahead of schedule on climate collapse, according to the most conservative climate scientists, and so I've pivoted way harder toward immediately trying to make sure some folk around me can survive that.
>
> (It's wild, polling of random folk finds people believe in generally the climate science of the 1970s, meanwhile our climate is living in 2015's 2030.)
>
> A couple days ago I heard someone express confidence Biden would hold us to the Paris Agreement and I'm like… ? we are past the threshold that Agreement was to keep us under? That's like saying you're confident the gas station clerk is going to revert the universe back to 1745. It's impossible under the known laws of time.
>
> \[… M\]ost advocates for climate action don't understand the even-kinda-contemporary information, and so our goalposts are all over the place, when everyone could be advocating for reasonable 2021 goals. not "carbon neutral by 2045" which might've worked in 1977, but "carbon positive tomorrow is the legitimate goal of work projects"
>
> Given its response to COVID and then the IPCC report, I'm fairly confident homo colossus is going to go extinct, and so at this point I am pretty much focused on securing resources for the survival of homo sapiens, and opportunistically advocating homo colossi try and adapt themselves into homo sapiens.
>
> (Note: I am supportive of homo sapiens but don't mistake that for membership; i'm a homo colossus too; being otherwise is perhaps impossible given our material circumstances.)
>
> It seems like since the 70s we've seen even the homo sapiens of the world need to walk in both worlds, since they have to participate in homo colossus in order to have enough resources to resist it
>
> It bums me out because like… we're so uncreative these days.
>
> Everyone is so worried about batteries and like is saying we need fossil fuels because there's not enough lithium to make batteries but… …I know the basics of turning a pile of dirt into a battery. …You can use energy to haul weights into trees and then gravity pulls them back down. battery. Like sometimes I think about how much material science ISNT being done because we use coercion and extraction and it breaks my heart.

### Chat: Discord <span class="tag" tag-name="chat"><span class="smallcaps">chat</span></span> {#chat-discord-1}

> i feel like the problem is if youre in a colonial life, except for stuff that helps you earn more money, theres not really much useful to learn, since you dont get opportunties to practice without lots of money, and you cant learn enough to actually leave, by yourself, so you can either just learn interesting tidbits and flesh out a general liberal arts heutogogy, or deep-dive into marketable specializations.
>
> going back to our earlier conversation, theres no like, problems at a human scale in folks life, and money is the most available tool, so the normal pressure to learn more is absent
>
> like im gonna learn basketweaving not because it seems cool or useful, but because i have excess materials that leave me with the problem "what do i do with these vines?" and without money on the table as part of my solution toolkit, making baskets is the obvious answer.
>
> (And p quick you end up with a much greater demand for labor from land stewardship than one person can reasonably put in: some of the vines can be used to make detergent first, thats extra labour. tending the vines as they grow is more labour. theres composting the waste materials, getting the water you need, etc. Normally the demand for labor would be met by the embedded labor present in tools and fossil fuels, but with those off the table, you need actual people.
>
> Which is weird to think about: theres so much abundance in the world theres a scarcity of labor that folk meet by reducing the abundance int the world to something they can understand
>
> it is impossibly complicated to measure the food of an indigenous territory, compared to the food of a grocery store.
>
> so to Homo economicus, the grocery store seems more abundant.
>
> Theres also lots of social rules that favor the grocery store, like the enclosure of the commons
>
> I can labor and collect nuts from the forest, Or I can labor for money and buy nuts from the store
>
> And because money is fungible, its
>
> the better choice, in a neoliberal colonial world
>
> the acquisition of fungible currency is always better than the acquistion of material goods, even at a substantial loss

> but generally i think most colonial and colonized people think too much and do too little, and what they do do is done within an illusory construct and of little consequence to themselves or others.
>
> \[W\]ritten text is promiscuous and often must intentionally be stripped of many forms of context, so I think centering academia and written language as the manifestations of these actions can be harmful
>
> i learn a lot from written text sure but almost all of it i read because a person told me to, in conversation
>
> (I think a lot of folk are use their intellectualism to manifest an Age of Discovery desire to be a sailship captain, going resource to resource, taking tidbits of information into their hull, hoping that maybe they can bring the tidbits back out in a useful way later.
>
> if the Web is an ocean, reddit, facebook, twitter, etc., are the trade winds
>
> all that said, yes, im a big proponent on doing whatever works to increase how many opportunities you see in the events and situations of your life.
>
> also while self-guided learning is an important component of learning, a lot of people accepted a state instructor for their entire childhood, youth, and sometimes young adulthood, and then insist that all other education come from their own intuitions and choices, not an outside instructor
>
> so many folk legit pay huge sums of money to learn some niche topic from a government-organized curriculum, but then like, wont pay \$5 a month for a Black blogger's patreon.
>
> or like, go to a local tribal center and ask for resources or what courses might be available
>
> "how much do you pay the Web folk you learn from versus how much did you pay for your degree" would be a good fediverse post
>
> (I think a lot of folk, not those here included, really undervalue how much they get from their Web acquaintances)
>
> anyway i just read what friends tell me to and that keeps me more than busy enough. the library is a great repository, but i do very little information seeking myself. i listen to my elders
>
> really speaks to the isolation and alienation of contemporary society that we learn from sources not people, unless we pay for the privilege of interpersonal connection, and even then its parasocial
>
> like its easy to go okay so there used to be forums in towns where folk hung out and chatted but like… shit that means those folk prioritized that space so much they made it exist in the center of their town
>
> whats in the center of my town? a library, a social services building, police hq…
>
> violent bureaucracy that enforces capitalism

> so i have some beliefs that… hold on let me think how to say this
>
> there are some beliefs youll see me represent that i got to… philosophically, or morally, or spiritually or something.
>
> There are other beliefs youll see me represent that are reactive to our current crises, ongoing mass extinctions and climate collapse. (NOT political crises, i mean true crises)
>
> Sometimes they can be hard to tell apart and other times ill say something that will clearly sound weird
>
> e.g. Im not critical of roads because of philosophy but because of resource consumption
>
> i know there are a lot of philosophical discussions about roads, im privy to them and they inform my opinion, but my opinion mainly has to do with resource consumption
>
> (also i distinguish between roads and trails)

> if you follow the lewis and clark trail at lots of points youll see deep grooves in the rocks, all across the area they traveled. those are from pre-contact sleds!
>
> its AMAZING how much one can get done with some basic implements gathered from nature and humans are gonna be pissed at how little nature is left when social infrastructure falls apart
>
> and like… we are going to fuck up a lot of our natural areas in collapse. folk will move into the grand canyon and shit, and not like, be experienced indigenous people but just some newbies
>
> Ive been trying to apply my imagination toward what shelter should look like here in the future, assuming we like, shift out of resource overshoot fast enough that we're not just looking at polar habitability, which tbh im less and less hopeful for
>
> id say rn its a coinflip whether more than the polar regions are going to be habitable for mammals of our size
>
> (by like, 2300, 2350 or so)
>
> But also thats a LONG way out and Ireally just need to worry about through the 2100s, myself
>
> so im planning on staying here and building a community tethered to here
>
> (that is i think another thing people dont imagine right; they picture like moving off to a farm or some other new area, in collapse. try to imagine where you are now. if where you are now isnt suitable for life in collapse, you can flee or you can try and change it)

[^1]: I feel I should note, I shoot BBs from a bit away at their rumps or nearby brush, just to deter them from the space. It hurts, I'm sure, but not enough that they aren't back in a few minutes.
