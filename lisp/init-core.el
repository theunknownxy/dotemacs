;;;; General settings
;; Fix scrolling
(setq mouse-wheel-scroll-amount '(5)
      mouse-wheel-progressive-speed nil)

;; Truncate long lines
(setq-default truncate-lines 1)

;; Backup files
(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      kept-old-versions 2
      kept-new-versions 4
      version-control t)

;; straight.el bootstrap
(setq straight-use-package-by-default t)
(setq straight-vc-git-default-clone-depth 1)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq use-package-always-defer t)
(setq use-package-compute-statistics t)

(provide 'init-core)

