defun load-lain-theme (frame)
  (select-frame frame)
  (load-theme 'lain t))

(if (daemonp)
	(add-hook 'after-make-frame-functions #'load-lain-theme)
  (load-theme 'lain t))
