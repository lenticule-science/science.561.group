+++
title = "Adding My Website to the IndieWeb: Level 1"
author = ["emsenn"]
date = 2019-10-21
tags = ["Hugo", "IndieWeb"]
draft = true
+++

Right now, my personal website, [emsenn.net](https://emsenn.net), is created by using [Hugo](https://gohugo.io), combining my source material with a Hugo theme I created for myself. In this text, I'm going to highlight the parts of that theme that are relevant for participation in the [IndieWeb](https://indieweb.org).

I'll be following along with the points listed under their [IndieMark](https://indieweb.org/IndieMark) page, which outlines six levels of participation in the IndieWeb, each with a few criteria.

Level 1 is about owning your own domain and being able to use it as your profile. To accomplish this, a link to your own domain needs to be on the homepage, labeled `rel="me"`.

This link will show up one of two places. If the `showHCard` configuration attribute is `true`, then the link will show up in the [h-card](http://microformats.org/wiki/h-card) rendered on the homepage by the [H-Card Paragraph](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/#h-card-paragraph) partial template, itself called by the [Personal Summary](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/#personal-summary) partial, which is used by [Index Layout](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/#index-layout). If it is `false`, then the link is rendered in the page's head, as part of the [Head Links](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/#head-lines) partial template, also used by the  [Index Layout](https://emsenn.net/computer-instruction-sets/hugo-personal-website-theme/#index-layout).

That same partial will include a line similar to the following, if an email is provided in the configuration:

```html
<link href="mailto:emsenn@emsenn.net" rel="me authn">
```

b
With these links available, I'm able to log into services through my domain (and email).

The second part of Level One is adding [h-entry](http://microformats.org/wiki/h-entry) markup to posts. This one might require some rewriting of existing templates - I was already using the IndieAuth stuff, but haven't yet implemented this.