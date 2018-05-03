;;; modes-company.el --- Tiqsi company mode support

;;; Commentary:
;;

(use-package company
  :straight t
  :ensure t
  :init
  (require 'color) ;; -- needed for the theme
  ;; -- autocomplete as we type
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 3)
  ;; -- disable lowercase on all completions
  (setq company-dabbrev-downcase nil)
  ;; -- allow non completion characters after interaction with match
  (setq company-require-match nil)
  ;; -- custom theme


  :bind (:map company-active-map
  	      ("[up]" . company-select-previous)
  	      ("[down]" . company-select-next)
  	      ("\C-w" . nil)
  	      :map company-mode-map
  	      ("<M-SPC>" . company-complete-common))
  :defer t
  :diminish company-mode)

;; (eval-after-load "company" '(let ((bg (face-attribute 'default :background)))
(eval-after-load "company" '(let ((bg "#161616"))
  (custom-set-faces
   `(company-preview ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-preview-common ((t (:inherit company-preview))))
   `(company-preview-search ((t (:inherit company-preview))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 20)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-template-field ((t (:background "deep sky blue" :foreground "black"))))
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background ,(color-lighten-name bg 40)))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-common-selection ((t (:inherit company-tooltip-common))))
   `(company-tooltip-annotation ((t (:inherit font-lock-keyword-face))))
   `(company-tooltip-annotation-selection ((t (:inherit company-tooltip-annotation :background ,(color-lighten-name bg 40)))))
   `(company-tooltip-mouse ((t (:foreground "black"))))
   ;; `(company-tooltip-search ((t (:background "brightwhite" :foreground "black"))))
   )))

(face-attribute 'default :background)



(use-package company-statistics
  :straight t)

(use-package company-quickhelp
  :straight t
  :if (display-graphic-p)
  :init
  (setq pos-tip-foreground-color "#c5c8c6")
  (setq company-quickhelp-delay nil)
  (setq pos-tip-background-color "#3b3e40"))


(defun enable-company ()
  (interactive)
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends))
  (global-company-mode)
  (company-statistics-mode)
    (company-quickhelp-mode))

(enable-company)
(global-auto-complete-mode 0)
(define-key company-mode-map "!" 'company-quickhelp-manual-begin)




(provide 'modes-company)

;;; modes-company.el ends here
