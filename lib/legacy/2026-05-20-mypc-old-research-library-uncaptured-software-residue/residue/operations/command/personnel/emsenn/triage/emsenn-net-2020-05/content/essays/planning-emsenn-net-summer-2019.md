+++
title = "Planning emsenn.net, Summer 2019"
author = ["emsenn"]
tags = ["web-development"]
draft = false
+++

I've been using the domain as my "personal website," at
`https://emsenn.net`, in one way or another for a bit over a year now,
though what that means has shifted over that period.

I've recently decided to stop sharing so many of my drafts as I work
on them, at the advice of [@yam655@sonomu.club](https://sonomu.club/@yam655), who was recently
speaking with me about building a community and audience around my
writing.

So instead of treating my website as a document repository, I'm going
to treat it as a means of communication - more specifically, a way of
_broadcasting_ long-form text to _subscribers_. In this context,
"broadcasting" means "sending, but not receiving, information," and
"subscribers" means "people who have chosen to receive the broadcast."

Since I've been using _Mastodon_ software service for a while now,
I've grown to like the _Fediverse_, the rough conglomeration of
cultures that communicate using the _ActivityPub_ protocol.

So it seemed natural to move to _WriteFreely_, a _federated_ blogging
platform. The software, _open-source_ of course, is maintained by the
same people who run the _Write.as_ web service. There, one can post
anonymously or run their own blog.

That's what I'm choosing to do, for now - I've gone ahead and signed
up for their "Pro" plan, which has let me set up a custom domain.

So now, if you go to `https://emsenn.net`, you see a title (my name),
a list of pinned posts, and then a chronological feed of my posts -
most recent first. At the bottom of the page, there's a field where
you can put your _email_ address to _subscribe_ to new posts - they'll
show up in full in your email. If _RSS_ feeds are your preference,
they're available at [https://emsenn.net/feed/](https://emsenn.net/feed/).

There's a web interface for adding new posts and managing the site,
but I'll be adding posts directly from _Emacs_, my text-editor of
choice. In it, I write files in the _Org-mode_ format, and use the
_writefreely.el_ script to upload them to _Write.as_.

...Actually in playing with it, I can't get that to work quite
properly if I try and update a post. So what I'll probably do instead,
for now, is export to _Github-Flavored Markdown_ with _Ox-GFM_ and
then use the web interface to post and update. A bit clunky, but as
I'm no longer prioritizing my website as the main place I host my
writing, I'm okay with it.

I glossed over it at the start, but that is the main reason I'm
comfortable moving my website from an ultra-light just-HTML thing to a
web service: I plan on offering that sort of HTML document through
some sort of store-front, for lack of a better term. I'm already doing
something like that with my writing with Teraum - you can see an
example at [https://emsenn.itch.io/crown-of-idbol-bark/](https://emsenn.itch.io/crown-of-idbol-bark/) - though at the
moment there's only a PDF available.

With that burden lifted, to be placed somewhere else in the near
future, `emsenn.net` can be a broadcast platform, and _WriteFreely_
seemed like an adequate choice to get that done.