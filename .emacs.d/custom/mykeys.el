;;karthic891's key bindings

;;highlight selected phrase
(global-set-key (kbd "C-h C-i") 'highlight-with-color)

;;unhighlight highlighted phrase
(global-set-key (kbd "C-h C-o") 'unhighlight-buffer)

;;function for highlighting all occurances of a string in the buffer
(global-set-key (kbd "C-q") 'highlight-all-occurences)

;;function for doc commenting
(global-set-key (kbd "C-/") 'insert-doc-comment)

;;comment out a block of code
(global-set-key (kbd "C-?") 'comment-dwim)

;;set C-z for undo
(global-set-key "\C-z" 'undo)

;;set delete a whole line
(global-set-key (kbd "C-d") 'kill-whole-line)

;;move to beginning of the line
(global-set-key (kbd "C-a") 'move-beginning-of-line)

;;move to end of the line
(global-set-key (kbd "C-;") 'move-end-of-line)

;;set cycle-buffer
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)

(global-set-key (kbd "C-<tab>") 'move-to-next-window)
(global-set-key [C-S-iso-lefttab] 'move-to-prev-window)

;;indent after hitting enter
(global-set-key "\C-m" 'newline-and-indent)

;;Keyboard-macros
(global-set-key [f10] 'start-kbd-macro)
(global-set-key [f11] 'end-kbd-macro)
(global-set-key [f12] 'call-last-kbd-macro)
(global-set-key [f2] 'edit-kbd-macro)

;;Select text between double quotes
;; (global-set-key (kbd "C-x C-a") 'select-between-dquote)

;;Clear buffer, specifically for shell mode
(global-set-key (kbd "C-l") 'my-erase-buffer)

(global-set-key (kbd "C-c C-g") 'google)
