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


(use-package
  org :straight t
  :config
  
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
  		    "<a href=\"../blog/index.html\">"
  		    "Blog</a> | "
  		    "<a href=\"../projects/index.html\">"
  		    "Projects"
  		    "</a> | "
  		    "<a href=\"../portfolio/index.html\">"
  		    "Portfolio"
  		    "</a>"
  		    "<p><em>emsenn.net</em> is where emsenn shares digital artifacts e created with the Web.</p>"
  		    "</section>"
  		    ))
  (setq emacsen-org-html-subsubdir-preamble
        (concat "<a href=\"#content\" class=\"skip-to-content\">skip to content</a>"
  	      "<section class=\"nav\"><strong>emsenn.net:</strong> "
  	      "<a href=\"../../index.html\">"
  	      "Homepage</a> | "
  	      "<a href=\"../../blog/index.html\">"
  	      "Blog</a> | "
  	      "<a href=\"../../projects/index.html\">"
  	      "Projects"
  	      "</a> | "
  	      "<a href=\"../../portfolio/index.html\">"
  	      "Portfolio"
  	      "</a>"
  	      "<p><em>emsenn.net</em> is where emsenn shares digital artifacts e created with the Web.</p>"
  	      "</section>"
  	      ))
      (setq emsenn-net-org-html-head
  	  (concat "<style>
    @charset \"UTF-8\";
    body {
      position: relative;
      background-color: #ccd;
      color: #113;
      font-family: serif;
      margin: 0 auto;
      padding-bottom: 6rem;
      min-height: 100%;
      font-family: sans-serif;
    }
    #preamble {
      margin: 0.5em auto;
      width: 85vw;
      max-width: 95em;
      padding-bottom: 0;}
    article {
      background-color: #eed;
      box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
      width: 85vw;
      max-width: 70em;
      margin: 0.5em auto;
      padding: 1em;
    }
    header {
      margin: 0 0.5em;
      margin-bottom: 2em;
      padding-bottom: 0.5em;
      border-bottom: 0.2em dotted #444;
    }
    header nav {
      font-size: 1.2em;
    }
    header nav a{
      margin: 0 0.4em;
    }
    h1, .title { margin: 0.2em 0 0.2em 0; font-size: 3.2em; }
    h1 small { font-size: 0.5em; margin: 0 0.2em 0 0.2em; padding: 0.2em;}
    main {
      width: 85vw;
      max-width: 70em;
      margin: 0 auto;
      line-height: 1.6;
      margin-bottom: 3rem;
    }
    img { width: 30em; max-height: 80vh; }
    footer, #postamble {
      width: 75vw;
      max-width: 45em;
      margin: 0 auto;
      overflow: hidden;
      margin-top: 2em;
      padding-top: 0.5em;
      border-top: 0.1em dotted #444;
    }
    section {
      margin-bottom: 0.5em;
      padding-bottom: 0.5em;
    }
    .outline-3 {
      border-bottom: 0.1rem dotted #444;
    }
    .pages-listing {
      padding: 0.5em 2em;
    }
    .pages-listing ul { list-style-type: none; width: 100%; padding: 0; margin 0 auto; }
    .pages-listing li {
      border-bottom: 0.1em dashed #413;
      padding-bottom: 0.2em;
    }
    .page-brief .page-summary {
      font-size: 0.7em;
    }
    .page-brief .page-keywords { font-size 0.8em; }
    blockquote {
      padding: 0.5rem;
      border-left: 0.1em solid #444;
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
    }
    dt {
      font-weight: normal;
      display: inline-block;
      border-bottom: 0.1rem dotted #444;
    }
    #text-index dt { border-bottom: none; }
    h2 { text-align: left; font-size: 2em; margin: 0.25em 0 0 0;}
    h3 {
      font-size: 1.8em;
      border-bottom: 0.2em dotted #444;   }
    h4 {
      font-size: 1.6em;
    }
    h5 {
      font-size: 1.4em;
      margin: 0.5em 0 0.2em 10%;
    }
    h6 {
      font-size: 1.2em;
      margin: 0.5em 0 0.2em 30%;
    }
    .annotation { margin-left: 0.5em; }
    a {
      text-decoration: none;
      color: #208;
      display: inline;
      position: relative;
      border-bottom: 0.1rem dotted;
      line-height: 1.2;
      transition: border 0.3s;
    }
    a:hover {
      color: #52a;
      outline-style: none;
      border-bottom: 0.1rem solid;
    }
    a:visited { color: #739; }
    a:visited:hover { color: #95b; }
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
    label.org-src-name {
      margin: 0 0 0 3em;
      font-family: sans-serif;
      font-size: 1rem;
      line-height: 0;
    }
    .skip-to-content {
      opacity: 0;
      position: absolute;
    }
    .skip-to-content:focus{
      opacity:1
    }
    ul { max-width: 85%; }
    .footpara { display: inline; font-size: 0.8rem; }
  </style>"))
  
  (setq org-publish-project-alist
	`(
	  
	  ("emsenn-website" :components ("emsenn-website-all" "emsenn-website-blog" "emsenn-website-projects" "emsenn-website-portfolio" "emsenn-website-static"))
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
	  	       :base-directory "~/org/projects/emsenn-net"
	  	       :publishing-directory "~/org/published/projects/emsenn-net")
	  	      ("emsenn-website-blog"
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
	  	       :base-directory "~/org/projects/emsenn-net/blog"
	  	       :publishing-directory "~/org/published/projects/emsenn-net/blog"
	  	       :html-preamble ,emacsen-org-html-subdir-preamble
	  	       :sitemap-filename "index.org"
	  	       :sitemap-sort-files chronologically
	  	       :sitemap-title "Blog Entries")
	  	      ("emsenn-website-projects"
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
	  	       :base-directory "~/org/projects/emsenn-net/projects"
	  	       :publishing-directory "~/org/published/projects/emsenn-net/projects"
	  	       :html-preamble ,emacsen-org-html-subdir-preamble)
	  	      ("emsenn-website-portfolio"
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
	  	       :base-directory "~/org/projects/emsenn-net/portfolio"
	  	       :publishing-directory "~/org/published/projects/emsenn-net/portfolio"
	  	       :html-preamble ,emacsen-org-html-subdir-preamble)
	  	      ("emsenn-website-static"
	  	       :base-directory "~/org/projects/emsenn-net"
	  	       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
	  	       :publishing-directory "~/org/published/projects/emsenn-net/"
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
