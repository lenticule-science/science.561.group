---
name: "emsenn's Letters to the Web"
aliases:
  - "emsenn's Letters to the Web"
  - "emsenn's letters to the web"
date-created: 2025-08-13
tags: []
date-updated: 2026-03-09
part-of: personal/writing/terms
---

*/ey Letters to the Web/* are letters that I, emsenn, wrote for the Web. They're syndicated onto Substack at [https://emsenn.substack.com](https://emsenn.substack.com.md), where you can subscribe to get them into your email inbox.

My letters to the Web provide a Lakota perspective on things, written toward an audience who are curious about different ways to look at things like psychology and sociology.

* Catalog
  (let* ((nodes
  	(org-roam-db-query
  	 [:select [*]
  		  :from nodes
  		  :where (and
  			  (like properties '"%structure%[[id:1794ee8d-7bf3-4240-85ab-aeebbb62c0a8%")
  			  (like properties
  				'"%author%[[id:40cbaad9-af3c-4573-b356-ae116687e483%")
  			  (like properties '"%public%true%"))]))
  	(sorted-nodes
  	 (sort nodes
  	       (lambda (a b)
  		 (string-lessp (cdr (nth 1 (nth 9 a))) (cdr (nth 1 (nth 9 b))))))))
         (mapconcat
  	(lambda (node)
  	  (format "%s" node)
  	  (format "- %s :: [[id:%s][%s]]" (cdr (nth 1 (nth 9 node))) (car node) (nth 8 node)))
  	(reverse sorted-nodes)
  	"\n"))

- true :: On white-supremacist COVID-eugenicist queers
- Fascist grammaring, (post)liberal vocabularies, and [anarchist](../../sociology/schools/anarchism/index.md) alternatives :: A Storm is a Storm is a Storm
