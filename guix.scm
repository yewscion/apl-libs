(use-modules
 ;;; These are my commonly needed modules; remove unneeded ones.
 (guix packages)
 ((guix licenses) #:prefix license:)
 (guix download)
 (guix build-system gnu)
 (gnu packages)
 (gnu packages autotools)
 (gnu packages pkg-config)
 (gnu packages texinfo)
 (gnu packages tex)
 (guix gexp))

(package
  (name "apl-libs")
  (version "0.0.1")
  (source (local-file (string-append "./"
                                     name
                                     "-"
                                     version
                                     ".tar.bz2")))
  (build-system gnu-build-system)
  (arguments
   `(#:tests? #f
     #:phases
     (modify-phases
      %standard-phases
      ;; APL Libraries programs don't need to be stripped.
      (delete 'strip))))
  (native-inputs (list autoconf automake pkg-config texinfo))
  (inputs (list texlive-base texlive-tex-texinfo))
  (synopsis "A Personal Set of APL Libraries")
  (description
   (string-append
    "The Yewscion APL Libs is my personal set of APL Libraries."))
  (home-page
   "https://sr.ht/~yewscion/yewscion-apl-libs/")
  (license license:agpl3+))

;; Local Variables:
;; mode: scheme
;; End:
