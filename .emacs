;;karthic's emacs file
(setq sgml-basic-offset 4)

(setq load-path (cons "~/.emacs.d/custom" load-path))
(load "myplugins")

;; Learn a word a day!
;; (load "word-of-the-day")


;; Emacs-eclipse
(add-to-list 'load-path "~/.emacs.d/elpa/eclim-20161019.838/")
(package-initialize)
;; http://emacs.stackexchange.com/questions/2595/problem-of-loading-a-package-at-emacs-startup
;; See first answer

;; https://emacs.stackexchange.com/questions/10722/emacs-and-command-line-path-disagreements-on-osx
(exec-path-from-shell-initialize)

;; Eclipse installation
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-eclipse-dirs (quote ("~/serverstuff/eclipse")))
 '(eclim-executable "~/serverstuff/eclipse/eclim")
 '(package-selected-packages
   (quote
    (exec-path-from-shell zonokai-theme zenburn-theme w3m w3 tronesque-theme toxi-theme subatomic-theme solarized-theme racket-mode persistent-scratch pdf-tools monokai-theme magit log4j-mode gnus-desktop-notify es-mode datetime company-emacs-eclim ample-zen-theme afternoon-theme ac-emacs-eclim))))


;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; (add-to-list 'load-path "~/.emacs.d/elpa/pdf-tools-20160525.920")
;; (require 'pdf-tools)
;; (pdf-tools-install)

;; Install Packages Using ELPA, MELPA, Marmalade
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

(put 'erase-buffer 'disabled nil)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Load solarized theme
(load-theme 'solarized-dark t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defun log4j-mode-hook-impl ()
  "For use in log4j-mode"
  (local-set-key (kbd "<C-up>") 'log4j-backward-record)
  (local-set-key (kbd "<C-down>") 'log4j-forward-record)
  (read-only-mode t)
  )


;; Log4j mode - Enable efficient reading of logs
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))
(add-to-list 'auto-mode-alist '("\\.out\\'" . log4j-mode))
(add-hook 'log4j-mode-hook 'log4j-mode-hook-impl)

(load "myfuncs")
(load "mykeys")
(load "myconf")

