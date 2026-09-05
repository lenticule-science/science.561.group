+++
title = "Planning How to Publicly Share Activities"
author = ["emsenn"]
tags = ["communication"]
draft = false
+++

I was out cutting wildflowers for a bouquet earlier and it occurred to me that I use _microblogging_ for a few discrete sorts of tasks, that I'll try and list here:

-   I use it for sharing updates about what I'm doing or have just done. Posted an essay, updated a code repo, made a bouquet. (I'm not sure if that's how to spell that word these days.)
-   I use it for sharing my opinions, usually about contemporary events or topics related to such, and where I respond to folk who respond to those opinions.
-   I also use it for replying to other people's shared opinions.

Now, this last one, I can't do much to change because there are quite a few people who post exclusively, or at least most of the time, through _federated microblogging_. Luckily because that usually means they're using _ActivityPub_, I can send a reply to them without having to have an account on their server, or even necessarily on the same platform.

To a lesser extent this is true for the second point as well. There are some people who, if I don't _broadcast_ my stuff throgh _ActivityPub_, they won't see it. But that doesn't mean I need to shar ethe opinions directly through the _microblog_. I could share them through another media first, and then just link them, such as as one of the events in a list of activity updates.

Writing this out hasn't stated it, but I guess there's another separation between types of statuses I make and it's that a small fraction of them are factual activity updates, and then a much larger majority of the statuses are blathering on about my opinions.

That's not the most useful way I could to things. I'm going to ignore the opinion-sharing side of things for now and look at how I share statuses - and how I should.

I think I can make an _Org-mode_ file that can be heavily tagged, and exported with _Ox-Hugo_ to _Hugo_-compatible _Markdown_, which _Hugo_ can then turn into _HTML_ and _JSON_. I know that's a long chain, but it's the same I use for a lot of my "write something and take it and some other information and turn it into a completely different document.

Though the other main reason is, these are the tools I know, so they make sense to me. But also, it's the concepts behind this stuff that matter more to me right now than the actual implementation.

This'll be quite similar to another project I'm working on, _Hugo Media Package Channel Theme_, that does much the same thing, but the output files are a manifest of where my writing is available and in what formats.

Because of the similarity, I'm going to bypass planning out how the _Org-mode_ source and _Hugo templates_ will look, since I have a good enough idea and implement them and then share and explain that.