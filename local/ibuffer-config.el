(require 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Org" ;; all org-related buffers
                (mode . org-mode))
               ("dired" (mode . dired-mode))
               ("emacs"
                (or
                 (name . "^\\*scratch\\*$")
                 (name . "^\\*Messages\\*$")
                 (name . "^TAGS\\(<[0-9]+>\\)?$")
                 (name . "^\\*Help\\*$")
                 (name . "^\\*info\\*$")
                 (name . "^\\*Occur\\*$")
                 (name . "^\\*grep\\*$")
                 (name . "^\\*Compile-Log\\*$")
                 (name . "^\\*Backtrace\\*$")
                 (name . "^\\*Process List\\*$")
                 (name . "^\\*gud\\*$")
                 (name . "^\\*Man")
                 (name . "^\\*WoMan")
                 (name . "^\\*Kill Ring\\*$")
                 (name . "^\\*Completions\\*$")
                 (name . "^\\*tramp")
                 (name . "^\\*shell\\*$")
                 (name . "^\\*compilation\\*$")))
               ("LaTeX" ;; Latex stuff
                (mode . latex-mode))
               ("Programming" ;; prog stuff
                (or
                 (mode . makefile-gmake-mode)
                 (mode . c-mode)
                 (mode . c++-mode)
                 (mode . perl-mode)
                 (mode . python-mode)
                 (mode . emacs-lisp-mode)
                 (mode . clojure-mode)
                 (mode . ruby-mode)
                 ))
               ("ERC"   (mode . erc-mode))
               ("Jabber"
                (or
                 (mode . jabber-chat-mode)
                 (mode . jabber-roster-mode)))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'ibuffer-config)
