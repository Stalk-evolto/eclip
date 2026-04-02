;; Add MELPA package source.
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Set some package according to source.
(setq package-pinned-packages
      '(
        (geiser . "melpa-stable")
	(paredit . "melpa-stable")))

;; Some packages eclip need.
(setq core-packages
      '(geiser paredit))

;; Install the packages eclip need.
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      core-packages)

(provide 'eclip-package)
