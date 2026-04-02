;;; personal-llvm.el --- Ellama use llvm server config.  -*- lexical-binding: t; -*-

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

(use-package ellama
  :ensure t
  :bind ("C-c x" . ellama)
  ;; send last message in chat buffer with C-c C-c
  :hook (org-ctrl-c-ctrl-c-final . ellama-chat-send-last-message)
  :init
  (setopt ellama-language "Chinese")
  (require 'llm-openai)
  (setopt ellama-provider
          (make-llm-openai-compatible
           :url "http://localhost:5432/v1/")
          llm-warn-on-nonfree nil)
  ;; display reasoning buffer.
  (setopt ellama-show-reasoning nil)
  :config
  ;; show ellama context in header line in all buffers
  (ellama-context-header-line-global-mode +1)
  ;; show ellama session id in header line in all buffers
  (ellama-session-header-line-global-mode +1))

(require 'ellama)
(defun ellama-generate-name-by-provider (provider action prompt)
  (string-join
   (flatten-tree
    (list (split-string (format "%s" action) "-")
          (format "%s" (buffer-name))
          (format "(%s)" (llm-name provider))))
   " "))
(setopt ellama-naming-scheme #'ellama-generate-name-by-provider)

(keymap-global-set "C-c C-t" 'ellama-translate-buffer)
(keymap-global-set "C-c t" 'ellama-translate)

(provide 'personal-llvm)
;;; personal-llvm.el ends here
