---
id: 6882cc6d-049d-4c68-866a-67bc57fce725
title: Homo sapiens
date-created: 2025-08-29
---

# [resource code](resource-code.md)

## [Org-roam capture template](../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/org-roam-capture-template.md)

``` {#homo-sapiens-org-roam-capture-template .elisp tangle="./src/gpe/org-roam-capture-templates/tsh.el"}
("nsh" "Homo sapiens" plain "%?"
 :target (file+head "${slug}.org"
          "#+title: ${title}\n#+date: %U\n#+author: emsenn\n\n")
 :unnarrowed t
 :resource-description "((resource type . Homo sapiens)")
```
