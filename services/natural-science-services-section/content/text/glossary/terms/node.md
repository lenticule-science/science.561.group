---
author: emsenn
id: bc7c9861-6f01-4f8e-ac8f-feb6c9cc0706
name: node
date-created: 2025-07-30
---

# Encodings of Node

## Org-roam Capture Template for Node

``` {#node-org-roam-capture-template .elisp tangle="./src/gpe/org-roam-capture-templates/n.el"}
("n" "node" plain "%?"
 :target (file+head "${slug}.org"
           "#+title: ${title}\n#+date: %U\n\n"))
 :unnarrowed t
 :form "node")
```
