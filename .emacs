;;karthic's emacs file

(split-window-horizontally)
(other-window 1)
(set-frame-size (selected-frame) 80 38)
(eshell)
(other-window 1)

;;highlight selected phrase
(defun highlight-with-color(start end)
  (interactive "r")
  (let (
		(selected-text (buffer-substring start end))
	   )
    (setq highlighted-text selected-text) ;;set a global variable when highlighted
    (message "Highlighted text :  %s" highlighted-text)
    (highlight-phrase selected-text))
  )
(global-set-key (kbd "C-h C-i") 'highlight-with-color)

;;unhighlight highlighted phrase
(defun unhighlight-buffer()
  (interactive)
  (message "Un-highlighted text :  %s" highlighted-text)
  (unhighlight-regexp highlighted-text)
  )
(global-set-key (kbd "C-h C-o") 'unhighlight-buffer)

;;function for highlighting all occurances of a string in the buffer
(defun highlight-all-occurences(start end)
  (interactive "r")
  (let (
		(selected-text (buffer-substring start end))
	   )
	(deactivate-mark)
	(isearch-mode t nil nil nil)
	(isearch-yank-string selected-text))
  )
(global-set-key (kbd "C-q") 'highlight-all-occurences)

;;function for doc commenting
(defun insert-doc-comment () (interactive)
  (insert "/**\n * Brief Description. Long Description.\n * @param \n * @return \n * @author \n */"))
(global-set-key (kbd "C-/") 'insert-doc-comment)

;;comment out a block of code
(global-set-key (kbd "C-?") 'comment-dwim)

;;remove the emacs image during statup
(setq inhibit-startup-message t)

;;set C-z for undo
(global-set-key "\C-z" 'undo)

;;set delete a whole line
(global-set-key (kbd "C-d") 'kill-whole-line)
(setq kill-whole-line t)  ;;make kill-line include the ending newline char

;;set cycle-buffer
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

;;loading third-party plugins

;;js-2 plugin
(setq load-path (append (list (expand-file-name "~/.emacs.d/plugins/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;set parantheses matching using mic-paran.el
(add-to-list 'load-path "~/.emacs.d/plugins/mic-paren")
(require 'mic-paren)
(paren-activate) ;;activating

;;set autopair - auto-fill brackets/parantheses
(add-to-list 'load-path "~/.emacs.d/plugins/autopair")
(require 'autopair)
(autopair-global-mode)  ;;enable autopair in all buffers

;;set autocomplete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete-config) ;;loads default configuration
(add-to-list 'ac-dictionary-directories "~/emacs/auto-complete-1.3.1/dict")
;;load dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
(setq ac-auto-start 1) ;;start auto-completion after 2 characters of a word
(setq ac-ignore-case) ;;for case sensitivity - set nil for reverse case

;;Python IDE setup
;;(setenv "PYMACS_PYTHON" "python2.7")
(add-to-list 'load-path "~/.emacs.d/plugins/pymacs")
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;pyflakes setting
(setq python-check-command "pyflakes")

;;default tab-width
(setq tab-width 4)

;;set javascript code indent level - default is 2
(setq js-indent-level 4)

;;indent after hitting enter
(global-set-key "\C-m" 'newline-and-indent)

;;html tab-width - default is 2
(setq sgml-basic-offset 2)

;;set default mail-id
(setq user-mail-address "karthic891@gmail.com")

;;load shell prompt
;;(eshell)

;;Inbuilt settings. Don't change
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (whiteboard))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray18" :foreground "gray100" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
(put 'upcase-region 'disabled nil)
