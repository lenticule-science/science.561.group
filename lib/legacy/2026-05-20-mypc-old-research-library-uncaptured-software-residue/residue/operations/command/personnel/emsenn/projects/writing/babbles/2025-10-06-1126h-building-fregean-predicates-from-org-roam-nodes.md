---
title: "2025-10-06, 1126h, Building Fregean predicates from org-roam nodes"
aliases:
  - "2025-10-06, 1126h, Building Fregean predicates from org-roam nodes"
  - "2025-10-06, 1126h, building fregean predicates from org-roam nodes"
authors:
  - emsenn
date-created: 2025-10-06T11:26:00
type: babble
tags: []
---

So I didn't do a good job writing much about it in my archive as I was reading about it, but I recently did a lot of reading into the Semantic Web, which led me to reading about resource description format and finally onto things like Fregean first-order predicates.
This all coalesced around something I'd been slowly doing in my nodes anyway, which was writing a [property](../../../sociology/terms/property.md) into each Org-roam node, which has changed name and shape a few times, but I'm currently calling it the ~node-description~ [property](../../../sociology/terms/property.md).

One way I'm thinking of this [property](../../../sociology/terms/property.md) is as a node's secondary intension toward relational dynamics, and given that, the structure that seemed best was Fregian ~subject-predicate-object~ triplets, where each part of the triplet is another node in the database.

Conveniently, this lines up with where a lot of contemporary Web and large language model technologies are moving.

Here's a demonstration of what a node's [property](../../../sociology/terms/property.md) drawer looks like, in GnoponEmacs:

```org
  :PROPERTIES:
  :ID:       39a3beb3-898b-4494-b1d2-144c7a38c3dd
  :node-description: ((resource type . babble) (author . emsenn) (publication . emsenn.net) (creation date . 2025-10-06)
  :END:
```

That probably isn't super readable like that. To the computer, it can parse as a list of two-part items: a predicate and an object, and it knows the subject for each is the ID, forming that ~subject-predicate-object~ triplet.

But in plainer rendering, here's what that says the node description is:

- resource type :: babble
- author :: emsenn
- publication :: emsenn.net
- creation date :: 2025-10-06

As you can see, every part of every triplet is itself has two parts: an ~ID~ and ~[sign](../../../linguistics/topics/semiotics/terms/sign.md)~ (~d542...ecb~ and ~babble~).

```elisp
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



```elisp :results raw
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
  	   (format "- %s"
  		   (org-roam-node-id node)
  		   (org-roam-node-title node)))
  	 nodes
  	 "\n")))
    output)
```

```elisp
  (gpe/ritm/render-list-of-matches '(("edaef069-c68d-46aa-a970-d3cb7fe3165c" . "d542e8d2-3512-47a0-adbb-4a393e161ecb")))
```
