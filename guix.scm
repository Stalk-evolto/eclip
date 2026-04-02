(use-modules (guix)
             (guix build-system emacs)
             ((guix license) #:prefix license:)
             (guix git-download)
             (gnu packages texinfo)
             (gnu packages version-control)
             (gnu packages emacs))

(define vcs-file?
  (or (git-predicate (getcwd))
      (const #t)))

(package
  (name "eclip")
  (version "1.0")
  (source (local-file "." "eclip-checkout"
                      #:recursive? #t
                      #:select? vcs-file?))
  (build-system emacs-build-system)
  (synopsis "Emacs config files.")
  (description "Eclip is Emacs config files.")
  (home-page "https://stalk-evolto.github.io")
  (license license:gpl3))
