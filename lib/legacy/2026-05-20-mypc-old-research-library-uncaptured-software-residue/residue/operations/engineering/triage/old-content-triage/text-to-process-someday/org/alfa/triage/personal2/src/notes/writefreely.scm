(define-module (writefreely)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system go)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages node))

(define-public go-github-com-go-humanize
  (package
   (name "go-github-com-go-humanize")
   (version "1.0.0")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/dustin/go-humanize/")
		  (commit "9f541cc9db5d55bce703bd99987c9d5cb8eea45e")))
	    (sha256
	     (base32
	      "00000"))))
   (build-system go-build-system)
   (synopsis "A TOML parser for Golang with reflection.")
   (description "This package provides a reflection interfact similar
to Go's json and xml packages.")
   (home-page "https://github.com/BurntSushi/toml")
   (license ))
(define-public writefreely
  (package
   (name "writefreely")
   (version "0.9.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/writeas/writefreely/")
		  (commit "fdbefa806fd05ea5f61cf1a0fc75900c2a1dd24e")))
	    (sha256
	     (base32
	      "0zp9d6n1mp0nfcpfxl3pyjy235q386h84skz97yhd348zjnmq7ki"))))
   (build-system go-build-system)
   (arguments
    '(#:import-path "github.com/writeas/writefreely"))
   (native-inputs
    `(("go-humanize" ,go-github-com-go-humanize)))
   (synopsis "A simple, federated blogging platform.")
   (description "WriteFreely is a blogging platform that can publish to
the 'Fediverse' via ActivityPub.")
   (home-page "https://writefreely.org/")
   (license agpl3)))

writefreely
