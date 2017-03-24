
;; Learn a word a day!
(add-to-list 'load-path "~/.emacs.d/plugins/request.el/")
(require 'request)
(require 'url)
(require 'json)
(defun word-of-the-day ()
  (interactive)
  (request
   "http://api.wordnik.com/v4/words.json/wordOfTheDay"
   :params '(("api_key" . "9b431a720395c7dc988cf02622a0e7a7ce5f2f3c22c8ad291"))
   :parser 'buffer-string
   :success (function*
             (lambda (&key data &allow-other-keys)
                (when data
                (with-current-buffer (get-buffer-create "*scratch*")
                  ;; (erase-buffer)
		  (let ((json-object-type 'alist))
		    (let ((response-json (json-read-from-string data)))
		      (message "asdf %s "response-json)
		      (setq word (cdr (assq 'word response-json)))
		      (message "word %s" word)
		      (setq word-note (cdr (assq 'note response-json)))
		      (message "word-note %s" word-note)
		      (setq word-definition (assq 'definitions response-json))
		      ;; (message "%s" word-definition)
		      ;; (setq mm (json-read-from-string word-definition))
		      ;; (insert "goneee... " word-definition)
		      (setq src (cdr word-definition))
		      (message "---%s" src)
		      (setq lenn (length src))
		      (message "len %s" lenn)
		      (setq i 0)
		      (while (< i lenn)
			(setq tup (elt src i))
			(setq yy (cdr tup))
			(message "--%s" yy)
			(setq i (+ i 1))
			)
		      ;; (setq gn (get-next-element-in-list src))
		      ;; (message "gn %s" gn)
		      
		      ;; (loop for i from 0 to lenn
		      ;;       (message "%s" (elt src i))
		      ;;       )
		      
		      ;; (setq kk (elt word-definition 1))
		      ;; (message  "%s" kk)
		      ;; (setq ll (elt kk 0))
		      ;; (message "%s" ll)
		      ;; (message "length %s" (length src))
		      ;; (message "gogo- %S" response-json)
		      (insert ";; Word of the day!\n")
		      (insert ";; Word: " word "\n")
		      (insert ";; Note: " word-note "\n")
		      ;; (insert ";; Defintions: " word-definition)
		      ))
                  (pop-to-buffer (current-buffer))))))
   :error
   (function* (lambda (&key error-thrown &allow-other-keys&rest _)
                (message "Got error: %S" error-thrown)))
   ))

(defun get-next-element-in-list (list)
  "Get next element in the list"
  (message "list %s" list)
  )

;; (defun word-of-the-day ()
;;   (interactive)
;;   (request
;;    "http://api.wordnik.com/v4/words.json/wordOfTheDay"
;;    :params '(("api_key" . "9b431a720395c7dc988cf02622a0e7a7ce5f2f3c22c8ad291w"))
;;    :parser 'buffer-string
;;    :success (function*
;;              (lambda (&key data &allow-other-keys)
;; 	       (erase-buffer)
;; 	       (when data
;; 		 (with-current-buffer (get-buffer-create "*scratch*")
;; 		   (erase-buffer)
;; 		   (insert "bored")
;; 		   (let ((json-object-type 'alist))
;; 		     (let ((response-json (json-read-from-string data)))
;; 		       (setq word (cdr (assq 'word response-json)))
;; 		       (setq word-note (cdr (assq 'note response-json)))
;; 		       (let ((word-definition (assq 'definitions response-json)))
;; 			 ;; (message "%s" word-definition)
;; 			 ;; (setq mm (json-read-from-string word-definition))
;; 			 (message "goneee... %s" word-definition)
;; 			 )
;; 		       ;; (message "gogo- %S" response-json)
;; 		       (insert ";; Word of the day!\n")
;; 		       (insert ";; Word: " word "\n")
;; 		       (insert ";; Note: " word-note "\n")
;; 		       ;; (insert ";; Defintions: " word-definition)
;; 		       ))
;; 		   (pop-to-buffer (current-buffer))))))
;;    :error
;;    (function* (lambda (&key error-thrown &allow-other-keys&rest _)
;;                 (message "Got error: %S" error-thrown)))
;;    ))
