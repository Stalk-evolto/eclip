;;; eclip-customize.el --- eclip customize config.   -*- lexical-binding: t; -*-

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

;; Disable startup screen.
(setq inhibit-startup-screen t)

;; Set theme.
(load-theme 'modus-vivendi)

;; Disable toolbar.
(tool-bar-mode -1)

;; Disable blinking.
(blink-cursor-mode -1)

;; Disable bell ring.
(setq ring-bell-function 'ignore)

;; Set scrolling.
(setq scroll-margin 0
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Enable pixel scroll.
(pixel-scroll-precision-mode t)

;; Set mode line.
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Set line number show in left.
(global-display-line-numbers-mode t)

;; Frame title show file path or buffer name(if buffer no visiting file).
(setq frame-title-format
      '("" invocation-name " - " (:eval (if (buffer-file-name)
                                      (abbreviate-file-name (buffer-file-name))
                                      "%b"))))

;; View key binding in click key.
(require 'which-key)
(which-key-mode t)

;; Show and clean whitespace.
(whitespace-mode t)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

;; Enable dired-x.
(with-eval-after-load 'dired
  (require 'dired-x)
  ;; Set dired-x global variables here.  For example:
  ;; (setq dired-x-hands-off-my-keys nil)
  )
(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            ;; (dired-omit-mode 1)
            ))

;; Enable winner mode.
(winner-mode +1)

;;; Set shift-{left,right,up,down} move point to window.
(require 'windmove)
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Set backup and autosave files in tmp dir.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'eclip-customize)
;;; eclip-customize.el ends here
