(setq emsems-example--channel
      '(("brutstrap-css"
	 ("name" . "Brutstrap CSS")
	 ("description" . "a cascading stylesheet for representing HTML content as it is constructed.")
	 ("creator" . "emsenn")
	 ("license" . "CC0")
	 ("versions"
	  ("current"
	   ("sourcehut"
	    ("location" . "https://git.sr.ht/~emsenn/brutstrap-css/blob/master/")
	    ("formats" . ("html" "md" "pdf" "tex" "txt"))))))))
(defun emsems-get-packages
    (channel)
  "Return a list of the media package identifiers available on
  this channel."
  (interactive "schannel: ")
  (loop for package
	in channel
	collect (car package)))
(defun emsems-get-manifest
    (channel id)
  "Get the media package manifest for ID from media package
  channel CHANNEL."
  (interactive "schannel: \nsid: ")
  (assoc id channel))
(defun emsems-get-versions
    (channel id)
  "Get the known versions of media package ID from media package
  channel CHANNEL."
  (interactive "schannel: \nsid: ")
  (loop for versions
	in (cdr (assoc "versions" (emsems-get-manifest emsems-example-package-channel "brutstrap-css")))
	collect (car versions)))
(defun emsems-get-origins
    (channel id version)
  "Return a list of origins for version VERSION of media package
  ID."
  (interactive "schannel: \nsid: \nsversion: ")
  (loop for origin
	in (cdr (assoc version (cdr (assoc "versions" (emsems-get-manifest channel id)))))
	collect (car origin)))

(emsems-get-origins emsems-example-package-channel "brutstrap-css" "current")
