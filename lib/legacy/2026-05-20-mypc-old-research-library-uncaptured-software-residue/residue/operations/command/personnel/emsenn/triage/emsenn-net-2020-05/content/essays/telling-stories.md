+++
title = "Telling Stories"
author = ["emsenn"]
date = 2019-06-04
tags = ["emsenn.net", "online communication", "storytelling"]
draft = false
predecolonial = true
+++

I've been thinking about what it would mean to make my website more of a collection of my told stories, stories in a vaguely Lakhota sense of the word, but with some influence from what I know of Anishinaabee and western Apache traditions.

Each resource would be a telling of a story (not the story itself, which exists... more ephemerally, as the message inside the story at the time of its telling.)

Each telling would have a story it's telling - or the multiple stories that it's telling. (I'm picturing these as short unique keycodes.)

It'd have its teller - this would pretty much always be me.

And it'd have its intended audience. This might be general, "people who know my words," or more specific and anonymised, like "a friend who is struggling to find this particular book."

Tellings would also be able to be be given a type, reflecting their intention, and tags, reflecting the proper names of the concepts they refer to.

So:

-   Telling Name
-   Story ID
-   Teller
-   Audience
-   Intention
-   Topics

Let's see how each of those could map to various Org-mode or Ox-Hugo data... bits.

The Telling name is the subtree title, or article title in a website context.

The Story ID can be... some custom front-matter?

I recall Hugo having the ability to have like, two categories of tags. I should look that up.

<https://gohugo.io/content-management/taxonomies>

Yes

So, the teller, audience, intention, and topics, are all taxonomies.

I... suppose the Story ID is too.

I suppose the next step is learning how to add custom taxonomy info to Org-mode content...

`:EXPORT_HUGO_CUSTOM_FRONT_MATTER: :animals '(dog cat "penguin" "mountain gorilla")`

Simple enough

I want two mock-ups:

-   content made before I tried to reparadigm my writing as storytellings
-   content made now, under the storytelling paradigm

I think I should do the latter first

```org
#+TITLE: Aleph's First Story
#+AUTHOR: emsenn
#+HUGO_BASE_DIR: ~/dev/personal-website/
#+HUGO_SECTION: template
#+HUGO_TAGS: Org Hugo
#+HUGO_CUSTOM_FRONT_MATTER: :storyID 1
#+HUGO_CUSTOM_FRONT_MATTER: :audience "emsenn's Emacsen"
#+HUGO_CUSTOM_FRONT_MATTER: :characters '(Aleph)
Aleph looked around.

Nothing was anywhere, and nothing was happening.

Aleph waited for something else.
```

And the older content?

```org
#+TITLE: An Old Article
#+AUTHOR: emsenn
#+HUGO_BASE_DIR: ~/dev/personal-website/
#+HUGO_SECTION: predecolonial
#+HUGO_TAGS: Org Hugo
#+HUGO_CUSTOM_FRONT_MATTER: :storyID 2
#+HUGO_CUSTOM_FRONT_MATTER: :audience "emsenn's Emacsen"
Nothing happened.
```

**_UPDATE:_** I actually ended up changing it so that `predecolonial` was another piece of custom front-matter, since I noticed pre-decolonial stuff fit in a bunch of sections.