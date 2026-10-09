---
id: 39a3beb3-898b-4494-b1d2-144c7a38c3dd
node-description: "((resource type . babble) (author . emsenn) (publication . emsenn.net) (creation date . 2025-10-06))"
title: Building Fregean predicates from Org-roam nodes
description: So I didn't do a good job writing much about it in my archive as I was reading about it, but I recently did a lot of reading into the Semantic Web,…
aliases:
  - Building Fregean predicates from Org-roam nodes
date-created: 2025-10-06
---

So I didn't do a good job writing much about it in [my archive](../../../../../../../../../information-science-services-section/services/communication-science-services-section/content/text/glossary/terms/emsenn-s-files.md) as I was reading about it, but I recently did a lot of reading into the [Semantic Web](../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semantics-services-section/content/text/glossary/terms/semantic-web.md), which led me to reading about [resource description format](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/resource-description-format.md) and finally onto things like [Fregean first-order predicates](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/fregean-first-order-predicate.md).

This all coalesced around something I'd been slowly doing in my nodes anyway, which was writing a property into each [Org-roam node](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/org-roam-node.md), which has changed name and shape a few times, but I'm currently calling it the `node-description` property.

One way I'm thinking of this property is as a node's secondary intension toward [relational dynamics](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/documents/articles/notes/2025/09/01/2025-09-01-relational-dynamics-org-roam-catalog-query.md), and given that, the structure that seemed best was Fregian `subject-predicate-object` triplets, where each part of the triplet is another node in the database.

Conveniently, this lines up with where a lot of contemporary [Web](../../../../../../../computer-science-services-section/content/text/glossary/terms/web-technology.md) and [large language model technologies](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/large-language-model-technology.md) are moving.

Here's a demonstration of what a node's property drawer looks like, in [GnoponEmacs](../../../../../../../../content/text/documents/articles/notes/2025/08/08/2025-08-08-gnoponemacs.md):

``` org
:PROPERTIES:
:ID:       39a3beb3-898b-4494-b1d2-144c7a38c3dd
:node-description: ((resource type . babble) ([author](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/author.md) . [emsenn](../../../../../../../../../../content/text/documents/articles/biographies/emsenn/wsl-backup-dev-relationality-content-triage-per-enc--emsenn.md)) ([publication](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/publication.md) . [emsenn.net](../../../../../../../../content/text/documents/articles/notes/2025/07/19/2025-07-19-index.md)) ([creation date](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/creation-date.md) . 2025-10-06)
:END:
```

That probably isn't super readable like that. To the computer, it can parse as a list of two-part items: a predicate and an object, and it knows the subject for each is the ID, forming that `subject-predicate-object` triplet.

But in plainer rendering, here's what that says the node description is:

resource type  
babble

[author](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/author.md)  
[emsenn](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/emsenn.md)

[publication](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/publication.md)  
[emsenn.net](../../../../../../../../content/text/documents/articles/notes/2025/07/19/2025-07-19-index.md)

[creation date](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/creation-date.md)  
2025-10-06

As you can see, every part of every triplet is itself has two parts: an `ID` and `sign` (`d542...ecb` and `babble`).

``` elisp
(defun gpe/build-predicates ()
  (cl-loop
   for (id file level pos todo priority scheduled deadline title props)
   in (org-roam-db-query
       [:select [id file level pos todo priority scheduled deadline title properties]
      :from nodes
      :where (like properties '"%resource-description%")])
   collect 
   (let* ((raw-rd (alist-get "RESOURCE-DESCRIPTION" props nil nil #'string=))
    (alist (when raw-rd (ignore-errors (read raw-rd)))))
     (when alist
       (cl-loop
      for (pred . obj) in alist
      collect
      (let* ((parse-link
        (lambda (s)
      (when (string-match "\\[\\[id:\\([^]]+\\)\\]\\[\\([^]]+\\)\\]\\]" s)
        (list :id (match-string 1 s)
          :sign (match-string 2 s)))))
       (pred-str (replace-regexp-in-string "] \\[" "][" (format "%s" pred)))
       (obj-str  (replace-regexp-in-string "] \\[" "][" (format "%s" obj)))
       (pred-link (funcall parse-link pred-str))
       (obj-link  (funcall parse-link obj-str)))
  (list
         :subject-id id
         :subject-sign title
         :predicate-id (plist-get pred-link :id)
         :predicate-sign (plist-get pred-link :sign)
         :object-id (plist-get obj-link :id)
         :object-sign (plist-get obj-link :sign))))))))
(gpe/build-predicates)
```

