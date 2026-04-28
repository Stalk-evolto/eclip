;;; eclip-skeletons.el --- skeletons config.         -*- lexical-binding: t; -*-

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

(require 'skeleton)
(define-skeleton skel-gpl3
  "Insert Copyright GPLv3 in file."
  "Short description: "
  '(setopt comment-style 'extra-line)
  @ ?\s (file-name-nondirectory (buffer-file-name)) " --- " str
  (make-string (max 2 (- 80 (current-column) 27)) ?\s)
  ?\n "Copyright (C) " (format-time-string "%Y") "  "
  (getenv "ORGANIZATION") | (progn user-full-name)
  '(if (search-backward "&" (line-beginning-position) t)
       (replace-match (capitalize (user-login-name)) t t))
  '(end-of-line 1) " <" (progn user-mail-address) ">"
  ?\n
  ?\n  "This program is free software; you can redistribute it and/or modify"
  ?\n  "it under the terms of the GNU General Public License as published by"
  ?\n  "the Free Software Foundation, either version 3 of the License, or"
  ?\n  "(at your option) any later version." ?\n
  ?\n  "This program is distributed in the hope that it will be useful,"
  ?\n  "but WITHOUT ANY WARRANTY; without even the implied warranty of"
  ?\n  "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
  ?\n  "GNU General Public License for more details." ?\n
  ?\n  "You should have received a copy of the GNU General Public License"
  ?\n  "along with this program.  If not, see <https://www.gnu.org/licenses/>." @
  ?\n '(comment-region (car (last skeleton-positions)) (car skeleton-positions))
  ?\n _
  )

(require 'tempo)

;; Set auto insert.
(require 'autoinsert)
(auto-insert-mode t)

;; Set hippie-expand substitute dabbrev-expand.
(require 'hippie-exp)
(global-set-key [remap dabbrev-expand] 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

(provide 'eclip-skeletons)
;;; eclip-skeletons.el ends here
