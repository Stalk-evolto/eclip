;;; eclip-python.el --- Python edit configuration.   -*- lexical-binding: t; -*-

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

(require 'python)
(defun python-mode-defaults ()
  "Defaults for Python programming edit."
  (setq python-indent-offset 4))

(add-hook 'python-mode-hook 'python-mode-defaults)

;; Set eglot enable in python mode.
(add-hook 'python-mode-hook 'eglot-ensure)

;; set hs-minor for create hide.
(add-hook 'python-mode-hook 'hs-minor-mode)

(provide 'eclip-python)
;;; eclip-python.el ends here
