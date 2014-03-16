;;; github-browse-settings.el --- Settings for github-browse
;;
;; Author: Charles L.G. Comstock <dgtized@gmail.com>
;; Version: 0.1
;; Package-Requires: ((github-browse-file "20140202.51"))
;;
;;; Commentary:
;;
;; An example package that sets up some default bindings and settins
;; for github-browse-file
;;
;;; Code:

(require 'github-browse-file)

(setq github-browse-file-show-line-at-point t
      github-browse-file-visit-url nil)

(global-set-key (kbd "C-c G") 'github-browse-file)
(global-set-key (kbd "C-c B") 'github-browse-file-blame)

(provide 'github-browse-settings)
;;; github-browse-settings.el ends here
