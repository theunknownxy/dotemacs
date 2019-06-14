(setq-default indent-tabs-mode nil)

(delete-selection-mode t)
(electric-pair-mode t)

(bind-keys*
 ("C-;" . comment-line))

(req-package editorconfig
  :diminish
  :demand t
  :config
  (editorconfig-mode 1))

(req-package dtrt-indent
  :diminish dtrt-indent-mode
  :demand t
  :config
  (dtrt-indent-global-mode 1))

(req-package anzu
  :bind (("M-%" . anzu-query-replace)
         ("C-M-%" . anzu-query-replace-regexp)))

(req-package expand-region
  :commands er/expand-region
  :require evil-leader
  :init
  (evil-leader/set-key "=" 'er/expand-region))

(req-package undo-tree
  :diminish undo-tree-mode
  :ensure t
  :config
  (global-undo-tree-mode 1))

(req-package tramp
  :config
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  ;; Some performance settings
  (setq remote-file-name-inhibit-cache nil)
  (setq vc-ignore-dir-regexp
        (format "%s\\|%s"
                vc-ignore-dir-regexp
                tramp-file-name-regexp)))

(req-package company
  :demand t
  :config
  (global-company-mode 1)
  (global-set-key (kbd "M-TAB") #'company-complete)
  (setq company-tooltip-align-annotations t)
  (define-key company-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous)
  (define-key company-active-map (kbd "C-l") #'company-complete-selection))

(req-package company-flx
  :require company
  :demand t
  :config
  (company-flx-mode 1))
(req-package company-statistics
  :require company
  :demand t
  :config
  (company-statistics-mode 1))
(req-package company-quickhelp
  :require company
  :demand t
  :config
  (company-quickhelp-mode 1))

(req-package ws-butler
  :hook ((prog-mode conf-mode org-mode) . ws-butler-mode))

(req-package markdown-mode
  :mode "\\.md\\'"
  :config
  (add-hook 'markdown-mode-hook #'ws-butler-mode)
  (add-hook 'markdown-mode-hook #'(lambda () (setq truncate-lines nil))))

(req-package yasnippet)

(req-package highlight-indent-guides
  :commands highlight-indent-guides-mode
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-responsive 'top))

(req-package olivetti
  :config
  (setq-default olivetti-body-width 94))

(provide 'init-editor)
