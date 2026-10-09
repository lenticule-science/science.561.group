---
id: 1794ee8d-7bf3-4240-85ab-aeebbb62c0a8
sdihg-diagram: "((instantiates . document) (condition . epistolary))"
title: letter
---

## 

# Encodings of Letters

## Org-roam Capture Template for Letters

``` {#letter-org-roam-capture-template .elisp tangle="./src/gpe/org-roam-capture-templates/tl.el"}
("tl" "letter")
```

``` {#plain-letter-org-roam-capture-template .elisp tangle="./src/gpe/org-roam-capture-templates/tlp.el"}
("tlp" "plain letter" plain "%?"
 :target (file+head "letter-%<%Y%m%d%H%M%S%z>.org"
           "#+title: Letter to %^{Audience?|Unknown}, %U\n#+date: %U\n#+author: emsenn\n\n")
 :unnarrowed t
 :form "letter")
```
