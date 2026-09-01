(if (and (version< emacs-version "26.3") (>= libgnutls-version 30600))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))
(defvar straight-install-script-path
  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
    (url-retrieve-synchronously straight-install-script-path
     'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq inhibit-startup-message t)
(setq visible-bell 1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; LANDBACK\n")
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode 1)
(setq line-number-mode t)
(setq column-number-mode t)
(setq-default truncate-lines t)
(setq-default line-spacing 1)
(setq sentence-end-double-space nil)
(global-visual-line-mode t)
(setq echo-keystrokes 0.1)
(setq fill-column 68)
(setq mouse-wheel-scroll-amount '(1 ((shift) .1)))
(use-package darktooth-theme
  :straight t
  :config
  (load-theme 'darktooth t))
(setq user-mail-address "emsenn@emsenn.net")
(setq user-full-name "emsenn")

(use-package fennel-mode
  :straight t
  :mode "\\.fnl\\'"
  :interpreter "fennel"
  :custom
  (inferior-lisp-program "/home/emsenn/.luarocks/bin/fennel"))


(straight-use-package '(beancount :type git :host github :repo "beancount/beancount-mode"))

(use-package
  org :straight t
  :config
  (setq org-directory "~/org")
  (setq org-startup-folded 'fold)
  (setq org-hide-block-startup 'hideblocks)
  (setq org-catch-invisible-edits 'show-and-error)
  (setq org-agenda-files (list "~/org"))
  (setq org-export-with-section-numbers nil)
  (setq org-export-with-smart-quotes nil)
  (setq org-export-with-toc nil)
  (setq org-html-htmlize-output-type 'nil)
  (setq org-html-validation-link nil)
  (setq org-log-done 'time)
  (setq org-log-into-drawer 'LOGBOOK)
  (setq org-image-actual-width '(400))
  (setq org-latex-default-packages-alist
        '(("AUTO" "inputenc" t
  	 ("pdflatex"))
  	("T1" "fontenc" t
  	 ("pdflatex"))
  	("" "graphicx" t nil)
  	("" "grffile" t nil)
  	("" "longtable" nil nil)
  	("" "wrapfig" nil nil)
  	("" "rotating" nil nil)
  	("normalem" "ulem" t nil)
  	("" "amsmath" t nil)
  	("" "textcomp" t nil)
  	("" "amssymb" t nil)
  	("" "capt-of" nil nil)
  	("" "titletoc" nil nil)
  	("" "hyperref" nil nil)))
  (org-babel-do-load-languages 'org-babel-load-languages
  			     '((shell . t)))
  (defun emacsen-org-html-format-drawer (name contents)
    (format "<section class=\"org-drawer\"> %s </section>" contents))
  ;; from https://www.john2x.com/blog/blogging-with-orgmode.html
  (defun emacsen-org-publish-format-sitemap (title sitemap)
    (let ((posts (cdr sitemap)))
      (concat
       (format "#+title: %s\n" title)
       "#+author: emsenn\n"
       "#+email: emsenn@emsenn.net\n"
       "#+options: timestamp:nil date:nil\n"
       (format "#+date: %s\n" (format-time-string "[%Y-%m-%d %a %H:%M:%S]" (current-time)))
       "#+roam_tags: meta\n"
       (org-list-to-org (cons (car sitemap) posts)))))
  (setq emacsen-org-html-subdir-preamble
        (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
  	      "<section class=\"nav\"><strong>emsenn.net:</strong> "
  	      "<a href=\"../index.html\">"
  	      "Homepage</a> | "
  	      "<a href=\"../bul/index.html\">"
  	      "Bulletins</a> | "
  	      "<a href=\"../mainindex.html\">"
  	      "Main Index</a>"
  	      "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
  	      <details>
  	        <summary>Click this sentence for information about my Website.</summary>
  	        <p>Click each sentence below for more info:</p>
  	          <ul>
  	            <li><details>
  	      	<summary>This website was created by Emacs and Org-mode</summary>
  	      	<p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
  	            </details></li>
  	            <li><details>
  	      	<summary>It uses style to add information to the pages.</summary>
  	      	<ul>
  	      	  <li><details>
  	      	  <summary>Click this sentence to see how links are styled:</summary>
  	      	  <table>
  	      	    <thead><tr>
  	      	      <th scope=\"col\">Color</th>
  	      	      <th scope=\"col\">Link type</th>
  	      	    </tr></thead>
  	      	    <tbody>
  	      	      <tr><td class=\"link\">Sample</td>
  	      		<td>Unvisited local resource</td></tr>
  	      	      <tr><td class=\"visited-link\">Sample</td>
  	      		<td>Visited local resource</td></tr>
  	      	      <tr><td class=\"external-link\">Sample</td>
  	      		<td>Unvisited external resource</td></tr>
  	      	      <tr><td class=\"visited-external-link\">Sample</td>
  	      		<td>Visited external resource</td></tr>
  	      	    </tbody>
  	      	  </table>
  	      	</details></li>
  	            </ul>
  	          </details></li>
  	        </ul>
  	      </details>
  	      "
  	      "</section>"
  	      ))
  (setq emacsen-org-html-subsubdir-preamble
        (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
  	      "<section class=\"nav\"><strong>emsenn.net:</strong> "
  	      "<a href=\"../../index.html\">"
  	      "Homepage</a> | "
  	      "<a href=\"../../bul/index.html\">"
  	      "Bulletins</a> | "
  	      "<a href=\"../../mainindex.html\">"
  	      "Main Index</a>"
  	      "<p>This Website was cultivated as a public asset with <a href=\"https://ko-fi.com/emsenn\">support</a> from people like you. <strong><em>Thank you!</em></strong></p>
  	      <details>
  	        <summary>Click this sentence for information about my Website.</summary>
  	        <p>Click each sentence below for more info:</p>
  	          <ul>
  	            <li><details>
  	      	<summary>This website was created by Emacs and Org-mode</summary>
  	      	<p>See <a href=\"https://emsenn.net/per/emacsen.html\">my Emacs configuration</a> to learn how.</p>
  	            </details></li>
  	            <li><details>
  	      	<summary>It uses style to add information to the pages.</summary>
  	      	<ul>
  	      	  <li><details>
  	      	  <summary>Click this sentence to see how links are styled:</summary>
  	      	  <table>
  	      	    <thead><tr>
  	      	      <th scope=\"col\">Color</th>
  	      	      <th scope=\"col\">Link type</th>
  	      	    </tr></thead>
  	      	    <tbody>
  	      	      <tr><td class=\"link\">Sample</td>
  	      		<td>Unvisited local resource</td></tr>
  	      	      <tr><td class=\"visited-link\">Sample</td>
  	      		<td>Visited local resource</td></tr>
  	      	      <tr><td class=\"external-link\">Sample</td>
  	      		<td>Unvisited external resource</td></tr>
  	      	      <tr><td class=\"visited-external-link\">Sample</td>
  	      		<td>Visited external resource</td></tr>
  	      	    </tbody>
  	      	  </table>
  	      	</details></li>
  	            </ul>
  	          </details></li>
  	        </ul>
  	      </details>
  	      "
  	      "</section>"
  	      ))
      (setq emsenn-net-org-html-head
  	  (concat "<style>
  	 @charset \"UTF-8\";
  
  	 :root {	
       --body-font: sans-serif;
  	     --header-font: sans-serif;
  	     --code-font: monospace;
  	     --primary-color: #ffe;
  	     --primary-dim-color: #eed;
  	     --secondary-color: #312;
  	     --secondary-dim-color: #756;
  	     --link-color: #880;
  	     --link-hover-color: #aa2;
  	     --link-visited-color: #934;
  	     --link-visited-hover-color: #b56;
  	     --external-link-color: #008;
  	     --external-link-hover-color: #60b;
  	     --external-link-visited-color: #172;
  	     --external-link-visited-hover-color: #394;
  	 }
  	 @media(prefers-color-scheme:dark){
  	     :root {
  		--body-font: sans-serif;
  		--header-font: sans-serif;
  		--code-font: monospace;
  		--primary-color: #756;
  		--primary-dim-color: #312;
  		--secondary-color: #eed;
  		--secondary-dim-color: #ffe;
  		--link-color: #880;
  		--link-hover-color: #aa2;
  		--link-visited-color: #934;
  		--link-visited-hover-color: #b56;
  	     }}
  	 body {
  	     position: relative;
  	     min-height: 100%;
  	     background-color: var(--primary-color);
  	     color: var(--secondary-color);
  	     margin: 0 auto;
  	     font-family: sans-serif;
  	 }
  	 main, #content {
  	     background-color: var(--primary-dim-color);
  	     border-left: 1.5em dotted var(--primary-color);
  	     padding: 1em;
  	 }
  	 header {
  	     border-bottom: 0.8em dotted var(--secondary-dim-color);
  	 }
  	 h1 { font-size: 2em; margin-bottom: 0; }
  	 h2 {
  	     border-bottom: 0.3em dotted var(--secondary-dim-color);
  	 }
  	 h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
  	     width: 60%;
  	 }
  	 aside {
  	     float: right;
  	     width: 35%;
  	 }
  	 aside p { width: 100%; }
  	 @media screen and (max-width:760px) {
  	     h2, h3, h4, h5, h6, p, table, ul, ol, .org-src-container {
  		width: 90%;
  	     }
  	     aside {
  		float: inherit;
  		width: 90%;
  		border-top: 0.2em dotted var(--secondary-dim-color);
  		border-bottom: 0.2em dotted VAR(--secondary-dim-color);
  		font-size: 0.8em;
  		  }
  	 }
  
  	 footer, #postamble, #preamble {
  	     padding: 0.5em;
  	 }
  	 table {
  	     border-collapse: collapse;
  	     border-spacing: 0;
  	     empty-cells: show;
  	     border: 0.1em solid #444;
  	 }
  	 thead { font-family: sans-serif; }
  	 th, td {
  	     padding: 0 0.3em;
  	     border: 0.01em solid #444;
  	 }
  	 img {
  	     max-width: 80vw;
  	     vertical-align: middle;
  	 }
  	 pre, .src {
  	     padding: 0.5em;
  	     border: 0.1em solid #444;
  	     white-space: pre-wrap;
  	     overflow-x: scroll;
  	     text-overflow: clip;
  	     scrollbar-width: none;
  	 }
  	 pre::-webkit-scrollbar, .src::-webkit-scrollbar {
  	     display: none;
  	 }
  
  
  	 dt {
  	     font-weight: normal;
  	     display: inline-block;
  	     border-bottom: 0.1rem dotted #444;
  	 }
  	 #text-index dt { border-bottom: none; }
  	 h2, h3, h4, h5, h6, h7, h8, h9, h10 {
  	     display: block;
  	     font-family: sans-serif;
  	     margin: 0.2em auto 0.5em 0;
  	 }
  	 a, .link {
  	     text-decoration: none;
  	     color: #880;
  	     display: inline;
  	     position: relative;
  	     border-bottom: 0.1rem dotted;
  	     line-height: 1.2;
  	     transition: border 0.3s;
  	 }
  	 a:hover {
  	     color: #aa2;
  	     outline-style: none;
  	     border-bottom: 0.1rem solid;
  	 }
  	 a:visited, .visited-link { color: #934; }
  	 a:visited:hover { color: #b56; }
  	 a:focus {
  	     outline-style: none;
  	     border-bottom: 0.1rem solid;
  	 }
  	 ::selection { background-color: #777; color: #eee; }
  	 a::selection { background-color: #ccc; }
  	 .org-todo {
  	     background-color: #ddd;
  	     color: #333;
  	     font-size: .8rem;
  	     float: right;
  	 }
  	 .org-src-container + .example {
  	     margin-left: 8em;
  	 }
  	 a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):after, a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited:after, .external-link:after, .visited-external-link:after { 
  	     content: \"^\";
  	     font-size: 0.5em;
  	     vertical-align: super;
  	 }
  	 a[href^=\"https://\"]:not([href*=\"emsenn.net\"]), .external-link {
  	     color: var(--external-link-color);
  	 }
  	 a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):hover{ 
  	     color: var(--external-link-hover-color);
  	 }
  	 a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited, .visited-external-link { 
  	     color: var(--external-link-visited-color);
  	 }
  	 a[href^=\"https://\"]:not([href*=\"emsenn.net\"]):visited:hover{ 
  	     color: var(--external-link-visited-hover-color);
  	 }
  	 blockquote {
  	     border: 0.1em dashed var(--secondary-dim-color);
  	     padding-left: 0.2em;
  	 }
  	 label.org-src-name {
  	     margin: 0 0 0 3em;
  	     font-family: sans-serif;
  	     font-size: 1rem;
  	     line-height: 0;
  	 }
  	 .skip-to-content {
  	     opacity: 0;
  	     position: absolute;
  	     left: 0.2em;
  	 }
  	 .skip-to-content:focus{
  	     opacity: 1;
  	     background-color: var(--secondary-dim-color);
  	     color: var(--primary-color);
  	 }
  	 ul { max-width: 85%; }
    .footpara { display: inline; font-size: 0.8rem; }
  </style>"))
  
  (setq org-publish-project-alist
	`(
	  ("emsenn" :components ("emsenn-html" "emsenn-pdf"))
	  ("emsenn-html"
	     :base-extension "org"
	     :publishing-function org-html-publish-to-html
	     :html-doctype "html5"
	     :html-html5-fancy t
	     :html-container "section"
	     :headline-levels 10
	     :html-divs ((preamble "section" "preamble")
	  	       (content "main" "content")
	  	       (postamble "section" "postamble"))
	     :with-footnotes t
	     :makeindex t
	     :base-directory "~/org/"
	     :publishing-directory "~/org/pub/emsenn")
	  ("emsenn-pdf"
	     :base-extension "org"
	     :publishing-function org-latex-publish-to-pdf
	     :with-footnotes t
	     :makeindex t
	     :base-directory "~/org/"
	     :publishing-directory "~/org/pub/emsenn")
	  ("emsenn-website" :components ("emsenn-website-all" "emsenn-website-bul" "emsenn-website-com" "emsenn-website-def" "emsenn-website-ref" "emsenn-website-ter" "emsenn-website-ter-adv" "emsenn-website-ter-ref" "emsenn-website-static"))
	  
	  ("emsenn-website-all"
	     :base-extension "org"
	     :publishing-function org-html-publish-to-html
	     :html-doctype "html5"
	     :html-html5-fancy t
	     :html-container "section"
	     :headline-levels 6
	     :recursive t
	     :html-divs ((preamble "section" "preamble")
	  	       (content "main" "content")
	  	       (postamble "section" "postamble"))
	     :publishing-function org-html-publish-to-html
	     :html-head-include-scripts nil
	     :html-head-include-default-style nil
	     :html-head ,emsenn-net-org-html-head
	     :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	     :with-footnotes t
	     :with-date nil
	     :with-timestamps nil
	     :with-author nil
	     :makeindex t
	     :base-directory "~/org/ems"
	     :publishing-directory "~/org/pub/emsenn-net")
	  ("emsenn-website-bul"
	   :base-extension "org"
	   :publishing-function org-html-publish-to-html
	   :html-doctype "html5"
	   :html-html5-fancy t
	   :html-container "section"
	   :headline-levels 6
	   :recursive t
	   :html-divs ((preamble "section" "preamble")
	  	     (content "main" "content")
	  	     (postamble "section" "postamble"))
	   :publishing-function org-html-publish-to-html
	   :html-format-drawer-function emacsen-org-html-format-drawer
	   :sitemap-function emacsen-org-publish-format-sitemap
	   :html-head-include-scripts nil
	   :html-head-include-default-style nil
	   :html-head ,emsenn-net-org-html-head
	   :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	   :auto-sitemap t
	   :with-footnotes t
	   :with-toc nil
	   :with-drawers t
	   :with-date nil
	   :with-timestamps nil
	   :with-author nil
	   :base-directory "~/org/ems/bul/"
	   :publishing-directory "~/org/pub/emsenn-net/bul"
	   :html-preamble ,emacsen-org-html-subdir-preamble
	   :sitemap-filename "index.org"
	   :sitemap-sort-files chronologically
	   :sitemap-title "Bulletins")
	    ("emsenn-website-com"
	     :base-extension "org"
	     :publishing-function org-html-publish-to-html
	     :html-doctype "html5"
	    :html-html5-fancy t
	  :html-container "section"
	  :headline-levels 6
	  :recursive t
	  :html-divs ((preamble "section" "preamble")
	  	    (content "main" "content")
	  	    (postamble "section" "postamble"))
	  :publishing-function org-html-publish-to-html
	  :html-format-drawer-function emacsen-org-html-format-drawer
	  :sitemap-function emacsen-org-publish-format-sitemap
	  :html-head-include-scripts nil
	  :html-head-include-default-style nil
	  :html-head ,emsenn-net-org-html-head
	  :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	  :auto-sitemap t
	  :with-footnotes t
	  :with-toc nil
	  :with-drawers t
	  :with-date nil
	  :with-timestamps nil
	  :with-author nil
	  :base-directory "~/org/ems/com/"
	  :publishing-directory "~/org/pub/emsenn-net/com"
	  :html-preamble ,emacsen-org-html-subdir-preamble
	  :sitemap-filename "index.org"
	  :sitemap-sort-files chronologically
	  :sitemap-title "Communications")
	  
	   ("emsenn-website-def"
	  :base-extension "org"
	  :publishing-function org-html-publish-to-html
	  :html-doctype "html5"
	  :html-html5-fancy t
	  :html-container "section"
	  :headline-levels 6
	  :recursive t
	  :html-divs ((preamble "section" "preamble")
	  	    (content "main" "content")
	  	    (postamble "section" "postamble"))
	  :publishing-function org-html-publish-to-html
	  :html-format-drawer-function emacsen-org-html-format-drawer
	  :sitemap-function emacsen-org-publish-format-sitemap
	  :html-head-include-scripts nil
	  :html-head-include-default-style nil
	  :html-head ,emsenn-net-org-html-head
	  :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	  :auto-sitemap t
	  :with-footnotes t
	  :with-toc nil
	  :with-drawers t
	  :with-date nil
	  :with-timestamps nil
	  :with-author nil
	  :base-directory "~/org/ems/def/"
	  :publishing-directory "~/org/pub/emsenn-net/def"
	  :html-preamble ,emacsen-org-html-subdir-preamble
	  :sitemap-filename "index.org"
	  :sitemap-sort-files alphabetically
	  :sitemap-title "Definitions")
	  
	   ("emsenn-website-ref"
	  :base-extension "org"
	  :publishing-function org-html-publish-to-html
	  :html-doctype "html5"
	  :html-html5-fancy t
	  :html-container "section"
	  :headline-levels 6
	  :recursive t
	  :html-divs ((preamble "section" "preamble")
	  	    (content "main" "content")
	  	    (postamble "section" "postamble"))
	  :publishing-function org-html-publish-to-html
	  :html-format-drawer-function emacsen-org-html-format-drawer
	  :sitemap-function emacsen-org-publish-format-sitemap
	  :html-head-include-scripts nil
	  :html-head-include-default-style nil
	  :html-head ,emsenn-net-org-html-head
	  :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	  :auto-sitemap t
	  :with-footnotes t
	  :with-toc nil
	  :with-drawers t
	  :with-date nil
	  :with-timestamps nil
	  :with-author nil
	  :base-directory "~/org/ems/ref/"
	  :publishing-directory "~/org/pub/emsenn-net/ref"
	  :html-preamble ,emacsen-org-html-subdir-preamble
	  :sitemap-filename "index.org"
	  :sitemap-sort-files alphabetically
	  :sitemap-title "References")
	   ("emsenn-website-ter"
	  :base-extension "org"
	  :publishing-function org-html-publish-to-html
	  :html-doctype "html5"
	  :html-html5-fancy t
	  :html-container "section"
	  :headline-levels 6
	  :recursive t
	  :html-divs ((preamble "section" "preamble")
	  	    (content "main" "content")
	  	    (postamble "section" "postamble"))
	  :publishing-function org-html-publish-to-html
	  :html-format-drawer-function emacsen-org-html-format-drawer
	  :sitemap-function emacsen-org-publish-format-sitemap
	  :html-head-include-scripts nil
	  :html-head-include-default-style nil
	  :html-head ,emsenn-net-org-html-head
	  :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	  :with-footnotes t
	  :with-toc nil
	  :with-drawers t
	  :with-date nil
	  :with-timestamps nil
	  :with-author nil
	  :makeindex t
	  :base-directory "~/org/ems/ter/"
	  :publishing-directory "~/org/pub/emsenn-net/ter"
	  :html-preamble ,emacsen-org-html-subdir-preamble)
	   ("emsenn-website-ter-adv"
	  :base-extension "org"
	  :publishing-function org-html-publish-to-html
	  :html-doctype "html5"
	  :html-html5-fancy t
	  :html-container "section"
	  :headline-levels 6
	  :recursive t
	  :html-divs ((preamble "section" "preamble")
	  	    (content "main" "content")
	  	    (postamble "section" "postamble"))
	  :publishing-function org-html-publish-to-html
	  :html-format-drawer-function emacsen-org-html-format-drawer
	  :sitemap-function emacsen-org-publish-format-sitemap
	  :html-head-include-scripts nil
	  :html-head-include-default-style nil
	  :html-head ,emsenn-net-org-html-head
	  :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	  :auto-sitemap t
	  :with-footnotes t
	  :with-toc nil
	  :with-drawers t
	  :with-date nil
	  :with-timestamps nil
	  :with-author nil
	  :base-directory "~/org/ems/ter/adv"
	  :publishing-directory "~/org/pub/emsenn-net/ter/adv"
	  :html-preamble ,emacsen-org-html-subsubdir-preamble
	  :sitemap-filename "index.org"
	  :sitemap-sort-files alphabetically
	  :sitemap-title "References")
	   ("emsenn-website-ter-ref"
	  :base-extension "org"
	  :publishing-function org-html-publish-to-html
	  :html-doctype "html5"
	  :html-html5-fancy t
	  :html-container "section"
	  :headline-levels 6
	  :recursive t
	  :html-divs ((preamble "section" "preamble")
	  	    (content "main" "content")
	  	    (postamble "section" "postamble"))
	  :publishing-function org-html-publish-to-html
	  :html-format-drawer-function emacsen-org-html-format-drawer
	  :sitemap-function emacsen-org-publish-format-sitemap
	  :html-head-include-scripts nil
	  :html-head-include-default-style nil
	  :html-head ,emsenn-net-org-html-head
	  :exclude ,(regexp-opt '("README.org" "PRIVATE"))
	  :auto-sitemap t
	  :with-footnotes t
	  :with-toc nil
	  :with-drawers t
	  :with-date nil
	  :with-timestamps nil
	  :with-author nil
	  :base-directory "~/org/ems/ter/ref"
	  :publishing-directory "~/org/pub/emsenn-net/ter/ref"
	  :html-preamble ,emacsen-org-html-subsubdir-preamble
	  :sitemap-filename "index.org"
	  :sitemap-sort-files alphabetically
	  :sitemap-title "References")
	   ("emsenn-website-static"
	  :base-directory "~/org/ems"
	  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	  :publishing-directory "~/org/pub/emsenn-net"
	  :recursive t
	  :publishing-function org-publish-attachment)
	  
	  ))

  :bind (
	 ("C-c l" . org-store-link)
	 ("C-c a" . org-agenda)
	 ("C-c c" . org-capture)
	 ("C-c t" . org-toggle-link-display)
	 ("C-c C-q" . counsel-org-tag)
	 ("<f8>" . emacsen-org-capture-capture-at-point)
  ))
