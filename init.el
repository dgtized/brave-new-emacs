(defalias 'yes-or-no-p 'y-or-n-p)
(define-key help-map (kbd "C-l") 'find-library)
(require 'dired-x)

(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defun ensure-packages (package-list)
  "Ensures packages in list are installed locally"
  (unless (file-exists-p package-user-dir)
    (package-refresh-contents))
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package))))

(ensure-packages '(better-defaults))

(package-install-file "not-in-load-path/github-browse-settings.el")
(require 'github-browse-settings)

(ensure-packages '(smex))
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex-major-mode-commands)

(ensure-packages '(avy))
(global-set-key (kbd "C-'") 'avy-goto-word--or-subword-1)
(global-set-key (kbd "C-M-'") 'avy-pop-mark)

(ensure-packages '(magit))
(global-set-key (kbd "C-x g") 'magit-status)

(ensure-packages '(projectile))
(projectile-global-mode)

(ensure-packages '(elisp-slime-nav))
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode)
  (add-hook hook 'turn-on-eldoc-mode))

(ensure-packages '(zenburn-theme))
(load-theme 'zenburn t)

(global-set-key (kbd "C-c l") 'org-store-link)
