;;karthic891's configs

;;remove the emacs image during statup
(setq inhibit-startup-message t)

;; Disable the toolbar
(tool-bar-mode -1)

;; Disable the menu bar
;; (menu-bar-mode -1)

;;make kill-line include the ending newline char
(setq kill-whole-line t)

;; Prevent highlighting when navigating between marked points
;; setq-default sets the value globally ie., it affects all buffers
(setq-default transient-mark-mode nil)

;;default tab-width
(setq tab-width 4)

;; xml indent by 4 spaces
(setq nxml-child-indent 4)

(setq read-file-name-completion-ignore-case t)

;; http://www.emacswiki.org/emacs/IndentingJava
(add-hook 'java-mode-hook
	  (lambda ()
	    "Treat Java 1.5 @-style annotations as comments."
	    (setq c-comment-start-regexp "(@|/(/|[*][*]?))")
	    (modify-syntax-entry ?@ "< b" java-mode-syntax-table)))

(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4
				  tab-width 4
				  indent-tabs-mode t)))

;;set javascript code indent level - default is 2
(setq js-indent-level 4)

;;html tab-width - default is 2
(setq sgml-basic-offset 2)

;;set default mail-id
(setq user-mail-address "karthic891@gmail.com")

;;set user full name
(setq user-full-name "karthic viswanathan")

;;window settings
(split-window-horizontally)
;;move to new window
;; (other-window 1)
(set-frame-size (selected-frame) 80 38)
;;load shell prompt in the other window)
(shell)
;;move back to original window
(other-window 1)

;;Other additions
;;If you want emacs to insert spaces for indentation rather than tab characters, add this line
;;(setq-default indent-tabs-mode nil)
