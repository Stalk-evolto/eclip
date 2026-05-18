;;; Directory Local Variables         -*- no-byte-compile: t; -*-
;;; For more information see (info "(emacs) Directory Variables")

((emacs-lisp-mode . ((compile-command
          . (concat "guix shell emacs -f "
                    (locate-dominating-file default-directory
                                            "guix.scm")
                    "guix.scm "
                    "--container --network "
                    "--preserve='^DISPLAY$' "
                    "--expose=$XAUTHORITY --preserve='^XAUTHORITY$' "
                    "-- emacs"))))
 (texinfo-mode . ((compile-command
                   . (concat "makeinfo "
                             (buffer-file-name))))))
