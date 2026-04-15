(use-modules (guix packages)
             (guix build-system emacs)
             ((guix licenses) #:prefix license:)
             (guix git-download)
	     (guix gexp)
             (gnu packages texinfo)
             (gnu packages version-control)
             (gnu packages emacs)
	     (gnu packages emacs-xyz)
	     (gnu packages guile)
	     (gnu packages guile-xyz)
	     (gnu packages commencement)
	     (gnu packages llvm)
	     (gnu packages gdb))

(define vcs-file?
  (or (git-predicate (getcwd))
      (const #t)))

(define-public eclip
(package
  (name "eclip")
  (version "1.0")
  (source (local-file "." "eclip-checkout"
                      #:recursive? #t
                      #:select? vcs-file?))
  (native-inputs
   (list emacs))

  (propagated-inputs
   (list emacs-debbugs
	 emacs-guix
	 emacs-geiser
	 emacs-geiser-guile
	 emacs-paredit
	 emacs-oauth2
	 emacs-yaml
	 guile-3.0-latest
	 guile-readline
	 guile-colorized
	 gcc-toolchain
	 gdb
	 clang))
  (build-system emacs-build-system)
  (arguments
   (list
    #:include #~(cons* "^core/" "^modules/" "^personal/" %default-include)
    #:phases
    #~(modify-phases %standard-phases
	(add-before 'move-doc 'install-symlink
	  (lambda* (#:key outputs #:allow-other-keys)
	    (use-modules (guix build utils))
	    (let* ((out (assoc-ref outputs "out"))
		   (elpa-dir (elpa-directory out)))
	      (mkdir-p (string-append elpa-dir "/savefile/"))
	      ;; (symlink elpa-dir
	      ;; 	       (string-append (getenv "HOME") "/" ".test.d"))
	      ))))))
  (synopsis "Emacs config files.")
  (description "Eclip is Emacs config files.")
  (home-page "https://stalk-evolto.github.io")
  (license license:gpl3)))

eclip
