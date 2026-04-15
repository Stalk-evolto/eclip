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

;;; personal-c.el ends here
