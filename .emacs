;;karthic's emacs file
(setq sgml-basic-offset 4)

(setq load-path (cons "~/.emacs.d/custom" load-path))
(load "myplugins")
(load "myfuncs")
(load "mykeys")
(load "myconf")
;; (load "myfonts") Disabling myfonts to use themes - An Upgrade, lol

;; Learn a word a day!
(load "word-of-the-day")

(add-to-list 'load-path "~/.emacs.d/plugins/sr-speedbar")
(require 'sr-speedbar)

(add-to-list 'load-path "~/.emacs.d/plugins/edit-server")
(require 'edit-server)
(edit-server-start)

(defun log4j-mode-hook-impl ()
  "For use in log4j-mode"
  (local-set-key (kbd "<C-up>") 'log4j-backward-record)
  (local-set-key (kbd "<C-down>") 'log4j-forward-record)
  (read-only-mode t)
  )

(defun adsf ()
  "don't know yet"
  (interactive)
  (write-region "hel" nil "/home/karthic/cat.out")
  )


;; Log4j mode - Enable efficient reading of logs
(autoload 'log4j-mode "log4j-mode" "Major mode for viewing log files." t)
(add-to-list 'auto-mode-alist '("\\.log\\'" . log4j-mode))
(add-to-list 'auto-mode-alist '("\\.out\\'" . log4j-mode))
(add-hook 'log4j-mode-hook 'log4j-mode-hook-impl)


;; Emacs-eclipse
(add-to-list 'load-path "~/.emacs.d/elpa/eclim-20161019.838/")
(package-initialize)
;; http://emacs.stackexchange.com/questions/2595/problem-of-loading-a-package-at-emacs-startup
;; See first answer
(require 'eclim)
(global-eclim-mode)

;; If you want to control eclimd from emacs, also add:
(require 'eclimd)

(setq eclimd-default-workspace "~/spirework/java")

;; Eclim java outline just like eclipse
;; Bound to C-c , j by default
(add-hook 'java-mode-hook 'semantic-mode)

;; Disable auto-save in eclim
;; (setq eclim-auto-save nil)

(add-to-list 'eclim--file-coding-system-mapping '("iso-latin-1-unix" . "iso-8859-1"))

;; Eclipse installation
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-eclipse-dirs (quote ("~/serverstuff/eclipse")))
 '(eclim-executable "~/serverstuff/eclipse/eclim"))

;; Displaying compilation error messages in the echo area
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim)
(ac-emacs-eclim-config)

;; Configuring company-mode
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)

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
;; Replaced by log4j-mode
;; (add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))
;; (add-to-list 'auto-mode-alist '("\\.out\\'" . auto-revert-tail-mode))

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
;; (add-to-list 'load-path "~/.emacs.d/plugins/jdee-2.4.1/lisp")
;; (load "jde")

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


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
