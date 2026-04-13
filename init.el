;;; init.el --- eclip init file.                     -*- lexical-binding: t; -*-

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

(defvar eclip-root-dir (file-name-directory load-file-name)
  "The root directory of the configuration.")
(defvar eclip-core-dir (expand-file-name "core" eclip-root-dir)
  "Eclip core directory.")
(defvar eclip-modules-dir (expand-file-name "modules" eclip-root-dir)
  "Eclip modules configuration directory.")
(defvar eclip-personal-dir (expand-file-name "personal" eclip-root-dir)
  "User personal configuration directory.")
(defvar savefile-dir (expand-file-name "savefile" user-emacs-directory)
  "Save backup file directory.")

(unless (file-exists-p savefile-dir)
  (make-directory savefile-dir))

(add-to-list 'load-path eclip-core-dir)
(add-to-list 'load-path eclip-modules-dir)
(add-to-list 'load-path eclip-personal-dir)

(require 'eclip-package)
(require 'eclip-customize)

;; Load modules dir elisp files.
(when (file-exists-p eclip-personal-dir)
  (mapc 'load (directory-files eclip-modules-dir 't "^[^#\.].*\\el$")))

;; Load personal dir elisp files.
(when (file-exists-p eclip-personal-dir)
  (mapc 'load (directory-files eclip-personal-dir 't "^[^#\.].*\\el$")))

;;; init.el ends here
