---
title: "emsenn's Writing"
aliases:
  - "emsenn's Writing"
  - "emsenn's writing"
date-created: 2025-09-02
type: term
tags: []
defines:
  - "emsenn's Writing"
date-updated: 2026-03-09
part-of: personal/writing/terms
---

* catalog

  (let* ((nodes
          (org-roam-db-query
           [:select [*]
            :from nodes
            :where (and
                    (or (like properties '"%form%babble%")
  		      (like properties '"%form%essay%"))
                    (like properties '"%public%true%"))]))
         (sorted-nodes
          (sort nodes
                (lambda (a b)
                  (string-lessp (nth 8 a) (nth 8 b))))))
    (mapconcat
     (lambda (node)
       (format "- [[id:%s][%s]]" (car node) (nth 8 node)))
     (reverse sorted-nodes)
     "\n"))

- test babble
- essay
- babble
- Why emsenn Is Lowercase
- Support Sustainable Economics in Pine Ridge
- Submission to Cindy Milstein zine, message to liberals
- Returning to Emacs with GnoponEmacs
- Relaunching emsenn.net
- Reflecting on personal experiences with solidarity in North Carolina
- Poking at stats for my research notes
- On hospicing humanity as a mechanism of total liberation
- On epistemics, economies, and didactics of encyclopedia, wiki, and digital gardens.
- My Essays
- J.D. Vance, Catholicism, and the Postliberal Turn
- Installing Guix on my Omnibook X
- How I Installed Emacs On My Chromebook
- Differentiating Attributing and Blaming in Introspection
- Decolonization is not a Metaphor
- Complaining about wildfire smoke
- Brief History of Rhoticitiy in General American English
- Blessed is the Flame
- [[id:3ca0238a-4623-4722-808a-93a21d4ca3f1][Babble, [2025-09-20 Sat 21:44], Geontological analysis of Flavor Town]]
- [[id:85a9a3a8-4c2a-4d2c-8121-d83e64eff8a7][Babble, [2025-09-19 Fri 21:39], On describing GnoponEmacs nodes]]
- [[id:856456dd-1a2c-4c11-9406-02ade9d20fe0][Babble, [2025-09-19 Fri 10:20], On improving GnoponEmacs with semiotics]]
- [[id:20c6e9e1-ee11-48c7-8a55-9a98e90480b4][Babble, [2025-09-17 Wed 23:05], Drafting a Fennel library for semiotics]]
- Babble, [2025-09-16 Tue 18:25]
- [[id:a6c60f5e-4915-4a4c-b73c-b62f8879c287][Babble, [2025-09-15 Mon 10:55], Install Cubical Agda in GnoponEmacs]]
- [[id:8fc8c669-c688-4aa7-b1ed-244f6394fcd2][Babble, [2025-09-15 Mon 09:19], Properly installing Fennel on my Omnibook]]
- [[id:34a6180c-ce51-4693-a6f0-2a3e9ed3f9b4][Babble, [2025-09-11 Thu 08:55], Installing TAB on my Omnibook]]
- [[id:d3c094e7-afc4-489a-a376-050092978208][Babble, [2025-09-10 Wed 11:09], On the defining "emsean paracosm"]]
- [[id:1351e79d-a307-4c6f-a675-8456b5fa24bb][Babble, [2025-09-08 Mon 14:42], On [Neel](../../general/people/phil-neel.md)'s Theory of the Party]]
- [[id:c76c79ac-0fd5-4bb4-baaf-75a0318cde0a][Babble, [2025-09-04 Thu 19:57], On influencer authenticity, aestheticity, authority, and availability]]
- [[id:59bdaa1b-63a4-4d0a-8546-b01746e684dc][Babble, [2025-09-02 Tue 20:05], On linguistic pragmatics and "ludimatics"]]
- [[id:fa3440f9-9ee1-4133-b0bc-d240808fc1b0][Babble, [2025-09-02 Tue 20:03], On Californication]]
- [[id:ea55f339-24a1-49ea-adc6-8786ad86e288][Babble, [2025-09-01 Mon 10:09], Mapping the neurotic platform intellectual]]
- [[id:cb672b64-f2b1-46c0-96e9-a0c8a4abef6e][Babble, [2025-09-01 Mon 09:49], Idea for Teraumian cats]]
- [[id:52ec12b3-b317-4f7a-9b06-a7d63cad1656][Babble, [2025-08-29 Fri 19:12], On the lineage of californication]]
- Babble, [2025-08-28 Thu 10:15]
- [[id:0e876cfc-d0db-4993-a5c8-8291e4ab8412][Babble, [2025-08-28 Thu 08:34], On the Annunciation Shooting]]
- Babble, [2025-08-26 Tue 09:23]
- Babble, [2025-08-25 Mon 00:49]
- [[id:d169cd46-fa49-4e08-b49b-5a3d42d6202e][Babble, [2025-08-04 Mon 09:53], Working with the Org-roam database]]
- [[id:25d4618f-0ffd-48cc-aa2f-239400fdf325][Babble, [2020-01-19 Sun], Anatomy of Things]]
- [[id:a3c1c545-774c-4191-b060-0fb77f9c7096][Babble, [2016-09-17 Sat], Planning MUD skillchecks]]
- Babble, 2025-08-07 0819h
- Anchoring Oktoberfest/Indianer genring post in theory
- Adding Org-cite to GnoponEmacs
- A History of Liberal Ontologizing As Kyriarchist Genring
