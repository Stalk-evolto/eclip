;;; eclip-texinfo.el --- texinfo config.             -*- lexical-binding: t; -*-

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

(require 'texinfo)

(defun texinfo-enclosing-command-start ()
  "Find texinfo command start. Example, The * is point
	@code{The *code}
	@code*{The code}
	@code{The code}* -> *@code{The code}"
  (cond
   ((looking-at "@[a-zA-Z]+\{") (point))
   ((ignore-errors (progn
		     (backward-char)
		     (backward-up-list))))
   ((re-search-forward "[a-zA-Z]*\{"
		       (save-excursion
			 (move-end-of-line nil)
			 (point))
		       t)
    (progn
      (backward-char)
      (backward-sexp)
      (texinfo-enclosing-command-start)))))

(defun texinfo-delete-markup ()
  "Delete Texinfo command markup.
	@code{The code}* -> The code*"
  (interactive)
  (if (texinfo-enclosing-command-start)
      (let ((delete-start (texinfo-enclosing-command-start))
	    (delete-end (save-excursion
			  (goto-char (texinfo-enclosing-command-start))
			  (forward-sexp)
			  (forward-char +1)
			  (point))))
	(progn
	  (save-excursion
	   (goto-char delete-end)
	   (up-list)
	   (delete-char -1))
	 (delete-region delete-start delete-end)))
    (error "Point not in Texinfo command.")))

(eval-after-load 'texinfo
  '(progn
     (define-key texinfo-mode-map (kbd "M-[") #'texinfo-delete-markup)))

(provide 'eclip-texinfo)
;;; eclip-texinfo.el ends here
