;;; gnus-mock-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "gnus-mock" "gnus-mock.el" (0 0 0 0))
;;; Generated autoloads from gnus-mock.el

(autoload 'gnus-mock-start "gnus-mock" "\
Start a new Emacs process, with the Gnus mock setup.
The new Emacs process will be started as \"-Q\", with the mock
Gnus settings pre-loaded.  Any of the normal Gnus entry points
will start a mock Gnus session.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "gnus-mock" '("gnus-mock-")))

;;;***

;;;### (autoloads nil nil ("gnus-mock-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; gnus-mock-autoloads.el ends here
