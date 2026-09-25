---
id: dc21a3aa-a339-4106-8a19-cbaba0a0ded4
name: describing
date-created: 2025-08-28
type: act
---
describing is (a\|an\|the) [act](../../../../services/agency-services-section/content/text/glossary/concepts/tekodynamics-concepts-act-act.md)

# code

## [Elisp](../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/elisp.md)

``` {.elisp tangle="./src/gpe/node-acts/describe.el"}
(defun describe (&optional insert)
  "Describes the node"
  (interactive "P")
  (let* ((title (or (org-entry-get (point) "name")
          (org-collect-keywords '("TITLE"))
          '("This")))
   (title (if (listp title) (cadr (assoc "TITLE" title))
        title))
   (form (or (org-entry-get (point) "form" t)
         "[undescribed node](../../../../../../content/text/glossary/terms/undescribed-node.md)"))
   (description (format "%s is (a|an|the) %s" title form)))
    (if insert (insert description) description)))
```

## Earlier material

describing is (a\|an\|the) [act](../../../../services/agency-services-section/content/text/glossary/concepts/tekodynamics-concepts-act-act.md)
