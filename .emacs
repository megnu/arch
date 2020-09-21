
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(global-set-key (kbd "C-x C-b") 'ibuffer)
;; packages
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  )(setq x-select-enable-clipboard t)
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
;; `with-eval-after-load' macro was introduced in Emacs 24.x
;; In older Emacsen, you can do the same thing with `eval-after-load'
;; and '(progn ..) form.
(with-eval-after-load 'org       
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'visual-line-mode))
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
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_EXAMPLE" . "#\\+END_EXAMPLE"))
(setq org-export-with-smart-quotes t)
(setq org-ascii-links-to-notes nil)
(setq org-ascii-headline-spacing (quote (1 . 1)))
(eval-after-load "org"
  '(require 'ox-gfm nil t))
(setq org-html-coding-system 'utf-8-unix)
;;(setq org-html-table-default-attributes
  ;;    '(:border "0" :cellspacing "0" :cellpadding "3" :rules "none" :frame "none"))
(require 'subr-x)
(defun org-html-fixed-width (fixed-width _contents _info)
  "Transcode a FIXED-WIDTH element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (format "<pre class=\"example\">\n%s</pre>"
          (string-trim
           (org-html-do-format-code
           (org-remove-indentation
            (org-element-property :value fixed-width))))))
(setq org-directory (expand-file-name "~/Templates/org"))
(setq org-html-validation-link nil)
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
(defun eos/org-custom-id-get (&optional pom create prefix)
  "Get the CUSTOM_ID property of the entry at point-or-marker POM.
   If POM is nil, refer to the entry at point. If the entry does
   not have an CUSTOM_ID, the function returns nil. However, when
   CREATE is non nil, create a CUSTOM_ID if none is present
   already. PREFIX will be passed through to `org-id-new'. In any
   case, the CUSTOM_ID of the entry is returned."
  (interactive)
  (org-with-point-at pom
    (let ((id (org-entry-get nil "CUSTOM_ID")))
      (cond
       ((and id (stringp id) (string-match "\\S-" id))
        id)
       (create
        (setq id (org-id-new (concat prefix "h")))
        (org-entry-put pom "CUSTOM_ID" id)
        (org-id-add-location id (buffer-file-name (buffer-base-buffer)))
        id)))))
(defun eos/org-add-ids-to-headlines-in-file ()
  "Add CUSTOM_ID properties to all headlines in the
   current file which do not already have one."
  (interactive)
  (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))
(with-eval-after-load 'ox
  (require 'ox-hugo))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#430C12" "#D27587" "#73D283" "#FCE0E9" "#73AFD2" "#A973D2" "#73D2BC" "#ffffff"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(Lain))
 '(custom-safe-themes
   '("e000dde74b7f71b8439318edf5fc8206748c30c731552113d8101b13d43e4f7b" "6b258e93df72b1fd2f36b8a4eb4e8810b663fdff53a57eaf6d9e0bd0e49aebfe" "0a664a46ed8388546dfc748d85932953e2bd443e82f3541dd5b4476047b50655" "baa97a71305caf88f35302883c03b7d542272cd97d14ad6bdacc3b1d82927435" "815c1818954099069f229d145dce93cfc5879278d3a4465d1f7dc3353ea843b4" "44ac468ee2a03a00235a72aeb1ca90047d5c53f0a3108031229ccf68e00edbdd" "a4aaa1842ffb1792f5c872dd0846d56776c7844dfcd0fec98c9e1d290a24966b" "c8dd94ac2e0b743e9a9a2d293a4274a6ec47ab9f2a3c50a781019fd8355ea564" "36f9672db59b0144b3b60764683b909622b7c101665f2850108a1c010c466c75" "5156003c0f280d219ed281f73d3460975c980f50832b71faf9a905e48c873547" "3ad27e1e0bd25193b3ee0103ee1a8c810ad6ea5ff39d22d94d2e8edfcc446b30" "05488dff8ee5d985ddb52a82013557843b82fdfe9871d278a84d6b4763670484" "83babd90f359b064f75ade2cc3cc85cf08ee309f19850ba682b9a2a9cbcedf89" "6dd246c2afea1b064335e438078b2fda8313af59e2ae89bfa39ed602c6f3e0e3" "dc295d64e178f37c69fcaf96aae8e38d2df6260bc09ef8424fb4e09ad00cd354" "8bdb233c8e4fd955862eb404f338f697cf6a1040114fd706fb67777a8a99be63" "8f37aa7d5ba9e48cfc16507600b52fd6fde365699fa39be9557579168a180d92" "4cd1e9b4be73c4d54d42c9e5fc2513eb1b34e2188b929856fc42d01dde27d564" "edec95d2650b998bbfe068e6fa97f95d74ba0900956136b2376282b30e214a53" "b6204bea514b241a777bf80a378211f1d2e31fa8db91f018247a8075f14e7339" "91d365048d230de1ae29eb63bb95fe2d826e818e7565587e50244a02e880dee0" "41d5de494685bb431207bc65505bd76979368e56197b49afb4dfad5bf2ad7fa7" "bc4d55d3c1ba9d7b1e4f6bb996610966cf6661b0f7ba330433847a9f8d4a0250" "14222d1c3ccc305e9488885de0af782b5b3546468afc7d1105e8b90378eeb4e3" "dfaf398d9e982b993fa2f97775e016113f7d5f20d10e0eedf012522c8b82e7a6" "b593596a021fc901475cbe04d23383c7aec9cc2a0d1555e5c41659afb0a36ef4" "1811a5de7bf800fdc7b778206a14a6044b82df9d71c37747510ae854b3f5f2d8" "760bca450f8e4cb4f2f68b220b4adddd5e66d0d97e9ec76b92a64e69839838d1" "90bb520e4e3d42bfac3b45e2bfbd180dbf467d0fe028d5986fb4f27034c9c745" "f30cfaca81277a3ce2c1820e2d765ad985b21484a3651e03785835e6a2eeaab7" "1a9d45b92c7f84361f514b711a9de55cb2016f327c1012220132849736e9b7e9" "a994d8c0d7b1e792d42c4f2add57c081fa23ee0d1c8744801ff50c698a15f4ad" "5ac66e5c86d75cf16fb5b55ddad68e697c98e3b696b0ed81068b1bc788212ddf" "75cf8e5a868373d7bfa69e34c696218ea93fce65910060b85d576ae498ed2b18" "5e3b2d229f01c5e6f3541973f37221c96fb3ceaed07b3247ebc2cc07fe480666" "46449a707671604758c6849b766e860d26304060deb47bd396a90fb74aee28ee" "a7d7ff45e670e805c4d257a8c453d2cecfeeeff5cc4156f786b2562b74036761" "94caf9515c6fb5af8727f2014f8e5bfb74cbed1595527eb44a0ba63982ecf6a0" "e39688a85d6219762f1df8a7195fb2840ce8aa4b21866fae7b204b098a64f7eb" "177749a29235db515838d135b33dae0b36649e98c7b899b77151283bbd75ec18" "7e9c8c9c93b654110c4613affa5b227fd062aafaf3763a6c5b5a0241e78981b9" "f96181468c7cc2e834024f399527f05803e42801713dee9c179e018f60bf588e" "40f4b80101a16338342431b1ebb4fc05b4e13c06acefd74c9c3092ad5b8c8407" "eaeb7e97aa03783de0d169d494e8327fed452384a846102609731549abb8675a" "2362410e0be77919ea85f64d8cc35ff26b54fabf0923fa7ff5b3c9c277331ecc" default))
 '(font-use-system-font t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(gnus-mock ox-hugo impatient-mode simple-httpd tramp-term pdf-tools ox-pandoc ## magit pandoc-mode dictionary fontawesome helm))
 '(send-mail-function 'smtpmail-send-it))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(menu ((t (:background "black" :foreground "white" :inverse-video t))))
 '(term-color-black ((t (:background "#430C12" :foreground "#430C12"))))
 '(term-color-blue ((t (:background "#73AFD2" :foreground "#73AFD2"))))
 '(term-color-cyan ((t (:background "#73D2BC" :foreground "#73D2BC"))))
 '(term-color-green ((t (:background "#73D283" :foreground "#73D283"))))
 '(term-color-magenta ((t (:background "#A973D2" :foreground "#A973D2"))))
 '(term-color-red ((t (:background "#D27389" :foreground "#D27389"))))
 '(term-color-yellow ((t (:background "#FCE0E9" :foreground "#FCE0E9")))))
;; (set-face-attribute 'highlight nil :foreground 'unspecified)
(set-face-attribute 'region nil :background "#73d2bc":foreground "#2D191D")
  (require 'server)
  (or (server-running-p)
   (server-start))
  (add-hook 'find-file-hook 'delete-other-windows)
  (require 'tramp-term)
  (require 'impatient-mode)
  (require 'htmlize)
  (require 'simple-httpd)
(setq shr-color-visible-luminance-min 70)
