 ;; EDK uses the new python.el from
;; https://github.com/fgallina/python.el
(require 'python)

(pyvenv-workon "t37")
(elpy-enable)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")


(add-hook 'elpy-mode-hook 'blacken-mode)

(setq blacken-only-if-project-is-blackened 't)

(pyvenv-workon "develop37")

(provide 'python-config)


;; (add-hook 'python-mode-hook 'my/python-mode-hook)
