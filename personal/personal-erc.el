;;; personal-erc.el --- Erc connect configuration.   -*- lexical-binding: t; -*-

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

(defun erc-libera ()
  (interactive)
    (erc :server "127.0.0.1"
     :port 12345
     :user "stalk"
     :nick "stalk"
     :password "stalk/i2pd:password"))

;; Set ERC connect Pounce to connect irc.libera.chat
;; Befor you need config the CertFP and SASL to your NickName.
;; Than you need config Pounce in dotfiles/config/systems/system.scm
(defun erc-ilita ()
  (interactive)
  (erc-tls :server "127.0.0.1"
         :port 6697
         :nick "stalk"))

(provide 'personal-erc)
;;; personal-erc.el ends here
