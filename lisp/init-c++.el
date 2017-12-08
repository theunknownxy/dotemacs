(after "cc-mode"
  (add-hook 'c++-mode-hook (lambda () (subword-mode 1)))
  (c-add-style "unknown"
	       '("java"
		 (c-offsets-alist
		  (topmost-intro-cont . 0)
		  (access-label . -)
		  (inclass . +))))
  (setq c-default-style "unknown"
	indent-tabs-mode 0
	c-basic-offset 4
	c-cleanup-list '(defun-close-semi
			  scope-operator
			  empty-defun-braces))

  (defadvice c-lineup-arglist (around lambda-lineup activate)
    "Improve indentation of continued C++11 lambda function opened as argument."
    (setq ad-return-value
	  (if (and (equal major-mode 'c++-mode)
		   (ignore-errors
		     (save-excursion
		       (goto-char (c-langelem-pos langelem))
		       ;; Detect "[...](" or "[...]{". preceded by "," or "(",
		       ;;   and with unclosed brace.
		       (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
	      0                           ; no additional indent
	    ad-do-it))))

(req-package fic-mode
  :commands (turn-on-fic-mode)
  :init
  (add-hook 'c++-mode-hook 'fic-mode))

(req-package cpputils-cmake
  :commands cppcm-reload-all
  :init
  (add-hook 'c-mode-common-hook (lambda ()
				  (if (derived-mode-p 'c-mode 'c++-mode)
				      (cppcm-reload-all))))
  :config
  (setq cppcm-write-flymake-makefile nil))

(req-package lsp-mode)

(req-package company-lsp
  :requires lsp-mode
  :init
  (push 'company-lsp company-backends)
  :config
  (setq company-lsp-async t))

(req-package cquery
  :requires lsp-mode
  :commands (lsp-cquery-enable)
  :loader :path
  :load-path "~/src/cquery/emacs/"
  :init
  (add-hook 'c++-mode-hook 'lsp-cquery-enable))

;;;; clang-format
(req-package clang-format
  :init
  (evil-leader/set-key
    "mff" 'clang-format-buffer
    "mfr" 'clang-format-region))

;;;; gdb
(setq gdb-many-windows t)

(provide 'init-c++)
