;;; recover-c-x-1.el --- recover the env before C-x 1.  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  rcmerci

;; Author: rcmerci <rcmerci@rcmercis-rmbp.local>
;; Keywords: convenience
;; Package-Requires: ((emacs "24.4"))
;; Version: 20160312.1

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

;;; Code:

(defvar recover-c-x-1//last-window-config nil
  "storing the window configuration before last time call [C-x 1].")

(defun recover-c-x-1//recover-config ()
  (set-window-configuration recover-c-x-1//last-window-config))

(defun recover-c-x-1//store-config ()
  (setq recover-c-x-1//last-window-config (current-window-configuration)))

(defun recover-c-x-1/delete-other-windows (&optional window)
  "see also `delete-other-windows', and save the window config before call this function."
  (interactive)
  (recover-c-x-1//store-config)
  (delete-other-windows))

(defun recover-c-x-1/recover ()
  "recover the window config before the last time call `recover-c-x-1/delete-other-windows'(C-x 1)."
  (interactive)
  (recover-c-x-1//recover-config))

(defvar recover-c-x-1-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-x 1") 'recover-c-x-1/delete-other-windows)
    (define-key map (kbd "C-x 9") 'recover-c-x-1/recover)
    map)
  "recover-c-x-1-minor-mode-map")

;;;###autoload
(define-minor-mode recover-c-x-1-minor-mode
  "recover the windows after C-x 1."
  nil
  " R-cx1"
  :global t
  :keymap recover-c-x-1-minor-mode-map
  )


(provide 'recover-c-x-1)
;;; recover-c-x-1.el ends here
