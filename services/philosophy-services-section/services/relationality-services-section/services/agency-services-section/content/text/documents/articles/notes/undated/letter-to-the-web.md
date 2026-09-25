---
id: 5aac60de-42f7-457f-90e5-f05ca31680b4
title: letter to the Web
type: letter
visibility: public
description: A letter to the Web is a letter that is written to the Web.
---

A ***letter to the Web*** is a [letter](letter.md) that is written to the [Web](../../../../../../../../../../../social-science-services-section/services/economics-and-business-science-services-section/services/business-science-services-section/content/text/glossary/terms/web.md). I have a catalog of [my letters to the Web](../../../../../../../../../../../../../public-services-section/services/personal-services-section/services/emsenn-services-section/content/text/glossary/terms/my-letters-to-the-web.md).

# Encodings of Letter to the Web

## Org-roam Capture Template for Letter to the Web

``` {#letter-to-the-org-roam-capture-template .elisp tangle="./src/gpe/org-roam-capture-templates/tlw.el"}
("tlw" "letter to the Web" plain "%?"
 :target (file+head "letter-to-the-web-%<%Y%m%d%H%M%S%z>.org"
           "#+title: Letter to the Web, %U\n#+title: ${title}\n#+date: %U\n#+author: emsenn\n\n"))
 :unnarrowed t
 :form "letter to the Web")
```
