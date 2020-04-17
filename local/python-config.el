;; EDK uses the new python.el from
;; https://github.com/fgallina/python.el
(require 'python)

(pyvenv-workon "develop37")
(elpy-enable)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'elpy-mode-hook 'blacken-mode)

(pyvenv-workon "develop37")

(provide 'python-config)


;; (add-hook 'python-mode-hook 'my/python-mode-hook)
