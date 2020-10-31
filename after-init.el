

;; a list of all configurations that must be loaded
(defvar configs '(misc scheme c
                       python ruby haskell cpp js
                       ibuffer auctex nxml org bindings))
(defun require-config (config)
  (message "Loading %s..." config)
  (require config)
  (message "Loaded %s." config))

;; load editing utils
(require-config 'editing-utils)
;; load navigation utils
(require-config 'navigation-utils)

;; load coding utils - should be done before coding configs!
(require-config 'coding-utils)


;; require all the configs automatically
(dolist (config configs)
  (require-config (intern (concatenate 'string
                                       (symbol-name config)
                                       "-config"))))


(global-set-key (kbd "C-c j") 'just-one-space)
(global-set-key (kbd "C-c f") 'fixup-whitespace)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)

(global-set-key [f5] 'query-replace)
(global-set-key [f6] 'recompile)
(global-set-key [f7] 'hippie-expand)
(global-set-key "\M-/" 'hippie-expand)
(global-set-key "\M- " 'hippie-expand)
(global-set-key [C-tab] 'other-window)
(defun select-previous-window ()
  "Switch to the previous window"
  (interactive)
  (select-window (previous-window)))
(global-set-key [C-S-iso-lefttab] 'select-previous-window)
(global-set-key [C-M-tab] 'next-buffer)

(global-set-key [C-M-S-iso-lefttab] 'previous-buffer)
(global-set-key [f8] 'ispell)
(global-set-key [f9] 'magit-status)

(setq require-final-newline t)
(tool-bar-mode -1)

(setq markdown-comaand "/usr/bin/github-markup")


(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c8" 'pep8)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-ck" 'delete-trailing-whitespace)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-cp" 'pylint)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c\C-c" 'flycheck-mode)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-c`" 'next-error)))
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-ch" 'flymake-start-syntax-check)))
(add-hook 'python-mode-hook '(lambda () (add-hook 'before-save-hook 'delete-trailing-whitespace)))

(add-hook 'sh-mode-hook '(lambda () (add-hook 'before-save-hook 'delete-trailing-whitespace)))
(add-hook 'sh-mode-hook '(lambda () (local-set-key "\C-c\C-c" 'flycheck-mode)))
(add-hook 'sh-mode-hook '(lambda () (local-set-key "\C-c1" 'next-error)))

;; no overwrite mode
(put 'overwrite-mode 'disabled t)
(define-key global-map [(insert)] nil)


;; automagic make scripts executable
(add-hook 'after-save-hook
        #'(lambda ()
        (and (save-excursion
               (save-restriction
                 (widen)
                 (goto-char (point-min))
                 (save-match-data
                   (looking-at "^#!"))))
             (not (file-executable-p buffer-file-name))
             (shell-command (concat "chmod u+x " buffer-file-name))
             (message
              (concat "Saved as script: " buffer-file-name)))))


(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)
