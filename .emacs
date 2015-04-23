;; General settings
(setq inhibit-startup-message t)
(tool-bar-mode t)
(menu-bar-mode t)
(blink-cursor-mode nil)
(tooltip-mode nil)
(scroll-bar-mode nil)
(setq line-number-mode t)
(setq column-number-mode t)
(setq frame-title-format "%b - emacs")
(setq next-line-add-newlines nil)
(mouse-wheel-mode t)

;; Tabulator settings
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Autosave settings
(defvar auto-save-dir
  (concat "~/.emacs.d/autosaves/" (user-login-name) "/"))
(make-directory auto-save-dir t)

(defun auto-save-file-name-p (filename)
  (string match "^#.*#" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat auto-save-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; Backup settings
(defvar backup-dir
  (concat "~/.emacs.d/backup/" (user-login-name) "/"))
(make-directory backup-dir t)

(setq backup-directory-alist (list (cons "." backup-dir))
      delete-old-versions -1
      kept-new-versions 12
      kept-old-versions 12
      version-control t)
