;;; personal-telega.el --- telega personal connect config.  -*- lexical-binding: t; -*-

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

(setq telega-proxies
      (list
       '(:server "localhost" :port 8440 :enable t
                 :type ( :@type "proxyTypeMtproto"
                         :secret "d676d59cd211bfe0031e4db3debc6a1b"))
       '(:server "localhost" :port 8441 :enable :false
                 :type ( :@type "proxyTypeMtproto"
                         :secret "1b3e58008e4a2838505ea99838db21df"))))

(provide 'personal-telega)
;;; personal-telega.el ends here
