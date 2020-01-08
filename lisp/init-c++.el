(use-package cc-mode
  :config
  (add-hook 'c++-mode-hook (lambda () (subword-mode 1)))
  (c-add-style "unknown"
	       '("java"
		 (c-offsets-alist
		  (topmost-intro-cont . 0)
		  (access-label . -)
                  (inlambda . 0)
		  (inclass . +))))
  (setq c-default-style "unknown"
	indent-tabs-mode 0
	c-basic-offset 4
	c-cleanup-list '(defun-close-semi
			  scope-operator
			  empty-defun-braces)))

(setq compilation-scroll-output 'first-error)

(use-package cmake-mode)

(defun xy//enable-cpp-lsp ()
  (interactive)
  (mapc (lambda (buf) (with-current-buffer buf
                        (when (derived-mode-p 'c-mode)
                          (lsp))))
        (projectile-project-buffers))
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp))

;;;; gdb
(setq gdb-many-windows t)

(provide 'init-c++)
