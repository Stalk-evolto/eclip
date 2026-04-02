;;; personal-c.el --- personal c mode edit config.   -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Stalk Evolto

;; Author: Stalk Evolto <stalk-evolto@outlook.com>
;; Keywords: lisp

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

;;; Commentary:

;;

;;; Code:

(defvar c-include-path
  (delete-dups (split-string (getenv "C_INCLUDE_PATH") ":"))
  "The system C programming include path.")

(defun setenv-ld-library-path ()
  "Set LD_LIBRARY_PATH value same LIBRARY_PATH."
  (interactive)
  (setenv "LD_LIBRARY_PATH" (getenv "LIBRARY_PATH")))
(add-hook 'c-mode-common-hook #'setenv-ld-library-path)

;; set gtags.
(autoload 'gtags-mode "gtags" "" t)
(require 'gtags)
(require 'hl-line)
(add-hook 'gtags-select-mode-hook
          (lambda ()
            (setq hl-line-face 'underline)
            (hl-line-mode 1)))
(add-hook 'c-mode-hook
          (lambda ()
            (gtags-mode 1)))
(setq gtags-suggested-key-mapping t)
(setq gtags-auto-update t)

;; set semantic.
(require 'cc-mode)
(require 'semantic)
(add-hook 'c-mode-common-hook
          (lambda ()
            (dolist (include-path c-include-path)
              (semantic-add-system-include include-path))
            (setq semantic-c-dependency-system-include-path c-include-path)))

;;; personal-c.el ends here
