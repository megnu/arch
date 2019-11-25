
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(setq x-select-enable-clipboard t)
(savehist-mode 1)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-html-doctype "html5"
      org-html-html5-fancy t)
;; set default tab char's display width to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) ; emacs 23.1 to 26 default to 8
(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (Lain)))
 '(custom-safe-themes
   (quote
    ("a7d7ff45e670e805c4d257a8c453d2cecfeeeff5cc4156f786b2562b74036761" "94caf9515c6fb5af8727f2014f8e5bfb74cbed1595527eb44a0ba63982ecf6a0" "e39688a85d6219762f1df8a7195fb2840ce8aa4b21866fae7b204b098a64f7eb" "177749a29235db515838d135b33dae0b36649e98c7b899b77151283bbd75ec18" "7e9c8c9c93b654110c4613affa5b227fd062aafaf3763a6c5b5a0241e78981b9" "f96181468c7cc2e834024f399527f05803e42801713dee9c179e018f60bf588e" "40f4b80101a16338342431b1ebb4fc05b4e13c06acefd74c9c3092ad5b8c8407" "eaeb7e97aa03783de0d169d494e8327fed452384a846102609731549abb8675a" "2362410e0be77919ea85f64d8cc35ff26b54fabf0923fa7ff5b3c9c277331ecc" default)))
 '(package-selected-packages
   (quote
    (pdf-tools ox-pandoc ## magit pandoc-mode dictionary fontawesome helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; (set-face-attribute 'highlight nil :foreground 'unspecified)
(set-face-attribute 'region nil :background "#73d2bc":foreground "#2D191D")
  (require 'server)
  (or (server-running-p)
   (server-start))
  (add-hook 'find-file-hook 'delete-other-windows)

