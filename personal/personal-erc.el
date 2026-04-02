;;; personal-erc.el --- Functional configuration for GNU Emacs.
;;; Copyright © 2025 Stalk Evolto <stalk-evolto@outlook.com>
;;;
;;; This file is part of GNU Emacs.
;;;
;;; GNU Emacs is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Emacs is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;; Set ERC connect ZNC to connect irc.ilita.i2p
;; Befor you need config the ZNC than use znc --makeconf
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
