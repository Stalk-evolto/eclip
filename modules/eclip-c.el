;;; eclip-c.el --- C programming edit config.        -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Stalk Evolto

;; Author: Stalk Evolto <stalk-evolto@outlook.com>
;; Keywords: c, lisp

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

;; Set C style is gnu.
(defun c-mode-common-style-defaults ()
  (setq c-default-style
	'((java-mode . "java")
          (awk-mode . "awk")
          (other . "gnu")))

  ;; Set C indent levels 4 space.
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'c-mode-common-style-defaults)

;; Set eglot enable in C mode.
(add-hook 'c-mode-hook 'eglot-ensure)

;; set hs-minor for create hide.
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Set gdb many windows.
(setq
 ;; use gdb-many-windows by default
 gdb-manoy-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

(provide 'eclip-c)
;;; eclip-c.el ends here
