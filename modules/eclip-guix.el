;;; eclip-guix.el --- Guix devel mode config.        -*- lexical-binding: t; -*-

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

(require 'guix-devel)
(require 'compile)

(defvar compilation-run-virtual-machine-arguments
  "-m 2048 -smp 2 -nic user,model=virtio-net-pci"
  "Last shell command arguments used to qemu for run virtual machine.")

(defun compilation-finish-run-virtual-machine (cur-buffer msg)
  (string-match "\\(exited abnormally\\|interrupt\\|killed\\|terminated\\|segmentation fault\\|finished\\)\\(?:.*with code \\([0-9]+\\)\\)?" msg)
  (let ((process-status (match-string 1 msg)))
    (when (equal process-status "finished")
      (with-current-buffer cur-buffer
        (re-search-forward "/gnu/store/[a-z0-9]+-run-vm.sh$"
                           (save-excursion
			     (goto-char (point-max))
			     (point))
                           t)
        (start-file-process-shell-command
         "guix-virtual-machine"
         "*Guix-Virtual-Machine*"
         (concat (match-string-no-properties 0) " "
                 compilation-run-virtual-machine-arguments))))))

(add-hook 'compilation-finish-functions 'compilation-finish-run-virtual-machine)

(provide 'eclip-guix)
;;; eclip-guix.el ends here
