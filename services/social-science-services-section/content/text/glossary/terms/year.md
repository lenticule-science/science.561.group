---
id: d150eaba-d55f-401c-8487-6f2f84d16ace
name: year
---

``` {.elisp tangle="./src/gnoponemacs/capture-templates/rty.el"}
("rty" "year" plain "%?"
 :target (file+head "./ref/tem/${slug}.org"
           "#+title: ${title}\n#+date: %U\n\n"))
 :unnarrowed t
 :NODE-RELATIONS "(([instantiates](../../../../../natural-science-services-section/content/text/glossary/terms/instantiating.md) . year) ([temporal reference system](../../../../../engineering-science-services-section/services/computer-science-services-section/content/text/glossary/terms/temporal-reference-system.md) . [proleptic Gregorian calendar](../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/proleptic-gregorian-calendar.md)))"
```
