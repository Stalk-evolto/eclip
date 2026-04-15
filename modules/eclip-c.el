;;; eclip-c.el --- C programming edit config.        -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Stalk Evolto

;; Author: Stalk Evolto <stalk-evolto@outlook.com>
;; Keywords: c, lisp

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

(require 'cc-mode)

;; Set C style is gnu.
(defun c-mode-common-style-defaults ()
  (setq c-default-style
	'((java-mode . "java")
          (awk-mode . "awk")
          (other . "gnu")))

  ;; Set C indent levels 4 space.
  (setq c-basic-offset 4))

(add-hook 'c-mode-common-hook 'c-mode-common-style-defaults)

;; Set eglot enable in C mode.
(add-hook 'c-mode-hook 'eglot-ensure)

;; set hs-minor for create hide.
(add-hook 'c-mode-common-hook 'hs-minor-mode)

(require 'gdb-mi)
;; Set gdb many windows.
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

(require 'skeleton)
(require 'abbrev)

(define-skeleton skel-c-main
  "Insert main function."
  nil
  "int main(int argc, char *argv[]) {" \n
  > _
  ?\n "}"
  )
(define-abbrev c-mode-abbrev-table "fmain" "" 'skel-c-main)

(define-skeleton skel-c-if
  "Insert \(`if') stream contral."
  "Condition test: "
  "if (" str ") {" \n
  > _
  ?\n "}"
  )
(define-abbrev c-mode-abbrev-table "if" "" 'skel-c-if)

(define-skeleton skel-c-else-if
  "Insert \(`else if') stream contral."
  "Condition test: "
  "else if (" str ") {" \n
  > _
  ?\n "}"
  )
(define-abbrev c-mode-abbrev-table "elif" "" 'skel-c-else-if)

(define-skeleton skel-c-else
  "Insert \(`else') stream contral."
  "Condition test: "
  "else {" \n
  > _
  ?\n "}"
  )
(define-abbrev c-mode-abbrev-table "else" "" 'skel-c-else)

(define-skeleton skel-c-ifdef
  "Insert #ifdef #ifndef #endif macro."
  "Condition macro: "
  (if (y-or-n-p "If define?") "#ifdef " "#ifndef ") str \n
  > _
  ?\n "#endif /* " str " */"
  )
(define-abbrev c-mode-abbrev-table "3ifd" "" 'skel-c-ifdef)

(define-skeleton skel-c-switch
  "Insert switch-case-default \(`switch') stream contral."
  "Condition variable: "
  "switch (" str ") {" \n
  > _
  ?\n "}"
  )
(define-skeleton skel-c-case
  "Insert switch-case-default \(`case') stream contral."
  nil
  ("Condition value: " "case" str ":" \n) \n
  > _
  )
(define-abbrev c-mode-abbrev-table "switch" "" 'skel-c-switch)
(define-abbrev c-mode-abbrev-table "case" "" 'skel-c-case)

(define-skeleton skel-c-while
  "Insert \(`while') iteration."
  "Condition sexp: "
  "while (" str ") {" \n
  > _
  ?\n "}"
  )
(define-abbrev c-mode-abbrev-table "while" "" 'skel-c-while)

(define-skeleton skel-c-for
  "Insert \(`for') iteration."
  nil
  "for ("
  ("Initialize: " str "; ")
  ("Test: " str "; ")
  ("Step: " str )
  ") {" \n
  > _
  ?\n "}")
(define-abbrev c-mode-abbrev-table "for" "" 'skel-c-for)

(define-skeleton skel-c-do
  "Insert \(`do-while') iteration."
  "Condition sexp: "
  "do {" \n
  > _
  ?\n "} while (" str ");"
  )
(define-abbrev c-mode-abbrev-table "do" "" 'skel-c-do)

(define-skeleton skel-c-struct-union-enum
  "Insert \(`struct') \(`union') \(`enum') define."
  '(if v1 (completing-read "Type: " v1 nil t last-abbrev-text)
		   (read-no-blanks-input "Type: " last-abbrev-text))
  '(setq v1 '("struct" "union" "enum"))
  str ?\s (read-no-blanks-input "Type name: ") " {" \n
  > _
  ?\n "} "
  ("Variable name: " str ", ") & -2 | -1 ";"
  )

(define-abbrev c-mode-abbrev-table "struct" "" 'skel-c-struct-union-enum)
(define-abbrev c-mode-abbrev-table "union" "" 'skel-c-struct-union-enum)
(define-abbrev c-mode-abbrev-table "enum" "" 'skel-c-struct-union-enum)

(define-abbrev c-mode-abbrev-table "3inc" "#include" 'c-mode-hook)

(define-skeleton skel-c-function-define
  "Insert function define."
  (read-no-blanks-input "Function return type: ")
  str ?\s (read-no-blanks-input "Function name: ") ?\s "("
  ("Parameter: " str ", ") & -2 ")" ?\n
  "{" \n
  > _
  ?\n "} "
  )
(define-abbrev c-mode-abbrev-table "func" "" 'skel-c-function-define)

(provide 'eclip-c)
;;; eclip-c.el ends here
