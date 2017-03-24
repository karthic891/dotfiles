;;karthic891's plugins

;;loading third-party plugins

;;js-2 plugin
(setq load-path (append (list (expand-file-name "~/.emacs.d/plugins/js2")) load-path))
(autoload 'js2-mode "js2" "javascript mode given by steve yegge" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;set parantheses matching using mic-paran.el
(add-to-list 'load-path "~/.emacs.d/plugins/mic-paren")
(require 'mic-paren)
(paren-activate) ;;activating

;;set autopair - auto-fill brackets/parantheses
(add-to-list 'load-path "~/.emacs.d/plugins/autopair")
(require 'autopair)
(autopair-global-mode)  ;;enable autopair in all buffers

;; dirtree - Directory tree view for emacs
;; https://github.com/zk/emacs-dirtree
(add-to-list 'load-path "~/.emacs.d/plugins/dirtree")
(require 'tree-mode)
(require 'dirtree)

;;set es-mode - an elastic search mode for editing queries, just like sense plugin but for emacs
(add-to-list 'load-path "~/.emacs.d/elpa/es-mode-20160927.1351")
(autoload 'es-mode "es-mode.el"
  "Major mode for editing Elasticsearch queries" t)
(add-to-list 'auto-mode-alist '("\\.es$" . es-mode))
;; Always pretty print - defaults to nil
(setq es-always-pretty-print t)


;;set autocomplete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete-config) ;;loads default configuration
(add-to-list 'ac-dictionary-directories "~/emacs/auto-complete-1.3.1/dict")

;;load dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
(setq ac-auto-start 1) ;;start auto-completion after 2 characters of a word
(setq ac-ignore-case) ;;for case sensitivity - set nil for reverse case

;;activate pdf-tools
;; (add-to-list 'load-path "~/.emacs.d/elpa/pdf-tools-20160525.920")
;; (require 'pdf-occur)
;; (require 'pdf-tools)
;; (pdf-tools-install)

;; load multi-web-mode for indentaion for script and other tags in html documents
(add-to-list 'load-path "~/.emacs.d/plugins/multi-web-mode")
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)
