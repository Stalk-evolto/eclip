;;; eclip-nftables.el --- nftables edit mode config.  -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Stalk Evolto

;; Author: Stalk Evolto <stalk@stalk-laptop>
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

(require 'nftables-mode)

(add-to-list 'auto-mode-alist '("nftables.conf\\'" . nftables-mode))
(defun nftables-flymake (report-fn &rest _args)
  "Flymake backends: @code{nft -c -f} check."
  (when-let ((buf (current-buffer))
             (file (buffer-file-name)))
    (let ((temp-file (make-temp-file "nft-check-" nil ".nft")))
      (unwind-protect
          (progn
            (write-region nil nil temp-file nil 'silent)
            (make-process
             :name "nftables-flymake"
             :buffer (generate-new-buffer " *nft-flymake*")
             :command `("nft" "-c" "-f" ,temp-file)
             :connection-type 'pipe
             :sentinel
             (lambda (proc _event)
               (when (eq 'exit (process-status proc))
                 (unwind-protect
                     (funcall report-fn
                              (parse-nft-errors (process-exit-status proc)
                                                   (with-current-buffer (process-buffer proc)
                                                     (buffer-string))
                                                   temp-file))
                   (kill-buffer (process-buffer proc))
                   (delete-file temp-file))))))
        (unless (process-live-p nil)
          (delete-file temp-file))))))

(defun parse-nft-errors (exit-code output temp-file)
  "parse nft -c -f, to Flymake check table。"
  (if (eq exit-code 0)
      nil
    (let ((diagnostics nil))
      (with-temp-buffer
        (insert output)
        (goto-char (point-min))
        (while (re-search-forward
                "^\\([^:]+\\):\\([0-9]+\\):\\([0-9]+\\)-[0-9]+: \\(.*\\)" nil t)
          (let* ((file (match-string 1))
                 (line (string-to-number (match-string 2)))
                 (col  (string-to-number (match-string 3)))
                 (msg  (match-string 4)))
            (when (string= (file-truename file) (file-truename temp-file))
              (push (flymake-make-diagnostic (current-buffer)
                                             (1- line) (1- col) 'line msg :error)
                    diagnostics)))))
      (nreverse diagnostics))))

(with-eval-after-load 'nftables-mode
  (add-hook 'nftables-mode-hook
            (lambda ()
              (add-hook 'flymake-diagnostic-functions #'nftables-flymake nil t))))

(provide 'eclip-nftables)
;;; eclip-nftables.el ends here
