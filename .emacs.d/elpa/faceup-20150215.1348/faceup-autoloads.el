;;; faceup-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (faceup-clean-buffer faceup-render-view-buffer
;;;;;;  faceup-write-file faceup-view-buffer) "faceup" "faceup.el"
;;;;;;  (22229 28368 128869 509000))
;;; Generated autoloads from faceup.el

(autoload 'faceup-view-buffer "faceup" "\
Display the faceup representation of the selected buffer.

\(fn)" t nil)

(autoload 'faceup-write-file "faceup" "\
Save the faceup representation of the current buffer to the file FILE-NAME.

Unless a name is given, the file will be named xxx.faceup, where
xxx is the file name associated with the buffer.

\(fn &optional FILE-NAME)" t nil)

(autoload 'faceup-render-view-buffer "faceup" "\
Convert BUFFER containing Faceup markup to a new buffer and display it.

\(fn &optional BUFFER)" t nil)

(autoload 'faceup-clean-buffer "faceup" "\
Remove faceup markup from buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("faceup-pkg.el") (22229 28368 285997 324000))

;;;***

(provide 'faceup-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; faceup-autoloads.el ends here