``` {.elisp results="raw"}
(defun gpe/collect-predicates-from-node (node)
  (let* ((raw-rd (alist-get "RESOURCE-DESCRIPTION"
              (org-roam-node-properties node) nil nil #'string=))
   (alist (when raw-rd (ignore-errors (read raw-rd)))))
    (when alist
      (cl-loop
       for (pred . obj) in alist
       collect
       (let* ((parse-link
         (lambda (s)
       (when (string-match "\\[\\[id:\\([^]]+\\)\\]\\[\\([^]]+\\)\\]\\]" s)
         (list :id (match-string 1 s)
           :sign (match-string 2 s)))))
        (pred-str
         (replace-regexp-in-string "] \\[" "]["
                   (format "%s" pred)))
       (obj-str
        (replace-regexp-in-string "] \\[" "]["
                  (format "%s" obj)))
       (pred-link (funcall parse-link pred-str))
       (obj-link  (funcall parse-link obj-str)))
  (list
         :subject-id id
         :subject-sign title
         :predicate-id (plist-get pred-link :id)
         :predicate-sign (plist-get pred-link :sign)
         :object-id (plist-get obj-link :id)
         :object-sign (plist-get obj-link :sign)))))))
(defun gpe/filter-predicates-by (predicates predicate-id object-id)
  (cl-loop for entry in predicates
     when (and (string= (plist-get (car entry) :predicate-id)
                predicate-id)
           (string= (plist-get (car entry) :object-id)
                object-id))
     collect (plist-get (car entry) :subject-id)))
(let* ((ids
       (gpe/filter-predicates-by
  (gpe/build-predicates)
  "edaef069-c68d-46aa-a970-d3cb7fe3165c"
  "d542e8d2-3512-47a0-adbb-4a393e161ecb"))
       (nodes (mapcar #'org-roam-node-from-id ids))
       (output
  (mapconcat
   (lambda (node)
     (format "- [[id:%s][%s]]"
         (org-roam-node-id node)
         (org-roam-node-title node)))
   nodes
   "\n")))
  output)
```

``` elisp
(gpe/ritm/render-list-of-matches '(("edaef069-c68d-46aa-a970-d3cb7fe3165c" . "d542e8d2-3512-47a0-adbb-4a393e161ecb")))
```

\## Earlier material

So I didn't do a good job writing much about it in \[my archive\](../../../../../../../../../information-science-services-section/services/communication-science-services-section/content/text/glossary/terms/emsenn-s-files.md) as I was reading about it, but I recently did a lot of reading into the \[Semantic Web\](../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semantics-services-section/content/text/glossary/terms/semantic-web.md), which led me to reading about \[resource description format\](../../../../../../../../../philosophy-services-section/content/text/glossary/terms/resource-description-format.md) and finally onto things like \[Fregean first-order predicates\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/fregean-first-order-predicate.md).

This all coalesced around something I'd been slowly doing in my nodes anyway, which was writing a property into each \[Org-roam node\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/org-roam-node.md), which has changed name and shape a few times, but I'm currently calling it the \`node-description\` property.

One way I'm thinking of this property is as a node's \[secondary intension\](../../../../../../../../../information-science-services-section/services/communication-science-services-section/services/linguistics-services-section/services/semantics-services-section/content/text/glossary/terms/secondary-intension.md) toward \[relational dynamics\](../../../../../../../../../philosophy-services-section/services/relationality-services-section/services/agency-services-section/content/text/documents/articles/notes/2025/09/01/2025-09-01-relational-dynamics.md), and given that, the structure that seemed best was Fregian \`subject-predicate-object\` triplets, where each part of the triplet is another node in the database.

Conveniently, this lines up with where a lot of contemporary \[Web\](../../../../../../../computer-science-services-section/content/text/glossary/terms/web-technology.md) and \[large language model technologies\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/large-language-model-technology.md) are moving.

Here's a demonstration of what a node's property drawer looks like, in \[GnoponEmacs\](../../../../../../../../content/text/documents/articles/notes/2025/08/08/2025-08-08-gnoponemacs.md):

resource type babble

\[author\](../../../../../../../../../social-science-services-section/content/text/glossary/terms/author–002210.md) \[emsenn\](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/emsenn/index.org.md)

\[publication\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/publication.md) \[emsenn.net\](../../../../../../../../../philosophy-services-section/services/relationality-services-section/content/text/triage/emsenn/emsenn-net/index.org.md)

\[creation date\](../../../../../../../../../information-science-services-section/services/knowledge-services-section/content/text/glossary/terms/creation-date.md) 2025-10-06
