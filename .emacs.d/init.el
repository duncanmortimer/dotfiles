;; Set up package management in init --- allows installing org if missing
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
	("org"       . "http://orgmode.org/elpa/")
	("melpa"     . "http://melpa.milkbox.net/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(require 'use-package)

(setq dm/config-dir (file-name-directory (or load-file-name (buffer-file-name))))

(add-hook 'after-init-hook
		   `(lambda ()
			  (require 'org)
			  (org-babel-load-file (expand-file-name "base.org" dm/config-dir))))

(setq custom-file (expand-file-name "custom.el" dm/config-dir))
(load custom-file)
