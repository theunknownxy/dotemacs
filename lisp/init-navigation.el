(use-package ivy
  :diminish ivy-mode
  :demand t
  :config
  (setq ivy-use-virtual-buffers t
        ivy-virtual-abbreviate 'full
        ivy-extra-directories nil) ;; Remove .. and .
  (setq ivy-re-builders-alist
        '((swiper     . ivy--regex-plus)
          (counsel-ag . ivy--regex-plus)
          (counsel-rg . ivy--regex-plus)
          (t          . ivy--regex-fuzzy)))
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
  (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
  (define-key ivy-minibuffer-map (kbd "C-l") 'ivy-alt-done)
  (define-key ivy-minibuffer-map (kbd "C-h") 'ivy-backward-kill-word)
  (ivy-mode 1)
  (evil-leader/set-key
    "r" 'ivy-resume)
  (evil-set-initial-state 'ivy-occur-grep-mode 'normal)
  (evil-make-overriding-map ivy-occur-mode-map 'normal))

(use-package counsel
  :diminish
  :bind (("C-s" . counsel-grep-or-swiper))
  :demand t
  :config
  (counsel-mode 1)
  (when (executable-find "fd")
    (setenv "FZF_DEFAULT_COMMAND" "fd --type f"))
  (evil-leader/set-key
    "h" 'counsel-fzf
    "fr" 'counsel-recentf))


(use-package swiper
  :demand t)

(use-package ivy-rich
  :demand t
  :config
  (ivy-rich-mode 1))

(use-package ivy-xref
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package ivy-hydra
  :demand t)

(use-package smex
  :demand t)

(use-package avy
  :bind ("M-[" . avy-goto-word-or-subword-1))

(provide 'init-navigation)
