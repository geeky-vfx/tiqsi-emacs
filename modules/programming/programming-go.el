;;; programming-go.el --- Tiqsi Go programming support  -*- lexical-binding: t -*-

;; Copyright (C) 2018-  Andres Mariscal

;; Author: Andres Mariscal <carlos.mariscal.melgar@gmail.com>

;; URL: https://github.com/serialdev/tiqsi-emacs
;; Keywords: lisp
;; Version: 0
;; Package-Requires: ((cl-lib "0.5") (emacs "24"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:
;; 

(use-package go-mode
  :straight t
  )

(use-package projectile
  :straight t
  )


(defun my-projectile-project-find-function (dir)
  (let ((root (projectile-project-root dir)))
    (and root (cons 'transient root))))

(projectile-mode t)

(with-eval-after-load 'project
  (add-to-list 'project-find-functions 'my-projectile-project-find-function))

(defun find-projectile-project ()
  (let ((probe (locate-dominating-file default-directory ".projectile")))
    (when probe `(projectile . ,probe))))

(add-hook 'project-find-functions 'find-projectile-project 'append)


(defun go-build()
  (interactive)
  (compile
   "go build main.go"))

(defun go-run()
  (interactive)
  (compile
   "go run main.go"))


(defun go-build-win()
  (interactive)
  (compile
   "env GOOS=windows GOARCH=amd64 go build main.go"))

(define-key go-mode-map (kbd "C-c C-c") 'go-build)
(define-key go-mode-map (kbd "C-c C-r") 'go-run)
(define-key go-mode-map (kbd "C-c C-w") 'go-build-win)



(provide 'programming-go)

;;; programming-go.el ends here
