;;karthic's emacs file
(setq sgml-basic-offset 4)

(setq load-path (cons "~/.emacs.d/custom" load-path))
(load "myplugins")
(load "myfuncs")
(load "mykeys")
(load "myconf")
;; (load "myfonts") Disabling myfonts to use themes - An Upgrade, lol

(add-to-list 'load-path "~/.emacs.d/plugins/sr-speedbar")
(require 'sr-speedbar)

(add-to-list 'load-path "~/.emacs.d/plugins/edit-server")
(require 'edit-server)
(edit-server-start)

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

;; ayyo
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; automagically tail log and out files
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))
(add-to-list 'auto-mode-alist '("\\.out\\'" . auto-revert-tail-mode))

;; make the fringe stand out from the background
;; (setq solarized-distinct-fringe-background t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Use more italics
(setq solarized-use-more-italic t)

;; Load solarized theme
(load-theme 'solarized-dark t)

;; (add-to-list 'load-path "~/.emacs.d/elpa/jdee-20150913.159")
;; (require 'jdee)
;; (push 'jdee-mode ac-modes)

;; Enable abbreviations in JDEE mode
;; (jdee-abbrev-mode)

;; For JDEE - A Java Development Environment
(add-to-list 'load-path "~/.emacs.d/plugins/jdee-2.4.1/lisp")
(load "jde")

;; third time jdee - Got zip from github
;; (add-to-list 'load-path "/home/karthic/.emacs.d/plugins/jdee-master")


;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semanticdb-minor-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-stickyfunc-mode
;;                                   global-semantic-mru-bookmark-mode))

;; (setq semantic-load-turn-everything-on t)
;; (semantic-mode 1)
;; (require 'semantic)
;; (require 'semantic/senator)
;; (require 'semantic/ia)
;; (require 'semantic/wisent)
;; (require 'semantic/wisent/java-tags)

;; (setq jde-auto-parse-enable nil)
;; (setq jde-enable-senator nil)

;; (require 'jdee)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(jde-jdk (quote ("1.8")))
 '(jde-jdk-registry (quote (("1.8_1" . "/usr/lib/jvm/java-8-oracle") ("1.8" . "/usr/lib/jvm/java-8-oracle"))))
 '(jdee-enable-abbrev-mode t)
 '(jdee-jdk-registry (quote (("1.8" . "/usr/lib/jvm/java-8-oracle"))))
 '(jdee-server-dir "/home/karthic/.emacs.d/plugins/jdee-master-dependency-jars"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


