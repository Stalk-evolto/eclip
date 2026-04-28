;;  guix.scm --- Pakcgae define.
;; Copyright (C) 2026  Stalk Evolto <stalk@stalk-laptop>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
             (gnu packages python-xyz)
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
         emacs-ellama
         emacs-telega
	 emacs-paredit
	 emacs-oauth2
	 emacs-yaml
         emacs-markdown-mode
         python-markdown
	 guile-3.0-latest
	 guile-readline
	 guile-colorized
	 gcc-toolchain
	 gdb
	 clang
         python-lsp-server))
  (build-system emacs-build-system)
  (arguments
   (list
    #:include #~(cons* "^core/" "^modules/" "^personal/" %default-include)))
  (synopsis "Emacs config files.")
  (description "Eclip is Emacs config files.")
  (home-page "https://stalk-evolto.github.io")
  (license license:gpl3)))

eclip
