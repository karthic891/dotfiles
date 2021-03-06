;;karthic891's utility methods

;; Open Tomcat catalina.out file in one of the buffers
(defun open-tomcat-logs()
  (interactive)
  (find-file-other-frame "~/serverstuff/apache-tomcat-8.0.23/logs/catalina.out")
  (message "Opening ~/serverstuff/apache-tomcat-8.0.23/logs/catalina.out")
  )

(defun clear-tomcat-logs ()
  "Clear tomcat log i.e., catalina.out"
  (interactive)
  (write-region "" nil "~/serverstuff/apache-tomcat-8.0.23/logs/catalina.out")
  )

;;erase-buffer, specially when you want to clear the shell prompt
(defun my-erase-buffer()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))
  

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

;;unhighlight highlighted phrase
(defun unhighlight-buffer()
  (interactive)
  (message "Un-highlighted text :  %s" highlighted-text)
  (unhighlight-regexp highlighted-text)
  )

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

;;function for doc commenting
(defun insert-doc-comment () (interactive)
  (insert "/**\n * Brief Description. Long Description.\n * @param \n * @return \n * @author \n */"))

;;Select text between double quotes
(defun select-between-dquote()
  "Select text between double quotes"
  (interactive)
  (search-backward "\"")
  (forward-char 1)
  (set-mark-command nil)
  (search-forward "\"")
  (backward-char 1)
  (kill-ring-save (mark) (point)))


;; Google the selected region if any, display a query prompt otherwise.
;; Reference: http://emacsredux.com/blog/2013/03/28/google/
(defun google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
			   (buffer-substring (region-beginning) (region-end))
			 (read-string "Google: "))))))


(defun cygwin-shell ()
  "Run cygwin bash in shell mode."
  (setq explicit-bash-args '("--noediting" "-login" "-i"))
  (interactive)
  (let ((explicit-shell-file-name "C:/cygwin64/bin/bash"))
    (call-interactively 'shell)))

(defun move-to-next-window()
  "Move to the next window"
  (interactive)
  (setq next-win (next-window))
  (select-window next-win)
  (message "Moving to the next window"))

(defun move-to-prev-window()
  "Move to the previous window"
  (interactive)
  (other-window -1))

;; Enabling auto revert tail mode while reading log files
(defun etc-log-tail-handler ()
  (end-of-buffer)
  (make-variable-buffer-local 'auto-revert-interval)
  (setq auto-revert-interval 1)
  (auto-revert-set-timer)
  (make-variable-buffer-local 'auto-revert-verbose)
  (setq auto-revert-verbose nil)
  (read-only-mode t)
  (font-lock-mode 0)
  (when (fboundp 'show-smartparens-mode)
    (show-smartparens-mode 0)))

(add-hook 'auto-revert-tail-mode-hook 'etc-log-tail-handler)

(defun get-files-in-directory()
  (interactive)
  (defvar path (read-file-name "Enter file name: "))
  (message "path is %s" path)
  (speedbar)
  )
