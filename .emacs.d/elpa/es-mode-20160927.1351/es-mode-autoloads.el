;;; es-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "es-cc" "es-cc.el" (22536 46757 80562 416000))
;;; Generated autoloads from es-cc.el

(autoload 'es-command-center "es-cc" "\
Open the Elasticsearch Command Center

\(fn)" t nil)

;;;***

;;;### (autoloads nil "es-mode" "es-mode.el" (22536 46756 840562
;;;;;;  420000))
;;; Generated autoloads from es-mode.el

(autoload 'es-mode "es-mode" "\
Major mode for editing Elasticsearch queries.
\\{es-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.es\\'" . es-mode))

;;;***

;;;### (autoloads nil nil ("es-mode-pkg.el" "es-parse.el" "ob-elasticsearch.el")
;;;;;;  (22536 46757 207702 907000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; es-mode-autoloads.el ends here
